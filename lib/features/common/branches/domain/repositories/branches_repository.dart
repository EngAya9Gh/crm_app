import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/location/branch_model.dart';
import '../use_cases/get_branches_by_id_country_use_case.dart';

abstract class BranchesRepository {
  Future<Either<String, List<BranchModel>>> getBranchesByIdCountry(
    GetBranchesByIdCountryParams params,
  );
}
