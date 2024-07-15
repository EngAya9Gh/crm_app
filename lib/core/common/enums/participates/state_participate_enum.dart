enum StateParticipateEnum {
  // تفاوض تعاقد عدم اهتمام
  Negotiation,
  Contract,
  NotInterested;

  // from string
  static StateParticipateEnum? fromString(String? value) {
    if (value == StateParticipateEnum.Negotiation.value) {
      return StateParticipateEnum.Negotiation;
    } else if (value == StateParticipateEnum.Contract.value) {
      return StateParticipateEnum.Contract;
    } else if (value == StateParticipateEnum.NotInterested.value) {
      return StateParticipateEnum.NotInterested;
    }
    return null;
  }
}

extension StateParticipateEnumExtension on StateParticipateEnum {
  String get value {
    switch (this) {
      case StateParticipateEnum.Negotiation:
        return 'تفاوض';
      case StateParticipateEnum.Contract:
        return 'تعاقد';
      case StateParticipateEnum.NotInterested:
        return 'عدم اهتمام';
    }
  }
}
