import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/config/navigator/app_routes_names.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/otp/mob_verify_otp_page.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/otp/web_verify_otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

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
import '../pages/otp/verify_otp_page.dart';

class WebLoginRightSide extends StatefulWidget {
  WebLoginRightSide({super.key});

  @override
  _WebLoginRightSideState createState() => _WebLoginRightSideState();
}

class _WebLoginRightSideState extends State<WebLoginRightSide> {
  late final LoginCubit loginCubit;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // متغيرات التلغرام
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

  // @override
  // void dispose() {
  //   loginFormKey=GlobalKey<FormState>();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus,
      listener: (context, state) {
        if (state.loginStatus.isFailed()) {
          // تحقق من رسالة الخطأ للتلغرام
          if (
          (state.loginStatus.error
              ?.toString()
        .contains('chat_id is empty') ??
    false)||

    (state.loginStatus.error
        ?.toString()
        .contains('add telegram username') ??
    false)) {

    // استخراج اسم المستخدم من رسالة الخطأ
    final errorMessage = state.loginStatus.error?.toString() ?? '';
    final extractedUsername = InputValidator.extractUsernameFromError(errorMessage);

    setState(() {
    showTelegramField = true;
    // تعبئة الحقل باسم المستخدم المستخرج إذا وجد
    if (extractedUsername != null) {
    telegramController.text = extractedUsername;
    }
    });

    AppSnackbar.showSnakeBar(
    'تحقق من صحة اسم يوزر التلغرام وتحقق من تسجيلك بشكل صحيح على البوت',
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
              key: loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(),
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
                  // حقل التلغرام وزر الحفظ
                  if (showTelegramField) ...[
                    WebTextField(
                      title: 'اسم مستخدم التلغرام',
                      prefixIcon: AppIcon(
                        Icons.telegram,
                        color: AppColors.iconColor,
                      ),
                      hintText: "اسم مستخدم التلغرام@",
                      controller: telegramController,
                      textDirection: TextDirection.ltr,
                      validator: (_) => telegramError,
                    ),
                    SizedBox(height: 10),
                    // رابط البوت التلغرام
                    GestureDetector(
                      onTap: () async {
                        final telegramUrl = 'https://t.me/SMARTCRMABOT';
                        final telegramAppUrl = 'tg://resolve?domain=SMARTCRMABOT';

                        try {
                          // محاولة فتح في تطبيق التلغرام أولاً
                          bool launched = false;

                          // جرب فتح في تطبيق التلغرام
                          if (await canLaunchUrl(Uri.parse(telegramAppUrl))) {
                            launched = await launchUrl(
                              Uri.parse(telegramAppUrl),
                              mode: LaunchMode.externalApplication,
                            );
                          }

                          // إذا فشل، جرب الرابط العادي
                          if (!launched && await canLaunchUrl(Uri.parse(telegramUrl))) {
                            launched = await launchUrl(
                              Uri.parse(telegramUrl),
                              mode: LaunchMode.externalApplication,
                            );
                          }

                          // إذا فشل كلاهما، جرب فتح في المتصفح
                          if (!launched) {
                            launched = await launchUrl(
                              Uri.parse(telegramUrl),
                              mode: LaunchMode.platformDefault,
                            );
                          }

                          if (!launched) {
                            AppSnackbar.showSnakeBar(
                              'لا يمكن فتح الرابط. تأكد من تثبيت تطبيق التلغرام أو المتصفح',
                              color: ToastColorsEnum.error,
                            );
                          }
                        } catch (e) {
                          print('Error launching URL: $e');
                          AppSnackbar.showSnakeBar(
                            'حدث خطأ أثناء فتح الرابط. حاول مرة أخرى',
                            color: ToastColorsEnum.error,
                          );
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                        decoration: BoxDecoration(
                          color: AppColors.primaryMain.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: AppColors.primaryMain, width: 1.5),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppIcon(
                              Icons.telegram,
                              color: AppColors.primaryMain,
                              size: 24,
                            ),
                            SizedBox(width: 12),
                            AppText(
                              '@SMARTCRMABOT',
                              style: TextStyle(
                                color: AppColors.primaryMain,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.open_in_new,
                              color: AppColors.primaryMain,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    AppText(
                      'انقر على الرابط أعلاه للانتقال إلى بوت التلغرام',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    32.vertical,
                    SizedBox(
                      width: double.infinity,
                      child: WebElevatedButton(
                        text: "حفظ اسم التلغرام",
                        isLoading: isSavingTelegram,
                        onPressed:
                            isSavingTelegram ? null : saveTelegramUsername,
                      ),
                    ),
                  ] else
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
                              if (loginFormKey.currentState!.validate()) {
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
