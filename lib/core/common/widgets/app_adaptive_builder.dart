import 'package:crm_smart/core/config/size_config.dart';
import 'package:flutter/material.dart';

class AppLayoutBuilder extends StatelessWidget {
  const AppLayoutBuilder({
    super.key,
    required this.smallBuilder,
    this.mediumBuilder,
  });

  final WidgetBuilder smallBuilder;
  final WidgetBuilder? mediumBuilder;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < SizeConfig.tablet) {
      return smallBuilder(context);
    } else if (mediumBuilder != null) {
      return mediumBuilder!(context);
    }
    return smallBuilder(context);
  }
}
