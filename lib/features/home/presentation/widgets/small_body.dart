import 'package:flutter/material.dart';

import '../../../../core/common/models/page_model.dart';
import 'list_card_category.dart';

class SmallBody extends StatelessWidget {
  const SmallBody({super.key, required this.pages});

  final List<PageModel> pages;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      itemCount: pages.length,
      itemBuilder: (context, index) {
        return ListCardCategory(page: pages[index]);
      },
    );
  }
}
