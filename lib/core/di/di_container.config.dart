// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i7;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i9;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i8;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i10;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i11;
import '../api/client.dart' as _i6;
import 'di_container.dart' as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i3.BaseOptions>(() => appModule.dioOption);
  gh.singleton<_i4.Logger>(appModule.logger);
  await gh.singletonAsync<_i5.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i3.Dio>(() => appModule.dio(
        gh<_i3.BaseOptions>(),
        gh<_i4.Logger>(),
      ));
  gh.factory<_i6.ClientApi>(() => _i6.ClientApi(gh<_i3.Dio>()));
  gh.factory<_i7.CommunicationListDatasource>(
      () => _i7.CommunicationListDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i8.CommunicationListRepository>(() =>
      _i9.CommunicationListRepositoryImpl(
          gh<_i7.CommunicationListDatasource>()));
  gh.factory<_i10.GetCommunicationListUsecase>(() =>
      _i10.GetCommunicationListUsecase(gh<_i8.CommunicationListRepository>()));
  gh.factory<_i11.CommunicationListBloc>(
      () => _i11.CommunicationListBloc(gh<_i10.GetCommunicationListUsecase>()));
  return getIt;
}

class _$AppModule extends _i12.AppModule {}
