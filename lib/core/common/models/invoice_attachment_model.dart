import 'package:equatable/equatable.dart';

class InvoiceAttachmentModel extends Equatable {
  final String fileUrl;
  final String invoiceId;
  final String typeFile;
  final String id;

  InvoiceAttachmentModel({
    required this.fileUrl,
    required this.invoiceId,
    required this.typeFile,
    required this.id,
  });

  factory InvoiceAttachmentModel.fromJson(Map<String, dynamic> json) {
    return InvoiceAttachmentModel(
      fileUrl: json['file_attach_invoice'].toString(),
      invoiceId: json['fk_invoice'].toString(),
      typeFile: json['type_file'].toString(),
      id: json['id'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file_attach_invoice': fileUrl,
      'fk_invoice': invoiceId,
      'type_file': typeFile,
      'id': id,
    };
  }

  InvoiceAttachmentModel copyWith({
    String? fileUrl,
    String? invoiceId,
    String? typeFile,
    String? id,
  }) {
    return InvoiceAttachmentModel(
      fileUrl: fileUrl ?? this.fileUrl,
      invoiceId: invoiceId ?? this.invoiceId,
      typeFile: typeFile ?? this.typeFile,
      id: id ?? this.id,
    );
  }

  @override
  List<Object?> get props => [fileUrl, invoiceId, typeFile, id];
}
