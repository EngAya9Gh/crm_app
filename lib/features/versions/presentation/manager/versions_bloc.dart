import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/core/common/models/page_state/bloc_status.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:crm_smart/features/versions/data/models/incomming_update.dart';
import 'package:crm_smart/features/versions/domain/use_cases/add_comment_demand_usecase.dart';
import 'package:crm_smart/features/versions/domain/use_cases/add_demand_usecase.dart';
import 'package:crm_smart/features/versions/domain/use_cases/change_demand_status_usecase.dart';
import 'package:crm_smart/features/versions/domain/use_cases/get_comments_demand_usecase.dart';
import 'package:crm_smart/features/versions/domain/use_cases/get_demands_usecase.dart';
import 'package:crm_smart/features/versions/domain/use_cases/get_incomming_version_info.dart';
import 'package:crm_smart/features/versions/domain/use_cases/get_versions_usecase.dart';
import 'package:crm_smart/features/versions/presentation/widgets/new_entry_version_widget.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:crm_smart/model/versionModel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  final GetIncommingVersionInfoUsecase getIncommingVersionInfoUsecase;
  final AddDemandUsecase addDemandUsecase;
  final GetDemandsUsecase getDemandsUsecase;
  final ChangeDemandStatusUsecase changeDemandStatusUsecase;
  final AddDemandCommentUsecase addDemandCommentUsecase;
  final GetDemandCommentsUsecase getDemandCommentsUsecase;

  VersionsBloc(
    this.getVersionsUsecase,
    this.addVersionsUsecase,
    this.updateVersionsUsecase,
    this.getIncommingVersionInfoUsecase,
    this.addDemandUsecase,
    this.getDemandsUsecase,
    this.changeDemandStatusUsecase,
    this.addDemandCommentUsecase,
    this.getDemandCommentsUsecase,
  ) : super(VersionsState()) {
    on<GetAllVersionsEvent>(_onHandelGetAllVersionsEvent);
    on<ResetListAddedEvent>(_onHandelResetListAddedEvent);
    on<AddOrVersionEvent>(_onHandelAddVersionEvent);
    on<UpdateVersionEvent>(_onHandelUpdateOrVersionEvent);
    on<AddOrUpdateNewVersionItemEvent>(_onHandelAddOrUpdateNewVersionItemEvent);
    on<RemoveItemVersion>(_onHandelRemoveItemVersion);
    on<GetIncommingUpdateInfoEvent>(_onGetIncommingUpdateInfoEvent);
    on<AddDemandEvent>(_onAddDemandEvent);
    on<GetDenmadsEvent>(_onGetDenmadsEvent);
    on<ChangeDenmadStatusEvent>(_onChangeDenmadStatusEvent);
    on<AddCommentDemandEvent>(_onAddCommentDemandEvent);
    on<GetDemandCommentsEvent>(_onGetDemandCommentsEvent);
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

  FutureOr<void> _onHandelRemoveItemVersion(RemoveItemVersion event, Emitter<VersionsState> emit) {
    emit(state.copyWith(
        listAddNew: state.listAddNew
          ..removeWhere(
            (element) => element.index == event.index,
          )));
  }

  FutureOr<void> _onGetIncommingUpdateInfoEvent(GetIncommingUpdateInfoEvent event, Emitter<VersionsState> emit) async {
    emit(state.copyWith(incommingUpdateInfo: BlocStatus.loading()));
    final result = await getIncommingVersionInfoUsecase();
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(incommingUpdateInfo: BlocStatus.fail(error: e)));
      },
      (value) {
        emit(state.copyWith(incommingUpdateInfo: BlocStatus.success(data: value.message)));
      },
    );
  }

  FutureOr<void> _onAddDemandEvent(AddDemandEvent event, Emitter<VersionsState> emit) async {
    emit(state.copyWith(addDemandStatus: BlocStatus.loading()));
    final result = await addDemandUsecase(event.params);
    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(addDemandStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(addDemandStatus: BlocStatus.success(data: value.message)));
        event.onSuccess?.call();
      },
    );
  }

  FutureOr<void> _onGetDenmadsEvent(GetDenmadsEvent event, Emitter<VersionsState> emit) async {
    emit(state.copyWith(getDemands: BlocStatus.loading()));
    final result = await getDemandsUsecase(event.params ?? state.params);
    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(getDemands: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(getDemands: BlocStatus.success(data: value.message)));
      },
    );
  }

  FutureOr<void> _onChangeDenmadStatusEvent(ChangeDenmadStatusEvent event, Emitter<VersionsState> emit) async {
    emit(state.copyWith(changeDemandStatus: BlocStatus.loading()));
    final result = await changeDemandStatusUsecase(event.params);
    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(changeDemandStatus: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(
            changeDemandStatus: BlocStatus.success(data: value.message),
            getDemands: BlocStatus.success(
                data: (state.getDemands.data ?? [])
                    .map(
                      (element) => element.id == event.params.idDemand
                          ? element.copyWith(
                              status: DemandVersionStatus.values.firstWhere((element) => element.text == event.params.status!).text,
                            )
                          : element,
                    )
                    .toList())));
      },
    );
  }

  FutureOr<void> _onAddCommentDemandEvent(AddCommentDemandEvent event, Emitter<VersionsState> emit) async {
    emit(state.copyWith(addCommentDemand: BlocStatus.loading()));
    final result = await addDemandCommentUsecase(event.params);
    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(addCommentDemand: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(
            addCommentDemand: BlocStatus.success(data: value.message),
            getCommentsDemand: BlocStatus.success(data: List.of(state.getCommentsDemand.data ?? [])..add(value.message!))));
        event.onSuccess?.call();
      },
    );
  }

  FutureOr<void> _onGetDemandCommentsEvent(GetDemandCommentsEvent event, Emitter<VersionsState> emit) async {
    emit(state.copyWith(getCommentsDemand: BlocStatus.loading()));
    final result = await getDemandCommentsUsecase(event.params);
    result.extract(
      (exception, message) {
        if (AppConstants.shouldReturnEarly(message)) return;
        emit(state.copyWith(getCommentsDemand: BlocStatus.fail(error: message)));
      },
      (value) {
        emit(state.copyWith(getCommentsDemand: BlocStatus.success(data: value.message)));
      },
    );
  }
}
