part of 'favorite_screens_cubit.dart';

class FavoriteScreensState extends Equatable {
  final bool isLoading;
  final bool hasError;
  final List<FavoriteScreenModel> favoriteScreens;
  final List<FavoriteScreenModel> availableScreens;
  final String? errorMessage;

  const FavoriteScreensState({
    this.isLoading = false,
    this.hasError = false,
    this.favoriteScreens = const [],
    this.availableScreens = const [],
    this.errorMessage,
  });

  FavoriteScreensState copyWith({
    bool? isLoading,
    bool? hasError,
    List<FavoriteScreenModel>? favoriteScreens,
    List<FavoriteScreenModel>? availableScreens,
    String? errorMessage,
  }) {
    return FavoriteScreensState(
      isLoading: isLoading ?? this.isLoading,
      hasError: hasError ?? this.hasError,
      favoriteScreens: favoriteScreens ?? this.favoriteScreens,
      availableScreens: availableScreens ?? this.availableScreens,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [isLoading, hasError, favoriteScreens, availableScreens, errorMessage];
}
