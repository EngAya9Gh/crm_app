
import 'package:injectable/injectable.dart';

import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../../../core/use_case/use_case.dart';
import '../../data/models/clients_list_response.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class ChangeTypeClientUsecase extends UseCase<Result<ResponseWrapper<ClientModel>>, ChangeTypeClientParam> {
  ChangeTypeClientUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<ClientModel>>> call(ChangeTypeClientParam params) {
    return repository.changeTypeClient
      (params.toMap ,
        params.toParams,
        params.id_clients.toString());
  }
}

class ChangeTypeClientParam {
  ChangeTypeClientParam({
     required this.type_client,
      required this.id_clients,
      required this.userId,
     required this.fk_rejectClient,
     required this.reason_change,
     required this.offer_price,
     required this.date_price});

    String? type_client;
    String id_clients;
    String userId;
    String? fk_rejectClient;
    String? reason_change;
    String? offer_price;
    String? date_price;

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