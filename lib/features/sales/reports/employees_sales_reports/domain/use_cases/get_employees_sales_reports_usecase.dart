import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/invoice_type_enum.dart';
import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/employees_sales_reports_repo.dart';

@lazySingleton
class GetEmployeesSalesReportsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetEmployeesSalesReportsParams> {
  GetEmployeesSalesReportsUsecase(this._repository);

  final EmployeesSalesReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetEmployeesSalesReportsParams params,
  ) async {
    return await _repository.getEmployeesSalesReports(params);
  }
}

class GetEmployeesSalesReportsParams {
  final ReportTypeEnum type;
  final ProductTypeEnum? typeProduct;
  final InvoiceTypeEnum? invoiceType;
  final bool? isMarketing;
  final String? dateFrom;
  final String? dateTo;

  const GetEmployeesSalesReportsParams({
    required this.type,
    this.typeProduct,
    this.isMarketing,
    this.dateFrom,
    this.dateTo,
    this.invoiceType,
  });

  Map<String, dynamic> toParams() {
    return {
      'product': typeProduct?.index,
      'without_withdrawn': invoiceType?.value==InvoiceTypeEnum.withdrawnInvoices.value?1:null,
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
