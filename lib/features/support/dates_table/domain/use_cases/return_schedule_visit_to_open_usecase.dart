import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class ReturnScheduleVisitToOpenUsecase
    extends UseCase<Either<String, dynamic>, ReturnScheduleVisitToOpenParams> {
  ReturnScheduleVisitToOpenUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, dynamic>> call(
    ReturnScheduleVisitToOpenParams params,
  ) async {
    return await _repository.returnScheduleVisitToOpen(params);
  }
}

class ReturnScheduleVisitToOpenParams {
  final String scheduleId;
  final String comment;

  ReturnScheduleVisitToOpenParams({
    required this.scheduleId,
    required this.comment,
  });

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
    };
  }
}
