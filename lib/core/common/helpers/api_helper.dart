import '../../utils/app_constants.dart';

abstract class ApiHelper {
  static int calculatePage({required int skip, int? limit}) {
    limit ??= AppConstants.kPerPage;
    return (skip / limit).ceil() + 1;
  }

  static Map<String, dynamic> prepareParamsList({
    required String key,
    required List<dynamic> values,
  }) {
    Map<String, dynamic> map = {};

    for (int i = 0; i < values.length; i++) {
      map["$key[$i]"] = values[i];
    }

    return map;
  }

  static String? handleString(dynamic value) {
    return value == null ? null : value.toString();
  }

  static List<T>? listFromJson<T>({
    required List<dynamic>? json,
    required T Function(dynamic json) fromJson,
  }) {
    if (json == null) return null;
    return json.map<T>((e) => fromJson(e)).toList();
  }
}
