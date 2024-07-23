class BranchModel {
  final String branchId;
  final String countryId;
  final String branchName;

  BranchModel({
    required this.branchId,
    required this.countryId,
    required this.branchName,
  });

  factory BranchModel.fromMap(Map<String, dynamic> json) {
    return BranchModel(
      branchId: json['branchId'].toString(),
      countryId: json['countryId'].toString(),
      branchName: json['branchName'],
    );
  }

  BranchModel copyWith({
    String? branchId,
    String? countryId,
    String? branchName,
  }) {
    return BranchModel(
      branchId: branchId ?? this.branchId,
      countryId: countryId ?? this.countryId,
      branchName: branchName ?? this.branchName,
    );
  }
}
