import 'package:equatable/equatable.dart';

import '../../../../../core/common/models/user_entity.dart';

class SubscribedClientModel extends UserEntity with EquatableMixin {
  final String id;
  final String name;

  const SubscribedClientModel({
    required this.id,
    required this.name,
  }) : super(id: id, name: name);

  factory SubscribedClientModel.fromJson(dynamic map) {
    return SubscribedClientModel(
      id: map['id'].toString(),
      name: map['name_enterprise'],
    );
  }

  @override
  List<Object?> get props => [id, name];
}
