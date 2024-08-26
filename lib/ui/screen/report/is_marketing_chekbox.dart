import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

class IsMarketingCheckbox extends StatefulWidget {
  const IsMarketingCheckbox({
    super.key,
    required this.onChange,
    required this.isMarketingNotifier,
  });

  final ValueChanged<bool> onChange;
  final ValueNotifier<bool> isMarketingNotifier;

  @override
  State<IsMarketingCheckbox> createState() => _IsMarketingCheckboxState();
}

class _IsMarketingCheckboxState extends State<IsMarketingCheckbox> {
  late bool haveMarketingPrivilege;

  @override
  void initState() {
    haveMarketingPrivilege =
        context.read<PrivilegesCubit>().checkPrivilege('155');
    if (haveMarketingPrivilege) {
      widget.onChange(haveMarketingPrivilege);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: widget.isMarketingNotifier,
        builder: (context, isMarketing, _) {
          return CheckboxListTile(
            value: isMarketing,
            enabled: !haveMarketingPrivilege,
            onChanged: (value) {
              if (value == null || haveMarketingPrivilege) {
                return;
              }

              widget.onChange(value);
              widget.isMarketingNotifier.value = value;
            },
            title: Text("التسويق الالكتروني"),
          );
        });
  }
}
