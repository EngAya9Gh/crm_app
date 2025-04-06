import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/home/presentation/pages/mob_home_page.dart';

abstract class PendingApprovalsRepository {
  /// Obtiene la lista de usuarios pendientes de aprobación
  Future<List<dynamic>> getPendingApprovals();
  Future<Result<ResponseWrapper<HomeStatisticsModel>>> getHomeStatistices();

  /// Aprueba un usuario pendiente
  Future<bool> approveUser(String userId);

  /// Rechaza un usuario pendiente
  Future<bool> rejectUser(String userId);
}
