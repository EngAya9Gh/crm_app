import 'package:crm_smart/core/utils/app_constants.dart';

import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../model/maincitymodel.dart';

class InvoiceFilter {
  final List<MainCityModel>? listSelectedRegions;
  final List<CityModel> selectedCities;
  String? state;
  late final ApiServices apiServices;

  InvoiceFilter({
    this.listSelectedRegions,
    required this.selectedCities,
    this.state,
  }) {
    apiServices = getIt<ApiServices>();
  }

  bool _checkIfAllRegions() =>
      listSelectedRegions?.any((element) => element.id_maincity == '0') ??
      false;

  Map<String, dynamic> prepareQueryParams({
    int page = 1,
    int? limit,
    String? searchQuery,
    required String fkCountry,
  }) {
    final queryParameters = {
      'fk_country': fkCountry,
      if (state != null) 'state': state,
      'page': page,
      'limit': limit ?? AppConstants.kPerPage,
      'search_query': searchQuery,
    };

    if (selectedCities.isNotEmpty) {
      final ids = selectedCities.map((val) => val.id_city).join(',');
      queryParameters['city_fks'] = "($ids)";
    } else {
      for (final val in (listSelectedRegions ?? [])) {
        queryParameters['maincity_fks[]'] = val.id_maincity;
      }
    }

    return queryParameters;
  }

  String _handleBodyTypeForCities() => 'allmixCity';

  String _handleBodyTypeForRegions() {
    if (_checkIfAllRegions() && state == 'الكل')
      return 'all';
    else if (_checkIfAllRegions() && state != 'الكل')
      return 'allmaincity';
    else if (!_checkIfAllRegions() && state == 'الكل')
      return 'allstate';
    else if (!_checkIfAllRegions() && state != 'الكل') return 'allmix';
    return 'allmaincity';
  }

  // allmix
  // allCityState
  // allstate
  // allmixCity

  Map<String, String> prepareData(String type) {
    return selectedCities.isNotEmpty
        ? _prepareDataForCities()
        : _prepareDataForRegions(type);
  }

  Map<String, String> _prepareDataForCities() => {'allmixCity': 'allmixCity'};

  Map<String, String> _prepareDataForRegions(String type) {
    switch (type) {
      case 'all':
        return {};
      case 'allmaincity':
        return {'allmaincity': 'allmaincity'};
      case 'allstate':
        return {'allstate': 'allstate'};
      case 'allmix':
        return {'allmix': 'allmix'};
      default:
        return {'allmaincity': 'allmaincity'};
    }
  }
}
