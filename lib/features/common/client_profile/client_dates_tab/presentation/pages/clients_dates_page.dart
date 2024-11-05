import 'package:flutter/material.dart';
import 'package:crm_smart/core/common/widgets/app_scaffold.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/widgets/app_adaptive_builder.dart';
import 'client_dates_page_mob.dart';
import 'client_dates_page_web.dart';

class ClientsDatesPage extends StatelessWidget {
  const ClientsDatesPage({Key? key,required this.client}) : super(key: key);
  final ClientModel client;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AppLayoutBuilder(
        smallBuilder: (context) => ClientsDatesPageMob(client: client),
        largeBuilder: (context) => ClientsDatesPageWeb(client: client),
      ),
    );
  }
}