import 'package:crm_smart/features/support/dates_timeline/data/models/date_timeline_model.dart';
import 'package:crm_smart/features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart';
import 'package:dartz/dartz.dart';


abstract interface class DatesTimeLinesRepo {
  Future<Either<String, List<DateTimelineModel>>> getDateTimelinesByEmployee(
      GetTimelineByEmployeeParams params,
      );
}
