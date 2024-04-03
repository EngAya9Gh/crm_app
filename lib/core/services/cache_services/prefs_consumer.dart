import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../errors/cache_exceptions.dart';
import '../di/di_container.dart';
import 'cache_services.dart';

@LazySingleton(as: CacheServices)
class PrefsConsumer extends CacheServices {
  final SharedPreferences _sharedPreferences;

  PrefsConsumer(this._sharedPreferences);

  @override
  Future<void> saveData({
    String? boxName,
    required String key,
    required dynamic value,
  }) async {
    try {
      getIt<Logger>().d('key is => $key');
      getIt<Logger>().d('value type is => ${value.runtimeType}');
      switch (value.runtimeType) {
        case String:
          await _sharedPreferences.setString(key, value);
          break;
        case int:
          await _sharedPreferences.setInt(key, value);
          break;
        case bool:
          await _sharedPreferences.setBool(key, value);
          break;
        case double:
          await _sharedPreferences.setDouble(key, value);
          break;
        case List:
          await _sharedPreferences.setStringList(key, value);
          break;
        default:
          getIt<Logger>().e('Unknown value type');
          throw CacheExceptions(message: 'Unknown value type');
      }
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while saving data to shared preferences : $e',
      );
    }
  }

  @override
  dynamic getData({required String key}) {
    try {
      if (!_sharedPreferences.containsKey(key)) {
        getIt<Logger>().d('Key not found, key is => $key');
        return null;
      }
      return _sharedPreferences.get(key);
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while getting data from shared preferences : $e',
      );
    }
  }

  @override
  Future<void> removeData({required String key}) async {
    try {
      if (!_sharedPreferences.containsKey(key)) {
        getIt<Logger>().d('Key not found, key is => $key');
        return;
      }
      await _sharedPreferences.remove(key);
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while removing data from shared preferences : $e',
      );
    }
  }

  @override
  Future<void> clearData() async {
    try {
      await _sharedPreferences.clear();
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while clearing data from shared preferences : $e',
      );
    }
  }
}
