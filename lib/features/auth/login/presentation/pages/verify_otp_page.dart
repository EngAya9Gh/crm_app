import 'package:flutter/material.dart';

class VerifyOtpPage extends StatefulWidget {
  VerifyOtpPage({Key? key}) : super(key: key);

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  String? valueField;
  TextEditingController? _textcontroller = TextEditingController();
  TextEditingController? _code = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  String valEmail = "";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SizedBox();

    // return Scaffold(
    //   key: _scaffoldKey,
    //   backgroundColor: Colors.white,
    //   body: ModalProgressHUD(
    //     inAsyncCall: Provider.of<AuthProvider>(context).isLoading,
    //     child: Directionality(
    //       textDirection: TextDirection.ltr,
    //       child: Padding(
    //         padding: const EdgeInsets.only(bottom: 20, right: 30, left: 30),
    //         //SingleChild
    //         child: Form(
    //           key: _globalKey,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               CustomLogo(),
    //               SizedBox(
    //                 height: 20,
    //               ),
    //               // IconButton(
    //               //     onPressed: () async {
    //               //       user.
    //               //     },
    //               //     icon: Icon(Icons.add)),
    //               CustomFormField(
    //                 textdirehint: TextDirection.ltr,
    //                 read: false,
    //                 radius: 10,
    //                 con: _textcontroller,
    //                 maxline: 1,
    //                 inputType: !val.sendcode ? TextInputType.phone : null,
    //                 vaild: (data) {
    //                   if (data!.isEmpty) {
    //                     return AppStrings.messageEmpty;
    //                   }
    //                   if (val.sendcode) return validateEmail(data.trim());
    //                 },
    //                 hintText: val.sendcode
    //                     ? AppStrings.hintEmailText
    //                     : AppStrings.hintCodeText,
    //                 onChanged: (data) {
    //                   valueField = data;
    //                   valEmail = val.sendcode ? data : valEmail;
    //                 },
    //               ),
    //               SizedBox(height: 30),
    //               // BlocBuilder<LoginCubit, LoginState>(
    //               //   builder: (context, state) {
    //               //     return AppElevatedButton(
    //               //         isLoading: state is LoginLoading,
    //               //         text: val.sendcode
    //               //             ? AppStrings.textButtonCode
    //               //             : AppStrings.textButtonCode2,
    //               //         onPressed: () async {
    //               //           if (_globalKey.currentState!.validate()) {
    //               //             _globalKey.currentState!.save();
    //               //             if (val.sendcode) {
    //               //               context.read<LoginCubit>().sendCode(valEmail);
    //               //             } else {
    //               //               context.read<LoginCubit>().verifyCode(
    //               //                     email: valEmail,
    //               //                     code: valueField,
    //               //                   );
    //               //             }
    //               //           }
    //               //         });
    //               //   },
    //               // ),
    //
    //               CustomButton(
    //                 text: val.sendcode
    //                     ? AppStrings.textButtonCode
    //                     : AppStrings.textButtonCode2,
    //                 onTap: () async {
    //                   if (_globalKey.currentState!.validate()) {
    //                     _globalKey.currentState!.save();
    //                     //
    //
    //                     Provider.of<AuthProvider>(context, listen: false)
    //                         .changeboolValueisLoading(true);
    //                     final email = valEmail.trim();
    //                     final otpCode = valueField?.trim() ?? '';
    //
    //                     String? res =
    //                         await AuthServices().verfiy_otp(email, otpCode);
    //
    //                     if (res != "false") {
    //                       SharedPreferences preferences =
    //                           getIt<SharedPreferences>();
    //                       preferences.setBool(kKeepMeLoggedIn, true);
    //                       String id = jsonDecode(res!)["message"].toString();
    //                       String tk = jsonDecode(res!)["data"]!;
    //                       print('tk');
    //                       print(id);
    //                       print(tk);
    //                       preferences.setString("id_user", id!);
    //                       preferences.setString("token_user", tk);
    //
    //                       // preferences.set("map_clientlist",res!);
    //                       await Provider.of<UserProvider>(context,
    //                               listen: false)
    //                           .getcurrentuser();
    //                       Provider.of<AuthProvider>(context, listen: false)
    //                           .changeboolValueisLoading(false);
    //                       val.changeboolValue();
    //                       Navigator.pushAndRemoveUntil(
    //                           context,
    //                           CupertinoPageRoute(builder: (context) => Home()),
    //                           (rouets) => false);
    //                     } else {
    //                       Provider.of<AuthProvider>(context, listen: false)
    //                           .changeboolValueisLoading(false);
    //
    //                       ScaffoldMessenger.of(context).showSnackBar(
    //                           new SnackBar(
    //                               content:
    //                                   new Text(AppStrings.codeVerifyError)));
    //                     }
    //                   }
    //                 },
    //               )
    //             ],
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
