part of 'versions_bloc.dart';

@immutable
class VersionsEvent {}

class GetAllVersionsEvent extends VersionsEvent {
  final GetVersionsParams? getVersionsParams;

  GetAllVersionsEvent({this.getVersionsParams});
}

class AddOrUpdateNewVersionItemEvent extends VersionsEvent {
  final OneItemVersionEntity oneItemVersionEntity;

  AddOrUpdateNewVersionItemEvent({
    required this.oneItemVersionEntity,
  });
}

class AddOrVersionEvent extends VersionsEvent {
  final AddVersionPramas addVersionPramas;
  final VoidCallback? onSuccess;

  AddOrVersionEvent({required this.addVersionPramas, this.onSuccess});
}

class UpdateVersionEvent extends VersionsEvent {
  final AddVersionPramas addVersionPramas;
  final VoidCallback? onSuccess;

  UpdateVersionEvent({required this.addVersionPramas, this.onSuccess});
}

class ResetListAddedEvent extends VersionsEvent {}

class RemoveItemVersion extends VersionsEvent {
  final int index;

  RemoveItemVersion({required this.index});
}

class GetIncommingUpdateInfoEvent extends VersionsEvent {}

class AddDemandEvent extends VersionsEvent {
  final AddOrUpdateDemandParams params;
  final VoidCallback? onSuccess;
  AddDemandEvent({required this.params, this.onSuccess});
}

class GetDenmadsEvent extends VersionsEvent {
  final GetDemandParams? params;

  GetDenmadsEvent({this.params});

}

class ChangeDenmadStatusEvent extends VersionsEvent {
  final DemandChangeStatusOrCommentParams params;

  ChangeDenmadStatusEvent({required this.params});
}

class AddCommentDemandEvent extends VersionsEvent {
  final DemandChangeStatusOrCommentParams params;
  final VoidCallback? onSuccess;
  AddCommentDemandEvent({required this.params, this.onSuccess});
}

class GetDemandCommentsEvent extends VersionsEvent {
  final DemandChangeStatusOrCommentParams params;

  GetDemandCommentsEvent({required this.params});
}
