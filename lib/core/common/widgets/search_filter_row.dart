import 'package:flutter/material.dart';

import '../extensions/num_extensions.dart';
import 'custom_filter_icon.dart';
import 'custom_search_widget.dart';

class SearchFilterRow extends StatelessWidget {
  const SearchFilterRow({
    super.key,
    required this.searchController,
    required this.onSearchChanged,
    required this.onFilterPressed,
  });

  final TextEditingController searchController;
  final Function(String) onSearchChanged;
  final Function() onFilterPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomSearchWidget(
            searchController: searchController,
            onChanged: onSearchChanged,
          ),
        ),
        CustomFilterIcon(onTap: onFilterPressed),
        8.width,
      ],
    );
  }
}
