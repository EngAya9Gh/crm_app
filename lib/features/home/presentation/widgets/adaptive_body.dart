import 'package:flutter/material.dart';

import '../../../../core/common/models/sections/section_model.dart';
import '../../../../core/common/widgets/app_adaptive_builder.dart';
import '../../../../core/common/widgets/sections_and_subsections/sections_list_view.dart';
import 'medium_body.dart';

class AdaptiveBody extends StatelessWidget {
  const AdaptiveBody({
    super.key,
    required this.pages,
  });

  final List<SectionModel> pages;

  @override
  Widget build(BuildContext context) {
    return AppLayoutBuilder(
      smallBuilder: (context) => SectionsListView(sections: pages),
      mediumBuilder: (context) => MediumBody(pages: pages),
    );
  }
}
