import 'package:equatable/equatable.dart';

class ManagementModel extends Equatable {
  final int idManage;
  final String nameManage;
  final String? fkCountry;

  ManagementModel({
    required this.idManage,
    required this.nameManage,
    this.fkCountry,
  });

  factory ManagementModel.fromJson(Map<String, dynamic> json) {
    return ManagementModel(
      idManage: json['idmange'],
      nameManage: json['name_mange'],
      fkCountry: json['fk_country'] == null ? null : json['fk_country'].toString(),
    );
  }

  @override
  List<Object?> get props => [
    idManage,
    nameManage,
    fkCountry,
  ];
}