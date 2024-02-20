import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AgentInvoiceListPage extends StatefulWidget {
  final String participateId;

  AgentInvoiceListPage({Key? key, required this.participateId})
      : super(key: key);

  @override
  State<AgentInvoiceListPage> createState() => _AgentInvoiceListPageState();
}

class _AgentInvoiceListPageState extends State<AgentInvoiceListPage> {
  // late ParticipateListBloc _participateListBloc;
  // late TextEditingController _searchTextField;
  //
  // @override
  // void initState() {
  //   _searchTextField = TextEditingController()..addListener(onSearch);
  //
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     _participateListBloc = context.read<ParticipateListBloc>();
  //   });
  //   super.initState();
  // }
  //
  // void onSearch() {
  //   print("search");
  //   _participateListBloc.add(SearchInvoiceEvent(_searchTextField.text));
  // }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return ModalProgressHUD(
    //   inAsyncCall: context
    //       .read<ParticipateListBloc>()
    //       .state
    //       .dialogProgressState
    //       .isLoading(),
    //   dismissible: false, // Prevent user from dismissing while loading
    //   progressIndicator: CircularProgressIndicator(),
    //   child: Directionality(
    //     textDirection: TextDirection.rtl,
    //     child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
    //       builder: (context, state) {
    //         return state.particiPateInvoicesListState.when(
    //           init: () => Center(child: CircularProgressIndicator()),
    //           loading: () => Center(child: CircularProgressIndicator()),
    //           loaded: (data) => Padding(
    //             padding: const EdgeInsets.all(10.0),
    //             child: Column(
    //               children: [
    //                 Container(
    //                   decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       borderRadius: BorderRadius.all(
    //                         Radius.circular(5),
    //                       )),
    //                   height: 50,
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(
    //                         top: 2, left: 8, right: 8, bottom: 2),
    //                     child: Container(
    //                       decoration: BoxDecoration(
    //                         color: Colors.grey.withOpacity(0.2),
    //                         borderRadius: BorderRadius.circular(10),
    //                       ),
    //                       child: Directionality(
    //                         textDirection: TextDirection.rtl,
    //                         child: TextField(
    //                           controller: _searchTextField,
    //                           textInputAction: TextInputAction.search,
    //                           decoration: InputDecoration(
    //                             hintText: "اسم االؤسسة, رقم الفاتورة .....",
    //                             border: InputBorder.none,
    //                             prefixIcon: Icon(
    //                               Icons.search,
    //                               color: Colors.black,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 10.verticalSpace,
    //                 Padding(
    //                   padding: HWEdgeInsets.symmetric(horizontal: 10.0),
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       AppText("عدد الفواتير"),
    //                       AppText(data.length.toString()),
    //                     ],
    //                   ),
    //                 ),
    //                 Expanded(
    //                   child: RefreshIndicator(
    //                     onRefresh: () async => _participateListBloc.add(
    //                         GetParticipateInvoiceListEvent(
    //                             query: _searchTextField.text,
    //                             getParticipateInvoiceListParams:
    //                                 GetParticipateInvoiceListParams(
    //                                     idParticipate: widget.participateId))),
    //                     child: ListView.separated(
    //                       padding: EdgeInsets.symmetric(
    //                           horizontal: 10, vertical: 10),
    //                       itemBuilder: (BuildContext context, int index) =>
    //                           ParticipateInvoiceCard(
    //                               invoice: state
    //                                   .particiPateInvoicesListState.data[index],
    //                               type: "",
    //                               openInvoice: _opentInvoice),
    //                       separatorBuilder: (BuildContext context, int index) =>
    //                           SizedBox(height: 10),
    //                       itemCount:
    //                           state.particiPateInvoicesListState.data.length,
    //                     ),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //           empty: () => Text("Empty communications"),
    //           error: (exception) => Text("Exception"),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }

  // void _opentInvoice(String idInvoice) {
  //   context.read<ParticipateListBloc>().add(GetInvoiceByIdEvent(
  //           GetInvoiceByIdParams(idInvoice: idInvoice.toString()),
  //           onSuccess: (invoice) {
  //         Navigator.push(
  //           context,
  //           CupertinoPageRoute(
  //             builder: (context) => InvoiceView(invoice: invoice),
  //           ),
  //         );
  //       }));
  // }
}
