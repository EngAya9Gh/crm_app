import 'package:crm_smart/core/common/widgets/app_card_container.dart';
import 'package:crm_smart/core/common/widgets/app_status_chip.dart';
import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_fonts.dart';
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
      onTap: () => AppNavigator.go(TicketDetailsPage(ticketModel: ticket)),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "#${ticket.idTicket}",
                color: AppColors.primaryColor,
                fontFamily: AppFonts.fontFamily2,
              ),
              AppText(
                ticket.status != null && ticket.status!.isNotEmpty
                    ? "التاريخ ${ticket.status?.first.dateState}"
                    : '',
                color: AppColors.primaryColor,
                fontFamily: AppFonts.fontFamily2,
                fontSize: 18,
              ),
            ],
          ),
          AppText(
            details ?? ticket.nameEnterprise ?? '',
            fontFamily: AppFonts.fontFamily2,
            fontWeight: FontWeight.bold,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: AppStatusChip(
              status: TicketTypesEnum.fromString(ticket.status?.last.stateName)
                  .nameAr,
              color: TicketTypesEnum.fromString(ticket.status?.last.stateName)
                  .color,
            ),
          ),
          if (ticket.rate != null && ticket.rate != '') ...[
            AppRateWidget(
              context: context,
              title: 'التقييم',
              rateValue: double.tryParse(ticket.rate ?? '0') ?? 0,
              initialRating: double.tryParse(ticket.rate ?? '0') ?? 0,
              isReadOnly: true,
            ),
          ],
        ],
      ),
    );
  }
}
