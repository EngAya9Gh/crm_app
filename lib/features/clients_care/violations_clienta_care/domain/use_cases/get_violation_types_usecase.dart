import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/management_model.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violation_type_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/violations_repository.dart';


@lazySingleton
class GetViolationsTypesUseCase extends BaseUsecase<
    ResponseWrapper<List<ViolationType>>, GetViolationsTypesParams> {
  GetViolationsTypesUseCase(this._repository);

  final ViolationsRepository _repository;

  @override
  Future<ResponseWrapper<List<ViolationType>>>  call(
      GetViolationsTypesParams params,
      ) async {
    return await _repository.getAllViolationsTypes(params);
  }
}

class GetViolationsTypesParams {

  Map<String, dynamic> toParams() {
    return {};
  }
}