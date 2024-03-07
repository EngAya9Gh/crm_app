import '../../../features/manage_participates/data/models/participatModel.dart';

abstract class ParticipateFilterHandler {
  ParticipateFilterHandler? _nextHandler;

  void setNextHandler(ParticipateFilterHandler nextHandler) {
    _nextHandler = nextHandler;
  }

  List<ParticipateModel> handleFiltering({
    required List<ParticipateModel> list,
    required String query,
    required String? cityId,
  }) {
    final filteredList = filter(list, query, cityId);
    if (_nextHandler != null) {
      return _nextHandler!
          .handleFiltering(list: filteredList, query: query, cityId: cityId);
    }
    return filteredList;
  }

  List<ParticipateModel> filter(
      List<ParticipateModel> list, String query, String? cityId);
}

class SearchFilterHandler extends ParticipateFilterHandler {
  @override
  List<ParticipateModel> filter(
      List<ParticipateModel> list, String query, String? cityId) {
    if (query.isEmpty) {
      return list;
    }
    final lowerCaseQuery = query.toLowerCase();
    return list.where((element) {
      return element.name_participate.toLowerCase().contains(lowerCaseQuery) ||
          element.numberbank_participate.toLowerCase().contains(lowerCaseQuery);
    }).toList();
  }
}

class CityFilterHandler extends ParticipateFilterHandler {
  @override
  List<ParticipateModel> filter(
      List<ParticipateModel> list, String query, String? cityId) {
    if (cityId == null || cityId.isEmpty) return list;
    return list.where((element) => element.fkCity == cityId).toList();
  }
}
