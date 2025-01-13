part of 'client_attachments_bloc.dart';

@immutable
class ClientAttachmentsEvent {}


class GetAttachmentsEvent extends ClientAttachmentsEvent{
}

class GetAllClientEvent extends ClientAttachmentsEvent{}
class ChangeFilterClientEvent extends ClientAttachmentsEvent{
  final GetAttachmentsParams getAttachmentsParams;

  ChangeFilterClientEvent({
  required  this.getAttachmentsParams,
  });
}
class SearchOnClientEvent extends ClientAttachmentsEvent{
  final String query;
  SearchOnClientEvent({required this.query});
}