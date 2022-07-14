class ProductModel {

  ProductModel({
    this.idProduct,
    required this.nameProduct,
    required this.priceProduct,
    required this.type,
    required this.fkCountry,
    required this.fkConfig,
    this.value_config,
    this.created_at,
    this.fkusercreate,
    this.updated_at,
    this.fkuserupdate,
    this.nameusercreate,
    this.nameuserupdated_at,
  });
   String? idProduct;
  late final String nameProduct;
  late final String priceProduct;
  late final String type;
  late final String fkCountry;
  late String? fkConfig;
  late String? created_at;
  late String? fkusercreate;
  late String? nameusercreate;
  late String? updated_at;
  late String? nameuserupdated_at;
  late String? fkuserupdate;
  late final String? value_config;

  ProductModel.fromJson(Map<String, dynamic> json){
    idProduct = json['id_product'];
    nameProduct = json['nameProduct'];

    priceProduct = json['priceProduct'];
    type = json['type'];
    fkCountry = json['fk_country'];
    fkConfig = json['fk_config'];
    value_config = json['value_config'];
    created_at = json['created_at'];
    fkusercreate = json['fkusercreate'];
    updated_at = json['updated_at'];
    fkuserupdate = json['fkuserupdate'];
    nameuserupdated_at = json['nameuserupdated_at'];
    nameusercreate = json['nameusercreate'];
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
    _data['created_at']=created_at;
    _data['fkusercreate']=fkusercreate;
    _data['updated_at']=updated_at;
    _data['fkuserupdate']=fkuserupdate;
    return _data;
  }
}