import '../core/utils/end_points.dart';

class EmployeeReportModel {
  String? sales;
  String? countClient;
  String? name;
  String? salary;
  String? percentage;
  String? img_image = '';

  EmployeeReportModel({
    this.sales,
    this.countClient,
    this.name,
    this.salary,
    this.percentage,
    this.img_image,
  });

  factory EmployeeReportModel.fromJson(Map<String, dynamic> json) =>
      EmployeeReportModel(
        sales: json["y"],
        countClient: json["countclient"],
        name: json["x"],
        salary: json["salary"],
        img_image: json['img_image'].toString().trim().isEmpty
            ? json['img_image']
            : EndPoints.baseUrls.urlimage + json['img_image'],
      );

  Map<String, dynamic> toJson() => {
        "y": sales,
        "countclient": countClient,
        "x": name,
        "salary": salary,
      };

  EmployeeReportModel copyWith({
    String? sales,
    String? countClient,
    String? name,
    String? salary,
    String? percentage,
  }) {
    return EmployeeReportModel(
      sales: sales ?? this.sales,
      countClient: countClient ?? this.countClient,
      name: name ?? this.name,
      salary: salary ?? this.salary,
      percentage: percentage ?? this.percentage,
      img_image: img_image ?? this.img_image,
    );
  }
}
