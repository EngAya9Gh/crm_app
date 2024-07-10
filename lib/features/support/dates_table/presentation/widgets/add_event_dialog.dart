import 'dart:ui' as myui;

import 'package:crm_smart/core/common/helpers/helper_functions.dart';
import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/helpers/handle_add_date_states.dart';
import '../../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../../core/utils/app_navigator.dart';
import '../../../../../../model/calendar/event_model.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../../../../../ui/widgets/custom_widget/row_edit.dart';
import '../../../../../../view_model/event_provider.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart';
import '../../../../common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import '../../../../sales/public_relations/agents_and_distributors/presentation/widgets/agent_support_page/custom_date_time_picker.dart';
import '../manager/dates_table_cubit.dart';

class AddEventDialog extends StatefulWidget {
  const AddEventDialog({
    super.key,
    this.invoiceId,
    required this.idClient,
    this.invoiceModel,
    this.subscribedClients,
    this.selectedDay,
  });

  final String? invoiceId;
  final String idClient;
  final InvoiceModel? invoiceModel;
  final List<UserEntity>? subscribedClients;
  final DateTime? selectedDay;

  @override
  State<AddEventDialog> createState() => _AddEventDialogState();
}

class _AddEventDialogState extends State<AddEventDialog> {
  late final SupportTabCubit _supportTabCubit;
  late final DatesTableCubit _datesTableCubit;
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _selectedDateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  InstallationTypeEnum _selectInstallationType = InstallationTypeEnum.field;
  UserEntity? _selectedClient;

  @override
  void initState() {
    _supportTabCubit = context.read<SupportTabCubit>();
    _datesTableCubit = context.read<DatesTableCubit>();
    _clear();
    _prepareSelectedDate();
    super.initState();
  }

  void _prepareSelectedDate() {
    if (widget.selectedDay != null) {
      _selectedDateController.text =
          HelperFunctions.formatDate(widget.selectedDay!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SupportTabCubit, SupportTabState>(
      listener: (context, state) {
        handleAddDateStates(
          context: context,
          state: state.addDateInstallStatus,
          onPressed: () async {
            AppNavigator.pop();
            await _addDateInstall(force: 1);
          },
          onSuccess: () {
            AppNavigator.pop(result: true);
          },
        );
      },
      child: SimpleDialog(
          titlePadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          insetPadding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          contentPadding: EdgeInsets.all(15),
          title: Center(
              child: Text(
            'إضافة موعد جديد',
            style: context.textTheme.titleLarge,
          )),
          children: [
            StatefulBuilder(
              builder: (context, refresh) {
                return Directionality(
                  textDirection: myui.TextDirection.rtl,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: MediaQuery.of(context).size.width * 0.7,
                    ),
                    child: Form(
                      key: _globalKey,
                      child: Column(
                        children: [
                          CustomDateTimePicker(
                            hintText: 'تعيين التاريخ',
                            dateTimeType: DateTimeEnum.date,
                            dateTimeController: _selectedDateController,
                            style2: true,
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                child: CustomDateTimePicker(
                                  hintText: 'بداية الزيارة',
                                  dateTimeType: DateTimeEnum.time,
                                  dateTimeController: _startTimeController,
                                  style2: true,
                                ),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: CustomDateTimePicker(
                                  hintText: 'نهاية الزيارة',
                                  dateTimeType: DateTimeEnum.time,
                                  dateTimeController: _endTimeController,
                                  style2: true,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          RowEdit(name: "نوع التركيب", des: '*'),
                          SizedBox(height: 10),
                          CustomDropDown<InstallationTypeEnum>(
                            hint: "نوع التركيب",
                            items: InstallationTypeEnum.values,
                            itemAsString: (item) => item!.value,
                            selectedItem: _selectInstallationType,
                            onChanged: (value) {
                              _selectInstallationType = value!;
                              setState(() {});
                            },
                            height: 70.h,
                          ),
                          SizedBox(height: 10),
                          if (widget.subscribedClients != null) ...[
                            RowEdit(name: "العميل", des: '*'),
                            SizedBox(height: 10),
                            CustomSearchableDropDown<UserEntity>(
                              hint: 'العميل',
                              items: widget.subscribedClients!,
                              itemAsString: (item) => item!.name,
                              selectedItem: _selectedClient,
                              onChanged: (value) {
                                _selectedClient = value;
                                setState(() {});
                              },
                              filterFn: (item, filter) {
                                return item.name
                                    .toLowerCase()
                                    .contains(filter.toLowerCase());
                              },
                            ),
                          ],
                          SizedBox(height: 10),
                          RowEdit(name: "اسناد الي", des: '*'),
                          SizedBox(height: 10),
                          TechSupportUsersDropDown(
                            clear: true,
                            onSelectUser: (user) {
                              _supportTabCubit.changedIdUser = user.idUser;
                            },
                          ),
                          SizedBox(height: 15),
                          // save button
                          BlocBuilder<SupportTabCubit, SupportTabState>(
                            builder: (context, state) {
                              return AppElevatedButton(
                                isLoading:
                                    state.addDateInstallStatus.isLoading(),
                                text: "حفظ",
                                onPressed: () async {
                                  if (_globalKey.currentState!.validate()) {
                                    await _addDateInstall();
                                  }
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ]),
    );
  }

  Future<void> _addDateInstall({int? force}) async {
    await _supportTabCubit.addDateInstall(
      AddDateInstallParams(
        idInvoice: widget.invoiceId ?? widget.invoiceModel?.idInvoice,
        fkUser: _supportTabCubit.changedIdUser,
        dateClientVisit: _prepareDateFromTime(_startTimeController.text),
        dateEnd: _prepareDateFromTime(_endTimeController.text),
        typeDate: _selectInstallationType.value,
        fkClient: _selectedClient?.id,
        force: force,
      ),
      onSuccess: (newEvent) => _completeAddDate(newEvent),
    );
  }

  DateTime _prepareDateFromTime(String time) {
    final DateTime selectedDate = DateTime.parse(_selectedDateController.text);
    // split by : or space to be able to access the hours and minutes
    final List<String> timeList = time.split(RegExp(r'[:\s]'));
    return DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      int.parse(timeList[0]),
      int.parse(timeList[1]),
    );
  }

  void _completeAddDate(EventModel newEvent) {
    _datesTableCubit.handleEventsMap(updatedEvent: newEvent);

    if (context.mounted) {
      Provider.of<EventProvider>(context, listen: false).addEvent(newEvent);
    }

    setState(() {});
  }

  void _clear() {
    _selectedDateController.clear();
    _startTimeController.clear();
    _endTimeController.clear();
    _selectInstallationType = InstallationTypeEnum.field;
    _selectedClient = null;
  }
}
