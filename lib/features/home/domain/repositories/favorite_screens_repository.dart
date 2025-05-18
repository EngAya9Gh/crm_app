import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/favorite_screen_model.dart';

abstract class FavoriteScreensRepository {
  Future<List<FavoriteScreenModel>> getFavoriteScreens();
  Future<bool> saveFavoriteScreens(List<FavoriteScreenModel> screens);
  Future<bool> addFavoriteScreen(FavoriteScreenModel screen);
  Future<bool> removeFavoriteScreen(String screenId);
}

@LazySingleton(as: FavoriteScreensRepository)
class FavoriteScreensRepositoryImpl implements FavoriteScreensRepository {
  final SharedPreferences _prefs;
  static const String _favoriteScreensKey = 'favorite_screens';

  FavoriteScreensRepositoryImpl(this._prefs);

  @override
  Future<List<FavoriteScreenModel>> getFavoriteScreens() async {
    final jsonString = _prefs.getString(_favoriteScreensKey);

    if (jsonString == null) {
      return [];
    }

    try {
      final jsonList = jsonDecode(jsonString) as List;
      return jsonList
          .map((item) =>
              FavoriteScreenModel.fromJson(item as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error loading favorite screens: $e');
      return [];
    }
  }

  @override
  Future<bool> saveFavoriteScreens(List<FavoriteScreenModel> screens) async {
    final jsonList = screens.map((screen) => screen.toJson()).toList();
    final jsonString = jsonEncode(jsonList);

    return await _prefs.setString(_favoriteScreensKey, jsonString);
  }

  @override
  Future<bool> addFavoriteScreen(FavoriteScreenModel screen) async {
    final screens = await getFavoriteScreens();

    // Check if screen already exists
    if (screens.any((s) => s.id == screen.id)) {
      return true; // Screen already exists, consider it a success
    }

    screens.add(screen);
    return saveFavoriteScreens(screens);
  }

  @override
  Future<bool> removeFavoriteScreen(String screenId) async {
    final screens = await getFavoriteScreens();

    // Remove the screen with matching ID
    screens.removeWhere((screen) => screen.id == screenId);

    // Save the updated list
    return saveFavoriteScreens(screens);
  }
}
