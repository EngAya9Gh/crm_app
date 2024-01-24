
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/clients_list_response.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class ApproveRejectClientUsecase extends UseCase<Result<ResponseWrapper<ClientModel>>, ApproveRejectClientPararm> {
  ApproveRejectClientUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<ClientModel>>> call(ApproveRejectClientPararm params) {
    return repository.approveClientReject_admin( params.toMap , params.toParams,params.id_clients.toString());
  }
}

class ApproveRejectClientPararm {
  ApproveRejectClientPararm({
    required this.isAppprove,
    required this.id_clients,
    required this.userId,
 });

  String? isAppprove;
  String id_clients;
  String userId;


  Map<String, dynamic> get toMap => {
    'isAppprove': isAppprove,
    'id_user':userId,



  };
  Map<String, dynamic> get toParams => {

    'id_clients': this.id_clients,

  };

}