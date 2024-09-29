import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/otp/mob_verify_otp_page.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/otp/web_verify_otp_page.dart';
import 'package:crm_smart/features/auth/login/presentation/widgets/web_auth_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common/enums/toast_colors_enum.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/utils/app_dimensions.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../../../../../../ui/widgets/custom_widget/custom_logo.dart';
import '../../manager/login_cubit/login_cubit.dart';
import '../../widgets/verification_number_fields.dart';
import '../../../../../../core/common/helpers/app_snackbar.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final String email = context.read<LoginCubit>().emailController.text;
    return AppScaffold(
      body: AdaptiveLayout(
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('Body Small'),
              builder: (_) => MobVerifyOtpPage(email: email),
            ),
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('Body Medium'),
              builder: (_) => WebVerifyOtpPage(email: email),
            ),
          },
        ),
      ),
    );
  }
}
