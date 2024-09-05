import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

import '../common/helpers/check_sorage_permission.dart';
import '../common/models/file_model.dart';

class AppFileHandler {
  static Future<FileModel?> pickSinge({
    required FileType type,
  }) async {
    if (!(await checkStoragePermission())) return null;
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: type,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (filePickerResult == null) return null;

    return FileModel(
      file: filePickerResult.files.first.xFile,
      url: kIsWeb ? filePickerResult.files.first.xFile.path : null,
      path: kIsWeb ? null : filePickerResult.files.first.path,
    );
  }

  static Future<List<FileModel>?> pickMultiple({
    required FileType type,
  }) async {
    if (!(await checkStoragePermission())) return null;
    final filePickerResult = await FilePicker.platform.pickFiles(
      type: type,
      allowMultiple: true,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (filePickerResult == null) return null;

    return filePickerResult.files.map((e) {
      return FileModel(
        file: e.xFile,
        path: kIsWeb ? null : e.path,
        url: kIsWeb ? e.xFile.path : null,
      );
    }).toList();
  }
}
