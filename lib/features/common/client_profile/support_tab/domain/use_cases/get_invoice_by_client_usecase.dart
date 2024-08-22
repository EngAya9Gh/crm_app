import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class GetInvoiceByClientUsecase extends BaseUsecase<
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
  final bool? subscribed;

  const GetInvoiceByClientParams({
    required this.idClient,
    this.subscribed,
  });

  Map<String, dynamic>? toMap() {
    return {
      'subscribed': subscribed,
    }..removeWhere((key, value) => value == null);
  }

  // copy with method
  GetInvoiceByClientParams copyWith({
    String? idClient,
    bool? subscribed,
  }) {
    return GetInvoiceByClientParams(
      idClient: idClient ?? this.idClient,
      subscribed: subscribed,
    );
  }
}
