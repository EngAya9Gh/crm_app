part of 'notifications_cubit.dart';

class NotificationsState extends Equatable {
  final int refreshUi;
  final BlocStatus getNotificationsStatus;
  final BlocStatus markNotificationsAsReadStatus;
  final BlocStatus getUnreadNotificationsCountStatus;
  final BlocStatus<NotificationTypes> filterList;

  NotificationsState({
    this.refreshUi = 0,
    this.getNotificationsStatus = const BlocStatus.initial(),
    this.markNotificationsAsReadStatus = const BlocStatus.initial(),
    this.getUnreadNotificationsCountStatus = const BlocStatus.initial(),
    this.filterList = const BlocStatus.initial(),
  });

  NotificationsState copyWith({
    int? refreshUi,
    BlocStatus? getNotificationsStatus,
    BlocStatus? markNotificationsAsReadStatus,
    BlocStatus? getUnreadNotificationsCountStatus,
    BlocStatus<NotificationTypes>? filterList,
  }) {
    return NotificationsState(
      refreshUi: (refreshUi ?? this.refreshUi) % 99999,
      getNotificationsStatus:
          getNotificationsStatus ?? this.getNotificationsStatus,
      markNotificationsAsReadStatus:
          markNotificationsAsReadStatus ?? this.markNotificationsAsReadStatus,
      getUnreadNotificationsCountStatus: getUnreadNotificationsCountStatus ??
          this.getUnreadNotificationsCountStatus,
      filterList:filterList??this.filterList
    );
  }

  @override
  List<Object> get props {
    return [
      refreshUi,
      getNotificationsStatus,
      markNotificationsAsReadStatus,
      getUnreadNotificationsCountStatus,
      filterList,
    ];
  }
}
