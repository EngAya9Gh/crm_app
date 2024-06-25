import 'input_validator.dart';
import '../../utils/extensions/email_validation_ext.dart';
import 'package:intl/intl.dart';

import '../../utils/app_constants.dart';

class HelperFunctions {
  HelperFunctions._singleton();

  static HelperFunctions? _instance;

  factory HelperFunctions() {
    return instance;
  }

  static HelperFunctions get instance =>
      _instance ??= HelperFunctions._singleton();

  bool hasReachedMax<T>(List<T>? list) =>
      (list ?? []).length < AppConstants.kPerPage;

  String? emailFiledValidate(String? value) {
    final isFill = InputValidator.requiredFiled(value);

    if (isFill != null) {
      return isFill;
    }

    if (!value!.validateEmail) {
      return "من فضلك أدخل بريد الكتروني صحيح.";
    }

    return null;
  }

  List<T> intersection<T>(Iterable<Iterable<T>> iterables) {
    return iterables
        .map((e) => e.toSet())
        .reduce((a, b) => a.intersection(b))
        .toList();
  }

  static String? JsonStringNullHandler(dynamic value) {
    return value == null ? null : value.toString();
  }

  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  static int? assignNullInt({int? currentValue, int? newValue}) {
    if (newValue == -1) {
      return null;
    }
    if (newValue == null) {
      return currentValue;
    }
    return newValue;
  }

  static String? assignNullString({String? currentValue, String? newValue}) {
    if (newValue == '') {
      return null;
    }
    if (newValue == null) {
      return currentValue;
    }
    return newValue;
  }

  static String getCurrencyName(dynamic value) {
    value = int.tryParse(value.toString()) ?? 1;

    switch (value) {
      case 0:
        return ' USD ';
      case 1:
        return ' ريال ';
      default:
        return ' ريال ';
    }
  }
}
