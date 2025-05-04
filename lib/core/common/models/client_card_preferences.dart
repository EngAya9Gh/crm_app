import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClientCardPreferences {
  static const String _showNameUserKey = 'show_name_user';
  static const String _showTypeClientKey = 'show_type_client';
  static const String _showTypeRecordKey = 'show_type_record';
  static const String _showMobileKey = 'show_mobile';
  static const String _nameUserColorKey = 'name_user_color';
  static const String _typeClientColorKey = 'type_client_color';
  static const String _typeRecordColorKey = 'type_record_color';
  static const String _mobileColorKey = 'mobile_color';

  bool showNameUser;
  bool showTypeClient;
  bool showTypeRecord;
  bool showMobile;
  Color nameUserColor;
  Color typeClientColor;
  Color typeRecordColor;
  Color mobileColor;

  ClientCardPreferences({
    this.showNameUser = true,
    this.showTypeClient = true,
    this.showTypeRecord = true,
    this.showMobile = true,
    this.nameUserColor = const Color(0xFFE3F2FD),
    this.typeClientColor = const Color(0xFFE8F5E9),
    this.typeRecordColor = const Color(0xFFFFF3E0),
    this.mobileColor = const Color(0xFFF3E5F5),
  });

  Future<void> save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_showNameUserKey, showNameUser);
    await prefs.setBool(_showTypeClientKey, showTypeClient);
    await prefs.setBool(_showTypeRecordKey, showTypeRecord);
    await prefs.setBool(_showMobileKey, showMobile);
    await prefs.setInt(_nameUserColorKey, nameUserColor.value);
    await prefs.setInt(_typeClientColorKey, typeClientColor.value);
    await prefs.setInt(_typeRecordColorKey, typeRecordColor.value);
    await prefs.setInt(_mobileColorKey, mobileColor.value);
  }

  static Future<ClientCardPreferences> load() async {
    final prefs = await SharedPreferences.getInstance();
    return ClientCardPreferences(
      showNameUser: prefs.getBool(_showNameUserKey) ?? true,
      showTypeClient: prefs.getBool(_showTypeClientKey) ?? true,
      showTypeRecord: prefs.getBool(_showTypeRecordKey) ?? true,
      showMobile: prefs.getBool(_showMobileKey) ?? true,
      nameUserColor: Color(
          prefs.getInt(_nameUserColorKey) ?? const  Color(0xFF00BCD4).value),
      typeClientColor: Color(
          prefs.getInt(_typeClientColorKey) ?? const Color(0xFFFFE078).value),
      typeRecordColor: Color(
          prefs.getInt(_typeRecordColorKey) ?? const Color(0xFFF44336).value),
      mobileColor:
          Color(prefs.getInt(_mobileColorKey) ?? const Color(0xff536485).value),
    );
  }
}
