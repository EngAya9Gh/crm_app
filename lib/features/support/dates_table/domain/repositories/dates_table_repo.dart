import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../model/calendar/event_model.dart';
import '../../data/models/date_invoice_model.dart';
import '../../data/models/subscribed_client_model.dart';
import '../use_cases/cancel_schedule_usecase.dart';
import '../use_cases/change_date_to_done_usecase.dart';
import '../use_cases/get_date_installation_usecase.dart';
import '../use_cases/reschedule_date_usecase.dart';

abstract interface class DatesTableRepo {
  Future<Either<String, List<EventModel>>> getDateInstallation(
    GetDateInstallationParams params,
  );

  Future<Either<String, dynamic>> rescheduleDate(RescheduleDateParams params);

  Future<Either<String, dynamic>> changeDateToDone(
      ChangeDateToDoneParams params);

  Future<Either<String, dynamic>> cancelSchedule(CancelScheduleParams params);

  Future<Either<String, dynamic>> returnScheduleVisitToOpen(
    ReturnScheduleVisitToOpenParams params,
  );

  Future<Either<String, List<SubscribedClientModel>>> getSubscribedClients(
    GetSubscribedClientsParams params,
  );

  Future<Either<String, List<DateInvoiceModel>>> getInvoicesByClientForDate(
    GetInvoicesByClientForDateParams params,
  );
}
