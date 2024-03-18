enum TicketSourceEnums {
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
  tiktok,
}

extension TicketSourceEnumsExtension on TicketSourceEnums {
  String get text {
    switch (this) {
      case TicketSourceEnums.periodicCall:
        return 'اتصال دوري';
      case TicketSourceEnums.qualityFirst:
        return 'جودة أول';
      case TicketSourceEnums.qualitySecond:
        return 'جودة ثاني';
      case TicketSourceEnums.unifiedNumber:
        return 'رقم موحد';
      case TicketSourceEnums.directCall:
        return 'اتصال مباشر';
      case TicketSourceEnums.whatsapp:
        return 'وتسأب';
      case TicketSourceEnums.facebook:
        return 'فيسبوك';
      case TicketSourceEnums.twitter:
        return 'تويتر';
      case TicketSourceEnums.youtube:
        return 'يوتيوب';
      case TicketSourceEnums.instagram:
        return 'انستغرام';
      case TicketSourceEnums.tiktok:
        return 'تيك توك';
    }
  }

  static TicketSourceEnums? fromString(String? value) {
    if (value == TicketSourceEnums.periodicCall.text) {
      return TicketSourceEnums.periodicCall;
    } else if (value == TicketSourceEnums.qualityFirst.text) {
      return TicketSourceEnums.qualityFirst;
    } else if (value == TicketSourceEnums.qualitySecond.text) {
      return TicketSourceEnums.qualitySecond;
    } else if (value == TicketSourceEnums.unifiedNumber.text) {
      return TicketSourceEnums.unifiedNumber;
    } else if (value == TicketSourceEnums.directCall.text) {
      return TicketSourceEnums.directCall;
    } else if (value == TicketSourceEnums.whatsapp.text) {
      return TicketSourceEnums.whatsapp;
    } else if (value == TicketSourceEnums.facebook.text) {
      return TicketSourceEnums.facebook;
    } else if (value == TicketSourceEnums.twitter.text) {
      return TicketSourceEnums.twitter;
    } else if (value == TicketSourceEnums.youtube.text) {
      return TicketSourceEnums.youtube;
    } else if (value == TicketSourceEnums.instagram.text) {
      return TicketSourceEnums.instagram;
    } else if (value == TicketSourceEnums.tiktok.text) {
      return TicketSourceEnums.tiktok;
    }
    return null;
  }
}
