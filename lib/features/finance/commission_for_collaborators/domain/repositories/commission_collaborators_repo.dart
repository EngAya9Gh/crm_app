import 'package:dartz/dartz.dart';
import '../../../../../core/common/models/participate_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/commission_collaborators_response.dart';
import '../use_cases/get_commission_collaborators_usecase.dart';

abstract class CommissionCollaboratorsRepository {
  Future<Either<String, CommissionCollaboratorsResponseModel>> getCommissionCollaborators(CommissionCollaboratorsParams params);
  Future<Either<String, List<ParticipateModel>>> getParticipateSelect();
}
