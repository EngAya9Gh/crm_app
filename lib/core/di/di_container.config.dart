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

import '../../features/app/data/data_sources/app_datasource.dart' as _i38;
import '../../features/app/data/repositories/app_repository_impl.dart' as _i40;
import '../../features/app/domain/repositories/app_repository.dart' as _i39;
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i53;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i61;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i5;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i7;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i6;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i34;
import '../../features/clients_list/domain/use_cases/changeTypeClient.dart'
    as _i42;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i11;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i12;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i13;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i14;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i15;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i17;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i43;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i8;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i10;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i9;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i16;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i44;
import '../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i21;
import '../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i23;
import '../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i22;
import '../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i35;
import '../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i48;
import '../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i49;
import '../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i28;
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i58;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i30;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i32;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i31;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i33;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i47;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i60;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i18;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i20;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i19;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i36;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i45;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i50;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i51;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i54;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i55;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i56;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i24;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i29;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i57;
import '../../features/task_management/data/data_sources/task_datasource.dart'
    as _i25;
import '../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i27;
import '../../features/task_management/domain/repositories/task_repository.dart'
    as _i26;
import '../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i37;
import '../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i41;
import '../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i46;
import '../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i52;
import '../../features/task_management/presentation/manager/task_cubit.dart'
    as _i59;
