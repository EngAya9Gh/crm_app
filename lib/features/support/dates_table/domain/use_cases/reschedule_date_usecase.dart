import 'package:crm_smart/features/support/dates_table/domain/repositories/dates_table_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';

@lazySingleton
class RescheduleDateUsecase
    extends UseCase<Either<String, dynamic>, RescheduleDateParams> {
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

  RescheduleDateParams({
    required this.scheduleId,
    required this.typeProcess,
    required this.dateClientVisit,
    required this.dateEnd,
    required this.processReason,
    required this.typeDate,
    required this.fkUser,
  });

  Map<String, dynamic> toMap() {
    return {
      'typeProcess': typeProcess,
      'date_client_visit': dateClientVisit,
      'date_end': dateEnd,
      'processReason': processReason,
      'type_date': typeDate,
      'fk_user': fkUser,
    };
  }
}
