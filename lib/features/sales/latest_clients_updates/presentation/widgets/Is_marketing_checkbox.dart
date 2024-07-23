import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../mangement/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../manager/latest_clients_updates_cubit.dart';

class IsMarketingCheckbox extends StatelessWidget {
  const IsMarketingCheckbox({
    super.key,
    required this.onChange,
  });

  final ValueChanged<bool> onChange;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LatestClientsUpdatesCubit>();
    final haveMarketingPrivilege =
        context.read<PrivilegeCubit>().checkPrivilege('155');
    return ValueListenableBuilder<bool>(
      valueListenable: cubit.filterLatestUpdatesEntity.isMarketingNotifier,
      builder: (context, isMarketing, _) {
        return CheckboxListTile(
          value: isMarketing,
          enabled: !haveMarketingPrivilege,
          onChanged: (value) {
            if (haveMarketingPrivilege || value == null) {
              return;
            }

            onChange(value);
          },
          title: Text("التسويق الالكتروني"),
        );
      },
    );
  }
}
