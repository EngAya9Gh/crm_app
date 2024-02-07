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

import '../../features/app/data/data_sources/app_datasource.dart' as _i51;
import '../../features/app/data/repositories/app_repository_impl.dart' as _i53;
import '../../features/app/domain/repositories/app_repository.dart' as _i52;
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i69;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i82;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i7;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i9;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i8;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i46;
import '../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i54;
import '../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i56;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i16;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i17;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i18;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i19;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i20;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i23;
import '../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i24;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i57;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i11;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i13;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i12;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i22;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i58;
import '../../features/company/data/data_sources/company_datasource.dart'
    as _i10;
import '../../features/company/data/repositories/com_repo_impl.dart' as _i15;
import '../../features/company/domain/repositories/comment_repo.dart' as _i14;
import '../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i47;
import '../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i21;
import '../../features/company/presentation/manager/company_cubit.dart' as _i59;
import '../../features/links/data/data_sources/link_datasource.dart' as _i25;
import '../../features/links/data/repositories/link_repo_impl.dart' as _i27;
import '../../features/links/domain/repositories/links_repo.dart' as _i26;
import '../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i44;
import '../../features/links/domain/use_cases/get_link_usecase.dart' as _i64;
import '../../features/links/presentation/manager/link_cubit.dart' as _i73;
import '../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i31;
import '../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i76;
import '../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i75;
import '../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i81;
import '../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i83;
import '../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i84;
import '../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i85;
import '../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i86;
import '../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i77;
import '../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i87;
import '../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i32;
import '../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i34;
import '../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i33;
import '../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i48;
import '../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i63;
import '../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i65;
import '../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i39;
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i78;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i41;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i43;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i42;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i45;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i62;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i80;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i28;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i30;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i29;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i49;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i60;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i66;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i67;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i70;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i71;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i72;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i35;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i40;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i74;
import '../../features/task_management/data/data_sources/task_datasource.dart'
    as _i36;
import '../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i38;
import '../../features/task_management/domain/repositories/task_repository.dart'
    as _i37;
import '../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i50;
import '../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i55;
import '../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i61;
import '../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i68;
import '../../features/task_management/presentation/manager/task_cubit.dart'
    as _i79;
