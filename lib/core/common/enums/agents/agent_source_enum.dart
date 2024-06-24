enum AgentSourceEnum {
  socialMedia,
  linkedIn,
  google,
  website,
  recommendation;

  static AgentSourceEnum? fromString(String? value) {
    if (value == AgentSourceEnum.socialMedia.value) {
      return AgentSourceEnum.socialMedia;
    } else if (value == AgentSourceEnum.linkedIn.value) {
      return AgentSourceEnum.linkedIn;
    } else if (value == AgentSourceEnum.google.value) {
      return AgentSourceEnum.google;
    } else if (value == AgentSourceEnum.website.value) {
      return AgentSourceEnum.website;
    } else if (value == AgentSourceEnum.recommendation.value) {
      return AgentSourceEnum.recommendation;
    } else {
      return null;
    }
  }
}

extension AgentSourceEnumExtension on AgentSourceEnum {
  String get value {
    switch (this) {
      case AgentSourceEnum.socialMedia:
        return 'وسائل التواصل';
      case AgentSourceEnum.linkedIn:
        return 'لينكدان';
      case AgentSourceEnum.google:
        return 'بحث غوغل';
      case AgentSourceEnum.website:
        return 'الموقع';
      case AgentSourceEnum.recommendation:
        return 'موصي به';
    }
  }
}
