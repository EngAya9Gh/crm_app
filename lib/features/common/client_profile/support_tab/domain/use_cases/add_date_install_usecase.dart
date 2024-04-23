import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class AddDateInstallUsecase
    extends UseCase<Either<String, dynamic>, AddDateInstallParams> {
  AddDateInstallUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, dynamic>> call(
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
  final typeDate;

  AddDateInstallParams({
    required this.fkUser,
    required this.dateClientVisit,
    required this.idInvoice,
    required this.typeDate,
    required this.dateEnd,
  });

  Map<String, dynamic> toMap() {
    return {
      'fk_user': fkUser,
      'date_client_visit': dateClientVisit,
      'fk_invoice': idInvoice,
      'type_date': typeDate.toString(),
      'date_end': dateEnd,
    };
  }
}
