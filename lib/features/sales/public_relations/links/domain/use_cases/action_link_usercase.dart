import 'package:injectable/injectable.dart';

import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../../data/models/important_link_model.dart';
import '../repositories/important_links_repo.dart';

@injectable
class ActionLinkUsecase extends BaseUsecase<
    Result<ResponseWrapper<ImportantLinkModel>>, ActionLinksParams> {
  ActionLinkUsecase(this.repository);

  final ImportantLinksRepo repository;

  @override
  Future<Result<ResponseWrapper<ImportantLinkModel>>> call(
      ActionLinksParams params) {
    if (params.id != null) {
      return repository.editLink(params.body, params.id.toString());
    }
    return repository.addLink(params.body);
  }
}

class ActionLinksParams {
  final String title;
  final String link;
  final String notes;
  final String address;
  final String clause;
  final String department;
  final String user_id;

  final String? id;

  ActionLinksParams({
    required this.title,
    required this.link,
    required this.notes,
    required this.address,
    required this.clause,
    required this.department,
    required this.user_id,
    this.id,
  });

  Map<String, dynamic> get body => id != null
      ? {
          "title": title,
          'link': link,
          'notes': notes,
          'address': address,
          'department': department,
          'clause': clause,
          'user_id': user_id,
        }
      : {
          "title": title,
          'link': link,
          'notes': notes,
          'address': address,
          'department': department,
          'clause': clause,
          'user_id': user_id,
        };

  Map<String, dynamic> get params {
    final map = <String, dynamic>{};

    if (id != null) map["id"] = id;

    return map;
  }
}
