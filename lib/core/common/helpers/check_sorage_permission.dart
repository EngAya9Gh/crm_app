import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkStoragePermission() async {
  final PermissionStatus permissionStatus = await _handlePermissions();

  return await _isGranted(permissionStatus);
}

Future<PermissionStatus> _handlePermissions() async {
  if (Platform.isAndroid) {
    return await _androidPermission();
  }
  return await _iosPermission();
}

Future<PermissionStatus> _androidPermission() async {
  final deviceInfo = await DeviceInfoPlugin().androidInfo;

  if (deviceInfo.version.sdkInt > 32) {
    return await Permission.photos.request();
  }
  return await Permission.storage.request();
}

Future<PermissionStatus> _iosPermission() async {
  late PermissionStatus permissionStatus;
  permissionStatus = await Permission.storage.request();
  if (!permissionStatus.isGranted) {
    permissionStatus = await Permission.photos.request();
  }
  return permissionStatus;
}

Future<bool> _isGranted(PermissionStatus permissionStatus) async {
  if (permissionStatus.isDenied) {
    permissionStatus = await _handlePermissions();
  }
  if (permissionStatus.isGranted) return true;
  await openAppSettings();
  return false;
}
