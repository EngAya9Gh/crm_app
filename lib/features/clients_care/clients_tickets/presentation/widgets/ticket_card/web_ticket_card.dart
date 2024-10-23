import 'package:crm_smart/ui/screen/care/app_rate_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../../core/common/widgets/app_card_container.dart';
import '../../../../../../core/common/widgets/app_elevated_button.dart';
import '../../../../../../core/common/widgets/app_status_chip.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_fonts.dart';
import '../../../../../app/presentation/widgets/app_text.dart';
import '../../../data/models/ticket_model.dart';
import '../../pages/ticket_detail_page.dart';

class WebTicketCard extends StatelessWidget {
  const WebTicketCard({
    super.key,
    required this.ticket,
    this.details,
  });

  final TicketModel ticket;
  final String? details;

  @override
  Widget build(BuildContext context) {
    return AppCardContainer(
      onTap: () => AppNavigator.go(
        TicketDetailsPage(ticketModel: ticket),
        isNew: false,
      ),
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            "${ticket.idTicket}#",
            color: AppColors.primaryMain,
            fontFamily: AppFonts.fontFamily1,
          ),
          Spacer(),
          Expanded(
            flex: 4,
            child: AppText(
              details ?? ticket.nameEnterprise ?? '',
              fontFamily: AppFonts.fontFamily1,
              fontWeight: FontWeight.bold,
            ),
          ),
          Flexible(
            flex: 4,
            child: AppText(
              ticket.status != null && ticket.status!.isNotEmpty
                  ? "التاريخ ${ticket.status?.first.dateState}"
                  : '',
              color: AppColors.primaryMain,
              fontFamily: AppFonts.fontFamily1,
              fontSize: 18,
            ),
          ),
          Spacer(),
          AppStatusChip(
            status: TicketTypesEnum.fromString(ticket.status?.last.stateName)
                .nameAr,
            color:
                TicketTypesEnum.fromString(ticket.status?.last.stateName).color,
          ),
          if (ticket.rate != null && ticket.rate != '') ...[
            Spacer(),
            SizedBox(
              width: 250,
              child: AppRateWidget(
                title: 'التقييم',
                rateValue: double.tryParse(ticket.rate ?? '0') ?? 0,
                initialRating: double.tryParse(ticket.rate ?? '0') ?? 0,
                isReadOnly: true,
              ),
            ),
          ],
          Spacer(),
          AppElevatedButton(
            text: 'عرض',
            icon: Icons.remove_red_eye,
            height: 40,
            onPressed: () => AppNavigator.go(
              TicketDetailsPage(ticketModel: ticket),
              isNew: false,
            ),
          ),
        ],
      ),
    );
  }
}
