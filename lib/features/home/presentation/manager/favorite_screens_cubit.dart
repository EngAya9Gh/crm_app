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
      print('[FavoriteScreensCubit] Starting loadFavoriteScreens');

      // Load favorite screens from local storage
      final favoriteScreens = await _favoriteScreensRepository.getFavoriteScreens();
      print('[FavoriteScreensCubit] Loaded ${favoriteScreens.length} favorite screens from storage');
      
      // Load available screens
      final availableScreens = _availableScreensRepository.getAllAvailableScreens();
      print('[FavoriteScreensCubit] Loaded ${availableScreens.length} available screens');
      
      // Filter available screens based on privileges if PrivilegesCubit is available
      List<FavoriteScreenModel> filteredScreens = availableScreens;
      
      if (_privilegesCubit != null) {
        try {
          filteredScreens = availableScreens.where((screen) {
            // Check if user has privilege for this screen
            return _privilegesCubit!.checkPrivilege(screen.privilegeId);
          }).toList();
          print('[FavoriteScreensCubit] Filtered to ${filteredScreens.length} screens based on privileges');
        } catch (e) {
          print('[FavoriteScreensCubit] Error checking privileges, using all available screens: $e');
          // If privilege checking fails, use all available screens
          filteredScreens = availableScreens;
        }
      } else {
        print('[FavoriteScreensCubit] No privileges cubit available, using all available screens');
      }

      emit(state.copyWith(
        isLoading: false,
        favoriteScreens: favoriteScreens,
        availableScreens: filteredScreens,
        hasError: false,
        errorMessage: null,
      ));
      
      print('[FavoriteScreensCubit] Successfully loaded favorite screens');
    } catch (e) {
      print('[FavoriteScreensCubit] Error loading favorite screens: $e');
      
      // Don't show error for authentication-related issues
      if (e.toString().contains('401') || 
          e.toString().contains('403') || 
          e.toString().contains('Unauthorized') ||
          e.toString().contains('token')) {
        print('[FavoriteScreensCubit] Authentication error, not showing error state');
        emit(state.copyWith(
          isLoading: false,
          favoriteScreens: [],
          availableScreens: [],
          hasError: false,
          errorMessage: null,
        ));
      } else {
        emit(state.copyWith(
          isLoading: false,
          hasError: true,
          errorMessage: 'حدث خطأ في تحميل الواجهات المفضلة',
        ));
      }
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
