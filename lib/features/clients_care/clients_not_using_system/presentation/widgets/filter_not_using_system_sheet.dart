import 'package:crm_smart/features/common/users_searchable_dropdown/presentation/pages/users_searchable_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../manager/not_using_system_cubit.dart';

class FilterNotUsingSystemSheet extends StatefulWidget {
  const FilterNotUsingSystemSheet({super.key});

  @override
  State<FilterNotUsingSystemSheet> createState() =>
      _FilterNotUsingSystemSheetState();
}

class _FilterNotUsingSystemSheetState extends State<FilterNotUsingSystemSheet> {
  late final NotUsingSystemCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<NotUsingSystemCubit>();

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
                  _cubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _cubit.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _cubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            BranchSearchableDropDown(
              hint: "الفرع",
              selectedBranchId:
                  _cubit.filterEntity.regionIdNotifier.value?.branchId,
              onSelected: (region) {
                _cubit.filterEntity.regionIdNotifier.value = region;
              },
            ),
            10.height,
            UsersSearchableDropDown(
              userType: UserTypeEnum.all,
              selectedUserId: _cubit.filterEntity.userIdNotifier.value,
              onSelected: (user) {
                _cubit.filterEntity.userIdNotifier.value = user?.id;
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
    _cubit.getNotUsingSystem();
    AppNavigator.pop(result: true);
  }
}
