import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../../../../core/common/models/page_model.dart';
import 'medium_body.dart';
import 'small_body.dart';

class AdaptiveBody extends StatelessWidget {
  const AdaptiveBody({
    super.key,
    required this.pages,
  });

  final List<PageModel> pages;

  @override
  Widget build(BuildContext context) {
    return AdaptiveLayout(
      body: SlotLayout(
        config: <Breakpoint, SlotLayoutConfig>{
          Breakpoints.small: SlotLayout.from(
            key: const Key('Body Small'),
            builder: (_) => SmallBody(pages: pages),
          ),
          Breakpoints.mediumAndUp: SlotLayout.from(
            key: const Key('Body Medium'),
            builder: (_) => MediumBody(pages: pages),
          ),
        },
      ),
    );
  }
}
