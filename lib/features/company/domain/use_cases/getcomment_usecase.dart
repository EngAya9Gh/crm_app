import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_users/domain/repositories/users_repository.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/company_com_model.dart';
import '../repositories/comment_repo.dart';

@injectable
class GetCommentUsecase
    extends UseCase<Result<ResponseWrapper<List< CompanyCommentModel>>>  ,GetCommentParams  > {
  GetCommentUsecase(this.repository);

  final CompanyRepository repository;

  @override
  Future<Result<ResponseWrapper<List< CompanyCommentModel>>>> call(GetCommentParams params) {
    // TODO: implement call
    return repository.getCommentsCompany(params.fk_comment);
  }

}
class GetCommentParams {
  GetCommentParams(this.fk_comment );

  late   String fk_comment;


}

