import 'package:crm_smart/features/auth/login/presentation/widgets/web_login_right_side.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_scaffold.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_dimensions.dart';
import '../../widgets/web_auth_image.dart';

class WebLoginPage extends StatelessWidget {
  const WebLoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppScaffold(
        body: Row(
          children: [
            SizedBox(
              width: AppDimensions.currentWidth() * 0.365,
              child: WebLoginRightSide(),
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
