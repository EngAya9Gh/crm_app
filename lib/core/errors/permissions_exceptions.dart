import 'base_app_exception.dart';

class PermissionsExceptions extends BaseAppException {
  PermissionsExceptions({required super.message});

  factory PermissionsExceptions.fromString(String message) {
    return PermissionsExceptions(message: message);
  }
}
