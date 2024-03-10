import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../data/models/client_support_file_model.dart';
import '../repositories/clients_list_repository.dart';

@lazySingleton
class GetClientSupportFilesUsecase extends UseCase<
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
