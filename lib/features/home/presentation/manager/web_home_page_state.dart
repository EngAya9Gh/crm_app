part of 'web_home_page_cubit.dart';

@immutable
class WebHomePageState extends Equatable {
  final BlocStatus resetSelected;

  WebHomePageState({
    this.resetSelected = const BlocStatus.initial(),
  });

  WebHomePageState copyWith({
    BlocStatus? resetSelected,
  }) {
    return WebHomePageState(
      resetSelected: resetSelected ?? this.resetSelected,
    );
  }

  @override
  List<Object> get props => [resetSelected];
}
