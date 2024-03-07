import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart';
import '../../../../model/maincitymodel.dart';

part 'cities_state.dart';

@singleton
class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this.getAllCitiesUseCase) : super(CitiesInitial());

  final GetAllCitiesUseCase getAllCitiesUseCase;

  List<CityModel> citiesList = [];

  CityModel? _selectedCity;

  CityModel? get selectedCity => _selectedCity;

  set selectedCity(CityModel? value) {
    _selectedCity = value;
    emit(CitySelected());
  }

  Future<void> loadCurrentCityById({String? cityId}) async {
    if (cityId == null) {
      selectedCity = null;
    }
    _selectedCity = citiesList.firstWhereOrNull((element) {
      return element.id_city == cityId;
    });
    emit(CitySelected());
  }

  Future<void> getAllCity({
    required String fkCountry,
    String? regionId,
    Function? onSuccess,
  }) async {
    emit(CitiesLoading());

    final response = await getAllCitiesUseCase(
      GetAllCitiesUseCaseParams(
        fkCountry: fkCountry,
        regionId: regionId,
      ),
    );
    response.fold(
      (l) => emit(CitiesError(l)),
      (r) {
        citiesList = r;
        emit(CitiesLoaded());
      },
    );
    onSuccess?.call();
  }
}
