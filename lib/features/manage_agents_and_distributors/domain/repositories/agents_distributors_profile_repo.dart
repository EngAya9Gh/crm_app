import 'package:dartz/dartz.dart';

import '../../../clients_list/data/models/clients_list_response.dart';

abstract class AgentsDistributorsProfileRepo {
  Future<Either<String, List<ClientModel>>> getAgentsClientsList({
    required String agentId,
  });

// Future<Result<ResponseWrapper<List<ParticipateInvoiceModel>>>>
//     getParticipateInvoicesList(String participateId);
//
// Future<Result<ResponseWrapper<InvoiceModel>>> getInvoiceDataById(
//     Map<String, dynamic> params);
//
// Future<Result<ResponseWrapper<List<ParticipateCommentModel>>>>
//     getParticipateCommentsList(String participateId);
//
// Future<Result<ResponseWrapper<ParticipateCommentModel>>> addCompanyComment(
//     Map<String, dynamic> body);
}
