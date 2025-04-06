import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/common/usecases/base_usecase.dart';
import 'package:crm_smart/core/services/api/result.dart';
import 'package:crm_smart/features/home/domain/repositories/pending_approvals_repository.dart';
import 'package:crm_smart/features/home/presentation/pages/mob_home_page.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class CacheTokenUsecase
    extends UseCaseNoParam<Result<ResponseWrapper<HomeStatisticsModel>>> {
  CacheTokenUsecase(this._repository);

  final PendingApprovalsRepository _repository;

  @override
  Future<Result<ResponseWrapper<HomeStatisticsModel>>> call() async {
    return _repository.getHomeStatistices();
  }
}
