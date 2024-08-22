import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/cancel_date_reason_model.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class CancelScheduleUsecase
    extends BaseUsecase<Either<String, dynamic>, CancelScheduleParams> {
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
  final String processReason;
  final CancelDateReasonModel selectedReason;

  const CancelScheduleParams({
    required this.scheduleId,
    required this.typeProcess,
    required this.processReason,
    required this.selectedReason,
  });

  Map<String, dynamic> toMap() {
    return {
      'typeProcess': typeProcess,
      'processReason': processReason,
      'reason_cancel': selectedReason.id,
    };
  }
}
