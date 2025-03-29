import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/helpers/scroll_to_find_item.dart';
import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../../core/common/enums/comments/comment_type_enum.dart';
import '../../../core/common/enums/toast_colors_enum.dart';
import '../../../core/common/models/client_model.dart';
import '../../../core/common/models/user_entity.dart';
import '../../../core/common/widgets/app_dialog.dart';
import '../../../core/common/widgets/app_elevated_button.dart';
import '../../../core/common/widgets/app_loader.dart';
import '../../../core/common/widgets/app_scaffold.dart';
import '../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../core/utils/app_colors.dart';
import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/comment.dart';
import '../../../view_model/user_vm_provider.dart';
import 'card_comment.dart';

RegExp mentionEegExpr = RegExp(r'@[\w\u0600-\u06FF\u200C.-]+');

class CommentView extends StatefulWidget {
  CommentView({
    required this.client,
    this.commentId,
    Key? key,
  }) : super(key: key);

  ClientModel? client;
  int? commentId;

  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  final _globalKey = GlobalKey<FormState>();
  GlobalKey<FlutterMentionsState> key = GlobalKey<FlutterMentionsState>();
  TextEditingController _comment = TextEditingController();
  CommentTypeEnum? _previousSelectedCommentType;
  CommentTypeEnum? _selectedCommentType;
  CommentTypeEnum? _filterCommentType = CommentTypeEnum.all;
  late UserProvider pro;
  UserModel? currentUser;
  List<UserEntity>? usersMentioned = [];
  List<String>? filterUserName = [];
  ValueNotifier<List<UserEntity>?> _suggestions = ValueNotifier([]);
  final ValueNotifier<CommentModel?> updateItem = ValueNotifier(null);
  final ScrollController _scrollController = ScrollController();
  late final comment_vm commentVm;
  // Create a GlobalKey for the target item
  final GlobalKey _targetKey = GlobalKey();
  late final AutoScrollController controller;
  ValueNotifier<bool> _isHighlighted = ValueNotifier(false);

