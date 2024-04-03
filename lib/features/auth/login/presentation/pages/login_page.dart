import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../function_global.dart';
import '../../../../../ui/widgets/custom_widget/customformtext.dart';
import '../../../../../ui/widgets/custom_widget/customlogo.dart';
import '../../../../app/presentation/widgets/app_elvated_button.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'verify_otp_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        print("state is $state");
        if (state is LoginFailure) {
          // AppConstants.showSnakeBar(context, state.message);
          AppConstants.showSnakeBar(context, AppStrings.emailError);
        } else if (state is LoginSuccess) {
          AppNavigator.pushReplacement(VerifyOtpPage());
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: loginCubit.loginFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLogo(),
                SizedBox(height: 20),
                CustomFormField(
                  textdirehint: TextDirection.ltr,
                  read: false,
                  radius: 10,
                  con: loginCubit.emailController,
                  maxline: 1,
                  inputType: TextInputType.emailAddress,
                  vaild: (data) {
                    if (data!.isEmpty) {
                      return AppStrings.messageEmpty;
                    }
                    return validateEmail(data.trim());
                  },
                  hintText: AppStrings.hintEmailText,
                ),
                SizedBox(height: 30),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    print("state is => $state");
                    return AppElevatedButton(
                      isLoading: state is LoginLoading,
                      text: AppStrings.textButtonCode,
                      onPressed: () async {
                        if (loginCubit.loginFormKey.currentState!.validate()) {
                          await loginCubit.login();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
