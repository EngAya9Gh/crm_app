import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/common/models/support_attachment_entity.dart';

class ClientSupportFileModel extends SupportAttachmentEntity
    with EquatableMixin {
  final String id;
  final String fileUrl;
  final String invoiceId;
  final String typeFile;
  final XFile? xFile;

  ClientSupportFileModel({
    required this.id,
    required this.fileUrl,
    required this.invoiceId,
    required this.typeFile,
    this.xFile,
  }) : super(
          id: id,
          filePath: fileUrl,
          invoiceId: invoiceId,
          typeFile: typeFile,
          file: xFile,
        );

  factory ClientSupportFileModel.fromJson(Map<String, dynamic> json) {
    return ClientSupportFileModel(
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

  ClientSupportFileModel copyWith({
    String? fileUrl,
    String? invoiceId,
    String? typeFile,
    String? id,
    XFile? file,
  }) {
    return ClientSupportFileModel(
      fileUrl: fileUrl ?? this.fileUrl,
      invoiceId: invoiceId ?? this.invoiceId,
      typeFile: typeFile ?? this.typeFile,
      id: id ?? this.id,
      xFile: file ?? this.xFile,
    );
  }

  factory ClientSupportFileModel.fromFile(XFile file) {
    return ClientSupportFileModel(
      fileUrl: file.path,
      invoiceId: '',
      typeFile: '1',
      id: '',
      xFile: file,
    );
  }

  File toFile() {
    return File(fileUrl);
  }

  @override
  List<Object?> get props => [fileUrl, invoiceId, typeFile, id];
}
