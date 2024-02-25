import 'package:equatable/equatable.dart';

class ParticipateModel extends Equatable {
  ParticipateModel({
    required this.id_participate,
    required this.name_participate,
    required this.mobile_participate,
    required this.namebank_participate,
    required this.numberbank_participate,
    this.addDate,
    this.updateDate,
    this.fkUserAdd,
    this.fkUserUpdate,
    this.nameUserAdd,
    this.nameUserUpdate,
  });

  late String? id_participate = null;
  late final String name_participate;
  late final String mobile_participate;
  late final String namebank_participate;
  late final String numberbank_participate;
  final String? addDate;
  final String? updateDate;
  final String? fkUserAdd;
  final String? fkUserUpdate;
  final String? nameUserAdd;
  final String? nameUserUpdate;

  factory ParticipateModel.fromJson(Map<String, dynamic> json) {
    return ParticipateModel(
      id_participate: json['id_participate'],
      name_participate: json['name_participate'],
      mobile_participate: json['mobile_participate'],
      namebank_participate: json['namebank_participate'],
      numberbank_participate: json['numberbank_participate'],
      addDate: json['add_date'],
      updateDate: json['update_date'],
      fkUserAdd: json['fk_user_add'],
      fkUserUpdate: json['fk_user_update'],
      nameUserAdd: json['nameUserAdd'],
      nameUserUpdate: json['nameUserUpdate'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_participate'] = id_participate;
    _data['name_participate'] = name_participate;
    _data['mobile_participate'] = mobile_participate;
    _data['namebank_participate'] = namebank_participate;
    _data['numberbank_participate'] = numberbank_participate;
    _data['add_date'] = addDate;
    _data['update_date'] = updateDate;
    _data['fk_user_add'] = fkUserAdd;
    _data['fk_user_update'] = fkUserUpdate;
    _data['nameUserAdd'] = nameUserAdd;
    _data['nameUserUpdate'] = nameUserUpdate;

    return _data;
  }

  bool getFilterParticipate(String query) {
    return name_participate
        .toLowerCase()
        .toString()
        .contains(query.toLowerCase());
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id_participate,
        name_participate,
        mobile_participate,
        namebank_participate,
        numberbank_participate,
        addDate,
        updateDate,
        fkUserAdd,
        fkUserUpdate,
        nameUserAdd,
        nameUserUpdate,
      ];
}
