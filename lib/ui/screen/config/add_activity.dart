import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/custom_app_bar.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/common/widgets/app_scaffold.dart';
import '../../../provider/loadingprovider.dart';
import '../../../view_model/activity_vm.dart';
import '../../widgets/custom_widget/custombutton.dart';
import '../../widgets/custom_widget/text_form.dart';

class addractivity extends StatefulWidget {
  addractivity({required this.nameActv, required this.idActivity, Key? key})
      : super(key: key);

  // String type;
  String? nameActv;
  String? idActivity;

  @override
  _addActvState createState() => _addActvState();
}

class _addActvState extends State<addractivity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController nameractv = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    nameractv.text = widget.nameActv == null ? '' : widget.nameActv.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(title: 'النشاط'),
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ActivityProvider>(context).isLoading,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: AppCardContainer(
                child: Form(
                  key: _globalKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      AppText('النشاط'),
                      SizedBox(
                        height: 15,
                      ),
                      EditTextFormField(
                        vaildator: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ';
                          }
                        },
                        hintText: '',
                        controller: nameractv,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        width: double.infinity,
                        //MediaQuery.of(context).size.width * 0.2,
                        text: 'حفظ',
                        onPressed: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            // Provider.of<LoadProvider>(context, listen: false)
                            //     .changebooladdclient(true);
                            if (widget.idActivity == null) {
                              Provider.of<ActivityProvider>(context,
                                      listen: false)
                                  .addActivityVm({
                                'name_activity_type': nameractv.text,
                                // 'type':widget.type,
                              }).then((value) => value != "error"
                                      ? clear(context)
                                      : error(context));
                            } else {
                              Provider.of<ActivityProvider>(context,
                                      listen: false)
                                  .updateActivity({
                                'name_activity_type': nameractv.text,
                                // 'type':widget.type,
                              }, widget.idActivity.toString()).then((value) =>
                                      value != "error"
                                          ? clear(context)
                                          : error(context));
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('الحقل فارغ  ')));
                          }
                        },
                        //child: Text(" حفظ"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  clear(BuildContext context) {
    // Provider.of<LoadProvider>(context, listen: false)
    //     .changebooladdclient(false);
    nameractv.text = "";
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('تمت الإضافة بنجاح')));
    Navigator.pop(context);
    //
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('هناك خطأ ما')));
  }
}
