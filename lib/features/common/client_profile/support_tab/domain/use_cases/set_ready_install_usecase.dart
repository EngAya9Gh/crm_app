import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class SetReadyInstallUsecase extends BaseUsecase<
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
  final String? reasonSuspend;
  final String? notesReady;
  final String? reasonNotReady;
  final String? TypeReadyClient;

  SetReadyInstallParams({
    required this.idInvoice,
    this.TypeReadyClient,
    this.notesReady,
    this.reasonSuspend,
    this.reasonNotReady,
  });

  Map<String, dynamic> toBody() {
    Map<String, dynamic> body = {};

    void addIfNotNull(String key, dynamic value) {
      if (value != null) {
        body[key] = value;
      }
    }

    addIfNotNull('reason_suspend', reasonSuspend);
    addIfNotNull('notes_ready', notesReady);
    addIfNotNull('reason_notReady', reasonNotReady);
    addIfNotNull('TypeReadyClient', TypeReadyClient);

    return body;
  }
}
