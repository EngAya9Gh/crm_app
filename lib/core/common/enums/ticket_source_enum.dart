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
  String get name {
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
    if (value == TicketSourceEnums.periodicCall.name) {
      return TicketSourceEnums.periodicCall;
    } else if (value == TicketSourceEnums.qualityFirst.name) {
      return TicketSourceEnums.qualityFirst;
    } else if (value == TicketSourceEnums.qualitySecond.name) {
      return TicketSourceEnums.qualitySecond;
    } else if (value == TicketSourceEnums.unifiedNumber.name) {
      return TicketSourceEnums.unifiedNumber;
    } else if (value == TicketSourceEnums.directCall.name) {
      return TicketSourceEnums.directCall;
    } else if (value == TicketSourceEnums.whatsapp.name) {
      return TicketSourceEnums.whatsapp;
    } else if (value == TicketSourceEnums.facebook.name) {
      return TicketSourceEnums.facebook;
    } else if (value == TicketSourceEnums.twitter.name) {
      return TicketSourceEnums.twitter;
    } else if (value == TicketSourceEnums.youtube.name) {
      return TicketSourceEnums.youtube;
    } else if (value == TicketSourceEnums.instagram.name) {
      return TicketSourceEnums.instagram;
    } else if (value == TicketSourceEnums.tiktok.name) {
      return TicketSourceEnums.tiktok;
    }
    return null;
  }
}
