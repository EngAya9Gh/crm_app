import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String id;
  final String categoryAr;
  final String categoryEn;
  final String classification;

  CategoryModel({
    required this.id,
    required this.categoryAr,
    required this.categoryEn,
    required this.classification,
  });

  CategoryModel copyWith({
    String? id,
    String? categoryAr,
    String? categoryEn,
    String? classification,
  }) {
    return CategoryModel(
      id: id ?? this.id,
      categoryAr: categoryAr ?? this.categoryAr,
      categoryEn: categoryEn ?? this.categoryEn,
      classification: classification ?? this.classification,
    );
  }

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'].toString(),
      categoryAr: json['category_ar'],
      categoryEn: json['category_en'],
      classification: json['classification'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category_ar': categoryAr,
      'category_en': categoryEn,
      'classification': classification,
    };
  }

  @override
  List<Object> get props => [id, categoryAr, categoryEn, classification];
}
