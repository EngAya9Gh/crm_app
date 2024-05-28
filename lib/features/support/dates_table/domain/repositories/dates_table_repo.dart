import 'package:crm_smart/features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:dartz/dartz.dart';

abstract interface class DatesTableRepo {
  Future<Either<String, List<AppointmentModel>>> getDateInstallation(
    GetDateInstallationParams params,
  );

  Future<Either<String, dynamic>> rescheduleDate(RescheduleDateParams params);

  Future<Either<String, dynamic>> changeDateToDone(
      ChangeDateToDoneParams params);

  Future<Either<String, dynamic>> cancelSchedule(CancelScheduleParams params);
}
