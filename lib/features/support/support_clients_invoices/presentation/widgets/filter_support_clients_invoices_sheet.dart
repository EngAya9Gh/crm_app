import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:crm_smart/core/common/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/models/location/city_model.dart';
import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/common/widgets/custom_dropdown.dart';
import '../../../../../core/common/widgets/custom_multi_selection_dropdown.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
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
                            _cubit.filterEntity.clear();
                            _filterAndCloseDialog(resetCities: true);
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            10.height,
            CustomMultiSelectionDropdown<RegionModel>(
              hint: 'المنطقة',
              items: _mainCityProvider.listCurrentUserMainCityFilter,
              selectedItems: _cubit.filterEntity.regionsNotifier.value,
              itemAsString: (u) => u!.userAsString(),
              filterFn: (item, str) {
                return item.namemaincity.contains(str);
              },
              compareFn: (item, str) {
                return item.id_maincity == str.id_maincity;
              },
              onSave: (data) async {
                _cubit.changeGettingCitiesFromRegionsStatus(loading: true);
                _cubit.filterEntity.regionsNotifier.value = data;
                context.read<MainCityProvider>().selectedRegions = data;
                await _mainCityProvider.changeItemsList(data);
                _cubit.filterEntity.citiesNotifier.value =
                    _mainCityProvider.selectedCities;
                _cubit.changeGettingCitiesFromRegionsStatus(success: true);
              },
              validator: InputValidator.requiredFiled,
            ),
            10.height,
            Consumer<MainCityProvider>(
              builder: (context, value, child) {
                if (value.isloading) {
                  return const AppLoader();
                }
                return CustomMultiSelectionDropdown<CityModel>(
                  hint: 'المدينة',
                  items: _mainCityProvider.filteredCitiesList,
                  selectedItems: _cubit.filterEntity.citiesNotifier.value,
                  itemAsString: (city) => city!.cityName,
                  onSave: (data) async {
                    context.read<MainCityProvider>().selectedCities = data;
                    _cubit.filterEntity.citiesNotifier.value = data;
                  },
                  compareFn: (a, b) => a.cityId == b.cityId,
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
            BlocBuilder<SupportClientsInvoicesCubit,
                SupportClientsInvoicesState>(
              builder: (context, state) {
                return AppElevatedButton(
                  isLoading: state.getCitiesFromRegions.isLoading(),
                  text: "فلترة",
                  onPressed: () => _filterAndCloseDialog(),
                );
              },
            ),
            20.height,
          ],
        ),
      ),
    );
  }

  Future<void> _filterAndCloseDialog({bool resetCities = false}) async {
    AppNavigator.pop(result: true);
    if (resetCities) await _cubit.loadCities(context);
    _cubit.getSupportClientInvoices(
      fkCountry: AppConstants.currentCountry,
    );
  }
}
