
import 'package:crm_smart/core/services/api/api_services.dart';
import 'package:crm_smart/core/utils/end_points.dart';

/// Repositorio para manejar aprobaciones pendientes
abstract class PendingApprovalsRepository {
  Future<List<dynamic>> getPendingApprovals();
  Future<bool> approveUser(String userId);
  Future<bool> rejectUser(String userId);
}

/// Implementación del repositorio de aprobaciones
class PendingApprovalsRepositoryImpl implements PendingApprovalsRepository {
  final ApiServices _apiServices;

  PendingApprovalsRepositoryImpl(this._apiServices);

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
       endPoint:  'users/approve',
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
      final response = await _apiServices.post(endPoint: 
        'users/reject',
        data: {'userId': userId},
      );
      return response['success'] ?? false;
    } catch (e) {
      print('Error rejecting user: $e');
      return false;
    }
  }
}