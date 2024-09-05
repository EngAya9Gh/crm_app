import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<List<MapEntry<String, MultipartFile>>> getFiles({
  XFile? file,
  XFile? fileLogo,
  List<dynamic>? files,
  String? fileKey,
  String? fileLogoKey,
  String? filesKey,
  bool? isFilesKeysIndexed,
}) async {
  isFilesKeysIndexed ??= false;
  List<MapEntry<String, MultipartFile>> result = [];

  if (file != null) {
    result.add(MapEntry(
      fileKey ?? 'file',
      MultipartFile.fromFileSync(
        file.path,
        filename: file.path.split('/').last,
      ),
    ));
  }

  if (fileLogo != null) {
    result.add(MapEntry(
      fileLogoKey ?? 'fileLogo',
      MultipartFile.fromFileSync(
        fileLogo.path,
        filename: fileLogo.path.split('/').last,
      ),
    ));
  }

  if (files != null) {
    files.forEachIndexed((index, f) async {
      final multiPartFile = MultipartFile.fromFileSync(
        f.path,
        filename: f.path.split('/').last,
      );

      final String key = _prepareKey(filesKey, index, isFilesKeysIndexed!);

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
