import 'package:crm_smart/features/manage_participates/presentation/manager/participate_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgentCommentListPage extends StatefulWidget {
  final String participateId;

  AgentCommentListPage({Key? key, required this.participateId})
      : super(key: key);

  @override
  State<AgentCommentListPage> createState() => _AgentCommentListPageState();
}

class _AgentCommentListPageState extends State<AgentCommentListPage> {
  late ParticipateListBloc _participateListBloc;

  // late TextEditingController _searchTextField;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _commentController;

  @override
  void initState() {
    //  _searchTextField = TextEditingController()..addListener(onSearch);
    _formKey = GlobalKey<FormState>();
    _commentController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _participateListBloc = context.read<ParticipateListBloc>();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Column(
    //   children: [
    //     20.verticalSpace,
    //     Form(
    //       key: _formKey,
    //       child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
    //         builder: (context, state) {
    //           if (state.actionCommentState.isLoading())
    //             return Center(child: CircularProgressIndicator());
    //
    //           return Directionality(
    //             textDirection: TextDirection.rtl,
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 // padding: HWEdgeInsets.symmetric(horizontal: 10),
    //                 children: [
    //                   Flexible(
    //                     child: AppTextField(
    //                       labelText: "اترك تعليق*",
    //                       validator: HelperFunctions.instance.requiredFiled,
    //                       controller: _commentController,
    //                       minLines: 5,
    //                       contentPadding: HWEdgeInsets.all(5),
    //                     ),
    //                   ),
    //                   20.horizontalSpace,
    //                   IconButton(
    //                     onPressed: () {
    //                       final isValid = _formKey.currentState!.validate();
    //                       if (!isValid) return;
    //                       context.read<ParticipateListBloc>().add(
    //                               AddParticipateCommentEvent(
    //                                   AddParticipateCommentParams(
    //                                       content: _commentController.text,
    //                                       fkParticipate: widget.participateId),
    //                                   onSuccess: (value) {
    //                             if (value != null) {
    //                               ScaffoldMessenger.of(context).showSnackBar(
    //                                   SnackBar(content: Text('errorً')));
    //                               return;
    //                             }
    //                             ScaffoldMessenger.of(context).showSnackBar(
    //                                 SnackBar(content: Text('تم')));
    //                             // Navigator.pop(context,value);
    //                             _commentController.text = '';
    //                           }));
    //                     },
    //                     icon: Icon(Icons.send, color: kMainColor),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           );
    //         },
    //       ),
    //     ),
    //     20.verticalSpace,
    //     Directionality(
    //       textDirection: TextDirection.rtl,
    //       child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
    //         builder: (context, state) {
    //           return state.particiPateCommentsListState.when(
    //             init: () => Center(child: CircularProgressIndicator()),
    //             loading: () => Center(child: CircularProgressIndicator()),
    //             loaded: (data) => Expanded(
    //               child: ListView.separated(
    //                 padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    //                 itemBuilder: (context, index) {
    //                   return ParticipateCommenttCard(
    //                     comment: state.particiPateCommentsListState.data[index],
    //                   );
    //                 },
    //                 itemCount: data.length,
    //                 separatorBuilder: (context, index) => 7.verticalSpace,
    //               ),
    //             ),
    //             empty: () => Text("Empty communications"),
    //             error: (exception) => Text("Exception"),
    //           );
    //         },
    //       ),
    //     ),
    //   ],
    // );
  }
}
