enum ClientRegistrationType {
  correct,
  wrong,
  New;

  static bool isCorrectFromString(String? value) => value == 'صحيح';

  static bool isWrongFromString(String? value) => value == 'خاطئ';

  static bool isNewFromString(String? value) => value == 'جديد';
}

extension ClientRegistrationTypeExtension on ClientRegistrationType {
  String get value {
    switch (this) {
      case ClientRegistrationType.correct:
        return 'صحيح';
      case ClientRegistrationType.wrong:
        return 'خاطئ';
      case ClientRegistrationType.New:
        return 'جديد';
    }
  }

  bool get isCorrect => this == ClientRegistrationType.correct;

  bool get isWrong => this == ClientRegistrationType.wrong;
}
