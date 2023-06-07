class ParticipateModel {
  ParticipateModel({
    required this.id_participate,
    required this.name_participate,
    required this.mobile_participate,
    required this.namebank_participate,
    required this.numberbank_participate,

  });

  late  String? id_participate=null;
  late final String name_participate;
  late final String mobile_participate;
  late final String namebank_participate;
  late final String numberbank_participate;


  ParticipateModel.fromJson(Map<String, dynamic> json){
    id_participate = json['id_participate'];
    name_participate = json['name_participate'];
    mobile_participate = json['mobile_participate'];
    namebank_participate = json['namebank_participate'];
    numberbank_participate = json['numberbank_participate'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_participate'] = id_participate;
    _data['name_participate'] = name_participate;
    _data['mobile_participate'] = mobile_participate;
    _data['namebank_participate'] = namebank_participate;
    _data['numberbank_participate'] = numberbank_participate;
    return _data;
  }
}

