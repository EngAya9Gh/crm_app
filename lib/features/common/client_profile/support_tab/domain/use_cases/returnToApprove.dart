import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class ReturnInvoiceApproveUsecase
    extends BaseUsecase<Either<String, InvoiceModel>, ReturnToApproveParams> {
  ReturnInvoiceApproveUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, InvoiceModel>> call(
    ReturnToApproveParams params,
  ) async {
    return await _repository.returnToApprove(params);
  }
}

class ReturnToApproveParams {
  final comment;
  final id_invoice;

  ReturnToApproveParams({
    required this.comment,
    required this.id_invoice,
  });

  Map<String, dynamic> toMap() {
    return {
      'comment': comment,
    };
  }
}
