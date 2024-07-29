import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/helper_functions.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../data/models/client_marketing_meport_model.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class GetClientMarketingReportUsecase extends UseCase<
    Either<String, List<clientMarketingReportModel>>,
    GetClientMarketingReportParams> {
  GetClientMarketingReportUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Either<String, List<clientMarketingReportModel>>> call(
    GetClientMarketingReportParams params,
  ) {
    return repository.getClientMarketingReport(params);
  }
}

class GetClientMarketingReportParams {
  final String? from;
  final String? to;

  GetClientMarketingReportParams({
    this.from,
    this.to,
  });

  GetClientMarketingReportParams copyWith({
    String? from,
    String? to,
  }) {
    return GetClientMarketingReportParams(
      from: HelperFunctions.assignNullString(
          currentValue: this.from, newValue: from),
      to: HelperFunctions.assignNullString(currentValue: this.to, newValue: to),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
    };
  }
}
