import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/commission_collaborators_response.dart';
import '../repositories/commission_collaborators_repo.dart';

@injectable
class GetCommissionCollaboratorsUseCase extends BaseUsecase<Either<String, CommissionCollaboratorsResponseModel>, CommissionCollaboratorsParams> {
  GetCommissionCollaboratorsUseCase(this.repository);

  final CommissionCollaboratorsRepository repository;

  @override
  Future<Either<String, CommissionCollaboratorsResponseModel>> call(CommissionCollaboratorsParams params) {
    return repository.getCommissionCollaborators(params);
  }
}

class CommissionCollaboratorsParams {
  final int page;
  final int limit;
  final String? filter;

  const CommissionCollaboratorsParams({
    this.page = 1,
    this.limit = 20,
    this.filter,
  });

  Map<String, dynamic> toMap() {
    return {
      'page': this.page,
      'limit': this.limit,
      'filter': this.filter,
    }..removeWhere((key, value) => value==null||value=='',);
  }
}
