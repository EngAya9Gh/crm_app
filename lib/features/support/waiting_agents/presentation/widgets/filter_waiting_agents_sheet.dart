import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/enums/agents/agent_source_enum.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import 'package:collection/collection.dart';

import '../../domain/use_cases/waiting_agents_usecase.dart';
import '../manager/waiting_agents/waiting_agents_cubit.dart';
class FilterWaitingAgentSheet extends StatelessWidget {
  const FilterWaitingAgentSheet({
    this.canReset = false,
    Key? key,
  });

  final bool canReset;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: HWEdgeInsets.symmetric(horizontal: 15.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: BlocBuilder<WaitingAgentsCubit, WaitingAgentsState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.height,
                  if (!state.getWaitingAgentsParams.isEmpty())
                    Align(
                      alignment: Alignment.centerLeft,
                      child: AppTextButton(
                        onPressed: () {
                          context.read<WaitingAgentsCubit>().changeFilter(GetWaitingAgentsParams());
                          //
                          if (canReset) {
                            context.read<WaitingAgentsCubit>().getWaitingAgents();
                          }
                          AppNavigator.pop();
                        },
                        text: "إعادة الافتراضي",
                        appButtonStyle: AppButtonStyle.secondary,
                      ),
                    ),
                  10.height,
                  CustomDropDown<AgentSourceEnum>(
                    compareFn:  (item, selectedItem) => item.index == selectedItem.index,
                    hint: "المصدر",
                    items: AgentSourceEnum.values.toList(),
                    itemAsString: (item) => item?.value ?? '',
                    selectedItem: (AgentSourceEnum.values.firstWhereOrNull((element) => element.value==state.getWaitingAgentsParams.source,)),
                    onChanged: (value) {
                      if (value == null) return;
                      context.read<WaitingAgentsCubit>().changeFilter(state.getWaitingAgentsParams.copyWith(source:() =>  value.value));
                    },
                    validator: InputValidator.requiredFiled,
                  ),
                  20.height,
                  SizedBox(
                    width: double.infinity,
                    child: AppElevatedButton(
                      text: "فلترة",
                      onPressed: () {
                        context.read<WaitingAgentsCubit>()
                          ..changeFilter( state.getWaitingAgentsParams)
                          ..getWaitingAgents();
                        // widget.bloc.add( GetAllCareActivitiesEvent(page: 1,));
                        context.pop(true);
                      },
                    ),
                  ),
                  20.height,
                ],
              );
            }),
      ),
    );
  }
}
