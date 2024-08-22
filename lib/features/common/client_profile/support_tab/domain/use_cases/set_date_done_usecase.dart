import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class SetDateDoneUsecase
    extends BaseUsecase<Either<String, InvoiceModel>, SetDateDoneParams> {
  SetDateDoneUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, InvoiceModel>> call(
    SetDateDoneParams params,
  ) async {
    return await _repository.setDateDone(params);
  }
}

class SetDateDoneParams {
  final String id_invoice;
  final String clientusername;

  SetDateDoneParams({
    required this.id_invoice,
    required this.clientusername,
  });

  Map<String, dynamic> toMap() {
    return {
      // 'id_invoice': id_invoice,
      'clientusername': clientusername,
    };
  }
}
