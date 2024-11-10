import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../clients_care/client_communications/data/models/client_activity_model.dart';
import '../repositories/client_activities_repo.dart';

@injectable
class GetClientActivitiesUseCase extends BaseUsecase<
   ResponseWrapper<List<ClientActivityModel>>, GetAllClientActivitiesParams> {
  GetClientActivitiesUseCase(this.repository);

  final ClientActivitiesRepository repository;

  @override
  Future<ResponseWrapper<List<ClientActivityModel>>> call(
      GetAllClientActivitiesParams params) {
    return repository.getClientActivities(params.toMap(),params.query());
  }
}

class GetAllClientActivitiesParams {
  final String clientId;
  final int page;
  final String? filter;
  final int? limit;
  final String? fk_client;
  final String? fk_user;
  final String? priority;
  final String? from;
  final String? to;
  final String? state;

  GetAllClientActivitiesParams({
    required this.clientId,
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
  String query() {
    return clientId;
  }
}
