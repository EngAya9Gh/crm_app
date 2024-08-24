import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/widgets/custom_widget/customformtext.dart';
import '../../../../../ui/widgets/custom_widget/customlogo.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'verify_otp_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

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
      listenWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus,
      listener: (context, state) {
        if (state.loginStatus.isFailed()) {
          AppSnackbar.showSnakeBar(
            AppStrings.emailError,
            color: ToastColorsEnum.error,
          );
        } else if (state.loginStatus.isSuccess()) {
          AppNavigator.push(VerifyOtpPage());
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
                  icon: Icons.email,
                  con: loginCubit.emailController,
                  maxline: 1,
                  inputType: TextInputType.emailAddress,
                  vaild: InputValidator.validateEmail,
                  hintText: AppStrings.hintEmailText,
                ),
                SizedBox(height: 30),
                BlocBuilder<LoginCubit, LoginState>(
                  buildWhen: (previous, current) =>
                      previous.loginStatus != current.loginStatus,
                  builder: (context, state) {
                    return AppElevatedButton(
                      isLoading: state.loginStatus.isLoading(),
                      text: AppStrings.textButtonCode,
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
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
