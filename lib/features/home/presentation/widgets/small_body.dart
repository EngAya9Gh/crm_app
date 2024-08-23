import 'package:crm_smart/core/common/widgets/app_paginated_list.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/models/page_model.dart';
import 'category_card_for_list.dart';

class SmallBody extends StatelessWidget {
  const SmallBody({super.key, required this.pages});

  final List<PageModel> pages;

  @override
  Widget build(BuildContext context) {
    return AppPaginatedList(
      items: pages,
      itemBuilder: (context, index) {
        return CategoryCardForList(page: pages[index]);
      },
    );
  }
}
