import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/clients_debts_repo.dart';

@lazySingleton
class GetClientsDebtsUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetClientsDebtsParams> {
  GetClientsDebtsUsecase(this._repository);

  final ClientsDebtsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientsDebtsParams params,
  ) async {
    return await _repository.getClientsDebts(params);
  }
}

class GetClientsDebtsParams {
  final String? fkRegion;
  final String? invoiceState;
  final String? dateFrom;
  final String? dateTo;

  const GetClientsDebtsParams({
    this.fkRegion,
    this.invoiceState,
    this.dateFrom,
    this.dateTo,
  });

  // to params
  Map<String, dynamic> toParams() {
    return {
      'fk_region': fkRegion,
      'invoice_state': invoiceState,
      'date_from': dateFrom,
      'date_to': dateTo,
    }..removeWhere((key, value) => value == null || value == '');
  }
}
