

import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/provider/manage_provider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/company_vm.dart';
import 'package:crm_smart/view_model/level_vm.dart';
import 'package:crm_smart/view_model/typeclient.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../constants.dart';
import '../../../view_model/activity_vm.dart';
import 'dart:io';
class updatecompany extends StatefulWidget {
  updatecompany({ required this.nameCompany,required this.idCompany,required this.path_logo,  Key? key}) : super(key: key);
  // String type;
  String? nameCompany;
  String  idCompany;
  String? path_logo;

  @override
  _updatecompanyState createState() => _updatecompanyState();
}

class _updatecompanyState extends State<updatecompany> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController nameractv = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  late File? _myfilelogo=null;

  final _globalKey = GlobalKey<FormState>();
  @override void initState() {
    nameractv.text=widget.nameCompany==null?'':widget.nameCompany.toString();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key:_scaffoldKey,
        body:ModalProgressHUD(
          inAsyncCall: Provider.of<company_vm>(context)
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
                        RowEdit(name: 'المؤسسة', des: '*'),
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
                        SizedBox(height: 5,),

                        RowEdit(name: 'شعار المؤسسة', des: ''),
                        widget. path_logo!=null && widget.path_logo.toString().isNotEmpty ?
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child:
                          Container(
                            height:40,
                            width: 50,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.network(widget.path_logo.toString()),
                              ],
                            ),
                          ),
                        ):Container(),
                        TextFormField(
                          controller: logoController,
                          obscureText: false,
                          cursorColor: Colors.black,
                          onTap: () async{
                            ImagePicker imagePicker = ImagePicker();
                            final pickedImage =
                            await imagePicker.pickImage(
                              source: ImageSource.gallery,
                              imageQuality: 100,);
                            File?   pickedFile = File(pickedImage!.path);
                            setState(() {
                              print(pickedFile.path);
                              _myfilelogo=pickedFile;
                              logoController.text=pickedFile.path;
                            });

                            // _invoice!.path=pickedFile.path;
                          },
                          readOnly: true,
                          decoration: InputDecoration(

                            contentPadding:
                            EdgeInsets.all(2) ,
                            prefixIcon: Icon(
                              Icons.add_photo_alternate,
                              color: kMainColor,
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.black45, fontSize: 16, fontWeight: FontWeight.w500),
                            hintText: '',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: Colors.white)),
                          ),
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
                              if(widget.idCompany==null){
                                Provider.of<company_vm>(context,listen: false)
                                    .update_company({
                                  'name_company':nameractv.text,
                                  // 'type':widget.type,
                                },widget.idCompany,_myfilelogo).then(
                                        (value) =>  value!="error"
                                        ? clear(context)
                                        : error(context)
                                );
                              }
                              else{
                                Provider.of<activity_vm>(context,listen: false)
                                    .update_actv({

                                  'name_activity_type':nameractv.text,
                                  // 'type':widget.type,
                                },widget.idCompany.toString()).then(
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
          ),
        ));
  }

  clear(BuildContext context) {

    // Provider.of<LoadProvider>(context, listen: false)
    //     .changebooladdclient(false);
    nameractv.text="";
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
