
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class addcity extends StatefulWidget {
  addcity({
    this.fkmain,
    required this.nameregoin,
    required this.idregoin, Key? key}) : super(key: key);
    String? idregoin,nameregoin,fkmain;

  @override
  _addcityState createState() => _addcityState();
}
class _addcityState extends State<addcity> {
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
                padding:EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 30) ,
                child: Column(
                  children: [
                    SizedBox(height: 15,),
                    RowEdit(name: 'المدينة', des: 'REQUIRED'),
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
                                .addcity_vm({
                              'name_city':namelevel.text,
                              'fk_maincity': widget.fkmain,
                            }).then(
                                    (value) =>  value!="error"
                                    ? clear(context)
                                    : error(context)
                            );}
                          else{
                            Provider.of<maincity_vm>(context,listen: false)
                                .update_city({
                              'name_city':namelevel.text,
                              'fk_maincity':widget.fkmain,
                              'id_city':widget.idregoin,
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
