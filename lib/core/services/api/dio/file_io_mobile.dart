import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

Future<List<MapEntry<String, MultipartFile>>> getFiles({
  XFile? file,
  XFile? fileLogo,
  List<dynamic>? files,
}) async {
  List<MapEntry<String, MultipartFile>> result = [];

  print("file type => ${file.runtimeType}");
  if (file != null) {
    result.add(MapEntry(
      'file',
      MultipartFile.fromFileSync(
        file.path,
        filename: file.path.split('/').last,
      ),
    ));
  }

  if (fileLogo != null) {
    result.add(MapEntry(
      'fileLogo',
      MultipartFile.fromFileSync(
        fileLogo.path,
        filename: fileLogo.path.split('/').last,
      ),
    ));
  }

  if (files != null) {
    for (var f in files) {
      result.add(MapEntry(
        'uploadfiles[]',
        MultipartFile.fromFileSync(
          f.path,
          filename: f.path.split('/').last,
        ),
      ));
    }
  }

  return result;
}
