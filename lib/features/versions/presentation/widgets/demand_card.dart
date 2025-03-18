
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/core/utils/app_fonts.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:crm_smart/features/versions/presentation/manager/versions_bloc.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class demandCardWidget extends StatelessWidget {
  const demandCardWidget({
    super.key,
    required this.status,
    required this.item,
  });

  final DemandVersion status;
  final DemandModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 8.0,
            color: Colors.black87.withOpacity(0.2),
          ),
        ],
      ),
      child: InkWell(
        onTap: () {},
        child: IntrinsicHeight(
          child: Row(
            children: [
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: status.color,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            item.goal ?? '',
                            color: AppColors.primaryMain,
                            fontSize: 16.scaleFontSize,
                          ),
                          AppText(
                            DateFormat('yyyy-MM-dd').format(item.createdAt ?? DateTime.now()),
                            color: AppColors.primaryMain,
                            fontSize: 16.scaleFontSize,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            item.title ?? '',
                            color: AppColors.primaryMain,
                            fontSize: 20.scaleFontSize,
                            fontWeight: FontWeight.w600,
                          ),
                          AppStatusChip(
                            status: status.text,
                            color: status.color,
                            fontSize: 13.scaleFontSize,
                          ),
                        ],
                      ),
                      8.height,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "الادارة : ",
                            fontSize: 18.scaleFontSize,
                            fontFamily: AppFonts.fontFamily1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryMain,
                          ),
                          Expanded(
                            child: AppText(
                              item.management ?? '',
                              fontSize: 18.scaleFontSize,
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      8.height,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "الموظف الذي اضاف الطلب : ",
                            fontSize: 18.scaleFontSize,
                            fontFamily: AppFonts.fontFamily1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryMain,
                          ),
                          Expanded(
                            child: AppText(
                              item.nameUser ?? '',
                              fontSize: 18.scaleFontSize,
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      8.height,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "الوصف : ",
                            fontSize: 18.scaleFontSize,
                            fontFamily: AppFonts.fontFamily1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryMain,
                          ),
                          Expanded(
                            child: AppText(
                              item.description ?? '',
                              fontSize: 18.scaleFontSize,
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      if (item.notes != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "الملاحظات : ",
                              fontSize: 18.scaleFontSize,
                              fontFamily: AppFonts.fontFamily1,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryMain,
                            ),
                            Expanded(
                              child: AppText(
                                item.notes ?? '',
                                fontSize: 18.scaleFontSize,
                                fontFamily: AppFonts.fontFamily1,
                                fontWeight: FontWeight.bold,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
