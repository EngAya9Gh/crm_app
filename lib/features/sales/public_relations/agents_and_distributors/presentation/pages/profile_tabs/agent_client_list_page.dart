import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../../../../core/utils/responsive_padding.dart';
import '../../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../clients/clients_list/presentation/widgets/client_card.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';

class AgentClientListPage extends StatefulWidget {
  final String agentId;

  AgentClientListPage({Key? key, required this.agentId}) : super(key: key);

  @override
  State<AgentClientListPage> createState() => _AgentClientListPageState();
}

class _AgentClientListPageState extends State<AgentClientListPage> {
  late TextEditingController _searchTextField;

  @override
  void initState() {
    _searchTextField = TextEditingController();

    super.initState();
  }

  void onSearch() {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    bloc.add(SearchClientEvent(_searchTextField.text));
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<AgentsDistributorsProfileBloc,
          AgentsDistributorsProfileState>(
        buildWhen: (previous, current) =>
            previous.clientsStatus != current.clientsStatus ||
            previous.clientsList != current.clientsList,
        builder: (context, state) {
          if (state.clientsStatus == StateStatus.loading ||
              state.clientsStatus == StateStatus.initial) {
            return AppLoader();
          } else if (state.clientsStatus == StateStatus.failure) {
            return AppErrorWidget(message: 'error');
          } else if (state.clientsStatus == StateStatus.success) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  // search
                  CustomSearchWidget(
                    hint: AppStrings.agentSearchHintClient,
                    searchController: _searchTextField,
                    onChanged: (value) => onSearch(),
                  ),
                  10.verticalSpace,
                  // clients count
                  Padding(
                    padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("عدد العملاء"),
                        AppText(state.clientsList.length.toString()),
                      ],
                    ),
                  ),

                  Expanded(
                    child: AppPaginatedList(
                      items: state.clientsList,
                      itemBuilder: (context, index) => CardClient(
                        clientModel: state.clientsList[index],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Text("Empty communications");
          }
        },
      ),
    );
  }
}
