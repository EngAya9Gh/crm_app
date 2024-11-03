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
  final String? state;

  GetAllClientsActivitiesParams({
    required this.page,
    required this.limit,
    this.filter,
    this.fk_client,
    this.fk_user,
    this.priority,
    this.from,
    this.to,
    this.state,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

     map['page'] = page;
    if (filter != null) map['filter'] = filter;
    if (limit != null) map['limit'] = limit;
    if (fk_client != null) map['fk_client'] = fk_client;
    if (fk_user != null) map['fk_user'] = fk_user;
    if (priority != null) map['priority'] = priority;
    if (from != null && from != "") map['from'] = from;
    if (to != null && to != "") map['to'] = to;
    if (state != null) map['state'] = state;

    return map;
  }
}
