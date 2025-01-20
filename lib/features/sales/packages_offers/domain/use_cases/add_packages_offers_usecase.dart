import 'package:crm_smart/model/productmodel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/common/usecases/base_usecase.dart';
import '../../data/models/package_offer_model.dart';
import '../repositories/packages_offers_repo.dart';
import 'package:collection/collection.dart';

@injectable
class AddPackagesOffersUseCase extends BaseUsecase<Either<String, PackageOfferModel>,AddNewPackagesOffersParams> {
  AddPackagesOffersUseCase(this.repository);

  final PackagesOffersRepository repository;

  @override
  Future<Either<String, PackageOfferModel>> call(AddNewPackagesOffersParams params) {
    return repository.addPackagesOffers(params);
  }
}

class AddNewPackagesOffersParams {
  final String name;
  final String start_date;
  final String end_date;
  final List<OfferItem> offers;
  final List<ProductModel> products;

  Map<String, dynamic> toMap() {
    var productsMap = {};
    var offersMap = {};
    offers.forEachIndexed(
      (index, element) => offersMap.addAll({
        "offerItems[$index][rebate_type]": element.rebateType,
        "offerItems[$index][rebate_value]": element.rebateValue,
      }),
    );
    products.forEachIndexed(
      (index, element) => productsMap.addAll({
        "products[$index]": element.idProduct,
      }),
    );
    return {
      'name': this.name,
      'start_date': this.start_date,
      'end_date': this.end_date,
      ...offersMap,
      ...productsMap,
    };
  }

  const AddNewPackagesOffersParams({
    required this.name,
    required this.start_date,
    required this.end_date,
    required this.offers,
    required this.products,
  });
}
