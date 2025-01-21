import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/package_offer_model.dart';
import '../repositories/packages_offers_repo.dart';
import 'add_packages_offers_usecase.dart';

@injectable
class DeletePackagesOffersUseCase extends BaseUsecase<Either<String, bool>,DeleteOffersParams> {
  DeletePackagesOffersUseCase(this.repository);

  final PackagesOffersRepository repository;

  @override
  Future<Either<String, bool>> call(DeleteOffersParams params) {
    return repository.deletePackagesOffers(params);
  }
}

class DeleteOffersParams{
  final String id;

   DeleteOffersParams({
    required this.id,
  });

}