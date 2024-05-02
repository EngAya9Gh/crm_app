import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class GetInvoiceByClientUsecase extends UseCase<
    Either<String, List<InvoiceModel>>, GetInvoiceByClientParams> {
  GetInvoiceByClientUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, List<InvoiceModel>>> call(
    GetInvoiceByClientParams params,
  ) async {
    return await _repository.getInvoiceByClient(params);
  }
}

class GetInvoiceByClientParams {
  final String idClient;

  GetInvoiceByClientParams({
    required this.idClient,
  });

  Map<String, dynamic> toMap() {
    return {
      'fk_idClient': idClient,
    };
  }
}
