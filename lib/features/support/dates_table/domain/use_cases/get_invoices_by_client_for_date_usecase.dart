import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/date_invoice_model.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class GetInvoicesByClientForDateUsecase extends BaseUsecase<
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

// class AddDateInstallParams {
//   final int? force;
//   final String? sms;
//
//   AddDateInstallParams({
//     this.force,
//     this.sms,
//     // ... other parameters ...
//   });
//
//   Map<String, dynamic> toMap() {
//     final Map<String, dynamic> data = {
//       // ... other parameters ...
//     };
//
//     if (force != null) {
//       data['force'] = force;
//     }
//
//     if (sms != null) {
//       data['sms'] = sms;
//     }
//
//     return data;
//   }
// }
