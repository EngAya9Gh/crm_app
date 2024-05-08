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
    handleState();
  }

  bool _checkIfAllRegions() =>
      listSelectedRegions?.any((element) => element.id_maincity == '0') ??
      false;

  Map<String, dynamic> prepareQueryParams({
    int page = 1,
    int limit = 15,
    required String fkCountry,
  }) {
    print("page => $page");
    final queryParameters = {
      'fk_country': fkCountry,
      if (state != null) 'state': state,
      'page': page,
      'limit': limit,
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

  String _handleRequestBody() => selectedCities.isNotEmpty
      ? _handleBodyTypeForCities()
      : _handleBodyTypeForRegions();

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

  Map<String, String> prepareData() => selectedCities.isNotEmpty
      ? _prepareDataForCities()
      : _prepareDataForRegions();

  Map<String, String> _prepareDataForCities() => {'allmixCity': 'allmixCity'};

  Map<String, String> _prepareDataForRegions() {
    switch (_handleRequestBody()) {
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

  String? handleState() {
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
