import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/product_type_enum.dart';
import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../repositories/employees_sales_reports_repo.dart';

@lazySingleton
class GetEmployeesSalesReportsUsecase extends UseCase<
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
  final String fkCountry;
  final String? idUser;
  final String? idRegion;
  final ReportTypeEnum type;
  final ProductTypeEnum? typeProduct;
  final bool? isMarketing;
  final String? dateFrom;
  final String? dateTo;

  const GetEmployeesSalesReportsParams({
    required this.fkCountry,
    required this.type,
    this.idUser,
    this.idRegion,
    this.typeProduct,
    this.isMarketing,
    this.dateFrom,
    this.dateTo,
  });

  Map<String, dynamic> toParams() {
    return {
      'fk_country': fkCountry,
      'id_user': idUser,
      'id_regoin': idRegion,
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
