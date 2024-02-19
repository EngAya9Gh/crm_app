import 'package:crm_smart/features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/enums/enums.dart';
import '../../../../core/di/di_container.dart';

class AgentTypesWidget extends StatelessWidget {
  const AgentTypesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = sl<AgentsDistributorsActionsCubit>();
    return BlocBuilder<AgentsDistributorsActionsCubit,
        AgentsDistributorsActionsState>(
      builder: (context, state) {
        return Container(
          height: 50,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.zero,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                  onTap: () {
                    cubit.onSelectADType(ADType.distributor);
                  },
                  child: AnimatedContainer(
                    duration: kTabScrollDuration,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: cubit.agentDistributorActionParams.type ==
                            ADType.distributor
                        ? BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadiusDirectional.only(
                                topStart: Radius.circular(10),
                                bottomStart: Radius.circular(10)),
                          )
                        : null,
                    child: Text(
                      "موزع",
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              VerticalDivider(
                indent: 8,
                endIndent: 8,
                color: Colors.grey.shade600,
                width: 0,
              ),
              Expanded(
                  child: InkWell(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                onTap: () {
                  cubit.onSelectADType(ADType.agent);
                },
                child: AnimatedContainer(
                  duration: kTabScrollDuration,
                  height: 50,
                  alignment: Alignment.center,
                  decoration:
                      cubit.agentDistributorActionParams.type == ADType.agent
                          ? BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadiusDirectional.only(
                                  topEnd: Radius.circular(10),
                                  bottomEnd: Radius.circular(10)),
                            )
                          : null,
                  child: Text(
                    "وكيل",
                    textAlign: TextAlign.center,
                  ),
                ),
              )),
            ],
          ),
        );
      },
    );
  }
}
