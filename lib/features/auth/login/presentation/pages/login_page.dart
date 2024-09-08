import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
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
          print("Success");
          AppRouter.push(VerifyOtpPage().toString());
        }
      },
      child: AppScaffold(
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
                AppTextField(
                  prefixIcon: AppIcon(
                    Icons.email,
                    color: AppColors.primaryColor,
                  ),
                  inputType: TextInputType.emailAddress,
                  hintText: AppStrings.hintEmailText,
                  controller: loginCubit.emailController,
                  textDirection: TextDirection.ltr,
                  validator: InputValidator.validateEmail,
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
