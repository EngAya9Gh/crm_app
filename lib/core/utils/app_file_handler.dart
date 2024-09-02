import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import '../common/helpers/check_sorage_permission.dart';
import '../common/models/file_model.dart';

class AppFileHandler {
  static Future<FileModel?> pickImage({
    required FileType type,
    bool allowMultiple = false,
  }) async {
    if (!(await checkStoragePermission())) return null;
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: type,
      allowMultiple: allowMultiple,
    );

    if (filePickerResult == null) return null;

    return FileModel(
      file: filePickerResult.files.first.xFile,
      url: kIsWeb ? filePickerResult.files.first.xFile.path : null,
      path: kIsWeb ? null : filePickerResult.files.first.path,
    );
  }
}
