import 'package:crm_smart/core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';

class AppDraggableSheet<T> extends StatelessWidget {
  const AppDraggableSheet._({
    Key? key,
    required this.builder,
    this.needSearchInput = false,
    this.minChildSize,
    this.maxChildSize,
    this.initialChildSize,
  }) : super(key: key);

  final ScrollableWidgetBuilder builder;
  final double? minChildSize;
  final double? maxChildSize;
  final double? initialChildSize;
  final bool needSearchInput;

  static Future<T?> show<T>({
    required BuildContext context,
    required ScrollableWidgetBuilder builder,
    final double? minChildSize,
    final double? maxChildSize,
    final double? initialChildSize,
  }) =>
      showModalBottomSheet<T>(
        context: context,
        enableDrag: true,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: context.colorScheme.background,
        builder: (_) => AppDraggableSheet._(
          builder: builder,
          initialChildSize: initialChildSize,
          maxChildSize: maxChildSize,
          minChildSize: minChildSize,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: minChildSize ?? 0.4,
      maxChildSize: maxChildSize ?? 0.95,
      initialChildSize: initialChildSize ?? 0.6,
      expand: false,
      builder: builder,
    );
  }
}
