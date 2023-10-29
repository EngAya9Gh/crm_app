

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
import '../../../view_model/activity_vm.dart';

class addractivity extends StatefulWidget {
  addractivity({ required this.nameActv,required this.idActivity,  Key? key}) : super(key: key);
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
  @override void initState() {
    nameractv.text=widget.nameActv==null?'':widget.nameActv.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<ActivityProvider>(context)
              .isLoading,
          child : Directionality(
            textDirection: TextDirection.rtl,
            child: Form(
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
                        RowEdit(name: 'النشاط', des: '*'),
                        SizedBox(height: 15,),

                        EditTextFormField(
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: nameractv,
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
                              if(widget.idActivity==null){
                                Provider.of<ActivityProvider>(context,listen: false)
                                    .addActivityVm({
                                  'name_activity_type':nameractv.text,
                                 // 'type':widget.type,
                                }).then(
                                        (value) =>  value!="error"
                                        ? clear(context)
                                        : error(context)
                                );
                              }
                              else{
                                Provider.of<ActivityProvider>(context,listen: false)
                                    .updateActivity({

                                  'name_activity_type':nameractv.text,
                                  // 'type':widget.type,
                                },widget.idActivity.toString()).then(
                                        (value) =>  value!="error"
                                        ? clear(context)
                                        : error(context)
                                );
                              }
                            }else {
                              ScaffoldMessenger.of(context).showSnackBar(
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
          ),
        ));
  }

  clear(BuildContext context) {

    // Provider.of<LoadProvider>(context, listen: false)
    //     .changebooladdclient(false);
    nameractv.text="";
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تمت الإضافة بنجاح'))
    );
    Navigator.pop(context);
    //
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('هناك خطأ ما'))
    );

  }
}
