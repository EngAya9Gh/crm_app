class InputValidator {
  static String? requiredFiled(dynamic value) {
    if (value == null) {
      return "هذا الحقل مطلوب.";
    }
    if (value is String) {
      if (value.trim().isEmpty) {
        return "هذا الحقل مطلوب.";
      }
    }
    return null;
  }

  static String? validateLocation(String? value) {
    final List<String> latLangList = value?.split(',') ?? [];
    if (latLangList.length != 2) {
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

    if (latitude == 0) {
      return 'من فضلك ادخل قيمة دائرة العرض';
    }

    if (longitude == 0) {
      return 'من فضلك ادخل قيمة خط الطول';
    }

    return null;
  }
}
