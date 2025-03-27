
import 'package:crm_smart/core/utils/end_points.dart';

class TaskLogModel {
    final String? logType;
    final String? updatedBy;
    final String? imgImage;
    final DateTime? date;
    final List<String>? value;
    TaskLogModel({
        this.logType,
        this.date,
        this.value,
        this.updatedBy,
        this.imgImage,
    });

    TaskLogModel copyWith({
        String? logType,
        DateTime? date,
        List<String>? value,
        String? updatedBy,
        String? imgImage,
    }) => 
        TaskLogModel(
            logType: logType ?? this.logType,
            date: date ?? this.date,
            value: value ?? this.value,
            updatedBy: updatedBy ?? this.updatedBy,
            imgImage: imgImage ?? this.imgImage,
        );

    factory TaskLogModel.fromJson(Map<String, dynamic> json) => TaskLogModel(
        logType: json["log_type"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        value: json["value"] == null ? [] : List<String>.from(json["value"]!.map((x) => x)),
        updatedBy: json["updated_by"],
        imgImage: json["img_image"]==null?null:EndPoints.baseUrls.laravelFilesUrl+ json["img_image"],
    );

    Map<String, dynamic> toJson() => {
        "log_type": logType,
        "date": date?.toIso8601String(),
        "value": value == null ? [] : List<dynamic>.from(value!.map((x) => x)),
        "updated_by": updatedBy,
        "img_image": imgImage,
    };
   
}
