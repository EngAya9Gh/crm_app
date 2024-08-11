import 'package:crm_smart/core/common/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/card_row_divided.dart';
import '../../../../../model/communication_modle.dart';

class RatingDetailsCard extends StatelessWidget {
  const RatingDetailsCard({
    super.key,
    required this.rate,
  });

  final RatingModel rate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.grey.withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
        child: Column(
          children: [
            CardRowDivided(
              title: "تاريخ التقييم",
              value: HelperFunctions.formatDate(rate.dateUpdate),
            ),
            10.height,
            CardRowDivided(
              title: "الشخص الذي قام بالتقييم",
              value: rate.nameUserUpdateRating,
            ),
            10.height,
            CardRowDivided(
              title: 'التقييم الجديد',
              value: rate.newRate,
              valueAsWidget: RatingBar.builder(
                initialRating: double.parse(rate.newRate ?? '0'),
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 25,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
                ignoreGestures: true,
              ),
            ),
            10.height,
            CardRowDivided(
              title: 'التقييم القديم',
              value: rate.oldRate,
              valueAsWidget: RatingBar.builder(
                initialRating: double.tryParse(rate.oldRate ?? '0') ?? 0,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemCount: 5,
                itemSize: 25,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
                ignoreGestures: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
