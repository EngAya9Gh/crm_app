import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/enums/enums.dart';
import '../../../../common/widgets/custom_error_widget.dart';
import '../../../../common/widgets/custom_loading_indicator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/responsive_padding.dart';
import '../../../app/presentation/widgets/app_text.dart';
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
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      )),
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 2, left: 8, right: 8, bottom: 2),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: TextField(
                          controller: _searchTextField,
                          onChanged: (value) =>
                              cubit.searchAgentsAndDistributors(value),
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                            hintText: AppStrings.agentSearchHint,
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                10.verticalSpace,
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
