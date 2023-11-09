import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'reject_reason.freezed.dart';
part 'reject_reason.g.dart';

RejectReason rejectReasonFromJson(String str) => RejectReason.fromJson(json.decode(str));

String rejectReasonToJson(RejectReason data) => json.encode(data.toJson());

@freezed
class RejectReason with _$RejectReason {
  const factory RejectReason({
    @JsonKey(name: "id_rejectClient")
    String? idRejectClient,
    @JsonKey(name: "NameReason_reject")
    String? nameReasonReject,
  }) = _RejectReason;

  factory RejectReason.fromJson(Map<String, dynamic> json) => _$RejectReasonFromJson(json);
}
