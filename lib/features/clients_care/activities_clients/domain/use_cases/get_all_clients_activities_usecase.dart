import 'package:crm_smart/features/clients_care/activities_clients/data/models/client_activity_model.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/clients_activities_repo.dart';

@injectable
class GetAllClientsActivitiesUseCase extends BaseUsecase<
   ResponseWrapper<List<ClientActivityModel>>, GetAllClientsActivitiesParams> {
  GetAllClientsActivitiesUseCase(this.repository);

  final ClientsActivitiesRepository repository;

  @override
  Future<ResponseWrapper<List<ClientActivityModel>>> call(
      GetAllClientsActivitiesParams params) {
    return repository.getAllClientsActivities(params.toMap());
  }
}

class GetAllClientsActivitiesParams {
  final int page;
  final String? filter;
  final int? limit;
  final String? fk_client;
  final String? fk_user;
  final String? priority;
  final String? from;
  final String? to;

  GetAllClientsActivitiesParams({
    required this.page,
    required this.limit,
    this.filter,
    this.fk_client,
    this.fk_user,
    this.priority,
    this.from,
    this.to,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

     map['page'] = page;
    if (filter != null) map['filter'] = filter;
    if (limit != null) map['limit'] = limit;
    if (fk_client != null) map['type'] = fk_client;
    if (fk_user != null) map['type'] = fk_user;
    if (priority != null) map['type'] = priority;
    if (from != null) map['type'] = from;
    if (to != null) map['type'] = to;

    return map;
  }
}
