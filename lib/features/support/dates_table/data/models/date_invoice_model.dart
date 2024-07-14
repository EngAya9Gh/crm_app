import 'package:equatable/equatable.dart';

import '../../../../../core/common/enums/enums.dart';

class DateInvoiceModel extends Equatable {
  final int idInvoice;
  final String addressInvoice;
  final String dateApprove;
  final String dateInstallDone;
  final String value; // id + date approve

  const DateInvoiceModel({
    required this.idInvoice,
    required this.addressInvoice,
    required this.dateApprove,
    required this.dateInstallDone,
    required this.value,
  });

  factory DateInvoiceModel.fromMap(Map<String, dynamic> map) {
    return DateInvoiceModel(
      idInvoice: map['id_invoice'],
      addressInvoice: map['address_invoice'],
      dateApprove: map['date_approve'],
      dateInstallDone:
          map['dateinstall_done'] ?? IsDoneDateEnum.notVisited.value,
      value: "#${map['id_invoice']} - ${map['date_approve']}",
    );
  }

  @override
  List<Object?> get props {
    return [
      idInvoice,
      addressInvoice,
      dateApprove,
      dateInstallDone,
      value,
    ];
  }
}
