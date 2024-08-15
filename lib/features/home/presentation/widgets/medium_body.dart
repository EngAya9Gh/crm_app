import 'package:flutter/material.dart';

import '../../../../core/common/models/page_model.dart';
import 'grid_card_category.dart';

class MediumBody extends StatelessWidget {
  const MediumBody({super.key, required this.pages});

  final List<PageModel> pages;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      itemCount: pages.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 0.9,
        mainAxisExtent: 170,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        maxCrossAxisExtent: 250,
      ),
      itemBuilder: (context, index) {
        return GridCardCategory(page: pages[index]);
      },
    );
  }
}
