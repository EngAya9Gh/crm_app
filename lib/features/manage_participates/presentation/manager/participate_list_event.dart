
// part of 'communication_list_bloc.dart';

import 'package:equatable/equatable.dart';

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
  List<Object?> get props => [fkCountry];
}

class SearchEvent extends ParticipateEvent {
  final String query;

  SearchEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class OnChangeRegionEvent extends ParticipateEvent {
  final String? selectedRegionId;
  final String fkCountry;
  final String query;

  OnChangeRegionEvent(this.selectedRegionId, this.fkCountry, this.query);

  @override
  List<Object?> get props => [selectedRegionId, fkCountry, query];
}
