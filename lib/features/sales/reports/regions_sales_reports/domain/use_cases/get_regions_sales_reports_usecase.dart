import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/regions_sales_reports_repo.dart';

@lazySingleton
class GetRegionsSalesReportsUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetRegionsSalesReportsParams> {
  GetRegionsSalesReportsUsecase(this._repository);

  final RegionsSalesReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetRegionsSalesReportsParams params,
  ) async {
    return await _repository.getRegionsSalesReports(params);
  }
}

class GetRegionsSalesReportsParams {
  final ReportTypeEnum type;
  final ProductTypeEnum? typeProduct;
  final bool? isMarketing;
  final String? dateFrom;
  final String? dateTo;

  const GetRegionsSalesReportsParams({
    required this.type,
    this.typeProduct,
    this.isMarketing,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
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