import '../api/client.dart' as _i6;
import 'di_container.dart' as _i88;

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
  gh.factory<_i10.CommentCompanyDatasource>(
      () => _i10.CommentCompanyDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i11.CommunicationListDatasource>(
      () => _i11.CommunicationListDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i12.CommunicationListRepository>(() =>
      _i13.CommunicationListRepositoryImpl(
          gh<_i11.CommunicationListDatasource>()));
  gh.factory<_i14.CompanyRepository>(
      () => _i15.CompanyRepositoryImpl(gh<_i10.CommentCompanyDatasource>()));
  gh.factory<_i16.EditClientUserUsecase>(
      () => _i16.EditClientUserUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i17.GetAllClientsListUseCase>(
      () => _i17.GetAllClientsListUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i18.GetClientsListByRegionUseCase>(() =>
      _i18.GetClientsListByRegionUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i19.GetClientsListByUserUseCase>(
      () => _i19.GetClientsListByUserUseCase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i20.GetClientsWithFilterUserUsecase>(() =>
      _i20.GetClientsWithFilterUserUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i21.GetCommentUsecase>(
      () => _i21.GetCommentUsecase(gh<_i14.CompanyRepository>()));
  gh.factory<_i22.GetCommunicationListUsecase>(() =>
      _i22.GetCommunicationListUsecase(gh<_i12.CommunicationListRepository>()));
  gh.factory<_i23.GetRecommendedClientsUsecase>(
      () => _i23.GetRecommendedClientsUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i24.GetSimilarClientsUsecase>(
      () => _i24.GetSimilarClientsUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i25.LinkDatasource>(
      () => _i25.LinkDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i26.LinksImportantRepository>(
      () => _i27.LinkRepositoryImpl(gh<_i25.LinkDatasource>()));
  gh.factory<_i28.ManageWithdrawalsDatasource>(
      () => _i28.ManageWithdrawalsDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i29.ManageWithdrawalsRepository>(() =>
      _i30.ManageWithdrawalsRepositoryImpl(
          gh<_i28.ManageWithdrawalsDatasource>()));
  gh.factory<_i31.ParticipatesListDatasource>(
      () => _i31.ParticipatesListDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i32.PrivilegeDatasource>(
      () => _i32.PrivilegeDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i33.PrivilegeRepository>(
      () => _i34.PrivilegeRepositoryImpl(gh<_i32.PrivilegeDatasource>()));
  gh.factory<_i35.SetApproveSeriesUsecase>(() =>
      _i35.SetApproveSeriesUsecase(gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i36.TaskDatasource>(
      () => _i36.TaskDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i37.TaskRepository>(
      () => _i38.TaskRepositoryImpl(gh<_i36.TaskDatasource>()));
  gh.factory<_i39.UpdatePrivilegeUsecase>(
      () => _i39.UpdatePrivilegeUsecase(gh<_i33.PrivilegeRepository>()));
  gh.factory<_i40.UpdateSeriesUsecase>(
      () => _i40.UpdateSeriesUsecase(gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i41.UsersDatasource>(
      () => _i41.UsersDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i42.UsersRepository>(
      () => _i43.UsersRepositoryImpl(gh<_i41.UsersDatasource>()));
  gh.factory<_i44.ActionLinkUsecase>(
      () => _i44.ActionLinkUsecase(gh<_i26.LinksImportantRepository>()));
  gh.factory<_i45.ActionUserUsecase>(
      () => _i45.ActionUserUsecase(gh<_i42.UsersRepository>()));
  gh.factory<_i46.AddClientUserUsecase>(
      () => _i46.AddClientUserUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i47.AddCommentUsecase>(
      () => _i47.AddCommentUsecase(gh<_i14.CompanyRepository>()));
  gh.factory<_i48.AddLevelUsecase>(
      () => _i48.AddLevelUsecase(gh<_i33.PrivilegeRepository>()));
  gh.factory<_i49.AddRejectReasonsUsecase>(() =>
      _i49.AddRejectReasonsUsecase(gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i50.AddTaskUsecase>(
      () => _i50.AddTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i51.AppDatasource>(() => _i51.AppDatasource(gh<_i6.ClientApi>()));
  gh.factory<_i52.AppRepository>(
      () => _i53.AppRepositoryImpl(gh<_i51.AppDatasource>()));
  gh.factory<_i54.ApproveRejectClientUsecase>(
      () => _i54.ApproveRejectClientUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i55.ChangeStatusTaskUsecase>(
      () => _i55.ChangeStatusTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i56.ChangeTypeClientUsecase>(
      () => _i56.ChangeTypeClientUsecase(gh<_i8.ClientsListRepository>()));
  gh.factory<_i57.ClientsListBloc>(() => _i57.ClientsListBloc(
        gh<_i20.GetClientsWithFilterUserUsecase>(),
        gh<_i23.GetRecommendedClientsUsecase>(),
        gh<_i46.AddClientUserUsecase>(),
        gh<_i16.EditClientUserUsecase>(),
        gh<_i56.ChangeTypeClientUsecase>(),
        gh<_i24.GetSimilarClientsUsecase>(),
        gh<_i54.ApproveRejectClientUsecase>(),
      ));
  gh.factory<_i58.CommunicationListBloc>(
      () => _i58.CommunicationListBloc(gh<_i22.GetCommunicationListUsecase>()));
  gh.factory<_i59.CompanyCubit>(() => _i59.CompanyCubit(
        gh<_i21.GetCommentUsecase>(),
        gh<_i47.AddCommentUsecase>(),
      ));
  gh.factory<_i60.EditRejectReasonsUsecase>(() =>
      _i60.EditRejectReasonsUsecase(gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i61.FilterTaskUsecase>(
      () => _i61.FilterTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i62.GetAllUsersUsecase>(
      () => _i62.GetAllUsersUsecase(gh<_i42.UsersRepository>()));
  gh.factory<_i63.GetLevelsUsecase>(
      () => _i63.GetLevelsUsecase(gh<_i33.PrivilegeRepository>()));
  gh.factory<_i64.GetLinkUsecase>(
      () => _i64.GetLinkUsecase(gh<_i26.LinksImportantRepository>()));
  gh.factory<_i65.GetPrivilegesUsecase>(
      () => _i65.GetPrivilegesUsecase(gh<_i33.PrivilegeRepository>()));
  gh.factory<_i66.GetRejectReasonsUsecase>(() =>
      _i66.GetRejectReasonsUsecase(gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i67.GetUserSeriesUsecase>(
      () => _i67.GetUserSeriesUsecase(gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i68.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i68.GetUsersByDepartmentAndRegionUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i69.GetVersionUseCase>(
      () => _i69.GetVersionUseCase(gh<_i52.AppRepository>()));
  gh.factory<_i70.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i70.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i71.GetWithdrawalsInvoicesUsecase>(() =>
      _i71.GetWithdrawalsInvoicesUsecase(
          gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i72.GetWithdrawnDetailsUsecase>(() =>
      _i72.GetWithdrawnDetailsUsecase(gh<_i29.ManageWithdrawalsRepository>()));
  gh.factory<_i73.LinkCubit>(() => _i73.LinkCubit(
        gh<_i64.GetLinkUsecase>(),
        gh<_i44.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i74.ManageWithdrawalsCubit>(
      () => _i74.ManageWithdrawalsCubit(
            gh<_i67.GetUserSeriesUsecase>(),
            gh<_i40.UpdateSeriesUsecase>(),
            gh<_i62.GetAllUsersUsecase>(),
            gh<_i71.GetWithdrawalsInvoicesUsecase>(),
            gh<_i70.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i35.SetApproveSeriesUsecase>(),
            gh<_i72.GetWithdrawnDetailsUsecase>(),
            gh<_i49.AddRejectReasonsUsecase>(),
            gh<_i66.GetRejectReasonsUsecase>(),
            gh<_i60.EditRejectReasonsUsecase>(),
          ));
  gh.factory<_i75.ParticipateListRepository>(() =>
      _i76.ParticipateListRepositoryImpl(
          gh<_i31.ParticipatesListDatasource>()));
  gh.factory<_i77.ParticipateListUsecase>(
      () => _i77.ParticipateListUsecase(gh<_i75.ParticipateListRepository>()));
  gh.lazySingleton<_i78.PrivilegeCubit>(() => _i78.PrivilegeCubit(
        gh<_i63.GetLevelsUsecase>(),
        gh<_i65.GetPrivilegesUsecase>(),
        gh<_i39.UpdatePrivilegeUsecase>(),
        gh<_i48.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i79.TaskCubit>(() => _i79.TaskCubit(
        gh<_i50.AddTaskUsecase>(),
        gh<_i61.FilterTaskUsecase>(),
        gh<_i55.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i80.UsersCubit>(() => _i80.UsersCubit(
        gh<_i62.GetAllUsersUsecase>(),
        gh<_i45.ActionUserUsecase>(),
        gh<_i68.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.factory<_i81.AddParticipateUserUsecase>(() =>
      _i81.AddParticipateUserUsecase(gh<_i75.ParticipateListRepository>()));
  gh.singleton<_i82.AppManagerCubit>(
      _i82.AppManagerCubit(gh<_i69.GetVersionUseCase>()));
  gh.factory<_i83.EditParticipateUserUsecase>(() =>
      _i83.EditParticipateUserUsecase(gh<_i75.ParticipateListRepository>()));
  gh.factory<_i84.GetInvoiceByIdUsecase>(
      () => _i84.GetInvoiceByIdUsecase(gh<_i75.ParticipateListRepository>()));
  gh.factory<_i85.ParticipateClientListUsecase>(() =>
      _i85.ParticipateClientListUsecase(gh<_i75.ParticipateListRepository>()));
  gh.factory<_i86.ParticipateInvoiceListUsecase>(() =>
      _i86.ParticipateInvoiceListUsecase(gh<_i75.ParticipateListRepository>()));
  gh.factory<_i87.ParticipateListBloc>(() => _i87.ParticipateListBloc(
        gh<_i77.ParticipateListUsecase>(),
        gh<_i81.AddParticipateUserUsecase>(),
        gh<_i83.EditParticipateUserUsecase>(),
        gh<_i85.ParticipateClientListUsecase>(),
        gh<_i86.ParticipateInvoiceListUsecase>(),
        gh<_i84.GetInvoiceByIdUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i88.AppModule {}
