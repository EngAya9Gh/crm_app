import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../model/maincitymodel.dart';
import '../../domain/use_cases/get_cities_usecase.dart';

part 'cities_state.dart';

@singleton
class CitiesCubit extends Cubit<CitiesState> {
  CitiesCubit(this.getAllCitiesUseCase) : super(CitiesInitial());

  final GetCitiesUseCase getAllCitiesUseCase;

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
    } else {
      _selectedCity = citiesList.firstWhereOrNull((element) {
        return element.idCity == cityId;
      });
    }
    emit(CitySelected());
  }

  Future<void> getAllCity({
    required String fkCountry,
    String? regionId,
    Function? onSuccess,
  }) async {
    if (state is CitiesLoading || citiesList.isNotEmpty) return;
    emit(CitiesLoading());

    final response = await getAllCitiesUseCase(
      GetCitiesParams(
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
