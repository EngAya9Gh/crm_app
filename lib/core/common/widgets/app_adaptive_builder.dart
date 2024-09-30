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
  final bool isUnique = true;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.sizeOf(context).width < SizeConfig.tablet) {
      return isUnique
          ? _UniqueWidget(child: smallBuilder(context), key: UniqueKey())
          : smallBuilder(context);
    } else if (mediumBuilder != null) {
      return isUnique
          ? _UniqueWidget(child: mediumBuilder!(context), key: UniqueKey())
          : mediumBuilder!(context);
    }
    return isUnique
        ? _UniqueWidget(child: smallBuilder(context), key: UniqueKey())
        : smallBuilder(context);
  }
}

class _UniqueWidget extends StatelessWidget {
  const _UniqueWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
