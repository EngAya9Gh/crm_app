import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/common/models/event_model.dart';
import '../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class ChangeDateToDonUsecase
    extends BaseUsecase<Either<String, dynamic>, ChangeDateToDoneParams> {
  ChangeDateToDonUsecase(this._repository);

  final DatesTableRepo _repository;

  @override
  Future<Either<String, dynamic>> call(
    ChangeDateToDoneParams params,
  ) async {
    return await _repository.changeDateToDone(params);
  }
}

class ChangeDateToDoneParams {
  late final String? isDone;
  final EventModel event;

  ChangeDateToDoneParams({
    required this.event,
  }) {
    this.isDone = IsDoneDateEnum.done.index.toString();
  }

  Map<String, dynamic> toMap() {
    return {
      'is_done': isDone,
      'comment': event.comment,
      'type_date': event.typeDate,
      ..._prepareParams(),
    };
  }

  Map<String, dynamic> _prepareParams() {
    if (event.agentName != null) {
      return {'fk_agent': event.agent!.idAgent};
    } else {
      return {'fk_client': event.fkIdClient};
    }
  }
}
