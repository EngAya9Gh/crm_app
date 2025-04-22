import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../model/communication_modle.dart';
import '../../data/models/elevation_model.dart';
import '../../domain/entities/filter_periodic_communication_entity.dart';
import '../../domain/use_cases/get_elevation_sys_support_use_case.dart';

part 'sys_support_rating_event.dart';

part 'sys_support_rating_state.dart';

@injectable
class SysSupportRatingBloc extends Bloc<SysSupportRatingEvent, SysSupportRatingState> {
  final GetElevationSysSupportUseCase _getElevationSysSupportUseCase;
  final FilterElevationSysSupportEntity filterEntity = FilterElevationSysSupportEntity();

  SysSupportRatingBloc(this._getElevationSysSupportUseCase,) : super(SysSupportRatingState()) {
    on<GetListSysOrSupportRatingEvent>(_onGetListSysOrSupportRatingEvent);
  }

  FutureOr<void> _onGetListSysOrSupportRatingEvent(GetListSysOrSupportRatingEvent event, Emitter<SysSupportRatingState> emit) async {
    emit(state.copyWith(listRating: BlocStatus.loading()));
    final result = await _getElevationSysSupportUseCase(GetRatingParams(
      rate: filterEntity.rateNotifier.value,
      rate_type: filterEntity.rateTypeNotifier.value,
      client_id: event.clientId,
      search: filterEntity.searchController.text,
      from: filterEntity.dateFromController.text,
      to: filterEntity.dateToController.text,));
    result.extract(
          (exception, message) =>
          emit(
            state.copyWith(listRating: BlocStatus.fail(error: message)),
          ),
          (value) =>
          emit(
            state.copyWith(listRating: BlocStatus.success(data: value.message)),
          ),
    );
  }
}
