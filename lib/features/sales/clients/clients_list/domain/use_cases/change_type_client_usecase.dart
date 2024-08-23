import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class ChangeTypeClientUsecase extends BaseUsecase<
    Result<ResponseWrapper<ClientModel>>, ChangeTypeClientParam> {
  ChangeTypeClientUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<ClientModel>>> call(
      ChangeTypeClientParam params) {
    return repository.changeTypeClient(
        params.toMap, params.toParams, params.id_clients.toString());
  }
}

class ChangeTypeClientParam {
  ChangeTypeClientParam(
      {required this.type_client,
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
        'id_user': userId,
        'fk_rejectClient': fk_rejectClient,
        'reason_change': reason_change,
        'offer_price': offer_price,
        'date_price': date_price,
      };

  Map<String, dynamic> get toParams => {
        'id_clients': this.id_clients,
      };
}
