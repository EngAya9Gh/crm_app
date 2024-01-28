import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:crm_smart/features/manage_users/domain/repositories/users_repository.dart';
import 'package:crm_smart/model/usermodel.dart';
import 'package:injectable/injectable.dart';
import '../../../../common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/link_model.dart';
import '../repositories/links_repo.dart';

@injectable
class GetLinkUsecase
    extends UseCaseNoParam<Result<ResponseWrapper<List<LinkImportantModel>>>> {
  GetLinkUsecase(this.repository);

  final LinksImportantRepository repository;

  @override
  Future<Result<ResponseWrapper<List<LinkImportantModel>>>> call() {
    return repository.getLinkImportant();
  }
}