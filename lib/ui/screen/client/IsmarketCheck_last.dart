import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../features/app/presentation/widgets/app_text.dart';
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

class IsMarketingCheckbox_last extends StatefulWidget {
  const IsMarketingCheckbox_last({
    Key? key,
    required this.onChange,
    this.isMarketingNotifier,
  }) : super(key: key);

  final ValueChanged<bool> onChange;
  final ValueNotifier<bool>? isMarketingNotifier;

  @override
  State<IsMarketingCheckbox_last> createState() =>
      _IsMarketingCheckbox_lastState();
}

class _IsMarketingCheckbox_lastState extends State<IsMarketingCheckbox_last> {
  late ValueNotifier<bool> _isMarketingNotifier;
  late bool haveMarketingPrivilege;

  @override
  void initState() {
    haveMarketingPrivilege =
        context.read<PrivilegesCubit>().checkPrivilege('55');
    _prepareIsMarketingNotifier(haveMarketingPrivilege);
    if (haveMarketingPrivilege) {
      scheduleMicrotask(() => widget.onChange(haveMarketingPrivilege));
    }
    super.initState();
  }

  _prepareIsMarketingNotifier(bool isMarketing) {
    _isMarketingNotifier =
        widget.isMarketingNotifier ?? ValueNotifier(isMarketing);
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
            title: AppText("التسويق الالكتروني"),
          );
        });
  }
}
