

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
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class addmaincity extends StatefulWidget {
  addmaincity({
    required this.nameregoin,
    required this.fkcountry,
    required this.idregoin, Key? key}) : super(key: key);
  String? idregoin,nameregoin,fkcountry;

  @override
  _addmaincityState createState() => _addmaincityState();
}
class _addmaincityState extends State<addmaincity> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController namelevel = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override void initState() {

    namelevel.text=widget.idregoin==null?''
        :widget.nameregoin.toString();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<maincity_vm>(context)
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
                padding:EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 20) ,
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    RowEdit(name: 'المنطقة', des: 'REQUIRED'),
                    SizedBox(height: 15,),

                    EditTextFormField(
                      vaild: (value) {
                        if (value!.toString().trim().isEmpty) {
                          return 'الحقل فارغ';
                        }
                      },
                      hintText: '',
                      controller: namelevel,
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
                            Provider.of<maincity_vm>(context,listen: false)
                                .addmaincity_vm({
                              'namemaincity':namelevel.text,
                              'fk_country':Provider.of<user_vm_provider>
                                (context,listen: false).currentUser.fkCountry.toString(),
                            }).then(
                                    (value) =>  value!="error"
                                    ? clear(context)
                                    : error(context)
                            );}
                          else{
                            Provider.of<maincity_vm>(context,listen: false)
                                .update_maincity({
                              'namemaincity':namelevel.text,
                              'fk_country':widget.fkcountry,
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
                      //child: Text(" حفظ"),
                    ),
                  ],
                ),
              ),

            ),
          ),
        ));
  }

  clear(BuildContext context) {


    namelevel.text="";
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
