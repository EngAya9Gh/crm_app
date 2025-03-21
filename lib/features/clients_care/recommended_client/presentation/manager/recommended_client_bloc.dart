import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../data/models/recommended_client_model.dart';
import '../../domain/use_cases/get_recommended_client_reports_usecase.dart';

part 'recommended_client_event.dart';

part 'recommended_client_state.dart';

@injectable
class RecommendedClientReportsBloc extends Bloc<RecommendedClientReportsEvent, RecommendedClientReportsState> {
  final GetRecommendClientsReportsUsecase _getRecommendClientsReportsUsecase;

  RecommendedClientReportsBloc(
    this._getRecommendClientsReportsUsecase,
  ) : super(RecommendedClientReportsState()) {
    on<GetRecommendedClientReportsEvent>(_onGetRecommendedClientReportsEvent);
  }

  FutureOr<void> _onGetRecommendedClientReportsEvent(GetRecommendedClientReportsEvent event, Emitter<RecommendedClientReportsState> emit) async {
    emit(state.copyWith(recommendedClientList: BlocStatus.loading()));
    final result = await _getRecommendClientsReportsUsecase();
    result.extract(
      (exception, message) => emit(
        state.copyWith(recommendedClientList: BlocStatus.fail(error: message)),
      ),
      (value) {
        if(value.message?.isEmpty??true){
          emit(state.copyWith(recommendedClientList: BlocStatus.empty()));
          return;
        }
        emit(
        state.copyWith(recommendedClientList: BlocStatus.success(data: value.message),totalDataCount: value.count),
      );
      },
    );
  }
}
