import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<List<MapEntry<String, MultipartFile>>> getFiles({
  XFile? file,
  XFile? fileLogo,
  List<XFile>? files,
  String? fileKey,
  String? fileLogoKey,
  String? filesKey,
  bool isFilesKeysIndexed = false,
}) async {
  List<MapEntry<String, MultipartFile>> result = [];

  if (file != null) {
    MultipartFile multiPartFile = await _multipartFile(file);

    result.add(MapEntry(fileKey ?? 'file', multiPartFile));
  }

  if (fileLogo != null) {
    MultipartFile multiPartFile = await _multipartFile(fileLogo);

    result.add(MapEntry(fileLogoKey ?? 'fileLogo', multiPartFile));
  }

  if (files != null) {
    files.forEachIndexed((index, f) async {
      final multiPartFile = await _multipartFile(f);

      final String key = _prepareKey(filesKey, index, isFilesKeysIndexed);

      result.add(MapEntry(key, multiPartFile));
    });
  }

  return result;
}

String _prepareKey(String? filesKey, int index, bool isFilesKeysIndexed) {
  if (filesKey != null) {
    return isFilesKeysIndexed ? '$filesKey[$index]' : filesKey;
  }
  return isFilesKeysIndexed ? 'uploadfiles[$index]' : 'uploadfiles[]';
}

Future<MultipartFile> _multipartFile(XFile file) async {
  final bytes = await file.readAsBytes();
  final multiPartFile = MultipartFile.fromBytes(bytes, filename: file.name);
  return multiPartFile;
}
