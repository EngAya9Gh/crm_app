

import 'package:crm_smart/features/task_management/presentation/pages/task_management_list_page.dart';
import 'package:crm_smart/ui/screen/client/approve_type_user.dart';
import 'package:crm_smart/ui/screen/client/approvefinance_approve.dart';
import 'package:crm_smart/features/clients_list/presentation/widgets/client_section.dart';
import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/client/marketing/getLastCommentClient.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




String getnameshort(String name){

  String nameshort=name.length>15?
  '..'+ name.substring(0, 15).toString():
  name.toString();
  return nameshort;
}String getnamelong(String name){

  String nameshort=name.length>30?
  '..'+ name.substring(0, 30).toString():
  name.toString();
  return nameshort;
}
bool validateEmail2(String email) => RegExp(
    r'''(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])''')
    .hasMatch(email);
String? validateEmail(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(email))
    return 'Please make sure your email address is valid';
  return null;
}
String get_title_care(String type ){
  switch(type){
    case 'ترحيب':
      return 'تفاصيل الترحيب بالعميل ';
    case 'تركيب':
      return  'تفاصيل جودة التركيب والتدريب  ';
    case 'دوري':
      return 'تفاصيل تقييم الخدمة ';
  }
return '';
}
String showtext(String typeNotify){

  switch (typeNotify){
    case "ApproveRequest":
      return "طلب موافقة";
      case "ApproveFRequest":
      return "طلب موافقة";
    case "Transfer" :
      return "تحويل العميل";
    case "ApproveDone":
      return "قبول العميل";
    case "ApproveRefuse":
      return "رفض العميل";
    case "InvoiceDeleted":
      return "حذف فاتورة";
    case "Install":
      return "تم التركيب للعميل";
      ////////////////////////////
      case "TransferRefuse":
      return " رفض تحويل العميل";
      case "AddComment":
      return " إضافة تعليق";
      case "OpenTicket":
      return "فتح تذكرة";
      case "InvoiceUpdated":
      return "تعديل فاتورة العميل  ";
      case "InvoiceBack":
      return "انسحاب العميل";
      case "InvoiceReplay":
      return "إعادة جدولة العميل  ";
      case "TransferTicket":
      return "تحويل تذكرة العميل";
      case "AddPayment":
      return "اضافة دفعة للفاتورة";
      case "NotReady":
      return "العميل غير جاهز";

      case "checkComment":
      return "تحديث العملاء";
      case "task":
      return "المهام";

    case "exclude":
      return "موافقة الاستبعاد";

      case "EditInvoice":
      return "تغيير بيانات الفاتورة";
  }
  return "";
}

void route_notifyto(typeNotify,context,
    Map<String,dynamic>? data,String? datanotify
    ) {
  switch (typeNotify){
    case "ApproveRequest":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ApprovePage()));
      break;
      case "ApproveFRequest":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ApproveFinancePage()));
      break;
      case "checkComment":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => getLastCommentClient()));
      break;
      // todo: add task
      case "task":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => TaskManagementListPage()));
      break;
    case "Transfer" :
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => TransferPage(
               // idclient:data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "TransferRefuse" :
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                idClient: data==null?datanotify:data['idclient'],
               // idclient:data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "AddPayment" :
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 1,
                idClient: data==null?datanotify:data['idclient'],
               // idclient:data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "EditInvoice" :
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 1,
                idClient: data==null?datanotify:data['idclient'],
               // idclient:data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "NotReady" :
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 3,
                idClient: data==null?datanotify:data['idclient'],
               // idclient:data==null?datanotify: data['idclient'],
              )
          ));
      break;

    case "ApproveDone":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                idClient: data==null?datanotify:data['idclient'],
              )
          ));
      break;
    case "ApproveRefuse":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
    case "InvoiceDeleted":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => deletedinvoice(
              )
          ));
      break;
      case "Install":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "AddComment":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex:2,
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "OpenTicket":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 5,
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "InvoiceUpdated":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 1,
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "InvoiceBack":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;

      case "InvoiceReplay":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 3,
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "TransferTicket":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 5,
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "exclude":
      Navigator.push(context,
          CupertinoPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 0,
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;

  }

}