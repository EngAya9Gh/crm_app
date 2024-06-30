import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/invoiceModel.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class ReceiveDeviceUsecase
    extends UseCase<Either<String, InvoiceModel>, ReceiveDeviceParams> {
  ReceiveDeviceUsecase(this._repository);

  final SupportTabRepo _repository;

  @override
  Future<Either<String, InvoiceModel>> call(
      ReceiveDeviceParams params,
      ) async {
    return await _repository.receiveDevice(params);
  }
}

class ReceiveDeviceParams {
  final deviceState;
  final id_invoice;


  ReceiveDeviceParams({
    required this.deviceState,
    required this.id_invoice,

  });

  Map<String, dynamic> toMap() {
    return {
      'state': deviceState,

    };
  }}
