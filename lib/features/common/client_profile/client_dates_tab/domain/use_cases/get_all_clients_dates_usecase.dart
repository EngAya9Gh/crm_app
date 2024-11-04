import 'package:crm_smart/features/sales/clients/clients_contacts/data/models/client_contact_model.dart';
import 'package:crm_smart/features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../../core/services/api/result.dart';
import '../../data/models/client_date_model.dart';
import '../repositories/clients_dates_repo.dart';

@injectable
class GetAllClientsDatesUseCase extends BaseUsecase<
   ResponseWrapper<List<ClientDateModel>>, GetAllClientsDatesParams> {
  GetAllClientsDatesUseCase(this.repository);

  final ClientsDatesRepository repository;

  @override
  Future<ResponseWrapper<List<ClientDateModel>>> call(
      GetAllClientsDatesParams params) {
    return repository.getAllClientsDates(params.toMap(), params.param());
  }
}

class GetAllClientsDatesParams {
  final String clientId;
  // final String? filter;
  // final int? limit;
  // final String? contactType;
  //
  GetAllClientsDatesParams({
    required this.clientId,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};

    //  map['page'] = page;
    // if (filter != null) map['filter'] = filter;
    // if (limit != null) map['limit'] = limit;
    // if (contactType != null) map['type'] = contactType;

    return map;
  }
  String param() {
    return clientId;
  }
}
