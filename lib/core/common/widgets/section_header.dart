import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final Color? textColor;
  final double? fontSize;
  final Color? backgroundColor;
  final FontWeight? fontWeight;
  // final String? fontFamily;
  final double? letterSpacing;
  final double? lineHeight;

  const SectionHeader({
    Key? key,
    required this.title,
    this.textColor = const Color(0xFF616161),
    this.backgroundColor = const Color(0xFFF5F5F5),
    this.fontWeight = FontWeight.w500,
    this.fontSize = 16.0,
    // this.fontFamily = 'Roboto',
    this.letterSpacing = 0.15,
    this.lineHeight = 1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: AppText(
        title,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: textColor,
          // fontFamily: fontFamily,
          letterSpacing: letterSpacing,
          height: lineHeight,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        textAlign: TextAlign.right,
      ),
    );
  }
}
