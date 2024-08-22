enum TicketSourceEnum {
  periodicCall,
  qualityFirst,
  qualitySecond,
  unifiedNumber,
  directCall,
  whatsapp,
  facebook,
  twitter,
  youtube,
  instagram,
  tiktok;

  static TicketSourceEnum? fromString(String? value) {
    if (value == TicketSourceEnum.periodicCall.value) {
      return TicketSourceEnum.periodicCall;
    } else if (value == TicketSourceEnum.qualityFirst.value) {
      return TicketSourceEnum.qualityFirst;
    } else if (value == TicketSourceEnum.qualitySecond.value) {
      return TicketSourceEnum.qualitySecond;
    } else if (value == TicketSourceEnum.unifiedNumber.value) {
      return TicketSourceEnum.unifiedNumber;
    } else if (value == TicketSourceEnum.directCall.value) {
      return TicketSourceEnum.directCall;
    } else if (value == TicketSourceEnum.whatsapp.value) {
      return TicketSourceEnum.whatsapp;
    } else if (value == TicketSourceEnum.facebook.value) {
      return TicketSourceEnum.facebook;
    } else if (value == TicketSourceEnum.twitter.value) {
      return TicketSourceEnum.twitter;
    } else if (value == TicketSourceEnum.youtube.value) {
      return TicketSourceEnum.youtube;
    } else if (value == TicketSourceEnum.instagram.value) {
      return TicketSourceEnum.instagram;
    } else if (value == TicketSourceEnum.tiktok.value) {
      return TicketSourceEnum.tiktok;
    }
    return null;
  }
}

extension TicketSourceEnumsExtension on TicketSourceEnum {
  String get value {
    switch (this) {
      case TicketSourceEnum.periodicCall:
        return 'اتصال دوري';
      case TicketSourceEnum.qualityFirst:
        return 'جودة أول';
      case TicketSourceEnum.qualitySecond:
        return 'جودة ثاني';
      case TicketSourceEnum.unifiedNumber:
        return 'رقم موحد';
      case TicketSourceEnum.directCall:
        return 'اتصال مباشر';
      case TicketSourceEnum.whatsapp:
        return 'وتساب';
      case TicketSourceEnum.facebook:
        return 'فيسبوك';
      case TicketSourceEnum.twitter:
        return 'تويتر';
      case TicketSourceEnum.youtube:
        return 'يوتيوب';
      case TicketSourceEnum.instagram:
        return 'انستغرام';
      case TicketSourceEnum.tiktok:
        return 'تيك توك';
    }
  }
}
