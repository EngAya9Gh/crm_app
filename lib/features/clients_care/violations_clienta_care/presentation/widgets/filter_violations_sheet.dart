import 'package:crm_smart/core/common/widgets/custom_dropdown.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/management_model.dart';
import 'package:crm_smart/features/common/users_searchable_dropdown/presentation/pages/users_searchable_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/enums/users/user_type_enum.dart';
import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/helpers/input_validator.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/branches/presentation/pages/branch_searchable_drop_down.dart';
import '../../../../common/client_profile/support_tab/presentation/widgets/tech_support_users_dropdown.dart';
import '../../data/models/violation_type_model.dart';
import '../manager/violations_cubit.dart';

class FilterViolationsSheet extends StatefulWidget {
  const FilterViolationsSheet({super.key});

  @override
  State<FilterViolationsSheet> createState() =>
      _FilterViolationsSheetState();
}

class _FilterViolationsSheetState extends State<FilterViolationsSheet> {
  late final ViolationsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<ViolationsCubit>();

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
                    onPressed: _cubit.filterEntity
                        .checkIfFilterIsNotEmpty()
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
            10.height,
            TechSupportUsersDropDown(
              onSelectUser: (user) {
                _cubit.filterEntity.userId.value = user.id;
              },
            ),
            10.height,
            CustomDropDown<ManagementModel>(
              hint: "الادارة",
              items: _cubit.pageVariables.managementList,
              itemAsString: (item) => item!.nameManage,
              selectedItem:_cubit.filterEntity.management.value,
              onChanged: (value) {
                if (value == null) return;
                _cubit.filterEntity.management.value = value;
            },
            ),
            10.height,
            CustomDropDown<ViolationType>(
              hint: "نوع المخالفة",
              items: _cubit.pageVariables.violationTypeList,
              itemAsString: (item) => item!.name,
              selectedItem:_cubit.filterEntity.violationType.value,
              onChanged: (value) {
                if (value == null) return;
                _cubit.filterEntity.violationType.value = value;
            },
            ),
            10.height,
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
    _cubit.getViolations(isNewFilter: true);
    AppNavigator.pop();
  }
}
