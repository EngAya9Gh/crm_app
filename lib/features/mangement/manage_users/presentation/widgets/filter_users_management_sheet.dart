import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/mangement/manage_users/presentation/widgets/levels_searchable_dropdown.dart';
import 'package:crm_smart/features/mangement/manage_users/presentation/widgets/manage_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common/enums/users/active_state_enum.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/regions/presentation/pages/regions_searchable_drop_down.dart';
import '../manager/users_cubit.dart';

class FilterUsersManagementSheet extends StatefulWidget {
  const FilterUsersManagementSheet({super.key});

  @override
  State<FilterUsersManagementSheet> createState() =>
      _FilterUsersManagementSheetState();
}

class _FilterUsersManagementSheetState
    extends State<FilterUsersManagementSheet> {
  late final UsersCubit _usersCubit;

  @override
  void initState() {
    _usersCubit = context.read<UsersCubit>();
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
              manageNotifier: _usersCubit.filterUsersEntity.manageNotifier,
              onChanged: (value) {},
            ),
            10.height,
            LevelsSearchableDropdown(
              levelNotifier: _usersCubit.filterUsersEntity.levelNotifier,
              onChanged: (value) {
                _usersCubit.filterUsersEntity.levelNotifier.value = value;
              },
            ),
            10.height,
            RegionSearchableDropDown(
              hint: "الفرع",
              selectedRegionId: _usersCubit
                  .filterUsersEntity.fkRegionNotifier.value?.regionId,
              onSelected: (region) {
                return _usersCubit.filterUsersEntity.fkRegionNotifier.value =
                    region;
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
