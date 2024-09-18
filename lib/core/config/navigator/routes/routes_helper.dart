abstract class RoutesHelper {
  static nullableExtra(Map? extra, String key) {
    return extra?.containsKey(key) == true ? extra![key] : null;
  }
}
