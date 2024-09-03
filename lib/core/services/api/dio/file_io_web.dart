import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<List<MapEntry<String, MultipartFile>>> getFiles({
  XFile? file,
  XFile? fileLogo,
  List<XFile>? files,
}) async {
  print("web ......... web");

  List<MapEntry<String, MultipartFile>> result = [];

  if (file != null) {
    MultipartFile multiPartFile = await _multipartFile(file);

    result.add(MapEntry('file', multiPartFile));
  }

  if (fileLogo != null) {
    MultipartFile multiPartFile = await _multipartFile(fileLogo);

    result.add(MapEntry('fileLogo', multiPartFile));
  }

  if (files != null) {
    for (var f in files) {
      final multiPartFile = await _multipartFile(f);

      result.add(MapEntry('uploadfiles[]', multiPartFile));
    }
  }

  return result;
}

Future<MultipartFile> _multipartFile(XFile file) async {
  final bytes = await file.readAsBytes();
  final multiPartFile = MultipartFile.fromBytes(bytes, filename: file.name);
  return multiPartFile;
}
