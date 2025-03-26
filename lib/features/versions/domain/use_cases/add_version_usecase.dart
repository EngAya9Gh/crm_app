import 'package:crm_smart/features/versions/presentation/widgets/new_entry_version_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/versions_repo.dart';
import 'package:collection/collection.dart';

@lazySingleton
class AddVersionsUsecase extends BaseUsecase<Either<String, bool>, AddVersionPramas> {
  AddVersionsUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Either<String, bool>> call(
    AddVersionPramas params,
  ) async {
    return await _repository.addVersion(params);
  }
}

class AddVersionPramas {
  final int? id;
  final String? versionNo;
  final String? versionDate;
  final List<OneItemVersionEntity>? onItem;
  final int? isCurrent;
  const AddVersionPramas({
    this.id,
    this.versionDate,
    this.versionNo,
    this.onItem,
    this.isCurrent,
  });

  Map<String, dynamic> toParamsUpdate() {
    final Map<String, dynamic> map = {
      'version_date': versionDate,
      'title': onItem?.first.title,
      'description': onItem?.first.description,
      'management': onItem?.first.management,
    }..removeWhere((key, value) => value == null || value == '');

    return map;
  }

  Map<String, dynamic> toParamsAdd() {
    Map onItemIdMap = {};
    onItem?.forEachIndexed((i, e) => onItemIdMap.addAll({
          'details[$i][title]': e.title,
          'details[$i][description]': e.description,
          'details[$i][management]' : e.management ?? '',
        }..removeWhere(
            (key, value) => value == null,
          )));

    final Map<String, dynamic> map = {
      'version_date': versionDate,
      'version_no': versionNo,
      'is_current': isCurrent,
    }..removeWhere((key, value) => value == null || value == '');

    return {
      ...map,
      ...onItemIdMap,
    };
  }
}
