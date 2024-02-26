import 'package:permission_handler/permission_handler.dart';

Future<bool> checkStoragePermission() async {
  PermissionStatus status = await Permission.storage.status;
  if (status.isGranted) {
    return true;
  } else if (status.isDenied) {
    PermissionStatus status = await Permission.storage.request();
    return status.isGranted;
  } else {
    openAppSettings();
    return false;
  }
}
