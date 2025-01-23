import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/package_offer_model.dart';
import '../repositories/packages_offers_repo.dart';

@injectable
class GetFilterPackagesOffersUseCase extends UseCaseNoParam<Either<String, List<PackageOfferModel>>> {
  GetFilterPackagesOffersUseCase(this.repository);

  final PackagesOffersRepository repository;

  @override
  Future<Either<String, List<PackageOfferModel>>> call() {
    return repository.getFilterPackagesOffers();
  }
}

