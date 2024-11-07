import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/client_activity_model.dart';
import '../repositories/care_activities_repo.dart';

@injectable
class UpdateCareActivityUseCase extends BaseUsecase<
   ResponseWrapper<ClientActivityModel>, UpdateCareActivityParams> {
  UpdateCareActivityUseCase(this.repository);

  final CareActivitiesRepository repository;

  @override
  Future<ResponseWrapper<ClientActivityModel>> call(
      UpdateCareActivityParams params) {
    return repository.updateActivity(params);
  }
}

class UpdateCareActivityParams {
  final String activityId;
  final String endDate;
  final String description;
  final String state;

  UpdateCareActivityParams({
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
