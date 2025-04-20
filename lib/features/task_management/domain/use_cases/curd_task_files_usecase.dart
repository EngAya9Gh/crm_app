import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/task_management/data/models/task_model.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../core/common/usecases/base_usecase.dart';
import '../../../../core/services/api/result.dart';
import '../repositories/task_repository.dart';

@injectable
class CrudTaskFilesUsecase extends BaseUsecase<Result<ResponseWrapper<TaskModel>>, CurdFilesTaskParams> {
  CrudTaskFilesUsecase(this.repository);

  final TaskRepository repository;

  @override
  Future<Result<ResponseWrapper<TaskModel>>> call(CurdFilesTaskParams params) {
    return repository.crudTaskFiles(params);
  }
}

class CurdFilesTaskParams {
  final int taskId;
  final List<int>? filesId;
  final List<XFile>? files;

  CurdFilesTaskParams({required this.taskId, this.filesId, this.files});

  Future<FormData> get toFormData async {
    FormData formData = FormData();
    if (filesId != null && filesId!.isNotEmpty) {
      for (int i = 0; i < (filesId?.length ?? 0); i++) {
        formData.fields.add(MapEntry('id_files[$i]', filesId![i].toString()));
      }
    }
    if (files != null && files!.isNotEmpty) {
      for (int i = 0; i < files!.length; i++) {
        formData.files.add(MapEntry('files[$i]', await MultipartFile.fromFile(files![i].path)));
      }
    }
    return formData;
  }
}
