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
