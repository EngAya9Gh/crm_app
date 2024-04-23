import 'dart:io';

import 'package:equatable/equatable.dart';

class ClientSupportFileModel extends Equatable {
  final String fileUrl;
  final String invoiceId;
  final String typeFile;
  final String id;
  final File? file;

  ClientSupportFileModel({
    required this.fileUrl,
    required this.invoiceId,
    required this.typeFile,
    required this.id,
    this.file,
  });

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
    File? file,
  }) {
    return ClientSupportFileModel(
      fileUrl: fileUrl ?? this.fileUrl,
      invoiceId: invoiceId ?? this.invoiceId,
      typeFile: typeFile ?? this.typeFile,
      id: id ?? this.id,
      file: file ?? this.file,
    );
  }

  factory ClientSupportFileModel.fromFile(File file) {
    return ClientSupportFileModel(
      fileUrl: file.path,
      invoiceId: '',
      typeFile: '1',
      id: '',
      file: file,
    );
  }

  File toFile() {
    return File(fileUrl);
  }

  @override
  List<Object?> get props => [fileUrl, invoiceId, typeFile, id];
}
