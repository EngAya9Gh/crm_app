import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../model/clientmodel.dart';
import '../../domain/use_cases/get_clients_accept_usecase.dart';

part 'clients_accept_state.dart';

@injectable
class ClientsAcceptCubit extends Cubit<ClientsAcceptState> {
  final GetClientsAcceptUseCase _getClientsAcceptUseCase;

  ClientsAcceptCubit(
    this._getClientsAcceptUseCase,
  ) : super(ClientsAcceptState());

  List<ClientModel1> clientsAccept = [];

  Future<void> getClientsAccept() async {
    emit(ClientsAcceptState(getClientsAcceptStatus: BlocStatus.loading()));
    final result = await _getClientsAcceptUseCase(
      // todo : change the parameters
      GetClientsAcceptParams(
        fkCountry: '1',
      ),
    );
    result.fold(
      (e) => emit(ClientsAcceptState(
        getClientsAcceptStatus: BlocStatus.fail(error: e),
      )),
      (data) {
        clientsAccept.addAll(data);
        emit(
          ClientsAcceptState(
            getClientsAcceptStatus: BlocStatus.success(data: data.isEmpty),
          ),
        );
      },
    );
  }
}
