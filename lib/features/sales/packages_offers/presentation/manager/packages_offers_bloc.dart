import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../data/models/package_offer_model.dart';
import '../../domain/use_cases/add_packages_offers_usecase.dart';
import '../../domain/use_cases/delete_packages_offers_usecase.dart';
import '../../domain/use_cases/get_filter_packages_offers_usecase.dart';
import '../../domain/use_cases/get_packages_offers_usecase.dart';
import '../../domain/use_cases/update_packages_offers_usecase.dart';
import '../pages/package_offer_item_entry_added.dart';

part 'packages_offers_event.dart';

part 'packages_offers_state.dart';

@injectable
class PackagesOffersBloc extends Bloc<PackagesOffersEvent, PackagesOffersState> {
  final GetPackagesOffersUseCase getPackagesOffersUseCase;
  final AddPackagesOffersUseCase addPackagesOffersUseCase;
  final UpdatePackagesOffersUseCase updatePackagesOffersUseCase;
  final DeletePackagesOffersUseCase deletePackagesOffersUseCase;
  final GetFilterPackagesOffersUseCase getFilterPackagesOffersUseCase;

  PackagesOffersBloc(
    this.getPackagesOffersUseCase,
    this.addPackagesOffersUseCase,
    this.updatePackagesOffersUseCase,
    this.deletePackagesOffersUseCase,
    this.getFilterPackagesOffersUseCase,
  ) : super(PackagesOffersState()) {
    on<GetPackagesOffersEvent>(_onHandleGetPackagesOffersEvent);
    on<GetPackagesOffersFilterEvent>(_onHandleGetPackagesOffersFilterEvent);
    on<DeletePackagesOffersEvent>(_onHandleDeletePackagesOffersEvent);
    on<AddNewPackagesOffersEvent>(_onHandleAddNewPackagesOffersEvent);
    on<UpdateNewPackagesOffersEvent>(_onHandleUpdateNewPackagesOffersEvent);
    on<DeleteOrAddOrUpdateEntryToListOfItemAddedEvent>(_onHandleDeleteOrAddOrUpdateEntryToListOfItemAddedEvent);
    on<ResetListOfItemAddEvent>(_onHandleResetListOfItemAddEvent);
  }

  FutureOr<void> _onHandleAddNewPackagesOffersEvent(AddNewPackagesOffersEvent event, Emitter<PackagesOffersState> emit) async {
    emit(state.copyWith(addOrUpdateNewOfferStatus: BlocStatus.loading()));
    final result = await addPackagesOffersUseCase(event.addNewPackagesOffersParams);
    result.fold(
      (l) => emit(
        state.copyWith(addOrUpdateNewOfferStatus: BlocStatus.fail(error: l)),
      ),
      (r) => emit(
        state.copyWith(addOrUpdateNewOfferStatus: BlocStatus.success()),
      ),
    );
  }

  FutureOr<void> _onHandleDeleteOrAddOrUpdateEntryToListOfItemAddedEvent(
      DeleteOrAddOrUpdateEntryToListOfItemAddedEvent event, Emitter<PackagesOffersState> emit) {
    if (event.isAdd) {
      emit(state.copyWith(listItemAdded: List.of(state.listItemAdded)..add(event.newEntryItemPackageOfferAdded)));
    } else if (event.isRemove) {
      emit(
        state.copyWith(
            listItemAdded: List.of(state.listItemAdded)
              ..removeWhere(
                (element) => element.index == event.newEntryItemPackageOfferAdded.index,
              )),
      );
    } else {
      emit(state.copyWith(
        listItemAdded: List.of(state.listItemAdded)
            .map((e) => e.index == event.newEntryItemPackageOfferAdded.index ? event.newEntryItemPackageOfferAdded : e)
            .toList(),
      ));
    }
  }

  FutureOr<void> _onHandleResetListOfItemAddEvent(ResetListOfItemAddEvent event, Emitter<PackagesOffersState> emit) {
    emit(state.copyWith(listItemAdded: event.listItem ?? const [NewEntryItemPackageOfferAdded(index: 0)]));
  }

  FutureOr<void> _onHandleGetPackagesOffersEvent(GetPackagesOffersEvent event, Emitter<PackagesOffersState> emit) async {
    emit(state.copyWith(allOffersPackages: BlocStatus.loading(), addOrUpdateNewOfferStatus: BlocStatus.initial()));
    final result = await getPackagesOffersUseCase();
    result.fold(
      (l) => emit(
        state.copyWith(allOffersPackages: BlocStatus.fail(error: l)),
      ),
      (r) {
        if(r.isEmpty){
          emit(
            state.copyWith(allOffersPackages: BlocStatus.empty()),
          );
          return;
        }
        emit(
          state.copyWith(allOffersPackages: BlocStatus.success(data: r)),
        );
      },
    );
  }

  FutureOr<void> _onHandleUpdateNewPackagesOffersEvent(UpdateNewPackagesOffersEvent event, Emitter<PackagesOffersState> emit) async {
    emit(state.copyWith(addOrUpdateNewOfferStatus: BlocStatus.loading()));
    final result = await updatePackagesOffersUseCase(event.addNewPackagesOffersParams);
    result.fold(
      (l) => emit(
        state.copyWith(addOrUpdateNewOfferStatus: BlocStatus.fail(error: l)),
      ),
      (r) => emit(
        state.copyWith(addOrUpdateNewOfferStatus: BlocStatus.success()),
      ),
    );
  }

  FutureOr<void> _onHandleDeletePackagesOffersEvent(DeletePackagesOffersEvent event, Emitter<PackagesOffersState> emit) async {
    emit(state.copyWith(deleteNewOfferStatus: BlocStatus.loading()));
    final result = await deletePackagesOffersUseCase(event.params);
    result.fold(
      (l) => emit(
        state.copyWith(deleteNewOfferStatus: BlocStatus.fail(error: l)),
      ),
      (r) {
        emit(state.copyWith(deleteNewOfferStatus: BlocStatus.success()));
        emit(state.copyWith(deleteNewOfferStatus: BlocStatus.initial()));
      },
    );
  }

  FutureOr<void> _onHandleGetPackagesOffersFilterEvent(GetPackagesOffersFilterEvent event, Emitter<PackagesOffersState> emit)async {
    emit(state.copyWith(allFilterOffersPackages: BlocStatus.loading(), addOrUpdateNewOfferStatus: BlocStatus.initial()));
    final result = await getFilterPackagesOffersUseCase();
    result.fold(
          (l) => emit(
        state.copyWith(allFilterOffersPackages: BlocStatus.fail(error: l)),
      ),
          (r) {
        if(r.isEmpty){
          emit(
            state.copyWith(allFilterOffersPackages: BlocStatus.empty()),
          );
          return;
        }
        emit(
          state.copyWith(allFilterOffersPackages: BlocStatus.success(data: r)),
        );
      },
    );
  }
}
