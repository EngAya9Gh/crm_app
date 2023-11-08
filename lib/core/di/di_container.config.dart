// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
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
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i30;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i14;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i15;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i16;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i17;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i18;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i20;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i32;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i11;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i13;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i12;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i19;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i33;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i26;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i28;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i27;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i29;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i35;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i42;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i21;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i23;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i22;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i31;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i34;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i36;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i37;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i38;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i39;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i40;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i24;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i25;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i41;
import '../api/client.dart' as _i7;
import 'di_container.dart' as _i43;

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
  gh.factory<_i14.EditClientUserUsecase>(
      () => _i14.EditClientUserUsecase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i15.GetAllClientsListUseCase>(
      () => _i15.GetAllClientsListUseCase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i16.GetClientsListByRegionUseCase>(() =>
      _i16.GetClientsListByRegionUseCase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i17.GetClientsListByUserUseCase>(
      () => _i17.GetClientsListByUserUseCase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i18.GetClientsWithFilterUserUsecase>(() =>
      _i18.GetClientsWithFilterUserUsecase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i19.GetCommunicationListUsecase>(() =>
      _i19.GetCommunicationListUsecase(gh<_i12.CommunicationListRepository>()));
  gh.factory<_i20.GetRecommendedClientsUsecase>(
      () => _i20.GetRecommendedClientsUsecase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i21.ManageWithdrawalsDatasource>(
      () => _i21.ManageWithdrawalsDatasource(gh<_i7.ClientApi>()));
  gh.factory<_i22.ManageWithdrawalsRepository>(() =>
      _i23.ManageWithdrawalsRepositoryImpl(
          gh<_i21.ManageWithdrawalsDatasource>()));
  gh.factory<_i24.SetApproveSeriesUsecase>(() =>
      _i24.SetApproveSeriesUsecase(gh<_i22.ManageWithdrawalsRepository>()));
  gh.factory<_i25.UpdateSeriesUsecase>(
      () => _i25.UpdateSeriesUsecase(gh<_i22.ManageWithdrawalsRepository>()));
  gh.factory<_i26.UsersDatasource>(
      () => _i26.UsersDatasource(gh<_i7.ClientApi>()));
  gh.factory<_i27.UsersRepository>(
      () => _i28.UsersRepositoryImpl(gh<_i26.UsersDatasource>()));
  gh.factory<_i29.ActionUserUsecase>(
      () => _i29.ActionUserUsecase(gh<_i27.UsersRepository>()));
  gh.factory<_i30.AddClientUserUsecase>(
      () => _i30.AddClientUserUsecase(gh<_i9.ClientsListRepository>()));
  gh.factory<_i31.AddRejectReasonsUsecase>(() =>
      _i31.AddRejectReasonsUsecase(gh<_i22.ManageWithdrawalsRepository>()));
  gh.factory<_i32.ClientsListBloc>(() => _i32.ClientsListBloc(
        gh<_i18.GetClientsWithFilterUserUsecase>(),
        gh<_i20.GetRecommendedClientsUsecase>(),
        gh<_i30.AddClientUserUsecase>(),
        gh<_i14.EditClientUserUsecase>(),
      ));
  gh.factory<_i33.CommunicationListBloc>(
      () => _i33.CommunicationListBloc(gh<_i19.GetCommunicationListUsecase>()));
  gh.factory<_i34.EditRejectReasonsUsecase>(() =>
      _i34.EditRejectReasonsUsecase(gh<_i22.ManageWithdrawalsRepository>()));
  gh.factory<_i35.GetAllUsersUsecase>(
      () => _i35.GetAllUsersUsecase(gh<_i27.UsersRepository>()));
  gh.factory<_i36.GetRejectReasonsUsecase>(() =>
      _i36.GetRejectReasonsUsecase(gh<_i22.ManageWithdrawalsRepository>()));
  gh.factory<_i37.GetUserSeriesUsecase>(
      () => _i37.GetUserSeriesUsecase(gh<_i22.ManageWithdrawalsRepository>()));
  gh.factory<_i38.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i38.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i22.ManageWithdrawalsRepository>()));
  gh.factory<_i39.GetWithdrawalsInvoicesUsecase>(() =>
      _i39.GetWithdrawalsInvoicesUsecase(
          gh<_i22.ManageWithdrawalsRepository>()));
  gh.factory<_i40.GetWithdrawnDetailsUsecase>(() =>
      _i40.GetWithdrawnDetailsUsecase(gh<_i22.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i41.ManageWithdrawalsCubit>(
      () => _i41.ManageWithdrawalsCubit(
            gh<_i37.GetUserSeriesUsecase>(),
            gh<_i25.UpdateSeriesUsecase>(),
            gh<_i35.GetAllUsersUsecase>(),
            gh<_i39.GetWithdrawalsInvoicesUsecase>(),
            gh<_i38.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i24.SetApproveSeriesUsecase>(),
            gh<_i40.GetWithdrawnDetailsUsecase>(),
            gh<_i31.AddRejectReasonsUsecase>(),
            gh<_i36.GetRejectReasonsUsecase>(),
            gh<_i34.EditRejectReasonsUsecase>(),
          ));
  gh.factory<_i42.UsersCubit>(() => _i42.UsersCubit(
        gh<_i35.GetAllUsersUsecase>(),
        gh<_i29.ActionUserUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i43.AppModule {}
