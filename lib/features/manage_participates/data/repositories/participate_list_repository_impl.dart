import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/features/manage_participates/data/data_sources/participates_list_datasource.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/features/manage_participates/data/models/participate_client_model.dart';
import 'package:crm_smart/features/manage_participates/domain/repositories/participate_list_repository.dart';
import 'package:crm_smart/model/invoiceModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/profile_invoice_model.dart';
import '../../../../core/common/widgets/profile_comments_model.dart';

@Injectable(as: ParticipateListRepository)
class ParticipateListRepositoryImpl implements ParticipateListRepository {
  final ParticipatesListDatasource datasource;

  ParticipateListRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<ParticipateModel>>>> getParticipateList(
      Map<String, dynamic> body) {
    return toApiResult(() => datasource.getParticipateList(body));
  }

  @override
  Future<Result<ResponseWrapper<ParticipateModel>>> addParticipate(
      Map<String, dynamic> body) {
    return toApiResult(() => datasource.addParticipate(body));
  }

  @override
  Future<Result<ResponseWrapper<ParticipateModel>>> editParticipate(
      Map<String, dynamic> body, Map<String, dynamic> params) {
    return toApiResult(() => datasource.editParticipate(body, params));
  }

  @override
  Future<Result<ResponseWrapper<List<ParticipateClientModel>>>>
      getParticipateClientsList(String participateId) {
    return toApiResult(
        () => datasource.getParticipateClientsList(participateId));
  }

  @override
  Future<Result<ResponseWrapper<List<ProfileInvoiceModel>>>>
      getParticipateInvoicesList(String participateId) {
    return toApiResult(
        () => datasource.getParticipateInvoicesList(participateId));
  }

  @override
  Future<Result<ResponseWrapper<InvoiceModel>>> getInvoiceDataById(
      Map<String, dynamic> params) {
    return toApiResult(() => datasource.getInvoiceDataById(params));
  }

  @override
  Future<Result<ResponseWrapper<List<ProfileCommentModel>>>>
      getParticipateCommentsList(String participateId) {
    return toApiResult(
        () => datasource.getParticipateCommentsList(participateId));
  }

  @override
  Future<Result<ResponseWrapper<ProfileCommentModel>>> addCompanyComment(
      Map<String, dynamic> body) {
    return toApiResult(() => datasource.addComment(body: body));
  }
}
