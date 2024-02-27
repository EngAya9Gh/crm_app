import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/enums/enums.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../ui/widgets/custom_widget/RowWidget.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../domain/use_cases/done_training_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';

class AgentSupportTraining extends StatefulWidget {
  const AgentSupportTraining({
    Key? key,
    required this.agent,
  }) : super(key: key);

  final AgentDistributorModel agent;

  @override
  State<AgentSupportTraining> createState() => _AgentSupportTrainingState();
}

class _AgentSupportTrainingState extends State<AgentSupportTraining> {
  @override
  void initState() {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bloc.traineeAgent = widget.agent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bool isLoading = false;
    return BlocBuilder<AgentsDistributorsProfileBloc,
        AgentsDistributorsProfileState>(
      buildWhen: (previous, current) {
        return previous.doneTrainingStatus != current.doneTrainingStatus;
      },
      builder: (context, state) {
        final AgentDistributorModel trainer = bloc.traineeAgent!;
        return Column(
          children: [
            if (trainer.nameusertraining != true)
              cardRow(
                  title: "موظف التدريب",
                  value: trainer.nameusertraining.toString()),
            cardRow(
                title: "هل تم التدريب",
                value: trainer.is_training == true
                    ? YesNoEnum.yes.name
                    : YesNoEnum.no.name),
            if (trainer.is_training == true)
              cardRow(
                  title: "تاريخ التدريب", value: trainer.date_training ?? ""),
            if (trainer.is_training == false) ...[
              SizedBox(height: 20),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kMainColor)),
                  onPressed: () async {
                    await showDialog(
                        context: context,
                        builder: (context) {
                          return Directionality(
                            textDirection: TextDirection.rtl,
                            child: AlertDialog(
                              title: Text('التأكيد'),
                              content: Text('هل تريد تأكيد العملية '),
                              actions: <Widget>[
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Expanded(
                                          child: StatefulBuilder(
                                            builder: (context, setState) {
                                              return isLoading
                                                  ? CustomLoadingIndicator()
                                                  : ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                                      kMainColor)),
                                                      onPressed: () async {
                                                        isLoading = true;
                                                        setState(() {});
                                                        bloc.add(
                                                          DoneAgentEvent(
                                                            DoneTrainingParams(
                                                              agentId: trainer
                                                                  .idAgent,
                                                              fkuser_training: Provider.of<
                                                                          UserProvider>(
                                                                      context,
                                                                      listen:
                                                                          false)
                                                                  .currentUser
                                                                  .idUser
                                                                  .toString(),
                                                            ),
                                                            onSuccess: (val) {
                                                              AppNavigator
                                                                  .pop();
                                                              isLoading = false;
                                                              setState(() {});
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                          YesNoEnum.yes.name),
                                                    );
                                            },
                                          ),
                                        ),
                                        10.horizontalSpace,
                                        Expanded(
                                          child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        kMainColor)),
                                            onPressed: () {
                                              Navigator.of(context,
                                                      rootNavigator: true)
                                                  .pop(
                                                      false); // dismisses only the dialog and returns false
                                            },
                                            child: Text(YesNoEnum.no.name),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text('تم التدريب'))
            ],
          ],
        );
      },
    );
  }
}
