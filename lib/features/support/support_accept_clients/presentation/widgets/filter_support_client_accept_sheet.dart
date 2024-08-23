import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../../model/maincitymodel.dart';
import '../../../../../ui/widgets/client_widget/regions_multi_selection_dropdown.dart';
import '../../../../../view_model/maincity_vm.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/support_clients_accept_cubit.dart';

class FilterSupportClientAcceptSheet extends StatefulWidget {
  const FilterSupportClientAcceptSheet({super.key});

  @override
  State<FilterSupportClientAcceptSheet> createState() =>
      _FilterSupportClientAcceptSheetState();
}

class _FilterSupportClientAcceptSheetState
    extends State<FilterSupportClientAcceptSheet> {
  late final SupportClientsAcceptCubit _clientsAcceptCubit;

  @override
  void initState() {
    _clientsAcceptCubit = context.read<SupportClientsAcceptCubit>();

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
                  _clientsAcceptCubit.filterSupportClientsAcceptEntity
                      .listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _clientsAcceptCubit
                            .filterSupportClientsAcceptEntity
                            .checkIfFilterIsNotEmpty()
                        ? () {
                            _clientsAcceptCubit.filterSupportClientsAcceptEntity
                                .clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            Consumer<MainCityProvider>(
              builder: (context, cart, child) {
                return RegionsMultiSelectionDropdown<MainCityModel>(
                  hint: 'المنطقة',
                  items: Provider.of<MainCityProvider>(context, listen: false)
                      .listmaincityfilter,
                  selectedItems: _clientsAcceptCubit
                          .filterSupportClientsAcceptEntity
                          .fkMainCitiesNotifier
                          .value ??
                      [],
                  itemAsString: (u) => u!.userAsString(),
                  style2: true,
                  compareFn: (a, b) => a.id_maincity == b.id_maincity,
                  onChanged: (data) {
                    _clientsAcceptCubit.filterSupportClientsAcceptEntity
                        .fkMainCitiesNotifier.value = data;
                  },
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
    _clientsAcceptCubit.getSupportClientsAccept(
      fkCountry: AppConstants.currentCountry,
    );
    AppNavigator.pop(result: true);
  }
}
