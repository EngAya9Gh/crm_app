import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../domain/use_cases/add_packages_offers_usecase.dart';
import '../../domain/use_cases/get_packages_offers_usecase.dart';

part 'packages_offers_event.dart';

part 'packages_offers_state.dart';

@injectable
class PackagesOffersBloc extends Bloc<PackagesOffersEvent, PackagesOffersState> {
  final GetPackagesOffersUseCase getPackagesOffersUseCase;
  final AddPackagesOffersUseCase addPackagesOffersUseCase;

  PackagesOffersBloc(
    this.getPackagesOffersUseCase,
    this.addPackagesOffersUseCase,
  ) : super(PackagesOffersState()) {
    on<AddNewPackagesOffersEvent>(_onHandleAddNewPackagesOffersEvent);
  }

  FutureOr<void> _onHandleAddNewPackagesOffersEvent(AddNewPackagesOffersEvent event, Emitter<PackagesOffersState> emit) async {
    emit(state.copyWith(addNewOfferStatus: BlocStatus.loading()));
    final result = await addPackagesOffersUseCase(event.addNewPackagesOffersParams);
    result.fold(
      (l) => emit(
        state.copyWith(addNewOfferStatus: BlocStatus.fail(error: l)),
      ),
      (r) => emit(
        state.copyWith(addNewOfferStatus: BlocStatus.success()),
      ),
    );
  }
}
