import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/participate_list_repository.dart';

@injectable
class GetParticipateInvoiceByIdUsecase extends BaseUsecase<
    Result<ResponseWrapper<InvoiceModel>>, GetParticipateInvoiceByIdParams> {
  GetParticipateInvoiceByIdUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<InvoiceModel>>> call(
      GetParticipateInvoiceByIdParams params) {
    return repository.getInvoiceDataById(params.toParams);
  }
}

class GetParticipateInvoiceByIdParams {
  final String? idInvoice;

  GetParticipateInvoiceByIdParams({this.idInvoice});

  Map<String, dynamic> get toParams => {'id_invoice': idInvoice};
}
