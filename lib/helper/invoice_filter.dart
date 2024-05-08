import 'package:async/async.dart';
import 'package:crm_smart/model/usermodel.dart';

import '../core/common/helpers/api_data_handler.dart';
import '../core/services/api/api_services.dart';
import '../core/services/di/di_container.dart';
import '../core/utils/end_points.dart';
import '../model/invoiceModel.dart';
import '../model/maincitymodel.dart';

class InvoiceFilter {
  late UserModel _currentUser;
  late List<MainCityModel>? _listSelectedRegions;
  late List<CityModel> _selectedCities;
  late String? _state;
  late String _endpoint;
  late ApiServices _apiServices;

  InvoiceFilter({
    required UserModel currentUser,
    List<MainCityModel>? listSelectedRegions,
    List<CityModel> selectedCities = const [],
    String? state,
    String endpoint = '',
  }) {
    _currentUser = currentUser;
    _listSelectedRegions = listSelectedRegions;
    _selectedCities = selectedCities;
    _state = state;
    _endpoint = endpoint;
    _apiServices = getIt();
    _apiServices.changeBaseUrl(EndPoints.baseUrls.url);
  }

  Future<CancelableOperation<List<InvoiceModel>>?> execute() async {
    final type = _handleRequestBody();

    _state = _handleState();

    final queryParameters = _prepareQueryParams();

    final data = _prepareData();

    final response = await _apiServices.post(
      endPoint: _endpoint,
      queryParameters: queryParameters,
      data: data,
    );

    final invoices = _parseInvoiceModels(response);

    return CancelableOperation.fromValue(invoices);
  }

  List<InvoiceModel> _parseInvoiceModels(dynamic response) =>
      apiDataHandler(response)
          .map<InvoiceModel>((e) => InvoiceModel.fromJson(e))
          .toList();

  bool _checkIfAllRegions() =>
      _listSelectedRegions?.any((element) => element.id_maincity == '0') ??
      false;

  Map<String, dynamic> _prepareQueryParams() {
    final queryParameters = {
      'fk_country': _currentUser.fkCountry,
      if (_state != null) 'state': _state,
    };

    if (_selectedCities.isNotEmpty) {
      final ids = _selectedCities.map((val) => val.id_city).join(',');
      queryParameters['city_fks'] = "($ids)";
    } else {
      for (final val in _listSelectedRegions!) {
        queryParameters['maincity_fks[]'] = val.id_maincity;
      }
    }

    return queryParameters;
  }

  String _handleRequestBody() => _selectedCities.isNotEmpty
      ? _handleBodyTypeForCities()
      : _handleBodyTypeForRegions();

  String _handleBodyTypeForCities() => 'allmixCity';

  String _handleBodyTypeForRegions() {
    if (_checkIfAllRegions() && _state == 'الكل')
      return 'all';
    else if (_checkIfAllRegions() && _state != 'الكل')
      return 'allmaincity';
    else if (!_checkIfAllRegions() && _state == 'الكل')
      return 'allstate';
    else if (!_checkIfAllRegions() && _state != 'الكل') return 'allmix';
    return 'allmaincity';
  }

  Map<String, String> _prepareData() => _selectedCities.isNotEmpty
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

  String? _handleState() {
    switch (_state) {
      case 'بالإنتظار':
        return "wait";
      case 'تم التركيب':
        return '1';
      case 'معلق':
        return 'suspend';
      case 'غير جاهز':
        return 'notReady';
      default:
        return _state;
    }
  }
}
