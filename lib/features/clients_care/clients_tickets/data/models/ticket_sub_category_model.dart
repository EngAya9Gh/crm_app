import 'package:equatable/equatable.dart';

class TicketSubCategoryModel extends Equatable {
  final int id;
  final String subCategoryAr;
  final String subCategoryEn;
  final String classification;

  const TicketSubCategoryModel({
    required this.id,
    required this.subCategoryAr,
    required this.subCategoryEn,
    required this.classification,
  });

  TicketSubCategoryModel copyWith({
    int? id,
    String? subCategoryAr,
    String? subCategoryEn,
    String? classification,
  }) {
    return TicketSubCategoryModel(
      id: id ?? this.id,
      subCategoryAr: subCategoryAr ?? this.subCategoryAr,
      subCategoryEn: subCategoryEn ?? this.subCategoryEn,
      classification: classification ?? this.classification,
    );
  }

  factory TicketSubCategoryModel.fromMap(Map<String, dynamic> json) {
    return TicketSubCategoryModel(
      id: json['id'],
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
