import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:crm_smart/ui/widgets/custom_widget/app_card_row.dart';
import 'package:crm_smart/ui/widgets/custom_widget/card_row.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../ui/screen/care/app_rate_widget.dart';
import '../../data/models/status_model.dart';
import '../../data/models/ticket_model.dart';

class TicketStatusCard extends StatelessWidget {
  const TicketStatusCard({
    Key? key,
    required this.statusModel,
    required this.ticketModel,
  }) : super(key: key);

  final TicketModel ticketModel;
  final StatusModel statusModel;

  @override
  Widget build(BuildContext context) {
    final currentTicketType =
        TicketTypeExtension.getTicketType(statusModel.stateName);
    return Card(
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CardRow(
                title: currentTicketType.nameAr,
                value: statusModel.dateState ?? '',
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(height: 2),
              CardRow(
                title: currentTicketType.getUserTitle(),
                value: statusModel.userName ?? '',
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              SizedBox(height: 2),
              CardRow(
                title: 'ملاحظات',
                value: statusModel.notes ?? '',
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              if (currentTicketType == TicketTypesEnum.close) ...[
                SizedBox(height: 2),
                CardRow(
                  title: 'الفئات',
                  value: ticketModel.categoriesTicketFk
                          ?.map((e) => e.categoryAr)
                          .join(', ') ??
                      '',
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
                SizedBox(height: 2),
                CardRow(
                  title: 'الفئات الفرعية',
                  value: ticketModel.subcategoriesTicketFk
                          ?.map((e) => e.subCategoryAr)
                          .join(', ') ??
                      '',
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
              ],
              if (currentTicketType == TicketTypesEnum.rate) ...[
                SizedBox(height: 2),
                AppRateWidget(
                  title: '',
                  initialRating: double.parse(ticketModel.rate ?? '0'),
                  rateValue: double.parse(ticketModel.rate ?? '0'),
                  isReadOnly: true,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
