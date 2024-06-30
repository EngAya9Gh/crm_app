import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class ReturnInvoiceApproveUsecase
    extends UseCase<Either<String, InvoiceModel>, ReturnToApproveParams> {
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
  }}
