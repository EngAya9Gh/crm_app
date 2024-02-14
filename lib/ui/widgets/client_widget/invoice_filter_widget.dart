import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/maincitymodel.dart';
import '../../../model/usermodel.dart';
import '../../../view_model/invoice_vm.dart';
import '../../../view_model/maincity_vm.dart';
import '../../../view_model/typeclient.dart';
import '../../../view_model/user_vm_provider.dart';
import '../../widgets/client_widget/cities_multi_select_drop_down_widget.dart';

class InvoiceFilterWidget extends StatelessWidget {
  const InvoiceFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MainCityProvider mainCityProvider = context.watch<MainCityProvider>();
    return Column(
      children: [
        // region and state
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // region
            Expanded(
              child: CitiesMultiSelectDropDownWidget<MainCityModel>(
                provider: mainCityProvider,
                items: mainCityProvider.listCurrentUserMainCityFilter,
                selectedItems: mainCityProvider.selectedRegions,
                itemAsString: (u) => u!.userAsString(),
                onChanged: (data) async {
                  context.read<MainCityProvider>().selectedRegions = data;
                  await mainCityProvider.changeitemlist(data);
                  filterShow(context);
                },
                hint: 'المنطقة',
              ),
            ),
            // state
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 8),
                child: Consumer<ClientTypeProvider>(
                    builder: (context, cart, child) {
                  return DropdownButton(
                    isExpanded: true,
                    hint: Text('الحالة'),
                    items: cart.listtype_install.map((level_one) {
                      return DropdownMenuItem(
                        child: Text(level_one),
                        value: level_one,
                      );
                    }).toList(),
                    value: cart.selectedlisttype_install,
                    onChanged: (value) {
                      cart.changelisttype_install(value.toString());
                      Provider.of<invoice_vm>(context, listen: false)
                          .typeClientValue = value.toString();
                      filterShow(context);
                    },
                  );
                }),
              ),
            ),
            //الحالة
          ],
        ),
        SizedBox(height: 10),
        // filtered cities
        CitiesMultiSelectDropDownWidget<CityModel>(
          provider: mainCityProvider,
          items: mainCityProvider.filteredCitiesList,
          selectedItems: mainCityProvider.filteredCitiesList,
          itemAsString: (u) => u!.userAsString(),
          onChanged: (data) {
            context.read<MainCityProvider>().selectedCities = data;
            filterShow(context);
          },
          hint: 'المدينة',
        ),
      ],
    );
  }

  void filterShow(BuildContext context) {
    final UserModel user = context.read<UserProvider>().currentUser;
    List<MainCityModel> selectedRegions =
        context.read<MainCityProvider>().selectedRegions;
    final List<CityModel> cities =
        context.read<MainCityProvider>().selectedCities;

    if (selectedRegions.isEmpty) {
      selectedRegions =
          user.maincitylist_user?.map((e) => e.asMainCity).toList() ?? [];
    }

    context.read<invoice_vm>().filterInvoices(
          listSelectedRegions: selectedRegions,
          selectedCities: cities,
        );
  }
}
