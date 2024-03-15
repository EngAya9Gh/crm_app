import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/common/enums/comment_type.dart';
import '../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../model/calendar/event_model.dart';
import '../../../model/clientmodel.dart';
import '../../../view_model/comment.dart';
import '../../../view_model/event_provider.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/custom_widget/text_form.dart';
import 'card_comment.dart';

class commentView extends StatefulWidget {
  commentView({
    required this.client,
    Key? key,
    // this.event,
  }) : super(key: key);

  ClientModel1? client;
  // final EventModel? event;

  @override
  _commentViewState createState() => _commentViewState();
}

class _commentViewState extends State<commentView> {
  final _globalKey = GlobalKey<FormState>();

  TextEditingController _comment = TextEditingController();
  CommmentType? _previousSelectedCommentType;
  CommmentType? _selectedCommentType;
  CommmentType? _filterCommentType = CommmentType.all;

  @override
  void dispose() {
    _comment.dispose();
    super.dispose();
  }

  bool isFirstComment = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    border: Border.all(color: kMainColor, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Form(
                    key: _globalKey,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          EditTextFormField(
                            vaildator: (value) {
                              if (value!.toString().trim().isEmpty) {
                                return AppStrings.labelEmpty;
                              }
                              return null;
                            },
                            maxline: 3,
                            paddcustom: EdgeInsets.only(
                                top: 20, left: 3, right: 3, bottom: 3),
                            controller: _comment,
                            hintText: 'إضافة تعليق',
                            // keyboardType: TextInputType.multiline,
                          ),
                          // add comment type
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  // show dialog with the dropdown button
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('نوع التعليق'),
                                        content: DropdownButtonFormField<
                                            CommmentType>(
                                          decoration: InputDecoration(
                                              labelText: 'نوع التعليق'),
                                          items: CommmentType.values
                                              .where((element) {
                                            return excludedTypes(element);
                                          }).map((activitySize) {
                                            return DropdownMenuItem(
                                              child: Text(activitySize.value),
                                              value: activitySize,
                                            );
                                          }).toList(),
                                          value: _selectedCommentType,
                                          onChanged: (value) {
                                            if (value == null) {
                                              return;
                                            }
                                            _previousSelectedCommentType =
                                                _selectedCommentType;
                                            _selectedCommentType = value;
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.always,
                                          validator: (selectedCommmentType) {
                                            if (selectedCommmentType?.value
                                                    .trim()
                                                    .isEmpty ??
                                                true) {
                                              return "هذا الحقل مطلوب";
                                            }
                                            return null;
                                          },
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              _selectedCommentType =
                                                  _previousSelectedCommentType;
                                              Navigator.pop(context);
                                            },
                                            child: Text('إلغاء'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              if (_selectedCommentType !=
                                                  null) {
                                                setState(() {});
                                                Navigator.pop(context);
                                              }
                                            },
                                            child: Text('حفظ'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Text(_selectedCommentType?.value ??
                                    'نوع التعليق'),
                              ),
                              Consumer<comment_vm>(
                                builder: (context, value, child) {
                                  if (value.isloadadd) {
                                    return AnimatedPadding(
                                      duration: kTabScrollDuration,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0),
                                      child: Center(
                                        child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator()),
                                      ),
                                    );
                                  }
                                  return IconButton(
                                      onPressed: () async {
                                        if (_globalKey.currentState!
                                            .validate() && _selectedCommentType?.value!=null) {
                                          _globalKey.currentState!.save();

                                          Provider.of<comment_vm>(context,
                                                  listen: false)
                                              .addComment_vm(
                                            {
                                              'content': _comment.text,
                                              'fk_user': await Provider.of<
                                                          UserProvider>(context,
                                                      listen: false)
                                                  .currentUser
                                                  .idUser
                                                  .toString(),
                                              'fk_client':
                                                  widget.client!.idClients!,
                                              'fkuser_client': widget
                                                  .client!.fkUser
                                                  .toString(),
                                              //صتحب العميل
                                              'nameUser': widget
                                                  .client!.nameUser
                                                  .toString(),
                                              'date_comment':
                                                  //Utils.toDateTime(
                                                  DateTime.now().toString(),
                                              //),
                                              'nameUser':
                                                  Provider.of<UserProvider>(
                                                          context,
                                                          listen: false)
                                                      .currentUser
                                                      .nameUser,
                                              'img_image': '',
                                              'name_enterprise': widget
                                                  .client!.nameEnterprise!,
                                              if (_selectedCommentType != null)
                                                'type_comment':
                                                    _selectedCommentType?.value,
                                            },
                                            Provider.of<UserProvider>(context,
                                                    listen: false)
                                                .currentUser
                                                .img_image,
                                          ).then((value) {
                                            if (value != "error") {
                                              Provider.of<comment_vm>(context, listen: false)
                                                  .getComment(widget.client!.idClients.toString());

                                              // if (widget.event != null &&
                                              //     isFirstComment) {
                                              //   context
                                              //       .read<EventProvider>()
                                              //       .changeEventToDone(
                                              //         event: widget.event!,
                                              //         onLoading: () {},
                                              //         onSuccess: () => context
                                              //             .read<invoice_vm>()
                                              //             .updateListInvoiceAfterMarkEventIsDone(
                                              //                 widget.event!),
                                              //         onFailure: () {},
                                              //       );
                                              //   isFirstComment = false;
                                              // }
                                              _comment.text = '';
                                            }
                                          });
                                        }
                                        else
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                            content: Text('من فضلك اختر نوع التعليق ')));
                                      },
                                      icon:
                                          Icon(Icons.send, color: kMainColor));
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

              // comments filter
              SliverToBoxAdapter(
                child: DropdownButtonFormField<CommmentType>(
                  icon: Icon(Icons.filter_list),
                  decoration: InputDecoration(labelText: 'نوع التعليق'),
                  items: CommmentType.values.map((activitySize) {
                    return DropdownMenuItem(
                      child: Text(activitySize.value),
                      value: activitySize,
                    );
                  }).toList(),
                  value: _filterCommentType,
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    Provider.of<comment_vm>(context, listen: false)
                        .filterCommentsByType(value.value);
                    _filterCommentType = value;
                    setState(() {});
                  },
                  validator: (selectedCommentType) {
                    if (selectedCommentType?.value.trim().isEmpty ?? true) {
                      return "هذا الحقل مطلوب";
                    }
                    return null;
                  },
                ),
              ),

              // sized box
              SliverToBoxAdapter(child: SizedBox(height: 15)),

              // list of comments
              context.watch<comment_vm>().isLoading
                  ? SliverFillRemaining(
                      child: CustomLoadingIndicator(),
                    )
                  : Consumer<comment_vm>(
                      builder: (context, value, child) {
                        if (value.isLoading) {
                          return CustomLoadingIndicator();
                        } else if (value.filteredComments.isEmpty) {
                          return SliverFillRemaining(
                            child: Center(
                              child: Text('لا يوجد تعليقات'),
                            ),
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
                          ));
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }

  bool excludedTypes(CommmentType element) {
    return element != CommmentType.all &&
        element != CommmentType.notReady &&
        element != CommmentType.suspend &&
        element != CommmentType.excludeClient &&
        element != CommmentType.reschedule;
  }
}
