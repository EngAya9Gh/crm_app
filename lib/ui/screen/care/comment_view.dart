import 'package:crm_smart/model/clientmodel.dart';
import 'package:crm_smart/ui/screen/care/card_comment.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/comment.dart';
import 'package:crm_smart/view_model/invoice_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/enums/comment_type.dart';
import '../../../constants.dart';
import '../../../core/utils/app_strings.dart';
import '../../../features/task_management/presentation/manager/task_cubit.dart';
import '../../../features/task_management/presentation/widgets/add_manual_task_button.dart';
import '../../../model/calendar/event.dart';
import '../../../view_model/event_provider.dart';

class commentView extends StatefulWidget {
  commentView({
    required this.client,
    Key? key,
    this.event,
  }) : super(key: key);

  ClientModel1? client;
  final Event? event;

  @override
  _commentViewState createState() => _commentViewState();
}

class _commentViewState extends State<commentView> {
  final _globalKey = GlobalKey<FormState>();

  TextEditingController _comment = TextEditingController();
  CommmentType? _selectedCommmentType;
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
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListView(children: [
            AddManualTaskButton(
              list: commentPublicTypeList,
              clientId: widget.client?.idClients,
            ),
            Column(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Form(
                        key: _globalKey,
                        child: Column(
                          children: [
                            EditTextFormField(
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

                            //  SizedBox(height: 4),
                            // RowEdit(name: 'نوع التعليق', des: '*'),
                            // SizedBox(height: 4),
                            DropdownButtonFormField<CommmentType>(
                              decoration: InputDecoration(
                                  labelText: 'نوع التعليق'
                                  //  enabledBorder: OutlineInputBorder(
                                  //      borderRadius: BorderRadius.circular(12),
                                  //      borderSide: BorderSide(width: 2, color: Colors.grey))
                                  ),
                              isExpanded: true,
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
                                if (selectedCommmentType?.value
                                        .trim()
                                        .isEmpty ??
                                    true) {
                                  return "هذا الحقل مطلوب";
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
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

                                Provider.of<comment_vm>(context, listen: false)
                                    .addComment_vm(
                                  {
                                    'content': _comment.text,
                                    'fk_user': await Provider.of<UserProvider>(
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
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.68,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8, right: 8, top: 10.0, bottom: 5),
                child: Consumer<comment_vm>(builder: (context, value, child) {
                  return value.isLoading
                      ? Center(child: CircularProgressIndicator.adaptive())
                      : value.listComments.isNotEmpty && value.isLoading
                          ? Center(child: CircularProgressIndicator.adaptive())
                          : value.listComments.length == 0
                              ? Text('')
                              : Column(
                                  children: [
                                    Expanded(
                                      child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: value.listComments.length,
                                          itemBuilder: (context, index) {
                                            return SingleChildScrollView(
                                                child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(2),
                                                    child:
                                                        //Text(''),
                                                        cardcomment(
                                                      commentmodel: value
                                                          .listComments[index],
                                                    )));
                                          }),
                                    ),
                                  ],
                                );
                }),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
