import 'package:crm_smart/features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart';
import 'package:crm_smart/features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../../../model/invoiceModel.dart';
import '../use_cases/add_date_install_usecase.dart';
import '../use_cases/get_invoice_by_client_usecase.dart';
import '../use_cases/set_date_done_usecase.dart';
import '../use_cases/set_ready_install_usecase.dart';

abstract interface class SupportTabRepo {
  Future<Either<String, List<InvoiceModel>>> getInvoiceByClient(
      GetInvoiceByClientParams params);

  Future<Either<String, InvoiceModel>> setDateDone(SetDateDoneParams params);

  Future<Either<String, InvoiceModel>> setReadyInstall(
      SetReadyInstallParams params);

  Future<Either<String, dynamic>> addDateInstall(AddDateInstallParams params);

  Future<Either<String, List<AppointmentModel>>> getDateInstallation(
    GetDateInstallationParams params,
  );

  Future<Either<String, dynamic>> rescheduleDate(RescheduleDateParams params);
  Future<Either<String, dynamic>> changeDateToDone(
      ChangeDateToDoneParams params);
}
