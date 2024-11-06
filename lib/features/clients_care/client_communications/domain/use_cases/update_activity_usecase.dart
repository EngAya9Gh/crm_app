import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/client_activity_model.dart';
import '../repositories/clients_activities_repo.dart';

@injectable
class UpdateActivityUseCase extends BaseUsecase<
   ResponseWrapper<ClientActivityModel>, UpdateActivityParams> {
  UpdateActivityUseCase(this.repository);

  final ClientsActivitiesRepository repository;

  @override
  Future<ResponseWrapper<ClientActivityModel>> call(
      UpdateActivityParams params) {
    return repository.updateActivity(params);
  }
}

class UpdateActivityParams {
  final String activityId;
  final String endDate;
  final String description;
  final String state;

  UpdateActivityParams({
    required this.activityId,
    required this.endDate,
    required this.description,
    required this.state,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

     map['endDate'] = endDate;
     map['description'] = description;
     map['state'] = state;

    return map;
  }
  String param() {
    return activityId;
  }
}
