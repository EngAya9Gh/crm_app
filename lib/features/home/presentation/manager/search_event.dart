part of 'search_cubit.dart';

@freezed
class SearchEvent with _$SearchEvent {
  const factory SearchEvent.search(String query) = _Search;
} 