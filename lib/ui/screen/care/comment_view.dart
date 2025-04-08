import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/helpers/app_snackbar.dart';
import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/helpers/scroll_to_find_item.dart';
import 'package:crm_smart/core/common/widgets/app_icon.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/core/common/widgets/custom_error_widget.dart';
import 'package:crm_smart/core/common/widgets/custom_filter_icon.dart';
import 'package:crm_smart/core/common/widgets/loading_comment.dart';
import 'package:crm_smart/core/common/widgets/section_with_action.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/task_management/presentation/pages/add_manual_task_page.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:timeago/timeago.dart' as timeago;

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
        resizeToAvoidBottomInset: true,
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 80,
                ),
                child: CustomScrollView(
                  controller: controller,
                  slivers: [
                    // add task button
                    SliverToBoxAdapter(
                      child: SectionWithAction(
                        title: 'Tasks',
                        onAddPressed: () async {
                          final result = await showDialog(
                            context: context,
                            builder: (context) => AddManualTaskPage(
                              list: PublicType.values,
                              clientId: widget.client?.idClients,
                            ),
                          );
                        },
                        child: Container(), // سيتم إضافة قائمة المهام هنا
                      ),
                    ),
                    SliverToBoxAdapter(child: SizedBox(height: 10)),
                    // filters section
                    SliverToBoxAdapter(
                      child: Row(
                        children: [
                          CustomFilterIcon(
                            onTap: () async {},
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: CustomDropDown(
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
                          SizedBox(width: 8),
                          Expanded(
                            child: Consumer(
                              builder: (context, value, child) => ValueListenableBuilder(
                                valueListenable: _suggestions,
                                builder: (context, value, child) => CustomMultiSelectionDropdown<UserEntity>(
                                  hint: 'المنشنات',
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
                        ],
                      ),
                    ),

                    SliverToBoxAdapter(child: 10.height),

                    // list of comments
                    // list of comments
                    Consumer<comment_vm>(
                      builder: (context, value, child) {
                        if (value.isLoading) {
                          return SliverFillRemaining(child: LoadingCommentWidget());
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
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                  ),
                  // decoration: BoxDecoration(
                  //   //color: Colors.white,
                  //   boxShadow: [
                  //     BoxShadow(
                  //       color: Colors.black.withOpacity(0.1),
                  //       blurRadius: 4,
                  //       offset: Offset(0, -2),
                  //     ),
                  //   ],
                  // ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundImage:
                            currentUser?.img_image != null && currentUser!.img_image!.isNotEmpty ? NetworkImage(currentUser!.img_image!) : null,
                        child: currentUser?.img_image == null || currentUser!.img_image!.isEmpty
                            ? Icon(Icons.person, color: AppColors.primaryMain, size: 20)
                            : null,
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Form(
                            key: _globalKey,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ValueListenableBuilder(
                                    valueListenable: _suggestions,
                                    builder: (context, value, child) => FlutterMentions(
                                      key: key,
                                      suggestionPosition: SuggestionPosition.Top,
                                      maxLines: 5,
                                      minLines: 1,
                                      textDirection: TextDirection.rtl,
                                      decoration: InputDecoration(
                                        hintText: 'اكتب تعليقك هنا...',
                                        hintStyle: AppStyles.textStyle.copyWith(
                                          fontSize: 15.scaleFontSize,
                                          fontFamily: AppFonts.fontFamily2,
                                          color: Colors.grey.shade600,
                                        ),
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                                      ),
                                      mentions: [
                                        Mention(
                                          suggestionBuilder: (p0) => Padding(
                                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                ),
                                Container(
                                  width: 90,
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.grey.withOpacity(0.3), width: 1),
                                    ),
                                  ),
                                  child: ValueListenableBuilder(
                                    valueListenable: updateItem,
                                    builder: (context, value, child) => DropdownButtonHideUnderline(
                                      child: DropdownButton<CommentTypeEnum>(
                                        isExpanded: true,
                                        icon: Icon(Icons.arrow_drop_down, color: AppColors.black),
                                        hint: Text(
                                          'النوع',
                                          style: TextStyle(color: AppColors.grey),
                                        ),
                                        value: value?.type_comment != null
                                            ? CommentTypeEnum.values.firstWhere((element) => element.value == value!.type_comment)
                                            : _selectedCommentType,
                                        items: CommentTypeEnum.values.map((type) {
                                          return DropdownMenuItem<CommentTypeEnum>(
                                            value: type,
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 4),
                                              child: Text(
                                                type.value,
                                                style: TextStyle(
                                                  color: AppColors.grey,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        onChanged: (value) {
                                          if (value == null) return;
                                          setState(() {
                                            _previousSelectedCommentType = _selectedCommentType;
                                            _selectedCommentType = value;
                                            updateItem.value = updateItem.value?.copyWith(type_comment: _selectedCommentType?.value);
                                          });
                                        },
                                        underline: SizedBox(),
                                        dropdownColor: Colors.white,
                                        elevation: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Consumer<comment_vm>(
                        builder: (context, value, child) {
                          if (value.isloadadd) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: AppLoader(),
                            );
                          }
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.primaryMain,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: IconButton(
                              onPressed: () async {
                                return _sendComment(context);
                              },
                              icon: AppIcon(
                                Icons.send,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
      if (_globalKey.currentState!.validate() && _selectedCommentType?.value != null && (!(isReply ?? false))) {
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
              key.currentState!.controller?.clear();
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
