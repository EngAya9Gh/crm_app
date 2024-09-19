import 'package:crm_smart/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

enum TicketTypesEnum {
  open,
  receive,
  close,
  suspend,
  rate,
  reopen;

  static TicketTypesEnum fromString(String? value) {
    if (value == null) {
      return TicketTypesEnum.open;
    }
    return TicketTypesEnum.values
        .firstWhere((e) => e.nameEn.toUpperCase() == value.toUpperCase());
  }
}

extension TicketTypeExtension on TicketTypesEnum {
  String get nameEn {
    switch (this) {
      case TicketTypesEnum.open:
        return 'open';
      case TicketTypesEnum.receive:
        return 'recive';
      case TicketTypesEnum.close:
        return 'close';
      case TicketTypesEnum.suspend:
        return 'suspend';
      case TicketTypesEnum.rate:
        return 'rate';
      case TicketTypesEnum.reopen:
        return 'reopen';
    }
  }

  static TicketTypesEnum getTicketType(String? name) {
    switch (name) {
      case 'open':
        return TicketTypesEnum.open;
      case 'recive':
        return TicketTypesEnum.receive;
      case 'close':
        return TicketTypesEnum.close;
      case 'suspend':
        return TicketTypesEnum.suspend;
      case 'rate':
        return TicketTypesEnum.rate;
      case 'reopen':
        return TicketTypesEnum.reopen;
      default:
        return TicketTypesEnum.open;
    }
  }

  String getUserTitle() {
    switch (this) {
      case TicketTypesEnum.open:
        return 'قام بفتح التذكرة';
      case TicketTypesEnum.receive:
        return 'قام باستلام التذكرة';
      case TicketTypesEnum.close:
        return 'قام بإغلاق التذكرة';
      case TicketTypesEnum.suspend:
        return 'قام بتعليق التذكرة';
      case TicketTypesEnum.rate:
        return 'قام بالتقييم';
      case TicketTypesEnum.reopen:
        return 'قام بإعادة فتح التذكرة';
      default:
        return '';
    }
  }

  String get nameAr {
    switch (this) {
      case TicketTypesEnum.open:
        return 'جديد';
      case TicketTypesEnum.receive:
        return 'مستلمة';
      case TicketTypesEnum.close:
        return 'غير مقيمة';
      case TicketTypesEnum.suspend:
        return 'معلقة';
      case TicketTypesEnum.rate:
        return 'تم التقييم';
      case TicketTypesEnum.reopen:
        return 'اعادة فتح';
    }
  }

  String get toParam {
    switch (this) {
      case TicketTypesEnum.open:
        return '1';
      case TicketTypesEnum.receive:
        return '2';
      case TicketTypesEnum.close:
        return '3';
      case TicketTypesEnum.suspend:
        return '4';
      case TicketTypesEnum.rate:
        return '5';
      case TicketTypesEnum.reopen:
        return '6';
    }
  }

  Color get color {
    switch (this) {
      case TicketTypesEnum.open:
        return AppColors.secondaryMain;
      case TicketTypesEnum.receive:
        return Colors.purple;
      case TicketTypesEnum.close:
        return Colors.orange;
      case TicketTypesEnum.suspend:
        return Colors.red;
      case TicketTypesEnum.rate:
        return Colors.green;
      case TicketTypesEnum.reopen:
        return AppColors.secondaryMain;
    }
  }
}
