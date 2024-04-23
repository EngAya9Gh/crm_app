
part of 'company_cubit.dart';

class CompanyState extends Equatable {
  const CompanyState({
    this.allcommentListPages = const PageState.init(),
    this.allComments = const [],
    this.actionCommentState = const BlocStatus.initial(),
    // this.currentLink,

  });

  final PageState<List<CompanyCommentModel>> allcommentListPages;
  final List<CompanyCommentModel> allComments;
  final BlocStatus actionCommentState;
  // final LinkImportantModel? currentLink;

  @override
  List<Object?> get props => [
    allcommentListPages,
    allComments,
    actionCommentState,
    // currentLink,
  ];

  CompanyState copyWith({
    PageState<List<CompanyCommentModel>>? allLinkList,
    List<CompanyCommentModel>? allLinks,
    BlocStatus? actionLinkState,
    // LinkImportantModel? currentLink,
  }) {
    return CompanyState(
      allcommentListPages: allLinkList ?? this.allcommentListPages,
      allComments: allLinks ?? this.allComments,
      actionCommentState: actionLinkState ?? this.actionCommentState,
      // currentLink: currentLink ?? this.currentLink,
    );
  }
}
