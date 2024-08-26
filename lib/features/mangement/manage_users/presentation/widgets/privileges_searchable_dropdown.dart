import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../manage_privileges/privileges/data/models/privilege_model.dart';
import '../../../manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

class PrivilegesSearchableDropdown extends StatelessWidget {
  const PrivilegesSearchableDropdown({
    super.key,
    required this.selectedPrivilegesNotifier,
    this.onSave,
  });

  final ValueNotifier<List<PrivilegeModel>> selectedPrivilegesNotifier;
  final void Function(List<PrivilegeModel>)? onSave;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: CustomMultiSelectionDropdown<PrivilegeModel>(
        hint: 'الصلاحيات',
        items: context.read<PrivilegesCubit>().pageVariables.userPrivileges,
        selectedItems: selectedPrivilegesNotifier.value,
        itemAsString: (item) => item!.namePrivilege!,
        onSave: onSave,
        filterFn: (item, query) {
          return item.namePrivilege!
              .toLowerCase()
              .contains(query.toLowerCase());
        },
        compareFn: (a, b) => a.idPrivilegeUser == b.idPrivilegeUser,
      ),
    );
  }
}
