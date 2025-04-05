abstract class PendingApprovalsRepository {
  /// Obtiene la lista de usuarios pendientes de aprobación
  Future<List<dynamic>> getPendingApprovals();

  /// Aprueba un usuario pendiente
  Future<bool> approveUser(String userId);

  /// Rechaza un usuario pendiente
  Future<bool> rejectUser(String userId);
}
