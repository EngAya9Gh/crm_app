import '../core/utils/end_points.dart';

class EmployeeReportModel {
  String? sales;
  String? countClient;
  String? name;
  String? salary;
  String? target;
  String? percentage;
  String? img_image = '';

  EmployeeReportModel({
    this.sales,
    this.countClient,
    this.name,
    this.salary,
    this.target,
    this.percentage,
    this.img_image,
  });

  factory EmployeeReportModel.fromJson(Map<String, dynamic> json) =>
      EmployeeReportModel(
        sales: json["y"],
        countClient: json["countclient"],
        name: json["x"],
        salary: json["salary"],
        target: json["target"],
        img_image:json['img_image']==null?null: json['img_image'].toString().trim().isEmpty
            ? json['img_image']
            : EndPoints.baseUrls.laravelFilesUrl + json['img_image'],
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
    String? target,
    String? percentage,
  }) {
    return EmployeeReportModel(
      sales: sales ?? this.sales,
      countClient: countClient ?? this.countClient,
      name: name ?? this.name,
      salary: salary ?? this.salary,
      target: target ?? this.target,
      percentage: percentage ?? this.percentage,
      img_image: img_image ?? this.img_image,
    );
  }
}
