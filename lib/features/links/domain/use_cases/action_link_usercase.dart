import 'package:crm_smart/core/api/result.dart';
import 'package:crm_smart/core/use_case/use_case.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../data/models/link_model.dart';
import '../repositories/links_repo.dart';

@injectable
class ActionLinkUsecase extends UseCase<
    Result<ResponseWrapper<LinkImportantModel>>, ActionLinksParams> {
  ActionLinkUsecase(this.repository);

  final LinksImportantRepository repository;

  @override
  Future<Result<ResponseWrapper<LinkImportantModel>>> call(
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
  final String user_id;

  final String? id;

  ActionLinksParams({
    required this.title,
    required this.link,
    required this.notes,
    required this.address,
    required this.user_id,
    this.id,
  });

  Map<String, dynamic> get body => id != null
      ? {
          "title": title,
          'link': link,
          'notes': notes,
          'address': address,
          'user_id': user_id,
        }
      : {
          "title": title,
          'link': link,
          'notes': notes,
          'address': address,
          'user_id': user_id,
        };

  Map<String, dynamic> get params {
    final map = <String, dynamic>{};

    if (id != null) map["id"] = id;

    return map;
  }
}
