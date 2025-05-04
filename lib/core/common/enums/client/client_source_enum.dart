import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/app_colors.dart';

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

  static IconData getSourceIcon(String? source) {
    if (source == null) return Icons.person;

    final clientSource = ClientSourceEnum.fromString(source);
    switch (clientSource) {
      case ClientSourceEnum.facebook:
      case ClientSourceEnum.facebookwhats:
        return Icons.facebook;
      case ClientSourceEnum.google:
      case ClientSourceEnum.googleMap:
      case ClientSourceEnum.googleWhats:
        return Icons.g_mobiledata;
      case ClientSourceEnum.twitter:
        return Icons.flutter_dash;
      case ClientSourceEnum.instagram:
        return FontAwesomeIcons.instagram;
      case ClientSourceEnum.snapchat:
        return FontAwesomeIcons.snapchat;
      case ClientSourceEnum.tikTok:
        return Icons.music_note;
      case ClientSourceEnum.whatsappControl:
      case ClientSourceEnum.whatsappSite:
        return FontAwesomeIcons.whatsapp;
      case ClientSourceEnum.messengerDirect:
        return Icons.message;
      case ClientSourceEnum.site:
      case ClientSourceEnum.siteChat:
        return Icons.language;
      case ClientSourceEnum.unifiedNumber:
        return Icons.phone;
      case ClientSourceEnum.recommendedClient:
        return Icons.star;
      case ClientSourceEnum.trialVersion:
        return FontAwesomeIcons.solidFaceSmileBeam;
      case ClientSourceEnum.field:
      default:
        return Icons.person;
    }
  }

  static Color getSourceColor(String? source) {
    if (source == null) return AppColors.primaryMain;

    final clientSource = ClientSourceEnum.fromString(source);
    switch (clientSource) {
      case ClientSourceEnum.facebook:
      case ClientSourceEnum.facebookwhats:
        return const Color(0xFF1877F2); // Facebook blue
      case ClientSourceEnum.google:
      case ClientSourceEnum.googleMap:
      case ClientSourceEnum.googleWhats:
        return const Color(0xFFDB4437); // Google red
      case ClientSourceEnum.twitter:
        return const Color(0xFF1DA1F2); // Twitter blue
      case ClientSourceEnum.instagram:
        return const Color(0xFFE4405F); // Instagram pink
      case ClientSourceEnum.snapchat:
        return const Color(0xFFFFFC00); // Snapchat yellow
      case ClientSourceEnum.tikTok:
        return Colors.black;
      case ClientSourceEnum.whatsappControl:
      case ClientSourceEnum.whatsappSite:
        return const Color(0xFF25D366); // WhatsApp green
      case ClientSourceEnum.messengerDirect:
        return const Color(0xFF00B2FF); // Messenger blue
      case ClientSourceEnum.site:
      case ClientSourceEnum.siteChat:
        return AppColors.primaryMain;
      case ClientSourceEnum.unifiedNumber:
        return AppColors.secondaryMain;
      case ClientSourceEnum.recommendedClient:
        return AppColors.secondaryMain;
      case ClientSourceEnum.trialVersion:
        return AppColors.primaryAltLight;
      case ClientSourceEnum.field:
      default:
        return AppColors.primaryMain;
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
