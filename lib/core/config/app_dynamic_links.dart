import 'package:crm_smart/features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/pages/ticket_detail_page.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/presentation/pages/tickets_page.dart';
import 'package:crm_smart/features/clients_care/crud_activites/presentation/pages/crud_activities_page.dart';
import 'package:crm_smart/features/mangement/manage_withdrawals/presentation/pages/withdrawal_actions_page.dart';
import 'package:crm_smart/features/mangement/manage_withdrawals/presentation/pages/withdrawn_details_page.dart';
import 'package:crm_smart/features/sales/deleted_invoices/presentation/pages/deleted_invoices_page.dart';
import 'package:crm_smart/features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart';
import 'package:crm_smart/features/sales/public_relations/agents_and_distributors/presentation/pages/agent_distributor_profile_page.dart';
import 'package:crm_smart/features/sales/public_relations/participates/presentation/pages/participate_list_page.dart';
import 'package:crm_smart/features/versions/presentation/pages/version_demand_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      case "task":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TaskManagementListPage(
                      idTaks: data?['paramId'],
                      idStatus: data?['additional_data'],
                    )));
        break;
      case "updateTask":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TaskManagementListPage(
                      idTaks: data?['paramId'],
                      idStatus: data?['additional_data'],
                    )));
        break;
      case "assignTask":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TaskManagementListPage(
                      idTaks: data?['paramId'],
                      idStatus: data?['additional_data'],
                    )));
        break;
      case "addTask":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => TaskManagementListPage(
                      idTaks: data?['paramId'],
                      idStatus: data?['additional_data'],
                    )));
        break;
      case "Transfer":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => ClientsTransferApprovalsPage()));
        break;
      case "TransferRefuse":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      idClient: data == null ? dataNotify : data['paramId'],
                      // idclient:data==null?datanotify: data['paramId'],
                    )));
        break;
      case "TransferAccept":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      idClient: data == null ? dataNotify : data['paramId'],
                      // idclient:data==null?datanotify: data['paramId'],
                    )));
        break;
      case "AddPayment":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 1,
                      idClient: data == null ? dataNotify : data['paramId'],
                      // idclient:data==null?datanotify: data['paramId'],
                    )));
        break;
      case "EditInvoice":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 1,
                      idClient: data == null ? dataNotify : data['paramId'],
                      // idclient:data==null?datanotify: data['paramId'],
                    )));
        break;
      case "NotReady":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 3,
                      idClient: data == null ? dataNotify : data['paramId'],
                      // idclient:data==null?datanotify: data['paramId'],
                    )));
        break;

      case "ApproveDone":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "ApproveRefuse":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      idClient: data == null ? dataNotify : data['paramId'],
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
                  tabIndex: 3,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "AddComment":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 2,
                      commentId: data?['additional_data'],
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "commentMention":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 2,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "commentReply":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 2,
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "AddDemand":
        Navigator.push(context, CupertinoPageRoute(builder: (context) => VersionOrderPage()));
        break;
      case "Marketing Client":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 2,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "OpenTicket":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 5,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "InvoiceUpdated":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 1,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "InvoiceBack":
        final ticketsCubit = BlocProvider.of<InvoicesSectionCubit>(context);
        ticketsCubit.getInvoiceById(
            data == null ? dataNotify : data['paramId'],
            (data) => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => WithdrawnDetailsPage(
                    invoice: data,
                  ),
                )));
        break;
      case "ApproveInvoiceBack":
        final ticketsCubit = BlocProvider.of<InvoicesSectionCubit>(context);
        ticketsCubit.getInvoiceById(
            data == null ? dataNotify : data['paramId'],
            (data) => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => WithdrawalActionsPage(
                    invoice: data,
                  ),
                )));
        break;

      case "InvoiceReplay":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 3,
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "TransferTicket":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 5,
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "exclude":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientProfile(
                      tabIndex: 0,
                      idClient: data == null ? dataNotify : data['paramId'],
                    )));
        break;
      case "deviceAdd":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 1,
            idClient: data == null ? dataNotify : data['paramId'],
          );
        }));
        break;
      case "deviceReady":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 3,
            idClient: data == null ? dataNotify : data['paramId'],
          );
        }));
        break;
      case "receiveClient":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            idClient: data == null ? dataNotify : data['paramId'],
          );
        }));
        break;
      case "closeSchedule":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 5,
            idClient: data == null ? dataNotify : data['paramId'],
          );
        }));
        break;
      case "installCanceled":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 3,
            idClient: data == null ? dataNotify : data['paramId'],
          );
        }));
        break;
      case "reInstall":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 3,
            idClient: data == null ? dataNotify : data['paramId'],
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
            idClient: data == null ? dataNotify : data['paramId'],
          );
        }));
        break;
      //todo need model
      case "closeTicket":
        final ticketsCubit = BlocProvider.of<TicketsCubit>(context);
        ticketsCubit.getTicketById(
          GetTicketByIdParams(id: data == null ? dataNotify : data['paramId']),
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
            idAgent: data == null ? dataNotify : data['paramId'],
            tabIndex: 4,
          );
        }));
        break;
      case "clientVisit":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ClientProfile(
            tabIndex: 5,
            idClient: data == null ? dataNotify : data['paramId'],
          );
        }));
        break;
      //todo need model
      case "participateAdd":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ParticipateListPage(
            scrollToId: data == null ? dataNotify : data['paramId'],
          );
        }));
        break;
      // TODO: handle this cases
      /*
      case "saleExceeded":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ParticipateListPage();
        }));
        break;
      case "checkClient":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ParticipateListPage();
        }));
        break;
        */
    }
  }
}
