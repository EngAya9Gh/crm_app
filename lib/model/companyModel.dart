

import '../constants.dart';

class CompanyModel {
  CompanyModel({
    required this.id_Company,
    required this.name_company,
    required this.path_logo,
    // required this.type,
  });

  late   String? id_Company;
  late     String? name_company;
  late    String? path_logo='';
  // late final String type;

  CompanyModel.fromJson(Map<String, dynamic> json){
    id_Company = json['id_Company'];
    name_company = json['name_company'];
    path_logo = json['path_logo'].toString().trim().isEmpty
        ||json['path_logo']==null
        ? json['path_logo']
        : urlfilelogo+ json['path_logo'];
    // type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_Company'] = id_Company;
    _data['name_company'] = name_company;
    _data['path_logo'] = path_logo;
    // _data['type'] = type;
    return _data;
  }
}