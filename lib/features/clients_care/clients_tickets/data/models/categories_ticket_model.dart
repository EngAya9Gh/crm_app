class CategoriesTicketModel {
  CategoriesTicketModel({
    this.id,
    this.categoryAr,
    this.categoryEn,
    this.classification,
  });

  CategoriesTicketModel.fromJson(dynamic json) {
    id = json['id'];
    categoryAr = json['category_ar'];
    categoryEn = json['category_en'];
    classification = json['classification'];
  }
  num? id;
  String? categoryAr;
  String? categoryEn;
  String? classification;
  CategoriesTicketModel copyWith({
    num? id,
    String? categoryAr,
    String? categoryEn,
    String? classification,
  }) =>
      CategoriesTicketModel(
        id: id ?? this.id,
        categoryAr: categoryAr ?? this.categoryAr,
        categoryEn: categoryEn ?? this.categoryEn,
        classification: classification ?? this.classification,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['category_ar'] = categoryAr;
    map['category_en'] = categoryEn;
    map['classification'] = classification;
    return map;
  }
}
