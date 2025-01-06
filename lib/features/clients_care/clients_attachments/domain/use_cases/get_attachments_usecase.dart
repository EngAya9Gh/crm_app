import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/attachment_model.dart';
import '../repositories/clients_attachments_repo.dart';

@injectable
class GetAttachmentsUseCase extends BaseUsecase<ResponseWrapper< List<AttachmentModel>>, GetAttachmentsParams> {
  GetAttachmentsUseCase(this.repository);

  final ClientsAttachmentsRepository repository;

  @override
  Future<ResponseWrapper< List<AttachmentModel>>> call(GetAttachmentsParams params) {
    return repository.getAttachments(params);
  }
}

class GetAttachmentsParams {
  final dynamic type;
  final int page;
  final int? clientId;
  final int? invoiceId;

  const GetAttachmentsParams({
    this.type = 'all',
    this.clientId,
    this.invoiceId,
    this.page=1,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': this.type,
      'page': this.page,
      'client_id': this.clientId,
      'invoice_id': this.invoiceId,
    }..removeWhere(
        (key, value) => value == null,
      );
  }

  bool isEmpty() {
    return (this.type == null && this.clientId == null);
  }

  GetAttachmentsParams copyWith({
    ValueGetter<int?>? type,
    int? page,
    ValueGetter<int?>? client_id,
    ValueGetter<int?>? invoice_id,
  }) {
    return GetAttachmentsParams(
      page: page ?? this.page,
      type: type != null ? type() : this.type,
      clientId: client_id != null ? client_id() : this.clientId,
      invoiceId: invoice_id != null ? invoice_id() : this.invoiceId,
    );
  }
}
