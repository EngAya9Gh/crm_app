import 'package:dartz/dartz.dart';
import '../../data/models/commission_collaborators_response.dart';
import '../use_cases/get_commission_collaborators_usecase.dart';

abstract class CommissionCollaboratorsRepository {
  Future<Either<String, CommissionCollaboratorsResponseModel>> getCommissionCollaborators(CommissionCollaboratorsParams params);
}
