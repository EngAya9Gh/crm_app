import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text_field.dart.dart';
import 'package:crm_smart/ui/widgets/custom_widget/custom_logo.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';

class WebLoginRightSide extends StatelessWidget {
  const WebLoginRightSide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 87.scaleWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              144.vertical,
              CustomLogo(
                height: 100.scaleHeight,
                width: 300.scaleWidth,
              ),
              25.vertical,
              AppText(
                'تسجيل الدخول',
                style: AppStyles.large,
              ),
              16.vertical,
              AppText(
                'مرحبا بك في نظام إدارة العملاء',
                style: AppStyles.regular.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              32.vertical,
              AppTextField()
            ],
          ),
        );
      },
    );
  }
}
