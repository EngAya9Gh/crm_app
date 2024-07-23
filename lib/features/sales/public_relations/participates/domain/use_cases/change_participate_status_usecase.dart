import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/participates/state_participate_enum.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../../data/models/participat_model.dart';
import '../repositories/participate_list_repository.dart';

@lazySingleton
class ChangeParticipateStatusUsecase
    extends UseCase<Either<String, ParticipateModel>, ChangeParticipateParams> {
  ChangeParticipateStatusUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Either<String, ParticipateModel>> call(
    ChangeParticipateParams params,
  ) {
    return repository.changeParticipateStatus(params);
  }
}

class ChangeParticipateParams {
  final String idParticipate;
  final StateParticipateEnum stateParticipate;
  final String reason;

  const ChangeParticipateParams({
    required this.idParticipate,
    required this.stateParticipate,
    required this.reason,
  });

  Map<String, dynamic> toMap() {
    return {
      'state': stateParticipate.value,
      'reason': reason,
    };
  }
}
