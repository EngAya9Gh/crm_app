import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/company_com_model.dart';
import '../repositories/comment_repo.dart';

@injectable
class AddCommentUsecase extends UseCase<
    Result<ResponseWrapper<CompanyCommentModel>>, AddCommentParams> {
  AddCommentUsecase(this.repository);

  final CompanyRepository repository;

  @override
  Future<Result<ResponseWrapper<CompanyCommentModel>>> call(
      AddCommentParams params) {
    return repository.addCompanyComment(
        params.body, params.fk_company.toString());
  }
}

class AddCommentParams {
  final String content;

  final String user_id;

  final String? fk_company;

  AddCommentParams({
    required this.content,
    required this.user_id,
    this.fk_company,
  });

  Map<String, dynamic> get body => {
        'content': content,
        'id_user': user_id,
      };
}
