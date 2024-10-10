import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/invoice_type_enum.dart';
import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/regions_sales_reports_repo.dart';

@lazySingleton
class GetRegionsSalesReportsUsecase extends BaseUsecase<
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
  final String? regionId;
  final InvoiceTypeEnum? invoiceType;

  const GetRegionsSalesReportsParams({
    required this.type,
    this.typeProduct,
    this.isMarketing,
    this.dateFrom,
    this.dateTo,
    this.regionId,
    this.invoiceType,
  });

  Map<String, dynamic> toParams() {
    return {
      'product': typeProduct?.index,
      'without_withdrawn': invoiceType?.value==InvoiceTypeEnum.withdrawnInvoices.value?1:null,
      'ismarketing': isMarketing == true ? 1 : null,
      'id_regoin': regionId,
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
