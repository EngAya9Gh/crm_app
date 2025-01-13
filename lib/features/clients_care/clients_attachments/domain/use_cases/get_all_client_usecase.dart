import 'package:crm_smart/features/clients_care/clients_attachments/presentation/manager/client_attachments_bloc.dart';
import 'package:crm_smart/features/clients_care/clients_attachments/presentation/manager/client_attachments_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/services/api/result.dart';
import '../../data/models/attachment_model.dart';
import '../../data/models/subscribed_clients_model.dart';
import '../repositories/clients_attachments_repo.dart';

@injectable
class GetAllClientUseCase extends  UseCaseNoParam<Either<String, List<SubscribedClientsModel>>> {
  GetAllClientUseCase(this.repository);

  final ClientsAttachmentsRepository repository;

  @override
  Future<Either<String, List<SubscribedClientsModel>>> call() {
    return repository.getAllClient();
  }
}