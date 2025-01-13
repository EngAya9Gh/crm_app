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
        idSeries: json["id_series"] == null ? null : json["id_series"].toString(),
        nameSeries: json["name_series"],
        priority: json["priority"] == null ? null : json["priority"].toString(),
        fkUser: json["fk_user"] == null ? null : json["fk_user"].toString(),
        fkCountry: json["fk_country"] == null ? null : json["fk_country"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id_series": idSeries,
        "name_series": nameSeries,
        "priority": priority,
        "fk_user": fkUser,
        "fk_country": fkCountry,
      };
}
