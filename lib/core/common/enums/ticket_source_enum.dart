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
      case TicketSourceEnum.location:
        return 'الموقع';
    }
  }
}
//
// enum FilterTicketSourceEnum {
//   periodicCall,
//   qualityFirst,
//   qualitySecond,
//   unifiedNumber,
//   directCall,
//   whatsapp,
//   facebook,
//   twitter,
//   youtube,
//   instagram,
//   tiktok;
//
//   static FilterTicketSourceEnum? fromString(String? value) {
//     if (value == FilterTicketSourceEnum.periodicCall.value) {
//       return FilterTicketSourceEnum.periodicCall;
//     } else if (value == FilterTicketSourceEnum.qualityFirst.value) {
//       return FilterTicketSourceEnum.qualityFirst;
//     } else if (value == FilterTicketSourceEnum.qualitySecond.value) {
//       return FilterTicketSourceEnum.qualitySecond;
//     } else if (value == FilterTicketSourceEnum.unifiedNumber.value) {
//       return FilterTicketSourceEnum.unifiedNumber;
//     } else if (value == FilterTicketSourceEnum.directCall.value) {
//       return FilterTicketSourceEnum.directCall;
//     } else if (value == FilterTicketSourceEnum.whatsapp.value) {
//       return FilterTicketSourceEnum.whatsapp;
//     } else if (value == FilterTicketSourceEnum.facebook.value) {
//       return FilterTicketSourceEnum.facebook;
//     } else if (value == FilterTicketSourceEnum.twitter.value) {
//       return FilterTicketSourceEnum.twitter;
//     } else if (value == FilterTicketSourceEnum.youtube.value) {
//       return FilterTicketSourceEnum.youtube;
//     } else if (value == FilterTicketSourceEnum.instagram.value) {
//       return FilterTicketSourceEnum.instagram;
//     } else if (value == FilterTicketSourceEnum.tiktok.value) {
//       return FilterTicketSourceEnum.tiktok;
//     }
//     return null;
//   }
// }
//
// extension FilterTicketSourceEnumsExtension on FilterTicketSourceEnum {
//   String get value {
//     switch (this) {
//       case FilterTicketSourceEnum.periodicCall:
//         return 'اتصال دوري';
//       case FilterTicketSourceEnum.qualityFirst:
//         return 'جودة أول';
//       case FilterTicketSourceEnum.qualitySecond:
//         return 'جودة ثاني';
//       case FilterTicketSourceEnum.unifiedNumber:
//         return 'رقم موحد';
//       case FilterTicketSourceEnum.directCall:
//         return 'اتصال مباشر';
//       case FilterTicketSourceEnum.whatsapp:
//         return 'وتساب';
//       case FilterTicketSourceEnum.facebook:
//         return 'فيسبوك';
//       case FilterTicketSourceEnum.twitter:
//         return 'تويتر';
//       case FilterTicketSourceEnum.youtube:
//         return 'يوتيوب';
//       case FilterTicketSourceEnum.instagram:
//         return 'انستغرام';
//       case FilterTicketSourceEnum.tiktok:
//         return 'تيك توك';
//     }
//   }
// }
