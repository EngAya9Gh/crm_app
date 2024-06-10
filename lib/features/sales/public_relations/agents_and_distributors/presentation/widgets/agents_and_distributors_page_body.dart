import 'package:crm_smart/core/common/enums/agent_status_enum.dart';
import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agents_search_and_filter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/enums.dart';
import '../../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../../core/utils/responsive_padding.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import 'agent_card.dart';

class AgentsAndDistributorsPageBody extends StatelessWidget {
  AgentsAndDistributorsPageBody({Key? key}) : super(key: key);

  final TextEditingController _searchTextField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsCubit>(context);
    return RefreshIndicator(
      onRefresh: () async => cubit.getAgentsAndDistributors(),
      child: BlocBuilder<AgentsDistributorsCubit, AgentsDistributorsState>(
        builder: (context, state) {
          if (state.status == StateStatus.loading) {
            return CustomLoadingIndicator();
          } else if (state.status == StateStatus.failure) {
            return CustomErrorWidget(onPressed: cubit.getAgentsAndDistributors);
          }
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
                SizedBox(height: 10),
                // search
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AgentsSearchAndFilter(
                    searchTextField: _searchTextField,
                  ),
                ),
                10.width,
                // clients count
                Padding(
                  padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText("العدد"),
                      AppText(
                          state.agentsAndDistributorsList.length.toString()),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: state.agentsAndDistributorsList.length,
                    itemBuilder: (BuildContext context, int index) => AgentCard(
                      agentModel: state.agentsAndDistributorsList[index],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class FilterAgentStatusDropDown extends StatefulWidget {
  const FilterAgentStatusDropDown({super.key});

  @override
  State<FilterAgentStatusDropDown> createState() =>
      _FilterAgentStatusDropDownState();
}

class _FilterAgentStatusDropDownState extends State<FilterAgentStatusDropDown> {
  AgentStateEnum? agentStatus;

  @override
  Widget build(BuildContext context) {
    return CustomDropDown(
      hint: 'حالة الوكيل',
      items: AgentStateEnum.values,
      selectedItem: agentStatus,
      itemAsString: (item) => item!.value,
      height: 105.h,
      onChanged: (value) {
        setState(() {
          agentStatus = value;
        });
      },
    );
  }
}
