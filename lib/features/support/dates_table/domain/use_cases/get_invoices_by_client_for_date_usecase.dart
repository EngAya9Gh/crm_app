import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../data/models/date_invoice_model.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class GetInvoicesByClientForDateUsecase extends UseCase<
    Either<String, List<DateInvoiceModel>>, GetInvoicesByClientForDateParams> {
  GetInvoicesByClientForDateUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, List<DateInvoiceModel>>> call(
    GetInvoicesByClientForDateParams params,
  ) async {
    return await _repository.getInvoicesByClientForDate(params);
  }
}

class GetInvoicesByClientForDateParams {
  final String idClient;

  const GetInvoicesByClientForDateParams({
    required this.idClient,
  });
}
