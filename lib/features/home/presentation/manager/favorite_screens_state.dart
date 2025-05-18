part of 'favorite_screens_cubit.dart';

enum FavoriteScreensStatus {
  initial,
  loading,
  updating,
  success,
  failure,
}

class FavoriteScreensState extends Equatable {
  final FavoriteScreensStatus status;
  final List<FavoriteScreenModel> favoriteScreens;
  final List<FavoriteScreenModel> availableScreens;
  final String? errorMessage;

  const FavoriteScreensState({
    this.status = FavoriteScreensStatus.initial,
    this.favoriteScreens = const [],
    this.availableScreens = const [],
    this.errorMessage,
  });

  FavoriteScreensState copyWith({
    FavoriteScreensStatus? status,
    List<FavoriteScreenModel>? favoriteScreens,
    List<FavoriteScreenModel>? availableScreens,
    String? errorMessage,
  }) {
    return FavoriteScreensState(
      status: status ?? this.status,
      favoriteScreens: favoriteScreens ?? this.favoriteScreens,
      availableScreens: availableScreens ?? this.availableScreens,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [status, favoriteScreens, availableScreens, errorMessage];
}
