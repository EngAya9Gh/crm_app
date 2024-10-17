import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class StoreClientCommunicationUseCase extends BaseUsecase<
    Result<ResponseWrapper<CommunicationDetailModel>>, StoreClientCommunicationParam> {
  StoreClientCommunicationUseCase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<CommunicationDetailModel>>> call(
      StoreClientCommunicationParam params) {
    return repository.storeClientCommunication(
        params.toMap, params.toParams,);
  }
}

class StoreClientCommunicationParam {
  StoreClientCommunicationParam(
      {required this.state,
        required this.clientId,
        required this.reasonId,});

  String state;
  String clientId;
  String? reasonId;

  Map<String, dynamic> get toMap => {
    'state': state,
    'client_id': clientId,
    'reason_id': reasonId,


  };

  Map<String, dynamic> get toParams => {
  };
}
