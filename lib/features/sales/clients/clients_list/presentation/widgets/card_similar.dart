import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../../model/similar_client.dart';

class CardSimilar extends StatelessWidget {
  const CardSimilar({
    super.key,
    required this.smClient,
  });

  final SimilarClient smClient;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10).r,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 8.0,
            color: Colors.black87.withOpacity(0.1),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    smClient.name_enterprise.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.fontFamily1),
                  ),
                ),
                Text(
                  smClient.phone.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.fontFamily1),
                ),
                // Text(
                //   smClient.phone.toString(),
                //   style: TextStyle(fontWeight: FontWeight.bold, fontFamily: AppFonts.fontFamily1),
                // ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    smClient.name_client.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: AppFonts.fontFamily1),
                  ),
                ),
                Text(
                  DateTime.tryParse(smClient.date_create) != null
                      ? intl.DateFormat("dd MMMM yyyy, hh:mm a")
                          .format(DateTime.parse(smClient.date_create))
                      : smClient.date_create.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: AppFonts.fontFamily1,
                      color: AppColors.primaryMain),
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
