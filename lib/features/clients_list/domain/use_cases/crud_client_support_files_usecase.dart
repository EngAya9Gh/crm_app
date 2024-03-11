import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/use_case/use_case.dart';
import '../../data/models/client_support_file_model.dart';
import '../repositories/clients_list_repository.dart';

@lazySingleton
class CrudClientSupportFilesUsecase extends UseCase<
    Either<String, List<ClientSupportFileModel>>,
    CrudClientSupportFilesParams> {
  final ClientsListRepository _repository;

  CrudClientSupportFilesUsecase({required ClientsListRepository repository})
      : _repository = repository;

  @override
  Future<Either<String, List<ClientSupportFileModel>>> call(
    CrudClientSupportFilesParams params,
  ) async {
    return await _repository.crudClientSupportFiles(params);
  }
}

class CrudClientSupportFilesParams {
  final String invoiceId;
  final List<String> deletedFiles;
  final List<File> addedFiles;

  CrudClientSupportFilesParams({
    required this.invoiceId,
    required this.deletedFiles,
    required this.addedFiles,
  });
}
