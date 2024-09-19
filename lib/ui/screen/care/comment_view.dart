import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_row.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/common/enums/comments/comment_type_enum.dart';
import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/models/client_model.dart';
import '../../../core/common/widgets/app_dialog.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_loader.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../view_model/comment.dart';
import '../../../view_model/user_vm_provider.dart';
import 'card_comment.dart';

class CommentView extends StatefulWidget {
  CommentView({
    required this.client,
    Key? key,
    // this.event,
  }) : super(key: key);

  ClientModel? client;

  // final EventModel? event;

  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  final _globalKey = GlobalKey<FormState>();

  TextEditingController _comment = TextEditingController();
  CommentTypeEnum? _previousSelectedCommentType;
  CommentTypeEnum? _selectedCommentType;
  CommentTypeEnum? _filterCommentType = CommentTypeEnum.all;

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  bool isFirstComment = true;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: CustomScrollView(
            slivers: [
              // add task button
              SliverToBoxAdapter(
                child: AddManualTaskButton(
                  list: commentPublicTypeList,
                  clientId: widget.client?.idClients,
                ),
              ),

              // add comment
              SliverToBoxAdapter(
                child: Container(
                  // outter box
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primaryMain, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    key: _globalKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AppTextField(
                            controller: _comment,
                            hintText: 'إضافة تعليق',
                            isRequired: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 15,
                            ),
                          ),
                          10.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppElevatedButton(
                                text: _selectedCommentType?.value ??
                                    'نوع التعليق',
                                onPressed: () {
                                  // show dialog with the dropdown button
                                  AppConstants.showAppDialog(
                                    child: AppDialog(
                                      title: 'نوع التعليق',
                                      children: [
                                        Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: CustomDropDown(
                                            hint: 'نوع التعليق',
                                            items: CommentTypeEnum.values,
                                            itemAsString: (value) =>
                                                value!.value,
                                            selectedItem: _selectedCommentType,
                                            onChanged: (value) {
                                              if (value == null) {
                                                return;
                                              }
                                              _previousSelectedCommentType =
                                                  _selectedCommentType;
                                              _selectedCommentType = value;
                                            },
                                            validator:
                                                InputValidator.requiredFiled,
                                          ),
                                        ),
                                        20.height,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            AppElevatedButton(
                                              text: 'إلغاء',
                                              onPressed: () {
                                                _selectedCommentType =
                                                    _previousSelectedCommentType;
                                                Navigator.pop(context);
                                              },
                                            ),
                                            AppElevatedButton(
                                              text: 'حفظ',
                                              onPressed: () {
                                                if (_selectedCommentType !=
                                                    null) {
                                                  setState(() {});
                                                  Navigator.pop(context);
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                        5.height,
                                      ],
                                    ),
                                  );
                                },
                              ),
                              Consumer<comment_vm>(
                                builder: (context, value, child) {
                                  if (value.isloadadd) {
                                    return AnimatedPadding(
                                      duration: kTabScrollDuration,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      child: AppLoader(),
                                    );
                                  }
                                  return InkWell(
                                    onTap: () async => _sendComment(context),
                                    child: AppIcon(
                                      Icons.send,
                                      color: AppColors.primaryMain,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Column(
                  children: [
                    10.height,
                    Divider(
                      color: AppColors.primaryMain,
                      thickness: 1,
                    ),
                    20.height,
                  ],
                ),
              ),

              ///* comments filters *///

              SliverToBoxAdapter(
                child: CustomDropDown(
                  label: 'نوع التعليق',
                  hint: 'نوع التعليق',
                  items: CommentTypeEnum.values.where(excludedTypes).toList(),
                  itemAsString: (value) => value!.value,
                  selectedItem: _filterCommentType,
                  onChanged: (value) {
                    if (value == null) return;

                    Provider.of<comment_vm>(context, listen: false)
                        .filterCommentsByType(value.value);
                    _filterCommentType = value;
                    setState(() {});
                  },
                  validator: InputValidator.requiredFiled,
                  height: 260.scaleHeight,
                ),
              ),

              // sized box
              SliverToBoxAdapter(child: 10.height),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: CardRow(
                    title: 'عدد التعليقات',
                    value: context.watch<comment_vm>().filteredComments.length,
                    withDivider: false,
                  ),
                ),
              ),

              SliverToBoxAdapter(child: 10.height),

              // list of comments
              context.watch<comment_vm>().isLoading
                  ? SliverFillRemaining(child: AppLoader())
                  : Consumer<comment_vm>(
                      builder: (context, value, child) {
                        if (value.isLoading) {
                          return AppLoader();
                        } else if (value.filteredComments.isEmpty) {
                          return SliverFillRemaining(
                            child: AppErrorWidget(message: 'لا يوجد تعليقات'),
                          );
                        } else {
                          return SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return cardcomment(
                                  commentmodel: value.filteredComments[index],
                                );
                              },
                              childCount: value.filteredComments.length,
                            ),
                          );
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendComment(BuildContext context) async {
    if (_globalKey.currentState!.validate() &&
        _selectedCommentType?.value != null) {
      _globalKey.currentState!.save();

      Provider.of<comment_vm>(context, listen: false).addComment_vm(
        {
          'content': _comment.text,
          'fk_user': await Provider.of<UserProvider>(context, listen: false)
              .currentUser
              .idUser
              .toString(),
          'fk_client': widget.client!.idClients!,
          'fkuser_client': widget.client!.fkUser.toString(),
          'date_comment': DateTime.now().toString(),
          //صتحب العميل
          'nameUser': Provider.of<UserProvider>(context, listen: false)
              .currentUser
              .nameUser,
          'img_image': '',
          'name_enterprise': widget.client!.nameEnterprise!,
          if (_selectedCommentType != null)
            'type_comment': _selectedCommentType?.value,
        },
        Provider.of<UserProvider>(context, listen: false).currentUser.img_image,
      ).then((value) {
        if (value != "error") {
          Provider.of<comment_vm>(context, listen: false)
              .getComments(widget.client!.idClients.toString());

          _comment.text = '';
        }
      });
    } else {
      AppSnackbar.showSnakeBar(
        'من فضلك ادخل التعليق',
        color: ToastColorsEnum.error,
      );
    }
  }

  bool excludedTypes(CommentTypeEnum element) {
    return element != CommentTypeEnum.all &&
        element != CommentTypeEnum.notReady &&
        element != CommentTypeEnum.suspend &&
        element != CommentTypeEnum.excludeClient &&
        element != CommentTypeEnum.reschedule &&
        element != CommentTypeEnum.returnApprove;
  }
}
