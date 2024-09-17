import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/models/page_state/page_state.dart';
import '../../../../../../core/common/widgets/app_comment_card.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../../../app/presentation/widgets/app_text_field.dart.dart';
import '../../domain/use_cases/add_participate_comment_usecase.dart';
import '../manager/participate_list_bloc.dart';
import '../manager/participate_list_event.dart';
import '../manager/participate_list_state.dart';

class ParticipateCommentListPage extends StatefulWidget {
  final String participateId;

  ParticipateCommentListPage({Key? key, required this.participateId})
      : super(key: key);

  @override
  State<ParticipateCommentListPage> createState() =>
      _ParticipateCommentListPageState();
}

class _ParticipateCommentListPageState
    extends State<ParticipateCommentListPage> {
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
    return Column(
      children: [
        20.verticalSpace,
        Form(
          key: _formKey,
          child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
            builder: (context, state) {
              if (state.actionCommentState.isLoading())
                return Center(child: CircularProgressIndicator());

              return Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        child: AppTextField(
                          labelText: "اترك تعليق*",
                          validator: InputValidator.requiredFiled,
                          controller: _commentController,
                          minLines: 5,
                          contentPadding: EdgeInsets.all(5),
                        ),
                      ),
                      10.width,
                      IconButton(
                        onPressed: () {
                          final isValid = _formKey.currentState!.validate();
                          if (!isValid) return;
                          context.read<ParticipateListBloc>().add(
                                  AddParticipateCommentEvent(
                                      AddParticipateCommentParams(
                                          content: _commentController.text,
                                          fkParticipate: widget.participateId),
                                      onSuccess: (value) {
                                if (value != null) {
                                  AppSnackbar.showSnakeBar(
                                    'تم إضافة التعليق بنجاح',
                                    color: ToastColorsEnum.error,
                                  );

                                  return;
                                }
                                AppSnackbar.showSnakeBar(
                                  'تم إضافة التعليق بنجاح',
                                  color: ToastColorsEnum.success,
                                );

                                _commentController.text = '';
                              }));
                        },
                        icon:
                            AppIcon(Icons.send, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        20.verticalSpace,
        Directionality(
          textDirection: TextDirection.rtl,
          child: BlocBuilder<ParticipateListBloc, ParticipateListState>(
            builder: (context, state) {
              return state.particiPateCommentsListState.when(
                init: () => AppLoader(),
                loading: () => AppLoader(),
                loaded: (data) => Expanded(
                  child: AppPaginatedList(
                    items: state.particiPateCommentsListState.data,
                    itemBuilder: (BuildContext context, int index) =>
                        AppCommentCard(
                      comment: state.particiPateCommentsListState.data[index],
                    ),
                  ),
                ),
                empty: () => AppText("Empty communications"),
                error: (exception) => AppText("Exception"),
              );
            },
          ),
        ),
      ],
    );
  }
}
