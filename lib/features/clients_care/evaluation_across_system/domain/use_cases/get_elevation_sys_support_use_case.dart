import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/periodic_communication_type_enum.dart';
import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../model/communication_modle.dart';
import '../../data/models/elevation_model.dart';
import '../repositories/sys_support_rating_repo.dart';

@lazySingleton
class GetElevationSysSupportUseCase extends BaseUsecase<Result<ResponseWrapper<List<ElevationModel>>>, GetRatingParams> {
  GetElevationSysSupportUseCase(this._repository);

  final ElevationAcrossSystemRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<ElevationModel>>>> call(GetRatingParams params,) async {
    return await _repository.getRating(params);
  }
}

class GetRatingParams {
  final double? rate;
  final String? client_id;
  final int? rate_type;
  final String? search;
  final String? from;
  final String? to;

  const GetRatingParams({
    this.rate,
    this.client_id,
    this.rate_type,
    this.search,
    this.from,
    this.to,
  });

  Map<String, dynamic> toMap() {
    return {
      'rate': this.rate,
      'client_id': this.client_id,
      'rate_type': this.rate_type,
      'search': this.search,
      'from': this.from,
      'to': this.to,
    }..removeWhere((key,value)=>value==null||value=='null'||value=='');
  }

  factory GetRatingParams.fromMap(Map<String, dynamic> map) {
    return GetRatingParams(
      rate: map['rate'],
      client_id: map['client_id'],
      rate_type: map['rate_type'],
      search: map['search'],
      from: map['from'] ,
      to: map['to'] ,
    );
  }


}
