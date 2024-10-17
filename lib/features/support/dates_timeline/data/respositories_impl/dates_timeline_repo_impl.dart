import 'package:crm_smart/features/support/dates_timeline/data/models/date_timeline_model.dart';
import 'package:crm_smart/features/support/dates_timeline/domain/respositories/dates_timline_repo.dart';
import 'package:crm_smart/features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../data_sources/dates_timeline_datasource.dart';

@LazySingleton(as: DatesTimeLinesRepo)
class DatesTimelineRepoImpl implements DatesTimeLinesRepo {
  final DatesTimelineDatasource _datesTimelineDatasource;

  DatesTimelineRepoImpl(this._datesTimelineDatasource);
  //


  @override
  Future<Either<String, List<DateTimelineModel>>> getDateTimelinesByEmployee(
      GetTimelineByEmployeeParams params,
      ) async {
    try {
      final data = await _datesTimelineDatasource.getDateTimelinesByEmployee(params);
      final dateInvoices = data.data??[];
      return Right(dateInvoices);
    } catch (e) {
      debugPrint("error in getInvoicesByClientForDate => $e");
      return Left(e.toString());
    }
  }


}
