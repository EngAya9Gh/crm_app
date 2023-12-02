import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart';
import '../../../view_model/privilge_vm.dart';

class IsMarketingCheckbox_last extends StatefulWidget {
  const IsMarketingCheckbox_last({Key? key, required this.onChange}) : super(key: key);

  final ValueChanged<bool> onChange;

  @override
  State<IsMarketingCheckbox_last> createState() => _IsMarketingCheckbox_lastState();
}

class _IsMarketingCheckbox_lastState extends State<IsMarketingCheckbox_last> {
  late ValueNotifier<bool> _isMarketingNotifier;
  late bool haveMarketingPrivilege;

  @override
  void initState() {
    haveMarketingPrivilege =  context.read<PrivilegeCubit>().checkPrivilege('155');
    _isMarketingNotifier = ValueNotifier(haveMarketingPrivilege);
    if (haveMarketingPrivilege) {
      scheduleMicrotask(() => widget.onChange(haveMarketingPrivilege));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isMarketingNotifier,
        builder: (context, isMarketing, _) {
          return CheckboxListTile(
            value: isMarketing,
            enabled: !haveMarketingPrivilege,
            onChanged: (value) {
              if (value == null || haveMarketingPrivilege) {
                return;
              }

              widget.onChange(value);
              _isMarketingNotifier.value = value;
            },
            title: Text("التسويق الالكتروني"),
          );
        });
  }
}
