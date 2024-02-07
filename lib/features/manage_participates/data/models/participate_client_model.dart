

import 'package:equatable/equatable.dart';

class ParticipateClientModel extends Equatable {
  int? idClients;
  String? nameClient;
  String? nameEnterprise;
  String? typeClient;
  String? fkRegoin;
  String? fkUser;
  String? offerPrice;
  String? datePrice;
  String? nameCountry;
  String? nameRegoin;
  String? nameUser;
  int? fkCountry;

  ParticipateClientModel(
      {this.idClients,
      this.nameClient,
      this.nameEnterprise,
      this.typeClient,
      this.fkRegoin,
      this.fkUser,
      this.offerPrice,
      this.datePrice,
      this.nameCountry,
      this.nameRegoin,
      this.nameUser,
      this.fkCountry});

  ParticipateClientModel.fromJson(Map<String, dynamic> json) {
    idClients = json['id_clients'];
    nameClient = json['name_client'];
    nameEnterprise = json['name_enterprise'];
    typeClient = json['type_client'];
    fkRegoin = json['fk_regoin'];
    fkUser = json['fk_user'];
    offerPrice = json['offer_price'];
    datePrice = json['date_price'];
    nameCountry = json['nameCountry'];
    nameRegoin = json['name_regoin'];
    nameUser = json['nameUser'];
    fkCountry = json['fk_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_clients'] = this.idClients;
    data['name_client'] = this.nameClient;
    data['name_enterprise'] = this.nameEnterprise;
    data['type_client'] = this.typeClient;
    data['fk_regoin'] = this.fkRegoin;
    data['fk_user'] = this.fkUser;
    data['offer_price'] = this.offerPrice;
    data['date_price'] = this.datePrice;
    data['nameCountry'] = this.nameCountry;
    data['name_regoin'] = this.nameRegoin;
    data['nameUser'] = this.nameUser;
    data['fk_country'] = this.fkCountry;
    return data;
  }
  
  @override
  List<Object?> get props => [idClients,nameClient,nameEnterprise,typeClient,fkRegoin,fkUser,offerPrice,datePrice,nameCountry,nameRegoin,nameUser,fkCountry];
}