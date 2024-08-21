import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class SetReadyInstallUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>, SetReadyInstallParams> {
  SetReadyInstallUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    SetReadyInstallParams params,
  ) async {
    return await _repository.setReadyInstall(params);
  }
}

class SetReadyInstallParams {
  final String idInvoice;
  final String? dateNotReadyInstall;
  final String? reasonSuspend;
  final String? notesReady;
  final String? reasonNotReady;
  final String? TypeReadyClient;
  final String? readyInstall;

  SetReadyInstallParams({
    required this.idInvoice,
    this.TypeReadyClient,
    this.notesReady,
    this.reasonSuspend,
    this.dateNotReadyInstall,
    this.readyInstall,
    this.reasonNotReady,
  });

  Map<String, dynamic> toBody() {
    Map<String, dynamic> body = {};

    void addIfNotNull(String key, dynamic value) {
      if (value != null) {
        body[key] = value;
      }
    }

    addIfNotNull('date_not_readyinstall', dateNotReadyInstall);
    addIfNotNull('reason_suspend', reasonSuspend);
    addIfNotNull('notes_ready', notesReady);
    addIfNotNull('reason_notReady', reasonNotReady);
    addIfNotNull('TypeReadyClient', TypeReadyClient);
    addIfNotNull('ready_install', readyInstall);

    return body;
  }
}
