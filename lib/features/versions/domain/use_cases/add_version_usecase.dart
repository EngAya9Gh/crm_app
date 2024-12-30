import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/common/helpers/selected_sections_handler.dart';
import 'package:crm_smart/core/services/api/dio/file_io_mobile.dart';
import 'package:crm_smart/features/versions/presentation/widgets/add_new_entry_version.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/common/enums/notifications/notification_type_enum.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/result.dart';
import '../../../../core/utils/app_constants.dart';
import '../repositories/versions_repo.dart';
import 'package:collection/collection.dart';

@lazySingleton
class AddVersionsUsecase extends BaseUsecase<Either<String, PaginationResponseWrapper>, AddVersionPramas> {
  AddVersionsUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
    AddVersionPramas params,
  ) async {
    return await _repository.addVersion(params);
  }
}

class AddVersionPramas {
  final String? versionNo;
  final String? versionDate;
  final List<OneItemVersionEntity>? onItem;

  const AddVersionPramas({
    this.versionDate,
    this.versionNo,
    this.onItem,
  });

  Map<String, dynamic> toParams() {
    Map onItemIdMap = {};
    onItem?.forEachIndexed((i, e) => onItemIdMap.addAll({
          'details[$i][title]': e.title,
          'details[$i][description]': e.description,
          'details[$i][management]': e.management,
        }));

    final Map<String, dynamic> map = {
      'version_date': versionDate,
      'version_no': versionNo,
      ...onItemIdMap
      // 'details': onItem
      //     ?.map(
      //       (e) => e.toMap(),
      //     )
      //     .toList()
    }..removeWhere((key, value) => value == null || value == '');

    return map;
  }
}
