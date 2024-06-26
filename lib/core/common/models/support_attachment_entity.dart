import 'dart:io';

class SupportAttachmentEntity {
  final String? id;
  final String? localId;
  final String? filePath;
  final String? invoiceId;
  final String? agentId;
  final String? typeFile;
  final File? file;

  SupportAttachmentEntity({
    this.id,
    this.localId,
    this.filePath,
    this.invoiceId,
    this.agentId,
    this.typeFile,
    this.file,
  });
}
