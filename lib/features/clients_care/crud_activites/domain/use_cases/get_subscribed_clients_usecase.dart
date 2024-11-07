import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../support/dates_table/data/models/subscribed_client_model.dart';
import '../repositories/crud_activities_repo.dart';

@injectable
class GetSubscribedClientsUseCase extends BaseUsecase<
    ResponseWrapper<List<SubscribedClientModel>>, Map<String,dynamic> > {
  GetSubscribedClientsUseCase(this.repository);

  final CrudActivitiesRepository repository;

  @override
  Future<ResponseWrapper<List<SubscribedClientModel>>> call(
      Map<String,dynamic> params) {
    return repository.getSubscribedClients(params);
  }
}

class GetSubscribedClientsParams {

  GetSubscribedClientsParams();

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    return map;
  }
}
