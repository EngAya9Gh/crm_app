import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../common/client_profile/client_dates_tab/data/models/client_date_model.dart';
import '../../data/models/date_invoice_model.dart';
import '../../data/models/subscribed_client_model.dart';
import '../use_cases/cancel_schedule_usecase.dart';
import '../use_cases/change_date_to_done_usecase.dart';
import '../use_cases/cofirm_visit_date_usecase.dart';
import '../use_cases/get_date_installation_usecase.dart';
import '../use_cases/get_invoices_by_client_for_date_usecase.dart';
import '../use_cases/get_subscribed_clients_usecase.dart';
import '../use_cases/reschedule_date_usecase.dart';
import '../use_cases/return_schedule_visit_to_open_usecase.dart';

abstract interface class DatesTableRepo {
  Future<Either<String, PaginationResponseWrapper>> getDateInstallation(
    GetDateInstallationParams params,
  );

  Future<Either<String, dynamic>> rescheduleDate(RescheduleDateParams params);

  Future<Either<String, dynamic>> changeDateToDone(ChangeDateToDoneParams params);
  Future<Either<String, ResponseWrapper<EventModel>>> confirmVisitDate(ConfirmVisitDateParams params);

  Future<Either<String, dynamic>> cancelSchedule(CancelScheduleParams params);

  Future<Either<String, PaginationResponseWrapper>> returnScheduleVisitToOpen(
    ReturnScheduleVisitToOpenParams params,
  );

  Future<Either<String, List<SubscribedClientModel>>> getSubscribedClients(
    GetSubscribedClientsParams params,
  );

  Future<Either<String, List<DateInvoiceModel>>> getInvoicesByClientForDate(
    GetInvoicesByClientForDateParams params,
  );

  Future<Either<String, PaginationResponseWrapper>> getCancelReasons(
    GetCancelReasonsParams params,
  );
}
