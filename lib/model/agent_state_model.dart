import 'package:equatable/equatable.dart';

class AgentStateModel extends Equatable {
  final String id;
  final String fkAgent;
  final String state;
  final String dateState;
  final String? reasonState;

  const AgentStateModel({
    required this.id,
    required this.fkAgent,
    required this.state,
    required this.dateState,
    this.reasonState,
  });

  factory AgentStateModel.fromJson(Map<String, dynamic> json) {
    return AgentStateModel(
      id: json['id'].toString(),
      fkAgent: json['fk_agent'].toString(),
      state: json['state'],
      dateState: json['date_state'],
      reasonState: json['reason_state'],
    );
  }

  AgentStateModel copyWith({
    String? id,
    String? fkAgent,
    String? state,
    String? dateState,
    String? reasonState,
  }) {
    return AgentStateModel(
      id: id ?? this.id,
      fkAgent: fkAgent ?? this.fkAgent,
      state: state ?? this.state,
      dateState: dateState ?? this.dateState,
      reasonState: reasonState ?? this.reasonState,
    );
  }

  @override
  List<Object?> get props => [id, fkAgent, state, dateState, reasonState];
}
