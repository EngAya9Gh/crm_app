import 'package:collection/collection.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/client/client_debt_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/clients_debts_repo.dart';

@lazySingleton
class GetClientsDebtsUsecase extends BaseUsecase<
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
  final List<TypeOfInvoice>? invoiceType;


  const GetClientsDebtsParams({
    this.fkRegion,
    this.invoiceState,
    this.dateFrom,
    this.dateTo,
    this.invoiceType,
  });

  // to params
  Map<String, dynamic> toParams() {
    final Map<String, dynamic> data = <String, dynamic>{};
    var mapType = {};
    invoiceType?.forEachIndexed(
          (index, element) => mapType.addAll({
        'state_invoice[$index]': element?.value,
      }),
    );
    data['id_regoin']= fkRegion;
    data['invoice_state']= invoiceState;
    data['from']= dateFrom;
    data['to']= dateTo;
    return data..addAll({if (mapType.isNotEmpty) ...mapType});

  }
}
