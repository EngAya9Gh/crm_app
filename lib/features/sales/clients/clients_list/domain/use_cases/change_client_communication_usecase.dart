import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class ChangeClientCommunicationUseCase extends BaseUsecase<
    Result<ResponseWrapper<CommunicationDetailModel>>, ChangeClientCommunicationParam> {
  ChangeClientCommunicationUseCase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<CommunicationDetailModel>>> call(
      ChangeClientCommunicationParam params) {
    return repository.changeClientCommunication(
      params.toMap, params.toParams,params.clientRecordId.toString());
  }
}

class ChangeClientCommunicationParam {
  ChangeClientCommunicationParam(
      {required this.state,
        required this.clientRecordId,
        required this.reasonId,});

  String? state;
  int clientRecordId;
  String? reasonId;

  Map<String, dynamic> get toMap => {
    'state': state,
    'client_id': clientRecordId,
    'reason_id': reasonId,


  };

  Map<String, dynamic> get toParams => {
    'client_id': this.clientRecordId,
  };
}
