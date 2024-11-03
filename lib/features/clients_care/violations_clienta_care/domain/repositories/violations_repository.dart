import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/management_model.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/data/models/violation_type_model.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/domain/use_cases/get_violations_usecase.dart';
import 'package:crm_smart/features/clients_care/violations_clienta_care/domain/use_cases/update_violadtion_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/violations_model.dart';
import '../use_cases/get_all_management_usecase.dart';
import '../use_cases/get_violation_types_usecase.dart';

abstract class ViolationsRepository {

  Future<Either<String, PaginationResponseWrapper>> getViolations(
      GetViolationsParams params,
      );

  Future<ResponseWrapper<ViolationModel>> updateViolation(
      UpdateViolationParams params);

  Future<ResponseWrapper<List<ManagementModel>>> getAllManagements(
      GetManagementsParams body);

  Future<ResponseWrapper<List<ViolationType>>> getAllViolationsTypes(
      GetViolationsTypesParams body);

}
