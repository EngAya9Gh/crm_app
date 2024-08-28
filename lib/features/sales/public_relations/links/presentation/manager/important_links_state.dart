part of 'important_links_cubit.dart';

class ImportantLinksState extends Equatable {
  final BlocStatus getImportantLinksStatus;
  final BlocStatus actionLinkState;
  final ImportantLinkModel? currentLink;

  const ImportantLinksState({
    this.getImportantLinksStatus = const BlocStatus.initial(),
    this.actionLinkState = const BlocStatus.initial(),
    this.currentLink,
  });

  ImportantLinksState copyWith({
    BlocStatus? getImportantLinksStatus,
    BlocStatus? actionLinkState,
    ImportantLinkModel? currentLink,
  }) {
    return ImportantLinksState(
      getImportantLinksStatus:
          getImportantLinksStatus ?? this.getImportantLinksStatus,
      actionLinkState: actionLinkState ?? this.actionLinkState,
      currentLink: currentLink ?? this.currentLink,
    );
  }

  @override
  List<Object?> get props {
    return [
      getImportantLinksStatus,
      actionLinkState,
      currentLink,
    ];
  }
}
