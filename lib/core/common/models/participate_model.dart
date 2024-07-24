import 'package:equatable/equatable.dart';

import '../../../features/sales/public_relations/participates/data/models/state_participat_model.dart';
import 'user_entity.dart';

class ParticipateModel extends UserEntity with EquatableMixin {
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
    this.fkCity,
    this.nameCity,
    this.regionName,
    this.lastState,
    this.dateState,
  }) : super(id: id_participate, name: name_participate);

  final String id_participate;
  final String name_participate;
  final String mobile_participate;
  final String namebank_participate;
  final String numberbank_participate;
  final String? addDate;
  final String? updateDate;
  final String? fkUserAdd;
  final String? fkUserUpdate;
  final String? nameUserAdd;
  final String? nameUserUpdate;
  final String? fkCity;
  final String? nameCity;
  final String? regionName;
  final StateParticipateModel? lastState;
  final String? dateState;

  factory ParticipateModel.fromJson(Map<String, dynamic> json) {
    return ParticipateModel(
      id_participate: json['id_participate'].toString(),
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
      fkCity: json['fk_city'],
      nameCity: json['name_city'],
      regionName: json['regoin_name'],
      lastState: json['state_object'] != null
          ? StateParticipateModel.fromMap(json['state_object'])
          : null,
      dateState: json['date_state'],
    );
  }

  @override
  List<Object?> get props {
    return [
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
      fkCity,
      nameCity,
      regionName,
      lastState,
    ];
  }

  bool getFilterParticipate(String query) {
    return name_participate
        .toLowerCase()
        .toString()
        .contains(query.toLowerCase());
  }
}
