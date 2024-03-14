import 'dart:io';

import 'package:crm_smart/provider/loadingprovider.dart';
import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/company_vm.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';

class addcompany extends StatefulWidget {
  addcompany({Key? key}) : super(key: key);
  // String type;
  // String? nameCompany;

  @override
  _addcompanyState createState() => _addcompanyState();
}

class _addcompanyState extends State<addcompany> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final TextEditingController nameractv = TextEditingController();
  final TextEditingController logoController = TextEditingController();
  late File? _myfilelogo = null;

  final _globalKey = GlobalKey<FormState>();
  @override
  void initState() {
    // nameractv.text=widget.nameCompany==null?'':widget.nameCompany.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<CompanyProvider>(context).isloading,
          child: Directionality(
            textDirection: TextDirection.rtl,
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
                      EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 50),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        RowEdit(name: 'المؤسسة', des: '*'),
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
                          height: 5,
                        ),
                        RowEdit(name: 'شعار المؤسسة', des: ''),
                        TextFormField(
                          controller: logoController,
                          obscureText: false,
                          cursorColor: Colors.black,
                          onTap: () async {
                            ImagePicker imagePicker = ImagePicker();
                            final pickedImage = await imagePicker.pickImage(
                              source: ImageSource.gallery,
                              imageQuality: 100,
                            );
                            File? pickedFile = File(pickedImage!.path);
                            setState(() {
                              _myfilelogo = pickedFile;
                              logoController.text = pickedFile.path;
                            });

                            // _invoice!.path=pickedFile.path;
                          },
                          readOnly: true,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(2),
                            prefixIcon: Icon(
                              Icons.add_photo_alternate,
                              color: kMainColor,
                            ),
                            hintStyle: const TextStyle(
                                color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            hintText: '',
                            filled: true,
                            fillColor: Colors.grey.shade200,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                          ),
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

                              Provider.of<CompanyProvider>(context,
                                      listen: false)
                                  .addCompany_vm({
                                'name_company': nameractv.text,
                                // 'type':widget.type,
                              }, _myfilelogo).then((value) => value != "error"
                                      ? clear(context)
                                      : error(context));
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
