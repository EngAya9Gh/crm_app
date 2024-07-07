import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/appointment_model.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class GetDateInstallationUsecase extends UseCase<
    Either<String, List<AppointmentModel>>, GetDateInstallationParams> {
  GetDateInstallationUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, List<AppointmentModel>>> call(
    GetDateInstallationParams params,
  ) async {
    return await _repository.getDateInstallation(params);
  }
}

class GetDateInstallationParams {
  final String fkCountry;
  final DateInstallationType type;
  final String? fkUser;
  final List<String>? mainCityFks;
  final String? nameCityClient;

  GetDateInstallationParams({
    required this.fkCountry,
    this.fkUser,
    this.mainCityFks,
    this.nameCityClient,
  }) : type = _getType(fkUser, mainCityFks);

  static DateInstallationType _getType(
    String? fkUser,
    List<String>? mainCityFks,
  ) {
    if (_existFkUser(fkUser) && _existMainCityFks(mainCityFks)) {
      return DateInstallationType.Mix;
    } else if (_existFkUser(fkUser) && !_existMainCityFks(mainCityFks)) {
      return DateInstallationType.FkUser;
    } else if (!_existFkUser(fkUser) && _existMainCityFks(mainCityFks)) {
      return DateInstallationType.MainCity;
    } else {
      return DateInstallationType.All;
    }
  }

  static bool _existFkUser(String? fkUser) =>
      fkUser != null && fkUser.isNotEmpty;

  static bool _existMainCityFks(List<String>? mainCityFks) =>
      mainCityFks != null && mainCityFks.isNotEmpty;

  String prepareParams() {
    String params = "";

    params += "?fk_country=$fkCountry";

    if (_existFkUser(fkUser)) {
      params += "&fk_user=$fkUser";
    }

    if (_existMainCityFks(mainCityFks)) {
      params += _prepareMainCityParams();
    }

    if (nameCityClient != null) {
      params += "&name_city_client=$nameCityClient";
    }

    return params;
  }

  String _prepareMainCityParams() {
    return mainCityFks!.map((e) => "&maincity_fks[]=$e").join();
  }

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
      nameCityClient: nameCityClient ?? this.nameCityClient,
    );
  }
}

enum DateInstallationType { MainCity, FkUser, All, Mix }

extension DateInstallationTypeExtension on DateInstallationType {
  String get url {
    switch (this) {
      case DateInstallationType.MainCity:
        return 'client/invoice/get_dateinstall_all_user.php';
      case DateInstallationType.FkUser:
        return 'client/invoice/get_dateinstall_all_maincity.php';
      case DateInstallationType.All:
        return 'client/invoice/get_all_date_install.php';
      case DateInstallationType.Mix:
        return 'client/invoice/get_dateinstall_mix.php';
    }
  }
}
