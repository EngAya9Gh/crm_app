import 'package:crm_smart/core/common/widgets/app_adaptive_builder.dart';
import 'package:flutter/material.dart';

import 'mob_clients_invoices_page.dart';
import 'web_clients_invoices_page.dart';

class ClientsInvoicesPage extends StatelessWidget {
  const ClientsInvoicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayoutBuilder(
      smallBuilder: (context) => MobClientsInvoicesPage(),
      mediumBuilder: (context) => WebClientsInvoicesPage(),
    );
  }
}
