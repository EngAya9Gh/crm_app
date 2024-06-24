import 'package:crm_smart/core/common/enums/agent_status_enum.dart';
import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_filter_icon.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:crm_smart/core/utils/app_navigator.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_button.dart';
import 'package:crm_smart/model/agent_state_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';

class AgentsSearchAndFilter extends StatefulWidget {
  const AgentsSearchAndFilter({
    super.key,
    this.agentStateModel,
  });

  final AgentStateModel? agentStateModel;

  @override
  State<AgentsSearchAndFilter> createState() => _AgentsSearchAndFilterState();
}

class _AgentsSearchAndFilterState extends State<AgentsSearchAndFilter> {
  late final AgentsDistributorsCubit cubit;

  @override
  void initState() {
    cubit = BlocProvider.of<AgentsDistributorsCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSearchWidget(
            hint: AppStrings.agentSearchHint,
            searchController: cubit.searchTextField,
            onChanged: (value) {
              cubit.getAgentsAndDistributors(isDebounce: true);
            },
          ),
        ),
        CustomFilterIcon(
          onTap: () {
            AppBottomSheet.show(
              context: context,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ListenableBuilder(
                            listenable: Listenable.merge([
                              cubit.filterAgentState,
                            ]),
                            builder: (context, child) {
                              return AppTextButton(
                                text: 'إعادة الافتراضي',
                                onPressed: cubit.filterAgentState.value != null
                                    ? () {
                                        cubit.filterAgentState.value = null;
                                        cubit.getAgentsAndDistributors();
                                        AppNavigator.pop();
                                      }
                                    : null,
                                appButtonStyle: AppButtonStyle.secondary,
                              );
                            }),
                      ),
                      StatefulBuilder(
                        builder: (context, setState) {
                          return CustomDropDown<AgentStateEnum>(
                            hint: 'حالة الوكيل',
                            items: AgentStateEnum.values,
                            selectedItem: cubit.filterAgentState.value,
                            itemAsString: (item) => item!.value,
                            height: 105.h,
                            onChanged: (value) {
                              setState(() {
                                cubit.filterAgentState.value = value;
                              });
                            },
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      AppElevatedButton(
                        text: "تم",
                        onPressed: () {
                          cubit.getAgentsAndDistributors();
                          AppNavigator.pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
