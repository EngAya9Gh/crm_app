import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/activity_type_model.dart';
import '../repositories/crud_activities_repo.dart';

@injectable
class GetActivityTypesUseCase extends BaseUsecase<
    ResponseWrapper<List<ActivityTypeModel>>, Map<String,dynamic> > {
  GetActivityTypesUseCase(this.repository);

  final CrudActivitiesRepository repository;

  @override
  Future<ResponseWrapper<List<ActivityTypeModel>>> call(
      Map<String,dynamic> params) {
    return repository.getActivityTypes(params);
  }
}

class GetActivityTypesParams {

  GetActivityTypesParams({required this.type});
  String type;
  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    if(type!=''){
      map["type"]= type;
    }
    return map;
  }
}
