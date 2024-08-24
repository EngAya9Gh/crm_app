import 'package:crm_smart/features/common/regions/presentation/pages/regions_multi_selection_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
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
            RegionsMultiSelectionDropdown(
              selectedCities: _clientsAcceptCubit
                      .filterSupportClientsAcceptEntity
                      .fkMainCitiesNotifier
                      .value ??
                  [],
              onSave: (value) => _clientsAcceptCubit
                  .filterSupportClientsAcceptEntity
                  .fkMainCitiesNotifier
                  .value = value,
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
