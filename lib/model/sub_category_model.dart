import 'package:equatable/equatable.dart';

class SubCategoryModel extends Equatable {
  final String id;
  final String subCategoryAr;
  final String subCategoryEn;
  final String classification;

  SubCategoryModel({
    required this.id,
    required this.subCategoryAr,
    required this.subCategoryEn,
    required this.classification,
  });

  SubCategoryModel copyWith({
    String? id,
    String? subCategoryAr,
    String? subCategoryEn,
    String? classification,
  }) {
    return SubCategoryModel(
      id: id ?? this.id,
      subCategoryAr: subCategoryAr ?? this.subCategoryAr,
      subCategoryEn: subCategoryEn ?? this.subCategoryEn,
      classification: classification ?? this.classification,
    );
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> json) {
    return SubCategoryModel(
      id: json['id'].toString(),
      subCategoryAr: json['sub_category_ar'],
      subCategoryEn: json['sub_category_en'],
      classification: json['classification'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sub_category_ar': subCategoryAr,
      'sub_category_en': subCategoryEn,
      'classification': classification,
    };
  }

  @override
  List<Object> get props => [id, subCategoryAr, subCategoryEn, classification];
}
