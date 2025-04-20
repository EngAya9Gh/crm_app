import 'package:flutter/material.dart';
import 'package:crm_smart/core/common/extensions/num_extensions.dart';
import 'package:crm_smart/features/app/presentation/widgets/app_text.dart';
import '../../../../../../features/clients_care/clients_tickets/data/models/ticket_model.dart';
import '../../../../../../core/common/enums/ticket_types_enum.dart';
import '../../../../../../core/config/navigator/app_navigator.dart';
import '../../../../../../features/clients_care/clients_tickets/presentation/pages/ticket_detail_page.dart';
import '../../../../../../ui/screen/care/app_rate_widget.dart';

class TicketCardNew extends StatelessWidget {
  final TicketModel ticket;
  final bool showEnterpriseName;

  const TicketCardNew({
    Key? key,
    required this.ticket,
    this.showEnterpriseName = true,
  }) : super(key: key);

  Color _getTicketStatusColor(String? dateClose) {
    final lastStatus = ticket.status?.lastOrNull?.stateName;
    final ticketType = TicketTypesEnum.fromString(lastStatus);
    return ticketType.color;
  }

  String _getTicketStatusText(String? dateClose) {
    final lastStatus = ticket.status?.lastOrNull?.stateName;
    final ticketType = TicketTypesEnum.fromString(lastStatus);
    return ticketType.nameAr;
  }

  IconData _getTicketStatusIcon(String? dateClose) {
    final lastStatus = ticket.status?.lastOrNull?.stateName;
    final ticketType = TicketTypesEnum.fromString(lastStatus);
    switch (ticketType) {
      case TicketTypesEnum.close:
      case TicketTypesEnum.rate:
        return Icons.check_circle;
      case TicketTypesEnum.suspend:
        return Icons.pause_circle_outline;
      case TicketTypesEnum.receive:
        return Icons.engineering;
      case TicketTypesEnum.open:
      case TicketTypesEnum.reopen:
        return Icons.fiber_new;
    }
  }

  String _getDateText() {
    final lastStatus = ticket.status?.lastOrNull;
    if (lastStatus == null) return '';

    final ticketType = TicketTypesEnum.fromString(lastStatus.stateName);
    switch (ticketType) {
      case TicketTypesEnum.close:
        return 'تاريخ إغلاق التذكرة: ${lastStatus.dateState}';
      case TicketTypesEnum.receive:
        return 'تاريخ استلام التذكرة: ${lastStatus.dateState}';
      case TicketTypesEnum.open:
      case TicketTypesEnum.reopen:
        return 'تاريخ فتح التذكرة: ${lastStatus.dateState}';
      default:
        return 'التاريخ: ${lastStatus.dateState}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.go(
          TicketDetailsPage(ticketModel: ticket),
          isNew: false,
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  _getTicketStatusIcon(ticket.dateClose),
                  color: _getTicketStatusColor(ticket.dateClose),
                ),
                8.width,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          AppText(
                            '#${ticket.idTicket}',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[600],
                          ),
                          8.width,
                          Expanded(
                            child: AppText(
                              ticket.typeProblem ?? '',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      if (showEnterpriseName &&
                          ticket.nameEnterprise != null) ...[
                        4.height,
                        AppText(
                          ticket.nameEnterprise!,
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
            if (ticket.detailsProblem != null &&
                ticket.detailsProblem!.isNotEmpty) ...[
              8.height,
              AppText(
                ticket.detailsProblem!,
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ],
            8.height,
            Row(
              children: [
                Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                4.width,
                AppText(
                  _getDateText(),
                  fontSize: 12,
                  color: Colors.grey,
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: _getTicketStatusColor(ticket.dateClose)
                        .withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: AppText(
                    _getTicketStatusText(ticket.dateClose),
                    fontSize: 12,
                    color: _getTicketStatusColor(ticket.dateClose),
                  ),
                ),
              ],
            ),
            if (ticket.rate != null && ticket.rate != '') ...[
              8.height,
              AppRateWidget(
                title: '',
                rateValue: double.tryParse(ticket.rate ?? '0') ?? 0,
                initialRating: double.tryParse(ticket.rate ?? '0') ?? 0,
                isReadOnly: true,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
