// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i5;

import '../../features/app/data/data_sources/app_datasource.dart' as _i36;
import '../../features/app/data/repositories/app_repository_impl.dart' as _i38;
import '../../features/app/domain/repositories/app_repository.dart' as _i37;
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i47;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i54;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i7;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i9;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i8;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i33;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i13;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i14;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i15;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i16;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i17;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i19;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i39;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i10;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i12;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i11;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i18;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i40;
import '../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i23;
import '../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i25;
import '../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i24;
import '../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i34;
import '../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i43;
import '../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i44;
import '../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i27;
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i52;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i29;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i31;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i30;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i32;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i42;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i53;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i20;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i22;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i21;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i35;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i41;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i45;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i46;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i48;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i49;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i50;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i26;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i28;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i51;
import '../api/client.dart' as _i6;
import 'di_container.dart' as _i55;

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
  gh.factory<_i13.EditClientUserUsecase>(
      () => _i13.EditClientUserUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i14.GetAllClientsListUseCase>(
      () => _i14.GetAllClientsListUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i15.GetClientsListByRegionUseCase>(() =>
      _i15.GetClientsListByRegionUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i16.GetClientsListByUserUseCase>(
      () => _i16.GetClientsListByUserUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i17.GetClientsWithFilterUserUsecase>(() =>
      _i17.GetClientsWithFilterUserUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i18.GetCommunicationListUsecase>(() =>
      _i18.GetCommunicationListUsecase(gh<_i11.CommunicationListRepository>()));
  gh.factory<_i19.GetRecommendedClientsUsecase>(
      () => _i19.GetRecommendedClientsUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i20.ManageWithdrawalsDatasource>(
      () => _i20.ManageWithdrawalsDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i21.ManageWithdrawalsRepository>(() =>
      _i22.ManageWithdrawalsRepositoryImpl(
          gh<_i20.ManageWithdrawalsDatasource>()));
  gh.factory<_i23.PrivilegeDatasource>(
      () => _i23.PrivilegeDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i24.PrivilegeRepository>(
      () => _i25.PrivilegeRepositoryImpl(gh<_i23.PrivilegeDatasource>()));
  gh.factory<_i26.SetApproveSeriesUsecase>(() =>
      _i26.SetApproveSeriesUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i27.UpdatePrivilegeUsecase>(
      () => _i27.UpdatePrivilegeUsecase(gh<_i24.PrivilegeRepository>()));
  gh.factory<_i28.UpdateSeriesUsecase>(
      () => _i28.UpdateSeriesUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i29.UsersDatasource>(
      () => _i29.UsersDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i30.UsersRepository>(
      () => _i31.UsersRepositoryImpl(gh<_i29.UsersDatasource>()));
  gh.factory<_i32.ActionUserUsecase>(
      () => _i32.ActionUserUsecase(gh<_i30.UsersRepository>()));
  gh.factory<_i33.AddClientUserUsecase>(
      () => _i33.AddClientUserUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i34.AddLevelUsecase>(
      () => _i34.AddLevelUsecase(gh<_i24.PrivilegeRepository>()));
  gh.factory<_i35.AddRejectReasonsUsecase>(() =>
      _i35.AddRejectReasonsUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i36.AppDatasource>(() => _i36.AppDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i37.AppRepository>(
      () => _i38.AppRepositoryImpl(gh<_i36.AppDatasource>()));
  gh.factory<_i39.ClientsListBloc>(() => _i39.ClientsListBloc(
        gh<_i17.GetClientsWithFilterUserUsecase>(),
        gh<_i19.GetRecommendedClientsUsecase>(),
        gh<_i33.AddClientUserUsecase>(),
        gh<_i13.EditClientUserUsecase>(),
      ));
  gh.factory<_i40.CommunicationListBloc>(
      () => _i40.CommunicationListBloc(gh<_i18.GetCommunicationListUsecase>()));
  gh.factory<_i41.EditRejectReasonsUsecase>(() =>
      _i41.EditRejectReasonsUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i42.GetAllUsersUsecase>(
      () => _i42.GetAllUsersUsecase(gh<_i30.UsersRepository>()));
  gh.factory<_i43.GetLevelsUsecase>(
      () => _i43.GetLevelsUsecase(gh<_i24.PrivilegeRepository>()));
  gh.factory<_i44.GetPrivilegesUsecase>(
      () => _i44.GetPrivilegesUsecase(gh<_i24.PrivilegeRepository>()));
  gh.factory<_i45.GetRejectReasonsUsecase>(() =>
      _i45.GetRejectReasonsUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i46.GetUserSeriesUsecase>(
      () => _i46.GetUserSeriesUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i47.GetVersionUseCase>(
      () => _i47.GetVersionUseCase(gh<_i37.AppRepository>()));
  gh.factory<_i48.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i48.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i49.GetWithdrawalsInvoicesUsecase>(() =>
      _i49.GetWithdrawalsInvoicesUsecase(
          gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i50.GetWithdrawnDetailsUsecase>(() =>
      _i50.GetWithdrawnDetailsUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i51.ManageWithdrawalsCubit>(
      () => _i51.ManageWithdrawalsCubit(
            gh<_i46.GetUserSeriesUsecase>(),
            gh<_i28.UpdateSeriesUsecase>(),
            gh<_i42.GetAllUsersUsecase>(),
            gh<_i49.GetWithdrawalsInvoicesUsecase>(),
            gh<_i48.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i26.SetApproveSeriesUsecase>(),
            gh<_i50.GetWithdrawnDetailsUsecase>(),
            gh<_i35.AddRejectReasonsUsecase>(),
            gh<_i45.GetRejectReasonsUsecase>(),
            gh<_i41.EditRejectReasonsUsecase>(),
          ));
  gh.lazySingleton<_i52.PrivilegeCubit>(() => _i52.PrivilegeCubit(
        gh<_i43.GetLevelsUsecase>(),
        gh<_i44.GetPrivilegesUsecase>(),
        gh<_i27.UpdatePrivilegeUsecase>(),
        gh<_i34.AddLevelUsecase>(),
      ));
  gh.factory<_i53.UsersCubit>(() => _i53.UsersCubit(
        gh<_i42.GetAllUsersUsecase>(),
        gh<_i32.ActionUserUsecase>(),
      ));
  gh.singleton<_i54.AppManagerCubit>(
      _i54.AppManagerCubit(gh<_i47.GetVersionUseCase>()));
  return getIt;
}

class _$AppModule extends _i55.AppModule {}
