part of 'sys_support_rating_bloc.dart';

@immutable
sealed class SysSupportRatingEvent {}

class GetListSysOrSupportRatingEvent extends SysSupportRatingEvent {
  final String? clientId;
  final int page;
  GetListSysOrSupportRatingEvent({this.clientId, this.page = 1});
}

class GetSystemRatingTicketsEvent extends SysSupportRatingEvent {
  final GetOrAddSystemRatingTicktesParams params;

  GetSystemRatingTicketsEvent({required this.params});
}

class AddSystemRatingTicketEvent extends SysSupportRatingEvent {
  final GetOrAddSystemRatingTicktesParams params;

  AddSystemRatingTicketEvent({required this.params});
}

class ProcessSystemRatingEvent extends SysSupportRatingEvent {
  final ProcessSystemRatingParams params;

  ProcessSystemRatingEvent({required this.params});
}
