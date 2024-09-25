import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/event_model.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class AddDateInstallUsecase
    extends BaseUsecase<Either<String, EventModel>, AddDateInstallParams> {
  AddDateInstallUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, EventModel>> call(
    AddDateInstallParams params,
  ) async {
    return await _repository.addDateInstall(params);
  }
}

class AddDateInstallParams {
  final idInvoice;
  final dateClientVisit;
  final dateEnd;
  final fkUser;
  final String typeDate;
  final String? fkClient;
  int? force;
  int? dateTable;
  String? sms;

  AddDateInstallParams({
    required this.fkUser,
    required this.dateClientVisit,
    required this.idInvoice,
    required this.typeDate,
    required this.dateEnd,
    this.fkClient,
    this.force,
    this.dateTable,
    this.sms,
  });

  Map<String, dynamic> toMap() {
    return {
      'fk_user': fkUser,
      'date_client_visit': dateClientVisit,
      'fk_invoice': idInvoice,
      'type_date': typeDate.toString(),
      'date_end': dateEnd,
      'fk_client': fkClient,
      if (force != null) 'force': force,
      if (sms != null) 'sms': sms,
      if (dateTable != null) 'date_table': 1,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
