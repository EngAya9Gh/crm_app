class PaginationResponseWrapper<T> {
  // result: success, code: 200
  final T data;

  final String? status;
  final String? code;
  final int? count;

  const PaginationResponseWrapper({
    required this.data,
    this.status,
    this.code,
    this.count,
  });

  factory PaginationResponseWrapper.fromJson(Map<String, dynamic> response) {
    return PaginationResponseWrapper(
      data: response['data'] ?? response['message'],
      status: response['result'],
      code: response['code'] == null ? null : response['code'].toString(),
      count: response['count'],
    );
  }

  PaginationResponseWrapper copyWith({
    T? data,
    String? status,
    String? code,
    int? count,
  }) {
    return PaginationResponseWrapper(
      data: data ?? this.data,
      status: status ?? this.status,
      code: code ?? this.code,
      count: count ?? this.count,
    );
  }
}
