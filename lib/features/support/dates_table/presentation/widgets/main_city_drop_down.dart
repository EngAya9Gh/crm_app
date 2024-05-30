import 'package:crm_smart/core/common/widgets/custom_multi_selection_dropdown.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/core/utils/app_styles.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/support/dates_table/presentation/manager/dates_table_cubit.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      child: BlocBuilder<DatesTableCubit, DatesTableState>(
        buildWhen: (previous, current) {
          return previous.refreshUi != current.refreshUi;
        },
        builder: (context, state) {
          return Row(
            children: [
              Expanded(
                child: CustomMultiSelectionDropdown<MainCityModel>(
                  hint: 'المنطقة',
                  items: datesTableCubit.allMainCities,
                  selectedItems: datesTableCubit.filterSelectedMainCity,
                  isDisabled: datesTableCubit.isAllEvents,
                  onSave: (data) {
                    datesTableCubit.filterSelectedMainCity = data;
                    _onSave(
                      context: context,
                      datesTableCubit: datesTableCubit,
                    );
                  },
                  itemAsString: (u) => u!.userAsString(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return AppStrings.messageEmpty;
                    }
                    return null;
                  },
                  dropdownSearchDecoration:
                      AppStyles.roundedDropdownButtonDecoration(
                    context: context,
                    hintText: 'المنطقة',
                  ),
                ),
              ),
              _GetAllSwitchButton(),
            ],
          );
        },
      ),
    );
  }
}

class _GetAllSwitchButton extends StatelessWidget {
  const _GetAllSwitchButton();

  @override
  Widget build(BuildContext context) {
    final datesTableCubit = context.read<DatesTableCubit>();
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: BlocBuilder<DatesTableCubit, DatesTableState>(
            builder: (context, state) {
              return Switch(
                value: datesTableCubit.isAllEvents,
                onChanged: (value) {
                  datesTableCubit.isAllEvents = value;
                  _onSave(
                    context: context,
                    datesTableCubit: datesTableCubit,
                  );
                },
              );
            },
          ),
        ),
        AppText("الكل"),
      ],
    );
  }
}

void _onSave({
  required BuildContext context,
  required DatesTableCubit datesTableCubit,
}) {
  datesTableCubit.getDateInstallation(GetDateInstallationParams(
    fkCountry: AppConstants.currentCountry(context)!,
  ));
}
