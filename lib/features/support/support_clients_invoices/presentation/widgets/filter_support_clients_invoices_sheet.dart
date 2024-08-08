import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../../view_model/typeclient.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/support_clients_invoices_cubit.dart';

class FilterSupportClientsInvoicesSheet extends StatefulWidget {
  const FilterSupportClientsInvoicesSheet({super.key});

  @override
  State<FilterSupportClientsInvoicesSheet> createState() =>
      _FilterSupportClientsInvoicesSheetState();
}

class _FilterSupportClientsInvoicesSheetState
    extends State<FilterSupportClientsInvoicesSheet> {
  late final SupportClientsInvoicesCubit _cubit;
  late final MainCityProvider _mainCityProvider;

  @override
  void initState() {
    _cubit = context.read<SupportClientsInvoicesCubit>();
    _mainCityProvider = context.read<MainCityProvider>();
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
            CustomMultiSelectionDropdown<MainCityModel>(
              hint: 'المنطقة',
              items: _mainCityProvider.listCurrentUserMainCityFilter,
              selectedItems: _cubit.filterEntity.regionsNotifier.value,
              itemAsString: (u) => u!.userAsString(),
              onSave: (data) async {
                context.read<MainCityProvider>().selectedRegions = data;
                await _mainCityProvider.changeItemsList(data);
                _cubit.filterEntity.regionsNotifier.value = data;
                _cubit.filterEntity.citiesNotifier.value =
                    _mainCityProvider.selectedCities;
              },
              validator: InputValidator.requiredFiled,
            ),
            10.height,
            Consumer<MainCityProvider>(
              builder: (context, value, child) {
                return CustomMultiSelectionDropdown<CityModel>(
                  hint: 'المدينة',
                  items: _mainCityProvider.filteredCitiesList,
                  selectedItems: _cubit.filterEntity.citiesNotifier.value,
                  itemAsString: (u) => u!.userAsString(),
                  onSave: (data) async {
                    context.read<MainCityProvider>().selectedCities = data;
                    _cubit.filterEntity.citiesNotifier.value = data;
                  },
                  validator: InputValidator.requiredFiled,
                );
              },
            ),
            10.height,
            Consumer<ClientTypeProvider>(
              builder: (context, value, child) {
                return CustomDropDown(
                  hint: 'الحالة',
                  items: value.listtype_install,
                  itemAsString: (u) => u.toString(),
                  selectedItem: _cubit.filterEntity.statusNotifier.value,
                  onChanged: (value) {
                    _cubit.filterEntity.statusNotifier.value = value!;
                  },
                  height: 105.h,
                );
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
    _cubit.loadCities(context).then((value) {
      _cubit.getSupportClientInvoices(
        fkCountry: AppConstants.currentCountry(
                AppNavigator.navigatorKey.currentContext!) ??
            '',
      );
    });
    AppNavigator.pop(result: true);
  }
}
