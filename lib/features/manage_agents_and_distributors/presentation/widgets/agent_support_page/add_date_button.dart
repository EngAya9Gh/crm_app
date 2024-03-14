import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' show DateFormat;

import '../../../../../constants.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/invoiceModel.dart';
import '../../../../../ui/widgets/custom_widget/row_edit.dart';
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

  List<String> _items = InstallationTypeEnum.values.map((e) => e.name).toList();

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
    return ElevatedButton(
      child: Text('إضافة موعد جديد'),
      onPressed: () async {
        await showDialog<void>(
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
                        child: Text('إضافة موعد جديد',
                            style: TextStyle(
                              fontFamily: kfontfamily2,
                            ))),
                    children: [
                      CustomDateTimePicker(
                        dateTimeController: agentBloc.supportDateController,
                        dateTimeType: DateTimeEnum.date,
                        isStartFromNow: true,
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Flexible(
                            child: CustomDateTimePicker(
                              dateTimeController:
                                  agentBloc.supportStartTimeController,
                              previousDateTimeController:
                                  agentBloc.previousSupportStartTimeController,
                              dateTimeType: DateTimeEnum.time,
                              isStartFromNow: true,
                              hintText: 'وقت البداية',
                            ),
                          ),
                          SizedBox(width: 10),
                          BlocBuilder<AgentsDistributorsProfileBloc,
                              AgentsDistributorsProfileState>(
                            builder: (context, state) {
                              print(
                                  "state.startDateSelected ${state.startDateSelected}");
                              return Flexible(
                                child: CustomDateTimePicker(
                                  enabled: state.startDateSelected == true,
                                  dateTimeController:
                                      agentBloc.supportEndTimeController,
                                  dateTimeType: DateTimeEnum.time,
                                  isStartFromNow: true,
                                  hintText: 'وقت النهاية',
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      RowEdit(name: "نوع التركيب", des: '*'),
                      SizedBox(height: 5),
                      StatefulBuilder(
                        builder: (context, changeSelectedValue) {
                          return DropdownButton<String>(
                            isExpanded: true,
                            hint: Text('نوع التركيب'),
                            items: _items.map((level_one) {
                              return DropdownMenuItem(
                                child: Text(level_one),
                                value: level_one,
                              );
                            }).toList(),
                            value: selectedInstallationType == null
                                ? null
                                : selectedInstallationType,
                            onChanged: (value) {
                              changeSelectedValue(() {
                                selectedInstallationType = value!;
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(height: 30),
                      Center(
                        child: BlocBuilder<AgentsDistributorsProfileBloc,
                            AgentsDistributorsProfileState>(
                          builder: (context, state) {
                            final bool isLoading =
                                state.addDateVisitStatus == StateStatus.loading;
                            return isLoading
                                ? Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: CustomLoadingIndicator(),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      if (selectedInstallationType == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(
                                                'من فضلك اختر نوع التركيب '),
                                          ),
                                        );
                                        return;
                                      }
                                      if (agentBloc.supportFormKey.currentState!
                                          .validate()) {
                                        final dateClientVisit = agentBloc
                                            .supportDateController.text;
                                        _onTap(
                                          context: context,
                                          bloc: agentBloc,
                                          dateClientVisit: agentBloc
                                              .handleVisitTime(agentBloc
                                                  .supportStartTimeController
                                                  .text),
                                          date_end: agentBloc.handleVisitTime(
                                              agentBloc.supportEndTimeController
                                                  .text),
                                          fkAgent: widget.agentId,
                                          typeDate: selectedInstallationType ==
                                                  'ميداني'
                                              ? InstallationTypeEnum.field
                                              : InstallationTypeEnum.online,
                                          onSuccess: () {
                                            Navigator.pop(context);
                                            AppConstants.showSnakeBar(
                                                context, 'تمت الاضافة بنجاح');
                                            agentBloc.add(
                                                GetAgentDatesListEvent(
                                                    getAgentDatesListParams:
                                                        GetAgentDatesListParams(
                                                            agentId: widget
                                                                .agentId)));
                                            _clearFields(bloc: agentBloc);
                                          },
                                        );
                                      }
                                    },
                                    child: Text('حفظ'),
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
    );
  }

  _onTap({
    required BuildContext context,
    required AgentsDistributorsProfileBloc bloc,
    required DateTime dateClientVisit,
    required DateTime date_end,
    required String fkAgent,
    required InstallationTypeEnum typeDate,
    VoidCallback? onSuccess,
  }) {
    final String currentUserId = AppConstants.currentUserId(context)!;
    final DateInstallationClient dateModel = DateInstallationClient(
      dateClientVisit: dateClientVisit,
      fkUser: currentUserId,
      isDone: '0',
      fkAgent: fkAgent,
      typeDate: typeDate,
      dateEnd: date_end,
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
    bloc.supportDateController.clear();
    bloc.supportStartTimeController.clear();
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

      if (selectedTime.isBefore(startTime)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('وقت النهاية يجب ان يكون بعد وقت البداية'),
          ),
        );
        agentBloc.supportEndTimeController.clear();
      }
    } catch (error) {
      print('Error parsing time: $error');
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

      if (selectedTime.isAfter(endTime)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('وقت البداية يجب ان يكون قبل وقت النهاية'),
          ),
        );
        agentBloc.supportStartTimeController.text =
            agentBloc.previousSupportStartTimeController.text;
      }
    } catch (error) {
      print('Error parsing time: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('حدث خطأ أثناء معالجة الوقت'),
        ),
      );
      agentBloc.supportStartTimeController.clear();
    }
  }
}
