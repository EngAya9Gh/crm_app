import 'package:crm_smart/features/support/dates_table/data/data_sources/dates_table_datasource.dart';
import 'package:crm_smart/features/support/dates_table/domain/repositories/dates_table_repo.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/reschedule_date.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DatesTableRepo)
class DatesTableRepoImpl implements DatesTableRepo {
  final DatesTableDataSource _datesTableDataSource;

  DatesTableRepoImpl(this._datesTableDataSource);

  @override
  Future<Either<String, List<AppointmentModel>>> getDateInstallation(
    GetDateInstallationParams params,
  ) async {
    try {
      final data = await _datesTableDataSource.getDateInstallation(params);
      final appointments = List<AppointmentModel>.from(
          data.map((e) => AppointmentModel.fromJson(e)));
      return Right(appointments);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> rescheduleDate(
    RescheduleDateParams params,
  ) async {
    try {
      final data = await _datesTableDataSource.rescheduleDate(params);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, dynamic>> changeDateToDone(
    ChangeDateToDoneParams params,
  ) async {
    try {
      final data = await _datesTableDataSource.changeDateToDone(params);
      return Right(data);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
