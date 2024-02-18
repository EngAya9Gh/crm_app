import 'package:crm_smart/ui/screen/agents_and_distributors/agents_and_distributors_action.dart';

import '../constants/constants.dart';

class HelperFunctions {
  HelperFunctions._singleton();

  static HelperFunctions? _instance;

  factory HelperFunctions() {
    return instance;
  }

  static HelperFunctions get instance =>
      _instance ??= HelperFunctions._singleton();

  bool hasReachedMax<T>(List<T>? list) => (list ?? []).length < kPerPage;

  String? requiredFiled(String? value) {
    if (value?.trim().isEmpty ?? true) {
      return "هذا الحقل مطلوب.";
    }
    return null;
  }

  String? emailFiledValidate(String? value) {
    final isFill = requiredFiled(value);

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
}
