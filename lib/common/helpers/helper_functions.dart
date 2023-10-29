import '../constants/constants.dart';

class HelperFunctions {
  HelperFunctions._singleton();

  static HelperFunctions? _instance;

  factory HelperFunctions() {
    return instance;
  }

  static HelperFunctions get instance => _instance ??= HelperFunctions._singleton();

  bool hasReachedMax<T>(List<T>? list) => (list ?? []).length < kPerPage;
}
