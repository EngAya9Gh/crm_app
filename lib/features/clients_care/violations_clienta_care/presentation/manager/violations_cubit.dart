import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/management_model.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/domain/use_cases/get_all_management_usecase.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/domain/use_cases/get_violation_types_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../data/models/violations_model.dart';
import '../../domain/entities/filter_violations_entity.dart';
import '../../domain/entities/violations_page_vars_entity.dart';
import '../../domain/use_cases/get_violations_usecase.dart';
import '../../domain/use_cases/update_violadtion_usecase.dart';

part 'violations_state.dart';

@injectable
class ViolationsCubit extends Cubit<ViolationsState> {
  final GetViolationsUsecase _getViolationsUseCase;
  final UpdateViolationUseCase _updateViolationUseCase;
  final GetManagementsUsecase _getManagementsUseCase;
  final GetViolationsTypesUseCase _getViolationsTypesUseCase;

  ViolationsCubit(
    this._getViolationsUseCase,
    this._updateViolationUseCase,
    this._getManagementsUseCase,
    this._getViolationsTypesUseCase,
  ) : super(ViolationsState());

  ViolationsPageVarsEntity pageVariables =
  ViolationsPageVarsEntity();
  FilterViolationsEntity filterEntity = FilterViolationsEntity();

  void init(String idUser) {
    pageVariables = ViolationsPageVarsEntity();
    filterEntity = FilterViolationsEntity();
  }

  Future<void> getViolations({
    bool isNewFilter = false,
    bool isDebounced = false,
  }) async {
    AppConstants.debounceFunction(
      () async {
        try {
          if (state.getViolationsStatus.isLoading()) return;
          pageVariables.isNewFilter = isNewFilter;
          if (isNewFilter) {
            pageVariables.allList.clear();
            pageVariables.hasReachedEnd = false;
          }
          if (pageVariables.hasReachedEnd) return;

          emit(state.copyWith(getViolationsStatus: BlocStatus.loading()));
          final result = await _getViolationsUseCase(
            GetViolationsParams(
              skip: pageVariables.allList.length,
              filter: pageVariables.searchController.text,
              managementId: filterEntity.management.value==null?null:filterEntity.management.value!.idManage.toString(),
              userId: filterEntity.userId.value==null?null:filterEntity.userId.value,
              violationTypeId: filterEntity.violationType.value==null?null:filterEntity.violationType.value!.id.toString(),
            ),
          );
          result.fold(
                (e) {
              if (AppConstants.shouldReturnEarly(e)) return;
              emit(state.copyWith(
                getViolationsStatus: BlocStatus.fail(error: e),
              ));
            },
                (value) {
              pageVariables.allList.addAll(value.data);
              pageVariables.totalCount = value.count==0? pageVariables.totalCount:(value.count??0);
              pageVariables.hasReachedEnd = value.data.isEmpty;
              if (pageVariables.allList.isEmpty) {
                return emit(state.copyWith(
                  getViolationsStatus: BlocStatus.empty(),
                ));
              }
              emit(state.copyWith(
                getViolationsStatus: BlocStatus.success(),
              ));
              getAllManagements();
              getAllViolationTypes();
            },
          );
        }catch (e) {
          emit(state.copyWith(
            getViolationsStatus: BlocStatus.fail(error: e.toString()),
          ));
        }
        },
      tag: 'search_wrong_numbers',
      isDebounced: isDebounced,
    );
  }

  Future<void> getAllManagements() async {
    try {
        if (state.getManagementStatus.isLoading()) return;

        emit(state.copyWith(getManagementStatus: BlocStatus.loading()));
        final response = await _getManagementsUseCase(GetManagementsParams(),);
        if(response.message!=null){
          pageVariables.managementList = response.message!;
          emit(state.copyWith(
            getManagementStatus: BlocStatus.success(),
          ));
        }else{
          emit(state.copyWith(
            getManagementStatus: BlocStatus.empty(),
          ));
        }
      }catch (e) {
      emit(state.copyWith(
        getManagementStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }

  Future<void> getAllViolationTypes() async {
    try {
        if (state.getViolationTypesStatus.isLoading()) return;

        emit(state.copyWith(getViolationTypesStatus: BlocStatus.loading()));
        final response = await _getViolationsTypesUseCase(GetViolationsTypesParams(),);
        if(response.message!=null){
          pageVariables.violationTypeList = response.message!;
          emit(state.copyWith(
            getViolationTypesStatus: BlocStatus.success(),
          ));
        }else{
          emit(state.copyWith(
            getViolationTypesStatus: BlocStatus.empty(),
          ));
        }
      }catch (e) {
      emit(state.copyWith(
        getViolationTypesStatus: BlocStatus.fail(error: e.toString()),
      ));
    }
  }

  Future<void> updateViolationEvent({
    String description="",
    required int violationId,
    bool isAccepted = false,
    VoidCallback? onSuccess
}) async {

    if (state.updateViolationStatus.isLoading()) return;

    emit(state.copyWith(updateViolationStatus: BlocStatus.loading(),));

    final params = UpdateViolationParams(
      violationId: violationId.toString(),
      description: description,
      acceptStatus: isAccepted?"accepted":"rejected",
    );

    try {

      final response = await _updateViolationUseCase(params);

      if(response.message!=null){
        ViolationModel currentAct = pageVariables.allList.firstWhere(
              (activity) => activity.id == violationId, // Assuming 'id' is the identifier
        );

        int? index = pageVariables.allList.indexOf(currentAct);
        emit(state.copyWith(
          getViolationsStatus: BlocStatus.loading(),
        ));
        pageVariables.allList[index] = response.message!; // As

        emit(state.copyWith(
          updateViolationStatus: BlocStatus.success(),
          getViolationsStatus: BlocStatus.success(),
        ));
        onSuccess?.call();
      }
    } catch (e) {
      emit(state.copyWith(
        updateViolationStatus: BlocStatus.fail(error: e.toString()),
        getViolationsStatus: BlocStatus.success(),
      ));
      onSuccess?.call();
    }
  }







  //
  // void returnToPreviousState() {
  //   filterEntity = filterEntity.returnToPreviousState;
  // }
}
