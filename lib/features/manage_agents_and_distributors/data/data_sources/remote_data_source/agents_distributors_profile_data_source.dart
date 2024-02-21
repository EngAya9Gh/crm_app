import 'package:crm_smart/common/widgets/profile_comments_model.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/models/agent_date_model.dart';
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

  Future<Either<String, ProfileCommentModel>> addAgentComment({
    required String agentId,
    required String content,
  });

  Future<Either<String, List<AgentDateModel>>> getDateVisitAgent({
    required String agentId,
  });

  Future<Either<String, void>> addAgentDate({
    required AgentDateModel agentDateModel,
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

  @override
  Future<Either<String, ProfileCommentModel>> addAgentComment({
    required String agentId,
    required String content,
  }) async {
    try {
      dio.changeBaseUrl(AppStrings.apiBaseUrl2);
      final response = await dio.post(endPoint: "addCommentAgent", data: {
        "agent_id": agentId,
        "content": content,
      });

      final data = response['data'];
      final ProfileCommentModel comment = ProfileCommentModel.fromJson(data);
      return Right(comment);
    } catch (e) {
      print("Error in getAgentCommentsList: $e");
      return Left("Error in getAgentCommentsList: $e");
    }
  }

  @override
  Future<Either<String, List<AgentDateModel>>> getDateVisitAgent({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(AppStrings.apiBaseUrl2);
      final response = await dio.get(endPoint: "getDateVisitAgent/$agentId");
      final data = response['data'];

      final List<AgentDateModel> visitDates = [];
      for (int i = 0; i < data.length; i++) {
        visitDates.add(AgentDateModel.fromMap(data[i]));
      }

      return Right(visitDates);
    } catch (e) {
      print("Error in getAgentCommentsList: $e");
      return Left("Error in getAgentCommentsList: $e");
    }
  }

  @override
  Future<Either<String, void>> addAgentDate({
    required AgentDateModel agentDateModel,
  }) async {
    try {
      dio.changeBaseUrl(AppStrings.apiBaseUrl1);
      final response = await dio.post(
        endPoint: "client/invoice/add_date_install.php",
        data: agentDateModel.toMap(),
      );
      print("response => $response");
      return Right(null);
    } catch (e) {
      print("Error in addAgentDate: $e");
      return Left("Error in addAgentDate: $e");
    }
  }
}
