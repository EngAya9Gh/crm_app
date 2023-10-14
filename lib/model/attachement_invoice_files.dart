import 'dart:convert';

import 'invoiceModel.dart';

AttachmentInvoiceResponse attachmentInvoiceResponseFromJson(String str) => AttachmentInvoiceResponse.fromJson(json.decode(str));

String attachmentInvoiceResponseToJson(AttachmentInvoiceResponse data) => json.encode(data.toJson());

class AttachmentInvoiceResponse {
  String? imageRecord;
  List<FileAttach>? filesAttach;

  AttachmentInvoiceResponse({
    this.imageRecord,
    this.filesAttach,
  });

  factory AttachmentInvoiceResponse.fromJson(Map<String, dynamic> json) => AttachmentInvoiceResponse(
    imageRecord: json["image_record"],
    filesAttach: json["files_attach"] == null ? [] : List<FileAttach>.from(json["files_attach"]!.map((x) => FileAttach.fromMap(x))),
  );

  Map<String, dynamic> toJson() => {
    "image_record": imageRecord,
    "files_attach": filesAttach == null ? [] : List<dynamic>.from(filesAttach!.map((x) => x.toMap())),
  };
}
