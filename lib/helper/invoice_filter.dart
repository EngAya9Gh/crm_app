import 'package:async/async.dart';

import '../core/api/api_services.dart';
import '../core/common/helpers/api_data_handler.dart';
import '../core/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/invoiceModel.dart';
import '../model/maincitymodel.dart';

class InvoiceFilter {
  static Future<CancelableOperation<List<InvoiceModel>>?> execute({
    List<MainCityModel>? listSelectedRegions,
    List<CityModel> selectedCities = const [],
    String? state,
    String endpoint = '',
  }) async {
    final ApiServices apiServices = getIt();
    apiServices.changeBaseUrl(EndPoints.baseUrls.url);

    String type = '';
    Map<String, dynamic> queryParameters = {};
    Map<String, dynamic> data = {};
    bool isAllRegions = _checkIfAllRegions(listSelectedRegions ?? []);

    // handle state and type
    type = _handleRequestBody(
      isAllRegions: isAllRegions,
      selectedCities: selectedCities,
      type: type,
      state: state,
    );

    state = _handleState(state);

    queryParameters = _prepareQueryParams(
      listSelectedMainCity: listSelectedRegions ?? [],
      selectedCities: selectedCities,
      state: state,
    );

    data = _prepareData(
      isFilterByCities: selectedCities.isNotEmpty,
      type: type,
    );

    final response = await apiServices.post(
      endPoint: endpoint,
      queryParameters: queryParameters,
      data: data,
    );

    final List<InvoiceModel> invoices = apiDataHandler(response)
        .map<InvoiceModel>((e) => InvoiceModel.fromJson(e))
        .toList();

    return CancelableOperation.fromValue(invoices);
  }

  static bool _checkIfAllRegions(List<MainCityModel> listSelectedMainCity) =>
      listSelectedMainCity.any((element) => element.id_maincity == '0');

  static Map<String, dynamic> _prepareQueryParams({
    required List<MainCityModel> listSelectedMainCity,
    required List<CityModel> selectedCities,
    String? state,
  }) {
    final Map<String, dynamic> queryParameters = {};

    if (state != null) {
      queryParameters['state'] = state;
    }

    if (selectedCities.isNotEmpty) {
      final String ids = selectedCities.map((val) => val.id_city).join(', ');
      queryParameters['city_fks'] = "($ids)";
      return queryParameters;
    }

    return listSelectedMainCity.fold(queryParameters, (acc, val) {
      acc['maincity_fks[]'] = val.id_maincity;
      return acc;
    });
  }

  static String _handleRequestBody({
    required List<CityModel> selectedCities,
    required String type,
    required bool isAllRegions,
    String? state,
  }) {
    if (selectedCities.isNotEmpty) {
      return _handleBodyTypeForCities();
    }
    return _handleBodyTypeForRegions(isAllRegions, state);
  }

  static String _handleBodyTypeForCities() {
    return 'allmixCity';
  }

  static String _handleBodyTypeForRegions(bool isAllRegions, String? state) {
    if (isAllRegions && state == 'الكل')
      return 'all';
    else if (isAllRegions && state != 'الكل')
      return 'allmaincity';
    else if (!isAllRegions && state == 'الكل')
      return 'allstate';
    else if (!isAllRegions && state != 'الكل') return 'allmix';
    return 'allmaincity';
  }

  static Map<String, String> _prepareData({
    required String type,
    required bool isFilterByCities,
  }) {
    if (isFilterByCities) {
      return _prepareDataForCities(type);
    }
    return _prepareDataForRegions(type);
  }

  static Map<String, String> _prepareDataForCities(String type) {
    if (type == 'allmixCity') {
      return {'allmixCity': 'allmixCity'};
    }
    return {'allmixCity': 'allmixCity'};
  }

  static Map<String, String> _prepareDataForRegions(String type) {
    if (type == 'all') {
      return {};
    } else if (type == 'allmaincity') {
      return {'allmaincity': 'allmaincity'};
    } else if (type == 'allstate') {
      return {'allstate': 'allstate'};
    } else if (type == 'allmix') {
      return {'allmix': 'allmix'};
    }
    return {'allmaincity': 'allmaincity'};
  }

  static String? _handleState(String? state) {
    switch (state) {
      case 'بالإنتظار':
        return "wait";
      case 'تم التركيب':
        return '1';
      case 'معلق':
        return 'suspend';
      case 'غير جاهز':
        return 'notReady';
      default:
        return state;
    }
  }
}
