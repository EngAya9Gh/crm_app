import 'package:flutter/material.dart';

import '../../../../../../../core/common/widgets/app_adaptive_builder.dart';
import 'mob_clients_list_page.dart';
import 'web_clients_list_page.dart';

class ClientsListPage extends StatelessWidget {
  const ClientsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayoutBuilder(
      smallBuilder: (context) => MobClientsListPage(),
      mediumBuilder: (context) => WebClientsListPage(),
    );
  }
}
