import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/widgets/custom_widget/customlogo.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../widgets/verification_number_fields.dart';

class VerifyOtpPage extends StatefulWidget {
  VerifyOtpPage({super.key});

  @override
  _VerifyOtpPageState createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late final LoginCubit loginCubit;

  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) async {
        if (state.verifyOtpStatus.isFailed()) {
          AppSnackbar.showSnakeBar(
            state.verifyOtpStatus.error,
            color: ToastColorsEnum.error,
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(backgroundColor: Colors.transparent),
        backgroundColor: Colors.white,
        body: Form(
          key: loginCubit.otpFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLogo(),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "We have sent a code to ",
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.sp,
                            ),
                      ),
                      TextSpan(
                        text: loginCubit.emailController.text,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                VerificationNumberFields(
                  controller: loginCubit.otpCodeController,
                  validator: (code) {
                    if (_isValidCode(code)) {
                      return AppStrings.messageEmpty;
                    }
                    return null;
                  },
                  onCompleted: (code) async {
                    await loginCubit.verifyOtp(context);
                  },
                  onChanged: (String value) {},
                ),
                SizedBox(height: 30),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return AppElevatedButton(
                      isLoading: state.verifyOtpStatus.isLoading(),
                      text: AppStrings.textButtonCode,
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (loginCubit.otpFormKey.currentState!.validate()) {
                          await loginCubit.verifyOtp(context);
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

  bool _isValidCode(String? code) =>
      (code?.isEmpty ?? true) || code!.length < 5;
}
