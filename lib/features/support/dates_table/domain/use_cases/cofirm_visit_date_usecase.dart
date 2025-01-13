import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../common/client_profile/client_dates_tab/data/models/client_date_model.dart';
import '../repositories/dates_table_repo.dart';
import 'change_date_to_done_usecase.dart';

@lazySingleton
class ConfirmVisitDateUsecase
    extends BaseUsecase<Either<String, ResponseWrapper<EventModel>>, ConfirmVisitDateParams> {
  ConfirmVisitDateUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, ResponseWrapper<EventModel>>> call(
      ConfirmVisitDateParams params,
  ) async {
    return await _repository.confirmVisitDate(params);
  }
}

class ConfirmVisitDateParams{
  final String idVisit;

  const ConfirmVisitDateParams({
    required this.idVisit,
  });
}