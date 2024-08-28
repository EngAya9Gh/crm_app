import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart' show debugPrint;
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/services/api/api_utils.dart';
import '../../../../../../core/services/api/result.dart';
import '../../domain/repositories/important_links_repo.dart';
import '../../domain/use_cases/get_important_links_usecase.dart';
import '../data_sources/important_links_datasource.dart';
import '../models/important_link_model.dart';

@Injectable(as: ImportantLinksRepo)
class ImportantLinksRepoImpl extends ImportantLinksRepo {
  ImportantLinksRepoImpl(this.datasource);

  final ImportantLinksDatasource datasource;

  @override
  Future<Result<ResponseWrapper<ImportantLinkModel>>> addLink(
      Map<String, dynamic> body) {
    // TODO: implement addLink
    return toApiResult(() => datasource.addLink(body: body));
  }

  @override
  Future<Result<ResponseWrapper<ImportantLinkModel>>> editLink(
      Map<String, dynamic> body, String id) {
    // TODO: implement editLink
    return toApiResult(() => datasource.updateLink(body: body, id: id));
  }

  @override
  Future<Either<String, PaginationResponseWrapper>> getLinkImportant(
    GetImportantLinksParams params,
  ) async {
    try {
      final data = await datasource.getImportantLinks(params);
      return Right(data.copyWith(
        data: List<ImportantLinkModel>.from(
            data.data.map((e) => ImportantLinkModel.fromJson(e))),
      ));
    } catch (e) {
      debugPrint("error in getLinkImportant in repo => $e");
      return Left(e.toString());
    }
  }
}
