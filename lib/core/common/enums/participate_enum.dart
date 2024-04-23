enum ParticipateEnum {
  participate,
  notParticipate,
}

extension participateEnumExtension on ParticipateEnum {
  String get name {
    switch (this) {
      case ParticipateEnum.participate:
        return 'مشترك';
      case ParticipateEnum.notParticipate:
        return 'غير مشترك';

      default:
        return "غير مشترك";
    }
  }
}
