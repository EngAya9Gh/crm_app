import 'package:collection/collection.dart';
import 'package:crm_smart/features/app/presentation/bloc/app_manager_cubit.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/enums/client/subscribing_intention_level_enum.dart';
import '../../../../../../core/common/models/client_model.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../repositories/clients_list_repository.dart';

@injectable
class AssignClientToEmployeesUsecase extends BaseUsecase<Result<ResponseWrapper<bool>>, AssignClientsToEmployeeParams> {
  AssignClientToEmployeesUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Result<ResponseWrapper<bool>>> call(AssignClientsToEmployeeParams params) {
    return repository.assignClientsToEmployee(params);
  }
}

class AssignClientsToEmployeeParams {
  final String fk_user;
  final List<String> clientsId;

  const AssignClientsToEmployeeParams({
    required this.fk_user,
    required this.clientsId,
  });

  Map<String, dynamic> toMap() {
    var clientsIdMap = {};
    clientsId.forEachIndexed(
      (index, element) => clientsIdMap.addAll({'clients_ids[$index]': element}),
    );
    return {
      'fk_user': this.fk_user,
      ...clientsIdMap,
    };
  }
}
