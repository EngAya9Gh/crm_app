part of 'sys_support_rating_bloc.dart';

@immutable
sealed class SysSupportRatingEvent {}

class GetListSysOrSupportRatingEvent extends SysSupportRatingEvent{
  final String? clientId;

  GetListSysOrSupportRatingEvent({this.clientId});
}