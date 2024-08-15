class CancelDateReasonModel {
  final String id;
  final String reason;

  const CancelDateReasonModel({
    required this.id,
    required this.reason,
  });

  factory CancelDateReasonModel.fromJson(json) {
    return CancelDateReasonModel(
      id: json['id'].toString(),
      reason: json['reason'],
    );
  }
}
