abstract class CacheServices {
  Future<dynamic> saveData({
    String? boxName,
    required String key,
    required dynamic value,
  });

  dynamic getData({required String key});

  Future<void> removeData({required String key});

  Future<void> clearData();
}
