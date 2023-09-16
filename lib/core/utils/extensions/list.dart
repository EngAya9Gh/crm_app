import 'package:flutter/foundation.dart';

typedef FromJson<T> = T Function(dynamic json);

extension ListExtension on List {
  bool get isNullOrEmpty => isEmpty;

  Future<List<T>> computeFromJson<T>(FromJson<T> fromJson) async {
    return await compute<FromJson<T>, List<T>>(mapperFromJson, fromJson);
  }

  List<T> mapperFromJson<T>(FromJson<T> fromJson) {
    return List<dynamic>.from(this).map<T>(fromJson).toList();
  }
}

extension ListExtension2<T> on List<T>? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
