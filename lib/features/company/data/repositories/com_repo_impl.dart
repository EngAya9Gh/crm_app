import 'package:crm_smart/common/models/response_wrapper/response_wrapper.dart';
import 'package:crm_smart/core/api/api_utils.dart';
import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/features/company/data/models/company_com_model.dart';
import 'package:crm_smart/features/links/data/models/link_model.dart';
import 'package:crm_smart/features/manage_users/data/data_sources/users_datasource.dart';
import 'package:crm_smart/features/manage_users/domain/repositories/users_repository.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/comment_repo.dart';
import '../data_sources/company_datasource.dart';

@Injectable(as: CompanyRepository)
class CompanyRepositoryImpl extends CompanyRepository {
  CompanyRepositoryImpl(this.datasource);

  final CommentCompanyDatasource datasource;



  @override
  Future<Result<ResponseWrapper<CompanyCommentModel>>> addCompanyComment(Map<String, dynamic> body,String fk) {
    // TODO: implement addCompany
    return toApiResult(() => datasource.addComment(body: body, fk: fk));

  }

  @override
  Future<Result<ResponseWrapper<List<CompanyCommentModel>>>> getCommentsCompany(String fk) {
    // TODO: implement getCommentsCompany
    return toApiResult(() => datasource.getCommment( fk));
  }
}
