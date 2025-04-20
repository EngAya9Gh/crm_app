import 'package:crm_smart/features/versions/data/models/incomming_update.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
// ignore: unused_import
import '../../../../model/versionModel.dart';
import '../repositories/versions_repo.dart';


@lazySingleton
class GetIncommingVersionInfoUsecase extends UseCaseNoParam<Either<String, ResponseWrapper<IconmmingUpdateInfo>>> {
  GetIncommingVersionInfoUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Either<String, ResponseWrapper<IconmmingUpdateInfo>>> call() async {
    return await _repository.getIncommingUpdateInfo();
  }
}
