import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/ui/widgets/custom_widget/app_card_row.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
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
            AppCardRow(
              title: "تاريخ التقييم",
              value: HelperFunctions.formatDate(rate.dateUpdate),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            10.height,
            AppCardRow(
              title: "الشخص الذي قام بالتقييم",
              value: rate.nameUserUpdateRating,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            10.height,
            AppRateWidget(
              title: 'التقييم الجديد',
              rateValue: double.tryParse(rate.newRate ?? '0') ?? 0,
              initialRating: double.tryParse(rate.newRate ?? '0') ?? 0,
              isReadOnly: true,
            ),
            10.height,
            AppRateWidget(
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
