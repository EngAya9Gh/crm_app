part of 'versions_bloc.dart';

@immutable
class VersionsEvent {}

class GetAllVersionsEvent extends VersionsEvent {
  final GetVersionsParams? getVersionsParams;

  GetAllVersionsEvent({this.getVersionsParams});
}

class AddOrUpdateNewVersionItemEvent extends VersionsEvent{
  final OneItemVersionEntity oneItemVersionEntity;

   AddOrUpdateNewVersionItemEvent({
    required this.oneItemVersionEntity,
  });
}


class AddVersionEvent extends VersionsEvent {
  final AddVersionPramas? addVersionPramas;

  AddVersionEvent({this.addVersionPramas});
}
