import 'package:crm_smart/core/common/widgets/custom_multi_selection_dropdown.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart';
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
  late final SupportTabCubit supportTabCubit;
  late final MainCityProvider mainCityProvider;

  @override
  void initState() {
    supportTabCubit = BlocProvider.of<SupportTabCubit>(context);
    mainCityProvider = context.read<MainCityProvider>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Consumer2<MainCityProvider, EventProvider>(
        builder: (context, mainCityProvider, eventProvider, child) {
          return BlocBuilder<SupportTabCubit, SupportTabState>(
            buildWhen: (previous, current) {
              return previous.refreshUi != current.refreshUi;
            },
            builder: (context, state) {
              print("length => ${mainCityProvider.listmaincityfilter.length}");
              return SizedBox(
                  height: 50,
                  child: SearchableMultiSelectionDropdown(
                    items: mainCityProvider.listmaincityfilter,
                    selectedItems: mainCityProvider.selectedRegions,
                    hint: 'المنطقة',
                    onChanged: (data) {
                      // current data + newData
                      mainCityProvider.selectedRegions.add(data);
                      _onTap(
                        context: context,
                        data: mainCityProvider.selectedRegions,
                        eventProvider: context.read<EventProvider>(),
                        mainCityProvider: mainCityProvider,
                      );
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
                  ));
            },
          );
        },
      ),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer2<MainCityProvider, EventProvider>(
        builder: (context, mainCityProvider, eventProvider, child) {
          return BlocBuilder<SupportTabCubit, SupportTabState>(
            buildWhen: (previous, current) {
              print("current.refreshUi => ${current.refreshUi}");
              return previous.refreshUi != current.refreshUi;
            },
            builder: (context, state) {
              print(
                  "supportTabCubit.filterSelectedMainCity.length => ${supportTabCubit.filterSelectedMainCity.length}");
              return CustomMultiSelectionDropdown<MainCityModel>(
                items: supportTabCubit.allMainCities,
                selectedItems: supportTabCubit.filterSelectedMainCity,
                hint: 'المنطقة',
                onSave: (data) {
                  _onTap(
                    context: context,
                    data: data,
                    eventProvider: eventProvider,
                    mainCityProvider: mainCityProvider,
                  );
                },
                onItemAdded: (selectedItems, addedItem) {
                  print("order 2");

                  supportTabCubit.onChangeFilterSelectedMainCity(
                      data: selectedItems);
                },
                onItemRemoved: (selectedItems, removedItem) {
                  print("order 3");
                  supportTabCubit.onChangeFilterSelectedMainCity(
                      data: selectedItems);
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

  void _onTap({
    required BuildContext context,
    required List<MainCityModel> data,
    required EventProvider eventProvider,
    required MainCityProvider mainCityProvider,
  }) {
    final allCities = mainCityProvider.listmaincityfilter;
    final currentSelectedCities = data;
    final previousSelectedCities = mainCityProvider.selectedRegions;

    final bool previousAllSelected =
        previousSelectedCities.any((element) => element.id_maincity == '0');
    final bool currentAllSelected =
        currentSelectedCities.any((element) => element.id_maincity == '0');

    // to set the selected regions in the main city provider use >> mainCityProvider.changeitemlist(data);

    // cases
    // currentAllSelected = true, currentSelectedCities.length < allCities.length
    // currentAllSelected = false, currentSelectedCities.length == allCities.length - 1
    // previousAllSelected = false, currentAllSelected = true
    // previousAllSelected = true, currentAllSelected = false
    // previousAllSelected = false, currentAllSelected = false
    // previousAllSelected = true, currentAllSelected = true

    if (!previousAllSelected && currentAllSelected) {
      // previousAllSelected = false, currentAllSelected = true
      // assign all values
      mainCityProvider.changeItemsList(allCities);
    } else if (previousAllSelected && !currentAllSelected) {
      // previousAllSelected = true, currentAllSelected = false
      // remove all values
      mainCityProvider.changeItemsList([]);
    } else if (currentAllSelected &&
        currentSelectedCities.length < allCities.length) {
      // currentAllSelected = true, currentSelectedCities.length < allCities.length
      // assign new data without "all"
      mainCityProvider.changeItemsList(
          data.where((element) => element.id_maincity != '0').toList());
    } else if (!currentAllSelected &&
        currentSelectedCities.length == allCities.length - 1) {
      // currentAllSelected = false, currentSelectedCities.length == allCities.length - 1
      // add all cities
      mainCityProvider.changeItemsList(allCities);
    } else if (!previousAllSelected && !currentAllSelected) {
      // previousAllSelected = false, currentAllSelected = false
      // assign new data
      mainCityProvider.changeItemsList(data);
    } else {
      // previousAllSelected = true, currentAllSelected = true
      // assign all values
      mainCityProvider.changeItemsList(allCities);
    }

    // if (data.any((element) => element.id_maincity == '0')) {

    //   // todo: rebuild the dialog directly
    //   mainCityProvider.changeitemlist(mainCityProvider.listmaincityfilter);
    // } else {
    //   mainCityProvider.changeitemlist(data);
    // }

    if (data.any((element) => element.id_maincity == '0')) {
      eventProvider.onChangeFkMainCity(
        mainCityProvider.listmaincityfilter
            .where((element) => element.id_maincity != "0")
            .map((e) => e.id_maincity)
            .toList(),
      );
    } else {
      eventProvider.onChangeFkMainCity(
        data.map((e) => e.id_maincity).toList(),
      );
    }

    supportTabCubit.getDateInstallation(
      GetDateInstallationParams(
        fkCountry: AppConstants.currentCountry(context)!,
        fkUser: eventProvider.selectedFkUser,
        mainCityFks: data.map((e) => e.id_maincity).toList(),
      ),
    );
  }
}
