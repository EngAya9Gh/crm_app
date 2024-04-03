import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

import '../../errors/cache_exceptions.dart';
import '../di/di_container.dart';
import 'cache_services.dart';

@named
@LazySingleton(as: CacheServices)
class SecureStorageConsumer extends CacheServices {
  final FlutterSecureStorage _secureStorage;

  SecureStorageConsumer(this._secureStorage);

  @override
  Future<void> saveData({
    String? boxName,
    required String key,
    required dynamic value,
  }) async {
    try {
      if (value.runtimeType != String) {
        getIt<Logger>().e('Value must be a string');
        throw CacheExceptions(message: 'Value must be a string');
      }
      await _secureStorage.write(key: key, value: value);
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while saving data to secure storage : $e',
      );
    }
  }

  @override
  Future<String?> getData({required String key}) async {
    try {
      final isKeyExist = await _secureStorage.containsKey(key: key);
      if (!isKeyExist) {
        getIt<Logger>()
            .i('The key (\"$key\") does not exist in secure storage');
        return null;
      }
      return await _secureStorage.read(key: key);
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while getting data from secure storage : $e',
      );
    }
  }

  @override
  Future<void> removeData({required String key}) async {
    try {
      await _secureStorage.delete(key: key);
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while removing data from secure storage : $e',
      );
    }
  }

  @override
  Future<void> clearData() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while clearing data from secure storage : $e',
      );
    }
  }
}
