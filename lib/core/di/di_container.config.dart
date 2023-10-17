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
    as _i19;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i15;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i17;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i16;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i18;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i20;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i25;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i11;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i13;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i12;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i21;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i22;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i23;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i14;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i24;
import '../api/client.dart' as _i6;
import 'di_container.dart' as _i26;

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
  gh.factory<_i11.ManageWithdrawalsDatasource>(
      () => _i11.ManageWithdrawalsDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i12.ManageWithdrawalsRepository>(() =>
      _i13.ManageWithdrawalsRepositoryImpl(
          gh<_i11.ManageWithdrawalsDatasource>()));
  gh.factory<_i14.UpdateSeriesUsecase>(
      () => _i14.UpdateSeriesUsecase(gh<_i12.ManageWithdrawalsRepository>()));
  gh.factory<_i15.UsersDatasource>(
      () => _i15.UsersDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i16.UsersRepository>(
      () => _i17.UsersRepositoryImpl(gh<_i15.UsersDatasource>()));
  gh.factory<_i18.ActionUserUsecase>(
      () => _i18.ActionUserUsecase(gh<_i16.UsersRepository>()));
  gh.factory<_i19.CommunicationListBloc>(
      () => _i19.CommunicationListBloc(gh<_i10.GetCommunicationListUsecase>()));
  gh.factory<_i20.GetAllUsersUsecase>(
      () => _i20.GetAllUsersUsecase(gh<_i16.UsersRepository>()));
  gh.factory<_i21.GetUserSeriesUsecase>(
      () => _i21.GetUserSeriesUsecase(gh<_i12.ManageWithdrawalsRepository>()));
  gh.factory<_i22.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i22.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i12.ManageWithdrawalsRepository>()));
  gh.factory<_i23.GetWithdrawalsInvoicesUsecase>(() =>
      _i23.GetWithdrawalsInvoicesUsecase(
          gh<_i12.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i24.ManageWithdrawalsCubit>(
      () => _i24.ManageWithdrawalsCubit(
            gh<_i21.GetUserSeriesUsecase>(),
            gh<_i14.UpdateSeriesUsecase>(),
            gh<_i20.GetAllUsersUsecase>(),
            gh<_i23.GetWithdrawalsInvoicesUsecase>(),
            gh<_i22.GetWithdrawalInvoiceDetailsUsecase>(),
          ));
  gh.factory<_i25.UsersCubit>(() => _i25.UsersCubit(
        gh<_i20.GetAllUsersUsecase>(),
        gh<_i18.ActionUserUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i26.AppModule {}
