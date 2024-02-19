import 'dart:convert';

import 'package:crm_smart/provider/authprovider.dart';
import 'package:crm_smart/services/AuthService.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customlogo.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';
import '../../core/utils/app_strings.dart';
import '../../function_global.dart';
import 'home/home.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  String? valueField;
  String? textbutton = "send code";
  TextEditingController? _textcontroller = TextEditingController();
  TextEditingController? _code = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  String valEmail = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var val = Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<AuthProvider>(context).isLoading,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
            //SingleChild
            child: Form(
              key: _globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLogo(),
                  SizedBox(
                    height: 20,
                  ),
                  // IconButton(
                  //     onPressed: () async {
                  //       user.
                  //     },
                  //     icon: Icon(Icons.add)),
                  CustomFormField(
                    textdirehint: TextDirection.ltr,
                    read: false,
                    radius: 10,
                    con: _textcontroller,
                    maxline: 1,
                    inputType: !val.sendcode ? TextInputType.phone : null,
                    vaild: (data) {
                      if (data!.isEmpty) {
                        return AppStrings.messageEmpty;
                      }
                      if (val.sendcode) return validateEmail(data.trim());
                    },
                    hintText: val.sendcode
                        ? AppStrings.hintEmailText
                        : AppStrings.hintCodeText,
                    onChanged: (data) {
                      valueField = data;
                      valEmail = val.sendcode ? data : valEmail;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: val.sendcode
                        ? AppStrings.textButtonCode
                        : AppStrings.textButtonCode2,
                    onTap: () async {
                      if (_globalKey.currentState!.validate()) {
                        _globalKey.currentState!.save();
                        //
                        if (val.sendcode) {
                          Provider.of<AuthProvider>(context, listen: false)
                              .changeboolValueisLoading(true);

                          final email = valEmail.trim();
                          if (await AuthServices().send_otp(email)) {
                            _textcontroller!.text = "";
                            val.changeboolValue();
                            Provider.of<AuthProvider>(context, listen: false)
                                .changeboolValueisLoading(false);
                            FocusScope.of(context).unfocus();
                          } else {
                            Provider.of<AuthProvider>(context, listen: false)
                                .changeboolValueisLoading(false);

                            ScaffoldMessenger.of(context).showSnackBar(
                                new SnackBar(
                                    content: new Text(AppStrings.emailError)));
                          }
                        } else {
                          Provider.of<AuthProvider>(context, listen: false)
                              .changeboolValueisLoading(true);
                          final email = valEmail.trim();
                          final otpCode = valueField?.trim() ?? '';

                          String? res =
                              await AuthServices().verfiy_otp(email, otpCode);

                          if (res != "false") {
                            SharedPreferences preferences =
                                await SharedPreferences.getInstance();
                            preferences.setBool(kKeepMeLoggedIn, true);
                            String id = jsonDecode(res!)["message"].toString();
                            String tk = jsonDecode(res!)["data"]!;
                            print('tk');
                            print(id);
                            print(tk);
                            preferences.setString("id_user", id!);
                            preferences.setString("token_user", tk);

                            // preferences.set("map_clientlist",res!);
                            await Provider.of<UserProvider>(context,
                                    listen: false)
                                .getcurrentuser();
                            Provider.of<AuthProvider>(context, listen: false)
                                .changeboolValueisLoading(false);
                            val.changeboolValue();
                            Navigator.pushAndRemoveUntil(
                                context,
                                CupertinoPageRoute(
                                    builder: (context) => Home()),
                                (rouets) => false);
                          } else {
                            Provider.of<AuthProvider>(context, listen: false)
                                .changeboolValueisLoading(false);

                            ScaffoldMessenger.of(context).showSnackBar(
                                new SnackBar(
                                    content:
                                        new Text(AppStrings.codeVerifyError)));
                          }
                        }
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
