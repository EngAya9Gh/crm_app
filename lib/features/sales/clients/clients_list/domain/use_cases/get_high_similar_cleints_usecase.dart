import 'package:crm_smart/core/common/helpers/responseWrapper.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/common/usecases/base_usecase.dart';
import '../repositories/clients_list_repository.dart';

@lazySingleton
class GetHighSimilarClientsUsecase extends BaseUsecase<
    Either<String, PaginationResponseWrapper>, GetHighSimilarClientsParams> {
  GetHighSimilarClientsUsecase(this.repository);

  final ClientsListRepository repository;

  @override
  Future<Either<String, PaginationResponseWrapper>> call(
      GetHighSimilarClientsParams params) {
    return repository.getHighSimilarClients(params);
  }
}

class GetHighSimilarClientsParams {
  final String name_client;
  final String name_enterprise;
  final String phone;

  GetHighSimilarClientsParams({
    required this.name_client,
    required this.name_enterprise,
    required this.phone,
  });

  Map<String, dynamic> toBody() => {
        'name_client': this.name_client,
        'name_enterprise': this.name_enterprise.toString(),
        'phone': this.phone.toString(),
      };
}
