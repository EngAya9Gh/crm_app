import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../app/presentation/widgets/app_text.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({
    super.key, required this.icon, required this.text, required this.value,
  });

  final Widget icon;
  final String text;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadiusDirectional.circular(8), color: AppColors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon, // Icon at the top
          8.height,
          AppText(
            value,
            fontWeight: FontWeight.bold,
            color: AppColors.black,
          ),
          4.height,
          AppText(
            text,
            fontSize: 12,
            color: Colors.grey.shade700,
          ),
        ],
      ),
    );
  }
}
