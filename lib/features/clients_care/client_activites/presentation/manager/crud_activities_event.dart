part of 'crud_activities_bloc.dart';

abstract class CrudActivitiesEvent extends Equatable {
  const CrudActivitiesEvent();

  @override
  List<Object?> get props => [];
}

class GetAllCrudActivitiesEvent extends CrudActivitiesEvent {
  final int page;
  final String? filter;
  final String? from;
  final String? to;
  final String? priority;
  final String? fk_user;
  final String? state;

  const GetAllCrudActivitiesEvent({
    required this.page,
    this.filter,
    this.fk_user,
    this.priority,
    this.to,
    this.from,
    this.state,
  });

  @override
  List<Object?> get props => [page, filter, fk_user,  priority, to, from, state];
}


class GetActivityTypesEvent extends CrudActivitiesEvent {

  final String type;

  const GetActivityTypesEvent({
    required this.type,
  });

  @override
  List<Object?> get props => [
    type,
  ];
}



class GetSubscribedClientsEvent extends CrudActivitiesEvent {

  const GetSubscribedClientsEvent();

}

class UpdateCrudActivityEvent extends CrudActivitiesEvent {
  final VoidCallback? onSuccess;
  final String activityId;
  const UpdateCrudActivityEvent({
    required this.activityId,
    this.onSuccess
  });

  @override
  List<Object?> get props => [ onSuccess,activityId];
}

class AddActivityEvent extends CrudActivitiesEvent {

  final VoidCallback? onSuccess;

  const AddActivityEvent({
    this.onSuccess,
  });

  @override
  List<Object?> get props => [

    onSuccess,
  ];
}

class ChangeWholeDayValueEvent extends CrudActivitiesEvent {
  const ChangeWholeDayValueEvent();
}

