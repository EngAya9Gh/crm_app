import 'package:bloc/bloc.dart';
import 'package:crm_smart/model/versionModel.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/entities/filter_notifications_entity.dart';
import '../../domain/entities/notifications_page_variables_entity.dart';
import '../../domain/use_cases/get_notifications_usecase.dart';
import '../../domain/use_cases/get_unread_notifications_count_usecase.dart';
import '../../domain/use_cases/mark_notifications_as_read_usecase.dart';

part 'notifications_state.dart';

@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  final GetNotificationsUsecase _getNotificationsUsecase;
  final MarkNotificationsAsReadUsecase _markNotificationsAsReadUsecase;
  final GetUnreadNotificationsCountUsecase _getUnreadNotificationsCountUsecase;

  NotificationsCubit(
    this._getNotificationsUsecase,
    this._markNotificationsAsReadUsecase,
    this._getUnreadNotificationsCountUsecase,
  ) : super(NotificationsState());

  NotificationsPageVariablesEntity pageVariables = NotificationsPageVariablesEntity();
  FilterNotificationsEntity filterEntity = FilterNotificationsEntity();

  void init() {
    pageVariables = NotificationsPageVariablesEntity();
    filterEntity = FilterNotificationsEntity();
  }

  Future<void> getNotifications({
    bool isNewFilter = true,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        if (state.getNotificationsStatus.isLoading()) return;
        pageVariables.isNewFilter = isNewFilter;
        if (isNewFilter) {
          pageVariables.allList.clear();
          pageVariables.hasReachedEnd = false;
        }
        if (pageVariables.hasReachedEnd) return;

        emit(state.copyWith(getNotificationsStatus: BlocStatus.loading()));
        filterEntity.savePreviousState();
        final result = await _getNotificationsUsecase(
          GetNotificationsParams(
            skip: pageVariables.allList.length,
            query: pageVariables.searchController.text,
            notificationType: filterEntity.notificationTypeNotifier.value,
            dateFrom: filterEntity.dateFromController.text,
            dateTo: filterEntity.dateToController.text,
          ),
        );
        result.fold(
          (e) {
            if (AppConstants.shouldReturnEarly(e)) return;
            emit(state.copyWith(
              getNotificationsStatus: BlocStatus.fail(error: e),
            ));
          },
          (value) {
            pageVariables.allList.addAll(value.data);
            pageVariables.totalCount = value.count ?? 0;
            pageVariables.hasReachedEnd = value.data.isEmpty;
            if (pageVariables.allList.isEmpty) {
              return emit(state.copyWith(
                getNotificationsStatus: BlocStatus.empty(),
              ));
            }
            emit(state.copyWith(
              getNotificationsStatus: BlocStatus.success(),
            ));
          },
        );
      },
      tag: 'search_notifications',
      isDebounced: isDebounced,
    );
  }

  Future<void> getUnreadNotificationsCount() async {
    emit(state.copyWith(getUnreadNotificationsCountStatus: const BlocStatus.loading()));
    final result = await _getUnreadNotificationsCountUsecase(
      GetUnreadNotificationsCountParams(),
    );
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getUnreadNotificationsCountStatus: BlocStatus.fail(error: e),
        ));
      },
      (value) {
        pageVariables.unReadCount = value.count ?? 0;
        if (pageVariables.unReadCount == 0) {
          return emit(state.copyWith(
            getUnreadNotificationsCountStatus: BlocStatus.empty(),
          ));
        }
        emit(state.copyWith(
          getUnreadNotificationsCountStatus: BlocStatus.success(),
        ));
      },
    );
  }

  Future<void> markNotificationsAsRead() async {
    emit(state.copyWith(markNotificationsAsReadStatus: const BlocStatus.loading()));
    pageVariables.unReadCount = 0;
    final result = await _markNotificationsAsReadUsecase(
      MarkNotificationsAsReadParams(),
    );
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          markNotificationsAsReadStatus: BlocStatus.fail(error: e),
        ));
      },
      (r) {
        emit(state.copyWith(
          getUnreadNotificationsCountStatus: const BlocStatus.empty(),
          markNotificationsAsReadStatus:   const BlocStatus.success(),
        ));
      },
    );
  }

  void increaseNotificationCount() {
    pageVariables.unReadCount++;
    emit(state.copyWith(refreshUi: state.refreshUi + 1));
  }

  void returnToPreviousState() {
    filterEntity = filterEntity.returnToPreviousState;
  }
}
