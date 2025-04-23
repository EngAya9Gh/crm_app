import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/clients_care/recommended_client/data/models/recommended_client_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/enums/reports/care_report_type_enum.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/recommended_client_reports_repo.dart';

@lazySingleton
class GetRecommendClientsReportsUsecase
    extends BaseUsecase<Result<ResponseWrapper<List<RecommendClientsReports>>>, GetRecommendedClientsReportsParams> {
  GetRecommendClientsReportsUsecase(this._repository);

  final RecommendedClientsReportsRepo _repository;

  @override
  Future<Result<ResponseWrapper<List<RecommendClientsReports>>>> call(GetRecommendedClientsReportsParams params) async {
    return await _repository.getRecommendClientsReports(params);
  }
}

class GetRecommendedClientsReportsParams {
  final String? from;
  final String? to;

  GetRecommendedClientsReportsParams({
    this.from,
    this.to,
  });
  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
    }..removeWhere((key, value) => value == null || value == '');
  }

  GetRecommendedClientsReportsParams copyWith({
    String? from,
    String? to,
  }) {
    return GetRecommendedClientsReportsParams(
      from: from ?? this.from,
      to: to ?? this.to,
    );
  }
}
