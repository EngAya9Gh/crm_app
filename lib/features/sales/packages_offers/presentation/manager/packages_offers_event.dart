part of 'packages_offers_bloc.dart';

@immutable
class PackagesOffersEvent {}

class GetPackagesOffersEvent extends PackagesOffersEvent{}
class DeletePackagesOffersEvent extends PackagesOffersEvent{
  final DeleteOffersParams params;

  DeletePackagesOffersEvent(this.params);
}


class AddNewPackagesOffersEvent extends PackagesOffersEvent {
  final AddNewPackagesOffersParams addNewPackagesOffersParams;

  AddNewPackagesOffersEvent({
    required this.addNewPackagesOffersParams,
  });
}
class UpdateNewPackagesOffersEvent extends PackagesOffersEvent {
  final AddNewPackagesOffersParams addNewPackagesOffersParams;

  UpdateNewPackagesOffersEvent({
    required this.addNewPackagesOffersParams,
  });
}

class DeleteOrAddOrUpdateEntryToListOfItemAddedEvent extends PackagesOffersEvent {
  final NewEntryItemPackageOfferAdded newEntryItemPackageOfferAdded;
  final bool isAdd;
  final bool isRemove;
  DeleteOrAddOrUpdateEntryToListOfItemAddedEvent({
    required this.newEntryItemPackageOfferAdded,
    this.isAdd=false,
    this.isRemove=false,
  });
}

class ResetListOfItemAddEvent extends PackagesOffersEvent{
  final List<NewEntryItemPackageOfferAdded>? listItem;

  ResetListOfItemAddEvent({
    this.listItem,
  });
}