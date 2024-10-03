import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_saver/file_saver.dart';
import 'package:open_filex/open_filex.dart';

class AppFilesHelper {
  static Future<String> downloadFileAndReturnPath({
    required String name,
    Uint8List? bytes,
    File? file,
    String? filePath,
    LinkDetails? link,
    String ext = "",
    MimeType mimeType = MimeType.other,
    String? customMimeType,
    Dio? dioClient,
    Uint8List Function(dynamic)? transformDioResponse,
  }) async {
    return await FileSaver.instance.saveFile(
      name: name,
      bytes: bytes,
      file: file,
      filePath: filePath,
      link: link,
      ext: ext,
      mimeType: mimeType,
      customMimeType: customMimeType,
      dioClient: dioClient,
      transformDioResponse: transformDioResponse,
    );
  }

  static Future<void> openFile(String filePath) async {
    await OpenFilex.open(filePath);
  }
}
