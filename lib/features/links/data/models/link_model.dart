

import 'package:crm_smart/model/maincitymodel.dart';

class LinkImportantModel {
  String? id;
  String? title;
  String? link;
  String? notes;
  String? address;
  String? user_id;

  LinkImportantModel({
    this.id,
    this.title,
    this.link,
    this.notes,
    this.address,
    this.user_id,

  });

  factory LinkImportantModel.fromJson(jsonData) {
    return LinkImportantModel(
      id: jsonData['id'].toString(),
      title: jsonData['title'].toString(),

      link: jsonData['link'].toString(),
      notes: jsonData['notes'].toString(),
      address: jsonData!['address'],
      user_id: jsonData['user_id'].toString(),

    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;

    _data['link'] = link;
    _data['notes'] = notes;
    _data['address'] = address;
    _data['user_id'] = user_id;

    return _data;
  }

}

