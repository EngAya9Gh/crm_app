
import 'package:intl/intl.dart';

class ElevationModel {
  final int? id;
  final int? clientId;
  final String? nameEnterprise;
  final String? serialNumber;
  final String? rateDate;
  final int? rateType;
  final int? rate;
  final String? question;
  final String? ratingReason;
  final String? message;
  final String? createdAt;
  final String? updatedAt;

  ElevationModel({
    this.id,
    this.clientId,
    this.nameEnterprise,
    this.serialNumber,
    this.rateDate,
    this.rateType,
    this.rate,
    this.question,
    this.ratingReason,
    this.message,
    this.createdAt,
    this.updatedAt,
  });

  ElevationModel copyWith({
    int? id,
    int? clientId,
    String? nameEnterprise,
    String? serialNumber,
    dynamic rateDate,
    int? rateType,
    int? rate,
    String? question,
    String? ratingReason,
    String? message,
    String? createdAt,
    String? updatedAt,
  }) =>
      ElevationModel(
        id: id ?? this.id,
        clientId: clientId ?? this.clientId,
        nameEnterprise: nameEnterprise ?? this.nameEnterprise,
        serialNumber: serialNumber ?? this.serialNumber,
        rateDate: rateDate ?? this.rateDate,
        rateType: rateType ?? this.rateType,
        rate: rate ?? this.rate,
        question: question ?? this.question,
        ratingReason: ratingReason ?? this.ratingReason,
        message: message ?? this.message,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory ElevationModel.fromJson(Map<String, dynamic> json) => ElevationModel(
    id: json["id"],
    clientId: json["client_id"],
    nameEnterprise: json["name_enterprise"],
    serialNumber: json["serial_number"],
    rateDate: json["rate_date"],
    rateType: json["rate_type"],
    rate: json["rate"],
    question: json["question"],
    ratingReason: json["rating_reason"],
    message: json["message"],
    createdAt: json["created_at"] == null ? null : DateFormat().format(DateTime.parse(json["created_at"])),
    updatedAt: json["updated_at"] == null ? null : DateFormat().format(DateTime.parse(json["updated_at"])),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "client_id": clientId,
    "name_enterprise": nameEnterprise,
    "serial_number": serialNumber,
    "rate_date": rateDate,
    "rate_type": rateType,
    "rate": rate,
    "question": question,
    "rating_reason": ratingReason,
    "message": message,
    if(createdAt?.isNotEmpty??false)"created_at": DateTime.parse(createdAt!).toIso8601String(),
    if(updatedAt?.isNotEmpty??false)"updated_at": DateTime.parse(updatedAt!).toIso8601String(),
  };
}
