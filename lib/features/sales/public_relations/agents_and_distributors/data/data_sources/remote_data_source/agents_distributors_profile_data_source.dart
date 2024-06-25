import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../../core/common/helpers/api_data_handler.dart';
import '../../../../../../../core/common/models/profile_invoice_model.dart';
import '../../../../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../../../../core/errors/base_app_exception.dart';
import '../../../../../../../core/services/api/api_services.dart';
import '../../../../../../../core/utils/end_points.dart';
import '../../../../../../../model/invoiceModel.dart';
import '../../../../../clients_list/data/models/clients_list_response.dart';
import '../../../domain/use_cases/crud_agent_support_files_usecase.dart';
import '../../models/agent_distributor_model.dart';

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
  });

  Future<Either<String, AgentDistributorModel>> getAgentById({
    required String agentId,
  });

  Future<dynamic> crudAgentSupportFiles(CrudAgentSupportFilesParams params);
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
      dio.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final endPoint = EndPoints.agentDistributor.getAgentClients;
      final response = await dio.get(endPoint: "$endPoint$agentId");

      final data = response['data'];

      final List<ClientModel> clientsList = [];
      for (int i = 0; i < data.length; i++) {
        clientsList.add(ClientModel.fromJson(data[i]));
      }

      return Right(clientsList);
    } catch (e) {
      debugPrint("Error in getAgentClientsList: $e");
      return Left("Error in getAgentClientsList: $e");
    }
  }

  @override
  Future<Either<String, List<ProfileInvoiceModel>>> getAgentInvoiceList({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final endPoint = EndPoints.agentDistributor.getAgentInvoicesList;
      final response = await dio.get(endPoint: "$endPoint$agentId");
      final data = response['data'];

      final List<ProfileInvoiceModel> invoicesList = [];
      for (int i = 0; i < data.length; i++) {
        invoicesList.add(ProfileInvoiceModel.fromJson(data[i]));
      }

      return Right(invoicesList);
    } catch (e) {
      debugPrint("Error in getAgentInvoiceList: $e");
      return Left("Error in getAgentInvoiceList: $e");
    }
  }

  @override
  Future<Either<String, List<ProfileCommentModel>>> getAgentCommentsList({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final endPoint = EndPoints.agentDistributor.getAgentCommentsList;
      final response = await dio.get(endPoint: "$endPoint$agentId");
      final data = response['data'];

      final List<ProfileCommentModel> commentsList = [];
      for (int i = 0; i < data.length; i++) {
        commentsList.add(ProfileCommentModel.fromJson(data[i]));
      }

      return Right(commentsList);
    } catch (e) {
      debugPrint("Error in getAgentCommentsList: $e");
      return Left("Error in getAgentCommentsList: $e");
    }
  }

  @override
  Future<Either<String, ProfileCommentModel>> addAgentComment({
    required String agentId,
    required String content,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final endPoint = EndPoints.agentDistributor.addCommentAgent;
      final response = await dio.post(endPoint: endPoint, data: {
        "agent_id": agentId,
        "content": content,
      });

      final data = response['data'];
      final ProfileCommentModel comment = ProfileCommentModel.fromJson(data);
      return Right(comment);
    } catch (e) {
      debugPrint("Error in getAgentCommentsList: $e");
      return Left("Error in getAgentCommentsList: $e");
    }
  }

  @override
  Future<Either<String, List<DateInstallationClient>>> getDateVisitAgent({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final endPoint = EndPoints.agentDistributor.getDateVisitAgent;
      final response = await dio.get(endPoint: "$endPoint$agentId");
      final data = response['data'];

      final List<DateInstallationClient> visitDates = [];
      for (int i = 0; i < data.length; i++) {
        visitDates.add(DateInstallationClient.fromJson(data[i]));
      }

      return Right(visitDates);
    } catch (e) {
      debugPrint("Error in getAgentCommentsList: $e");
      return Left("Error in getAgentCommentsList: $e");
    }
  }

  @override
  Future<Either<String, void>> addAgentDate({
    required DateInstallationClient agentDateModel,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final endPoint = EndPoints.events.addDateInstall;
      final response = await dio.post(
        endPoint: endPoint,
        data: agentDateModel.toMap(),
      );
      final data = apiDataHandler(response);
      return Right(null);
    } on BaseAppException catch (e) {
      debugPrint("Error in addAgentDate: ${e.message}");
      return Left(e.message);
    }
  }

  @override
  Future<Either<String, AgentDistributorModel>> doneTraining({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await dio.post(
        endPoint: EndPoints.agentDistributor.doneTraining(agentId),
      );

      final data = apiDataHandler(response);
      final AgentDistributorModel agent = AgentDistributorModel.fromJson(data);

      return Right(agent);
    } catch (e) {
      debugPrint("Error in done training: $e");
      return Left("Error in training: $e");
    }
  }

  @override
  Future<Either<String, AgentDistributorModel>> getAgentById({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(EndPoints.baseUrls.url);
      final response =
          await dio.get(endPoint: "agent/get_agent_byId.php?agentId=$agentId");

      final data = response['data'];

      final AgentDistributorModel agent =
          AgentDistributorModel.fromJson(data[0]);

      return Right(agent);
    } catch (e) {
      debugPrint("Error in getAgent: $e");
      return Left("Error in getAgent: $e");
    }
  }

  @override
  Future<dynamic> crudAgentSupportFiles(
      CrudAgentSupportFilesParams params) async {
    try {
      dio.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await dio.postRequestWithFile(
        endPoint:
            EndPoints.agentDistributor.crudAgentSupportFiles(params.agentId),
        data: params.toMap(),
        files: params.addedFiles,
      );

      return apiDataHandler(response);
    } on BaseAppException catch (e) {
      debugPrint("Error in crudAgentSupportFiles: ${e.message}");
      throw e.message;
    }
  }
}
