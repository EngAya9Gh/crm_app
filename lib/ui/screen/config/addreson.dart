

import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class addresaon extends StatefulWidget {
  addresaon({ required this.nameReason,required this.idReason, required this.type, Key? key}) : super(key: key);
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
  @override void initState() {
    namereson.text=widget.nameReason==null?'':widget.nameReason.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<typeclient>(context)
              .isloading,
          child : Form(
            key: _globalKey,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 150,
                  right: 20,
                  left: 20,bottom: 150),
              child: ContainerShadows(
                width: double.infinity,
                //height: 400,
                margin: EdgeInsets.only(),
                padding:EdgeInsets.only(top: 50,left: 20,right: 20,bottom:20) ,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 15,),
                      RowEdit(name: widget.type=='client'?'السبب':'نوع', des: 'REQUIRED'),
                      SizedBox(height: 15,),

                      EditTextFormField(
                        vaild: (value) {
                          if (value!.isEmpty) {
                            return 'الحقل فارغ';
                          }
                        },
                        hintText: '',
                        controller: namereson,
                      ),
                      SizedBox(height: 15,),
                      CustomButton(
                        width:double.infinity,
                        //MediaQuery.of(context).size.width * 0.2,
                        text: 'حفظ',
                        onTap: () async {
                          if (_globalKey.currentState!.validate()) {
                            _globalKey.currentState!.save();
                            // Provider.of<LoadProvider>(context, listen: false)
                            //     .changebooladdclient(true);
                            if(widget.idReason==null){
                            Provider.of<typeclient>(context,listen: false)
                                .addReson_vm({
                              'name_reason':namereson.text,
                              'type':widget.type,
                            }).then(
                                    (value) =>  value!="error"
                                    ? clear(context)
                                    : error(context)
                            );
                            }
                            else{
                              Provider.of<typeclient>(context,listen: false)
                                  .update_resoan({

                                'name_reason':namereson.text,
                                'type':widget.type,
                              },widget.idReason.toString()).then(
                                      (value) =>  value!="error"
                                      ? clear(context)
                                      : error(context)
                              );
                            }
                          }else {
                            _scaffoldKey.currentState!.showSnackBar(
                                SnackBar(content: Text('الحقل فارغ  '))
                            );
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
    namereson.text="";
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('تمت الإضافة بنجاح'))
    );
    Navigator.pop(context);
    // print("succ");
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('هناك خطأ ما'))
    );
    print("error");
  }
}
