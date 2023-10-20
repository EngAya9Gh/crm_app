import 'dart:convert';

UserSeries userSeriesFromJson(String str) => UserSeries.fromJson(json.decode(str));

String userSeriesToJson(UserSeries data) => json.encode(data.toJson());

class UserSeries {
  String? idSeries;
  dynamic nameSeries;
  String? priority;
  String? fkUser;
  String? fkCountry;

  UserSeries({
    this.idSeries,
    this.nameSeries,
    this.priority,
    this.fkUser,
    this.fkCountry,
  });

  factory UserSeries.fromJson(Map<String, dynamic> json) => UserSeries(
    idSeries: json["id_series"],
    nameSeries: json["name_series"],
    priority: json["priority"],
    fkUser: json["fk_user"],
    fkCountry: json["fk_country"],
  );

  Map<String, dynamic> toJson() => {
    "id_series": idSeries,
    "name_series": nameSeries,
    "priority": priority,
    "fk_user": fkUser,
    "fk_country": fkCountry,
  };
}
