// ميداني + , عميل موصى به
enum ClientSource {
  FIELD,
  RECOMMENDED_CLIENT;

  static bool isFieldFromString(String? value) => value == 'ميداني';
  static bool isRecommendedClientFromString(String? value) =>
      value == 'عميل موصى به';
}

extension SourceClientExtension on ClientSource {
  String get name {
    switch (this) {
      case ClientSource.FIELD:
        return 'ميداني';
      case ClientSource.RECOMMENDED_CLIENT:
        return 'عميل موصى به';
    }
  }

  bool get isField => this == ClientSource.FIELD;

  bool get isRecommendedClient => this == ClientSource.RECOMMENDED_CLIENT;
}
