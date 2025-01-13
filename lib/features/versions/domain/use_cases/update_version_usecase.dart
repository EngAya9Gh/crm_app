import 'package:crm_smart/core/common/helpers/api_helper.dart';
import 'package:crm_smart/core/common/helpers/selected_sections_handler.dart';
import 'package:crm_smart/core/services/api/dio/file_io_mobile.dart';
import 'package:crm_smart/features/versions/presentation/widgets/new_entry_version_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/helpers/responseWrapper.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/common/enums/notifications/notification_type_enum.dart';
import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/services/api/result.dart';
import '../../../../core/utils/app_constants.dart';
import '../../../../model/versionModel.dart';
import '../repositories/versions_repo.dart';
import 'package:collection/collection.dart';

import 'add_version_usecase.dart';

@lazySingleton
class UpdateVersionsUsecase extends BaseUsecase<Either<String, ResponseWrapper<VersionModel>>, AddVersionPramas> {
  UpdateVersionsUsecase(this._repository);

  final versionsRepo _repository;

  @override
  Future<Either<String, ResponseWrapper<VersionModel>>> call(
    AddVersionPramas params,
  ) async {
    return await _repository.updateVersion(params);
  }
}