import '../api/client.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.ClientApi>(() => _i3.ClientApi(gh<_i4.Dio>()));
  gh.factory<_i5.ClientsListDatasource>(
      () => _i5.ClientsListDatasource(gh<_i3.ClientApi>()));
  gh.factory<_i6.ClientsListRepository>(
      () => _i7.ClientsListRepositoryImpl(gh<_i5.ClientsListDatasource>()));
  gh.factory<_i8.CommunicationListDatasource>(
      () => _i8.CommunicationListDatasource(gh<_i3.ClientApi>()));
  gh.factory<_i9.CommunicationListRepository>(() =>
      _i10.CommunicationListRepositoryImpl(
          gh<_i8.CommunicationListDatasource>()));
  gh.factory<_i11.EditClientUserUsecase>(
      () => _i11.EditClientUserUsecase(gh<_i6.ClientsListRepository>()));
  gh.factory<_i12.GetAllClientsListUseCase>(
      () => _i12.GetAllClientsListUseCase(gh<_i6.ClientsListRepository>()));
  gh.factory<_i13.GetClientsListByRegionUseCase>(() =>
      _i13.GetClientsListByRegionUseCase(gh<_i6.ClientsListRepository>()));
  gh.factory<_i14.GetClientsListByUserUseCase>(
      () => _i14.GetClientsListByUserUseCase(gh<_i6.ClientsListRepository>()));
  gh.factory<_i15.GetClientsWithFilterUserUsecase>(() =>
      _i15.GetClientsWithFilterUserUsecase(gh<_i6.ClientsListRepository>()));
  gh.factory<_i16.GetCommunicationListUsecase>(() =>
      _i16.GetCommunicationListUsecase(gh<_i9.CommunicationListRepository>()));
  gh.factory<_i17.GetRecommendedClientsUsecase>(
      () => _i17.GetRecommendedClientsUsecase(gh<_i6.ClientsListRepository>()));
  gh.factory<_i18.ManageWithdrawalsDatasource>(
      () => _i18.ManageWithdrawalsDatasource(gh<_i3.ClientApi>()));
  gh.factory<_i19.ManageWithdrawalsRepository>(() =>
      _i20.ManageWithdrawalsRepositoryImpl(
          gh<_i18.ManageWithdrawalsDatasource>()));
  gh.factory<_i21.PrivilegeDatasource>(
      () => _i21.PrivilegeDatasource(gh<_i3.ClientApi>()));
  gh.factory<_i22.PrivilegeRepository>(
      () => _i23.PrivilegeRepositoryImpl(gh<_i21.PrivilegeDatasource>()));
  gh.factory<_i24.SetApproveSeriesUsecase>(() =>
      _i24.SetApproveSeriesUsecase(gh<_i19.ManageWithdrawalsRepository>()));
  gh.factory<_i25.TaskDatasource>(
      () => _i25.TaskDatasource(gh<_i3.ClientApi>()));
  gh.factory<_i26.TaskRepository>(
      () => _i27.TaskRepositoryImpl(gh<_i25.TaskDatasource>()));
  gh.factory<_i28.UpdatePrivilegeUsecase>(
      () => _i28.UpdatePrivilegeUsecase(gh<_i22.PrivilegeRepository>()));
  gh.factory<_i29.UpdateSeriesUsecase>(
      () => _i29.UpdateSeriesUsecase(gh<_i19.ManageWithdrawalsRepository>()));
  gh.factory<_i30.UsersDatasource>(
      () => _i30.UsersDatasource(gh<_i3.ClientApi>()));
  gh.factory<_i31.UsersRepository>(
      () => _i32.UsersRepositoryImpl(gh<_i30.UsersDatasource>()));
  gh.factory<_i33.ActionUserUsecase>(
      () => _i33.ActionUserUsecase(gh<_i31.UsersRepository>()));
  gh.factory<_i34.AddClientUserUsecase>(
      () => _i34.AddClientUserUsecase(gh<_i6.ClientsListRepository>()));
  gh.factory<_i35.AddLevelUsecase>(
      () => _i35.AddLevelUsecase(gh<_i22.PrivilegeRepository>()));
  gh.factory<_i36.AddRejectReasonsUsecase>(() =>
      _i36.AddRejectReasonsUsecase(gh<_i19.ManageWithdrawalsRepository>()));
  gh.factory<_i37.AddTaskUsecase>(
      () => _i37.AddTaskUsecase(gh<_i26.TaskRepository>()));
  gh.factory<_i38.AppDatasource>(() => _i38.AppDatasource(gh<_i3.ClientApi>()));
  gh.factory<_i39.AppRepository>(
      () => _i40.AppRepositoryImpl(gh<_i38.AppDatasource>()));
  gh.factory<_i41.ChangeStatusTaskUsecase>(
      () => _i41.ChangeStatusTaskUsecase(gh<_i26.TaskRepository>()));
  gh.factory<_i42.ChangeTypeClientUsecase>(
      () => _i42.ChangeTypeClientUsecase(gh<_i6.ClientsListRepository>()));
  gh.factory<_i43.ClientsListBloc>(() => _i43.ClientsListBloc(
        gh<_i15.GetClientsWithFilterUserUsecase>(),
        gh<_i17.GetRecommendedClientsUsecase>(),
        gh<_i34.AddClientUserUsecase>(),
        gh<_i11.EditClientUserUsecase>(),
        gh<_i42.ChangeTypeClientUsecase>(),
      ));
  gh.factory<_i44.CommunicationListBloc>(
      () => _i44.CommunicationListBloc(gh<_i16.GetCommunicationListUsecase>()));
  gh.factory<_i45.EditRejectReasonsUsecase>(() =>
      _i45.EditRejectReasonsUsecase(gh<_i19.ManageWithdrawalsRepository>()));
  gh.factory<_i46.FilterTaskUsecase>(
      () => _i46.FilterTaskUsecase(gh<_i26.TaskRepository>()));
  gh.factory<_i47.GetAllUsersUsecase>(
      () => _i47.GetAllUsersUsecase(gh<_i31.UsersRepository>()));
  gh.factory<_i48.GetLevelsUsecase>(
      () => _i48.GetLevelsUsecase(gh<_i22.PrivilegeRepository>()));
  gh.factory<_i49.GetPrivilegesUsecase>(
      () => _i49.GetPrivilegesUsecase(gh<_i22.PrivilegeRepository>()));
  gh.factory<_i50.GetRejectReasonsUsecase>(() =>
      _i50.GetRejectReasonsUsecase(gh<_i19.ManageWithdrawalsRepository>()));
  gh.factory<_i51.GetUserSeriesUsecase>(
      () => _i51.GetUserSeriesUsecase(gh<_i19.ManageWithdrawalsRepository>()));
  gh.factory<_i52.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i52.GetUsersByDepartmentAndRegionUsecase(gh<_i26.TaskRepository>()));
  gh.factory<_i53.GetVersionUseCase>(
      () => _i53.GetVersionUseCase(gh<_i39.AppRepository>()));
  gh.factory<_i54.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i54.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i19.ManageWithdrawalsRepository>()));
  gh.factory<_i55.GetWithdrawalsInvoicesUsecase>(() =>
      _i55.GetWithdrawalsInvoicesUsecase(
          gh<_i19.ManageWithdrawalsRepository>()));
  gh.factory<_i56.GetWithdrawnDetailsUsecase>(() =>
      _i56.GetWithdrawnDetailsUsecase(gh<_i19.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i57.ManageWithdrawalsCubit>(
      () => _i57.ManageWithdrawalsCubit(
            gh<_i51.GetUserSeriesUsecase>(),
            gh<_i29.UpdateSeriesUsecase>(),
            gh<_i47.GetAllUsersUsecase>(),
            gh<_i55.GetWithdrawalsInvoicesUsecase>(),
            gh<_i54.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i24.SetApproveSeriesUsecase>(),
            gh<_i56.GetWithdrawnDetailsUsecase>(),
            gh<_i36.AddRejectReasonsUsecase>(),
            gh<_i50.GetRejectReasonsUsecase>(),
            gh<_i45.EditRejectReasonsUsecase>(),
          ));
  gh.lazySingleton<_i58.PrivilegeCubit>(() => _i58.PrivilegeCubit(
        gh<_i48.GetLevelsUsecase>(),
        gh<_i49.GetPrivilegesUsecase>(),
        gh<_i28.UpdatePrivilegeUsecase>(),
        gh<_i35.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i59.TaskCubit>(() => _i59.TaskCubit(
        gh<_i37.AddTaskUsecase>(),
        gh<_i46.FilterTaskUsecase>(),
        gh<_i41.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i60.UsersCubit>(() => _i60.UsersCubit(
        gh<_i47.GetAllUsersUsecase>(),
        gh<_i33.ActionUserUsecase>(),
        gh<_i52.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.singleton<_i61.AppManagerCubit>(
      _i61.AppManagerCubit(gh<_i53.GetVersionUseCase>()));
  return getIt;
}
