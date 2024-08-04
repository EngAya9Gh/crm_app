import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/common/models/region_model.dart';
import '../../../domain/use_cases/get_regions_by_id_country_usecase.dart';

part 'regions_state.dart';

@injectable
class RegionsCubit extends Cubit<RegionsState> {
  final GetRegionsByIdCountryUseCase _getRegionsByIdCountryUseCase;

  RegionsCubit(
    this._getRegionsByIdCountryUseCase,
  ) : super(RegionsInitial());

  List<RegionModel> regionsList = [];

  RegionModel? _selectedCity;

  RegionModel? get selectedCity => _selectedCity;

  set selectedCity(RegionModel? value) {
    _selectedCity = value;
    emit(RegionSelected());
  }

  Future<void> getRegionsByIdCountry({
    required String fkCountry,
    Function? onSuccess,
  }) async {
    if (state is RegionsLoading || regionsList.isNotEmpty) return;
    emit(RegionsLoading());

    final result = await _getRegionsByIdCountryUseCase(
      GetRegionsByIdCountryParams(
        fkCountry: fkCountry,
      ),
    );
    result.fold(
      (l) => emit(RegionsError(l)),
      (r) {
        regionsList = r;
        emit(RegionsLoaded());
      },
    );
    onSuccess?.call();
  }

  Future<void> loadCurrentRegionById({String? cityId}) async {
    if (cityId == null) {
      selectedCity = null;
    } else {
      _selectedCity = regionsList.firstWhereOrNull((element) {
        return element.regionId == cityId;
      });
    }
    emit(RegionSelected());
  }
}
