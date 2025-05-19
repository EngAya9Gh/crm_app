import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/elevation_model.dart';
import '../repositories/sys_support_rating_repo.dart';

@lazySingleton
class GetElevationSysSupportUseCase extends BaseUsecase<
    Result<ResponseWrapper<List<ElevationModel>>>, GetRatingParams> {
  GetElevationSysSupportUseCase(this._repository);

  final ElevationAcrossSystemRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<ElevationModel>>>> call(
    GetRatingParams params,
  ) async {
    return await _repository.getRating(params);
  }
}

class GetRatingParams {
  final int page;
  final int limit;
  final List<double> rates;
  final String? client_id;
  final int? rate_type;
  final String? search;
  final String? from;
  final String? to;

  const GetRatingParams({
    required this.page,
    this.limit = 10,
    this.rates = const [],
    this.client_id,
    this.rate_type,
    this.search,
    this.from,
    this.to,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'page': this.page,
      'limit': this.limit,
      'client_id': this.client_id,
      'rate_type': this.rate_type,
      'search': this.search,
      'from': this.from,
      'to': this.to,
    };

    // إضافة التقييمات كمعاملات متعددة
    if (rates.isNotEmpty) {
      for (int i = 0; i < rates.length; i++) {
        map['rate[$i]'] = rates[i];
      }
    }

    return map
      ..removeWhere(
          (key, value) => value == null || value == 'null' || value == '');
  }

  Map<String, dynamic> toMapClientProfile() {
    return {
      'client_id': this.client_id,
      "no_pagination": 1,
    }..removeWhere(
        (key, value) => value == null || value == 'null' || value == '');
  }

  GetRatingParams copyWith({
    int? page,
    int? limit,
    List<double>? rates,
    String? client_id,
    int? rate_type,
    String? search,
    String? from,
    String? to,
  }) {
    return GetRatingParams(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      rates: rates ?? this.rates,
      client_id: client_id ?? this.client_id,
      rate_type: rate_type ?? this.rate_type,
      search: search ?? this.search,
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }
}
