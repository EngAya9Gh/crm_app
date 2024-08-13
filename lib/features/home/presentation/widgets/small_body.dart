import 'package:flutter/material.dart';

import '../../../../constantsList.dart';
import 'list_card_category.dart';

class SmallBody extends StatelessWidget {
  const SmallBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      itemCount: salesPages.length,
      itemBuilder: (context, index) {
        return ListCardCategory(page: salesPages[index]);
      },
    );
  }
}
