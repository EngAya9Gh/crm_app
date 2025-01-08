class BranchModel {
  final String branchId;
  final String countryId;
  final String branchName;
  final String? currency;
  final String? nameCountry;

  const BranchModel({
    required this.branchId,
    required this.countryId,
    required this.branchName,
    this.currency,
    this.nameCountry,
  });

  factory BranchModel.fromJson(Map<String, dynamic> json) {
    return BranchModel(
      branchId: json['branchId'].toString(),
      countryId: json['countryId'].toString(),
      branchName: json['branchName'],
      currency: json['currency'],
      nameCountry: json['nameCountry'],
    );
  }

  factory BranchModel.convertRegionToBranch(Map<String, dynamic> json) {
    return BranchModel(
      branchId: json['id_regoin'].toString(),
      countryId: json['fk_country'].toString(),
      branchName: json['name_regoin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'branchId': branchId,
      'countryId': countryId,
      'branchName': branchName,
      'currency': currency,
      'nameCountry': nameCountry,
    };
  }
}
