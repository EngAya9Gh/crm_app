import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/models/user_entity.dart';
import '../../../../../core/common/widgets/app_loader.dart';
import '../../../../../core/common/widgets/custom_error_widget.dart';
import '../../../../../core/common/widgets/custom_searchable_dropdown.dart';
import '../manager/users_type_cubit.dart';

class UsersSearchableDropDown extends StatefulWidget {
  const UsersSearchableDropDown({
    super.key,
    required this.userType,
    this.hint,
    this.selectedUserId,
    this.onSelected,
  });

  final UserTypeEnum userType;
  final String? hint;
  final String? selectedUserId;
  final Function(UserEntity? user)? onSelected;

  @override
  State<UsersSearchableDropDown> createState() =>
      _UsersSearchableDropDownState();
}

class _UsersSearchableDropDownState extends State<UsersSearchableDropDown> {
  late final UsersTypeCubit cubit;

  @override
  void initState() {
    cubit = context.read<UsersTypeCubit>();
    if (cubit.usersMap[widget.userType.name]?.isEmpty ?? true) {
      cubit.getUsersByType(widget.userType).then((value) {
        _loadCurrentUser();
      });
    } else {
      _loadCurrentUser();
    }

    super.initState();
  }

  void _loadCurrentUser() {
    cubit.loadCurrentUserById(
      userType: widget.userType,
      userId: widget.selectedUserId,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UsersTypeCubit>();

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BlocBuilder<UsersTypeCubit, UsersTypeState>(
        buildWhen: (previous, current) {
          return current.tag == widget.userType.name;
        },
        builder: (context, state) {
          if (state.getUsersStatus.isLoading()) {
            return AppLoader(padding: 3);
          } else if (state.getUsersStatus.isFailed()) {
            return CustomErrorWidget(onPressed: () {
              cubit.getUsersByType(widget.userType);
            });
          }
          return CustomSearchableDropDown<UserEntity>(
            hint: widget.hint ?? "الموظف",
            items: cubit.usersMap[widget.userType.name] ?? [],
            selectedItem: cubit.selectedUser(widget.userType),
            itemAsString: (user) => user!.name,
            onChanged: (user) {
              if (user == null) return;

              cubit.setSelectedUser(user, widget.userType);
              widget.onSelected?.call(user);
            },
            filterFn: (user, term) {
              return user.name.toLowerCase().contains(term.toLowerCase());
            },
            compareFn: (user, selected) => user.id == selected.id,
            validator: (value) {
              return InputValidator.requiredFiled(value);
            },
          );
        },
      ),
    );
  }
}
