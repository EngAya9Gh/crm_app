import 'package:dartz/dartz.dart';

import '../../../../../core/common/models/region_model.dart';
import '../use_cases/get_regions_by_id_country_usecase.dart';

abstract class RegionsRepository {
  Future<Either<String, List<RegionModel>>> getRegionsByIdCountry(
    GetRegionsByIdCountryParams params,
  );
}
