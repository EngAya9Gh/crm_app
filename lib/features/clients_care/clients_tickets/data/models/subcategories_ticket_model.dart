class SubcategoriesTicketModel {
  SubcategoriesTicketModel({
    this.id,
    this.subCategoryAr,
    this.subCategoryEn,
    this.classification,
  });

  SubcategoriesTicketModel.fromJson(dynamic json) {
    id = json['id'];
    subCategoryAr = json['sub_category_ar'];
    subCategoryEn = json['sub_category_en'];
    classification = json['classification'];
  }
  num? id;
  String? subCategoryAr;
  String? subCategoryEn;
  String? classification;
  SubcategoriesTicketModel copyWith({
    num? id,
    String? subCategoryAr,
    String? subCategoryEn,
    String? classification,
  }) =>
      SubcategoriesTicketModel(
        id: id ?? this.id,
        subCategoryAr: subCategoryAr ?? this.subCategoryAr,
        subCategoryEn: subCategoryEn ?? this.subCategoryEn,
        classification: classification ?? this.classification,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['sub_category_ar'] = subCategoryAr;
    map['sub_category_en'] = subCategoryEn;
    map['classification'] = classification;
    return map;
  }
}
