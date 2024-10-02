import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/app_adaptive_builder.dart';
import '../../../../../core/common/widgets/app_scaffold.dart';
import 'mob_dates_table_page.dart';
import 'web_dates_table_page.dart';

class DatesTablePage extends StatelessWidget {
  const DatesTablePage({super.key, this.onInit});

  final VoidCallback? onInit;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: AppLayoutBuilder(
        smallBuilder: (context) => MobDatesTablePage(onInit: onInit),
        largeBuilder: (context) => WebDatesTablePage(onInit: onInit),
      ),
    );
  }
}
