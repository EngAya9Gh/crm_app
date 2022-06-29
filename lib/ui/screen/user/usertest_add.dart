

import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:crm_smart/view_model/regoin_vm.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:crm_smart/view_model/usertest_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class addusertest extends StatefulWidget {
  addusertest({
    this.des_usertest,
    required this.nameusertest,
    required this.idregoin, Key? key}) : super(key: key);
  String? idregoin,nameusertest,des_usertest;

  @override
  _addusertestState createState() => _addusertestState();
}
class _addusertestState extends State<addusertest> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController nameusertest = TextEditingController();
  final TextEditingController desusertest = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override void initState() {

    nameusertest.text=(widget.idregoin==null?''
        :widget.nameusertest)! ;
    desusertest.text=(widget.idregoin==null?''
        :widget.des_usertest)! ;


    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<maincity_vm>(context)
              .isloading,
          child : SingleChildScrollView(
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
                  padding:EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 30) ,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        RowEdit(name: 'العنوان', des: 'REQUIRED'),
                        SizedBox(height: 15,),
                        EditTextFormField(
                          vaild: (value) {
                            if (value!.toString().trim().isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: nameusertest,
                        ),
                        SizedBox(height: 15,),
                        RowEdit(name: 'الوصف', des: 'REQUIRED'),
                        EditTextFormField(
                          maxline: 6,
                          vaild: (value) {
                            if (value!.toString().trim().isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                          hintText: '',
                          controller: desusertest,
                        ),
                        SizedBox(height: 15,),
                        CustomButton(
                          width:double.infinity,
                          //MediaQuery.of(context).size.width * 0.2,
                          text: 'حفظ',
                          onTap: () async {
                            if (_globalKey.currentState!.validate()) {
                              _globalKey.currentState!.save();

                              if(widget.idregoin==null){
                                Provider.of<usertest_vm>(context,listen: false)
                                    .addusertest_vm({
                                  'nameusertest':nameusertest.text,
                                  'des_usertest': desusertest.text,
                                  'fk_country':Provider.of<user_vm_provider>
                                    (context,listen: false).currentUser.fkCountry
                                }).then(
                                        (value) =>  value!="error"
                                        ? clear(context)
                                        : error(context)
                                );}
                              else{
                                Provider.of<usertest_vm>(context,listen: false)
                                    .updateusertest_vm({
                                  'nameusertest':nameusertest.text,
                                  'des_usertest': desusertest.text,
                                },widget.idregoin.toString()).then(
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
    nameusertest.text="";
    desusertest.text="";
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('تمت الإضافة بنجاح'))
    );
    Navigator.pop(context);
    // print("succ");
  }

  error(context) {

    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(content: Text('هناك خطأ ما'))
    );
    print("error");
  }
}
