import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/package_offer_model.dart';
import '../repositories/packages_offers_repo.dart';
import 'add_packages_offers_usecase.dart';

@injectable
class UpdatePackagesOffersUseCase extends BaseUsecase<Either<String, PackageOfferModel>,AddNewPackagesOffersParams> {
  UpdatePackagesOffersUseCase(this.repository);

  final PackagesOffersRepository repository;

  @override
  Future<Either<String, PackageOfferModel>> call(AddNewPackagesOffersParams params) {
    return repository.updatePackagesOffers(params);
  }
}