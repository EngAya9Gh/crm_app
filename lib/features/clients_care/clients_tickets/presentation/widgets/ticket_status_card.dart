import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/common/widgets/card_row_divided.dart';
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
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardRowDivided(
              title: currentTicketType.nameAr,
              value: statusModel.dateState ?? '',
            ),
            SizedBox(height: 10),
            CardRowDivided(
              title: currentTicketType.getUserTitle(),
              value: statusModel.userName ?? '',
            ),
            SizedBox(height: 10),
            CardRowDivided(
              title: 'ملاحظات',
              value: statusModel.notes ?? '',
            ),
            if (currentTicketType == TicketTypesEnum.close) ...[
              SizedBox(height: 10),
              CardRowDivided(
                title: 'الفئات',
                value: ticketModel.categoriesTicketFk
                        ?.map((e) => e.categoryAr)
                        .join(', ') ??
                    '',
                maxLines: 3,
              ),
              SizedBox(height: 10),
              CardRowDivided(
                title: 'الفئات الفرعية',
                value: ticketModel.subcategoriesTicketFk
                        ?.map((e) => e.subCategoryAr)
                        .join(', ') ??
                    '',
                maxLines: 3,
              ),
            ],
            if (currentTicketType == TicketTypesEnum.rate) ...[
              SizedBox(height: 10),
              CardRowDivided(
                title: 'التقييم',
                value: ticketModel.rate,
                valueAsWidget: RatingBar.builder(
                  initialRating: double.parse(ticketModel.rate ?? '0'),
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
          ],
        ),
      ),
    );
  }
}
