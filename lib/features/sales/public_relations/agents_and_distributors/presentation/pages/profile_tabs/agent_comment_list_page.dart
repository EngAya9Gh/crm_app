import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/common/enums/enums.dart';
import '../../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../../core/common/widgets/app_comment_card.dart';
import '../../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../../core/common/widgets/app_loader.dart';
import '../../../../../../../core/common/widgets/app_text_field.dart.dart';
import '../../../../../../../core/utils/app_colors.dart';
import '../../../domain/use_cases/add_agent_comments_usecase.dart';
import '../../../domain/use_cases/get_agent_comments_list_usecase.dart';
import '../../manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';

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
                      controller: _commentController,
                      minLines: 3,
                      contentPadding: EdgeInsets.all(10),
                      isRequired: true,
                    ),
                  ),
                  5.width,
                  BlocListener<AgentsDistributorsProfileBloc,
                      AgentsDistributorsProfileState>(
                    listenWhen: (previous, current) =>
                        previous.addedCommentStatus !=
                        current.addedCommentStatus,
                    listener: (context, state) {
                      _handleAddCommentsStatus(state, context);
                    },
                    child: InkWell(
                        onTap: () {
                          final isValid = _formKey.currentState!.validate();
                          if (!isValid) return;
                          bloc.add(
                            AddAgentCommentEvent(
                              AddAgentCommentParams(
                                agentId: widget.agentId,
                                content: _commentController.text,
                              ),
                              onSuccess: () => _handleOnSuccess(bloc),
                            ),
                          );
                        },
                        child:
                            AppIcon(Icons.send, color: AppColors.primaryMain)),
                  ),
                ],
              ),
            ),
          ),
        ),
        10.height,
        // list of comments
        Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<AgentsDistributorsProfileBloc,
              AgentsDistributorsProfileState>(
            buildWhen: (previous, current) =>
                previous.commentsStatus != current.commentsStatus ||
                previous.commentsList != current.commentsList ||
                previous.addedCommentStatus != current.addedCommentStatus,
            builder: (context, state) {
              if (state.commentsStatus == StateStatus.loading ||
                  state.commentsStatus == StateStatus.initial)
                return AppLoader();
              else if (state.commentsStatus == StateStatus.failure)
                return AppErrorWidget(
                    message: 'Error loading comments ${state.commentsError}');
              else if (state.commentsStatus == StateStatus.empty)
                return AppErrorWidget(message: 'No comments found');
              else
                return Expanded(
                  child: AppPaginatedList(
                    items: state.commentsList,
                    itemBuilder: (context, index) => AppCommentCard(
                      comment: state.commentsList[index],
                    ),
                  ),
                );
            },
          ),
        ),
      ],
    );
  }

  void _handleOnSuccess(AgentsDistributorsProfileBloc bloc) {
    _commentController.text = '';
    bloc.add(
      GetAgentCommentListEvent(
        getAgentCommentListParams: GetAgentCommentListParams(
          agentId: widget.agentId,
        ),
      ),
    );
  }

  void _handleAddCommentsStatus(
      AgentsDistributorsProfileState state, BuildContext context) {
    if (state.addedCommentStatus == StateStatus.loading) {
      AppSnackbar.showSnakeBar(
        'جاري اضافة التعليق',
        color: ToastColorsEnum.info,
      );
    } else if (state.addedCommentStatus == StateStatus.failure) {
      AppSnackbar.showSnakeBar(
        'حدث خطأ اثناء اضافة التعليق',
        color: ToastColorsEnum.error,
      );
    } else if (state.addedCommentStatus == StateStatus.success) {
      AppSnackbar.showSnakeBar(
        'تم اضافة التعليق',
        color: ToastColorsEnum.success,
      );
    }
  }
}
