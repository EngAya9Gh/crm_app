import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/generated/assets.dart';
import 'package:flutter/material.dart';

import 'app_asset_image.dart';

class AppCopyrightsWidget extends StatelessWidget {
  const AppCopyrightsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: AppText(
            '© جميع الحقوق محفوظة لدى',
            style: AppStyles.regular18.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
        10.horizontal,
        Flexible(
          child: AppAssetImage(
            imagePath: Assets.imagesSmartLifeLogo,
            height: 30.37,
            width: 137.59,
          ),
        ),
      ],
    );
  }
}
