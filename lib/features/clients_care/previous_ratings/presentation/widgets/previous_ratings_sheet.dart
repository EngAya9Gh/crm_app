import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../view_model/user_vm_provider.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/users_searchable_dropdown/presentation/pages/users_searchable_drop_down.dart';
import '../manager/previous_ratings_cubit.dart';

class PreviousRatingsSheet extends StatefulWidget {
  const PreviousRatingsSheet({super.key});

  @override
  State<PreviousRatingsSheet> createState() => _PreviousRatingsSheetState();
}

class _PreviousRatingsSheetState extends State<PreviousRatingsSheet> {
  late final PreviousRatingsCubit _cubit;

  @override
  void initState() {
    _cubit = context.read<PreviousRatingsCubit>();

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
            StatefulBuilder(
              builder: (context, refresh) {
                return SwitchListTile(
                  value: _cubit.filterEntity.starClientNotifier.value,
                  onChanged: (value) {
                    _cubit.filterEntity.starClientNotifier.value = value;
                    refresh(() {});
                  },
                  title: Text("عملاء مميزين"),
                );
              },
            ),
            10.height,
            UsersSearchableDropDown(
              hint: "موظفف العناية",
              userType: UserType.CareManagement,
              selectedUserId:
                  _cubit.filterEntity.careEmployeeNotifier.value?.id,
              onSelected: (user) {
                _cubit.filterEntity.careEmployeeNotifier.value = user;
              },
            ),
            10.height,
            UsersSearchableDropDown(
              hint: "موظف الدعم",
              userType: UserType.SupportManagement,
              selectedUserId:
                  _cubit.filterEntity.supportEmployeeNotifier.value?.id,
              onSelected: (user) {
                _cubit.filterEntity.supportEmployeeNotifier.value = user;
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
    _cubit.getPreviousRatings();
    AppNavigator.pop(result: true);
  }
}
