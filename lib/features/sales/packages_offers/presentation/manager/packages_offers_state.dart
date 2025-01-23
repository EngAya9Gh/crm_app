part of 'packages_offers_bloc.dart';

@immutable
class PackagesOffersState {
  final BlocStatus addOrUpdateNewOfferStatus;
  final BlocStatus deleteNewOfferStatus;
  final BlocStatus<List<PackageOfferModel>> allOffersPackages;
  final BlocStatus<List<PackageOfferModel>> allFilterOffersPackages;
  final List<NewEntryItemPackageOfferAdded> listItemAdded;

  const PackagesOffersState({
    this.allOffersPackages = const BlocStatus.initial(),
    this.allFilterOffersPackages = const BlocStatus.initial(),
    this.addOrUpdateNewOfferStatus = const BlocStatus.initial(),
    this.deleteNewOfferStatus = const BlocStatus.initial(),
    this.listItemAdded = const [NewEntryItemPackageOfferAdded(index: 0)],
  });

  PackagesOffersState copyWith({
    BlocStatus<List<PackageOfferModel>>? allOffersPackages,
    BlocStatus<List<PackageOfferModel>>? allFilterOffersPackages,
    BlocStatus? addOrUpdateNewOfferStatus,
    BlocStatus? deleteNewOfferStatus,
    List<NewEntryItemPackageOfferAdded>? listItemAdded,
  }) {
    return PackagesOffersState(
      allOffersPackages: allOffersPackages ?? this.allOffersPackages,
      allFilterOffersPackages: allFilterOffersPackages ?? this.allFilterOffersPackages,
      addOrUpdateNewOfferStatus: addOrUpdateNewOfferStatus ?? this.addOrUpdateNewOfferStatus,
      deleteNewOfferStatus: deleteNewOfferStatus ?? this.deleteNewOfferStatus,
      listItemAdded: listItemAdded ?? this.listItemAdded,
    );
  }
}
