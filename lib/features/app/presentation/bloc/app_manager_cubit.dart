import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crm_smart/core/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/app/data/models/update_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tuple/tuple.dart';

import '../../../../api/api.dart';
import '../../../../core/services/cache_services/cache_services.dart';
import '../../../../core/services/cache_services/secure_storage_consumer.dart';
import '../../../../core/services/di/di_container.dart';
import '../../../../core/utils/app_navigator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../model/usermodel.dart';
import '../../../../ui/screen/home/home.dart';
import '../../../../view_model/user_vm_provider.dart';
import '../../../auth/login/presentation/manager/login_cubit/login_cubit.dart';
import '../../../auth/login/presentation/pages/login_page.dart';
import '../../domain/use_cases/get_version_usecase.dart';
import '../pages/not_allowed_page.dart';

part 'app_manager_state.dart';

@singleton
class AppManagerCubit extends Cubit<AppManagerState> {
  AppManagerCubit(this._getVersionUseCase)
      : super(AppManagerState(
            lightThemeData: ThemeData.light(),
            darkThemeData: ThemeData.dark()));

  final GetVersionUseCase _getVersionUseCase;

  checkAppUpdate(ValueChanged<bool> onSuccess) async {
    emit(state.copyWith(updateState: const PageState.loading()));

    final response = await _getVersionUseCase();

    response.extract(
      (exception, message) {
        emit(state.copyWith(updateState: PageState.error()));
      },
      (value) async {
        final check = await checkUpdate(value.message ?? []);

        onSuccess(check?.item1 ?? false);

        emit(state.copyWith(
          updateState: PageState.loaded(data: value.message ?? []),
          hasUpdate: check?.item1,
          isUpdateMandatory: check?.item2,
        ));
      },
    );
  }

  static Future<Tuple2<bool, bool>?> checkUpdate(
      List<UpdateConfig> versions) async {
    try {
      final result = versions.firstWhereOrNull(
          (element) => element.typeVersion?.name == Platform.operatingSystem);

      if (result == null) {
        return null;
      }

      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      bool hasUpdate = false;

      final remoteAppVersion = result.nameVersion!.replaceAll('V', '').trim();

      final remoteAppBuildNumber = remoteAppVersion.split('+').length > 1
          ? int.parse(remoteAppVersion.split('+').last)
          : 1;

      bool updateMandatory = result.isRequired ?? false;

      final Tuple3<int, int, int> remoteAppVersionRecord =
          convertVersionToNum(remoteAppVersion);

      final appVersion = packageInfo.version;
      final appBuildNumber = int.parse(packageInfo.buildNumber);
      debugPrint('remoteAppVersion');
      debugPrint(remoteAppVersion);
      debugPrint('appVersion');
      debugPrint(appVersion);
      debugPrint('appBuildNumber');
      debugPrint(appBuildNumber.toString());
      final Tuple3<int, int, int> appVersionRecord =
          convertVersionToNum(appVersion);

      if (appVersionRecord.item1 < remoteAppVersionRecord.item1) {
        hasUpdate = true;
      }

      if (appVersionRecord.item2 < remoteAppVersionRecord.item2 && !hasUpdate) {
        hasUpdate = true;
      }

      if (appVersionRecord.item3 < remoteAppVersionRecord.item3 && !hasUpdate) {
        hasUpdate = true;
      }

      if (appBuildNumber < remoteAppBuildNumber && !hasUpdate) {
        hasUpdate = true;
      }

      updateMandatory = hasUpdate ? updateMandatory : false;
      hasUpdate = updateMandatory ? true : hasUpdate;
      // uncomment this line to go directly to the home page while developing
      // hasUpdate = false;

      return Tuple2(hasUpdate, updateMandatory);
    } catch (e) {
      return null;
    }
  }

  static Tuple3<int, int, int> convertVersionToNum(String version) {
    final versionAll = version.split('+');
    final list = versionAll.first.split('.');

    final major = int.parse(list.firstOrNull ?? '1');

    int minor = 0;
    if (list.length > 1) {
      minor = int.parse(list[1]);
    }

    int patch = 0;
    if (list.length > 2) {
      patch = int.parse(list[2]);
    }

    return Tuple3(major, minor, patch);
  }

  Future checkRedirections(BuildContext context) async {
    emit(state.copyWith(checkRedirectionsState: const PageState.loading()));

    final isTokenValid = await _validateToken(context);

    if (!isTokenValid!) return;

    final UserModel? user = await _validateUser(context);

    if (user == null) return;

    if (user.isActive == '0') {
      AppNavigator.pushReplacement(NotAllowedPage());
      return;
    }

    AppNavigator.pushReplacement(Home());

    emit(state.copyWith(
        checkRedirectionsState: const PageState.loaded(data: null)));
  }

  Future<bool?> _validateToken(BuildContext context) async {
    final isTokenValid = await context.read<LoginCubit>().validateToken();

    if (isTokenValid == null) {
      emit(state.copyWith(checkRedirectionsState: const PageState.error()));
      return false;
    }

    if (!isTokenValid) {
      _gotoLogin();
      return false;
    }

    return true;
  }

  Future<UserModel?> _validateUser(BuildContext context) async {
    try {
      final user = await context.read<UserProvider>().getCurrentUser();
      if (user == null) {
        _gotoLogin();
        return null;
      }
      return user;
    } catch (e) {
      emit(state.copyWith(checkRedirectionsState: const PageState.error()));
    }
    return null;
  }

  void _gotoLogin() {
    AppNavigator.pushReplacement(LoginPage());
    _clearToken();
  }

  static Future<void> _clearToken() async {
    final secureStorage = getIt<CacheServices>(
      instanceName: SecureStorageConsumer.name,
    );
    await secureStorage.removeData(key: AppStrings.secureStorage.token);
    Api.token = null;
  }
}
