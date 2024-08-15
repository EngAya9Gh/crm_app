import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../../../../../model/usermodel.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../manager/dates_table_cubit.dart';

class UserDropdown extends StatefulWidget {
  const UserDropdown({
    super.key,
    required this.onChanged,
  });

  final void Function(UserModel?) onChanged;

  @override
  State<UserDropdown> createState() => _UserDropdownState();
}

class _UserDropdownState extends State<UserDropdown> {
  late final DatesTableCubit datesTableCubit;

  @override
  void initState() {
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          return BlocBuilder<DatesTableCubit, DatesTableState>(
            builder: (context, state) {
              return CustomSearchableDropDown<UserModel>(
                hint: 'الموظف',
                items: userProvider.usersSupportManagement,
                itemAsString: (u) => u!.userAsString(),
                onChanged: widget.onChanged,
                selectedItem: datesTableCubit.filterEntity.userNotifier.value,
                filterFn: (user, filter) => user.getfilteruser(filter),
                compareFn: (item, selectedItem) =>
                    item.idUser == selectedItem.idUser,
                validator: (value) {
                  if (value == null) {
                    return 'يرجى اختيار الموظف';
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
}
