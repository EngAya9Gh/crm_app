import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../../../../../core/common/widgets/app_scaffold.dart';
import 'mob_login_page.dart';
import 'web_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AdaptiveLayout(
        body: SlotLayout(
          config: <Breakpoint, SlotLayoutConfig>{
            Breakpoints.small: SlotLayout.from(
              key: const Key('Body Small'),
              builder: (_) => MobLoginPage(),
            ),
            Breakpoints.mediumAndUp: SlotLayout.from(
              key: const Key('Body Medium'),
              builder: (_) => WebLoginPage(),
            ),
          },
        ),
      ),
    );
  }
}
