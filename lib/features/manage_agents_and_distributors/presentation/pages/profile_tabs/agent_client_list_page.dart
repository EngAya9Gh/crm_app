import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/responsive_padding.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../clients_list/presentation/widgets/client_card.dart';
import '../../../domain/use_cases/get_agent_client_list_usecase.dart';
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
    _searchTextField = TextEditingController()..addListener(onSearch);

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
            return CustomLoadingIndicator();
          } else if (state.clientsStatus == StateStatus.failure) {
            return Text("Error");
          } else if (state.clientsStatus == StateStatus.success) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
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
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              hintText: AppStrings.agentSearchHintClient,
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
                        AppText("عدد العملاء"),
                        AppText(state.clientsList.length.toString()),
                      ],
                    ),
                  ),

                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => bloc.add(GetAgentClientListEvent(
                          query: _searchTextField.text,
                          getAgentClientListParams: GetAgentClientListParams(
                            agentId: widget.agentId,
                          ))),
                      child: ListView.separated(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemBuilder: (BuildContext context, int index) =>
                            CardClient(
                          clientModel: state.clientsList[index],
                          //   AgentClientCard(
                          // client: state.particiPateClientsListState.data[index],
                        ),
                        // ClientCard(client:state.particiPateClientsListState.data[index]),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 10),
                        itemCount: state.clientsList.length,
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
