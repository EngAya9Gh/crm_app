import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/features/links/data/models/link_model.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/links_repo.dart';
import '../data_sources/link_datasource.dart';

@Injectable(as: LinksImportantRepository)
class LinkRepositoryImpl extends LinksImportantRepository {
  LinkRepositoryImpl(this.datasource);

  final LinkDatasource datasource;

  @override
  Future<Result<ResponseWrapper<LinkImportantModel>>> addLink(
      Map<String, dynamic> body) {
    // TODO: implement addLink
    return toApiResult(() => datasource.addLink(body: body));
  }

  @override
  Future<Result<ResponseWrapper<LinkImportantModel>>> editLink(
      Map<String, dynamic> body, String id) {
    // TODO: implement editLink
    return toApiResult(() => datasource.updateLink(body: body, id: id));
  }

  @override
  Future<Result<ResponseWrapper<List<LinkImportantModel>>>> getLinkImportant() {
    // TODO: implement getLinkImportant
    return toApiResult(() => datasource.getLink());
  }
}
