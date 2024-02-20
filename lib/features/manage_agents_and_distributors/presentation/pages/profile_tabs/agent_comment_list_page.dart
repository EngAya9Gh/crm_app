import 'package:crm_smart/common/enums/enums.dart';
import 'package:crm_smart/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../common/helpers/helper_functions.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/responsive_padding.dart';
import '../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../../../manage_participates/presentation/widgets/participate_comment_card.dart';

class AgentCommentListPage extends StatefulWidget {
  final String agentId;

  const AgentCommentListPage({
    Key? key,
    required this.agentId,
  }) : super(key: key);

  @override
  State<AgentCommentListPage> createState() => _AgentCommentListPageState();
}

class _AgentCommentListPageState extends State<AgentCommentListPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AgentsDistributorsProfileBloc>(context);
    return Column(
      children: [
        20.verticalSpace,
        Form(
          key: _formKey,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                // padding: HWEdgeInsets.symmetric(horizontal: 10),
                children: [
                  Flexible(
                    child: AppTextField(
                      labelText: "اترك تعليق*",
                      validator: HelperFunctions.instance.requiredFiled,
                      controller: _commentController,
                      minLines: 5,
                      contentPadding: HWEdgeInsets.all(5),
                    ),
                  ),
                  20.horizontalSpace,
                  IconButton(
                    onPressed: () {
                      final isValid = _formKey.currentState!.validate();
                      if (!isValid) return;
                      // bloc.add(
                      //
                      // );
                      // context.read<ParticipateListBloc>().add(
                      //         AddParticipateCommentEvent(
                      //             AddParticipateCommentParams(
                      //                 content: _commentController.text,
                      //                 fkParticipate: widget.participateId),
                      //             onSuccess: (value) {
                      //       if (value != null) {
                      //         ScaffoldMessenger.of(context).showSnackBar(
                      //             SnackBar(content: Text('errorً')));
                      //         return;
                      //       }
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //           SnackBar(content: Text('تم')));
                      //       // Navigator.pop(context,value);
                      //       _commentController.text = '';
                      //     }));
                    },
                    icon: Icon(Icons.send, color: kMainColor),
                  ),
                ],
              ),
            ),
          ),
        ),
        20.verticalSpace,
        // list of comments
        Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<AgentsDistributorsProfileBloc,
              AgentsDistributorsProfileState>(
            builder: (context, state) {
              if (state.commentsStatus == StateStatus.loading ||
                  state.commentsStatus == StateStatus.initial)
                return CustomLoadingIndicator();
              else if (state.commentsStatus == StateStatus.failure)
                return Center(
                    child:
                        Text("Error loading comments ${state.commentsError}"));
              else if (state.commentsStatus == StateStatus.empty)
                return Center(child: Text("Empty"));
              else
                return Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    itemBuilder: (context, index) {
                      return ParticipateCommenttCard(
                        comment: state.commentsList[index],
                      );
                    },
                    itemCount: state.commentsList.length,
                    separatorBuilder: (context, index) => 7.verticalSpace,
                  ),
                );
            },
          ),
        ),
      ],
    );
  }
}
