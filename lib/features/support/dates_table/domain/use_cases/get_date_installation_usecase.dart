import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/calendar/event_model.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class GetDateInstallationUsecase extends UseCase<
    Either<String, List<EventModel>>, GetDateInstallationParams> {
  GetDateInstallationUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, List<EventModel>>> call(
    GetDateInstallationParams params,
  ) async {
    return await _repository.getDateInstallation(params);
  }
}

class GetDateInstallationParams {
  final String fkCountry;
  final DateInstallationState state;
  final String? fkUser;
  final List<String>? mainCityFks;

  GetDateInstallationParams({
    required this.fkCountry,
    this.fkUser,
    this.mainCityFks,
  }) : state = _getState(fkUser, mainCityFks);

  // copy with
  GetDateInstallationParams copyWith({
    String? fkCountry,
    String? fkUser,
    List<String>? mainCityFks,
    String? nameCityClient,
  }) {
    return GetDateInstallationParams(
      fkCountry: fkCountry ?? this.fkCountry,
      fkUser: fkUser ?? this.fkUser,
      mainCityFks: mainCityFks ?? this.mainCityFks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'state': state.value,
      'fk_country': fkCountry,
      'fk_user': fkUser,
      ..._prepareMainCityParams(),
    }..removeWhere((key, value) {
        return value == null || value == "";
      });
  }

  _prepareMainCityParams() {
    if (mainCityFks == null) return {};

    final Map<String, dynamic> mainCityParams = {};

    for (var i = 0; i < mainCityFks!.length; i++) {
      mainCityParams["maincity_fks[$i]"] = mainCityFks![i];
    }

    return mainCityParams;
  }

  static DateInstallationState _getState(
    String? fkUser,
    List<String>? mainCityFks,
  ) {
    if (_existFkUser(fkUser) && _existMainCityFks(mainCityFks)) {
      return DateInstallationState.Mix;
    } else if (_existFkUser(fkUser) && !_existMainCityFks(mainCityFks)) {
      return DateInstallationState.FkUser;
    } else if (!_existFkUser(fkUser) && _existMainCityFks(mainCityFks)) {
      return DateInstallationState.MainCity;
    } else {
      return DateInstallationState.All;
    }
  }

  static bool _existFkUser(String? fkUser) =>
      fkUser != null && fkUser.isNotEmpty;

  static bool _existMainCityFks(List<String>? mainCityFks) =>
      mainCityFks != null && mainCityFks.isNotEmpty;
}

enum DateInstallationState { All, MainCity, FkUser, Mix }

extension DateInstallationTypeExtension on DateInstallationState {
  int get value {
    switch (this) {
      case DateInstallationState.All:
        return 1;
      case DateInstallationState.FkUser:
        return 2;
      case DateInstallationState.MainCity:
        return 3;
      case DateInstallationState.Mix:
        return 4;
    }
  }
}
