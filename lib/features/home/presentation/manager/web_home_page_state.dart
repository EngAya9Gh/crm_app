part of 'web_home_page_cubit.dart';

@immutable
class WebHomePageState extends Equatable {
  final BlocStatus resetSelected;
  final BlocStatus setSelected;

  WebHomePageState({
    this.resetSelected = const BlocStatus.initial(),
    this.setSelected = const BlocStatus.initial(),
  });

  WebHomePageState copyWith({
    BlocStatus? resetSelected,
    BlocStatus? setSelected,
  }) {
    return WebHomePageState(
      resetSelected: resetSelected ?? this.resetSelected,
      setSelected: setSelected ?? this.setSelected,
    );
  }

  @override
  List<Object> get props {
    return [
      resetSelected,
      setSelected,
    ];
  }
}
