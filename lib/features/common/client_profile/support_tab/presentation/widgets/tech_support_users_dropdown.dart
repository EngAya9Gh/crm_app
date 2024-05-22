import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/user_vm_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late final SupportTabCubit supportTabCubit;

  @override
  void initState() {
    eventProvider = context.read<EventProvider>();
    supportTabCubit = BlocProvider.of<SupportTabCubit>(context);
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
          return Consumer2<UserProvider, EventProvider>(
            builder: (context, user, event, child) {
              return CustomSearchableDropDown<UserModel>(
                hint: 'موظف الدعم الفني',
                items: user.usersSupportManagement,
                itemAsString: (u) => u!.userAsString(),
                onChanged: (selectedUser) {
                  onSelectUser(selectedUser);
                },
                selectedItem: Provider.of<UserProvider>(context, listen: false)
                    .selectedUser,
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
      ),
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
    supportTabCubit.iduser = user.idUser!;
    eventProvider.onChangeFkUser(supportTabCubit.iduser);
  }

  void _clearUser(BuildContext context) {
    context.read<UserProvider>().changevalueuser(null, true);
  }
}
