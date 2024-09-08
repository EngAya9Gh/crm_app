import 'package:crm_smart/features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart';
import 'package:crm_smart/features/common/cities/presentation/pages/cities_searchable_drop_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';

class FilterSpecialClientsSheet extends StatefulWidget {
  const FilterSpecialClientsSheet({super.key});

  @override
  State<FilterSpecialClientsSheet> createState() =>
      _FilterSpecialClientsSheetState();
}

class _FilterSpecialClientsSheetState extends State<FilterSpecialClientsSheet> {
  late final SpecialClientsBloc _bloc;

  @override
  void initState() {
    _bloc = context.read<SpecialClientsBloc>();

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
                  _bloc.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _bloc.filterEntity.checkIfFilterIsNotEmpty()
                        ? () {
                            _bloc.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            CitiesSearchableDropDown(
              hint: "المدينة",
              selectedCityId: _bloc.filterEntity.cityNotifier.value?.cityId,
              onSelected: (city) {
                return _bloc.filterEntity.cityNotifier.value = city;
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
    _bloc.add(GetSpecialClientsEvent());
    AppNavigator.pop(result: true);
  }
}
