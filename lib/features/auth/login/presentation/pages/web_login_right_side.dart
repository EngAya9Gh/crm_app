import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/web_verfiy_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_copyrights_widget.dart';
import '../../../../../core/common/widgets/app_icon.dart';
import '../../../../../core/common/widgets/web/web_elevated_button.dart';
import '../../../../../core/common/widgets/web/web_text_field.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'verify_otp_page.dart';

class WebLoginRightSide extends StatefulWidget {
  WebLoginRightSide({super.key});

  @override
  _WebLoginRightSideState createState() => _WebLoginRightSideState();
}

class _WebLoginRightSideState extends State<WebLoginRightSide> {
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
          AppNavigator.go(
            VerifyOtpPage(),
            name: AppRoutesNames.generalRoutes.otp,
            extra: loginCubit.emailController.text,
          );
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 87.scaleWidth),
            child: Form(
              key: loginCubit.loginFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  144.vertical,
                  CustomLogo(height: 100.scaleHeight),
                  25.vertical,
                  AppText(
                    'تسجيل الدخول',
                    style: AppStyles.large,
                  ),
                  16.vertical,
                  AppText(
                    'مرحبا بك في نظام إدارة العملاء',
                    style: AppStyles.regular20.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  32.vertical,
                  WebTextField(
                    title: 'البريد الإلكتروني',
                    prefixIcon: AppIcon(
                      Icons.email_outlined,
                      color: AppColors.iconColor,
                    ),
                    inputType: TextInputType.emailAddress,
                    hintText: "البريد الإلكتروني",
                    controller: loginCubit.emailController,
                    textDirection: TextDirection.ltr,
                    validator: InputValidator.validateEmail,
                  ),
                  32.vertical,
                  BlocBuilder<LoginCubit, LoginState>(
                    buildWhen: (previous, current) =>
                        previous.loginStatus != current.loginStatus,
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: WebElevatedButton(
                          text: "ارسال",
                          isLoading: state.loginStatus.isLoading(),
                          onPressed: () async {
                            FocusManager.instance.primaryFocus?.unfocus();
                            if (loginCubit.loginFormKey.currentState!
                                .validate()) {
                              print(
                                  "email is => ${loginCubit.emailController.text}");
                              await loginCubit.login();
                            }
                          },
                        ),
                      );
                    },
                  ),
                  Spacer(),
                  AppCopyrightsWidget(),
                  27.vertical
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
