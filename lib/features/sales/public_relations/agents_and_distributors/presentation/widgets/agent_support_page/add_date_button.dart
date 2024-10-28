import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/enums/installation_type_enum.dart';
import '../../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../../core/common/helpers/handle_add_date_states.dart';
import '../../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../../core/utils/app_constants.dart';
import '../../../../../../../model/invoiceModel.dart';
import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../../domain/use_cases/get_agent_dates_list_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import 'custom_date_time_picker.dart';

class AddDateButton extends StatefulWidget {
  const AddDateButton({Key? key, required this.agentId}) : super(key: key);

  final String agentId;

  @override
  State<AddDateButton> createState() => _AddDateButtonState();
}

class _AddDateButtonState extends State<AddDateButton> {
  late final AgentsDistributorsProfileBloc agentBloc;
  String? selectedInstallationType;

  List<String> _items =
      InstallationTypeEnum.values.map((e) => e.value).toList();

  @override
  void initState() {
    agentBloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    agentBloc.supportEndTimeController
        .addListener(_supportEndTimeControllerListener);
    agentBloc.supportStartTimeController
        .addListener(_supportStartTimeControllerListener);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AgentsDistributorsProfileBloc,
        AgentsDistributorsProfileState>(
      listenWhen: (previous, current) =>
          previous.addDateVisitStatus != current.addDateVisitStatus,
      listener: (context, state) => handleAddDateStates(
          context: context,
          state: state.addDateVisitStatus,
          onPressed: () {
            AppNavigator.pop();
            _addDateInstall(
              context: context,
              bloc: agentBloc,
              dateClientVisit: agentBloc
                  .handleVisitTime(agentBloc.supportStartTimeController.text),
              date_end: agentBloc
                  .handleVisitTime(agentBloc.supportEndTimeController.text),
              fkAgent: widget.agentId,
              typeDate:
                  selectedInstallationType == InstallationTypeEnum.field.value
                      ? InstallationTypeEnum.field
                      : InstallationTypeEnum.online,
              force: 1,
            );
          },
          onSuccess: () {
            AppNavigator.pop();
            _completeAddDate(context);
          }),
      child: AppElevatedButton(
        text: 'إضافة موعد جديد',
        onPressed: () async {
          showDialog<void>(
            context: context,
            builder: (context) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: Form(
                  key: agentBloc.supportFormKey,
                  child: BlocProvider.value(
                    value: agentBloc,
                    child: SimpleDialog(
                      titlePadding: const EdgeInsets.symmetric(vertical: 10),
                      insetPadding: EdgeInsets.all(10),
                      contentPadding: EdgeInsets.all(10),
                      title: Center(
                        child: AppText('إضافة موعد جديد'),
                      ),
                      children: [
                        CustomDateTimePicker(
                          dateTimeController: agentBloc.supportDateController,
                          dateTimeType: DateTimeEnum.date,
                          isStartFromNow: true,
                          style2: true,
                        ),
                        10.height,
                        Row(
                          children: [
                            Flexible(
                              child: CustomDateTimePicker(
                                dateTimeController:
                                    agentBloc.supportStartTimeController,
                                previousDateTimeController: agentBloc
                                    .previousSupportStartTimeController,
                                dateTimeType: DateTimeEnum.time,
                                isStartFromNow: true,
                                hintText: 'وقت البداية',
                                style2: true,
                              ),
                            ),
                            10.width,
                            BlocBuilder<AgentsDistributorsProfileBloc,
                                AgentsDistributorsProfileState>(
                              builder: (context, state) {
                                return Flexible(
                                  child: CustomDateTimePicker(
                                    enabled: state.startDateSelected == true,
                                    dateTimeController:
                                        agentBloc.supportEndTimeController,
                                    dateTimeType: DateTimeEnum.time,
                                    isStartFromNow: true,
                                    hintText: 'وقت النهاية',
                                    style2: true,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        10.height,
                        StatefulBuilder(
                          builder: (context, changeSelectedValue) {
                            return CustomDropDown<String>(
                              hint: 'نوع التركيب',
                              items: _items,
                              itemAsString: (item) => item!,
                              selectedItem: selectedInstallationType,
                              onChanged: (value) {
                                changeSelectedValue(() {
                                  selectedInstallationType = value;
                                });
                              },
                            );
                          },
                        ),
                        10.height,
                        Center(
                          child: BlocBuilder<AgentsDistributorsProfileBloc,
                              AgentsDistributorsProfileState>(
                            builder: (context, state) {
                              return AppElevatedButton(
                                text: 'حفظ',
                                isLoading: state.addDateVisitStatus.isLoading(),
                                onPressed: () {
                                  if (selectedInstallationType == null) {
                                    AppSnackbar.showSnakeBar(
                                      'من فضلك اختر نوع التركيب',
                                      color: ToastColorsEnum.warning,
                                    );
                                    return;
                                  }
                                  if (!agentBloc.supportFormKey.currentState!
                                      .validate()) return;
                                  _addDateInstall(
                                    context: context,
                                    bloc: agentBloc,
                                    dateClientVisit: agentBloc.handleVisitTime(
                                        agentBloc
                                            .supportStartTimeController.text),
                                    date_end: agentBloc.handleVisitTime(
                                        agentBloc
                                            .supportEndTimeController.text),
                                    fkAgent: widget.agentId,
                                    typeDate: selectedInstallationType ==
                                            InstallationTypeEnum.field.value
                                        ? InstallationTypeEnum.field
                                        : InstallationTypeEnum.online,
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _completeAddDate(BuildContext context) {
    agentBloc.add(GetAgentDatesListEvent(
        getAgentDatesListParams:
            GetAgentDatesListParams(agentId: widget.agentId)));
    _clearFields(bloc: agentBloc);
    AppSnackbar.showSnakeBar(
      'تمت الاضافة بنجاح',
      color: ToastColorsEnum.success,
    );
  }

  void _addDateInstall({
    required BuildContext context,
    required AgentsDistributorsProfileBloc bloc,
    required DateTime dateClientVisit,
    required DateTime date_end,
    required String fkAgent,
    required InstallationTypeEnum typeDate,
    int? force,
    VoidCallback? onSuccess,
  }) {
    final String currentUserId = AppConstants.currentUser.idUser!;
    final DateInstallationClient dateModel = DateInstallationClient(
      fkUser: currentUserId,
      dateClientVisit: dateClientVisit,
      isDone: '0',
      fkAgent: fkAgent,
      typeDate: typeDate,
      dateEnd: date_end,
      force: force,
    );

    bloc.add(AddAgentDateEvent(
      addAgentDateParams: dateModel,
      onSuccess: onSuccess,
    ));
  }

  void _clearFields({
    required AgentsDistributorsProfileBloc bloc,
  }) {
    selectedInstallationType = null;
    bloc.clear();
  }

  void _supportEndTimeControllerListener() {
    if (agentBloc.supportEndTimeController.text.isEmpty) {
      return;
    }
    try {
      final DateTime selectedTime = DateFormat.jm().parseStrict(
        agentBloc.supportEndTimeController.text,
      );

      final DateTime startTime = DateFormat.jm().parseStrict(
        agentBloc.supportStartTimeController.text,
      );

      if (selectedTime.isBefore(startTime) || selectedTime.isAtSameMomentAs(startTime)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('وقت النهاية يجب ان يكون بعد وقت البداية'),
          ),
        );
        agentBloc.supportEndTimeController.clear();
      }
    } catch (error) {
      debugPrint('Error parsing time: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء معالجة الوقت'),
        ),
      );
      agentBloc.supportEndTimeController.clear();
    }
  }

  void _supportStartTimeControllerListener() {
    try {
      if (agentBloc.supportStartTimeController.text.isEmpty) {
        return;
      }

      agentBloc.add(EnableEndDateEvent());

      if (agentBloc.supportEndTimeController.text.isEmpty) {
        return;
      }

      final DateTime selectedTime = DateFormat.jm().parseStrict(
        agentBloc.supportStartTimeController.text,
      );

      final DateTime endTime = DateFormat.jm().parseStrict(
        agentBloc.supportEndTimeController.text,
      );

      if (selectedTime.isAfter(endTime) || selectedTime.isAtSameMomentAs(endTime)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('وقت البداية يجب ان يكون قبل وقت النهاية'),
          ),
        );
        agentBloc.supportStartTimeController.text =
            agentBloc.previousSupportStartTimeController.text;
      }
    } catch (error) {
      debugPrint('Error parsing time: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء معالجة الوقت'),
        ),
      );
      agentBloc.supportStartTimeController.clear();
    }
  }
}
