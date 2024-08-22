import 'package:injectable/injectable.dart';

import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/company_com_model.dart';
import '../repositories/comment_repo.dart';

@injectable
class GetCommentUsecase extends BaseUsecase<
    Result<ResponseWrapper<List<CompanyCommentModel>>>, GetCommentParams> {
  GetCommentUsecase(this.repository);

  final CompanyRepository repository;

  @override
  Future<Result<ResponseWrapper<List<CompanyCommentModel>>>> call(
      GetCommentParams params) {
    // TODO: implement call
    return repository.getCommentsCompany(params.fk_comment);
  }
}

class GetCommentParams {
  GetCommentParams(this.fk_comment);

  late String fk_comment;
}
