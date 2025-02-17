// To parse this JSON data, do
//
//     final userReportModel = userReportModelFromJson(jsonString);

import 'dart:convert';

UserReportModel userReportModelFromJson(String str) => UserReportModel.fromJson(json.decode(str));

String userReportModelToJson(UserReportModel data) => json.encode(data.toJson());

class UserReportModel {
  final num? idUser;
  final String? nameUser;
  final String? imgImage;
  final num? tasksCount;
  final num? taskOpenedCount;
  final num? taskReceivedCount;
  final num? taskCompletedCount;
  final num? taskEvaluatedCount;
  final num? averageTimeTaken;
  final num? averageRate;

  UserReportModel({
    this.idUser,
    this.nameUser,
    this.imgImage,
    this.tasksCount,
    this.taskOpenedCount,
    this.taskReceivedCount,
    this.taskCompletedCount,
    this.taskEvaluatedCount,
    this.averageTimeTaken,
    this.averageRate,
  });

  UserReportModel copyWith({
    num? idUser,
    String? nameUser,
    String? imgImage,
    num? tasksCount,
    num? taskOpenedCount,
    num? taskReceivedCount,
    num? taskCompletedCount,
    num? taskEvaluatedCount,
    num? averageTimeTaken,
    num? averageRate,
  }) =>
      UserReportModel(
        idUser: idUser ?? this.idUser,
        nameUser: nameUser ?? this.nameUser,
        imgImage: imgImage ?? this.imgImage,
        tasksCount: tasksCount ?? this.tasksCount,
        taskOpenedCount: taskOpenedCount ?? this.taskOpenedCount,
        taskReceivedCount: taskReceivedCount ?? this.taskReceivedCount,
        taskCompletedCount: taskCompletedCount ?? this.taskCompletedCount,
        taskEvaluatedCount: taskEvaluatedCount ?? this.taskEvaluatedCount,
        averageTimeTaken: averageTimeTaken ?? this.averageTimeTaken,
        averageRate: averageRate ?? this.averageRate,
      );

  factory UserReportModel.fromJson(Map<String, dynamic> json) => UserReportModel(
    idUser: json["id_user"],
    nameUser: json["nameUser"],
    imgImage: json["img_image"],
    tasksCount: json["tasks_count"],
    taskOpenedCount: json["task_opened_count"],
    taskReceivedCount: json["task_received_count"],
    taskCompletedCount: json["task_completed_count"],
    taskEvaluatedCount: json["task_evaluated_count"],
    averageTimeTaken: json["average_time_taken"],
    averageRate: json["average_rate"],
  );

  Map<String, dynamic> toJson() => {
    "id_user": idUser,
    "nameUser": nameUser,
    "img_image": imgImage,
    "tasks_count": tasksCount,
    "task_opened_count": taskOpenedCount,
    "task_received_count": taskReceivedCount,
    "task_completed_count": taskCompletedCount,
    "task_evaluated_count": taskEvaluatedCount,
    "average_time_taken": averageTimeTaken,
    "average_rate": averageRate,
  };
}
