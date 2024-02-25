import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/widgets/profile_comments_model.dart';
import '../repositories/participate_list_repository.dart';

@injectable
class AddParticipateCommentUsecase extends UseCase<
    Result<ResponseWrapper<ProfileCommentModel>>, AddParticipateCommentParams> {
  AddParticipateCommentUsecase(this.repository);

  final ParticipateListRepository repository;

  @override
  Future<Result<ResponseWrapper<ProfileCommentModel>>> call(
      AddParticipateCommentParams params) {
    return repository.addCompanyComment(params.body);
  }
}

class AddParticipateCommentParams {
  final String content;
  final String? fkParticipate;

  AddParticipateCommentParams({required this.content, this.fkParticipate});
  Map<String, dynamic> get body => {
        'content': content,
        'participate_id': fkParticipate,
      };
}
