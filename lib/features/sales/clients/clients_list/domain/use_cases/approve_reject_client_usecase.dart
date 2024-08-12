import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class ApproveRejectClientUsecase extends UseCase<
    Result<ResponseWrapper<ClientModel>>, ApproveRejectClientPararm> {
  ApproveRejectClientUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<ClientModel>>> call(
      ApproveRejectClientPararm params) {
    return repository.approveClientRejectAdmin(
        params.toMap, params.toParams, params.id_clients.toString());
  }
}

class ApproveRejectClientPararm {
  ApproveRejectClientPararm({
    required this.id_clients,
    required this.isApprove,
    required this.fkRejectClient,
    required this.reasonChange,
  });

  final String id_clients;
  final String isApprove;
  final String fkRejectClient;
  final String reasonChange;

  Map<String, dynamic> get toMap {
    return {
      'isAppprove': isApprove,
      'fk_rejectClient': fkRejectClient,
      'reason_change': reasonChange,
    };
  }

  Map<String, dynamic> get toParams => {};
}
