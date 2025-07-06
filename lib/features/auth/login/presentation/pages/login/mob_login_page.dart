import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_text_field.dart.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_icon.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../../manager/login_cubit/login_cubit.dart';
import '../otp/verify_otp_page.dart';

class MobLoginPage extends StatefulWidget {
  MobLoginPage({super.key});

  @override
  _MobLoginPageState createState() => _MobLoginPageState();
}

class _MobLoginPageState extends State<MobLoginPage> {
  late final LoginCubit loginCubit;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // متغيرات جديدة
  bool showTelegramField = false;
  bool isSavingTelegram = false;
  TextEditingController telegramController = TextEditingController();
  String? telegramError;

  @override
  void initState() {
    loginCubit = context.read<LoginCubit>();
    super.initState();
  }

  // دالة لحفظ اسم التلغرام
  Future<void> saveTelegramUsername() async {
    setState(() {
      isSavingTelegram = true;
      telegramError = null;
    });
    final email = loginCubit.emailController.text;
    final telegramUsername = telegramController.text.trim();
    if (telegramUsername.isEmpty) {
      setState(() {
        telegramError = 'يرجى إدخال اسم مستخدم التلغرام';
        isSavingTelegram = false;
      });
      return;
    }
    try {
      // استبدل هذا باستدعاء الريبو أو الداتا سورس المناسب لديك
      final response =
          await loginCubit.saveTelegramUsername(email, telegramUsername);
      if (response.success == true) {
        setState(() {
          showTelegramField = false;
        });
        AppSnackbar.showSnakeBar(
          'تم حفظ اسم مستخدم التلغرام بنجاح',
          color: ToastColorsEnum.success,
        );
      } else {
        setState(() {
          telegramError = response.message ?? 'حدث خطأ ما';
        });
      }
    } catch (e) {
      setState(() {
        telegramError = 'حدث خطأ أثناء الحفظ';
      });
    } finally {
      setState(() {
        isSavingTelegram = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus,
      listener: (context, state) {
        if (state.loginStatus.isFailed()) {
          // تحقق من رسالة الخطأ
          if (state.loginStatus.error == 'add telegram username' ||
              (state.loginStatus.error
                      ?.toString()
                      .contains('add telegram username') ??
                  false)) {
            setState(() {
              showTelegramField = true;
            });
          } else {
            AppSnackbar.showSnakeBar(
              state.loginStatus.error,
              color: ToastColorsEnum.error,
            );
          }
        } else if (state.loginStatus.isSuccess()) {
          AppNavigator.go(
            VerifyOtpPage(),
            name: AppRoutesNames.generalRoutes.otp,
            extra: loginCubit.emailController.text,
          );
        }
      },
      child: AppScaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: loginFormKey,
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
                    color: AppColors.primaryMain,
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
                    return !showTelegramField
                        ? AppElevatedButton(
                            isLoading: state.loginStatus.isLoading(),
                            text: AppStrings.textButtonCode,
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (loginFormKey.currentState!.validate()) {
                          await loginCubit.login();
                        }
                            },
                          )
                        : const SizedBox();
                  },
                ),
                // حقل التلغرام وزر الحفظ
                if (showTelegramField) ...[
                  SizedBox(height: 20),
                  AppTextField(
                    prefixIcon: AppIcon(
                      Icons.telegram,
                      color: AppColors.primaryMain,
                    ),
                    hintText: 'اسم مستخدم التلغرام',
                    controller: telegramController,
                    textDirection: TextDirection.ltr,
                    validator: (_) => telegramError,
                  ),
                  SizedBox(height: 10),
                  AppElevatedButton(
                    isLoading: isSavingTelegram,
                    text: 'حفظ اسم التلغرام',
                    onPressed: isSavingTelegram ? null : saveTelegramUsername,
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
