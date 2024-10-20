import 'package:crm_smart/features/support/dates_timeline/data/models/date_timeline_model.dart';
import 'package:crm_smart/features/support/dates_timeline/domain/respositories/dates_timline_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';

@lazySingleton
class GetTimelineByEmployeeUseCase extends BaseUsecase<
    Either<String, List<DateTimelineModel>>, GetTimelineByEmployeeParams> {
  GetTimelineByEmployeeUseCase(this._repository);

  final DatesTimeLinesRepo _repository;

  @override
  Future<Either<String, List<DateTimelineModel>>> call(
      GetTimelineByEmployeeParams params,
      ) async {
    return await _repository.getDateTimelinesByEmployee(params);
  }
}

class GetTimelineByEmployeeParams {
  final String idClient;
  final String? selectedDate;

  const GetTimelineByEmployeeParams({
    required this.idClient,
    required this.selectedDate,
  });

  Map<String, dynamic> get toMap => {
    'date': selectedDate,
  };

}