import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_model.freezed.dart';
part 'pagination_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
@freezed
class PaginationModel<T> with _$PaginationModel<T?> {
  const PaginationModel._();

  const factory PaginationModel({
    required T? data,
    required Links links,
    required Meta meta,
  }) = _PaginationModel<T>;

  factory PaginationModel.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return _$PaginationModelFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object Function(T? value) toJsonT) {
    return _$PaginationModelToJson<T?>(this, toJsonT);
  }
}

@freezed
class Links with _$Links {
  const factory Links({
    String? first,
    String? last,
    dynamic prev,
    String? next,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    int? currentPage,
    int? from,
    int? lastPage,
    List<Link>? links,
    String? path,
    String? perPage,
    int? to,
    int? total,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@freezed
class Link with _$Link {
  const factory Link({
    String? url,
    String? label,
    bool? active,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}
