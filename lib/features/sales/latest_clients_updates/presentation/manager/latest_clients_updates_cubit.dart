import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../domain/use_cases/get_latest_clients_comments_usecase.dart';

part 'latest_clients_updates_state.dart';

@injectable
class LatestClientsUpdatesCubit extends Cubit<LatestClientsUpdatesState> {
  final GetLatestClientsUseCase _getLatestClientsUseCase;

  LatestClientsUpdatesCubit(
    this._getLatestClientsUseCase,
  ) : super(LatestClientsUpdatesState());

  Future<void> getLatestClients() async {
    emit(state.copyWith(getLatestClientsStatus: const BlocStatus.loading()));
    final response = await _getLatestClientsUseCase(GetLatestClientsParams(
      skip: '0',
      fkCountry: '1',
    ));
    response.fold(
      (l) => emit(state.copyWith(
        getLatestClientsStatus: BlocStatus.fail(error: l),
      )),
      (r) {
        emit(state.copyWith(
          getLatestClientsStatus: BlocStatus.success(data: r.data.isEmpty),
        ));
      },
    );
  }
}
