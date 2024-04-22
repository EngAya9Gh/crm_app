import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/ui/screen/support/support_table.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TechSupportUsersDropDown extends StatefulWidget {
  const TechSupportUsersDropDown({
    Key? key,
    this.clear = false,
    this.fkUser,
  }) : super(key: key);

  final bool clear;
  final String? fkUser;

  @override
  State<TechSupportUsersDropDown> createState() =>
      _TechSupportUsersDropDownState();
}

class _TechSupportUsersDropDownState extends State<TechSupportUsersDropDown> {
  late final EventProvider eventProvider;

  @override
  void initState() {
    eventProvider = context.read<EventProvider>();
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
    return Builder(
      builder: (context) {
        return Consumer2<UserProvider, EventProvider>(
          builder: (context, user, event, child) {
            return CustomSearchableDropDown<UserModel>(
              hint: 'موظف الدعم الفني',
              items: user.usersSupportManagement,
              itemAsString: (u) => u!.userAsString(),
              onChanged: (selectedUser) {
                onSelectUser(selectedUser);
              },
              selectedItem: user.selectedUser,
              filterFn: (user, filter) => user.getfilteruser(filter),
              compareFn: (item, selectedItem) =>
                  item.idUser == selectedItem.idUser,
              validator: (value) {
                if (value == null) {
                  return 'يرجى اختيار موظف الدعم الفني';
                }
                return null;
              },
            );
          },
        );
      },
    );
  }

  void onSelectUser([UserModel? user]) {
    if (widget.fkUser != null) {
      context.read<UserProvider>().changeValUserID(widget.fkUser);
    }
    if (user == null) {
      return;
    }
    context.read<UserProvider>().changevalueuser(user);
    iduser = user.idUser!;
    eventProvider.onChangeFkUser(iduser);
  }

  void _clearUser(BuildContext context) {
    iduser = "";
    eventProvider.onChangeFkUser(iduser, true);
    context.read<UserProvider>().changevalueuser(null, true);
  }
}
