import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/communication_list/data/models/distinctive_client.dart';
import 'package:crm_smart/features/manage_participates/data/data_sources/participates_list_datasource.dart';
import 'package:crm_smart/features/manage_participates/data/models/participatModel.dart';
import 'package:crm_smart/features/manage_participates/domain/repositories/participate_list_repository.dart';
import 'package:injectable/injectable.dart';



@Injectable(as: ParticipateListRepository)
class ParticipateListRepositoryImpl implements ParticipateListRepository {
  final ParticipatesListDatasource datasource;

  ParticipateListRepositoryImpl(this.datasource);

  @override
  Future<Result<ResponseWrapper<List<ParticipateModel>>>> getParticipateList(Map<String, dynamic> body) {
    return toApiResult(() => datasource.getParticipateList(body));
  }
}
