import 'package:crm_smart/core/common/widgets/app_adaptive_builder.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/otp/mob_verify_otp_page.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/otp/web_verify_otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../manager/login_cubit/login_cubit.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = context.read<LoginCubit>().emailController.text;
    return AppScaffold(
      body: AppLayoutBuilder(
        smallBuilder: (context) => MobVerifyOtpPage(email: email),
        mediumBuilder: (context) => WebVerifyOtpPage(email: email),
      ),
    );
  }
}
