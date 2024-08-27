enum UserTypeEnum {
  all,
  HigherManagement,
  SalesManagement,
  SupportManagement,
  CareManagement,
  FinanceManagement,
  AchievementManagement,
  ProcessesManagement,
  ProgrammingManagement,
  MarketingManagement,
}

extension UserTypeExt on UserTypeEnum {
  int get type {
    switch (this) {
      case UserTypeEnum.all:
        return 0;
      case UserTypeEnum.HigherManagement:
        return 1;
      case UserTypeEnum.SalesManagement:
        return 2;
      case UserTypeEnum.SupportManagement:
        return 3;
      case UserTypeEnum.CareManagement:
        return 4;
      case UserTypeEnum.FinanceManagement:
        return 5;
      case UserTypeEnum.AchievementManagement:
        return 6;
      case UserTypeEnum.ProcessesManagement:
        return 7;
      case UserTypeEnum.ProgrammingManagement:
        return 8;
      case UserTypeEnum.MarketingManagement:
        return 9;
    }
  }

  // to param
  String get toPath {
    switch (this) {
      case UserTypeEnum.all:
        return 'all';
      // case UserType.HigherManagement:
      //   return 'higher_management';
      case UserTypeEnum.SalesManagement:
        return 'sales_management';
      case UserTypeEnum.SupportManagement:
        return 'support';
      case UserTypeEnum.CareManagement:
        return 'care';
      // case UserType.FinanceManagement:
      //   return 'finance_management';
      // case UserType.AchievementManagement:
      //   return 'achievement_management';
      // case UserType.ProcessesManagement:
      //   return 'processes_management';
      // case UserType.ProgrammingManagement:
      //   return 'programming_management';
      // case UserType.MarketingManagement:
      //   return 'marketing_management';
      default:
        throw Exception('unknown type');
    }
  }
}
