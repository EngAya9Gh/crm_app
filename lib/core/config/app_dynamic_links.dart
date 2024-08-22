import 'package:flutter/cupertino.dart';

import '../../features/sales/clients/clients_transfer_approvals/presentation/pages/clients_transfer_approvals_page.dart';
import '../../features/sales/clients/finance_pending/presentation/pages/finance_pending_page.dart';
import '../../features/sales/clients/latest_clients_updates/presentation/pages/latest_clients_updates_page.dart';
import '../../features/task_management/presentation/pages/task_management_list_page.dart';
import '../../ui/screen/client/profile_client.dart';
import '../../ui/screen/home/approvepage.dart';
import '../../ui/screen/invoice/deleted_invoices.dart';

enum TypeNotify {
  ApproveRequest,
  Transfer,
  Late,
  ApproveDone,
  ApproveRefuse,
  InvoiceDeleted,
  Install
}

abstract class AppDynamicLinks {
  static void routeNotifyTo(
    typeNotify,
    context,
    Map<String, dynamic>? data,
    String? dataNotify,
  ) {
    switch (typeNotify) {
      case "ApproveRequest":
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => ApprovePage()));
        break;
      case "ApproveFRequest":
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => FinancePendingPage()));
        break;
      case "checkComment":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => LatestClientsUpdatesPage()));
        break;
      // todo: add task
      case "task":
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => TaskManagementListPage()));
        break;
      case "Transfer":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ClientsTransferApprovalsPage()));
        break;
      case "TransferRefuse":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;
      case "TransferAccept":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;
      case "AddPayment":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 1,
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;
      case "EditInvoice":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 1,
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;
      case "NotReady":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 3,
                      idClient: data == null ? dataNotify : data['idclient'],
                      // idclient:data==null?datanotify: data['idclient'],
                    )));
        break;

      case "ApproveDone":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "ApproveRefuse":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "InvoiceDeleted":
        Navigator.push(context,
            CupertinoPageRoute(builder: (context) => deletedInvoices()));
        break;
      case "Install":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "AddComment":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 2,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "Marketing Client":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 2,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "OpenTicket":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 5,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "InvoiceUpdated":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 1,
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "InvoiceBack":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      //idinvoice: data==null?datanotify:  data['id_invoice'],
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;

      case "InvoiceReplay":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 3,
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "TransferTicket":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 5,
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "exclude":
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => ProfileClient(
                      tabIndex: 0,
                      idClient: data == null ? dataNotify : data['idclient'],
                    )));
        break;
      case "deviceAdd":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ProfileClient(
            tabIndex: 1,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
      case "deviceReady":
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return ProfileClient(
            tabIndex: 3,
            idClient: data == null ? dataNotify : data['idclient'],
          );
        }));
        break;
    }
  }
}
