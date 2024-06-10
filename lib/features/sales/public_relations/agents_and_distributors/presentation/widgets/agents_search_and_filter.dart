import 'package:crm_smart/core/common/widgets/app_elvated_button.dart';
import 'package:crm_smart/core/common/widgets/custom_filter_icon.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_bottom_sheet.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/widgets/agents_and_distributors_page_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';

class AgentsSearchAndFilter extends StatelessWidget {
  const AgentsSearchAndFilter({
    super.key,
    required TextEditingController searchTextField,
  }) : _searchTextField = searchTextField;

  final TextEditingController _searchTextField;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<AgentsDistributorsCubit>(context);
    return Row(
      children: [
        Expanded(
          child: CustomSearchWidget(
            hint: AppStrings.agentSearchHint,
            searchController: _searchTextField,
            onChanged: (value) {
              cubit.searchQuery = value;
              cubit.searchAgentsAndDistributors();
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
                      FilterAgentStatusDropDown(),
                      SizedBox(height: 10),
                      AppElevatedButton(
                        text: "تم",
                        onPressed: () {
                          cubit.searchAgentsAndDistributors();
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
