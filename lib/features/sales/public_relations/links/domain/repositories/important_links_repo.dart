import 'package:dartz/dartz.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/result.dart';
import '../../data/models/important_link_model.dart';
import '../use_cases/get_important_links_usecase.dart';

abstract class ImportantLinksRepo {
  Future<Either<String, PaginationResponseWrapper>> getLinkImportant(
    GetImportantLinksParams params,
  );

  Future<Result<ResponseWrapper<ImportantLinkModel>>> addLink(
      Map<String, dynamic> body);

  Future<Result<ResponseWrapper<ImportantLinkModel>>> editLink(
      Map<String, dynamic> body, String id);
}
