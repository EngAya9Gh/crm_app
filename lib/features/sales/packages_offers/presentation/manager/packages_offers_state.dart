part of 'packages_offers_bloc.dart';

@immutable
class PackagesOffersState {
  final BlocStatus addNewOfferStatus;

  const PackagesOffersState({
    this.addNewOfferStatus = const BlocStatus.initial(),
  });

  PackagesOffersState copyWith({
    BlocStatus? addNewOfferStatus,
  }) {
    return PackagesOffersState(
      addNewOfferStatus: addNewOfferStatus ?? this.addNewOfferStatus,
    );
  }
}
