import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/common/widgets/profile_comments_model.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/participate_list_repository.dart';

@injectable
class AddParticipateCommentUsecase extends BaseUsecase<
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
