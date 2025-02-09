enum PrivilegeTypeEnum {
  sales,
  manage,
  care,
  support,
  market,
  other,
  notify,
  report,
  tasks,
  finance,
  user;

  static PrivilegeTypeEnum fromString(String? value) {
    if (value == PrivilegeTypeEnum.sales.name) {
      return PrivilegeTypeEnum.sales;
    } else if (value == PrivilegeTypeEnum.manage.name) {
      return PrivilegeTypeEnum.manage;
    } else if (value == PrivilegeTypeEnum.care.name) {
      return PrivilegeTypeEnum.care;
    } else if (value == PrivilegeTypeEnum.support.name) {
      return PrivilegeTypeEnum.support;
    } else if (value == PrivilegeTypeEnum.market.name) {
      return PrivilegeTypeEnum.market;
    } else if (value == PrivilegeTypeEnum.notify.name) {
      return PrivilegeTypeEnum.notify;
    } else if (value == PrivilegeTypeEnum.report.name) {
      return PrivilegeTypeEnum.report;
    } else if (value == PrivilegeTypeEnum.tasks.name) {
      return PrivilegeTypeEnum.tasks;
    } else if (value == PrivilegeTypeEnum.user.name) {
      return PrivilegeTypeEnum.user;
    } else if (value == PrivilegeTypeEnum.finance.name) {
      return PrivilegeTypeEnum.finance;
    } else if (value == PrivilegeTypeEnum.other.name) {
      return PrivilegeTypeEnum.other;
    } else {
      return PrivilegeTypeEnum.other;
    }
  }
}

extension PrivilegeTypeExtension on PrivilegeTypeEnum {
  String get name {
    switch (this) {
      case PrivilegeTypeEnum.sales:
        return 'sales';
      case PrivilegeTypeEnum.manage:
        return 'manage';
      case PrivilegeTypeEnum.care:
        return 'care';
      case PrivilegeTypeEnum.support:
        return 'support';
      case PrivilegeTypeEnum.market:
        return 'market';
      case PrivilegeTypeEnum.other:
        return 'other';
      case PrivilegeTypeEnum.notify:
        return 'notify';
      case PrivilegeTypeEnum.report:
        return 'report';
      case PrivilegeTypeEnum.tasks:
        return 'tasks';
      case PrivilegeTypeEnum.user:
        return 'user';
      case PrivilegeTypeEnum.finance:
        return 'finance';
    }
  }

  String get value {
    switch (this) {
      case PrivilegeTypeEnum.sales:
        return 'المبيعات';
      case PrivilegeTypeEnum.manage:
        return 'الإدارة';
      case PrivilegeTypeEnum.care:
        return 'العناية بالعملاء';
      case PrivilegeTypeEnum.support:
        return 'الدعم الفني';
      case PrivilegeTypeEnum.market:
        return 'التسويق الالكتروني';
      case PrivilegeTypeEnum.other:
        return 'آخرى';
      case PrivilegeTypeEnum.notify:
        return 'الإشعارات';
      case PrivilegeTypeEnum.report:
        return 'التقارير';
      case PrivilegeTypeEnum.tasks:
        return 'إدارة المهام';
      case PrivilegeTypeEnum.user:
        return 'إدارة المستخدمين';
      case PrivilegeTypeEnum.finance:
        return 'إدارة المالية';
    }
  }
}
