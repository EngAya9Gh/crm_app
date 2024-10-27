import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/app_adaptive_builder.dart';
import 'mob_clients_contacts_page.dart';
import 'web_clients_contacts_page.dart';

class ClientsContactsPage extends StatelessWidget {
  const ClientsContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AppLayoutBuilder(
        smallBuilder: (context) => MobClientsContactsPage(),
        mediumBuilder: (context) => WebClientsContactsPage(),
      ),
    );
  }
}