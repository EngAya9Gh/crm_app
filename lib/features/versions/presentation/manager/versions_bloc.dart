import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/versions/domain/use_cases/get_versions_usecase.dart';
import 'package:crm_smart/features/versions/presentation/widgets/add_new_entry_version.dart';
import 'package:crm_smart/model/versionModel.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/add_version_usecase.dart';
import '../../domain/use_cases/update_version_usecase.dart';

part 'versions_event.dart';

part 'versions_state.dart';

@injectable
class VersionsBloc extends Bloc<VersionsEvent, VersionsState> {
  final GetVersionsUsecase getVersionsUsecase;
  final AddVersionsUsecase addVersionsUsecase;
  final UpdateVersionsUsecase updateVersionsUsecase;

  VersionsBloc(
    this.getVersionsUsecase,
    this.addVersionsUsecase,
    this.updateVersionsUsecase,
  ) : super(VersionsState()) {
    on<GetAllVersionsEvent>(_onHandelGetAllVersionsEvent);
    on<ResetListAddedEvent>(_onHandelResetListAddedEvent);
    on<AddOrVersionEvent>(_onHandelAddVersionEvent);
    on<UpdateVersionEvent>(_onHandelUpdateOrVersionEvent);
    on<AddOrUpdateNewVersionItemEvent>(_onHandelAddOrUpdateNewVersionItemEvent);
  }

  FutureOr<void> _onHandelGetAllVersionsEvent(GetAllVersionsEvent event, Emitter<VersionsState> emit) async {
    emit(state.copyWith(getVersionsParams: event.getVersionsParams, getAllVersionsStatus: const BlocStatus.loading()));
    final result = await getVersionsUsecase(state.getVersionsParams);
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getAllVersionsStatus: BlocStatus.fail(error: e),
        ));
      },
      (value) {
        if (((value.data as List<VersionModel>).isEmpty)) {
          emit(state.copyWith(
            getAllVersionsStatus: BlocStatus.empty(data: []),
          ));
          return;
        }
        emit(state.copyWith(
          getAllVersionsStatus: BlocStatus<List<VersionModel>>.success(data: value.data as List<VersionModel>),
        ));
      },
    );
  }

  FutureOr<void> _onHandelAddOrUpdateNewVersionItemEvent(AddOrUpdateNewVersionItemEvent event, Emitter<VersionsState> emit) {
    if (state.listAddNew.map((e) => e.index).contains(event.oneItemVersionEntity.index)) {
      emit(state.copyWith(
          listAddNew: List.of(state.listAddNew)
              .map(
                (e) => e.index == event.oneItemVersionEntity.index ? event.oneItemVersionEntity : e,
              )
              .toList()));
    } else {
      emit(state.copyWith(listAddNew: List.of(state.listAddNew)..add(event.oneItemVersionEntity)));
    }
  }

  FutureOr<void> _onHandelAddVersionEvent(AddOrVersionEvent event, Emitter<VersionsState> emit) async {
    emit(state.copyWith(listAddNew: const [OneItemVersionEntity(index: 0)]));
    event.onSuccess?.call();
    final result = await addVersionsUsecase(event.addVersionPramas);
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
      },
      (value) {},
    );
  }

  FutureOr<void> _onHandelResetListAddedEvent(ResetListAddedEvent event, Emitter<VersionsState> emit) {
    emit(state.copyWith(listAddNew: const [OneItemVersionEntity(index: 0)]));
  }

  FutureOr<void> _onHandelUpdateOrVersionEvent(UpdateVersionEvent event, Emitter<VersionsState> emit) async {
    print(event.addVersionPramas.toParamsUpdate());
    emit(state.copyWith(listAddNew: const [OneItemVersionEntity(index: 0)]));
    event.onSuccess?.call();
    final result = await updateVersionsUsecase(event.addVersionPramas);
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
      },
      (value) {
        emit(state.copyWith(
            getAllVersionsStatus: BlocStatus.success(
                data: (state.getAllVersionsStatus.data ?? [])
                    .map(
                      (e) => e.id == event.addVersionPramas.id ? value.data! : e,
                    )
                    .toList())));
      },
    );
  }
}
