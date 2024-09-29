import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_fonts.dart';
import 'card_target.dart';

class TargetPage extends StatelessWidget {
  const TargetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تارجت ',
          style: TextStyle(
              color: AppColors.white, fontFamily: AppFonts.fontFamily1),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: CardTaget(),
    );
  }
}
