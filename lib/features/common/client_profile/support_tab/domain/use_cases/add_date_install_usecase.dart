import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/calendar/event_model.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class AddDateInstallUsecase
    extends UseCase<Either<String, EventModel>, AddDateInstallParams> {
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

  AddDateInstallParams({
    required this.fkUser,
    required this.dateClientVisit,
    required this.idInvoice,
    required this.typeDate,
    required this.dateEnd,
    this.fkClient,
    this.force,
    this.dateTable,
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
      if (dateTable != null) 'date_table': 1,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
