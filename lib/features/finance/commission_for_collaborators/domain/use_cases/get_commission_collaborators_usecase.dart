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
  final String? from;
  final String? to;
  final String? participate_fk;
  final String? fk_idUser;

  const CommissionCollaboratorsParams({
    this.page = 1,
    this.limit = 20,
    this.filter,
    this.from,
    this.to,
    this.participate_fk,
    this.fk_idUser,
  });



  Map<String, dynamic> toMap() {
    return {
      'page': this.page,
      'limit': this.limit,
      'filter': this.filter,
      'from': this.from,
      'to': this.to,
      'participate_fk': this.participate_fk,
      'fk_idUser': this.fk_idUser,
    }..removeWhere((key, value) => value==null||value=='',);
  }

  CommissionCollaboratorsParams copyWith({
    int? page,
    int? limit,
    String? filter,
    String? from,
    String? to,
    String? participate_fk,
    String? fk_idUser,
  }) {
    return CommissionCollaboratorsParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      filter: filter ?? this.filter,
      from: from ?? this.from,
      to: to ?? this.to,
      participate_fk: participate_fk ?? this.participate_fk,
      fk_idUser: fk_idUser ?? this.fk_idUser,
    );
  }
}
