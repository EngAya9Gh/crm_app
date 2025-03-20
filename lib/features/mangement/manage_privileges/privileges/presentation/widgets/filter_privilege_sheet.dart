import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/common/enums/privilege_type_enum.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/levels_cubit/privileges_cubit.dart';

class FilterPrivilegeSheet extends StatefulWidget {
  const FilterPrivilegeSheet({super.key});

  @override
  State<FilterPrivilegeSheet> createState() => _FilterPrivilegeSheetState();
}

class _FilterPrivilegeSheetState extends State<FilterPrivilegeSheet> {
  late final PrivilegesCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PrivilegesCubit>();

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
            10.height,
            CustomSearchableDropDown<PrivilegeTypeEnum>(
              hint: 'صنف الصلاحية',
              items: PrivilegeTypeEnum.values,
              itemAsString: (item) => item!.value,
              filterFn: (item, query) {
                return item.name
                    .toLowerCase()
                    .trim()
                    .contains(query.toLowerCase());
              },
              compareFn: (item, selectedItem) => item.index == selectedItem.index,
              selectedItem: _cubit.filterEntity.privilegeType.value,
              onChanged: (value) {
                _cubit.filterEntity.privilegeType.value = value;
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
    _cubit.getPrivileges();
    AppNavigator.pop(result: true);
  }
}
