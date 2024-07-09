import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/enums/enums.dart';
import '../../../../../core/use_case/use_case.dart';
import '../../../../../model/calendar/event_model.dart';
import '../repositories/dates_table_repo.dart';

@lazySingleton
class ChangeDateToDonUsecase
    extends UseCase<Either<String, dynamic>, ChangeDateToDoneParams> {
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
      'type_date': event.typedate,
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
