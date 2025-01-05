import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/attachment_model.dart';
import '../repositories/clients_attachments_repo.dart';

@injectable
class GetAttachmentsUseCase extends BaseUsecase<Either<String, List<AttachmentModel>>, GetAttachmentsParams> {
  GetAttachmentsUseCase(this.repository);

  final ClientsAttachmentsRepository repository;

  @override
  Future<Either<String, List<AttachmentModel>>> call(GetAttachmentsParams params) {
    return repository.getAttachments(params);
  }
}

class GetAttachmentsParams {
  final dynamic type;
  final int? clientId;
  final int? invoiceId;

  const GetAttachmentsParams({
    this.type='all',
    this.clientId,
    this.invoiceId,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': this.type,
      'client_id': this.clientId,
      'invoice_id': this.invoiceId,
    }..removeWhere(
        (key, value) => value == null,
      );
  }
  bool isEmpty(){
    return (this.type==null&&this.clientId==null);
  }

  GetAttachmentsParams copyWith({
    ValueGetter<int?>? type,
    ValueGetter<int?>? client_id,
    ValueGetter<int?>? invoice_id,
  }) {
    return GetAttachmentsParams(
      type: type != null ? type() : this.type,
      clientId: client_id != null ? client_id() : this.clientId,
      invoiceId: invoice_id != null ? invoice_id() : this.invoiceId,
    );
  }
}
