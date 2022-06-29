import 'package:crm_smart/constantsList.dart';
import 'package:crm_smart/model/targetmodel.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:flutter/material.dart';

class TargetUser extends StatelessWidget {
  TargetModel target;
  TargetUser({required this.target, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(target.nameUser.toString()),
          centerTitle: true,
          elevation: 0,
        ),
        body: Row(
          children: [
            Text('jan'),
            SizedBox(
              width: 2,
            ),
            Text('feb'),
            Text('mar'),
            Text('abr'),
            Text('may'),
            Text('jun'),
            Text('jul'),
            Text('aug'),
            Text('seb'),
            Text('oct'),
            Text('nov'),
            Text('dec'),
          ],
        ));
  }
}
