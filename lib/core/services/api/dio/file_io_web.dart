import 'dart:html' as html;

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<List<MapEntry<String, MultipartFile>>> getFiles({
  XFile? file,
  dynamic fileLogo,
  List<dynamic>? files,
}) async {
  print("web ......... web");

  List<MapEntry<String, MultipartFile>> result = [];

  if (file != null) {
    final bytes = await file.readAsBytes();
    final multiPartFile = MultipartFile.fromBytes(bytes, filename: file.name);

    result.add(MapEntry('file', multiPartFile));
  }

  if (fileLogo != null) {
    final reader = html.FileReader();
    reader.readAsArrayBuffer(fileLogo);
    await reader.onLoadEnd.first;
    final typedData = reader.result as List<int>;
    final multiPartFile =
        MultipartFile.fromBytes(typedData, filename: fileLogo.name);

    result.add(MapEntry('fileLogo', multiPartFile));
  }

  if (files != null) {
    for (var f in files) {
      final reader = html.FileReader();
      reader.readAsArrayBuffer(f);
      await reader.onLoadEnd.first;
      final typedData = reader.result as List<int>;
      final multiPartFile =
          MultipartFile.fromBytes(typedData, filename: f.name);

      result.add(MapEntry('uploadfiles[]', multiPartFile));
    }
  }

  return result;
}
