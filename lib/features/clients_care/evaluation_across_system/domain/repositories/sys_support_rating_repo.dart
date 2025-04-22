import 'package:dartz/dartz.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/services/api/result.dart';
import '../../../../../model/communication_modle.dart';
import '../../../periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart';
import '../../data/models/elevation_model.dart';
import '../use_cases/get_elevation_sys_support_use_case.dart';

abstract class ElevationAcrossSystemRepo {


  Future<Result<ResponseWrapper<List<ElevationModel>>>> getRating(GetRatingParams params);
}
