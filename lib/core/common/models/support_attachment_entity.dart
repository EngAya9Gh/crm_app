import 'package:image_picker/image_picker.dart';

class SupportAttachmentEntity {
  final String? id;
  final String? localId;
  final String? filePath;
  final String? invoiceId;
  final String? agentId;
  final String? typeFile;
  final XFile? file;

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
