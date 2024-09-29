import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_dimensions.dart';
import '../../widgets/web_auth_image.dart';
import '../../widgets/web_otp_right_side.dart';

class WebVerifyOtpPage extends StatelessWidget {
  const WebVerifyOtpPage({
    super.key,
    this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        body: Row(
          children: [
            SizedBox(
              width: AppDimensions.currentWidth() * 0.365,
              child: WebOtpRightSide(email: email),
            ),
            Expanded(
              child: Container(
                height: AppDimensions.currentWidth(),
                color: AppColors.primaryMain,
                child: WebAuthImage(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
