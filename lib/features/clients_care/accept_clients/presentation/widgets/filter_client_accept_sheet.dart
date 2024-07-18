import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/widgets/app_elvated_button.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../../../../common/regions/presentation/pages/regions_searchable_drop_down.dart';
import '../manager/clients_accept_cubit.dart';

class FilterClientAcceptSheet extends StatefulWidget {
  const FilterClientAcceptSheet({super.key});

  @override
  State<FilterClientAcceptSheet> createState() =>
      _FilterClientAcceptSheetState();
}

class _FilterClientAcceptSheetState extends State<FilterClientAcceptSheet> {
  late final ClientsAcceptCubit _clientsAcceptCubit;

  @override
  void initState() {
    _clientsAcceptCubit = context.read<ClientsAcceptCubit>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: ListenableBuilder(
              listenable: Listenable.merge(
                _clientsAcceptCubit.filterClientsAcceptEntity.listenables(),
              ),
              builder: (context, child) {
                return AppTextButton(
                  text: "إعادة الافتراضي",
                  onPressed: _clientsAcceptCubit.filterClientsAcceptEntity
                          .checkIfFilterIsNotEmpty()
                      ? () {
                          _clientsAcceptCubit.filterClientsAcceptEntity
                              .clearFilters();
                          _filterAndCloseDialog();
                        }
                      : null,
                  appButtonStyle: AppButtonStyle.secondary,
                );
              },
            ),
          ),
          RegionSearchableDropDown(
            selectedRegionId: _clientsAcceptCubit
                .filterClientsAcceptEntity.fkRegionNotifier.value?.regionId,
            onSelected: (region) {
              print(region?.regionId);
              return _clientsAcceptCubit
                  .filterClientsAcceptEntity.fkRegionNotifier.value = region;
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
    );
  }

  void _filterAndCloseDialog() {
    _clientsAcceptCubit.getClientsAccept(
      fkCountry: AppConstants.currentCountry(context) ?? '',
    );
    AppNavigator.pop(result: true);
  }
}
