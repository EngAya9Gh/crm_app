import 'package:flutter/material.dart';
import '../../../../../../core/common/models/client_card_preferences.dart';

class ClientCardPreferencesProvider extends ChangeNotifier {
  late ClientCardPreferences _preferences;
  bool _isLoading = true;

  bool get isLoading => _isLoading;
  ClientCardPreferences get preferences => _preferences;

  ClientCardPreferencesProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _preferences = await ClientCardPreferences.load();
    _isLoading = false;
    notifyListeners();
  }

  Future<void> updatePreferences({
    bool? showNameUser,
    bool? showTypeClient,
    bool? showTypeRecord,
    bool? showMobile,
    Color? nameUserColor,
    Color? typeClientColor,
    Color? typeRecordColor,
    Color? mobileColor,
  }) async {
    _preferences = ClientCardPreferences(
      showNameUser: showNameUser ?? _preferences.showNameUser,
      showTypeClient: showTypeClient ?? _preferences.showTypeClient,
      showTypeRecord: showTypeRecord ?? _preferences.showTypeRecord,
      showMobile: showMobile ?? _preferences.showMobile,
      nameUserColor: nameUserColor ?? _preferences.nameUserColor,
      typeClientColor: typeClientColor ?? _preferences.typeClientColor,
      typeRecordColor: typeRecordColor ?? _preferences.typeRecordColor,
      mobileColor: mobileColor ?? _preferences.mobileColor,
    );
    await _preferences.save();
    notifyListeners();
  }
}
