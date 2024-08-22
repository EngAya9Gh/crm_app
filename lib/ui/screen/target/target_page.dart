import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../core/utils/app_colors.dart';
import 'card_target.dart';

class TargetPage extends StatelessWidget {
  const TargetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تارجت ',
          style:
              TextStyle(color: AppColors.kWhiteColor, fontFamily: kfontfamily2),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: CardTaget(),
    );
  }
}
