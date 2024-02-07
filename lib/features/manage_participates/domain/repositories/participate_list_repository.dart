import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/manage_participates/data/models/participate_client_model.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/participate_invoice_model.dart';


abstract class ParticipateListRepository{
  Future<Result<ResponseWrapper<List<ParticipateModel>>>> getParticipateList(Map<String, dynamic> body);
    Future<Result<ResponseWrapper<ParticipateModel>>> addParticipate(Map<String, dynamic> body);
  Future<Result<ResponseWrapper<ParticipateModel>>> editParticipate(Map<String, dynamic> body,Map<String, dynamic> params);
  Future<Result<ResponseWrapper<List<ParticipateClientModel>>>> getParticipateClientsList(String participateId);
  Future<Result<ResponseWrapper<List<ParticipateInvoiceModel>>>> getParticipateInvoicesList(String participateId);
  Future<Result<ResponseWrapper<InvoiceModel>>> getInvoiceDataById(Map<String, dynamic> params);
}