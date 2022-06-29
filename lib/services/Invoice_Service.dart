
import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/model/deleteinvoicemodel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:crm_smart/model/maincitymodel.dart';

import '../constants.dart';
import 'dart:io';
class Invoice_Service {

  Future<List<InvoiceModel>> getinvoice(String fk_country) async {
    var
    data=await Api()
        .get(url:url+ 'client/invoice/getinvoice.php?fk_country=$fk_country');
    print(data);
    List<InvoiceModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      print(i);

      //print("data "+ "[" + data[i] + "]");
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<List<InvoiceModel>> getinvoicemaincity(
      String urlstring,Map<String,dynamic> body) async {
    var data=await Api()
        .post(url:url+urlstring,body: body);
    print(data);
    List<InvoiceModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      print(i);

      //print("data "+ "[" + data[i] + "]");
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<InvoiceModel?> setApproveClient( Map<String,dynamic> body,String idInvoice) async {
    var data = await Api()
        .post( url:url+"client/setApproveClient.php?idInvoice=$idInvoice",body:
    body
    );
    // List<ClientModel> prodlist = [];
    // for (int i = 0; i < data.length; i++) {
    //   prodlist.add(ClientModel.fromJson(data[i]));
    // }
    // print(prodlist);
    if(data!=null)
    return InvoiceModel.fromJson(data[0]);
    return null;
    //client/setApproveClient.php
    // return result[0];//=="done"? true:false;
  }
  Future<List<InvoiceModel>> getinvoicebyclient(String fk_idClient) async {
    //not called because get local
    var
    data=await Api()
        .get(url:url+ 'client/invoice/get_invoice_ByIdClient.php?fk_idClient=$fk_idClient');
    print(data);
    List<InvoiceModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      print(i);

      prodlist.add(InvoiceModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }

  Future<InvoiceModel> setdate(
      Map<String,dynamic> body,String id_invoice) async {
    var result = await Api()
        .post( url:url+"client/invoice/setdate.php?id_invoice=$id_invoice",body:
    body
    );
    //client/setApproveClient.php
    return InvoiceModel.fromJson(result[0]);//=="done"? true:false;
  }
  Future<InvoiceModel> setdatedone(
      Map<String,dynamic> body,String id_invoice) async {
    var result = await Api()
        .post( url:url+
        "client/invoice/setdateinstall.php?id_invoice=$id_invoice",body:
    body
    );
    //client/setApproveClient.php
    return InvoiceModel.fromJson(result[0]);//=="done"? true:false;
  }
  Future<InvoiceModel> setstate(
      Map<String,dynamic> body,String id_invoice) async {
    var result = await Api()
        .post( url:url+
        "client/invoice/update_stateback.php?id_invoice=$id_invoice",body: body
    );
    //client/setApproveClient.php
    return InvoiceModel.fromJson(result[0]);//=="done"? true:false;
  }
  Future<List<InvoiceModel>> getinvoicebyiduser(String fk_idUser) async {
    var
    data=await Api()
        .get(url:url+ 'client/invoice/getinvoicebyiduser.php?fk_idUser=$fk_idUser');
    print(data);
    List<InvoiceModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      print(i);

      //print("data "+ "[" + data[i] + "]");
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<List<InvoiceModel>> getinvoicebyregoin(String regoin) async {
    var
    data=await Api()
        .get(url:url+ 'client/invoice/getinvoicebyregoin.php?fk_regoin=$regoin');
    print(data);
    List<InvoiceModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      print(i);
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
  Future<InvoiceModel> addInvoice( Map<String,dynamic?> body,
      File? file,File? filelogo) async {
    try {
      var data = await Api()
          .postRequestWithFile('array',
          url+"client/invoice/addinvoice.php",
           body, file,filelogo);

      return  InvoiceModel.fromJson(data[0]);
    }
    catch(e) {
      print(e.toString());
       return InvoiceModel(products: []);
    }

  }
  Future<String> addInvoiceProduct( Map<String,dynamic?> body) async {
    print("$body");
    try{
      String result = await Api()
          .post( url:url+"client/invoice/addinvoice_product.php",
          body: body);
      print('result idproduct invoice');
      print(result);
      return result !="error"? result:"false";}
    catch(e){
      print(e);
      return "false";
    }
  }

  Future<InvoiceModel> updateInvoice( Map<String,dynamic> body,
      String idInvoice,File? file,File? filelogo) async {
    var result = await Api()
        .postRequestWithFile('array',
        url+"client/invoice/updateinvoice.php",
        body,file,filelogo
    );
    return InvoiceModel.fromJson(result[0]) ;//=="done"? true:false;
  }
  Future<bool> updateProductInvoice( Map<String,dynamic> body,String idInvoiceProduct) async {
    String result = await Api()
        .post( url:url+"client/invoice/updateinvoice_product.php",body:
    body
    );
    return result=="done"? true:false;
  }
  Future<String> deleteInvoiceById(Map<String,String> body) async {
    try{

   String res= await Api()
        .post(url:url
       + 'client/invoice/deleteinvoice.php',
       body: body);

   print("delete in services "+res);
   return res;
    }
    catch(e){
      return "res";
        }
  }
  Future<String> deleteProductInInvoice(String id_invoice_product) async {
    String res= await Api()
        .get(url:url+ 'client/invoice/deleteinvoice_product.php?id_invoice_product=$id_invoice_product');
    return res;
  }

  Future<List<DeletedinvoiceModel>> getinvoice_deleted(String fk_regoin) async {
    List<dynamic> data =[];
    data=await Api()
        .get(url:url+
        'client/invoice/get_invoice_deleted.php?fk_regoin=$fk_regoin');

    List<DeletedinvoiceModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(DeletedinvoiceModel.fromJson(data[i]));
    }
    print(prodlist);
    return prodlist;
  }
}