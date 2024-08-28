import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/utils/app_constants.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/important_links_repo.dart';

@injectable
class GetImportantLinksUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetImportantLinksParams> {
  GetImportantLinksUsecase(this.repository);

  final ImportantLinksRepo repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    GetImportantLinksParams params,
  ) {
    return repository.getLinkImportant(params);
  }
}

// params
class GetImportantLinksParams {
  final int skip;
  final int limit;
  final String searchQuery;

  GetImportantLinksParams({
    this.skip = 0,
    this.limit = AppConstants.kPerPage,
    required this.searchQuery,
  });

  Map<String, dynamic> toParams() {
    return {
      'page': ApiHelper.calculatePage(skip: skip, limit: limit),
      'limit': limit,
      'filter': searchQuery,
    };
  }
}
