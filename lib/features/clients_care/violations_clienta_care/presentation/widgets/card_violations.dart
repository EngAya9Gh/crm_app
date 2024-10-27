import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violations_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../app/presentation/widgets/app_text.dart';

class CardViolations extends StatelessWidget {
  const CardViolations({
    super.key,
    required this.violations_model,
    required this.tabCareIndex,
  });

  final Violations_Model violations_model;
  final int tabCareIndex;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () {
       // AppNavigator.go(
       //   idClient: communication.fkClient.toString(),
       //   ),
       //   pathParameters: {'idClient': communication.fkClient.toString()},
       //   name: AppRoutesNames.clientProfile.inCareWrongNumbers,
     //   );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        violations_model.name,
                        color: AppColors.primaryMain,
                        fontSize: 18,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        HelperFunctions.formatDate(
                          violations_model.updatedAt,
                        ),
                        color: AppColors.primaryMain,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            AppText(violations_model.acceptStatus),
          ],
        ),
      ),
    );
  }
}
