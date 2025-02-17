import 'dart:io';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../../../../model/usermodel.dart';
import '../../data/models/user_region_department.dart';
import '../repositories/task_repository.dart';

@injectable
class AddCommentTaskUsecase extends BaseUsecase<Result<ResponseWrapper<bool>>, AddTaskCommentParams> {
  AddCommentTaskUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(AddTaskCommentParams params) {
    return repository.addTaskComments(params);
  }
}

class AddTaskCommentParams{
  final int taskId;
  final String content;

  const AddTaskCommentParams({
    required this.taskId,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'comment': this.content,
    };
  }
}