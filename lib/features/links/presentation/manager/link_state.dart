

part of 'link_cubit.dart';

class LinksState extends Equatable {
  const LinksState({
    this.allLinksList = const PageState.init(),
    this.allLinks = const [],
    this.actionLinkState = const BlocStatus.initial(),
    this.currentLink,

  });

  final PageState<List<LinkImportantModel>> allLinksList;
  final List<LinkImportantModel> allLinks;
  final BlocStatus actionLinkState;
  final LinkImportantModel? currentLink;

  @override
  List<Object?> get props => [
    allLinksList,
    allLinks,
    actionLinkState,
    currentLink,
  ];

  LinksState copyWith({
    PageState<List<LinkImportantModel>>? allLinkList,
    List<LinkImportantModel>? allLinks,
    BlocStatus? actionLinkState,
    LinkImportantModel? currentLink,
  }) {
    return LinksState(
      allLinksList: allLinkList ?? this.allLinksList,
      allLinks: allLinks ?? this.allLinks,
      actionLinkState: actionLinkState ?? this.actionLinkState,
      currentLink: currentLink ?? this.currentLink,
        );
  }
}
