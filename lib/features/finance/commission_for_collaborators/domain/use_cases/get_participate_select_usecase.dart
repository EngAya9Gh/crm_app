import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/common/models/participate_model.dart';
import '../../data/models/commission_collaborators_response.dart';
import '../repositories/commission_collaborators_repo.dart';

@injectable
class GetParticipateSelectUseCase extends UseCaseNoParam<Either<String, List<ParticipateModel>>> {
  GetParticipateSelectUseCase(this.repository);

  final CommissionCollaboratorsRepository repository;

  @override
  Future<Either<String, List<ParticipateModel>>> call() {
    return repository.getParticipateSelect();
  }
}
