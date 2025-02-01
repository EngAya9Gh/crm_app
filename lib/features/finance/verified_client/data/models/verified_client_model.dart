
import 'package:crm_smart/core/common/models/client_model.dart';
class VerifiedClientModel {
  final ClientModel clientModel;
  final String? lastOperation;
  final String? userDidOperation;
  final DateTime? dateLastOperation;
  final int? verifiedState;

  VerifiedClientModel({
    required this.clientModel,
    this.lastOperation,
    this.userDidOperation,
    this.dateLastOperation,
    this.verifiedState,
  });

  VerifiedClientModel copyWith({
    ClientModel? clientModel,
    String? lastOperation,
    String? userDidOperation,
    DateTime? dateLastOperation,
    int? verifiedState,
  }) =>
      VerifiedClientModel(
        clientModel: clientModel??this.clientModel,
        lastOperation: lastOperation ?? this.lastOperation,
        userDidOperation: userDidOperation ?? this.userDidOperation,
        dateLastOperation: dateLastOperation ?? this.dateLastOperation,
        verifiedState: verifiedState ?? this.verifiedState,
      );

  factory VerifiedClientModel.fromJson(Map<String, dynamic> json) => VerifiedClientModel(
        clientModel: ClientModel.fromJson(json),
        lastOperation: json["last_operation"],
        userDidOperation: json["user_did_operation"],
        dateLastOperation: json["date_last_operation"] == null ? null : DateTime.parse(json["date_last_operation"]),
        verifiedState: json["verified_state"],
      );

  Map<String, dynamic> toJson() => {
        "last_operation": lastOperation,
        "user_did_operation": userDidOperation,
        "date_last_operation": dateLastOperation?.toIso8601String(),
        "verified_state": verifiedState,
      };
}
