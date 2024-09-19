import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../manager/login_cubit/login_cubit.dart';
import '../widgets/verification_number_fields.dart';

class VerifyOtpPage extends StatefulWidget {
  const VerifyOtpPage({
    super.key,
    this.email,
  });

  final String? email;

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
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
      listenWhen: (previous, current) =>
          previous.verifyOtpStatus != current.verifyOtpStatus,
      listener: (context, state) async {
        if (state.verifyOtpStatus.isFailed()) {
          AppSnackbar.showSnakeBar(
            state.verifyOtpStatus.error,
            color: ToastColorsEnum.error,
          );
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(
          backgroundColor: Colors.transparent,
          leadingBackgroundColor: AppColors.primaryMain.withOpacity(0.7),
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: loginCubit.otpFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomLogo(),
                AppText(
                  "We have sent a code to ",
                  fontSize: 16,
                ),
                AppText(
                  widget.email,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryMain,
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
                  buildWhen: (previous, current) =>
                      previous.verifyOtpStatus != current.verifyOtpStatus,
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
