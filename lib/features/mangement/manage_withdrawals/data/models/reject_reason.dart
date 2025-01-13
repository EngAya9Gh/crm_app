// To parse this JSON data, do
//
//     final rejectReason = rejectReasonFromJson(jsonString);

import 'dart:convert';

RejectReason rejectReasonFromJson(String str) => RejectReason.fromJson(json.decode(str));

String rejectReasonToJson(RejectReason data) => json.encode(data.toJson());

class RejectReason {
  final int? idRejectClient;
  final String? nameReasonReject;

  RejectReason({
    this.idRejectClient,
    this.nameReasonReject,
  });

  RejectReason copyWith({
    int? idRejectClient,
    String? nameReasonReject,
  }) =>
      RejectReason(
        idRejectClient: idRejectClient ?? this.idRejectClient,
        nameReasonReject: nameReasonReject ?? this.nameReasonReject,
      );

  factory RejectReason.fromJson(Map<String, dynamic> json) => RejectReason(
    idRejectClient: json["id_rejectClient"],
    nameReasonReject: json["NameReason_reject"],
  );

  Map<String, dynamic> toJson() => {
    "id_rejectClient": idRejectClient,
    "NameReason_reject": nameReasonReject,
  };
}
