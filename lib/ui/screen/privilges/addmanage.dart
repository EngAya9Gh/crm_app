

import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';

class addmanage extends StatefulWidget {
  addmanage({
    required this.name_mange,
    required this.fk_country,
    required this.idmange, Key? key}) : super(key: key);
  String? idmange,name_mange,fk_country;

  @override
  _addmanageState createState() => _addmanageState();
}

class _addmanageState extends State<addmanage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController namelevel = TextEditingController();

  final _globalKey = GlobalKey<FormState>();

  @override void initState() {

    namelevel.text=widget.name_mange==null?'':widget.name_mange.toString();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<LoadProvider>(context)
              .isLoadingAddclient,
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
                padding:EdgeInsets.only(top: 50,left: 20,right: 20) ,
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    RowEdit(name: 'الإدارات', des: 'REQUIRED'),
                    SizedBox(height: 15,),

                    EditTextFormField(
                      vaild: (value) {
                        if (value!.isEmpty) {
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
                          Provider.of<LoadProvider>(context, listen: false)
                              .changebooladdclient(true);
                          if(widget.name_mange==null){
                          Provider.of<manage_provider>(context,listen: false)
                              .addmanage_vm({
                            'name_mange':namelevel.text
                          }).then(
                                  (value) =>  value!="error"
                                  ? clear(context)
                                  : error(context)
                          );}
                          else{
                            Provider.of<manage_provider>(context,listen: false)
                                .update_manage({
                              'fk_country':widget.fk_country,
                              'name_mange':namelevel.text
                            },widget.idmange.toString()).then(
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

    Provider.of<LoadProvider>(context, listen: false)
        .changebooladdclient(false);
    namelevel.text="";
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
