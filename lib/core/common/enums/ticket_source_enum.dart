enum TicketSourceEnum {
 
  productSystem,
  recommandSystem,
  supportSystem,
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
  location;

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
    } else if (value == TicketSourceEnum.location.value) {
      return TicketSourceEnum.location;
    } else if (value == TicketSourceEnum.productSystem.value) {
      return TicketSourceEnum.productSystem;
    } else if (value == TicketSourceEnum.supportSystem.value) {
      return TicketSourceEnum.supportSystem;
    }
    else if (value == TicketSourceEnum.recommandSystem.value) {
      return TicketSourceEnum.recommandSystem;
    }
    return null;
  }
  static String fromSystemRate(String? value) {
    if (value == TicketSourceEnum.productSystem.value) {
      return 'المنتج';
    } else if (value == TicketSourceEnum.supportSystem.value) {
      return 'خدمة الدعم';
    } else if (value == TicketSourceEnum.recommandSystem.value) {
      return 'توصية عميل';

    }
    return '';
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
      case TicketSourceEnum.location:
        return 'الموقع';
      case TicketSourceEnum.productSystem:
        return 'تقييم النظام';
      case TicketSourceEnum.supportSystem:
        return 'تقييم خدمة الدعم الفني';
        case TicketSourceEnum.recommandSystem:
        return 'توصية العميل';
    }
  }
}
