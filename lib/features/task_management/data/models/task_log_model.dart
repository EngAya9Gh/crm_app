
class TaskLogModel {
    final String? logType;
    final DateTime? date;
    final List<String>? value;

    TaskLogModel({
        this.logType,
        this.date,
        this.value,
    });

    TaskLogModel copyWith({
        String? logType,
        DateTime? date,
        List<String>? value,
    }) => 
        TaskLogModel(
            logType: logType ?? this.logType,
            date: date ?? this.date,
            value: value ?? this.value,
        );

    factory TaskLogModel.fromJson(Map<String, dynamic> json) => TaskLogModel(
        logType: json["log_type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        value: json["value"] == null ? [] : List<String>.from(json["value"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "log_type": logType,
        "date": date?.toIso8601String(),
        "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x)),
    };
}
