import 'package:crm_smart/features/auth/login/presentation/pages/verify_otp_page.dart';
import 'package:crm_smart/features/auth/login/presentation/pages/web_login_right_side.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_dimensions.dart';
import 'web_login_left_side.dart';

class WebVerifyPage extends StatelessWidget {
  const WebVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        body: Row(
          children: [
            Expanded(
              child: VerifyOtpPage(),
            ),
            Container(
              height: AppDimensions.currentWidth(),
              width: AppDimensions.currentWidth() * 0.635,
              color: AppColors.primaryMain,
              child: WebLoginLeftSide(),
            ),
          ],
        ),
      ),
    );
  }
}
