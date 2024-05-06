import 'package:crm_smart/core/services/maps/location_services.dart';

class InputValidator {
  static String? requiredFiled(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "هذا الحقل مطلوب.";
    }
    return null;
  }

  String? validateLocation(String? value) {
    if (!LocationServices.isValidLatLang(value)) {
      return 'يرجي اتباع الصيغة: (العرض,الطول)'
          '\nمثل: 21.4224779,39.8251832';
    }

    final latitude = double.tryParse(value?.split(',')[0] ?? '0') ?? 0;
    final longitude = double.tryParse(value?.split(',')[1] ?? '0') ?? 0;

    if (latitude < -90 || latitude > 90) {
      return 'العرض يجب ان يكون بين -90 و 90';
    }

    if (longitude < -180 || longitude > 180) {
      return 'الطول يجب ان يكون بين -180 و 180';
    }
    return null;
  }
}
