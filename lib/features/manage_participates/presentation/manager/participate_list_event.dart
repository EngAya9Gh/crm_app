
// part of 'communication_list_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../data/models/participatModel.dart';
import '../../domain/use_cases/add_participate_usecase.dart';
import '../../domain/use_cases/edit_paraticipate_usecase.dart';

abstract class ParticipateEvent extends Equatable {
  const ParticipateEvent();
}

class GetParticipateListEvent extends ParticipateEvent {
  final String fkCountry;
  final String query;

  GetParticipateListEvent(
    this.fkCountry, {
    required this.query,
  });

  @override
  List<Object?> get props => [fkCountry,query];
}

class SearchEvent extends ParticipateEvent {
  final String query;

  SearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class AddParticipateEvent extends ParticipateEvent {
  final AddParaticipateParams addParticipateParams;

  final ValueChanged<ParticipateModel>? onSuccess;

  AddParticipateEvent(this.addParticipateParams, {this.onSuccess});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditParticipateEvent extends ParticipateEvent {
  final EditParticipateParams editParticipateParams;
  final ValueChanged<ParticipateModel>? onSuccess;

  EditParticipateEvent(this.editParticipateParams, {this.onSuccess});

  @override
  List<Object?> get props => throw UnimplementedError();
}


