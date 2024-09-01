import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/common/widgets/card_row_divided.dart';
import '../../../../../model/communication_modle.dart';
import '../../../../../ui/screen/care/app_rate_widget.dart';

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
            AppRateWidget(
              context: context,
              title: 'التقييم الجديد',
              rateValue: double.tryParse(rate.newRate ?? '0') ?? 0,
              initialRating: double.tryParse(rate.newRate ?? '0') ?? 0,
              isReadOnly: true,
            ),
            10.height,
            AppRateWidget(
              context: context,
              title: 'التقييم القديم',
              rateValue: double.tryParse(rate.oldRate ?? '0') ?? 0,
              initialRating: double.tryParse(rate.oldRate ?? '0') ?? 0,
              isReadOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
