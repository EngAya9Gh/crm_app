import 'package:crm_smart/provider/authprovider.dart';
import 'package:crm_smart/services/AuthService.dart';
import 'package:crm_smart/ui/screen/home/test_home.dart';
import 'package:crm_smart/ui/screen/product/addproduct.dart';
import 'package:crm_smart/ui/screen/product/productView.dart';
import 'package:crm_smart/ui/screen/selectCountryScreen.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custombutton.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customformtext.dart';
import 'package:crm_smart/ui/widgets/custom_widget/customlogo.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../constants.dart';
import '../../labeltext.dart';
import 'home/home.dart';
import 'mainpage.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
   String? valueField;
   String? textbutton = "send code";
   TextEditingController? _textcontroller=TextEditingController();
   TextEditingController? _code=TextEditingController();
   final _globalKey=GlobalKey<FormState>();
   String valEmail="";
   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

   String? validateEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(email))
      return 'Please make sure your email address is valid';
  }

  @override
  Widget build(BuildContext context) {
    var val= Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<AuthProvider>(context).isLoading,
       child:  Directionality(
         textDirection: TextDirection.ltr,
         child: Padding(
            padding: const EdgeInsets.only(bottom :20, right: 30,left: 30),
            //SingleChild
            child: Form(
              key: _globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomLogo(),
                  SizedBox(height: 20,),
                  CustomFormField(
                   textdirehint: TextDirection.ltr,
                    read: false,
                    radius: 10,
                    con: _textcontroller,
                    vaild: (data) {
                      if (data!.isEmpty) {
                        return message_empty;
                      }
                     if( val.sendcode )return validateEmail(data);
                    },
                    hintText:val.sendcode ? hintEmailText:hintCodeText,
                    onChanged: (data) {
                      valueField = data;
                      valEmail=val.sendcode?data:valEmail ;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                    text: val.sendcode? textbutton_code : textbutton_code2,
                    onTap: () async {
                    if(_globalKey.currentState!.validate()){
                      //print('before ${_textcontroller!.text}');
                      _globalKey.currentState!.save();
                      // print('after ${_textcontroller!.text}');
                      if (val.sendcode) {
                        Provider.of<AuthProvider>(context,listen: false).changeboolValueisLoading(true);

                        if (await AuthServices().send_otp(valEmail.trim())) {
                          _textcontroller!.text="";
                          val.changeboolValue();
                          Provider.of<AuthProvider>(context,listen: false).changeboolValueisLoading(false);

                        }
                        else{
                          Provider.of<AuthProvider>(context,listen: false).changeboolValueisLoading(false);

                          _scaffoldKey.currentState!.showSnackBar(new SnackBar(
                              content: new Text(emailError)
                          ));
                        }
                      }
                      else {
                        print(valEmail);
                        Provider.of<AuthProvider>(context,listen: false).changeboolValueisLoading(true);
                        String? res=await AuthServices().verfiy_otp(valEmail,valueField!);
                        if (res!="false") {
                          SharedPreferences preferences  = await SharedPreferences.getInstance();
                          preferences.setBool(kKeepMeLoggedIn, true);
                          preferences.setString("id_user",res!);
                          // preferences.set("map_clientlist",res!);
                          Provider.of<user_vm_provider>(context, listen: false)
                              .getcurrentuser();
                          Provider.of<AuthProvider>(context,listen: false)
                              .changeboolValueisLoading(false);

                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Home()),
                                 (rouets)=>false);

                        }
                        else{
                          Provider.of<AuthProvider>(context,listen: false).changeboolValueisLoading(false);

                          _scaffoldKey.currentState!.showSnackBar(new SnackBar(
                              content: new Text(codeverifyError)
                          ));
                        }
                      }
                    }},
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
