part of 'sys_support_rating_bloc.dart';

@immutable
sealed class SysSupportRatingEvent {}

class GetListSysOrSupportRatingEvent extends SysSupportRatingEvent{
  final String? clientId;
  final int page;
  GetListSysOrSupportRatingEvent({this.clientId,this.page=1});
}

class GetSystemRatingTicketsEvent extends SysSupportRatingEvent{
  final GetSystemRatingTicktesParams params;

  GetSystemRatingTicketsEvent({required this.params});
}
class AddSystemRatingTicketEvent extends SysSupportRatingEvent{
  final GetSystemRatingTicktesParams params;

  AddSystemRatingTicketEvent({required this.params});
}
