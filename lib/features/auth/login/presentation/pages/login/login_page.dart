import 'package:flutter/material.dart';

import '../../../../../../core/common/widgets/app_adaptive_builder.dart';
import '../../../../../../core/common/widgets/app_scaffold.dart';
import 'mob_login_page.dart';
import 'web_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AppLayoutBuilder(
        smallBuilder: (context) => MobLoginPage(),
        mediumBuilder: (context) => WebLoginPage(),
      ),
    );
  }
}
