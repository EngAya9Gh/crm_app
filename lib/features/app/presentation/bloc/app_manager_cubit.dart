import 'dart:io';

import 'package:collection/collection.dart';
import 'package:crm_smart/common/models/page_state/page_state.dart';
import 'package:crm_smart/features/app/data/models/update_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:tuple/tuple.dart';

import '../../domain/use_cases/get_version_usecase.dart';

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

    response.fold(
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

      final updateMandatory = result.isRequired ?? false;

      final Tuple3<int, int, int> remoteAppVersionRecord =
          convertVersionToNum(remoteAppVersion);

      final appVersion = packageInfo.version;
      final appBuildNumber = int.parse(packageInfo.buildNumber);
      print('remoteAppVersion');
      print(remoteAppVersion);
      print('appVersion');
      print(appVersion);
      print('appBuildNumber');
      print(appBuildNumber);
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
}
