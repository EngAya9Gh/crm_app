import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/usermodel.dart';
import '../../../view_model/user_vm_provider.dart';
import 'custom_searchable_dropdown.dart';

class ManagementUsersSearchableDropdown extends StatelessWidget {
  const ManagementUsersSearchableDropdown({
    super.key,
    this.selectedUser,
    required this.onChanged,
  });

  final UserModel? selectedUser;
  final void Function(UserModel?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, cart, child) {
        return CustomSearchableDropDown<UserModel>(
          hint: 'الموظف',
          selectedItem: selectedUser,
          items: cart.usersSupportManagement,
          itemAsString: (u) => u!.userAsString(),
          onChanged: onChanged,
          filterFn: (user, filter) => user.getfilteruser(filter),
          compareFn: (item, selectedItem) => item.idUser == selectedItem.idUser,
        );
      },
    );
  }
}
