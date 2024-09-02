import 'package:image_picker/image_picker.dart';

class FileModel {
  final XFile? file;
  final String? path;
  final String? url;

  const FileModel({
    this.file,
    this.path,
    this.url,
  });

  FileModel copyWith({
    XFile? file,
    String? path,
    String? url,
  }) {
    return FileModel(
      file: file ?? this.file,
      path: path ?? this.path,
      url: url ?? this.url,
    );
  }
}
