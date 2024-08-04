import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../api/api.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/common/models/participate_model.dart';
import '../core/errors/base_app_exception.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../features/sales/public_relations/agents_and_distributors/data/models/agent_distributor_model.dart';
import '../model/invoiceModel.dart';

class Invoice_Service {
  List<InvoiceModel> convertToInvoices(List<dynamic> list) {
    return List<Map<String, dynamic>>.from(list)
        .map<InvoiceModel>((e) => InvoiceModel.fromJson(e))
        .toList();
  }

  static Future<List<AgentDistributorModel>> getAgentsAndDistributors() async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
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
      debugPrint(
          "error in getAgentsAndDistributors invoice_services => ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("error in getAgentsAndDistributors invoice_services => $e");
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
      debugPrint("error in getCollaborators => ${e.message}");
      rethrow;
    } catch (e) {
      debugPrint("error in getCollaborators => $e");
      rethrow;
    }
  }

  Future<InvoiceModel> changeDeviceState({
    required String idInvoice,
    required String deviceState,
  }) async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await apiServices.post(
        endPoint: EndPoints.invoice.changeDeviceState(idInvoice),
        data: {"state": deviceState},
      );

      final data = apiDataHandler(response);

      final invoice = InvoiceModel.fromJson(data);

      return invoice;
    } on BaseAppException catch (e) {
      debugPrint("error in changeDeviceState => ${e.message}");
      throw e.message;
    } catch (e) {
      debugPrint("error in changeDeviceState => $e");
      rethrow;
    }
  }

  Future<InvoiceModel?> setApproveClient(
      Map<String, dynamic> body, String idInvoice) async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);

      final response = await apiServices.post(
        endPoint: EndPoints.invoice.setApproveInvoice(idInvoice),
        data: body,
      );

      final data = apiDataHandler(response);

      return data != null ? InvoiceModel.fromJson(data) : null;
    } catch (e) {
      debugPrint("error in setApproveClient => $e");
      throw e;
    }
  }

  Future<InvoiceModel?> setApproveFClient(
      Map<String, dynamic> body, String idInvoice) async {
    var data = await Api().post(
        url: EndPoints.baseUrls.url +
            "client/setAprroveFinanc.php?idInvoice=$idInvoice",
        body: body);

    if (data != null) return InvoiceModel.fromJson(data[0]);
    return null;
  }

  Future<List<InvoiceModel>> getInvoiceByClient(String fk_idClient) async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.client.getInvoiceByIdClient(fk_idClient),
      );

      final data = apiDataHandler(response);

      List<InvoiceModel> prodList = [];
      for (int i = 0; i < data.length; i++) {
        prodList.add(InvoiceModel.fromJson(data[i]));
      }

      return prodList;
    } on BaseAppException catch (e) {
      debugPrint(
          "error in getInvoiceByClient in invoiceServices => ${e.message}");
      throw e.message;
    } catch (e) {
      debugPrint("error in getInvoiceByClient in invoiceServices => $e");
      rethrow;
    }
  }

  Future<InvoiceModel> setInvoiceWithdraw(
      Map<String, dynamic> body, String id_invoice, File? file) async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.url);
      dynamic response = await apiServices.postRequestWithFile(
        endPoint: EndPoints.invoice.updateInvoiceState,
        data: body,
        queryParameters: {'id_invoice': id_invoice},
        file: file,
      );

      response = jsonDecode(response);
      final data = apiDataHandler(response);
      return InvoiceModel.fromJson(data[0]);
    } catch (e) {
      debugPrint("error in setAgentState => $e");
      throw e;
    }
  }

  Future<InvoiceModel> deleteBack(String id_invoice, String file_reject) async {
    var result = await Api().postRequestWithFile(
        'array',
        EndPoints.baseUrls.url +
            "series/delete_demand_out.php?id_invoice=$id_invoice",
        {'file_reject': file_reject},
        null,
        null);
    return InvoiceModel.fromJson(result[0]); //=="done"? true:false;
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

  Future<List<InvoiceModel>> getwithdarwlInvoice(String regoinfilter) async {
    Map<String, dynamic> param = {};
    if (regoinfilter != '') param.addAll({'fk_region': regoinfilter});
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.invoice.getwithdrawInvoices,
        queryParameters: param,
      );

      final data = apiDataHandler(response);

      final List<InvoiceModel> invoices = List<InvoiceModel>.from(
          (data ?? []).map((element) => InvoiceModel.fromJson(element)));

      return invoices;
    } catch (e) {
      debugPrint("error is => $e");
      rethrow;
    }
  }

  Future<List<InvoiceModel>> getPendingApproveAdmin(String regoinfilter) async {
    Map<String, dynamic> param = {};
    if (regoinfilter != '') param.addAll({'fk_region': regoinfilter});
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.invoice.pendingApproveAdmin,
        queryParameters: param,
      );

      final data = apiDataHandler(response);

      final List<InvoiceModel> invoices = List<InvoiceModel>.from(
          (data ?? []).map((element) => InvoiceModel.fromJson(element)));

      return invoices;
    } catch (e) {
      debugPrint("error is => $e");
      rethrow;
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

  Future<InvoiceModel> addPayment(
      Map<String, dynamic> body, String idInvoice) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.urlLaravel + "payments/$idInvoice", body: body);
    return InvoiceModel.fromJson(result); //=="done"? true:false;
  }

  Future<InvoiceModel> editinvoice(
      Map<String, dynamic> body, String idInvoice) async {
    var result = await Api().post(
        url: EndPoints.baseUrls.url + "client/invoice/edit_invoices.php",
        body: body);
    return InvoiceModel.fromJson(result[0]); //=="done"? true:false;
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

  Future<List<InvoiceModel>> getinvoice_deleted() async {
    try {
      final ApiServices apiServices = getIt<ApiServices>();
      apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await apiServices.get(
        endPoint: EndPoints.invoice.getdeletedInvoices,
      );

      final data = apiDataHandler(response);

      final List<InvoiceModel> invoices = List<InvoiceModel>.from(
          (data ?? []).map((element) => InvoiceModel.fromJson(element)));

      return invoices;
    } catch (e) {
      debugPrint("error is => $e");
      rethrow;
    }
  }
}
