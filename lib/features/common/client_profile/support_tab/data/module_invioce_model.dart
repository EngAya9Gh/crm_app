class ModuleInvoiceModel {
  final int? id;
  final String? name;

  ModuleInvoiceModel({
    this.id,
    this.name,
  });

  ModuleInvoiceModel copyWith({
    int? id,
    String? name,
  }) =>
      ModuleInvoiceModel(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory ModuleInvoiceModel.fromJson(Map<String, dynamic> json) => ModuleInvoiceModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
