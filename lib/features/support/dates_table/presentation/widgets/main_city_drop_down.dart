import 'package:crm_smart/core/common/widgets/custom_multi_selection_dropdown.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/support/dates_table/presentation/manager/dates_table_cubit.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class MainCityDropdown extends StatefulWidget {
  @override
  State<MainCityDropdown> createState() => _MainCityDropdownState();
}

class _MainCityDropdownState extends State<MainCityDropdown> {
  late final DatesTableCubit datesTableCubit;
  late final MainCityProvider mainCityProvider;

  @override
  void initState() {
    datesTableCubit = BlocProvider.of<DatesTableCubit>(context);
    mainCityProvider = context.read<MainCityProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer2<MainCityProvider, EventProvider>(
        builder: (context, mainCityProvider, eventProvider, child) {
          return BlocBuilder<DatesTableCubit, DatesTableState>(
            buildWhen: (previous, current) {
              return previous.refreshUi != current.refreshUi;
            },
            builder: (context, state) {
              return CustomMultiSelectionDropdown<MainCityModel>(
                items: datesTableCubit.allMainCities,
                selectedItems: datesTableCubit.filterSelectedMainCity,
                hint: 'المنطقة',
                onSave: (data) {
                  _onSave(
                    context: context,
                    data: data,
                    eventProvider: eventProvider,
                    mainCityProvider: mainCityProvider,
                  );
                },
                onItemAdded: (selectedItems, addedItem) {
                  datesTableCubit.filterSelectedMainCity = selectedItems;
                },
                onItemRemoved: (selectedItems, removedItem) {
                  datesTableCubit.filterSelectedMainCity = selectedItems;
                },
                itemAsString: (u) => u!.userAsString(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppStrings.messageEmpty;
                  }
                  return null;
                },
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
              );
            },
          );
        },
      ),
    );
  }

  void _onSave({
    required BuildContext context,
    required List<MainCityModel> data,
    required EventProvider eventProvider,
    required MainCityProvider mainCityProvider,
  }) {
    datesTableCubit.getDateInstallation(GetDateInstallationParams(
      fkCountry: AppConstants.currentCountry(context)!,
    ));
  }
}
