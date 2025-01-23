import 'package:flutter/material.dart';

import '../../../../core/common/lists/all_sub_sections_lists.dart';
import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../widgets/adaptive_body.dart';

class FinancesSection extends StatefulWidget {
  const FinancesSection({super.key});

  @override
  State<FinancesSection> createState() => _SalesSectionState();
}

class _SalesSectionState extends State<FinancesSection> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'المالية'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AdaptiveBody(pages:AllSubSectionsLists.financeSubSection),
      ),
    );
  }
}
