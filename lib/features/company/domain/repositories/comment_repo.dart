
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/api/result.dart';
import '../../data/models/company_com_model.dart';

abstract class CompanyRepository{
  Future<Result<ResponseWrapper<List<CompanyCommentModel>>>> getCommentsCompany(String param);
  Future<Result<ResponseWrapper<CompanyCommentModel>>> addCompanyComment(Map<String, dynamic> body,String fk);

}