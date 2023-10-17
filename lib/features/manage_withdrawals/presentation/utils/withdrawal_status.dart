import 'dart:ui';

import 'package:flutter/material.dart';

enum WithdrawalStatus {
  pending,
  approved,
  declined,
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
    }
  }
}
