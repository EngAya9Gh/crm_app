import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/enums/enums.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../ui/widgets/custom_widget/row_edit.dart';
import '../../../data/models/agent_date_model.dart';
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
  String? selectedInstallationType;

  List<String> _items = InstallationTypeEnum.values.map((e) => e.name).toList();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    return ElevatedButton(
      child: Text('إضافة موعد جديد'),
      onPressed: () async {
        await showDialog<void>(
          context: context,
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: bloc.supportFormKey,
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
                    Row(
                      children: [
                        CustomDateTimePicker(
                          dateTimeController: bloc.supportDateController,
                          dateTimeType: DateTimeEnum.date,
                        ),
                        SizedBox(width: 10),
                        CustomDateTimePicker(
                          dateTimeController: bloc.supportTimeController,
                          dateTimeType: DateTimeEnum.time,
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
                      child: ElevatedButton(
                        onPressed: () {
                          if (selectedInstallationType == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('من فضلك اختر نوع التركيب '),
                              ),
                            );
                            return;
                          }
                          if (bloc.supportFormKey.currentState!.validate()) {
                            final dateClientVisit =
                                bloc.supportDateController.text;
                            _onTap(
                              context: context,
                              bloc: bloc,
                              dateClientVisit: bloc.handleVisitTime(),
                              fkAgent: widget.agentId,
                              typeDate: selectedInstallationType == 'ميداني'
                                  ? InstallationTypeEnum.field
                                  : InstallationTypeEnum.online,
                              onSuccess: () {
                                Navigator.pop(context);
                                AppConstants.showSnakeBar(
                                    context, 'تمت الاضافة بنجاح');
                                bloc.add(GetAgentDatesListEvent(
                                    getAgentDatesListParams:
                                        GetAgentDatesListParams(
                                            agentId: widget.agentId)));
                                _clearFields(bloc: bloc);
                              },
                            );
                          }
                        },
                        child: Text('حفظ'),
                      ),
                    ),
                  ],
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
    required String dateClientVisit,
    required String fkAgent,
    required InstallationTypeEnum typeDate,
    VoidCallback? onSuccess,
  }) {
    final String currentUserId = AppConstants.currentUserId(context)!;
    final AgentDateModel dateModel = AgentDateModel(
      dateClientVisit: dateClientVisit,
      fkUser: currentUserId,
      isDone: '1',
      fkAgent: fkAgent,
      typeDate: typeDate,
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
    bloc.supportTimeController.clear();
  }
}