  @override
  void initState() {
    controller = AutoScrollController(
        //add this for advanced viewport boundary. e.g. SafeArea
        viewportBoundaryGetter: () => Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),

        //choose vertical/horizontal
        axis: Axis.vertical,

        //this given value will bring the scroll offset to the nearest position in fixed row height case.
        //for variable row height case, you can still set the average height, it will try to get to the relatively closer offset
        //and then start searching.
        suggestedRowHeight: 85);
    commentVm = Provider.of<comment_vm>(context, listen: false);
    pro = context.read<UserProvider>()..getCurrentUser();
    currentUser = pro.currentUser;
    _selectedCommentType = (currentUser?.typeAdministration == "2") ? CommentTypeEnum.all : null;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        // Check if commentId is provided and scroll to the item
        if (widget.commentId != null) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            _findAndScrollToItem(widget.commentId!.toString());
          });
        }
        commentVm.getAllUsersComment().then(
          (value) {
            _suggestions.value = value;
          },
        );
      },
    );

    super.initState();
  }

  Future<void> _findAndScrollToItem(String targetId) async {
    // Keep loading pages and scrolling until we find the item
    try {
      print('Starting scroll to item: $targetId');

      // Wait for initial data load with timeout
      int attempts = 0;
      while (commentVm.filteredComments.isEmpty && attempts < 20) {
        await Future.delayed(Duration(milliseconds: 100));
        attempts++;
      }

      if (commentVm.filteredComments.isEmpty) {
        print('Failed to load initial data after $attempts attempts');
        return;
      }

      // Keep loading pages and scrolling until we find the item
      bool found = false;
      int pageLoadAttempts = 0;

      while (!found && pageLoadAttempts < 10) {
        found = commentVm.filteredComments.any(
          (element) => element.idComment == widget.commentId.toString(),
        );

        print('Searching for item. Found: $found, Page: $pageLoadAttempts');

        if (!found) {
          try {
            if (controller.hasClients) {
              final currentPosition = controller.position.maxScrollExtent;
              await controller.animateTo(
                currentPosition,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else {
              print('ScrollController has no clients');
              await Future.delayed(Duration(milliseconds: 200));
              continue;
            }

            // Load next page
            //     // Wait for load to complete
            await Future.delayed(Duration(milliseconds: 500));
            //
            await Future.delayed(Duration(milliseconds: 800));
            pageLoadAttempts++;
          } catch (scrollError) {
            print('Error during scroll: $scrollError');
            await Future.delayed(Duration(milliseconds: 200));
          }
        }
      }

      if (found) {
        print('Item found, attempting to scroll to position');

        final index = commentVm.filteredComments.indexWhere(
          (element) => element.idComment == widget.commentId.toString(),
        );

        if (index != -1 && controller.hasClients) {
          for (int i = 0; i < 3; i++) {
            try {
              // final itemPosition = index * itemHeight;
              // await scrollController.animateTo(
              // itemPosition,
              // duration: Duration(milliseconds: 500),
              // curve: Curves.easeInOut,
              // );
              print('Successfully scrolled to position ${controller.isIndexStateInLayoutRange(index)}');
              await controller.scrollToIndex(index, preferPosition: AutoScrollPosition.begin).then(
                (value) {
                  _isHighlighted.value = true;
                  Future.delayed(Duration(seconds: 2)).then(
                    (value) {
                      _isHighlighted.value = false;
                    },
                  );
                },
              );
              break;
            } catch (scrollError) {
              print('Scroll attempt $i failed: $scrollError');
              await Future.delayed(Duration(milliseconds: 200));
            }
          }
        } else {
          print('Invalid index ($index) or scroll controller not ready');
        }
      } else {
        print('Item not found after $pageLoadAttempts page loads');
      }
    } catch (e, stackTrace) {
      print('Error in scrollToItem: $e');
      print('Stack trace: $stackTrace');
    }
    // await ScrollHelper.scrollToItem(
    //   scrollController: _scrollController,
    //   targetId: targetId,

    //   itemHeight: 150.h, // Your item height
    //   items: commentVm.filteredComments,
    //   hasReachedMax: _cubit.pageVariables.hasReachedEnd,
    //   loadNextPage: () async {
    //     _cubit.getTasks(isNewFilter: false);
    //     // Wait for load to complete
    //     await Future.delayed(Duration(milliseconds: 500));
    //   },
    //   findItem: (task) => task.id.toString() == targetId,
    // );
  }

  @override
  void dispose() {
    _comment.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  bool isFirstComment = true;

  @override
  Widget build(BuildContext context) {
    return Portal(
      child: AppScaffold(
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: CustomScrollView(
              controller: controller,
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
                            ValueListenableBuilder(
                              valueListenable: _suggestions,
                              builder: (context, value, child) => FlutterMentions(
                                key: key,
                                suggestionPosition: SuggestionPosition.Bottom,
                                maxLines: 5,
                                minLines: 1,
                                textDirection: TextDirection.rtl,
                                mentions: [
                                  Mention(
                                    suggestionBuilder: (p0) => Padding(
                                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          AppText(p0['display']),
                                          Divider(),
                                        ],
                                      ),
                                    ),
                                    trigger: "@",
                                    style: TextStyle(color: AppColors.primaryMain),
                                    data: (value ?? []).map((e) => convertEntityToMapMention(e)).toList(),
                                  )
                                ],
                              ),
                            ),
                            10.height,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: updateItem,
                                  builder: (context, value, child) => AppElevatedButton(
                                    text: value?.type_comment ?? _selectedCommentType?.value ?? 'نوع التعليق',
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
                                                compareFn: (item, selectedItem) => item.index == selectedItem.index,
                                                itemAsString: (value) => value!.value,
                                                selectedItem: value?.type_comment != null
                                                    ? CommentTypeEnum.values.firstWhere((element) => element.value == value!.type_comment)
                                                    : _selectedCommentType,
                                                onChanged: (value) {
                                                  if (value == null) {
                                                    return;
                                                  }
                                                  _previousSelectedCommentType = _selectedCommentType;
                                                  _selectedCommentType = value;
                                                },
                                                validator: InputValidator.requiredFiled,
                                              ),
                                            ),
                                            20.height,
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                AppElevatedButton(
                                                  text: 'إلغاء',
                                                  onPressed: () {
                                                    _selectedCommentType = _previousSelectedCommentType;
                                                    Navigator.of(context, rootNavigator: true).pop(false);
                                                  },
                                                ),
                                                AppElevatedButton(
                                                    text: 'حفظ',
                                                    onPressed: () {
                                                      try {
                                                        if (_selectedCommentType != null) {
                                                          _previousSelectedCommentType = _selectedCommentType;
                                                          updateItem.value = updateItem.value?.copyWith(type_comment: _selectedCommentType?.value);
                                                          setState(() {});
                                                          Navigator.of(context, rootNavigator: true).pop(false);
                                                        }
                                                      } catch (e) {
                                                        print(e);
                                                        Navigator.of(context, rootNavigator: true).pop(false);
                                                      }
                                                    }),
                                              ],
                                            ),
                                            5.height,
                                          ],
                                        ),
                                      );
                                    },
                                  ),
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
                                      onTap: () async {
                                        return _sendComment(context);
                                      },
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
                    compareFn: (item, selectedItem) => item.index == selectedItem.index,
                    items: CommentTypeEnum.values.where(excludedTypes).toList(),
                    itemAsString: (value) => value!.value,
                    selectedItem: _filterCommentType,
                    onChanged: (value) {
                      if (value == null) return;

                      Provider.of<comment_vm>(context, listen: false).filterCommentsByType(value.value, nameUsers: filterUserName);
                      _filterCommentType = value;
                      setState(() {});
                    },
                    validator: InputValidator.requiredFiled,
                    height: 260.scaleHeight,
                  ),
                ),
                SliverToBoxAdapter(child: 10.height),
                Consumer(
                  builder: (context, value, child) => SliverToBoxAdapter(
                    child: ValueListenableBuilder(
                      valueListenable: _suggestions,
                      builder: (context, value, child) => CustomMultiSelectionDropdown<UserEntity>(
                        hint: 'الاشخاص المشار لهم بالتعلق',
                        items: value ?? [],
                        selectedItems: value?.where((element) => filterUserName?.contains(element) ?? false).toList() ?? [],
                        onSave: (value) {
                          filterUserName = value.map((e) => e.name).toList();
                          Provider.of<comment_vm>(context, listen: false)
                              .filterCommentsByType(_filterCommentType?.value, nameUsers: value.map((e) => e.name).toList());
                          setState(() {});
                        },
                        itemAsString: (u) => u!.name,
                        filterFn: (user, filter) => user.name.contains(filter),
                        compareFn: (item, selectedItem) => item.id == selectedItem.id,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'هذا الحقل مطلوب.';
                          }
                          return null;
                        },
                      ),
                    ),
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
                Consumer<comment_vm>(
                  builder: (context, value, child) {
                    if (value.isLoading) {
                      return SliverFillRemaining(child: AppLoader());
                    } else if (value.filteredComments.isEmpty) {
                      return SliverFillRemaining(
                        child: AppErrorWidget(message: 'لا يوجد تعليقات'),
                      );
                    } else {
                      return SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return ValueListenableBuilder(
                              valueListenable: _isHighlighted,
                              builder: (context, heghlight, child) => AutoScrollTag(
                                key: ValueKey(index),
                                controller: controller,
                                index: index,
                                child: Cardcomment(
                                  itemKey: value.filteredComments[index].idComment == widget.commentId.toString() ? _targetKey : null,
                                  shouldHighlight: (widget.commentId.toString() == value.filteredComments[index].idComment && heghlight),
                                  userModel: currentUser,
                                  canReplay: true,
                                  commentmodel: value.filteredComments[index],
                                  idClients: widget.client!.idClients!,
                                  replyOnCommentModel: (value) {
                                    _sendComment(context, true, value);
                                  },
                                  editCommentModel: (value) {
                                    updateItem.value = value;
                                    _selectedCommentType = CommentTypeEnum.values.firstWhere((element) => element.value == value.type_comment);
                                    // usersMentioned = [...value.mention_users!];
                                    key.currentState?.controller?.text = value.content;
                                    for (UserEntity item in value.mention_users ?? []) {
                                      key.currentState?.controller?.text =
                                          (key.currentState?.controller?.text ?? '') + " @${item.name.replaceAll(' ', '_')} ";
                                    }
                                  },
                                ),
                              ),
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
      ),
    );
  }

  Future<void> _sendComment(BuildContext context, [bool? isReply, CommentModel? commentModel]) async {
    var listNames = mentionEegExpr.allMatches(key.currentState!.controller!.text).map((e) => e.group(0)?.replaceAll('_', ' ').substring(1)).toList();
    usersMentioned = _suggestions.value?.where(
      (e) {
        return listNames.any((element) => element == e.name);
      },
    ).toList();
    print(listNames);
    print(usersMentioned);
    try {
      print(_selectedCommentType);
      if (_globalKey.currentState!.validate() && _selectedCommentType?.value != null) {
        _globalKey.currentState!.save();
        if (updateItem.value == null) {
          Provider.of<comment_vm>(context, listen: false).addComment_vm(
            {
              'fk_user': await Provider.of<UserProvider>(context, listen: false).currentUser.idUser.toString(),
              'fk_client': widget.client!.idClients!,
              'fkuser_client': widget.client!.fkUser.toString(),
              'date_comment': DateTime.now().toString(),
              //صتحب العميل
              'nameUser': Provider.of<UserProvider>(context, listen: false).currentUser.nameUser,
              'img_image': '',
              'name_enterprise': widget.client!.nameEnterprise!,
              'content': key.currentState?.controller?.text.replaceAll(mentionEegExpr, '').trim(),
              if (_selectedCommentType != null) 'type_comment': _selectedCommentType?.value,
            },
            Provider.of<UserProvider>(context, listen: false).currentUser.img_image,
            widget.client!.idClients.toString(),
            usersMentioned ?? [],
          ).then((value) {
            if (value != "error") {
              Provider.of<comment_vm>(context, listen: false).getComments(widget.client!.idClients.toString());
              _comment.text = '';
            }
          });
        } else if (updateItem.value != null) {
          await Provider.of<comment_vm>(context, listen: false)
              .editComment_vm(key.currentState!.controller!.text.replaceAll(mentionEegExpr, '').trim(),
                  updateItem.value!.copyWith(type_comment: _selectedCommentType?.value), usersMentioned ?? [])
              .then(
            (value) {
              Provider.of<comment_vm>(context, listen: false).getComments(widget.client!.idClients.toString());
            },
          );
        }
        key = GlobalKey<FlutterMentionsState>();
        usersMentioned = [];
        updateItem.value = null;
        _selectedCommentType = null;
      } else if (isReply ?? false) {
        Provider.of<comment_vm>(context, listen: false)
            .replyComment_vm(
          commentModel!,
        )
            .then((value) {
          if (value != "error") {
            Provider.of<UserProvider>(context, listen: false).getCurrentUser();
            _comment.text = '';
          }
        });
      } else {
        AppSnackbar.showSnakeBar(
          'من فضلك ادخل التعليق',
          color: ToastColorsEnum.error,
        );
      }
    } catch (e, s) {
      print(e.toString() + s.toString());
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

  Map<String, dynamic> convertEntityToMapMention(UserEntity userEntity) {
    return {
      'id': userEntity.id,
      'display': userEntity.name.replaceAll(' ', '_'),
    };
  }
}
