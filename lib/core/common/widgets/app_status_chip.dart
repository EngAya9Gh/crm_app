import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../utils/app_fonts.dart';

class AppStatusChip extends StatelessWidget {
  const AppStatusChip({
    super.key,
    required this.status,
    this.color,
  });

  final String status;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: AppText(
        status,
        fontFamily: AppFonts.fontFamily1,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
