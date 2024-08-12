import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/usermodel.dart';
import '../repositories/clients_status_reports_repo.dart';

@lazySingleton
class GetClientsStatusReportsUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetClientsStatusReportsParams> {
  GetClientsStatusReportsUsecase(this._repository);

  final ClientsStatusReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientsStatusReportsParams params,
  ) async {
    return await _repository.getClientsStatusReports(params);
  }
}

class GetClientsStatusReportsParams {
  final ReportTypeEnum type;
  final ProductTypeEnum? typeProduct;
  final RegionModel? region;
  final UserModel? user;
  final bool? isMarketing;
  final String? dateFrom;
  final String? dateTo;

  const GetClientsStatusReportsParams({
    required this.type,
    this.typeProduct,
    this.region,
    this.user,
    this.isMarketing,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
      'id_regoin': region?.regionId,
      'id_user': user?.id,
      'product': typeProduct?.index,
      'ismarketing': isMarketing == true ? 1 : null,
      ..._prepareDateParams(),
    }..removeWhere((key, value) => value == null || value == '');
  }

  Map<String, dynamic> _prepareDateParams() {
    switch (type) {
      case ReportTypeEnum.dateYear:
        return {'year': dateFrom};
      case ReportTypeEnum.dateMonth:
        return {'month': "1-$dateFrom"};
      case ReportTypeEnum.dateDays:
        return {
          'from': dateFrom,
          'to': dateTo,
        };
      default:
        return {
          'month': dateFrom,
        };
    }
  }

  Map<String, dynamic> toBody() {
    return {
      'type': type.toParam,
    };
  }
}
