import '../core/utils/end_points.dart';

class CompanyModel {
  CompanyModel({
    required this.id_Company,
    required this.name_company,
    required this.path_logo,
    // required this.type,
  });

  late String id_Company;
  late String? name_company;
  late String? path_logo = '';

  // late final String type;

  CompanyModel.fromJson(Map<String, dynamic> json) {
    id_Company = json['id_Company'].toString();
    name_company = json['name_company'];
    path_logo =
        json['path_logo'].toString().trim().isEmpty || json['path_logo'] == null
            ? json['path_logo']
            : EndPoints.baseUrls.urlFileLogo + json['path_logo'];
    // type = json['type'];
  }
}
