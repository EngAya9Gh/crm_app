class PaginationResponseWrapper<T> {
  final T data;
  final String? status;
  final String? code;
  final int? count;
  final int? totalPages;

  const PaginationResponseWrapper({
    required this.data,
    this.status,
    this.code,
    this.count,
    this.totalPages,
  });

  factory PaginationResponseWrapper.fromJson(Map<String, dynamic> response) {
    return PaginationResponseWrapper(
      data: response['data'] ?? response['message'],
      status: response['result'],
      code: response['code'] == null ? null : response['code'].toString(),
      count: response['count'],
      totalPages: response['totalPages'],
    );
  }

  PaginationResponseWrapper copyWith({
    T? data,
    String? status,
    String? code,
    int? count,
    int? totalPages,
  }) {
    return PaginationResponseWrapper(
      data: data ?? this.data,
      status: status ?? this.status,
      code: code ?? this.code,
      count: count ?? this.count,
      totalPages: totalPages ?? this.totalPages,
    );
  }
}
