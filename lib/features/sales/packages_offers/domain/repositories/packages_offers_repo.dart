import 'package:dartz/dartz.dart';

import '../../data/models/package_offer_model.dart';
import '../use_cases/add_packages_offers_usecase.dart';
import '../use_cases/delete_packages_offers_usecase.dart';

abstract class PackagesOffersRepository {
  Future<Either<String, List<PackageOfferModel>>> getPackagesOffers();
  Future<Either<String, PackageOfferModel>> addPackagesOffers(AddNewPackagesOffersParams params);
  Future<Either<String, PackageOfferModel>> updatePackagesOffers(AddNewPackagesOffersParams params);
  Future<Either<String, bool>> deletePackagesOffers(DeleteOffersParams params);
}
