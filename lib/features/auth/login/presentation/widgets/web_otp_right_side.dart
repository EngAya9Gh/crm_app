import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../core/common/widgets/app_copyrights_widget.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/common/widgets/custom_app_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../manager/login_cubit/login_cubit.dart';
import 'verification_number_fields.dart';

class WebOtpRightSide extends StatefulWidget {
  const WebOtpRightSide({
    super.key,
    this.email,
  });

  final String? email;

  @override
  State<WebOtpRightSide> createState() => _WebOtpRightSideState();
}

class _WebOtpRightSideState extends State<WebOtpRightSide> {
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
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: AppScaffold(
          appBar: CustomAppBar(
            backgroundColor: Colors.transparent,
            leadingBackgroundColor: AppColors.primaryMain.withOpacity(0.7),
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 87.scaleWidth),
              child: Form(
                key: loginCubit.otpFormKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(),
                    CustomLogo(height: 100.scaleHeight),
                    25.vertical,
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppText(
                        'تأكيد الكود',
                        style: AppStyles.large,
                      ),
                    ),
                    25.vertical,
                    AppText(
                      "لقد قمنا بإرسال كود إلى",
                      style: AppStyles.regular20.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    AppText(
                      widget.email,
                      style: AppStyles.regular20.copyWith(
                        color: AppColors.primaryMain,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    32.vertical,
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
                    32.vertical,
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.verifyOtpStatus != current.verifyOtpStatus,
                      builder: (context, state) {
                        return SizedBox(
                          width: double.infinity,
                          child: AppElevatedButton(
                            text: "تأكيد",
                            isLoading: state.verifyOtpStatus.isLoading(),
                            onPressed: () async {
                              FocusManager.instance.primaryFocus?.unfocus();
                              if (loginCubit.otpFormKey.currentState!
                                  .validate()) {
                                await loginCubit.verifyOtp(context);
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
          }),
        ),
      ),
    );
  }

  bool _isValidCode(String? code) =>
      (code?.isEmpty ?? true) || code!.length < 5;
}
