import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/location/city_model.dart';
import '../../../../../core/common/models/page_state/bloc_status.dart';
import '../../../../../core/utils/app_constants.dart';
import '../../domain/use_cases/get_cities_usecase.dart';

part 'cities_state.dart';

@singleton
class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this._getAllCitiesUseCase) : super(CitiesState());

  final GetCitiesUseCase _getAllCitiesUseCase;

  List<CityModel> citiesList = [];

  CityModel? _selectedCity;

  CityModel? get selectedCity => _selectedCity;

  set selectedCity(CityModel? value) {
    emit(state.copyWith(selectCityStatus: BlocStatus.loading()));
    _selectedCity = value;
    emit(state.copyWith(selectCityStatus: BlocStatus.success()));
  }

  Future<void> loadCurrentCityById({String? cityId}) async {
    if (cityId == null) {
      selectedCity = null;
    } else {
      _selectedCity = citiesList.firstWhereOrNull((element) {
        return element.cityId == cityId;
      });
    }
    emit(state.copyWith(selectCityStatus: BlocStatus.success()));
  }

  Future<void> getAllCity({
    required String fkCountry,
    String? regionId,
    Function? onSuccess,
  }) async {
    if (state.getCityStatus.isLoading() || citiesList.isNotEmpty) return;
    emit(state.copyWith(getCityStatus: BlocStatus.loading()));

    final result = await _getAllCitiesUseCase(
      GetCitiesParams(
        fkCountry: fkCountry,
        regionId: regionId,
      ),
    );
    result.fold(
      (e) {
        if (AppConstants.shouldReturnEarly(e)) return;
        emit(state.copyWith(
          getCityStatus: BlocStatus.fail(error: e),
        ));
      },
      (r) {
        citiesList = r;
        emit(state.copyWith(
          getCityStatus: BlocStatus.success(),
        ));
      },
    );
    onSuccess?.call();
  }
}
