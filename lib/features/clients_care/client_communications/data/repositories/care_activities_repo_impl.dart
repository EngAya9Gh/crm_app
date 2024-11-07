import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/care_activities_repo.dart';
import '../../domain/use_cases/update_care_activity_usecase.dart';
import '../data_sources/care_activities_datasource.dart';
import '../models/client_activity_model.dart';

@Injectable(as: CareActivitiesRepository)
class CareListRepositoryImpl implements CareActivitiesRepository {
  final CareActivitiesDatasource datasource;

  CareListRepositoryImpl(this.datasource);

  @override
  Future<ResponseWrapper<List<ClientActivityModel>>> getAllCareActivities(Map<String, dynamic> body) {
    return datasource.getAllCareActivities(body);
  }
  @override
  Future<ResponseWrapper<ClientActivityModel>> updateActivity(UpdateCareActivityParams params) {
    return datasource.updateCareActivity(params);
  }

}