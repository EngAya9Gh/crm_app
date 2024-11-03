import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/violations_model.dart';
import '../repositories/violations_repository.dart';

@injectable
class UpdateViolationUseCase extends BaseUsecase<
   ResponseWrapper<ViolationModel>, UpdateViolationParams> {
  UpdateViolationUseCase(this.repository);

  final ViolationsRepository repository;

  @override
  Future<ResponseWrapper<ViolationModel>> call(
      UpdateViolationParams params) {
    return repository.updateViolation(params);
  }
}

class UpdateViolationParams {
  final String violationId;
  final String description;
  final String acceptStatus;

  UpdateViolationParams({
    required this.violationId,
    required this.description,
    required this.acceptStatus,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
     map['description'] = description;
     map['accept_status'] = acceptStatus;

    return map;
  }
  String param() {
    return violationId;
  }
}
