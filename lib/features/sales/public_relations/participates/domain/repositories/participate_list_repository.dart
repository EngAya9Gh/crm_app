import '../../../../../../core/common/models/profile_invoice_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../model/invoiceModel.dart';
import '../../data/models/participat_model.dart';
import '../../data/models/participate_client_model.dart';

abstract class ParticipateListRepository {
  Future<Result<ResponseWrapper<List<ParticipateModel>>>> getParticipateList(
    Map<String, dynamic> body,
  );

  Future<Result<ResponseWrapper<ParticipateModel>>> addParticipate(
      Map<String, dynamic> body);

  Future<Result<ResponseWrapper<ParticipateModel>>> editParticipate(
      Map<String, dynamic> body, Map<String, dynamic> params);

  Future<Result<ResponseWrapper<List<ParticipateClientModel>>>>
      getParticipateClientsList(String participateId);

  Future<Result<ResponseWrapper<List<ProfileInvoiceModel>>>>
      getParticipateInvoicesList(String participateId);

  Future<Result<ResponseWrapper<InvoiceModel>>> getInvoiceDataById(
      Map<String, dynamic> params);

  Future<Result<ResponseWrapper<List<ProfileCommentModel>>>>
      getParticipateCommentsList(String participateId);

  Future<Result<ResponseWrapper<ProfileCommentModel>>> addCompanyComment(
      Map<String, dynamic> body);
}
