import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class RescheduleDateUsecase
    extends BaseUsecase<Either<String, dynamic>, RescheduleDateParams> {
  RescheduleDateUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, dynamic>> call(
    RescheduleDateParams params,
  ) async {
    return await _repository.rescheduleDate(params);
  }
}

class RescheduleDateParams {
  final String scheduleId;
  final String typeProcess;
  final DateTime dateClientVisit;
  final DateTime dateEnd;
  final String processReason;
  final String typeDate;
  final String fkUser;
  final int? force;
  final String? sms;

  RescheduleDateParams({
    required this.scheduleId,
    required this.typeProcess,
    required this.dateClientVisit,
    required this.dateEnd,
    required this.processReason,
    required this.typeDate,
    required this.fkUser,
    this.force,
    this.sms,
  });

  Map<String, dynamic> toMap() {
    return {
      'typeProcess': typeProcess,
      'date_client_visit': dateClientVisit,
      'date_end': dateEnd,
      'processReason': processReason,
      'type_date': typeDate,
      'fk_user': fkUser,
      if (force != null) 'force': force,
      if (sms != null) 'sms': sms,
    };
  }
}
