import 'package:crm_smart/features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../model/appointment_model.dart';
import '../use_cases/cancel_schedule_usecase.dart';
import '../use_cases/change_date_to_done_usecase.dart';
import '../use_cases/get_date_installation_usecase.dart';
import '../use_cases/reschedule_date_usecase.dart';

abstract interface class DatesTableRepo {
  Future<Either<String, List<AppointmentModel>>> getDateInstallation(
    GetDateInstallationParams params,
  );

  Future<Either<String, dynamic>> rescheduleDate(RescheduleDateParams params);

  Future<Either<String, dynamic>> changeDateToDone(
      ChangeDateToDoneParams params);

  Future<Either<String, dynamic>> cancelSchedule(CancelScheduleParams params);

  Future<Either<String, dynamic>> returnScheduleVisitToOpen(
    ReturnScheduleVisitToOpenParams params,
  );
}
