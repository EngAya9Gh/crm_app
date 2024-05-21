class PaginationResponseWrapper {
  final dynamic data;
  final int? count;

  const PaginationResponseWrapper({required this.data, this.count});

  PaginationResponseWrapper copyWith({
    dynamic data,
    int? count,
  }) {
    return PaginationResponseWrapper(
      data: data ?? this.data,
      count: count ?? this.count,
    );
  }
}
