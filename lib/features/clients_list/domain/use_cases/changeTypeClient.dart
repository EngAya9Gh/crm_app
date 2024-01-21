
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class ChangeTypeClientUsecase extends UseCase<Result<ResponseWrapper<void>>, ChangeTypeClient> {
  ChangeTypeClientUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<void>>> call(ChangeTypeClient params) {
    return repository.changeTypeClient( params.toMap , params.toParams);
  }
}

class ChangeTypeClient {
  ChangeTypeClient(this.type_client, this.id_clients, this.userId,this.fk_rejectClient,this.reason_change,this.offer_price,this.date_price);

  final String type_client;
  final String id_clients;
  final String userId;
  final String fk_rejectClient;
  final String reason_change;
  final String offer_price;
  final String date_price;

  Map<String, dynamic> get toMap => {
    'type_client': type_client,
    'id_user':userId,
    'fk_rejectClient':fk_rejectClient,
    'reason_change':reason_change,
    'offer_price':offer_price,
    'date_price':date_price,

  };
  Map<String, dynamic> get toParams => {

    'id_clients': this.id_clients,

  };

}