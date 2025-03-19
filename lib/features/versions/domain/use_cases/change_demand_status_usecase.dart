import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/versions_repo.dart';

@lazySingleton
class ChangeDemandStatusUsecase extends BaseUsecase<Result<ResponseWrapper<DemandModel>>, DemandChangeStatusOrCommentParams> {
  ChangeDemandStatusUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Result<ResponseWrapper<DemandModel>>> call(DemandChangeStatusOrCommentParams params) async {
    return await _repository.changeDemandStatus(params);
  }
}

class DemandChangeStatusOrCommentParams {
  final int idDemand;
  final String? status;
  final String? notes;
  final String? comment;
  const DemandChangeStatusOrCommentParams({
    required this.idDemand,
    this.status,
    this.notes,
    this.comment,
  });

  Map<String, dynamic> toMapAddComment() {
    final Map<String, dynamic> map = {
      'comment': comment,
    }..removeWhere((key, value) => value == null || value == '');

    return map;
  }

  Map<String, dynamic> toMapChangeStatus() {
    final Map<String, dynamic> map = {
      'status': status,
      'notes': notes,
    }..removeWhere((key, value) => value == null || value == '');

    return map;
  }
}
