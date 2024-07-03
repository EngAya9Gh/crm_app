import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/screen/home/home.dart';
import '../../../../../ui/widgets/custom_widget/customlogo.dart';
import '../../../../app/presentation/pages/not_allowed_page.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../widgets/verification_number_fields.dart';

class VerifyOtpPage extends StatefulWidget {
  VerifyOtpPage({Key? key}) : super(key: key);

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
        if (state is VerifyOtpFailure) {
          AppConstants.showSnackBarAsBottomSheet(context, state.message);
        } else if (state is VerifyOtpSuccess) {
          AppNavigator.pushReplacement(
            state.isActive == '0' ? NotAllowedPage() : Home(),
          );
        }
      },
      child: Scaffold(
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
                      isLoading: state is VerifyOtpLoading,
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
