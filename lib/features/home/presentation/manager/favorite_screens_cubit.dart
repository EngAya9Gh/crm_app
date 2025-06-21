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
  final PrivilegesCubit? _privilegesCubit;

  FavoriteScreensCubit(
    this._favoriteScreensRepository,
    this._availableScreensRepository,
    this._privilegesCubit,
  ) : super(const FavoriteScreensState());

  Future<void> loadFavoriteScreens() async {
    try {
      emit(state.copyWith(isLoading: true));

      // Load favorite screens
      final favoriteScreens = await _favoriteScreensRepository.getFavoriteScreens();
      
      // Load available screens
      final availableScreens = _availableScreensRepository.getAllAvailableScreens();
      
      // Filter available screens based on privileges if PrivilegesCubit is available
      List<FavoriteScreenModel> filteredScreens = availableScreens;
      
      if (_privilegesCubit != null) {
        filteredScreens = availableScreens.where((screen) {
          // Check if user has privilege for this screen
          return _privilegesCubit!.checkPrivilege(screen.privilegeId);
        }).toList();
      }

      emit(state.copyWith(
        isLoading: false,
        favoriteScreens: favoriteScreens,
        availableScreens: filteredScreens,
        hasError: false,
      ));
    } catch (e) {
      print('Error loading favorite screens: $e');
      emit(state.copyWith(
        isLoading: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  Future<void> addToFavorites(FavoriteScreenModel screen) async {
    try {
      await _favoriteScreensRepository.addFavoriteScreen(screen);
      
      // Update state
      final updatedFavorites = List<FavoriteScreenModel>.from(state.favoriteScreens)
        ..add(screen);
      
      emit(state.copyWith(favoriteScreens: updatedFavorites));
    } catch (e) {
      print('Error adding to favorites: $e');
      // Handle error
    }
  }

  Future<void> removeFromFavorites(String screenId) async {
    try {
      await _favoriteScreensRepository.removeFavoriteScreen(screenId);
      
      // Update state
      final updatedFavorites = state.favoriteScreens
          .where((screen) => screen.id != screenId)
          .toList();
      
      emit(state.copyWith(favoriteScreens: updatedFavorites));
    } catch (e) {
      print('Error removing from favorites: $e');
      // Handle error
    }
  }

  bool checkPrivilege(String? privilegeId) {
    if (_privilegesCubit != null) {
      return _privilegesCubit!.checkPrivilege(privilegeId);
    }
    // If no privileges cubit available, allow access by default
    return true;
  }
}
