import '../../../../../model/communication_modle.dart';

abstract class FilterStrategy {
  bool apply(CommunicationModel element);
}

class SearchQueryFilter implements FilterStrategy {
  final String? query;

  SearchQueryFilter(this.query);

  @override
  bool apply(CommunicationModel element) {
    return query == null || element.searchString(query!);
  }
}

class RegionFilter implements FilterStrategy {
  final String? regionId;

  RegionFilter(this.regionId);

  @override
  bool apply(CommunicationModel element) {
    return regionId == null || element.fk_regoin == regionId;
  }
}

class StatusFilter implements FilterStrategy {
  final String? status;

  StatusFilter(this.status);

  @override
  bool apply(CommunicationModel element) {
    if (status == null) return true;
    if (status == 'تم الترحيب') {
      return element.dateCommunication != null;
    } else if (status == 'لم يتم الترحيب') {
      return element.dateCommunication == null;
    }
    return true;
  }
}
