import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/invoice_attachment_model.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/participate_list_repository.dart';

@lazySingleton
class GetInvoiceAttachmentsUsecase extends UseCase<
    Either<String, List<InvoiceAttachmentModel>>, GetInvoiceAttachmentsParams> {
  final ParticipateListRepository _repository;

  GetInvoiceAttachmentsUsecase({required ParticipateListRepository repository})
      : _repository = repository;

  @override
  Future<Either<String, List<InvoiceAttachmentModel>>> call(
    GetInvoiceAttachmentsParams params,
  ) async {
    final data = await _repository.getInvoiceAttachments(params);
    return await _repository.getInvoiceAttachments(params);
  }
}

class GetInvoiceAttachmentsParams {
  final String invoiceId;

  GetInvoiceAttachmentsParams({required this.invoiceId});
}
