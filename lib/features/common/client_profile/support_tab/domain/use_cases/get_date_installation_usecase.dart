import 'package:crm_smart/model/appointment_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/use_case/use_case.dart';
import '../repositories/support_tab_repo.dart';

@lazySingleton
class GetDateInstallationUsecase extends UseCase<
    Either<String, List<AppointmentModel>>, GetDateInstallationParams> {
  GetDateInstallationUsecase(this._repository);

  final SupportTabRepo _repository;

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

  GetDateInstallationParams({
    required this.fkCountry,
    this.fkUser,
    this.mainCityFks,
  }) : type = _getType(fkUser, mainCityFks);

  static DateInstallationType _getType(
    String? fkUser,
    List<String>? mainCityFks,
  ) {
    if (fkUser != null && mainCityFks != null) {
      return DateInstallationType.Mix;
    } else if (fkUser != null && mainCityFks == null) {
      return DateInstallationType.FkUser;
    } else if (fkUser == null && mainCityFks != null) {
      return DateInstallationType.MainCity;
    } else {
      return DateInstallationType.All;
    }
  }

  String prepareParams() {
    String params = "";

    params += "?fk_country=$fkCountry";

    if (fkUser != null) {
      params += "&fk_user=$fkUser";
    }

    if (mainCityFks != null) {
      params += _prepareMainCityParams();
    }

    return params;
  }

  String _prepareMainCityParams() {
    return mainCityFks!.map((e) => "&maincity_fks[]=$e").join();
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
