import 'dart:convert';

import '../../../../../core/common/enums/withdrawal_status_enum.dart';

List<InvoiceWithdrawalSeries> invoiceWithdrawalSeriesFromJson(String str) =>
    List<InvoiceWithdrawalSeries>.from(
        json.decode(str).map((x) => InvoiceWithdrawalSeries.fromJson(x)));

class InvoiceWithdrawalSeries {
  String? idApproveSeries;
  String? fkUser;
  String? fkInvoice;
  String? fkRequest;
  WithdrawalStatus withdrawalStatus;
  DateTime? dateApprove;
  String? priorityApprove;
  String? nameUser;
  String? notesApprove;

  InvoiceWithdrawalSeries({
    this.idApproveSeries,
    this.fkUser,
    this.fkInvoice,
    this.fkRequest,
    required this.withdrawalStatus,
    this.dateApprove,
    this.priorityApprove,
    this.nameUser,
    this.notesApprove,
  });

  factory InvoiceWithdrawalSeries.fromJson(Map<String, dynamic> json) =>
      InvoiceWithdrawalSeries(
        idApproveSeries: json["idApprove_series"],
        fkUser: json["fk_user"],
        fkInvoice: json["fk_invoice"],
        fkRequest: json["fk_request"],
        withdrawalStatus: WithdrawalStatus.values.firstWhere((element) =>
            element.status ==
            (json["is_approve"].runtimeType == String
                ? int.tryParse(json["is_approve"])
                : json["is_approve"])),
        dateApprove: json["date_approve"] != null
            ? DateTime.tryParse(json["date_approve"])
            : null,
        priorityApprove: json["priority_approve"],
        nameUser: json["nameUser"],
        notesApprove: json["notes_approve"],
      );

  InvoiceWithdrawalSeries copyWith({
    String? idApproveSeries,
    String? fkUser,
    String? fkInvoice,
    String? fkRequest,
    WithdrawalStatus? withdrawalStatus,
    DateTime? dateApprove,
    String? priorityApprove,
    String? nameUser,
  }) {
    return InvoiceWithdrawalSeries(
      idApproveSeries: idApproveSeries ?? this.idApproveSeries,
      fkUser: fkUser ?? this.fkUser,
      fkInvoice: fkInvoice ?? this.fkInvoice,
      withdrawalStatus: withdrawalStatus ?? this.withdrawalStatus,
      dateApprove: dateApprove ?? this.dateApprove,
      priorityApprove: priorityApprove ?? this.priorityApprove,
      nameUser: nameUser ?? this.nameUser,
      fkRequest: fkRequest ?? this.fkRequest,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InvoiceWithdrawalSeries &&
          runtimeType == other.runtimeType &&
          idApproveSeries == other.idApproveSeries &&
          fkUser == other.fkUser &&
          fkInvoice == other.fkInvoice &&
          withdrawalStatus == other.withdrawalStatus &&
          dateApprove == other.dateApprove &&
          priorityApprove == other.priorityApprove &&
          nameUser == other.nameUser &&
  fkRequest == other.fkRequest;

  @override
  int get hashCode =>
      idApproveSeries.hashCode ^
      fkUser.hashCode ^
      fkInvoice.hashCode ^
      withdrawalStatus.hashCode ^
      dateApprove.hashCode ^
      priorityApprove.hashCode ^
      fkRequest.hashCode ^
      nameUser.hashCode;
}
