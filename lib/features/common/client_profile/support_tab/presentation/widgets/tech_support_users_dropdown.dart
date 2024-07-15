import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/helpers/input_validator.dart';
import '../../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../../model/usermodel.dart';
import '../../../../../../view_model/user_vm_provider.dart';

class TechSupportUsersDropDown extends StatefulWidget {
  const TechSupportUsersDropDown({
    Key? key,
    this.clear = false,
    this.fkUser,
    this.onSelectUser,
  }) : super(key: key);

  final bool clear;
  final String? fkUser;
  final Function(UserModel)? onSelectUser;

  @override
  State<TechSupportUsersDropDown> createState() =>
      _TechSupportUsersDropDownState();
}

class _TechSupportUsersDropDownState extends State<TechSupportUsersDropDown> {
  late final UserProvider userProvider;

  @override
  void initState() {
    userProvider = context.read<UserProvider>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.fkUser != null) {
        onSelectUser();
      }
      if (widget.clear) {
        _clearUser(context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          _clearUser(context);
        }
      },
      child: Builder(
        builder: (context) {
          return Consumer<UserProvider>(
            builder: (context, user, child) {
              return CustomSearchableDropDown<UserModel>(
                hint: 'موظف الدعم الفني',
                items: user.usersSupportManagement,
                itemAsString: (u) => u!.userAsString(),
                onChanged: (selectedUser) {
                  onSelectUser(selectedUser);
                },
                selectedItem: userProvider.selectedUser,
                filterFn: (user, filter) => user.getfilteruser(filter),
                compareFn: (item, selectedItem) =>
                    item.idUser == selectedItem.idUser,
                validator: (value) {
                  return InputValidator.requiredFiled(value);
                },
              );
            },
          );
        },
      ),
    );
  }

  void onSelectUser([UserModel? user]) {
    if (widget.fkUser != null) userProvider.changeValUserID(widget.fkUser);

    if (user == null) return;

    widget.onSelectUser?.call(user);
  }

  void _clearUser(BuildContext context) {
    userProvider.changevalueuser(null, true);
  }
}
