part of 'packages_offers_bloc.dart';

@immutable
class PackagesOffersEvent {}

class AddNewPackagesOffersEvent extends PackagesOffersEvent {
  final AddNewPackagesOffersParams addNewPackagesOffersParams;

  AddNewPackagesOffersEvent({
    required this.addNewPackagesOffersParams,
  });
}
