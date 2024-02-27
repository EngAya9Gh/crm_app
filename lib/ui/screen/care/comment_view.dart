import 'package:crm_smart/core/common/widgets/custom_loading_indicator.dart';
import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/care/card_comment.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/common/enums/comment_type.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../model/calendar/event_model.dart';
import '../../../view_model/event_provider.dart';

class commentView extends StatefulWidget {
  commentView({
    required this.client,
    Key? key,
    this.event,
  }) : super(key: key);

  ClientModel1? client;
  final EventModel? event;

  @override
  _commentViewState createState() => _commentViewState();
}

class _commentViewState extends State<commentView> {
  final _globalKey = GlobalKey<FormState>();

  TextEditingController _comment = TextEditingController();
  CommmentType? _selectedCommmentType;
  CommmentType? _filterCommmentType;

  // late String fk_client;
  // String? nameEnterprise;

  @override
  void initState() {
    // fk_client = widget.client!.idClients.toString();
    // nameEnterprise = widget.client!.nameEnterprise.toString();
    // WidgetsBinding.instance.addPostFrameCallback((_)async {
    //   Provider.of<comment_vm>(context, listen: false)
    //       .getComment(widget.fk_client);
    // });

    _selectedCommmentType;

    super.initState();
  }

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
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            // add task button
            AddManualTaskButton(
              list: commentPublicTypeList,
              clientId: widget.client?.idClients,
            ),
            // add comment
            Form(
              key: _globalKey,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: EditTextFormField(
                          vaild: (value) {
                            if (value!.toString().trim().isEmpty) {
                              return AppStrings.labelEmpty;
                            }
                          },
                          maxline: 3,
                          paddcustom: EdgeInsets.only(
                              top: 20, left: 3, right: 3, bottom: 3),
                          controller: _comment,
                          hintText: 'إضافة تعليق',
                          // keyboardType: TextInputType.multiline,
                        ),
                      ),
                      Consumer<comment_vm>(
                        builder: (context, value, child) {
                          if (value.isloadadd) {
                            return AnimatedPadding(
                              duration: kTabScrollDuration,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
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
                                if (_globalKey.currentState!.validate()) {
                                  _globalKey.currentState!.save();

                                  Provider.of<comment_vm>(context,
                                          listen: false)
                                      .addComment_vm(
                                    {
                                      'content': _comment.text,
                                      'fk_user':
                                          await Provider.of<UserProvider>(
                                                  context,
                                                  listen: false)
                                              .currentUser
                                              .idUser
                                              .toString(),
                                      'fk_client': widget.client!.idClients!,
                                      'fkuser_client': widget.client!.fkUser
                                          .toString(), //صتحب العميل
                                      'nameUser':
                                          widget.client!.nameUser.toString(),
                                      'date_comment':
                                          //Utils.toDateTime(
                                          DateTime.now().toString(),
                                      //),
                                      'nameUser': Provider.of<UserProvider>(
                                              context,
                                              listen: false)
                                          .currentUser
                                          .nameUser,
                                      'img_image': '',
                                      'name_enterprise':
                                          widget.client!.nameEnterprise!,
                                      if (_selectedCommmentType != null)
                                        'type_comment':
                                            _selectedCommmentType?.value,
                                    },
                                    Provider.of<UserProvider>(context,
                                            listen: false)
                                        .currentUser
                                        .img_image,
                                  ).then((value) {
                                    if (value != "error") {
                                      if (widget.event != null &&
                                          isFirstComment) {
                                        context
                                            .read<EventProvider>()
                                            .changeEventToDone(
                                              event: widget.event!,
                                              onLoading: () {},
                                              onSuccess: () => context
                                                  .read<invoice_vm>()
                                                  .updateListInvoiceAfterMarkEventIsDone(
                                                      widget.event!),
                                              onFailure: () {},
                                            );
                                        isFirstComment = false;
                                      }
                                      _comment.text = '';
                                    }
                                  });
                                }
                              },
                              icon: Icon(Icons.send, color: kMainColor));
                        },
                      ),
                    ],
                  ),
                  // add comment type
                  DropdownButtonFormField<CommmentType>(
                    decoration: InputDecoration(labelText: 'نوع التعليق'
                        //  enabledBorder: OutlineInputBorder(
                        //      borderRadius: BorderRadius.circular(12),
                        //      borderSide: BorderSide(width: 2, color: Colors.grey))
                        ),
                    items: CommmentType.values.map((activitySize) {
                      return DropdownMenuItem(
                        child: Text(activitySize.value),
                        value: activitySize,
                      );
                    }).toList(),
                    value: _selectedCommmentType,
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      _selectedCommmentType = value;
                      setState(() {});
                    },
                    validator: (selectedCommmentType) {
                      if (selectedCommmentType?.value.trim().isEmpty ?? true) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            // comments filter
            DropdownButtonFormField<CommmentType>(
              decoration: InputDecoration(labelText: 'نوع التعليق'),
              items: CommmentType.values.map((activitySize) {
                return DropdownMenuItem(
                  child: Text(activitySize.value),
                  value: activitySize,
                );
              }).toList(),
              value: _filterCommmentType,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                Provider.of<comment_vm>(context, listen: false)
                    .filterCommentsByType(value.value);
                _filterCommmentType = value;
                setState(() {});
              },
              validator: (selectedCommentType) {
                if (selectedCommentType?.value.trim().isEmpty ?? true) {
                  return "هذا الحقل مطلوب";
                }
                return null;
              },
            ),
            SizedBox(height: 15),
            // list of comments
            Container(
              height: MediaQuery.of(context).size.height * 0.68,
              child: Consumer<comment_vm>(builder: (context, value, child) {
                if (value.isLoading) {
                  return CustomLoadingIndicator();
                } else if (value.filteredComments.isEmpty) {
                  return Text('لا يوجد تعليقات');
                } else {
                  return ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: value.filteredComments.length,
                    separatorBuilder: (context, index) => SizedBox(height: 4),
                    itemBuilder: (context, index) {
                      return cardcomment(
                        commentmodel: value.filteredComments[index],
                      );
                    },
                  );
                }
              }),
            ),
          ],
        ),
      ),
    ));
  }
}
