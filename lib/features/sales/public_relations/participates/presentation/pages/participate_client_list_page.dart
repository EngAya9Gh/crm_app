import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../manager/participate_list_state.dart';
import '../widgets/participate_client_card.dart';

class ParticipateClientListPage extends StatefulWidget {
  final String participateId;

  ParticipateClientListPage({Key? key, required this.participateId})
      : super(key: key);

  @override
  State<ParticipateClientListPage> createState() =>
      _ParticipateClientListPageState();
}

class _ParticipateClientListPageState extends State<ParticipateClientListPage> {
  late ParticipateListBloc _participateListBloc;
  late TextEditingController _searchTextField;

  @override
  void initState() {
    _searchTextField = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc = context.read<ParticipateListBloc>();
    });
    super.initState();
  }

  void onSearch() {
    _participateListBloc.add(SearchClientEvent(_searchTextField.text));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
        builder: (context, state) {
          return state.particiPateClientsListState.when(
            init: () => AppLoader(),
            loading: () => AppLoader(),
            loaded: (data) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  CustomSearchWidget(
                    searchController: _searchTextField,
                    onChanged: (value) => onSearch(),
                  ),
                  10.height,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("عدد العملاء"),
                        AppText(data.length.toString()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AppPaginatedList(
                      items: state.particiPateClientsListState.data,
                      itemBuilder: (BuildContext context, int index) =>
                          ParticipateClientCard(
                              client: state
                                  .particiPateClientsListState.data[index]),
                    ),
                  ),
                ],
              ),
            ),
            empty: () => AppText("Empty communications"),
            error: (exception) => AppText("Exception"),
          );
        },
      ),
    );
  }
}
