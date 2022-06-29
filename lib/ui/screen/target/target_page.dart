import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/target/target_employee.dart';
import 'package:crm_smart/ui/screen/target/target_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:group_button/group_button.dart';

import 'card_target.dart';

class TargetPage extends StatelessWidget {
  const TargetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تارجت ',
          style: TextStyle(color: kWhiteColor, fontFamily: kfontfamily2),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: CardTaget(),
    );
  }
}
