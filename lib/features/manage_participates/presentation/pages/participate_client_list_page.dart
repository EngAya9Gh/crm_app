import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/core/utils/responsive_padding.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_bloc.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_event.dart';
import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    _searchTextField = TextEditingController()..addListener(onSearch);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc = context.read<ParticipateListBloc>();
    });
    super.initState();
  }

  void onSearch() {
    print("search");
    _participateListBloc.add(SearchClientEvent(_searchTextField.text));
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
        builder: (context, state) {
          return state.particiPateClientsListState.when(
            init: () => Center(child: CircularProgressIndicator()),
            loading: () => Center(child: CircularProgressIndicator()),
            loaded: (data) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
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
                              hintText:
                                  "اسم المؤسسة.....",
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
                  Padding(
                    padding: HWEdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText("عدد العملاء"),
                        AppText(data.length.toString()),
                      ],
                    ),
                  ),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => _participateListBloc.add(
                          GetParticipateClientListEvent(
                              query: _searchTextField.text,
                              getParticipateClientListParams:
                                  GetParticipateClientListParams(
                                      idParticipate: widget.participateId))),
                      child: ListView.separated(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        itemBuilder: (BuildContext context, int index) =>
                            ParticipateClientCard(
                                client: state
                                    .particiPateClientsListState.data[index]),
                        // ClientCard(client:state.particiPateClientsListState.data[index]),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 10),
                        itemCount:
                            state.particiPateClientsListState.data.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            empty: () => Text("Empty communications"),
            error: (exception) => Text("Exception"),
          );
        },
      ),
    );
  }
}
