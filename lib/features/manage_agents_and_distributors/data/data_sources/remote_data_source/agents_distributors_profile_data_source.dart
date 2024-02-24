import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../api/dio_services.dart';
import '../../../../../core/common/models/profile_invoice_model.dart';
import '../../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../../core/utils/app_strings.dart';
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
}

@LazySingleton(as: AgentsDistributorsProfileDataSource)
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
      print("data.length is => ${data.length}");
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
  Future<Either<String, List<DateInstallationClient>>> getDateVisitAgent({
    required String agentId,
  }) async {
    try {
      dio.changeBaseUrl(AppStrings.apiBaseUrl2);
      final response = await dio.get(endPoint: "getDateVisitAgent/$agentId");
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
      dio.changeBaseUrl(AppStrings.apiBaseUrl1);
      final response = await dio.post(
        endPoint: "client/invoice/add_date_install.php",
        data: agentDateModel.toMap(),
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
      );
      print("response => $response");
      return Right(null);
    } catch (e) {
      print("Error in addAgentDate: $e");
      return Left("Error in addAgentDate: $e");
    }
  }
}
