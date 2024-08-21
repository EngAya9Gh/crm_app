import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_navigator.dart';
import '../../../../app/presentation/widgets/app_text.dart';
import '../../data/models/ticket_model.dart';
import '../pages/ticket_detail_page.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.ticket,
    this.details,
  });

  final TicketModel ticket;
  final String? details;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () => AppNavigator.push(TicketDetailsPage(ticketModel: ticket)),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "#${ticket.idTicket}",
                color: kMainColor,
                fontFamily: kfontfamily2,
              ),
              AppText(
                ticket.status != null && ticket.status!.isNotEmpty
                    ? "التاريخ ${ticket.status?.first.dateState}"
                    : '',
                color: kMainColor,
                fontFamily: kfontfamily2,
                fontSize: 18,
              ),
            ],
          ),
          AppText(
            details ?? ticket.nameEnterprise ?? '',
            fontFamily: kfontfamily2,
            fontWeight: FontWeight.bold,
          ),
          if (ticket.rate != null && ticket.rate != '') ...[
            AppRateWidget(
              context: context,
              title: 'التقييم',
              rateValue: double.parse(ticket.rate ?? '0'),
              initialRating: double.parse(ticket.rate ?? '0'),
              isReadOnly: true,
            ),
          ],
        ],
      ),
    );
  }
}
