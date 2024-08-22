import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/client_support_file_model.dart';
import '../repositories/clients_list_repository.dart';

@lazySingleton
class GetClientSupportFilesUsecase extends BaseUsecase<
    Either<String, List<ClientSupportFileModel>>, GetClientSupportFilesParams> {
  final ClientsListRepository _repository;

  GetClientSupportFilesUsecase({required ClientsListRepository repository})
      : _repository = repository;

  @override
  Future<Either<String, List<ClientSupportFileModel>>> call(
    GetClientSupportFilesParams params,
  ) async {
    return await _repository.getClientSupportFiles(params);
  }
}

class GetClientSupportFilesParams {
  final String invoiceId;

  GetClientSupportFilesParams({required this.invoiceId});
}
