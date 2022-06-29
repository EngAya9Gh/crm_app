class NotificationModel {
  NotificationModel({
    required this.idNotify,
    required this.message,
    required this.fromUser,
    required this.toUser,
    required this.typeNotify,
    required this.isread,
    required this.tonameuser,
    required this.fromNameuser,
    required this.data,
    required this.dateNotify,
  });
  late final String idNotify;
  late final String message;
  late final String fromUser;
  late final String toUser;
  late final String typeNotify;
  late  final String isread;
  late final String tonameuser;
  String? fromNameuser;
  late final String data;
  late  String dateNotify;

  NotificationModel.fromJson(Map<String, dynamic> json){
    idNotify = json['id_notify'];
    message = json['message'];
    fromUser = json['from_user'];
    toUser = json['to_user'];
    typeNotify = json['type_notify'];
    isread = json['isread'];
    tonameuser = json['tonameuser'];
    fromNameuser = json['fromNameuser'];
    data = json['data'];
    dateNotify = json['dateNotify'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_notify'] = idNotify;
    _data['message'] = message;
    _data['from_user'] = fromUser;
    _data['to_user'] = toUser;
    _data['type_notify'] = typeNotify;
    _data['isread'] = isread;
    _data['tonameuser'] = tonameuser;
    _data['fromNameuser'] = fromNameuser;
    _data['data'] = data;
    _data['dateNotify'] = dateNotify;
    return _data;
  }
}