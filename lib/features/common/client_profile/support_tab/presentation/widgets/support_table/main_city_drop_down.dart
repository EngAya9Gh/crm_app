import 'package:crm_smart/core/common/widgets/custom_multi_selection_dropdown.dart';
import 'package:crm_smart/core/utils/app_strings.dart';
import 'package:crm_smart/model/maincitymodel.dart';
import 'package:crm_smart/view_model/event_provider.dart';
import 'package:crm_smart/view_model/maincity_vm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainCityDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Consumer<MainCityProvider>(
        builder: (context, mainCityProvider, child) {
          return CustomMultiSelectionDropdown<MainCityModel>(
            items: mainCityProvider.listmaincityfilter,
            selectedItems: mainCityProvider.selectedRegions,
            hint: 'المنطقة',
            onChanged: (data) {
              mainCityProvider.changeitemlist(data);
              final eventProvider = context.read<EventProvider>();
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
}
