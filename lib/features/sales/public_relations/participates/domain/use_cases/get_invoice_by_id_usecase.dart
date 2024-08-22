import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/participate_list_repository.dart';

@injectable
class GetInvoiceByIdUsecase extends BaseUsecase<
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
