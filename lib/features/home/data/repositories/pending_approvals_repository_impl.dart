import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/api_services.dart';
import 'package:crm_smart/core/services/api/api_utils.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/core/utils/end_points.dart';
import 'package:crm_smart/features/home/data/data_sources/remote_date_source.dart';
import 'package:crm_smart/features/home/domain/models/home_statistics_model.dart';
import 'package:crm_smart/features/home/domain/repositories/pending_approvals_repository.dart';
import 'package:crm_smart/features/home/presentation/pages/mob_home_page.dart';
import 'package:injectable/injectable.dart';

/// Implementación del repositorio de aprobaciones
@LazySingleton(as:PendingApprovalsRepository)
class PendingApprovalsRepositoryImpl implements PendingApprovalsRepository {
  final ApiServices _apiServices;
  HomeRemoteDataSource _dataSource;
  PendingApprovalsRepositoryImpl(this._apiServices, this._dataSource);

  @override
  Future<List<dynamic>> getPendingApprovals() async {
    try {
      _apiServices.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await _apiServices.get(endPoint: 'users/pending_approvals');
      return response['data'] ?? [];
    } catch (e) {
      print('Error fetching pending approvals: $e');
      return _getMockData();
    }
  }

  List<dynamic> _getMockData() {
    return List.generate(
      8,
      (index) => {
        'id': 'user$index',
        'name': 'Usuario $index',
        'avatar': null,
        'date': DateTime.now().subtract(Duration(days: index)).toString(),
      },
    );
  }

  @override
  Future<bool> approveUser(String userId) async {
    try {
      final response = await _apiServices.post(
        endPoint: 'users/approve',
        data: {'userId': userId},
      );
      return response['success'] ?? false;
    } catch (e) {
      print('Error approving user: $e');
      return false;
    }
  }

  @override
  Future<bool> rejectUser(String userId) async {
    try {
      final response = await _apiServices.post(
        endPoint: 'users/reject',
        data: {'userId': userId},
      );
      return response['success'] ?? false;
    } catch (e) {
      print('Error rejecting user: $e');
      return false;
    }
  }

  @override
  Future<Result<ResponseWrapper<HomeStatisticsModel>>> getHomeStatistices() async {
    return toApiResult(() => _dataSource.getHomeStatistices());
  }
}
