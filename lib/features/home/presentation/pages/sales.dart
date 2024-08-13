import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../../../../core/common/widgets/custom_app_bar.dart';
import '../widgets/medium_body.dart';
import '../widgets/small_body.dart';

class SalesSection extends StatefulWidget {
  const SalesSection({super.key});

  @override
  State<SalesSection> createState() => _SalesSectionState();
}

class _SalesSectionState extends State<SalesSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: CustomAppBar(title: 'المبيعات'),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: AdaptiveLayout(
            body: SlotLayout(
              config: <Breakpoint, SlotLayoutConfig>{
                Breakpoints.small: SlotLayout.from(
                  key: const Key('Body Small'),
                  builder: (_) => SmallBody(),
                ),
                Breakpoints.mediumAndUp: SlotLayout.from(
                  key: const Key('Body Medium'),
                  builder: (_) => MediumBody(),
                ),
              },
            ),
          ),
        ),
      ),
    );
  }
}
