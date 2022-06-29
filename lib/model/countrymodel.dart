class CountryModel {
  CountryModel({
    required this.idCountry,
    required this.nameCountry,
    required this.currency,
  });
  late final String idCountry;
  late  String nameCountry;
  late final String currency;

  CountryModel.fromJson(Map<String, dynamic> json){
    idCountry = json['id_country'];
    nameCountry = json['nameCountry'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_country'] = idCountry;
    _data['nameCountry'] = nameCountry;
    _data['currency'] = currency;
    return _data;
  }
}