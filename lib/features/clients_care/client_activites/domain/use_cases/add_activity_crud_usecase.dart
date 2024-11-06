
import 'package:crm_smart/features/clients_care/client_activites/domain/repositories/crud_activities_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../client_communications/data/models/client_activity_model.dart';

@injectable
class AddActivityCrudUseCase extends BaseUsecase<
    ResponseWrapper<ClientActivityModel>, AddActivityCrudParams> {
  AddActivityCrudUseCase(this.repository);

  final CrudActivitiesRepository repository;

  @override
  Future<ResponseWrapper<ClientActivityModel>> call(
      AddActivityCrudParams params) {
    return repository.addCrudActivity(params);
  }
}

class AddActivityCrudParams {
  final String activityTypeId;
  final String name;
  final String fkClient;
  final String startDate;
  final String endDate;
  final int wholeDay;
  final String description;
  final String priority;
  final String state;

  AddActivityCrudParams({
    required this.activityTypeId,
    required this.name,
    required this.fkClient,
    required this.startDate,
    required this.endDate,
    required this.wholeDay,
    required this.description,
    required this.priority,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    map['activity_type_id'] = activityTypeId;
    map['name'] = name;
    map['fk_client'] = fkClient;
    map['startDate'] = startDate;
    if(endDate!='') {
      map['endDate'] = endDate;
    }
    map['whole_day'] = wholeDay;
    map['description'] = description;
    map['priority'] = priority;
    map['state'] = state;

    return map;
  }

}
