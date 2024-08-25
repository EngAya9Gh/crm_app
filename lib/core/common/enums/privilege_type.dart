enum PrivilegeType {
  sales,
  manage,
  care,
  support,
  market,
  other,
  notify,
  report,
  tasks,
  user;

  static PrivilegeType fromString(String? value) {
    if (value == PrivilegeType.sales.name) {
      return PrivilegeType.sales;
    } else if (value == PrivilegeType.manage.name) {
      return PrivilegeType.manage;
    } else if (value == PrivilegeType.care.name) {
      return PrivilegeType.care;
    } else if (value == PrivilegeType.support.name) {
      return PrivilegeType.support;
    } else if (value == PrivilegeType.market.name) {
      return PrivilegeType.market;
    } else if (value == PrivilegeType.notify.name) {
      return PrivilegeType.notify;
    } else if (value == PrivilegeType.report.name) {
      return PrivilegeType.report;
    } else if (value == PrivilegeType.tasks.name) {
      return PrivilegeType.tasks;
    } else if (value == PrivilegeType.user.name) {
      return PrivilegeType.user;
    } else if (value == PrivilegeType.other.name) {
      return PrivilegeType.other;
    } else {
      return PrivilegeType.other;
    }
  }
}

extension PrivilegeTypeExtension on PrivilegeType {
  String get name {
    switch (this) {
      case PrivilegeType.sales:
        return 'sales';
      case PrivilegeType.manage:
        return 'manage';
      case PrivilegeType.care:
        return 'care';
      case PrivilegeType.support:
        return 'support';
      case PrivilegeType.market:
        return 'market';
      case PrivilegeType.other:
        return 'other';
      case PrivilegeType.notify:
        return 'notify';
      case PrivilegeType.report:
        return 'report';
      case PrivilegeType.tasks:
        return 'tasks';
      case PrivilegeType.user:
        return 'user';
    }
  }

  String get value {
    switch (this) {
      case PrivilegeType.sales:
        return 'المبيعات';
      case PrivilegeType.manage:
        return 'الإدارة';
      case PrivilegeType.care:
        return 'العناية بالعملاء';
      case PrivilegeType.support:
        return 'الدعم الفني';
      case PrivilegeType.market:
        return 'التسويق الالكتروني';
      case PrivilegeType.other:
        return 'آخرى';
      case PrivilegeType.notify:
        return 'الإشعارات';
      case PrivilegeType.report:
        return 'التقارير';
      case PrivilegeType.tasks:
        return 'إدارة المهام';
      case PrivilegeType.user:
        return 'إدارة المستخدمين';
    }
  }
}
