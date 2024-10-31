import 'package:flutter/material.dart';

enum AppMode { production, development }

extension AppModeExtension on AppMode {
  bool get isProduction => this == AppMode.production;

  bool get isDevelopment => this == AppMode.development;
}

enum StateStatus { initial, loading, success, failure, empty }

extension StateStatusExtension on StateStatus {
  bool get isLoading => this == StateStatus.loading;

  bool get isFailed => this == StateStatus.failure;

  bool get isSuccess => this == StateStatus.success;

  bool get isEmpty => this == StateStatus.empty;
}

enum ADType { distributor, agent }

extension ADTypeExtension on ADType {
  String get name {
    switch (this) {
      case ADType.distributor:
        return 'موزع';
      case ADType.agent:
        return 'وكيل';
    }
  }
}

enum DateTimeEnum { date, time, both }

extension DateTimeEnumExtension on DateTimeEnum {
  String get name {
    switch (this) {
      case DateTimeEnum.date:
        return 'التاريخ';
      case DateTimeEnum.time:
        return 'الوقت';
      case DateTimeEnum.both:
        return 'الوقت والتاريخ';
    }
  }
}

enum VisitsStatusEnum { unfinished, finished, canceled, scheduled }

enum YesNoEnum { yes, no }

extension YesNoEnumExtension on YesNoEnum {
  String get name {
    switch (this) {
      case YesNoEnum.yes:
        return 'نعم';
      case YesNoEnum.no:
        return 'لا';
    }
  }
}

enum IsDoneDateEnum { notVisited, done, canceled, scheduled }

extension IsDoneDateEnumExtension on IsDoneDateEnum {
  String get name {
    switch (this) {
      case IsDoneDateEnum.notVisited:
        return 'لم يتم الزيارة';
      case IsDoneDateEnum.done:
        return 'تمت الزيارة';
      case IsDoneDateEnum.canceled:
        return 'تم الالغاء';
      case IsDoneDateEnum.scheduled:
        return 'مجدولة';
    }
  }

  String get value {
    switch (this) {
      case IsDoneDateEnum.notVisited:
        return '0';
      case IsDoneDateEnum.done:
        return '1';
      case IsDoneDateEnum.canceled:
        return '2';
      case IsDoneDateEnum.scheduled:
        return '3';
    }
  }

  // return enum by value
  static IsDoneDateEnum fromValue(String value) {
    switch (value) {
      case '0':
        return IsDoneDateEnum.notVisited;
      case '1':
        return IsDoneDateEnum.done;
      case '2':
        return IsDoneDateEnum.canceled;
      case '3':
        return IsDoneDateEnum.scheduled;
      default:
        return IsDoneDateEnum.notVisited;
    }
  }

  static color({
    String? isDone,
    double opacity = 0.15,
  }) {
    switch (isDone) {
      case '1':
        return Colors.green.withOpacity(opacity);
      case '0':
        return Colors.indigo.withOpacity(opacity);
      case '2':
        return Colors.red.withOpacity(opacity);
      case '3':
        return Colors.amber.withOpacity(opacity);
      default:
        return Colors.grey.withOpacity(opacity);
    }
  }


}

enum ContactTypeEnum {
  mobile,
  email,
}

extension ContactTypeExt on ContactTypeEnum {
  String get type {
    switch (this) {
      case ContactTypeEnum.mobile:
        return 'mobile';
      case ContactTypeEnum.email:
        return 'email';
    }
  }


  bool isValidValue(String value) {
    switch (this) {
      case ContactTypeEnum.mobile:
        return RegExp(r'^\d{10,}$').hasMatch(value);
      case ContactTypeEnum.email:
        return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    }
  }

  String get displayNameAr {
    switch (this) {
      case ContactTypeEnum.mobile:
        return 'رقم الجوال';
      case ContactTypeEnum.email:
        return 'البريد الإلكتروني';
    }
  }

}

// ... existing enums ...

enum ContactTypeRoleEnum {
  owner,
  accountant,
  financialManager,
  employee,
}

extension ContactTypeRoleEnumExtension on ContactTypeRoleEnum {
  String get name {
    switch (this) {
      case ContactTypeRoleEnum.owner:
        return 'مالك';
      case ContactTypeRoleEnum.accountant:
        return 'محاسب';
      case ContactTypeRoleEnum.financialManager:
        return 'مدير مالي';
      case ContactTypeRoleEnum.employee:
        return 'موظف';
    }
  }
  Color get color {
    switch (this) {
      case ContactTypeRoleEnum.owner:
        return Colors.blue.withOpacity(0.7);
      case ContactTypeRoleEnum.accountant:
        return Colors.green.withOpacity(0.7);
      case ContactTypeRoleEnum.financialManager:
        return Colors.purple.withOpacity(0.7);
      case ContactTypeRoleEnum.employee:
        return Colors.orange.withOpacity(0.7);
    }
  }
  static ContactTypeRoleEnum fromValue(String value) {
    switch (value) {
      case 'مالك':
        return ContactTypeRoleEnum.owner;
      case 'محاسب':
        return ContactTypeRoleEnum.accountant;
      case 'مدير مالي':
        return ContactTypeRoleEnum.financialManager;
      case 'موظف':
        return ContactTypeRoleEnum.employee;
      default:
        return ContactTypeRoleEnum.employee; // default value
    }
  }

  static List<ContactTypeRoleEnum> get values => [
    ContactTypeRoleEnum.owner,
    ContactTypeRoleEnum.accountant,
    ContactTypeRoleEnum.financialManager,
    ContactTypeRoleEnum.employee,
  ];
}