import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../manager/dates_table_cubit.dart';

class MainCityDropdown extends StatefulWidget {
  const MainCityDropdown({
    required this.onChanged,
  });

  final void Function(List<RegionModel>) onChanged;

  @override
  State<MainCityDropdown> createState() => _MainCityDropdownState();
}

class _MainCityDropdownState extends State<MainCityDropdown> {
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
      child: BlocBuilder<DatesTableCubit, DatesTableState>(
        buildWhen: (previous, current) {
          return previous.refreshUi != current.refreshUi;
        },
        builder: (context, state) {
          return ListenableBuilder(
            listenable: datesTableCubit.filterEntity.isAllEventsNotifier,
            builder: (context, child) {
              return CustomMultiSelectionDropdown<RegionModel>(
                hint: 'المنطقة',
                items: datesTableCubit.pageVariables.allMainCities,
                selectedItems:
                    datesTableCubit.filterEntity.mainCitiesNotifier.value ?? [],
                isDisabled:
                    datesTableCubit.filterEntity.isAllEventsNotifier.value,
                onSave: widget.onChanged,
                itemAsString: (u) => u!.userAsString(),
                compareFn: (a, b) => a.id_maincity == b.id_maincity,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return AppStrings.messageEmpty;
                  }
                  return null;
                },
                dropdownSearchDecoration:
                    AppStyles.roundedDropdownButtonDecoration(
                  context: context,
                  hintText: 'المنطقة',
                ),
              );
            },
          );
        },
      ),
    );
  }
}
