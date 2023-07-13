

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
import '../../../view_model/participate_vm.dart';

class addParticipate extends StatefulWidget {
  addParticipate({
    required this.name_participate,
    required this.id_participate,
    required this.mobile_participate,
    required this.namebank_participate,
    required this.numberbank_participate,

    Key? key}) : super(key: key);
  // String type;
  String? name_participate;
  String? id_participate;
  String? mobile_participate;
  String? namebank_participate;
  String? numberbank_participate;

  @override
  _addParticipateState createState() => _addParticipateState();
}

class _addParticipateState extends State<addParticipate> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController name_participate = TextEditingController();
  final TextEditingController mobile_participate = TextEditingController();
  final TextEditingController namebank_participate = TextEditingController();
  final TextEditingController numberbank_participate = TextEditingController();

  final _globalKey = GlobalKey<FormState>();
  @override void initState() {
    name_participate.text=widget.name_participate==null?'':widget.name_participate.toString();
    mobile_participate.text=widget.mobile_participate==null?'':widget.mobile_participate.toString();
    namebank_participate.text=widget.namebank_participate==null?'':widget.namebank_participate.toString();
    numberbank_participate.text=widget.numberbank_participate==null?'':widget.numberbank_participate.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<participate_vm>(context)
              .isloading,
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
                        RowEdit(name: 'اسم المتعاون', des: '*'),
                        SizedBox(height: 15,),

                        EditTextFormField(
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: name_participate,
                        ),
                        SizedBox(height: 15,),
                        RowEdit(name: 'رقم المتعاون', des: '*'),
                        SizedBox(height: 15,),

                        EditTextFormField(
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: mobile_participate,
                        ),
                        SizedBox(height: 15,),
                        RowEdit(name: 'بنك المتعاون', des: '*'),
                        SizedBox(height: 15,),

                        EditTextFormField(
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: namebank_participate,
                        ),
                        SizedBox(height: 15,),
                        RowEdit(name: 'رقم بنك المتعاون', des: '*'),
                        SizedBox(height: 15,),

                        EditTextFormField(
                          vaild: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: numberbank_participate,
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
                              if(widget.id_participate==null){
                                Provider.of<participate_vm>(context,listen: false)
                                    .addparticipate_vm({
                                  'name_participate':name_participate.text,
                                  'mobile_participate':mobile_participate.text,
                                  'namebank_participate':namebank_participate.text,
                                  'numberbank_participate':numberbank_participate.text,
                                  // 'type':widget.type,
                                }).then(
                                        (value) =>  value!="error"
                                        ? clear(context)
                                        : error(context)
                                );
                              }
                              else{
                                Provider.of<participate_vm>(context,listen: false)
                                    .update_participate({
                                  'name_participate':name_participate.text,
                                  'mobile_participate':mobile_participate.text,
                                  'namebank_participate':namebank_participate.text,
                                  'numberbank_participate':numberbank_participate.text,

                                },widget.id_participate.toString()).then(
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
    // nameractv.text="";
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تمت الإضافة بنجاح'))
    );
    Navigator.pop(context);
    // print("succ");
  }

  error(context) {
    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('هناك خطأ ما'))
    );
    print("error");
  }
}
