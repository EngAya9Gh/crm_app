import 'package:crm_smart/core/common/helpers/input_validator.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart' as PH;

import '../../errors/permissions_exceptions.dart';

@lazySingleton
class LocationServices {
  final Location location;

  LocationServices(this.location);

  Future<LocationData> getLocation() async {
    if (!(await _checkAndRequestLocationService())) {
      throw PermissionsExceptions(message: 'يجب تفعيل خدمة الموقع');
    }

    if (!(await _checkAndRequestLocationPermission())) {
      throw PermissionsExceptions(message: 'ليس لديك صلاحية للوصول للموقع');
    }

    return await location.getLocation();
  }

  Future<bool> _checkAndRequestLocationService() async {
    if (await location.serviceEnabled()) return true;
    return await location.requestService();
  }

  Future<bool> _checkAndRequestLocationPermission() async {
    PermissionStatus permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
    }

    if (permissionStatus == PermissionStatus.deniedForever) {
      await PH.openAppSettings();
    }

    if (permissionStatus != PermissionStatus.granted) {
      return false;
    }

    return true;
  }

  static bool isValidLatLang(String? latLang) {
    return InputValidator.validateLocation(latLang) == null;
  }
}
