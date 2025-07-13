import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:crm_smart/features/clients_care/clients_tickets/data/models/ticket_model.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/add_system_rating_ticket_use_case.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/get_system_rating_tickets_use_case.dart';
import 'package:crm_smart/features/clients_care/evaluation_across_system/domain/use_cases/process_system_rating_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../../../../model/communication_modle.dart';
import '../../data/models/elevation_model.dart';
import '../../domain/entities/filter_periodic_communication_entity.dart';
import '../../domain/use_cases/get_elevation_sys_support_use_case.dart';

part 'sys_support_rating_event.dart';
part 'sys_support_rating_state.dart';

@injectable
class SysSupportRatingBloc
    extends Bloc<SysSupportRatingEvent, SysSupportRatingState> {
  final GetElevationSysSupportUseCase _getElevationSysSupportUseCase;
  final GetSystemRatingTicketsUseCase _getSystemratingTicketsUseCase;
  final AddSystemRatingTicketsUseCase _addSystemRatingTicketsUseCase;
  final ProcessSystemRatingUseCase _processSystemRatingUseCase;

  final FilterElevationSysSupportEntity filterEntity =
      FilterElevationSysSupportEntity();

  SysSupportRatingBloc(
    this._getElevationSysSupportUseCase,
    this._getSystemratingTicketsUseCase,
    this._addSystemRatingTicketsUseCase,
    this._processSystemRatingUseCase,
  ) : super(SysSupportRatingState()) {
    on<GetListSysOrSupportRatingEvent>(_onGetListSysOrSupportRatingEvent,
        transformer: droppable());
    on<GetSystemRatingTicketsEvent>(_onGetSystemRatingTicketsEvent);
    on<AddSystemRatingTicketEvent>(_onAddSystemRatingTicketEvent);
    on<ProcessSystemRatingEvent>(_onProcessSystemRatingEvent);
  }

  FutureOr<void> _onGetListSysOrSupportRatingEvent(
      GetListSysOrSupportRatingEvent event,
      Emitter<SysSupportRatingState> emit) async {


    if (event.page > 1) {
      emit(state.copyWith(statusListRating: BlocStatus.loading()));
    } else if (event.page == 1) {
      emit(state.copyWith(listRating: BlocStatus.loading()));
    }
    filterEntity.page = event.page;
    final result = await _getElevationSysSupportUseCase(GetRatingParams(
      page: event.page,
      rates: filterEntity.rateNotifier.value,
      rate_type: filterEntity.rateTypeNotifier.value,
      client_id: event.clientId,
      search: filterEntity.searchController.text,
      from: filterEntity.dateFromController.text,
      to: filterEntity.dateToController.text,
    ));
    result.extract(
      (exception, message) => emit(
        state.copyWith(
            listRating: BlocStatus.fail(error: message),
            statusListRating: BlocStatus.fail()),
      ),
      (value) {
        emit(state.copyWith(
            totalCount: value.count,
            hasReachedEnd: value.message?.isEmpty ?? true));
        if (event.page > 1) {
          emit(
            state.copyWith(
                listRating: BlocStatus.success(
                    data: List.of(state.listRating.data ?? [])
                      ..addAll(value.message ?? [])),
                statusListRating: BlocStatus.success()),
          );
          return;
        }
        emit(
          state.copyWith(
              listRating: BlocStatus.success(data: value.message),
              statusListRating: BlocStatus.success()),
        );
      },
    );

  }

  FutureOr<void> _onGetSystemRatingTicketsEvent(
      GetSystemRatingTicketsEvent event,
      Emitter<SysSupportRatingState> emit) async {
    emit(state.copyWith(ratingSystemTickets: BlocStatus.loading()));
    final result = await _getSystemratingTicketsUseCase(event.params);
    result.extract(
      (exception, message) => emit(
        state.copyWith(ratingSystemTickets: BlocStatus.fail(error: message)),
      ),
      (value) => emit(
        state.copyWith(
            ratingSystemTickets: (value.message?.isEmpty ?? true)
                ? BlocStatus.empty()
                : BlocStatus.success(data: value.message)),
      ),
    );
  }

  FutureOr<void> _onAddSystemRatingTicketEvent(AddSystemRatingTicketEvent event,
      Emitter<SysSupportRatingState> emit) async {
    emit(state.copyWith(addRatingSystemTicket: BlocStatus.loading()));
    final result = await _addSystemRatingTicketsUseCase(event.params);
    result.extract(
      (exception, message) => emit(
        state.copyWith(addRatingSystemTicket: BlocStatus.fail(error: message)),
      ),
      (value) => emit(
        state.copyWith(
            addRatingSystemTicket: BlocStatus.success(data: value.message),
            ratingSystemTickets: BlocStatus.success(
                data: List.of(state.ratingSystemTickets.data ?? [])
                  ..add(value.message!))),
      ),
    );
  }

  FutureOr<void> _onProcessSystemRatingEvent(ProcessSystemRatingEvent event,
      Emitter<SysSupportRatingState> emit) async {
    emit(state.copyWith(processedRating: BlocStatus.loading()));
    final result = await _processSystemRatingUseCase(event.params);
    result.extract(
        (exception, message) => emit(
              state.copyWith(processedRating: BlocStatus.fail(error: message)),
            ),
        (value) => emit(
              state.copyWith(
                processedRating: BlocStatus.success(data: value.message),
                listRating: BlocStatus.success(
                    data: (state.listRating.data ?? []).map((e) {
                  if (e.id == event.params.ratingId) {
                    return e.copyWith(should_processed: false);
                  }
                  return e;
                }).toList()),
              ),
            ));
  }
}
