

import 'package:crm_smart/ui/screen/client/approve_type_user.dart';
import 'package:crm_smart/ui/screen/client/approvefinance_approve.dart';
import 'package:crm_smart/ui/screen/client/clientView.dart';
import 'package:crm_smart/ui/screen/client/detail_client.dart';
import 'package:crm_smart/ui/screen/client/profileclient.dart';
import 'package:crm_smart/ui/screen/home/approvepage.dart';
import 'package:crm_smart/ui/screen/invoice/get_deleted_invoice.dart';
import 'package:crm_smart/ui/screen/support/support_add.dart';
import 'package:flutter/material.dart';

import 'model/clientmodel.dart';
import 'model/invoiceModel.dart';
import 'model/usermodel.dart';


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
String? validateEmail(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(email))
    return 'Please make sure your email address is valid';
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
  }
  return "";
}

void route_notifyto(typeNotify,context,
    Map<String,dynamic>? data,String? datanotify
    ) {
  switch (typeNotify){
    case "ApproveRequest":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ApprovePage()));
      break;
      case "ApproveFRequest":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ApproveFinancePage()));
      break;
    case "Transfer" :
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => TransferPage(
               // idclient:data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "TransferRefuse" :
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                idClient: data==null?datanotify:data['idclient'],
               // idclient:data==null?datanotify: data['idclient'],
              )
          ));
      break;
    case "ApproveDone":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                idClient: data==null?datanotify:data['idclient'],
              )
          ));
      break;
    case "ApproveRefuse":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
    case "InvoiceDeleted":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => deletedinvoice(
              )
          ));
      break;
      case "Install":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "AddComment":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "OpenTicket":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 5,
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "InvoiceUpdated":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 1,
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "InvoiceBack":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                //idinvoice: data==null?datanotify:  data['id_invoice'],
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;

      case "InvoiceReplay":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 3,
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;
      case "TransferTicket":
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => ProfileClient(
                tabIndex: 5,
                idClient: data==null?datanotify: data['idclient'],
              )
          ));
      break;

  }

}