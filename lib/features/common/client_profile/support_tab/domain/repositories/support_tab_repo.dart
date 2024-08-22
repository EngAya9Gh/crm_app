import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/event_model.dart';
import '../../../../../../model/invoiceModel.dart';
import '../use_cases/add_date_install_usecase.dart';
import '../use_cases/cancel_date_usecase.dart';
import '../use_cases/get_invoice_by_client_usecase.dart';
import '../use_cases/receive_device_usecase.dart';
import '../use_cases/returnToApprove.dart';
import '../use_cases/set_date_done_usecase.dart';
import '../use_cases/set_ready_install_usecase.dart';

abstract interface class SupportTabRepo {
  Future<Either<String, List<InvoiceModel>>> getInvoiceByClient(
      GetInvoiceByClientParams params);

  Future<Either<String, InvoiceModel>> setDateDone(SetDateDoneParams params);

  Future<Either<String, PaginationResponseWrapper>> setReadyInstall(
    SetReadyInstallParams params,
  );

  Future<Either<String, InvoiceModel>> returnToApprove(
      ReturnToApproveParams params);

  Future<Either<String, InvoiceModel>> receiveDevice(
      ReceiveDeviceParams params);

  Future<Either<String, EventModel>> addDateInstall(
    AddDateInstallParams params,
  );

  Future<Either<String, InvoiceModel>> cancelDateInstall(
    CancelDateInstallParams params,
  );
}
