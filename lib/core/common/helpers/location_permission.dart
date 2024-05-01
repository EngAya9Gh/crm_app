import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart'
    as permission_handler;

class LocationService {
  static Future<bool> checkLocationService(BuildContext context) async {
    final Location location = Location();
    bool serviceEnabled = await location.serviceEnabled();

    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        AppConstants.showSnakeBar(context, 'يجب تفعيل خدمة الموقع');
        return false;
      }
    }

    return true;
  }

  static Future<bool> checkLocationPermission(BuildContext context) async {
    final bool serviceEnabled = await checkLocationService(context);
    if (!serviceEnabled) return false;

    final Location location = Location();
    PermissionStatus permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        AppConstants.showSnakeBar(context, 'ليس لديك صلاحية للوصول للموقع');
        return false;
      }
    }

    if (permissionGranted == PermissionStatus.deniedForever) {
      permission_handler.openAppSettings();
      return false;
    }

    return true;
  }

  static Future<LocationData?> getLocation(BuildContext context) async {
    final bool hasLocationPermission = await checkLocationPermission(context);
    if (!hasLocationPermission) return null;

    final Location location = Location();
    return await location.getLocation();
  }
}
