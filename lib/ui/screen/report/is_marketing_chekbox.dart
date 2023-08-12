import 'package:flutter/material.dart';

class IsMarketingCheckbox extends StatefulWidget {
  const IsMarketingCheckbox({Key? key, required this.onChange}) : super(key: key);

  final ValueChanged<bool> onChange;

  @override
  State<IsMarketingCheckbox> createState() => _IsMarketingCheckboxState();
}

class _IsMarketingCheckboxState extends State<IsMarketingCheckbox> {
  ValueNotifier<bool> _isMarketingNotifier = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: _isMarketingNotifier,
        builder: (context, isMarketing, _) {
          return CheckboxListTile(
            value: isMarketing,
            onChanged: (value) {
              if (value == null) {
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
