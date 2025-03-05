enum ClientSourceEnum {
  field,
  facebook,
  facebookwhats,
  google,
  twitter,
  site,
  unifiedNumber,
  whatsappControl,
  instagram,
  snapchat,
  googleMap,
  tikTok,
  recommendedClient,
  trialVersion,
  messengerDirect,
  whatsappSite,
  siteChat,
  googleWhats;

  // isFieldFromString
  static bool isFieldFromString(String? value) =>
      value == ClientSourceEnum.field.value;

  static ClientSourceEnum fromString(String? value) {
    switch (value) {
      case 'ميداني':
        return ClientSourceEnum.field;
      case 'فيسبوك':
        return ClientSourceEnum.facebook;
      case 'فيسبوك واتس':
        return ClientSourceEnum.facebookwhats;
      case 'غوغل':
        return ClientSourceEnum.google;
      case 'تويتر':
        return ClientSourceEnum.twitter;
      case 'الموقع':
        return ClientSourceEnum.site;
      case 'الرقم الموحد':
        return ClientSourceEnum.unifiedNumber;
      case 'واتس كنترول':
        return ClientSourceEnum.whatsappControl;
      case 'انستغرام':
        return ClientSourceEnum.instagram;
      case 'سناب':
        return ClientSourceEnum.snapchat;
      case 'غوغل ماب':
        return ClientSourceEnum.googleMap;
      case 'تيك توك':
        return ClientSourceEnum.tikTok;
      case 'عميل موصى به':
        return ClientSourceEnum.recommendedClient;
      case 'نسخة تجريبية':
        return ClientSourceEnum.trialVersion;
      case 'ماسنجر دايركت':
        return ClientSourceEnum.messengerDirect;
      case 'واتس الموقع':
        return ClientSourceEnum.whatsappSite;
      case 'شات الموقع':
        return ClientSourceEnum.siteChat;
      case 'واتس غوغل':
        return ClientSourceEnum.googleWhats;
      default:
        return ClientSourceEnum.field;
    }
  }
}

extension ClientSourceEnumExtension on ClientSourceEnum {
  String get value {
    switch (this) {
      case ClientSourceEnum.field:
        return 'ميداني';
      case ClientSourceEnum.facebook:
        return 'فيسبوك';
      case ClientSourceEnum.facebookwhats:
        return 'فيسبوك واتس';
      case ClientSourceEnum.google:
        return 'غوغل';
      case ClientSourceEnum.twitter:
        return 'تويتر';
      case ClientSourceEnum.site:
        return 'الموقع';
      case ClientSourceEnum.unifiedNumber:
        return 'الرقم الموحد';
      case ClientSourceEnum.whatsappControl:
        return 'واتس كنترول';
      case ClientSourceEnum.instagram:
        return 'انستغرام';
      case ClientSourceEnum.snapchat:
        return 'سناب';
      case ClientSourceEnum.googleMap:
        return 'غوغل ماب';
      case ClientSourceEnum.tikTok:
        return 'تيك توك';
      case ClientSourceEnum.recommendedClient:
        return 'عميل موصى به';
      case ClientSourceEnum.trialVersion:
        return 'نسخة تجريبية';
      case ClientSourceEnum.messengerDirect:
        return 'ماسنجر دايركت';
      case ClientSourceEnum.whatsappSite:
        return 'واتس الموقع';
      case ClientSourceEnum.siteChat:
        return 'شات الموقع';
      case ClientSourceEnum.googleWhats:
        return 'واتس غوغل';
    }
  }

  bool get isField => this == ClientSourceEnum.field;

  bool get isRecommendedClient => this == ClientSourceEnum.recommendedClient;
}
