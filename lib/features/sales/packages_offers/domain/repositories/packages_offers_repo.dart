import 'package:dartz/dartz.dart';

import '../../data/models/package_offer_model.dart';
import '../use_cases/add_packages_offers_usecase.dart';

abstract class PackagesOffersRepository {
  Future<Either<String, List<PackageOfferModel>>> getPackagesOffers();
  Future<Either<String, PackageOfferModel>> addPackagesOffers(AddNewPackagesOffersParams params);
}
