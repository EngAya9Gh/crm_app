import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../model/versionModel.dart';
import '../repositories/versions_repo.dart';

import 'add_version_usecase.dart';

@lazySingleton
class UpdateVersionsUsecase extends BaseUsecase<Either<String, ResponseWrapper<VersionModel>>, AddVersionPramas> {
  UpdateVersionsUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Either<String, ResponseWrapper<VersionModel>>> call(
    AddVersionPramas params,
  ) async {
    return await _repository.updateVersion(params);
  }
}
