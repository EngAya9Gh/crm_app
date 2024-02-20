import 'package:crm_smart/common/widgets/profile_comments_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../api/dio_services.dart';
import '../../../../../common/models/profile_invoice_model.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../clients_list/data/models/clients_list_response.dart';

abstract class AgentsDistributorsProfileDataSource {
  Future<Either<String, List<ClientModel>>> getAgentClientsList({
    required String agentId,
  });

  Future<Either<String, List<ProfileInvoiceModel>>> getAgentInvoiceList({
    required String agentId,
  });

  Future<Either<String, List<ProfileCommentModel>>> getAgentCommentsList({
    required String agentId,
  });
}

class AgentsDistributorsProfileDataSourceImpl
    extends AgentsDistributorsProfileDataSource {
  final DioServices dio;

  AgentsDistributorsProfileDataSourceImpl(this.dio);

  Future<Either<String, List<ClientModel>>> getAgentClientsList({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(AppStrings.apiBaseUrl2);
      final response = await dio.get(endPoint: "getAgentClints/$agentId");

      final data = response['data'];

      final List<ClientModel> clientsList = [];
      for (int i = 0; i < data.length; i++) {
        clientsList.add(ClientModel.fromJson(data[i]));
      }

      return Right(clientsList);
    } catch (e) {
      print("Error in getAgentClientsList: $e");
      return Left("Error in getAgentClientsList: $e");
    }
  }

  @override
  Future<Either<String, List<ProfileInvoiceModel>>> getAgentInvoiceList(
      {required String agentId}) async {
    try {
      dio.changeBaseUrl(AppStrings.apiBaseUrl2);
      final response = await dio.get(endPoint: "getAgentInvoices/$agentId");
      final data = response['data'];

      final List<ProfileInvoiceModel> invoicesList = [];
      for (int i = 0; i < data.length; i++) {
        invoicesList.add(ProfileInvoiceModel.fromJson(data[i]));
      }

      return Right(invoicesList);
    } catch (e) {
      print("Error in getAgentInvoiceList: $e");
      return Left("Error in getAgentInvoiceList: $e");
    }
  }

  @override
  Future<Either<String, List<ProfileCommentModel>>> getAgentCommentsList(
      {required String agentId}) async {
    try {
      dio.changeBaseUrl(AppStrings.apiBaseUrl2);
      final response = await dio.get(endPoint: "getAgentComments/$agentId");
      final data = response['data'];

      final List<ProfileCommentModel> commentsList = [];
      for (int i = 0; i < data.length; i++) {
        commentsList.add(ProfileCommentModel.fromJson(data[i]));
      }

      return Right(commentsList);
    } catch (e) {
      print("Error in getAgentCommentsList: $e");
      return Left("Error in getAgentCommentsList: $e");
    }
  }
}
