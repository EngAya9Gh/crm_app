import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/favorite_screen_model.dart';
import '../../domain/repositories/available_screens_repository.dart';
import '../../domain/repositories/favorite_screens_repository.dart';
import '../../../mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart';

part 'favorite_screens_state.dart';

@injectable
class FavoriteScreensCubit extends Cubit<FavoriteScreensState> {
  final FavoriteScreensRepository _favoriteScreensRepository;
  final AvailableScreensRepository _availableScreensRepository;
  final PrivilegesCubit _privilegesCubit;

  FavoriteScreensCubit(
    this._favoriteScreensRepository,
    this._availableScreensRepository,
    this._privilegesCubit,
  ) : super(const FavoriteScreensState());

  Future<void> loadFavoriteScreens() async {
    emit(state.copyWith(status: FavoriteScreensStatus.loading));

    try {
      // Get ALL available screens first (these have the page widgets)
      final allAvailableScreens =
          _availableScreensRepository.getAllAvailableScreens();

      print('Total available screens: ${allAvailableScreens.length}');
      print(
          'Screens with page widgets: ${allAvailableScreens.where((s) => s.page != null).length}');

      // Create a map for faster lookup by ID
      final availableScreensMap = {
        for (var screen in allAvailableScreens) screen.id: screen
      };

      // Now get user favorites (these come from SharedPreferences and will have null page widgets)
      final userFavorites =
          await _favoriteScreensRepository.getFavoriteScreens();

      print('Total user favorites: ${userFavorites.length}');

      // Get user privileges for filtering
      final userPrivileges = _privilegesCubit.getAllPrivileges();
      print('User privileges: $userPrivileges');

      // Filter available screens based on user privileges
      final availableScreens = allAvailableScreens.where((screen) {
        return screen.privilegeId == null ||
            userPrivileges.contains(screen.privilegeId);
      }).toList();

      print(
          'Available screens after filtering: ${availableScreens.length} out of ${allAvailableScreens.length}');

      // Filter favorites to include only screens the user has access to
      final filteredFavorites = userFavorites.where((favorite) {
        return favorite.privilegeId == null ||
            userPrivileges.contains(favorite.privilegeId);
      }).toList();

      print('Filtered favorites before page fix: ${filteredFavorites.length}');

      // Fix the page property by replacing each favorite with its corresponding available screen
      final updatedFavorites = filteredFavorites.map((favorite) {
        // If we have this screen in our available screens map, use it (it has the page widget)
        if (availableScreensMap.containsKey(favorite.id)) {
          final availableScreen = availableScreensMap[favorite.id]!;
          print(
              'Found screen ${favorite.id} in available screens, page exists: ${availableScreen.page != null}');

          // Keep the favorite's extraParams if the available screen doesn't have them
          final extraParams =
              availableScreen.extraParams ?? favorite.extraParams;

          // Create a new favorite with the page widget from the available screen
          return availableScreen.copyWith(extraParams: extraParams);
        } else {
          print(
              'WARNING: Screen ${favorite.id} not found in available screens');
          return favorite; // Keep original as fallback
        }
      }).toList();

      print('Favorites after page fix: ${updatedFavorites.length}');
      print(
          'Favorites with page widgets: ${updatedFavorites.where((f) => f.page != null).length}');

      emit(state.copyWith(
        status: FavoriteScreensStatus.success,
        favoriteScreens: updatedFavorites,
        availableScreens: availableScreens,
      ));
    } catch (error) {
      print('Error loading favorite screens: $error');
      emit(state.copyWith(
        status: FavoriteScreensStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> addFavoriteScreen(FavoriteScreenModel screen) async {
    emit(state.copyWith(status: FavoriteScreensStatus.updating));

    try {
      // Make sure we preserve the page widget when adding to favorites
      // by finding the original screen in available screens
      FavoriteScreenModel screenToSave = screen;

      // If the screen doesn't have a page property, try to find it in available screens
      if (screen.page == null) {
        print(
            'Screen ${screen.id} - ${screen.title} has null page, searching in available screens');
        final matching = state.availableScreens
            .firstWhere((s) => s.id == screen.id, orElse: () => screen);

        if (matching.page != null) {
          print('Found page for ${screen.id} in available screens');
          // We'll save without the page but add it to state
          screenToSave = matching;
        }
      }

      // Save to repository (page will be null in storage but that's expected)
      final success =
          await _favoriteScreensRepository.addFavoriteScreen(screenToSave);

      if (success) {
        // Add to state with the page widget preserved
        final updatedFavorites =
            List<FavoriteScreenModel>.from(state.favoriteScreens)
              ..add(screenToSave);

        emit(state.copyWith(
          status: FavoriteScreensStatus.success,
          favoriteScreens: updatedFavorites,
        ));
      } else {
        emit(state.copyWith(
          status: FavoriteScreensStatus.failure,
          errorMessage: 'Failed to add screen',
        ));
      }
    } catch (error) {
      print('Error adding favorite screen: $error');
      emit(state.copyWith(
        status: FavoriteScreensStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> removeFavoriteScreen(String screenId) async {
    emit(state.copyWith(status: FavoriteScreensStatus.updating));

    try {
      final success =
          await _favoriteScreensRepository.removeFavoriteScreen(screenId);

      if (success) {
        final updatedFavorites =
            List<FavoriteScreenModel>.from(state.favoriteScreens)
              ..removeWhere((screen) => screen.id == screenId);

        emit(state.copyWith(
          status: FavoriteScreensStatus.success,
          favoriteScreens: updatedFavorites,
        ));
      } else {
        emit(state.copyWith(
          status: FavoriteScreensStatus.failure,
          errorMessage: 'Failed to remove screen',
        ));
      }
    } catch (error) {
      emit(state.copyWith(
        status: FavoriteScreensStatus.failure,
        errorMessage: error.toString(),
      ));
    }
  }
}
