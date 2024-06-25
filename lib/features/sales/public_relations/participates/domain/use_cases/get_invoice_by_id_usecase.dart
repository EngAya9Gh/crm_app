import '../../../../../../core/services/api/result.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/participate_list_repository.dart';
import '../../../../../../model/invoiceModel.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';

@injectable
class GetInvoiceByIdUsecase extends UseCase<
    Result<ResponseWrapper<InvoiceModel>>, GetInvoiceByIdParams> {
  GetInvoiceByIdUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<InvoiceModel>>> call(
      GetInvoiceByIdParams params) {
    return repository.getInvoiceDataById(params.toParams);
  }
}

class GetInvoiceByIdParams {
  final String? idInvoice;

  GetInvoiceByIdParams({this.idInvoice});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> params = {}
      ..removeWhere((key, value) => value == null);
    params = params.map((key, value) => MapEntry(key, value.toString()));
    return params;
  }

  Map<String, dynamic> get toParams => {'id_invoice': idInvoice};
}
