import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../core/common/extensions/num_extensions.dart';
import '../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../../../app/presentation/widgets/app_text_button.dart';
import '../manager/exceeded_clients_cubit.dart';

class FilterExceededClientsSheet extends StatefulWidget {
  const FilterExceededClientsSheet({super.key});

  @override
  State<FilterExceededClientsSheet> createState() =>
      _FilterExceededClientsSheetState();
}

class _FilterExceededClientsSheetState
    extends State<FilterExceededClientsSheet> {
  late final ExceededClientsCubit _clientsAcceptCubit;

  @override
  void initState() {
    _clientsAcceptCubit = context.read<ExceededClientsCubit>();

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
                  _clientsAcceptCubit.filterEntity.listenables(),
                ),
                builder: (context, child) {
                  return AppTextButton(
                    text: "إعادة الافتراضي",
                    onPressed: _clientsAcceptCubit.filterEntity
                            .checkIfFilterIsNotEmpty()
                        ? () {
                            _clientsAcceptCubit.filterEntity.clearFilters();
                            _filterAndCloseDialog();
                          }
                        : null,
                    appButtonStyle: AppButtonStyle.secondary,
                  );
                },
              ),
            ),
            StatefulBuilder(builder: (context, refresh) {
              return SwitchListTile(
                title: AppText("عملاء مع فترة السماح"),
                value: _clientsAcceptCubit.filterEntity.passLimitNotifier.value,
                onChanged: (value) {
                  _clientsAcceptCubit.filterEntity.passLimitNotifier.value =
                      value;
                  refresh(() {});
                },
              );
            }),
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
    _clientsAcceptCubit.getExceededClients();
    AppNavigator.pop(result: true);
  }
}
