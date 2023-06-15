class EmployeeReportModel {
  String? sales;
  String? countClient;
  String? name;
  String? salary;
  String? percentage;

  EmployeeReportModel({
    this.sales,
    this.countClient,
    this.name,
    this.salary,
    this.percentage,
  });

  factory EmployeeReportModel.fromJson(Map<String, dynamic> json) => EmployeeReportModel(
        sales: json["y"],
        countClient: json["countclient"],
        name: json["x"],
        salary: json["salary"],
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
    );
  }
}
