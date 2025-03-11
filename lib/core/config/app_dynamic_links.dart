import 'package:crm_smart/features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/pages/ticket_detail_page.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/pages/tickets_page.dart';
import 'package:crm_smart/features/clients_care/crud_activites/presentation/pages/crud_activities_page.dart';
import 'package:crm_smart/features/sales/deleted_invoices/presentation/pages/deleted_invoices_page.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import 'package:crm_smart/features/sales/public_relations/participates/presentation/pages/participate_list_page.dart';
import 'package:flutter/cupertino.dart';

import '../../features/sales/clients/clients_transfer_approvals/presentation/pages/clients_transfer_approvals_page.dart';
import '../../features/sales/clients/finance_pending/presentation/pages/finance_pending_page.dart';
import '../../features/sales/clients/latest_clients_updates/presentation/pages/latest_clients_updates_page.dart';
import '../../features/sales/clients/pending_invoices/presentation/pages/pending_invoices_page.dart';
import '../../features/task_management/presentation/pages/task_management_list_page.dart';
import '../../ui/screen/client/client_profile.dart';

abstract class AppDynamicLinks {
  static void routeNotifyTo(
    typeNotify,
    context,
    Map<String, dynamic>? data,
    String? dataNotify,
  ) {
    switch (typeNotify) {
      case "ApproveRequest":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => PendingInvoicesPage()));
        break;
      case "ApproveFRequest":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => FinancePendingPage()));
        break;
      case "checkComment":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => LatestClientsUpdatesPage()));
        break;
      // todo: add task
      case "task":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => TaskManagementListPage()));
        break;
      case "Transfer":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ClientsTransferApprovalsPage()));
        break;
      case "TransferRefuse":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;
      case "TransferAccept":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;
      case "AddPayment":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 1,
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;
      case "EditInvoice":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 1,
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;
      case "NotReady":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 3,
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;

      case "ApproveDone":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "ApproveRefuse":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "InvoiceDeleted":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => DeletedInvoicesPage()));
        break;
      case "Install":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "AddComment":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 2,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "commentMention":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 2,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "Marketing Client":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 2,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "OpenTicket":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 5,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "InvoiceUpdated":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 1,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "InvoiceBack":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;

      case "InvoiceReplay":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 3,
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "TransferTicket":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 5,
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "exclude":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 0,
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "deviceAdd":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 1,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
      case "deviceReady":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 3,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
      case "receiveClient":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
      case "closeSchedule":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 7,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
      case "installCanceled":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 3,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
      case "reInstall":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 3,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
      case "activity":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return CrudActivitiesPage();
        }));
        break;
      case "addTicket":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return TicketsPage();
        }));
        break;
      case "scheduleClient":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 3,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
      //todo need model
      case "closeTicket":
        context.read<TicketsCubit>().getTicketById(
              GetTicketByIdParams(id: '1'),
              (ticket) => Navigator.push(
                context,
                CupertinoPageRoute(builder: (context) {
                  return TicketDetailsPage(
                    ticketModel: ticket,
                  );
                }),
              ),
            );
        break;
        //todo:
      case "agentVisit":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return AgentProfilePage(
            idAgent: '1',
            tabIndex: 4,
          );
        }));
        break;
      case "clientVisit":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 7,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
        //todo need model
      case "participateAdd":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ParticipateListPage();
        }));
        break;
    }
  }
}
