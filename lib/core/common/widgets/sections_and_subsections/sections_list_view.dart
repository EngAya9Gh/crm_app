import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';

import '../../models/sections/section_model.dart';
import 'sections_card_for_list.dart';

class SectionsListView extends StatelessWidget {
  const SectionsListView({super.key, required this.sections});

  final List<SectionModel> sections;

  @override
  Widget build(BuildContext context) {
    return AppPaginatedList(
      items: sections,
      itemBuilder: (context, index) {
        return SectionsCardForList(page: sections[index]);
      },
    );
  }
}
