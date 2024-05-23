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
  late final supportTabCubit;

  @override
  void initState() {
    supportTabCubit = BlocProvider.of<SupportTabCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer2<MainCityProvider, EventProvider>(
        builder: (context, mainCityProvider, eventProvider, child) {
          return CustomMultiSelectionDropdown<MainCityModel>(
            items: mainCityProvider.listmaincityfilter,
            selectedItems: mainCityProvider.selectedRegions,
            hint: 'المنطقة',
            onChanged: (data) {
              _onTap(
                context: context,
                data: data,
                eventProvider: eventProvider,
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
    // if old has 0 and new has not 0 then remove all
    if (data.any((element) => element.id_maincity == '0')) {
      // todo: rebuild the dialog directly
      mainCityProvider.changeitemlist(mainCityProvider.listmaincityfilter);
    } else {
      mainCityProvider.changeitemlist(data);
    }

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
