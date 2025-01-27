import 'package:crm_smart/core/common/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/services/di/di_container.dart';
import '../../../../../core/services/maps/location_services.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/change_date_to_done_usecase.dart';
import '../manager/dates_table_cubit.dart';
import 'add_event_dialog.dart';

class DoneClientEventDialog extends StatefulWidget {
  const DoneClientEventDialog({
    super.key,
    required this.event,
    this.isReschedule = false,
  });

  final EventModel event;
  final bool isReschedule;

  @override
  State<DoneClientEventDialog> createState() => _DoneClientEventDialogState();
}

class _DoneClientEventDialogState extends State<DoneClientEventDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController takenTimeController = TextEditingController();
  late InstallationTypeEnum _installationType;
  late final DatesTableCubit datesTableCubit;
  String? location;
  late final LocationServices locationService;

  @override
  void initState() {
    locationService = getIt<LocationServices>();
    getLocation();
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    _installationType = InstallationTypeEnum.fromString(widget.event.typeDate);
    super.initState();
  }

  Future<void> getLocation() async {
    final LocationData locationData = await locationService.getLocation();
    final LatLng myLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
    location = '${myLocation.latitude},${myLocation.longitude}';
  }

  @override
  Widget build(BuildContext context) {
    return AppDialog(
      title: "إغلاق الجدولة",
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 8.0,
          ),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomDropDown(
                    hint: "نوع التركيب",
                    items: InstallationTypeEnum.values,
                    itemAsString: (item) => item!.value,
                    selectedItem: _installationType,
                    onChanged: (value) => _installationType = value!,
                    height: 70.h,
                  ),
                  10.height,
                  TextFormField(
                    controller: takenTimeController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      hintText: "الدقائق المستغرقة لاغلاق الجدولة",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  10.height,
                  TextFormField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: "أكتب تعليقك هنا *",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    maxLines: 3,
                    validator: (value) {
                      return InputValidator.requiredFiled(value);
                    },
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<DatesTableCubit, DatesTableState>(
                    builder: (context, state) {
                      return AppElevatedButton(
                        isLoading: state.changeDateToDoneStatus.isLoading(),
                        text: "حفظ",
                        onPressed: () async {
                          final editedEvent = widget.event.copyWith(
                            isDone: "1",
                            typedate: _installationType.value,
                            comment: _commentController.text,
                          );
                          if (_formKey.currentState!.validate()) {
                            if (widget.isReschedule) {
                              AppNavigator.pop(result: true);
                              AppConstants.showAppDialog(
                                  child: AddEventDialog(
                                eventModel: editedEvent,
                                subscribedClients: datesTableCubit.subscribedClients,
                                selectedDay: datesTableCubit.pageVariables.selectedDay,
                              )).then(
                                (value) {
                                  if (value != null) {
                                    datesTableCubit.changeDateToDone(
                                      ChangeDateToDoneParams(
                                        timeTaken: takenTimeController.text,
                                        nextDate: datesTableCubit.pageVariables.selectedDay,
                                        event: editedEvent,
                                        location: (widget.event.typeDate == InstallationTypeEnum.online) ? location! : null,
                                      ),
                                      onSuccess: (value) {
                                        datesTableCubit.handleEventsMap(
                                          updatedEvent: editedEvent,
                                          oldEvent: widget.event,
                                        );
                                        AppSnackbar.showSnakeBar(
                                          "تمت العملية بنجاح",
                                          color: ToastColorsEnum.success,
                                        );
                                      },
                                    );
                                  }
                                },
                              );
                              return;
                            }
                            await datesTableCubit.changeDateToDone(
                              ChangeDateToDoneParams(
                                event: editedEvent,
                                location: (widget.event.typeDate == InstallationTypeEnum.online) ? location! : null,
                              ),
                              onSuccess: (value) {
                                datesTableCubit.handleEventsMap(
                                  updatedEvent: editedEvent,
                                  oldEvent: widget.event,
                                );
                                AppNavigator.pop(result: true);
                                AppSnackbar.showSnakeBar(
                                  "تمت العملية بنجاح",
                                  color: ToastColorsEnum.success,
                                );
                              },
                            );
                          }
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
