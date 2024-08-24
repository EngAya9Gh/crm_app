import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/region_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/get_regions_use_case.dart';

part 'regions_state.dart';

@singleton
class RegionsCubit extends Cubit<RegionsState> {
  RegionsCubit(
    this._getRegionsUseCase,
  ) : super(RegionsState());

  final GetRegionsUseCase _getRegionsUseCase;

  List<RegionModel> regionsList = [];

  List<RegionModel> get currentUserRegions {
    if (AppConstants.currentUser.maincitylist_user?.isEmpty ?? true) return [];
    return AppConstants.currentUser.maincitylist_user!.map((e) {
      return e.asRegion;
    }).toList();
  }

  RegionModel? _selectedRegion;

  RegionModel? get selectedRegion => _selectedRegion;

  set selectedRegion(RegionModel? value) {
    emit(state.copyWith(selectRegionStatus: BlocStatus.loading()));
    _selectedRegion = value;
    emit(state.copyWith(selectRegionStatus: BlocStatus.success()));
  }

  Future<void> loadCurrentCityById({String? RegionId}) async {
    if (RegionId == null) {
      selectedRegion = null;
    } else {
      _selectedRegion = regionsList.firstWhereOrNull((element) {
        return element.id_maincity == RegionId;
      });
    }
    emit(state.copyWith(selectRegionStatus: BlocStatus.success()));
  }

  Future<void> getRegions({
    String? regionId,
    Function? onSuccess,
  }) async {
    if (state.getRegionStatus.isLoading() || regionsList.isNotEmpty) return;
    emit(state.copyWith(getRegionStatus: BlocStatus.loading()));

    final result = await _getRegionsUseCase(
      GetRegionsParams(fkCountry: AppConstants.currentCountry),
    );
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getRegionStatus: BlocStatus.fail(error: e),
        ));
      },
      (r) {
        regionsList = r.data;
        emit(state.copyWith(
          getRegionStatus: BlocStatus.success(),
        ));
      },
    );
    onSuccess?.call();
  }
}
