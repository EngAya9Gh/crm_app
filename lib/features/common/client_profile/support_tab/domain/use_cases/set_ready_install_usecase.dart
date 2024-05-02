import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class SetReadyInstallUsecase
    extends UseCase<Either<String, InvoiceModel>, SetReadyInstallParams> {
  SetReadyInstallUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, InvoiceModel>> call(
    SetReadyInstallParams params,
  ) async {
    return await _repository.setReadyInstall(params);
  }
}

class SetReadyInstallParams {
  final String id_invoice;
  final String? TypeReadyClient;
  final String? notes_ready;
  final String? reason_suspend;
  final String? nameUser;
  final String? date_temp;
  final String? date_ready_prev;
  final String? date_not_readyinstall;
  final String? user_not_ready_install;
  final String? ready_install;
  final String? reason_notReady;
  final String? user_ready_install;
  final String? date_readyinstall;
  final String? count_delay_ready;

  SetReadyInstallParams({
    required this.id_invoice,
    this.TypeReadyClient,
    this.notes_ready,
    this.reason_suspend,
    this.nameUser,
    this.date_temp,
    this.date_ready_prev,
    this.date_not_readyinstall,
    this.user_not_ready_install,
    this.ready_install,
    this.reason_notReady,
    this.user_ready_install,
    this.date_readyinstall,
    this.count_delay_ready,
  });

  Map<String, dynamic> toMap() {
    return {
      // if (id_invoice != null) 'id_invoice': id_invoice,
      if (TypeReadyClient != null) 'TypeReadyClient': TypeReadyClient,
      if (notes_ready != null) 'notes_ready': notes_ready,
      if (reason_suspend != null) 'reason_suspend': reason_suspend,
      if (nameUser != null) 'nameUser': nameUser,
      if (date_temp != null) 'date_temp': date_temp,
      if (date_ready_prev != null) 'date_ready_prev': date_ready_prev,
      if (date_not_readyinstall != null)
        'date_not_readyinstall': date_not_readyinstall,
      if (user_not_ready_install != null)
        'user_not_ready_install': user_not_ready_install,
      if (ready_install != null) 'ready_install': ready_install,
      if (reason_notReady != null) 'reason_notReady': reason_notReady,
      if (user_ready_install != null) 'user_ready_install': user_ready_install,
      if (date_readyinstall != null) 'date_readyinstall': date_readyinstall,
      if (count_delay_ready != null) 'count_delay_ready': count_delay_ready,
    };
  }
}
