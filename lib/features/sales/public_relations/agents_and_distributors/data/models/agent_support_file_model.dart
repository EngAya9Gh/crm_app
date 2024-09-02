import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../../core/common/models/support_attachment_entity.dart';

class AgentSupportFileModel extends SupportAttachmentEntity
    with EquatableMixin {
  final String? id;
  final String? fkAgent;
  final String? fileUrl;
  final String? typeFile;
  final String? addDate;
  final XFile? xFile;

  AgentSupportFileModel({
    this.id,
    this.fkAgent,
    this.fileUrl,
    this.typeFile,
    this.addDate,
    this.xFile,
  }) : super(
          id: id,
          filePath: fileUrl,
          typeFile: typeFile,
          file: File(fileUrl!),
          agentId: fkAgent,
        );

  factory AgentSupportFileModel.fromJson(Map<String, dynamic> json) {
    return AgentSupportFileModel(
      id: json["id"].toString(),
      fkAgent: json["fk_agent"].toString(),
      fileUrl: json["file_path"],
      typeFile: json["type_file"],
      addDate: json["add_date"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fk_agent": fkAgent,
      "file_path": fileUrl,
      "type_file": typeFile,
      "add_date": addDate,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      fkAgent,
      fileUrl,
      typeFile,
      addDate,
      xFile,
    ];
  }
}
