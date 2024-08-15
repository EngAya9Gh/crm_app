import 'package:flutter/material.dart';

enum WithdrawalStatus {
  pending,
  approved,
  declined,
  cancelled,
}

extension WithdrawalStatusExt on WithdrawalStatus {
  int? get status {
    switch (this) {
      case WithdrawalStatus.pending:
        return null;
      case WithdrawalStatus.approved:
        return 1;
      case WithdrawalStatus.declined:
        return 0;
      case WithdrawalStatus.cancelled:
        return 3;
    }
  }

  Color get color {
    switch (this) {
      case WithdrawalStatus.pending:
        return Colors.orange;
      case WithdrawalStatus.approved:
        return Colors.green;
      case WithdrawalStatus.declined:
        return Colors.red;
      case WithdrawalStatus.cancelled:
        return Colors.grey;
    }
  }

  String get text {
    switch (this) {
      case WithdrawalStatus.pending:
        return "معلقة";
      case WithdrawalStatus.approved:
        return "تمت الموافقة";
      case WithdrawalStatus.declined:
        return "مرفوضة";
      case WithdrawalStatus.cancelled:
        return "ملغية";
    }
  }

  bool get isDeclined => this == WithdrawalStatus.declined;

  bool get isPending => this == WithdrawalStatus.pending;

  bool get isApproved => this == WithdrawalStatus.approved;

  bool get isCancelled => this == WithdrawalStatus.cancelled;
}
