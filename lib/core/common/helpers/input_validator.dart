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
  // دالة لاستخراج اسم المستخدم من رسالة الخطأ
 static String? extractUsernameFromError(String errorMessage) {
    try {
      // البحث عن النمط "user:username Bad"
      final regex = RegExp(r'user:([^\s]+)\s+Bad');
      final match = regex.firstMatch(errorMessage);
      if (match != null && match.groupCount >= 1) {
        return match.group(1);
      }
      return null;
    } catch (e) {
      print('Error extracting username: $e');
      return null;
    }
  }
  static String? validateEmail(String? value) {
    value = value?.trim();
    bool isValid() {
      String pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value!)) return false;
      return true;
    }

    final isFill = requiredFiled(value);

    if (isFill != null) return isFill;

    if (!isValid()) return "من فضلك أدخل بريد الكتروني صحيح.";

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
