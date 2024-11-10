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
  bool? isFilesKeysIndexed,
}) async {
  isFilesKeysIndexed ??= false;
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
    final futures = files.asMap().entries.map((entry) async {
      final index = entry.key;
      final f = entry.value;

      final multiPartFile = await _multipartFile(f);
      final String key = _prepareKey(filesKey, index, isFilesKeysIndexed!);
      return MapEntry(key, multiPartFile);
    });
    result.addAll(await Future.wait(futures));
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
  final multiPartFile =await MultipartFile.fromBytes(bytes, filename: file.name);
  return multiPartFile;
}
