import 'package:crm_smart/api/api.dart';
import 'package:crm_smart/constants.dart';
import 'package:crm_smart/model/appointment_model.dart';
import 'package:flutter/foundation.dart';

class DateInstallationService {
  static Future<List<AppointmentModel>> getDateInstallationMainCity({
    required String fkCountry,
    required List<int> mainCityFks,
  }) async {
    List<dynamic> data = [];

    data = await Api().get(
        url: url + 'client/invoice/get_dateinstall_all_maincity.php?fk_country=$fkCountry&maincity_fks[]=$mainCityFks');

    return _mapJsonToList(data);
  }

  static Future<List<AppointmentModel>> getDateInstallationFkUser(
      {required String fkCountry, required String fkUser}) async {
    List<dynamic> data = [];

    data =
        await Api().get(url: url + 'client/invoice/get_dateinstall_all_user.php?fk_country=$fkCountry&fk_user=$fkUser');

    return _mapJsonToList(data);
  }

  static Future<List<AppointmentModel>> getDateInstallationAll({required String fkCountry}) async {
    List<dynamic> data = [];

    data = await Api().get(url: url + 'client/invoice/get_all_date_install.php?fk_country=$fkCountry');

    return _mapJsonToList(data);
  }

  static Future<List<AppointmentModel>> getDateInstallationMix({
    required String fkCountry,
    required String fkUser,
    required List<int> mainCityFks,
  }) async {
    List<dynamic> data = [];

    data = await Api().get(
        url: url +
            'client/invoice/get_dateinstall_mix.php?fk_country=$fkCountry&fk_user=$fkUser&maincity_fks[]=$mainCityFks');

    return _mapJsonToList(data);
  }

  static Future<List<AppointmentModel>> _mapJsonToList(List<dynamic> data) async {
    List<AppointmentModel> events = await compute<List<dynamic>, List<AppointmentModel>>(_convertToEvents, data);

    return events;
  }

  static List<AppointmentModel> _convertToEvents(List<dynamic> list) {
    return List<Map<String, dynamic>>.from(list).map<AppointmentModel>((e) => AppointmentModel.fromJson(e)).toList();
  }
}
