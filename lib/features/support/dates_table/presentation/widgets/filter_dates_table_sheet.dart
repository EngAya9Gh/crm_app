import 'package:crm_smart/features/common/regions/presentation/pages/regions_multi_selection_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/dates_table_cubit.dart';
import 'GetAllSwitchButton.dart';
import 'user_drop_down.dart';

class FilterDatesTableSheet extends StatefulWidget {
  const FilterDatesTableSheet({super.key});

  @override
  State<FilterDatesTableSheet> createState() => _FilterDatesTableSheetState();
}

class _FilterDatesTableSheetState extends State<FilterDatesTableSheet> {
  late final DatesTableCubit _datesCubit;

  @override
  void initState() {
    _datesCubit = context.read<DatesTableCubit>();
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
                  _datesCubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed:
                        _datesCubit.filterEntity.checkIfFilterIsNotEmpty()
                            ? () {
                                _datesCubit.filterEntity.clear();
                                _datesCubit.setAllCities();
                                _filterAndCloseDialog();
                              }
                            : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            10.height,
            Row(
              children: [
                Expanded(
                  child: ListenableBuilder(
                    listenable: _datesCubit.filterEntity.isAllEventsNotifier,
                    builder: (context, child) {
                      return RegionsMultiSelectionDropdown(
                        selectedCities:
                            _datesCubit.filterEntity.mainCitiesNotifier.value,
                        onSave: (cities) {
                          _datesCubit.filterEntity.mainCitiesNotifier.value =
                              cities;
                        },
                        isDisabled:
                            _datesCubit.filterEntity.isAllEventsNotifier.value,
                      );
                    },
                  ),
                ),
                GetAllSwitchButton(
                  onChanged: (value) {
                    _datesCubit.filterEntity.isAllEventsNotifier.value = value;
                  },
                ),
              ],
            ),
            10.height,
            UserDropdown(
              onChanged: (user) {
                _datesCubit.filterEntity.userNotifier.value = user;
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
    _datesCubit.getDateInstallation();
    AppNavigator.pop(result: true);
  }
}
