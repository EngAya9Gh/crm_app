import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/versions/data/models/demand_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/versions_repo.dart';

@lazySingleton
class AddDemandUsecase extends BaseUsecase<Result<ResponseWrapper<DemandModel>>, AddOrUpdateDemandParams> {
  AddDemandUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Result<ResponseWrapper<DemandModel>>> call(AddOrUpdateDemandParams params) async {
    return await _repository.addDemand(params);
  }
}

class AddOrUpdateDemandParams {
  final int? idDemand;
  final int? idManagement;
  final String title;
  final String goal;
  final String description;
  final String? notes;
  const AddOrUpdateDemandParams({
    this.idDemand,
    this.idManagement,
    required this.goal,
    required this.title,
    required this.description,
    this.notes,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> map = {
      'title': title,
      'goal': goal,
      'description': description,
      'notes': notes,
      'management_id': idManagement,
    }..removeWhere((key, value) => value == null || value == '');

    return map;
  }
}
