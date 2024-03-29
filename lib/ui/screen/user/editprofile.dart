import 'dart:io';

import 'package:crm_smart/ui/widgets/container_boxShadows.dart';
import 'package:crm_smart/ui/widgets/custom_widget/row_edit.dart';
import 'package:crm_smart/ui/widgets/custom_widget/text_form.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../core/utils/app_strings.dart';
import 'image_profile.dart';

class edit_profile extends StatefulWidget {
  edit_profile({Key? key}) : super(key: key);

  @override
  _edit_profileState createState() => _edit_profileState();
}

class _edit_profileState extends State<edit_profile> {
  final TextEditingController nameuserController = TextEditingController();

  final TextEditingController mobileController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final _globalKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    nameuserController.text = Provider.of<UserProvider>(context, listen: false)
        .currentUser
        .nameUser
        .toString();
    mobileController.text = Provider.of<UserProvider>(context, listen: false)
        .currentUser
        .mobile
        .toString();
    emailController.text = Provider.of<UserProvider>(context, listen: false)
        .currentUser
        .email
        .toString();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameuserController.dispose();
    mobileController.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (_globalKey.currentState!.validate()) {
                _globalKey.currentState!.save();
                // Provider.of<LoadProvider>(context, listen: false)
                //     .changeboolUpdateUser(true);
                Map<String, String?> body = {
                  'email':
                      emailController.text != null ? emailController.text : "",
                  'nameUser': nameuserController.text,
                  'mobile': mobileController.text != null
                      ? mobileController.text
                      : "",
                  // //'fk_country': id_country,
                  // 'type_administration':
                  // namemanage != null ? namemanage : "",
                  // 'type_level': fklevel,
                  // 'fk_regoin': fkregoin != null ? fkregoin : "null",
                  // 'name_regoin':regoinname,
                  // 'name_level' :levelname,
                };
                Provider.of<UserProvider>(context, listen: false).updateUserVm(
                    body,
                    Provider.of<UserProvider>(context, listen: false)
                        .currentUser
                        .idUser,
                    Provider.of<UserProvider>(context, listen: false)
                            .currentUser
                            .path!
                            .isNotEmpty
                        ? File(Provider.of<UserProvider>(context, listen: false)
                            .currentUser
                            .path!)
                        : null);
                //.then((value) => value != "error" //   ?
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(AppStrings.labelEditUser)));
                Navigator.pop(context);

                //   // : error());
                // } else {
                //   _scaffoldKey.currentState!.showSnackBar(SnackBar(
                //       content: Text('حدد مستوى للصلاحية من فضلك')));
              }
            },
            icon: const Icon(
              Icons.check,
              color: kWhiteColor,
            ),
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<UserProvider>(context, listen: true).isUpdate,
        child: SingleChildScrollView(
          child: ContainerShadows(
            width: double.infinity,
            padding: EdgeInsets.only(
                top: 50,
                right: 20,
                left: 20,
                bottom:
                    50), // EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            margin: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: ImageProfile(),
                  ),
                  Form(
                    key: _globalKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        RowEdit(name: 'Name', des: ''),
                        SizedBox(
                          height: 2,
                        ),

                        EditTextFormField(
                          hintText: 'Name',
                          obscureText: false,
                          controller: nameuserController,
                          vaildator: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                        ),

                        RowEdit(name: 'Email', des: ''),
                        SizedBox(
                          height: 2,
                        ),

                        EditTextFormField(
                          hintText: 'Email',
                          obscureText: false,
                          controller: emailController,
                          vaildator: (value) {
                            if (value!.isEmpty) {
                              return 'الحقل فارغ';
                            }
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        SizedBox(
                          height: 20,
                        ),

                        RowEdit(name: AppStrings.labelMobile, des: ''),
                        EditTextFormField(
                          hintText: '+966',
                          obscureText: false,
                          controller: mobileController,
                        ),
                        //RowEdit(name: 'Image', des: ''),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                  //show chose image

                  // Center(
                  //   child: TextButton(
                  //       // style: ButtonStyle(backgroundColor:Color(Colors.lightBlue)),
                  //       onPressed: () {
                  //
                  //       },
                  //       child: Text(
                  //         'تعديل ',
                  //         style: TextStyle(color: kMainColor),
                  //       )),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
