import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/custom_loading_indicator.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../model/managmodel.dart';
import '../../../../../provider/manage_provider.dart';

class ManageSearchableDropdown extends StatefulWidget {
  const ManageSearchableDropdown({
    super.key,
    this.onChanged,
    required this.manageNotifier,
  });

  final void Function(String?)? onChanged;
  final ValueNotifier<ManageModel?> manageNotifier;

  @override
  State<ManageSearchableDropdown> createState() =>
      _ManageSearchableDropdownState();
}

class _ManageSearchableDropdownState extends State<ManageSearchableDropdown> {
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<manage_provider>().getManages();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<manage_provider>(
      builder: (context, manageVM, child) {
        if (manageVM.isLoading) {
          return CustomLoadingIndicator();
        }
        return CustomSearchableDropDown<ManageModel>(
          hint: "حدد الإدارة",
          items: manageVM.listtext,
          itemAsString: (item) => item!.name_mange,
          selectedItem: widget.manageNotifier.value,
          onChanged: (value) {
            widget.onChanged!(value.toString());
            widget.manageNotifier.value = value;
          },
          filterFn: (item, str) {
            return item.name_mange
                .toString()
                .toLowerCase()
                .contains(str.toLowerCase());
          },
        );
      },
    );
  }
}
