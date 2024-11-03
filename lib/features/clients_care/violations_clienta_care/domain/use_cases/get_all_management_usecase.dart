import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/management_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/violations_repository.dart';


@lazySingleton
class GetManagementsUsecase extends BaseUsecase<
    ResponseWrapper<List<ManagementModel>>, GetManagementsParams> {
  GetManagementsUsecase(this._repository);

  final ViolationsRepository _repository;

  @override
  Future<ResponseWrapper<List<ManagementModel>>>  call(
      GetManagementsParams params,
      ) async {
    return await _repository.getAllManagements(params);
  }
}

class GetManagementsParams {

  Map<String, dynamic> toParams() {
    return {};
  }
}