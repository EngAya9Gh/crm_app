class ImportantLinkModel {
  String? id;
  String? title;
  String? link;
  String? notes;
  String? address;
  String? clause;
  String? department;
  String? user_id;

  ImportantLinkModel({
    this.id,
    this.title,
    this.link,
    this.notes,
    this.address,
    this.clause,
    this.department,
    this.user_id,
  });

  factory ImportantLinkModel.fromJson(jsonData) {
    return ImportantLinkModel(
      id: jsonData['id'].toString(),
      title: jsonData['title'].toString(),
      link: jsonData['link'].toString(),
      notes: jsonData['notes'].toString(),
      clause: jsonData['clause'].toString(),
      address: jsonData!['address'].toString(),
      department: jsonData!['department'].toString(),
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
    _data['clause'] = clause;
    _data['department'] = department;
    _data['user_id'] = user_id;

    return _data;
  }
}
