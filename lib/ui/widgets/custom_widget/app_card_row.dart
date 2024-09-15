import 'package:flutter/material.dart';

import '../../../features/app/presentation/widgets/app_text.dart';

class AppCardRow extends StatelessWidget {
  final String title;
  final String? value;
  final Widget? valueAsWidget;
  final MainAxisAlignment? mainAxisAlignment;

  const AppCardRow({
    super.key,
    required this.title,
    this.value,
    this.valueAsWidget,
    this.mainAxisAlignment,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: _mainAxisAlignment(),
      children: [
        AppText(title),
        if (valueAsWidget != null) ...[
          valueAsWidget!,
        ] else if (value != null) ...[
          Flexible(
            child: AppText(
              value!,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ],
    );
  }

  MainAxisAlignment _mainAxisAlignment() {
    if (mainAxisAlignment != null) {
      return mainAxisAlignment!;
    }
    if (valueAsWidget != null || (value?.isNotEmpty ?? false)) {
      return MainAxisAlignment.spaceBetween;
    }
    return MainAxisAlignment.start;
  }
}
