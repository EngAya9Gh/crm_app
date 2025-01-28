import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../../../../core/common/models/client_model.dart';
import '../../../../../core/common/models/response_wrapper/response_wrapper.dart';
import '../../../../../model/invoiceModel.dart';
import '../../data/models/verified_client_model.dart';
import '../repositories/verified_client_repo.dart';

@injectable
class VerifiedClientUseCase extends BaseUsecase<Either<String, VerifiedClientModel>, VerifiedClientParams> {
  VerifiedClientUseCase(this.repository);

  final VerifiedClientRepository repository;

  @override
  Future<Either<String, VerifiedClientModel>> call(VerifiedClientParams params) {
    return repository.verifiedClient(params);
  }
}

class VerifiedClientParams {
  final VerifiedClientModel verifiedClientModel;

  const VerifiedClientParams({
    required this.verifiedClientModel,
  });
}
