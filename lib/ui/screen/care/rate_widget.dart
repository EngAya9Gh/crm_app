import '../../../core/utils/extensions/build_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../features/app/presentation/widgets/app_text.dart';

class RateWidget extends StatelessWidget {
  const RateWidget({
    super.key,
    required this.context,
    required this.title,
    required this.rateValue,
    this.onRatingUpdate,
    this.isReadOnly = false,
    this.initialRating = 0.0,
  });

  final BuildContext context;
  final String title;
  final double rateValue;
  final void Function(double p1)? onRatingUpdate;
  final bool isReadOnly;
  final double initialRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: AppText(
            '${title}',
            style: context.textTheme.titleSmall?.copyWith(
              fontSize: 12.sp,
            ),
          ),
        ),
        RatingBar.builder(
          initialRating: initialRating,
          minRating: 0.0,
          direction: Axis.horizontal,
          allowHalfRating: false,
          ignoreGestures: isReadOnly,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: onRatingUpdate ?? (value) {},
        ),
      ],
    );
  }
}
