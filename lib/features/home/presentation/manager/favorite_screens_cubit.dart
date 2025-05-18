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
      final userFavorites =
          await _favoriteScreensRepository.getFavoriteScreens();

      // Get user privileges for filtering
      final userPrivileges = _privilegesCubit.getAllPrivileges();
      print('User privileges: $userPrivileges');

      // Get ALL available screens
      final allAvailableScreens =
          _availableScreensRepository.getAllAvailableScreens();

      // Filter available screens based on user privileges
      final availableScreens = allAvailableScreens.where((screen) {
        // إذا كان privilegeId هو null، فهذا يعني أن الواجهة متاحة للجميع
        // وإلا، يجب أن يكون المستخدم لديه الصلاحية المطلوبة
        return screen.privilegeId == null ||
            userPrivileges.contains(screen.privilegeId);
      }).toList();

      print(
          'Available screens after filtering: ${availableScreens.length} out of ${allAvailableScreens.length}');

      // Filter favorites to include only screens the user has access to
      final filteredFavorites = userFavorites.where((favorite) {
        // إذا كانت الواجهة المفضلة ليس لها privilegeId، فهي متاحة للجميع
        // وإلا، يجب أن يكون المستخدم لديه الصلاحية المطلوبة
        return favorite.privilegeId == null ||
            userPrivileges.contains(favorite.privilegeId);
      }).toList();

      print(
          'Filtered favorites: ${filteredFavorites.length} out of ${userFavorites.length}');

      emit(state.copyWith(
        status: FavoriteScreensStatus.success,
        favoriteScreens: filteredFavorites,
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
      final success =
          await _favoriteScreensRepository.addFavoriteScreen(screen);

      if (success) {
        final updatedFavorites =
            List<FavoriteScreenModel>.from(state.favoriteScreens)..add(screen);

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
