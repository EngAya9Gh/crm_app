// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i3;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i8;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i10;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i9;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i14;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i15;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i16;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i17;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i28;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i11;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i13;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i12;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i18;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i29;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i24;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i26;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i25;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i27;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i30;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i36;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i19;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i21;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i20;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i31;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i32;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i33;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i34;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i22;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i23;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i35;
import '../api/client.dart' as _i7;
import 'di_container.dart' as _i37;

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
  gh.singleton<_i3.AppManagerCubit>(_i3.AppManagerCubit());
  gh.factory<_i4.BaseOptions>(() => appModule.dioOption);
  gh.singleton<_i5.Logger>(appModule.logger);
  await gh.singletonAsync<_i6.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i4.Dio>(() => appModule.dio(
        gh<_i4.BaseOptions>(),
        gh<_i5.Logger>(),
      ));
  gh.factory<_i7.ClientApi>(() => _i7.ClientApi(gh<_i4.Dio>()));
  gh.factory<_i8.ClientsListDatasource>(
      () => _i8.ClientsListDatasource(gh<_i7.ClientApi>()));
  gh.factory<_i9.ClientsListRepository>(
      () => _i10.ClientsListRepositoryImpl(gh<_i8.ClientsListDatasource>()));
  gh.factory<_i11.CommunicationListDatasource>(
      () => _i11.CommunicationListDatasource(gh<_i7.ClientApi>()));
  gh.factory<_i12.CommunicationListRepository>(() =>
      _i13.CommunicationListRepositoryImpl(
          gh<_i11.CommunicationListDatasource>()));
  gh.factory<_i14.GetAllClientsListUseCase>(
      () => _i14.GetAllClientsListUseCase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i15.GetClientsListByRegionUseCase>(() =>
      _i15.GetClientsListByRegionUseCase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i16.GetClientsListByUserUseCase>(
      () => _i16.GetClientsListByUserUseCase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i17.GetClientsWithFilterUserUsecase>(() =>
      _i17.GetClientsWithFilterUserUsecase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i18.GetCommunicationListUsecase>(() =>
      _i18.GetCommunicationListUsecase(gh<_i12.CommunicationListRepository>()));
  gh.factory<_i19.ManageWithdrawalsDatasource>(
      () => _i19.ManageWithdrawalsDatasource(gh<_i7.ClientApi>()));
  gh.factory<_i20.ManageWithdrawalsRepository>(() =>
      _i21.ManageWithdrawalsRepositoryImpl(
          gh<_i19.ManageWithdrawalsDatasource>()));
  gh.factory<_i22.SetApproveSeriesUsecase>(() =>
      _i22.SetApproveSeriesUsecase(gh<_i20.ManageWithdrawalsRepository>()));
  gh.factory<_i23.UpdateSeriesUsecase>(
      () => _i23.UpdateSeriesUsecase(gh<_i20.ManageWithdrawalsRepository>()));
  gh.factory<_i24.UsersDatasource>(
      () => _i24.UsersDatasource(gh<_i7.ClientApi>()));
  gh.factory<_i25.UsersRepository>(
      () => _i26.UsersRepositoryImpl(gh<_i24.UsersDatasource>()));
  gh.factory<_i27.ActionUserUsecase>(
      () => _i27.ActionUserUsecase(gh<_i25.UsersRepository>()));
  gh.factory<_i28.ClientsListBloc>(
      () => _i28.ClientsListBloc(gh<_i17.GetClientsWithFilterUserUsecase>()));
  gh.factory<_i29.CommunicationListBloc>(
      () => _i29.CommunicationListBloc(gh<_i18.GetCommunicationListUsecase>()));
  gh.factory<_i30.GetAllUsersUsecase>(
      () => _i30.GetAllUsersUsecase(gh<_i25.UsersRepository>()));
  gh.factory<_i31.GetUserSeriesUsecase>(
      () => _i31.GetUserSeriesUsecase(gh<_i20.ManageWithdrawalsRepository>()));
  gh.factory<_i32.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i32.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i20.ManageWithdrawalsRepository>()));
  gh.factory<_i33.GetWithdrawalsInvoicesUsecase>(() =>
      _i33.GetWithdrawalsInvoicesUsecase(
          gh<_i20.ManageWithdrawalsRepository>()));
  gh.factory<_i34.GetWithdrawnDetailsUsecase>(() =>
      _i34.GetWithdrawnDetailsUsecase(gh<_i20.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i35.ManageWithdrawalsCubit>(
      () => _i35.ManageWithdrawalsCubit(
            gh<_i31.GetUserSeriesUsecase>(),
            gh<_i23.UpdateSeriesUsecase>(),
            gh<_i30.GetAllUsersUsecase>(),
            gh<_i33.GetWithdrawalsInvoicesUsecase>(),
            gh<_i32.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i22.SetApproveSeriesUsecase>(),
            gh<_i34.GetWithdrawnDetailsUsecase>(),
          ));
  gh.factory<_i36.UsersCubit>(() => _i36.UsersCubit(
        gh<_i30.GetAllUsersUsecase>(),
        gh<_i27.ActionUserUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i37.AppModule {}
