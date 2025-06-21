import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../errors/cache_exceptions.dart';
import '../di/di_container.dart';
import 'cache_services.dart';

@named
@Singleton(as: CacheServices)
class SecureStorageConsumer extends CacheServices {
  final FlutterSecureStorage _secureStorage;

  SecureStorageConsumer(this._secureStorage);

  static const String name = 'SecureStorageConsumer';

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
      
      // For macOS, if secure storage fails, fall back to SharedPreferences
      if (!kIsWeb && Platform.isMacOS) {
        try {
          await _secureStorage.write(key: key, value: value);
        } catch (e) {
          getIt<Logger>().w('Secure storage failed on macOS, using SharedPreferences: $e');
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('secure_$key', value);
        }
      } else {
        await _secureStorage.write(key: key, value: value);
      }
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
      // For macOS, try secure storage first, then fall back to SharedPreferences
      if (!kIsWeb && Platform.isMacOS) {
        try {
          final isKeyExist = await _secureStorage.containsKey(key: key);
          if (isKeyExist) {
            return await _secureStorage.read(key: key);
          }
        } catch (e) {
          getIt<Logger>().w('Secure storage read failed on macOS, trying SharedPreferences: $e');
        }
        
        // Fall back to SharedPreferences
        try {
          final prefs = await SharedPreferences.getInstance();
          return prefs.getString('secure_$key');
        } catch (e) {
          getIt<Logger>().e('SharedPreferences fallback failed: $e');
          return null;
        }
      } else {
        final isKeyExist = await _secureStorage.containsKey(key: key);
        if (!isKeyExist) {
          getIt<Logger>()
              .i('The key ("$key") does not exist in secure storage');
          return null;
        }
        return await _secureStorage.read(key: key);
      }
    } catch (e) {
      getIt<Logger>().e(e.toString());
      return null;
    }
  }

  @override
  Future<void> removeData({required String key}) async {
    try {
      if (!kIsWeb && Platform.isMacOS) {
        try {
          await _secureStorage.delete(key: key);
        } catch (e) {
          getIt<Logger>().w('Secure storage delete failed on macOS, trying SharedPreferences: $e');
        }
        
        // Also remove from SharedPreferences fallback
        try {
          final prefs = await SharedPreferences.getInstance();
          await prefs.remove('secure_$key');
        } catch (e) {
          getIt<Logger>().e('SharedPreferences remove failed: $e');
        }
      } else {
        await _secureStorage.delete(key: key);
      }
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
      if (!kIsWeb && Platform.isMacOS) {
        try {
          await _secureStorage.deleteAll();
        } catch (e) {
          getIt<Logger>().w('Secure storage clear failed on macOS, trying SharedPreferences: $e');
        }
        
        // Also clear SharedPreferences fallback
        try {
          final prefs = await SharedPreferences.getInstance();
          final keys = prefs.getKeys().where((key) => key.startsWith('secure_'));
          for (final key in keys) {
            await prefs.remove(key);
          }
        } catch (e) {
          getIt<Logger>().e('SharedPreferences clear failed: $e');
        }
      } else {
        await _secureStorage.deleteAll();
      }
    } catch (e) {
      getIt<Logger>().e(e.toString());
      throw CacheExceptions(
        message: 'Error while clearing data from secure storage : $e',
      );
    }
  }
}
