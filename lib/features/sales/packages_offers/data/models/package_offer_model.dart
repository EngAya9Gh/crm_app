
class PackageOfferModel {
  final int? id;
  final String? name;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? createdAt;
  final int? createdBy;
  final DateTime? updatedAt;
  final dynamic updatedBy;
  final List<OfferItem>? offerItems;
  final List<dynamic>? products;

  PackageOfferModel({
    this.id,
    this.name,
    this.startDate,
    this.endDate,
    this.createdAt,
    this.createdBy,
    this.updatedAt,
    this.updatedBy,
    this.offerItems,
    this.products,
  });

  PackageOfferModel copyWith({
    int? id,
    String? name,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? createdAt,
    int? createdBy,
    DateTime? updatedAt,
    dynamic updatedBy,
    List<OfferItem>? offerItems,
    List<dynamic>? products,
  }) =>
      PackageOfferModel(
        id: id ?? this.id,
        name: name ?? this.name,
        startDate: startDate ?? this.startDate,
        endDate: endDate ?? this.endDate,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
        offerItems: offerItems ?? this.offerItems,
        products: products ?? this.products,
      );

  factory PackageOfferModel.fromJson(Map<String, dynamic> json) => PackageOfferModel(
    id: json["id"],
    name: json["name"],
    startDate: json["start_date"] == null ? null : DateTime.parse(json["start_date"]),
    endDate: json["end_date"] == null ? null : DateTime.parse(json["end_date"]),
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    createdBy: json["created_by"],
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    updatedBy: json["updated_by"],
    offerItems: json["offer_items"] == null ? [] : List<OfferItem>.from(json["offer_items"]!.map((x) => OfferItem.fromJson(x))),
    products: json["products"] == null ? [] : List<dynamic>.from(json["products"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "start_date": startDate?.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
    "created_at": createdAt?.toIso8601String(),
    "created_by": createdBy,
    "updated_at": updatedAt?.toIso8601String(),
    "updated_by": updatedBy,
    "offer_items": offerItems == null ? [] : List<dynamic>.from(offerItems!.map((x) => x.toJson())),
    "products": products == null ? [] : List<dynamic>.from(products!.map((x) => x)),
  };
}

class OfferItem {
  final int? id;
  final String? rebateType;
  final int? rebateValue;
  final int? offerId;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  OfferItem({
    this.id,
    this.rebateType,
    this.rebateValue,
    this.offerId,
    this.createdAt,
    this.updatedAt,
  });

  OfferItem copyWith({
    int? id,
    String? rebateType,
    int? rebateValue,
    int? offerId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      OfferItem(
        id: id ?? this.id,
        rebateType: rebateType ?? this.rebateType,
        rebateValue: rebateValue ?? this.rebateValue,
        offerId: offerId ?? this.offerId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory OfferItem.fromJson(Map<String, dynamic> json) => OfferItem(
    id: json["id"],
    rebateType: json["rebate_type"],
    rebateValue: json["rebate_value"],
    offerId: json["offer_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "rebate_type": rebateType,
    "rebate_value": rebateValue,
    "offer_id": offerId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
