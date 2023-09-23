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

import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i7;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i9;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i8;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i13;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i14;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i15;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i17;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i10;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i12;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i11;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i16;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i18;
import '../api/client.dart' as _i6;
import 'di_container.dart' as _i19;

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
  gh.factory<_i7.ClientsListDatasource>(
      () => _i7.ClientsListDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i8.ClientsListRepository>(
      () => _i9.ClientsListRepositoryImpl(gh<_i7.ClientsListDatasource>()));
  gh.factory<_i10.CommunicationListDatasource>(
      () => _i10.CommunicationListDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i11.CommunicationListRepository>(() =>
      _i12.CommunicationListRepositoryImpl(
          gh<_i10.CommunicationListDatasource>()));
  gh.factory<_i13.GetAllClientsListUseCase>(
      () => _i13.GetAllClientsListUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i14.GetClientsListByRegionUseCase>(() =>
      _i14.GetClientsListByRegionUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i15.GetClientsListByUserUseCase>(
      () => _i15.GetClientsListByUserUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i16.GetCommunicationListUsecase>(() =>
      _i16.GetCommunicationListUsecase(gh<_i11.CommunicationListRepository>()));
  gh.factory<_i17.ClientsListBloc>(() => _i17.ClientsListBloc(
        gh<_i13.GetAllClientsListUseCase>(),
        gh<_i15.GetClientsListByUserUseCase>(),
        gh<_i14.GetClientsListByRegionUseCase>(),
      ));
  gh.factory<_i18.CommunicationListBloc>(
      () => _i18.CommunicationListBloc(gh<_i16.GetCommunicationListUsecase>()));
  return getIt;
}

class _$AppModule extends _i19.AppModule {}
