import 'package:crm_smart/core/common/models/participate_model.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/services/api/api_utils.dart';
import '../../../../../core/services/api/result.dart';
import '../../domain/repositories/commission_collaborators_repo.dart';
import '../../domain/use_cases/get_commission_collaborators_usecase.dart';
import '../data_sources/commission_collaborators_datasource.dart';
import '../models/commission_collaborators_response.dart';

@Injectable(as: CommissionCollaboratorsRepository)
class ClientDeptRepoImpl implements CommissionCollaboratorsRepository {
  final CommissionForCollaboratorsDatasource datasource;

  ClientDeptRepoImpl(this.datasource);

  @override
  Future<Either<String, CommissionCollaboratorsResponseModel>> getCommissionCollaborators(CommissionCollaboratorsParams params) async {
    try {
      final response = await datasource.getCommissionCollaborators(params);
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ParticipateModel>>> getParticipateSelect() async {
    try {
      final response = await datasource.getParticipate();
      return Right(response);
    } catch (e) {
      return Left(e.toString());
    }

  }
}
