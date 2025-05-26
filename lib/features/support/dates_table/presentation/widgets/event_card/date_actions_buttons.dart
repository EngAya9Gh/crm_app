import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_elevated_button.dart';
import 'package:crm_smart/core/config/navigator/app_navigator.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/models/event_model.dart';
import '../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../core/services/di/di_container.dart';
import '../../../../../../core/services/maps/location_services.dart';
import '../../../../../../view_model/event_provider.dart';
import '../../../domain/use_cases/change_date_to_done_usecase.dart';
import '../../../domain/use_cases/cofirm_visit_date_usecase.dart';
import '../../manager/dates_table_cubit.dart';
import '../add_event_dialog.dart';
import '../cancel_event_dialog.dart';
import '../done_client_event_dialog.dart';
import '../reschedule_dialog.dart';

class DateActionsButtons extends StatefulWidget {
  const DateActionsButtons({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  State<DateActionsButtons> createState() => _DateActionsButtonsState();
}

class _DateActionsButtonsState extends State<DateActionsButtons> {
  late final EventProvider eventProvider;
  late final DatesTableCubit datesTableCubit;
  String? location;
  late final LocationServices locationService;

  Future<void> getLocation() async {
    final LocationData locationData = await locationService.getLocation();
    final LatLng myLocation = LatLng(
      locationData.latitude!,
      locationData.longitude!,
    );
    location = '${myLocation.latitude},${myLocation.longitude}';
  }

  @override
  void initState() {
    locationService = getIt<LocationServices>();
    getLocation();
    eventProvider = context.read<EventProvider>();
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.eventModel.verifiedAt == null &&
            widget.eventModel.isDone != IsDoneDateEnum.started.value)
          BlocBuilder<DatesTableCubit, DatesTableState>(
            builder: (context, state) {
              if (state.confirmVisitDateStatus.isLoading()) {
                return SizedBox(
                  height: 20,
                  width: 20,
                  child: AppLoader(),
                );
              }
              return _CustomTextButton(
                text: "تأكيد الموعد",
                onTap: () async {
                  await datesTableCubit.confirmVisitDate(
                    ConfirmVisitDateParams(
                        idVisit: widget.eventModel.idClientsDate!),
                  );
                },
              );
            },
          ),
        if (widget.eventModel.isDone != IsDoneDateEnum.started.value)
          BlocBuilder<DatesTableCubit, DatesTableState>(
            builder: (context, state) {
              print(widget.eventModel.isDone);
              print(widget.eventModel.isDone != '4');
              if (state.startDateVisitStatus.isLoading() &&
                  state.editItemId == widget.eventModel.idClientsDate) {
                return SizedBox(
                  height: 20,
                  width: 20,
                  child: AppLoader(),
                );
              }
              return _CustomTextButton(
                text: "بدء الزيارة",
                onTap: () async {
                  if(location ==null){
                    AppSnackbar.showSnakeBar(
                      "جاري الحصول على الموقع",
                      color: ToastColorsEnum.success,
                    );
                    await getLocation();
                  } else {
                    await datesTableCubit.startDateVisit(
                        ConfirmVisitDateParams(
                            idVisit: widget.eventModel.idClientsDate!,
                            location: location),
                        widget.eventModel.idClientsDate!);
                    
                    location=null;
              
                  }
                  },
              );
            },
          ),
        if (widget.eventModel.isDone == IsDoneDateEnum.started.value)
          Consumer<EventProvider>(
            builder: (context, eventProvider, _) {
              if (eventProvider.isloadingDoneEvent) {
                return SizedBox(
                  height: 20,
                  width: 20,
                  child: AppLoader(),
                );
              }
              return _CustomTextButton(
                text: "إغلاق الزيارة",
                onTap: () async {
                  if ((widget.eventModel.fkAgent != null)) {
                    _showDialog(
                        body: DoneClientEventDialog(event: widget.eventModel));
                    return;
                  }
                  _showDialog(
                      body: AlertDialog(
                    title: Center(
                      child: AppText('اختر نوع الجدولة'),
                    ),
                    actions: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          AppElevatedButton(
                            text: 'اغلاق مع جدولة',
                            onPressed: () {
                              context.pop(true);
                            },
                          ),
                          10.height,
                          AppElevatedButton(
                            text: 'اغلاق بدون جدولة',
                            onPressed: () {
                              context.pop(false);
                            },
                          ),
                        ],
                      ),
                    ],
                  )).then(
                    (value) {
                      if (value) {
                        _showDialog(
                            body: DoneClientEventDialog(
                          event: widget.eventModel,
                          isReschedule: true,
                        ));
                      } else {
                        _showDialog(
                            body: DoneClientEventDialog(
                                event: widget.eventModel));
                      }
                    },
                  );
                },
              );
            },
          ),
        const SizedBox(height: 10),
        if (widget.eventModel.isDone != IsDoneDateEnum.started.value)
          _CustomTextButton(
            text: "إعادة جدولة",
            onTap: () async {
              final EventModel? editedEvent = await _showDialog(
                body: ReScheduleDialog(event: widget.eventModel),
              );
              Future.delayed(const Duration(milliseconds: 0), () {
                datesTableCubit.handleEventsMap(
                  updatedEvent: editedEvent,
                  oldEvent: widget.eventModel,
                );
              });
            },
          ),
        const SizedBox(height: 10),
        if (widget.eventModel.isDone != IsDoneDateEnum.started.value)
          _CustomTextButton(
            text: 'إلغاء',
            onTap: () async {
              final EventModel? editedEvent = await _showDialog(
                body: CancelEventDialog(
                  event: widget.eventModel,
                ),
              );

              if (editedEvent != null) {
                datesTableCubit.handleEventsMap(
                  updatedEvent: editedEvent,
                  oldEvent: widget.eventModel,
                );
              }
            },
          ),
      ],
    );
  }

  Future<dynamic> _showDialog({
    required Widget body,
  }) async {
    return await AppConstants.showAppDialog(child: body);
  }
}

class _CustomTextButton extends StatelessWidget {
  const _CustomTextButton({
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      text: text,
      onPressed: onTap,
      fontSize: 1,
    );
  }
}
