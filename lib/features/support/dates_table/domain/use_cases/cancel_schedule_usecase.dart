import 'package:crm_smart/features/support/dates_table/domain/repositories/dates_table_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';

@lazySingleton
class CancelScheduleUsecase
    extends UseCase<Either<String, dynamic>, CancelScheduleParams> {
  CancelScheduleUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, dynamic>> call(
    CancelScheduleParams params,
  ) async {
    return await _repository.cancelSchedule(params);
  }
}

class CancelScheduleParams {
  final String typeProcess;
  final String scheduleId;

  const CancelScheduleParams({
    required this.scheduleId,
    required this.typeProcess,
  });

  Map<String, dynamic> toMap() {
    return {
      'typeProcess': typeProcess,
    };
  }
}
