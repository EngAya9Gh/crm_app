import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

Future<bool> checkStoragePermission() async {
  late PermissionStatus permissionStatus;

  final deviceInfo = await DeviceInfoPlugin().androidInfo;

  if (deviceInfo.version.sdkInt > 32) {
    permissionStatus = await Permission.photos.request();
  } else {
    permissionStatus = await Permission.storage.request();
  }

  if (permissionStatus.isGranted) {
    return true;
  } else if (permissionStatus.isDenied) {
    PermissionStatus status = await Permission.storage.request();
    return status.isGranted;
  } else {
    openAppSettings();
    return false;
  }
}
