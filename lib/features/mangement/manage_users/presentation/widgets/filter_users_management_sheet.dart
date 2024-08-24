import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/users/active_state_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/users_cubit.dart';
import 'branches_searchable_dropdown.dart';
import 'levels_searchable_dropdown.dart';
import 'manage_searchable_dropdown.dart';
import 'privileges_searchable_dropdown.dart';

class FilterUsersManagementSheet extends StatefulWidget {
  const FilterUsersManagementSheet({super.key});

  @override
  State<FilterUsersManagementSheet> createState() =>
      _FilterUsersManagementSheetState();
}

class _FilterUsersManagementSheetState
    extends State<FilterUsersManagementSheet> {
  late final UsersCubit _usersCubit;
  late final PrivilegeCubit _privilegeCubit;

  @override
  void initState() {
    _usersCubit = context.read<UsersCubit>();
    _privilegeCubit = context.read<PrivilegeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: ListenableBuilder(
                listenable: Listenable.merge(
                  _usersCubit.filterUsersEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed:
                        _usersCubit.filterUsersEntity.checkIfFilterIsNotEmpty()
                            ? () {
                                _usersCubit.filterUsersEntity.clearFilters();
                                _filterAndCloseDialog();
                              }
                            : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            if (_privilegeCubit.checkPrivilege('231')) ...[
              10.height,
              Directionality(
                textDirection: TextDirection.rtl,
                child: PrivilegesSearchableDropdown(
                  selectedPrivilegesNotifier:
                      _usersCubit.filterUsersEntity.privilegesNotifier,
                  onSave: (value) {
                    _usersCubit.filterUsersEntity.privilegesNotifier.value =
                        value;
                  },
                ),
              ),
            ],
            10.height,
            CustomDropDown<ActiveStateEnum>(
              hint: "الحالة",
              items: ActiveStateEnum.values,
              itemAsString: (item) => item!.value,
              selectedItem:
                  _usersCubit.filterUsersEntity.isActiveNotifier.value,
              onChanged: (value) {
                _usersCubit.filterUsersEntity.isActiveNotifier.value = value;
              },
              height: 105.h,
            ),
            10.height,
            ManageSearchableDropdown(
              manage: _usersCubit.filterUsersEntity.manageNotifier.value,
              onChanged: (value) {
                _usersCubit.filterUsersEntity.manageNotifier.value = value;
              },
            ),
            10.height,
            LevelsSearchableDropdown(
              level: _usersCubit.filterUsersEntity.levelNotifier.value,
              onChanged: (value) {
                _usersCubit.filterUsersEntity.levelNotifier.value = value;
              },
            ),
            10.height,
            BranchesSearchableDropdown(
              branch: _usersCubit.filterUsersEntity.branchNotifier.value,
              onChanged: (value) {
                _usersCubit.filterUsersEntity.branchNotifier.value = value;
              },
            ),
            20.height,
            AppElevatedButton(
              text: "فلترة",
              onPressed: () => _filterAndCloseDialog(),
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  void _filterAndCloseDialog() {
    _usersCubit.getUsers();
    AppNavigator.pop(result: true);
  }
}
