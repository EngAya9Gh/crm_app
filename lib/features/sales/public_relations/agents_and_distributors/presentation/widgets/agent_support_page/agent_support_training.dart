import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../../core/utils/app_navigator.dart';
import '../../../../../../../ui/widgets/custom_widget/card_row.dart';
import '../../../data/models/agent_distributor_model.dart';
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
  late final AgentsDistributorsProfileBloc bloc;
  bool isLoading = false;

  @override
  void initState() {
    bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bloc.traineeAgent = widget.agent;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgentsDistributorsProfileBloc,
        AgentsDistributorsProfileState>(
      buildWhen: (previous, current) {
        return previous.doneTrainingStatus != current.doneTrainingStatus;
      },
      builder: (context, state) {
        final AgentDistributorModel trainer = bloc.traineeAgent!;
        return Column(
          children: [
            if (trainer.nameusertraining != null)
              CardRow(
                  title: "موظف التدريب",
                  value: trainer.nameusertraining.toString()),
            CardRow(
                title: "هل تم التدريب",
                value: trainer.is_training == true
                    ? YesNoEnum.yes.name
                    : YesNoEnum.no.name),
            if (trainer.is_training == true)
              CardRow(
                  title: "تاريخ التدريب", value: trainer.date_training ?? ""),
            if (trainer.is_training == false) ...[
              SizedBox(height: 20),
              AppElevatedButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) => _dialogBody(trainer),
                    );
                  },
                  child: Text('تم التدريب'))
            ],
          ],
        );
      },
    );
  }

  Directionality _dialogBody(AgentDistributorModel trainer) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text('التأكيد'),
        content: Text('هل تريد تأكيد العملية '),
        actions: <Widget>[
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: StatefulBuilder(
                      builder: (context, refresh) {
                        return AppElevatedButton(
                          isLoading: isLoading,
                          onPressed: () {
                            _onAgree(trainer, refresh);
                          },
                          child: Text(YesNoEnum.yes.name),
                        );
                      },
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: AppElevatedButton(
                      onPressed: () {
                        AppNavigator.pop(result: false);
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
  }

  void _onAgree(
    AgentDistributorModel trainer,
    Function(void Function()) refresh,
  ) {
    isLoading = true;
    refresh(() {});
    bloc.add(
      DoneAgentEvent(
        DoneTrainingParams(agentId: trainer.idAgent),
        onSuccess: (val) {
          AppNavigator.pop();
          isLoading = false;
          refresh(() {});
        },
        onFailed: (value) {
          isLoading = false;
          refresh(() {});
          AppSnackbar.showSnakeBar(
            value,
            color: ToastColorsEnum.error,
          );
        },
      ),
    );
  }
}
