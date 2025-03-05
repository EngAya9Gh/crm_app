import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crm_smart/model/commentmodel.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/user_region_department.dart';
import '../repositories/task_repository.dart';
import 'add_comment_task_usecase.dart';

@injectable
class GetCommentsTaskUsecase extends BaseUsecase<Result<ResponseWrapper<List<CommentModel>>>, AddTaskCommentParams> {
  GetCommentsTaskUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<List<CommentModel>>>> call(AddTaskCommentParams params) {
    return repository.getTaskComments(params);
  }
}
