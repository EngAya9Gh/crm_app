import 'package:crm_smart/features/finance/verified_invoice/domain/use_cases/verified_invoice_usecase.dart';
import 'package:crm_smart/features/sales/packages_offers/domain/use_cases/add_packages_offers_usecase.dart';
import 'package:crm_smart/features/sales/packages_offers/domain/use_cases/delete_packages_offers_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/packages_offers_repo.dart';
import '../data_sources/packages_offers_datasource.dart';
import '../models/package_offer_model.dart';

@Injectable(as: PackagesOffersRepository)
class PackagesOffersRepoImpl implements PackagesOffersRepository {
  final PackagesOffersDatasource datasource;

  PackagesOffersRepoImpl(this.datasource);

  @override
  Future<Either<String, List<PackageOfferModel>>> getPackagesOffers() async {
    try {
      final data = await datasource.getPackagesOffers();
      return data;
    } catch (e) {
      debugPrint("error in packages offers repo imp => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PackageOfferModel>> addPackagesOffers(AddNewPackagesOffersParams params) async {
    try {
      final data = await datasource.addPackagesOffers(params);
      return data;
    } catch (e) {
      debugPrint("error in packages offers repo imp => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, PackageOfferModel>> updatePackagesOffers(AddNewPackagesOffersParams params)  async {
    try {
      final data = await datasource.updatePackagesOffers(params);
      return data;
    } catch (e) {
      debugPrint("error in packages offers repo imp => $e");
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deletePackagesOffers(DeleteOffersParams params)  async {
    try {
      final data = await datasource.deletePackagesOffers(params);
      return data;
    } catch (e) {
      debugPrint("error in packages offers repo imp => $e");
      return Left(e.toString());
    }
  }
}
