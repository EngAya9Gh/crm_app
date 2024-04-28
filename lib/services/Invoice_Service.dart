import 'dart:developer';
import 'dart:io';

import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/core/common/helpers/api_data_handler.dart';
import 'package:crm_smart/core/errors/base_app_exception.dart';
import 'package:crm_smart/core/services/api/api_services.dart';
import 'package:crm_smart/features/common/client_profile/invoices_tab/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:crm_smart/model/agent_distributor_model.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:flutter/foundation.dart';

import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/participatModel.dart';

class Invoice_Service {
  Future<List<InvoiceModel>> getInvoices(
    GetInvoicesByPrivilegesParams? filters,
  ) async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.invoice.getInvoicesByPrivileges,
        queryParameters: filters?.toMap(),
      );

      final data = apiDataHandler(response);

      final List<InvoiceModel> invoices = List<InvoiceModel>.from(
          (data ?? []).map((element) => InvoiceModel.fromJson(element)));

      return invoices;
    } catch (e) {
      print("error is => $e");
      rethrow;
    }
  }

  Future<List<InvoiceModel>> getinvoice_debt(
      String fk_country, String type, String param) async {
    var data;
    switch (type) {
      case "all":
        data = await Api().post(
            url: EndPoints.baseUrls.url +
                "client/invoice/getinvoice_debt.php?fk_country=$fk_country",
            body: {'type': type});
        break;
      case "users":
        data = await Api().post(
            url: EndPoints.baseUrls.url +
                "client/invoice/getinvoice_debt.php?fk_country=$fk_country&id_user=$param",
            body: {'type': type});
        break;
      case "regoin":
        data = await Api().post(
            url: EndPoints.baseUrls.url +
                "client/invoice/getinvoice_debt.php?fk_country=$fk_country&id_regoin=$param",
            body: {'type': type});
        break;
    }
    // await Api().get(url: EndPoints.baseUrls.url +  'client/invoice/getinvoice.php?fk_country=$fk_country');

    List<InvoiceModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }
    // List<InvoiceModel> invoices =
    // await compute<List<dynamic>,
    //     List<InvoiceModel>>(convertToInvoices, data);
    return prodlist;
  }

  List<InvoiceModel> convertToInvoices(List<dynamic> list) {
    return List<Map<String, dynamic>>.from(list)
        .map<InvoiceModel>((e) => InvoiceModel.fromJson(e))
        .toList();
  }

  Future<List<InvoiceModel>> getinvoicemaincity(
      String urlstring, Map<String, dynamic> body) async {
    var data =
        await Api().post(url: EndPoints.baseUrls.url + urlstring, body: body);

    List<InvoiceModel> prodlist = [];
    // final json = "[" + data[i] + "]";
    for (int i = 0; i < data.length; i++) {
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }

    return prodlist;
  }

  static Future<List<AgentDistributorModel>> getAgentsAndDistributors() async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      final String endPoint =
          EndPoints.agentDistributor.getAgentsAndDistributors;
      final response = await apiServices.get(endPoint: endPoint);
      final data = apiDataHandler(response);
      final List<AgentDistributorModel> agents = [];

      for (var agent in data) {
        agents.add(AgentDistributorModel.fromJson(agent));
      }

      return agents;
    } on BaseAppException catch (e) {
      print("error in getAgentsAndDistributors => ${e.message}");
      rethrow;
    } catch (e) {
      print("error in getAgentsAndDistributors => $e");
      rethrow;
    }
  }

  static Future<List<ParticipateModel>> getCollaborators() async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      final String endPoint = EndPoints.participate.allParticipates;
      final response = await apiServices.get(endPoint: endPoint);
      final data = apiDataHandler(response);
      final List<ParticipateModel> collaborators = [];

      for (var collaborator in data) {
        collaborators.add(ParticipateModel.fromJson(collaborator));
      }

      return collaborators;
    } on BaseAppException catch (e) {
      print("error in getAgentsAndDistributors => ${e.message}");
      rethrow;
    } catch (e) {
      print("error in getAgentsAndDistributors => $e");
      rethrow;
    }
  }

  Future<InvoiceModel?> setApproveClient(
      Map<String, dynamic> body, String idInvoice) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/setApproveClient.php?idInvoice=$idInvoice",
        body: body);

    if (data != null) return InvoiceModel.fromJson(data[0]);
    return null;
    //client/setApproveClient.php
    // return result[0];//=="done"? true:false;
  }

  Future<InvoiceModel?> setApproveFClient(
      Map<String, dynamic> body, String idInvoice) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/setAprroveFinanc.php?idInvoice=$idInvoice",
        body: body);

    if (data != null) return InvoiceModel.fromJson(data[0]);
    return null;
    //client/setApproveClient.php
    // return result[0];//=="done"? true:false;
  }

  Future<List<InvoiceModel>> getinvoicebyclient(String fk_idClient) async {
    //not called because get local
    try {
      var data = await Api().get(
          url: EndPoints.baseUrls.url +
              'client/invoice/get_invoice_ByIdClient.php?fk_idClient=$fk_idClient');

      List<InvoiceModel> prodlist = [];
      // final json = "[" + data[i] + "]";
      for (int i = 0; i < data.length; i++) {
        prodlist.add(InvoiceModel.fromJson(data[i]));
      }

      print("invoices length => ${prodlist.length}");
      return prodlist;
    } catch (e) {
      print("error in getinvoicebyclient $e");
      return [];
    }
  }

  Future<InvoiceModel> setdate(
      Map<String, dynamic> body, String id_invoice) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/invoice/setdate.php?id_invoice=$id_invoice",
        body: body);
    //client/setApproveClient.php
    return InvoiceModel.fromJson(result[0]); //=="done"? true:false;
  }

  Future<dynamic> addDateInstall({
    required String id_invoice,
    required String date_client_visit,
    required String date_end,
    required String fk_user,
    required String fk_client,
    required String type_date,
  }) async {
    final ApiServices apiServices = getIt<ApiServices>();
    apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
    var response = await apiServices
        .post(endPoint: EndPoints.events.addDateInstall, data: {
      'fk_user': fk_user,
      'date_client_visit': date_client_visit,
      'is_done': '0',
      'fk_invoice': id_invoice,
      'type_date': type_date.toString(),
      'date_end': date_end,
    });
    final data = apiDataHandler(response);
    return data;
  }

  Future<dynamic> editScheduleInstallation({
    required String scheduleId,
    required String dateClientVisit,
    required String date_end,
    required String processReason,
    required String typeSchedule,
    required String fk_user,
  }) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.urlLaravel +
            "rescheduleOrCancelVisitClient/" +
            scheduleId,
        body: {
          'typeProcess': 'reschedule',
          'date_client_visit': dateClientVisit,
          'date_end': date_end,
          'processReason': processReason,
          'type_date': typeSchedule.toString(),
          'fk_user': fk_user,
        });
    return result;
  }

  Future<dynamic> cancelScheduleInstallation({
    required String scheduleId,
  }) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.urlLaravel +
            "rescheduleOrCancelVisitClient/" +
            scheduleId,
        body: {'typeProcess': 'cancel'});
    return result;
  }

  Future<InvoiceModel> setstate(
      Map<String, dynamic> body, String id_invoice, File? file) async {
    var result = await Api().postRequestWithFile(
      'array',
      EndPoints.baseUrls.url +
          "client/invoice/update_stateback.php?id_invoice=$id_invoice",
      body,
      file,
      null,
    );
    //client/setApproveClient.php
    return InvoiceModel.fromJson(result[0]); //=="done"? true:false;
  }

  Future<InvoiceModel> deleteBack(String id_invoice, String file_reject) async {
    var result = await Api().postRequestWithFile(
        'array',
        EndPoints.baseUrls.url +
            "series/delete_demand_out.php?id_invoice=$id_invoice",
        {'file_reject': file_reject},
        null,
        null);
    //client/setApproveClient.php
    return InvoiceModel.fromJson(result[0]); //=="done"? true:false;
  }

  Future<List<InvoiceModel>> getinvoicebyiduser(String fk_idUser) async {
    var data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/getinvoicebyiduser.php?fk_idUser=$fk_idUser');

    List<InvoiceModel> prodlist =
        await compute<List<dynamic>, List<InvoiceModel>>(
            convertToInvoices, data);
    return prodlist;
  }

  Future<List<InvoiceModel>> getinvoicebyregoin(String regoin) async {
    var data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/getinvoicebyregoin.php?fk_regoin=$regoin');

    List<InvoiceModel> prodlist =
        await compute<List<dynamic>, List<InvoiceModel>>(
            convertToInvoices, data);
    return prodlist;
  }

  Future<List<InvoiceModel>> getmyinvoice_myregoin(
      String regoin, String userid) async {
    var data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/getmyinvoice_myregoin.php?fk_regoin=$regoin&fk_idUser=$userid');

    List<InvoiceModel> prodlist =
        await compute<List<dynamic>, List<InvoiceModel>>(
            convertToInvoices, data);
    return prodlist;
  }

  Future<List<InvoiceModel>> getinvoiceMarketing(String fk_country) async {
    var data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/getMarketingInvoice.php?fk_country=$fk_country');

    List<InvoiceModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<InvoiceModel>> getinvoicebyiduser_marketing(String iduser) async {
    var data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/getinvoiceMarkting_user.php?iduser=$iduser');

    List<InvoiceModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<InvoiceModel>> getinvoicebyregoin_marketing(String regoin) async {
    var data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/getclientMarketing_regoin.php?regoin=$regoin');

    List<InvoiceModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<List<InvoiceModel>> getinvoaicebyregoin_accept_requst(
      Map<String, dynamic> body) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url + 'client/accept_requsts.php', body: body);

    List<InvoiceModel> prodlist = [];
    for (int i = 0; i < data.length; i++) {
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }

    return prodlist;
  }

  Future<InvoiceModel> addInvoice(Map<String, dynamic> body, File? file,
      File? filelogo, List<File> files) async {
    try {
      var data = await Api().postRequestWithFile(
          'array',
          EndPoints.baseUrls.url + "client/invoice/addinvoice.php",
          body,
          file,
          filelogo,
          files: files);

      return InvoiceModel.fromJson(data[0]);
    } catch (e) {
      return InvoiceModel(products: []);
    }
  }

  Future<InvoiceModel> getInvoiceByIdInvoice(String idInvoice) async {
    var data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/getInvoiceID.php?id_invoice=$idInvoice');

    List<InvoiceModel> prodlist =
        await compute<List<dynamic>, List<InvoiceModel>>(
            convertToInvoices, data);
    return prodlist[0];
  }

  Future<InvoiceModel> crudFilesInvoice({
    required Map<String, dynamic> body,
    required List<File> files,
    File? file,
    required String invoiceId,
  }) async {
    try {
      // final data = await Api().postCrudInvoiceFile(
      //     'array',
      //     EndPoints.baseUrls.url +
      //         "FilesInvoice/crud_files_invoice.php?fk_invoice=$invoiceId",
      //     body,
      //     file,
      //     files: files);
      // print(data);
      // return AttachmentInvoiceResponse.fromJson(data[0]);

      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await apiServices.postRequestWithFile(
        url: "${EndPoints.invoice.crudFileInvoice}${invoiceId}",
        data: body,
      );

      final data = apiDataHandler(response);

      final invoice = InvoiceModel.fromJson(data);

      return invoice;
    } on BaseAppException catch (e) {
      log('error in crudFilesInvoice => ' + e.message);
      rethrow;
    }
  }

  Future<String> addInvoiceProduct(Map<String, dynamic> body) async {
    try {
      String result = await Api().post(
          url: EndPoints.baseUrls.url + "client/invoice/addinvoice_product.php",
          body: body);

      return result != "error" ? result : "false";
    } catch (e) {
      return "false";
    }
  }

  Future<InvoiceModel> updateInvoice(Map<String, dynamic> body,
      String idInvoice, File? file, File? filelogo, List<File> files) async {
    var result = await Api().postRequestWithFile(
        'array',
        EndPoints.baseUrls.url + "client/invoice/updateinvoice.php",
        body,
        file,
        filelogo,
        files: files);
    return InvoiceModel.fromJson(result[0]); //=="done"? true:false;
  }

  Future<InvoiceModel> addPayment(
      Map<String, dynamic> body, String idInvoice) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.url + "client/invoice/add_payment.php",
        body: body);
    return InvoiceModel.fromJson(result[0]); //=="done"? true:false;
  }

  Future<InvoiceModel> editinvoice(
      Map<String, dynamic> body, String idInvoice) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.url + "client/invoice/edit_invoices.php",
        body: body);
    return InvoiceModel.fromJson(result[0]); //=="done"? true:false;
  }

  Future<bool> updateProductInvoice(
      Map<String, dynamic> body, String idInvoiceProduct) async {
    String result = await Api().post(
        url:
            EndPoints.baseUrls.url + "client/invoice/updateinvoice_product.php",
        body: body);
    return result == "done" ? true : false;
  }

  Future<String> deleteInvoiceById(String idInvoice) async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.post(
        endPoint: "${EndPoints.invoice.deleteInvoice}${idInvoice}",
      );

      final data = apiDataHandler(response);

      return data;
    } catch (e) {
      return "res";
    }
  }

  Future<String> deleteProductInInvoice(String id_invoice_product) async {
    String res = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/deleteinvoice_product.php?id_invoice_product=$id_invoice_product');
    return res;
  }

  Future<List<InvoiceModel>> getinvoice_deleted(String fk_regoin) async {
    List<dynamic> data = [];
    data = await Api().get(
        url: EndPoints.baseUrls.url +
            'client/invoice/get_invoice_deleted.php?fk_regoin=$fk_regoin');

    List<InvoiceModel> prodlist = [];

    for (int i = 0; i < data.length; i++) {
      prodlist.add(InvoiceModel.fromJson(data[i]));
    }

    return prodlist;
  }
}
