import 'package:crm_smart/features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/services/api/api_services.dart';
import '../../../../../../core/utils/end_points.dart';
import '../../domain/use_cases/add_packages_offers_usecase.dart';
import '../models/package_offer_model.dart';

@injectable
class PackagesOffersDatasource {
  final ApiServices api;

  PackagesOffersDatasource(this.api);

  Future<Either<String, List<PackageOfferModel>>> getPackagesOffers() async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.get(
        endPoint: EndPoints.offers.getPackagesOffers,
      );

      return Right(List.from((response['message'] as List<dynamic>).map((e) {
        return PackageOfferModel.fromJson(e as Map<String, dynamic>);
      })));
    } catch (e) {
      debugPrint("error in packages offers data source => $e");
      throw Exception("$e");
    }
  }
  Future<Either<String, PackageOfferModel>> addPackagesOffers(AddNewPackagesOffersParams params) async {
    try {
      api.changeBaseUrl(EndPoints.baseUrls.urlLaravel);
      final response = await api.post(
        endPoint: EndPoints.offers.addPackagesOffers,
        data: params.toMap(),
      );

      return Right(PackageOfferModel.fromJson(response['message']));
    } catch (e) {
      debugPrint("error in packages offers data source => $e");
      throw Exception("$e");
    }
  }
}
