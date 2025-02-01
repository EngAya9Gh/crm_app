import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';

List<BarModel> genderModelFromJson(String str) =>
    List<BarModel>.from(json.decode(str).map((x) => BarModel.fromJson(x)));

String genderModelToJson(List<BarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BarModel {
  BarModel({
    required this.x,
    required this.countclient,
    required this.y,
    required this.colorval,
    required this.clientcounterafter,
    required this.total1,
    // required this.nameUser,
  });

  String x;

  // String nameUser;
  int countclient;
  double y;
  Color colorval;
  String? clientcounterafter;
  String? total1;

  // double probability;
  // int count;

  factory BarModel.fromJson(Map<String, dynamic> json) => BarModel(
        colorval: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        x: json["x"] ?? '',
        clientcounterafter: json["clientcountafter"],
        total1: json["total1"],
        countclient: int.parse(json["countclient"]),
        y: double.parse(json["y"]),
        // probability: json["probability"].toDouble(),
        // count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        // "nameUser": nameUser,
        "countclient": countclient,
        "y": y,
      };
}
