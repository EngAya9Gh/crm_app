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

import '../../features/app/data/data_sources/app_datasource.dart' as _i31;
import '../../features/app/data/repositories/app_repository_impl.dart' as _i33;
import '../../features/app/domain/repositories/app_repository.dart' as _i32;
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i40;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i46;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i7;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i9;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i8;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i29;
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
    as _i34;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i10;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i12;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i11;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i18;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i35;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i25;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i27;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i26;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i28;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i37;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i45;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i20;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i22;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i21;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i30;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i36;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i38;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i39;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i41;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i42;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i43;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i23;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i24;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i44;
import '../api/client.dart' as _i6;
import 'di_container.dart' as _i47;

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
  gh.factory<_i23.SetApproveSeriesUsecase>(() =>
      _i23.SetApproveSeriesUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i24.UpdateSeriesUsecase>(
      () => _i24.UpdateSeriesUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i25.UsersDatasource>(
      () => _i25.UsersDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i26.UsersRepository>(
      () => _i27.UsersRepositoryImpl(gh<_i25.UsersDatasource>()));
  gh.factory<_i28.ActionUserUsecase>(
      () => _i28.ActionUserUsecase(gh<_i26.UsersRepository>()));
  gh.factory<_i29.AddClientUserUsecase>(
      () => _i29.AddClientUserUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i30.AddRejectReasonsUsecase>(() =>
      _i30.AddRejectReasonsUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i31.AppDatasource>(() => _i31.AppDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i32.AppRepository>(
      () => _i33.AppRepositoryImpl(gh<_i31.AppDatasource>()));
  gh.factory<_i34.ClientsListBloc>(() => _i34.ClientsListBloc(
        gh<_i17.GetClientsWithFilterUserUsecase>(),
        gh<_i19.GetRecommendedClientsUsecase>(),
        gh<_i29.AddClientUserUsecase>(),
        gh<_i13.EditClientUserUsecase>(),
      ));
  gh.factory<_i35.CommunicationListBloc>(
      () => _i35.CommunicationListBloc(gh<_i18.GetCommunicationListUsecase>()));
  gh.factory<_i36.EditRejectReasonsUsecase>(() =>
      _i36.EditRejectReasonsUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i37.GetAllUsersUsecase>(
      () => _i37.GetAllUsersUsecase(gh<_i26.UsersRepository>()));
  gh.factory<_i38.GetRejectReasonsUsecase>(() =>
      _i38.GetRejectReasonsUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i39.GetUserSeriesUsecase>(
      () => _i39.GetUserSeriesUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i40.GetVersionUseCase>(
      () => _i40.GetVersionUseCase(gh<_i32.AppRepository>()));
  gh.factory<_i41.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i41.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i42.GetWithdrawalsInvoicesUsecase>(() =>
      _i42.GetWithdrawalsInvoicesUsecase(
          gh<_i21.ManageWithdrawalsRepository>()));
  gh.factory<_i43.GetWithdrawnDetailsUsecase>(() =>
      _i43.GetWithdrawnDetailsUsecase(gh<_i21.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i44.ManageWithdrawalsCubit>(
      () => _i44.ManageWithdrawalsCubit(
            gh<_i39.GetUserSeriesUsecase>(),
            gh<_i24.UpdateSeriesUsecase>(),
            gh<_i37.GetAllUsersUsecase>(),
            gh<_i42.GetWithdrawalsInvoicesUsecase>(),
            gh<_i41.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i23.SetApproveSeriesUsecase>(),
            gh<_i43.GetWithdrawnDetailsUsecase>(),
            gh<_i30.AddRejectReasonsUsecase>(),
            gh<_i38.GetRejectReasonsUsecase>(),
            gh<_i36.EditRejectReasonsUsecase>(),
          ));
  gh.factory<_i45.UsersCubit>(() => _i45.UsersCubit(
        gh<_i37.GetAllUsersUsecase>(),
        gh<_i28.ActionUserUsecase>(),
      ));
  gh.singleton<_i46.AppManagerCubit>(
      _i46.AppManagerCubit(gh<_i40.GetVersionUseCase>()));
  return getIt;
}

class _$AppModule extends _i47.AppModule {}
