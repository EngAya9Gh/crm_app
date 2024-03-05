import 'package:crm_smart/core/utils/end_points.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api/api_services.dart';
import '../../../../../core/common/models/profile_invoice_model.dart';
import '../../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../../model/agent_distributor_model.dart';
import '../../../../../model/invoiceModel.dart';
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

  Future<Either<String, List<DateInstallationClient>>> getDateVisitAgent({
    required String agentId,
  });

  Future<Either<String, void>> addAgentDate({
    required DateInstallationClient agentDateModel,
  });

  Future<Either<String, AgentDistributorModel>> doneTraining({
    required String agentId,
    required String fkUser,
  });

  Future<Either<String, AgentDistributorModel>> getAgentById({
    required String agentId,
  });
}

@LazySingleton(as: AgentsDistributorsProfileDataSource)
class AgentsDistributorsProfileDataSourceImpl
    extends AgentsDistributorsProfileDataSource {
  final ApiServices dio;

  AgentsDistributorsProfileDataSourceImpl(this.dio);

  Future<Either<String, List<ClientModel>>> getAgentClientsList({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.laravelUrl);
      final endPoint = EndPoints.agentDistributor.getAgentClients;
      final response = await dio.get(endPoint: "$endPoint$agentId");

      final data = response['data'];

      final List<ClientModel> clientsList = [];
      for (int i = 0; i < data.length; i++) {
        print("index is => $i");
        print("data[i] is => ${data[i]}");
        clientsList.add(ClientModel.fromJson(data[i]));
      }

      return Right(clientsList);
    } catch (e) {
      print("Error in getAgentClientsList: $e");
      return Left("Error in getAgentClientsList: $e");
    }
  }

  @override
  Future<Either<String, List<ProfileInvoiceModel>>> getAgentInvoiceList({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.laravelUrl);
      final endPoint = EndPoints.agentDistributor.getAgentInvoicesList;
      final response = await dio.get(endPoint: "$endPoint$agentId");
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
  Future<Either<String, List<ProfileCommentModel>>> getAgentCommentsList({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.laravelUrl);
      final endPoint = EndPoints.agentDistributor.getAgentCommentsList;
      final response = await dio.get(endPoint: "$endPoint$agentId");
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
      dio.changeBaseUrl(EndPoints.laravelUrl);
      final endPoint = EndPoints.agentDistributor.addCommentAgent;
      final response = await dio.post(endPoint: endPoint, data: {
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
  Future<Either<String, List<DateInstallationClient>>> getDateVisitAgent({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.laravelUrl);
      final endPoint = EndPoints.agentDistributor.getDateVisitAgent;
      final response = await dio.get(endPoint: "$endPoint$agentId");
      final data = response['data'];

      final List<DateInstallationClient> visitDates = [];
      for (int i = 0; i < data.length; i++) {
        visitDates.add(DateInstallationClient.fromJson(data[i]));
      }

      return Right(visitDates);
    } catch (e) {
      print("Error in getAgentCommentsList: $e");
      return Left("Error in getAgentCommentsList: $e");
    }
  }

  @override
  Future<Either<String, void>> addAgentDate({
    required DateInstallationClient agentDateModel,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.phpUrl);
      final endPoint = EndPoints.agentDistributor.addAgentDate;
      final response = await dio.post(
        endPoint: endPoint,
        data: agentDateModel.toMap(),
      );
      return Right(null);
    } catch (e) {
      print("Error in addAgentDate: $e");
      return Left("Error in addAgentDate: $e");
    }
  }

  @override
  Future<Either<String, AgentDistributorModel>> doneTraining({
    required String agentId,
    required String fkUser,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.phpUrl);
      final endPoint = EndPoints.agentDistributor.doneTraining;
      final response = await dio.post(
        endPoint: endPoint,
        data: {"fkuser_training": fkUser},
        queryParameters: {"id_agent": agentId},
      );

      // todo : ask backend to convert the response from List<Map> to Map
      // todo : and change message to data
      final List data = response['message'];
      final AgentDistributorModel agent =
          AgentDistributorModel.fromJson(data.first);

      return Right(agent);
    } catch (e) {
      print("Error in done training: $e");
      return Left("Error in training: $e");
    }
  }

  @override
  Future<Either<String, AgentDistributorModel>> getAgentById({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.phpUrl);
      final response =
          await dio.get(endPoint: "agent/get_agent_byId.php?agentId=$agentId");

      final data = response['data'];

      final AgentDistributorModel agent =
          AgentDistributorModel.fromJson(data[0]);

      return Right(agent);
    } catch (e) {
      print("Error in getAgent: $e");
      return Left("Error in getAgent: $e");
    }
  }
}
