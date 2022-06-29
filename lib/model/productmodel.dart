class ProductModel {

  ProductModel({
    this.idProduct,
    required this.nameProduct,
    required this.priceProduct,
    required this.type,
    required this.fkCountry,
    required this.fkConfig,
    this.value_config
  });
   String? idProduct;
  late final String nameProduct;
  late final String priceProduct;
  late final String type;
  late final String fkCountry;
  late String? fkConfig;
  late final String? value_config;

  ProductModel.fromJson(Map<String, dynamic> json){
    idProduct = json['id_product'];
    nameProduct = json['nameProduct'];
    priceProduct = json['priceProduct'];
    type = json['type'];
    fkCountry = json['fk_country'];
    fkConfig = json['fk_config'];
    value_config = json['value_config'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    //_data['id_product'] = idProduct;
    _data['nameProduct'] = nameProduct;
    _data['priceProduct'] = priceProduct;
    _data['type'] = type;
    _data['fk_country'] = fkCountry;
    _data['fk_config'] = fkConfig;
    _data['value_config']=value_config;
    return _data;
  }
}