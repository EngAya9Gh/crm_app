import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/user_vm_provider.dart';

class SearchableUsersList extends StatefulWidget {
  const SearchableUsersList({
    super.key,
    this.onUserSelected,
    this.selectedUser,
  });

  final void Function(UserModel?)? onUserSelected;
  final UserModel? selectedUser;

  @override
  State<SearchableUsersList> createState() => _SearchableUsersListState();
}

class _SearchableUsersListState extends State<SearchableUsersList> {
  late final UserProvider userProvider;

  @override
  void initState() {
    userProvider = context.read<UserProvider>();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (userProvider.usersMarketingManagement.isEmpty) {
        await userProvider.getUsersVm();
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, cart, child) {
        return CustomSearchableDropDown<UserModel>(
          hint: 'الموظف',
          items: cart.usersMarketingManagement,
          itemAsString: (u) => u!.userAsString(),
          selectedItem: widget.selectedUser,
          onChanged: widget.onUserSelected,
          filterFn: (user, filter) => user.getfilteruser(filter),
          compareFn: (item, selectedItem) => item.idUser == selectedItem.idUser,
        );
      },
    );
  }
}
