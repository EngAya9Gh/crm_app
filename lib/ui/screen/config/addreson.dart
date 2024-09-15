import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../provider/loadingprovider.dart';
import '../../../view_model/typeclient.dart';
import '../../widgets/container_boxShadows.dart';
import '../../widgets/custom_widget/app_card_row.dart';
import '../../widgets/custom_widget/custombutton.dart';
import '../../widgets/custom_widget/text_form.dart';

class addresaon extends StatefulWidget {
  addresaon(
      {required this.nameReason,
      required this.idReason,
      required this.type,
      Key? key})
      : super(key: key);
  String type;
  String? nameReason;
  String? idReason;

  @override
  _addresaonState createState() => _addresaonState();
}

class _addresaonState extends State<addresaon> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController namereson = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    namereson.text =
        widget.nameReason == null ? '' : widget.nameReason.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ClientTypeProvider>(context).isloading,
          child: Form(
            key: _globalKey,
            child: Padding(
              padding:
                  EdgeInsets.only(top: 150, right: 20, left: 20, bottom: 150),
              child: ContainerShadows(
                width: double.infinity,
                //height: 400,
                margin: EdgeInsets.only(),
                padding:
                    EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      AppCardRow(
                          title: widget.type == 'client' ? 'السبب' : 'نوع',
                          value: '*'),
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
                        controller: namereson,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomButton(
                        width: double.infinity,
                        //MediaQuery.of(context).size.width * 0.2,
                        text: 'حفظ',
                        onTap: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            // Provider.of<LoadProvider>(context, listen: false)
                            //     .changebooladdclient(true);
                            if (widget.idReason == null) {
                              Provider.of<ClientTypeProvider>(context,
                                      listen: false)
                                  .addReson_vm({
                                'name_reason': namereson.text,
                                'type': widget.type,
                              }).then((value) => value != "error"
                                      ? clear(context)
                                      : error(context));
                            } else {
                              Provider.of<ClientTypeProvider>(context,
                                      listen: false)
                                  .update_resoan({
                                'name_reason': namereson.text,
                                'type': widget.type,
                              }, widget.idReason.toString()).then((value) =>
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
    namereson.text = "";
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
