


class RegoinModel{
  late final String id_regoin,fk_country;//nameCountry,currency;
 late final String name_regoin;
  RegoinModel({
    required this.id_regoin, required this.name_regoin,
     required this.fk_country,
    // this.nameCountry,this.currency
  }
      );

  factory RegoinModel.fromJson(Map<String, dynamic> json){
    return RegoinModel(
      id_regoin:json["id_regoin"],
        name_regoin: json["name_regoin"],
         fk_country: json["fk_country"],
        // nameCountry:json["nameCountry"],
        // currency:json["currency"]

    );
  }
}