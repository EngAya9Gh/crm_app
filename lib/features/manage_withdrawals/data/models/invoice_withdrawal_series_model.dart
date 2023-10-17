import 'dart:convert';

import '../../presentation/utils/withdrawal_status.dart';

List<InvoiceWithdrawalSeries> invoiceWithdrawalSeriesFromJson(String str) =>
    List<InvoiceWithdrawalSeries>.from(json.decode(str).map((x) => InvoiceWithdrawalSeries.fromJson(x)));

String invoiceWithdrawalSeriesToJson(List<InvoiceWithdrawalSeries> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceWithdrawalSeries {
  String? idApproveSeries;
  String? fkUser;
  String? fkInvoice;
  WithdrawalStatus isApprove;
  DateTime? dateApprove;
  String? priorityApprove;
  String? nameUser;

  InvoiceWithdrawalSeries({
    this.idApproveSeries,
    this.fkUser,
    this.fkInvoice,
    required this.isApprove,
    this.dateApprove,
    this.priorityApprove,
    this.nameUser,
  });

  factory InvoiceWithdrawalSeries.fromJson(Map<String, dynamic> json) => InvoiceWithdrawalSeries(
        idApproveSeries: json["idApprove_series"],
        fkUser: json["fk_user"],
        fkInvoice: json["fk_invoice"],
        isApprove: WithdrawalStatus.values.firstWhere((element) =>
            element.status ==
            (json["is_approve"].runtimeType == String ? int.tryParse(json["is_approve"]) : json["is_approve"])),
        dateApprove:json["date_approve"] != null ? DateTime.tryParse(json["date_approve"]) : null,
        priorityApprove: json["priority_approve"],
    nameUser: json["nameUser"],
      );

  Map<String, dynamic> toJson() => {
        "idApprove_series": idApproveSeries,
        "fk_user": fkUser,
        "fk_invoice": fkInvoice,
        "is_approve": isApprove.status,
        "date_approve": dateApprove?.toIso8601String(),
        "priority_approve": priorityApprove,
      };
}
