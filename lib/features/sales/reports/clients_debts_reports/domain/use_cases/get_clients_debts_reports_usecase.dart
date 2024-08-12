import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/reports/report_type_enum.dart';
import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/region_model.dart';
import '../../../../../../core/use_case/use_case.dart';
import '../../../../../../model/usermodel.dart';
import '../repositories/clients_debts_reports_repo.dart';

@lazySingleton
class GetClientsDebtsReportsUsecase extends UseCase<
    Either<String, PaginationResponseWrapper>, GetClientsDebtsReportsParams> {
  GetClientsDebtsReportsUsecase(this._repository);

  final ClientsDebtsReportsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetClientsDebtsReportsParams params,
  ) async {
    return await _repository.getClientsDebtsReports(params);
  }
}

class GetClientsDebtsReportsParams {
  final ReportTypeEnum type;
  final RegionModel? region;
  final UserModel? user;
  final bool? isMarketing;

  const GetClientsDebtsReportsParams({
    required this.type,
    this.region,
    this.user,
    this.isMarketing,
  });

  Map<String, dynamic> toParams() {
    return {
      'id_regoin': region?.regionId,
      'id_user': user?.id,
      'ismarketing': isMarketing == true ? 1 : null,
    }..removeWhere((key, value) => value == null || value == '');
  }

  Map<String, dynamic> toBody() {
    return {
      'type': type.toParam,
    };
  }
}
