enum ClientRegistrationType {
  correct,
  wrong;

  static bool isCorrectFromString(String? value) => value == 'صحيح';

  static bool isWrongFromString(String? value) => value == 'خاطئ';
}

extension ClientRegistrationTypeExtension on ClientRegistrationType {
  String get name {
    switch (this) {
      case ClientRegistrationType.correct:
        return 'صحيح';
      case ClientRegistrationType.wrong:
        return 'خاطئ';
    }
  }

  bool get isCorrect => this == ClientRegistrationType.correct;

  bool get isWrong => this == ClientRegistrationType.wrong;
}
