import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../features/app/presentation/widgets/app_text.dart';

class AppRateWidget extends StatelessWidget {
  const AppRateWidget({
    super.key,
    this.title,
    required this.rateValue,
    this.onRatingUpdate,
    this.isReadOnly = false,
    this.initialRating = 0.0,
    this.isVertical = false,
    this.iconSize,
  });

  final String? title;
  final double rateValue;
  final void Function(double p1)? onRatingUpdate;
  final bool isReadOnly;
  final double initialRating;
  final bool isVertical;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    final children = [
      if (title != null) ...[
        if (isVertical) ...[
          _RateWidgetHint(title: title!),
          5.height,
        ] else ...[
          Expanded(child: _RateWidgetHint(title: title!)),
        ],
      ],
      _RateWidgetRatingBar(
        initialRating: initialRating,
        isReadOnly: isReadOnly,
        onRatingUpdate: onRatingUpdate,
        iconSize: iconSize,
      ),
    ];
    if (isVertical) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      );
    }
    return Row(
      children: children,
    );
  }
}

class _RateWidgetHint extends StatelessWidget {
  const _RateWidgetHint({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppText(
      '${title}',
      fontSize: 15.scaleFontSize,
    );
  }
}

class _RateWidgetRatingBar extends StatelessWidget {
  const _RateWidgetRatingBar({
    required this.initialRating,
    required this.isReadOnly,
    required this.onRatingUpdate,
    this.iconSize,
  });

  final double initialRating;
  final bool isReadOnly;
  final void Function(double p1)? onRatingUpdate;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 0.0,
      direction: Axis.horizontal,
      allowHalfRating: false,
      ignoreGestures: isReadOnly,
      itemCount: 5,
      itemSize: iconSize?.scaleIconsSize ?? 30.scaleFontSize,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
        size: iconSize?.scaleIconsSize ?? 25.scaleFontSize,
      ),
      onRatingUpdate: onRatingUpdate ?? (value) {},
    );
  }
}
