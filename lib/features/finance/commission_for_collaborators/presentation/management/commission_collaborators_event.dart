part of 'commission_collaborators_bloc.dart';

@immutable
class CommissionCollaboratorsEvent {}


class GetCommissionCollaboratorsEvent extends CommissionCollaboratorsEvent{
  final CommissionCollaboratorsParams? params;
  final ValueChanged<int>? onSuccess;
   GetCommissionCollaboratorsEvent({
    this.params,
    this.onSuccess,
  });
}