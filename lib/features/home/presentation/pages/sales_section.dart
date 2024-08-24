import 'package:flutter/material.dart';

import '../../../../core/common/lists/sections_lists.dart';
import '../../../../core/common/widgets/app_scaffold.dart';
import '../../../../core/common/widgets/custom_app_bar.dart';
import '../widgets/adaptive_body.dart';

class SalesSection extends StatefulWidget {
  const SalesSection({super.key});

  @override
  State<SalesSection> createState() => _SalesSectionState();
}

class _SalesSectionState extends State<SalesSection> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(title: 'المبيعات'),
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AdaptiveBody(pages: SectionsLists.salesSections),
      ),
    );
  }
}
