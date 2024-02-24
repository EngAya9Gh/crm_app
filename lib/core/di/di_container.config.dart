// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../api/api.dart' as _i6;
import '../../features/app/data/data_sources/app_datasource.dart' as _i67;
import '../../features/app/data/repositories/app_repository_impl.dart' as _i69;
import '../../features/app/domain/repositories/app_repository.dart' as _i68;
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i89;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i105;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i18;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i20;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i19;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i58;
import '../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i70;
import '../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i72;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i27;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i29;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i30;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i31;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i32;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i35;
import '../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i36;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i73;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i22;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i24;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i23;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i34;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i74;
import '../../features/company/data/data_sources/company_datasource.dart'
    as _i21;
import '../../features/company/data/repositories/com_repo_impl.dart' as _i26;
import '../../features/company/domain/repositories/comment_repo.dart' as _i25;
import '../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i59;
import '../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i33;
import '../../features/company/presentation/manager/company_cubit.dart' as _i75;
import '../../features/links/data/data_sources/link_datasource.dart' as _i37;
import '../../features/links/data/repositories/link_repo_impl.dart' as _i39;
import '../../features/links/domain/repositories/links_repo.dart' as _i38;
import '../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i56;
import '../../features/links/domain/use_cases/get_link_usecase.dart' as _i84;
import '../../features/links/presentation/manager/link_cubit.dart' as _i93;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i11;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i3;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i64;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i13;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i66;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i5;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i12;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i65;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i4;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i101;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i102;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i78;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i79;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i80;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i81;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i8;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i28;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i63;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i112;
import '../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i14;
import '../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i43;
import '../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i96;
import '../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i95;
import '../../features/manage_participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i103;
import '../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i104;
import '../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i106;
import '../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i107;
import '../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i108;
import '../../features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i109;
import '../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i110;
import '../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i97;
import '../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i111;
import '../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i44;
import '../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i46;
import '../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i45;
import '../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i60;
import '../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i83;
import '../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i85;
import '../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i51;
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i98;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i53;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i55;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i54;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i57;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i82;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i100;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i40;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i42;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i41;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i61;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i76;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i86;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i87;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i90;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i91;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i92;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i47;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i52;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i94;
import '../../features/task_management/data/data_sources/task_datasource.dart'
    as _i48;
import '../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i50;
import '../../features/task_management/domain/repositories/task_repository.dart'
    as _i49;
import '../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i62;
import '../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i71;
import '../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i77;
import '../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i88;
import '../../features/task_management/presentation/manager/task_cubit.dart'
    as _i99;
import '../api/base_api_services.dart' as _i15;
import '../api/client.dart' as _i17;
import '../api/dio/dio_services.dart' as _i16;
import 'di_container.dart' as _i113;

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
  gh.lazySingleton<_i3.AgentsDistributorsDataSource>(
      () => _i3.AgentsDistributorsDataSourceImpl());
  gh.lazySingleton<_i4.AgentsDistributorsRepo>(() =>
      _i5.AgentsDistributorsRepoImpl(gh<_i3.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i6.Api>(() => _i6.Api());
  gh.factory<_i7.BaseOptions>(() => appModule.dioOption);
  gh.lazySingleton<_i7.Dio>(() => appModule.dio());
  gh.lazySingleton<_i8.GetAgentsAndDistributorsUseCase>(() =>
      _i8.GetAgentsAndDistributorsUseCase(gh<_i4.AgentsDistributorsRepo>()));
  gh.singleton<_i9.Logger>(appModule.logger);
  await gh.singletonAsync<_i10.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i11.AgentsDistributorsActionsDataSource>(
      () => _i11.AgentsDistributorsActionsDataSourceImpl(gh<_i6.Api>()));
  gh.lazySingleton<_i12.AgentsDistributorsActionsRepo>(() =>
      _i13.AgentsDistributorsActionsRepoImpl(
          gh<_i11.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i14.AgentsDistributorsCubit>(() =>
      _i14.AgentsDistributorsCubit(gh<_i8.GetAgentsAndDistributorsUseCase>()));
  gh.lazySingleton<_i15.ApiServices>(() => _i16.DioServices(gh<_i7.Dio>()));
  gh.factory<_i17.ClientApi>(() => _i17.ClientApi(gh<_i7.Dio>()));
  gh.factory<_i18.ClientsListDatasource>(
      () => _i18.ClientsListDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i19.ClientsListRepository>(
      () => _i20.ClientsListRepositoryImpl(gh<_i18.ClientsListDatasource>()));
  gh.factory<_i21.CommentCompanyDatasource>(
      () => _i21.CommentCompanyDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i22.CommunicationListDatasource>(
      () => _i22.CommunicationListDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i23.CommunicationListRepository>(() =>
      _i24.CommunicationListRepositoryImpl(
          gh<_i22.CommunicationListDatasource>()));
  gh.factory<_i25.CompanyRepository>(
      () => _i26.CompanyRepositoryImpl(gh<_i21.CommentCompanyDatasource>()));
  gh.factory<_i27.EditClientUserUsecase>(
      () => _i27.EditClientUserUsecase(gh<_i19.ClientsListRepository>()));
  gh.lazySingleton<_i28.GetAllCitiesUseCase>(
      () => _i28.GetAllCitiesUseCase(gh<_i12.AgentsDistributorsActionsRepo>()));
  gh.factory<_i29.GetAllClientsListUseCase>(
      () => _i29.GetAllClientsListUseCase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i30.GetClientsListByRegionUseCase>(() =>
      _i30.GetClientsListByRegionUseCase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i31.GetClientsListByUserUseCase>(
      () => _i31.GetClientsListByUserUseCase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i32.GetClientsWithFilterUserUsecase>(() =>
      _i32.GetClientsWithFilterUserUsecase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i33.GetCommentUsecase>(
      () => _i33.GetCommentUsecase(gh<_i25.CompanyRepository>()));
  gh.factory<_i34.GetCommunicationListUsecase>(() =>
      _i34.GetCommunicationListUsecase(gh<_i23.CommunicationListRepository>()));
  gh.factory<_i35.GetRecommendedClientsUsecase>(() =>
      _i35.GetRecommendedClientsUsecase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i36.GetSimilarClientsUsecase>(
      () => _i36.GetSimilarClientsUsecase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i37.LinkDatasource>(
      () => _i37.LinkDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i38.LinksImportantRepository>(
      () => _i39.LinkRepositoryImpl(gh<_i37.LinkDatasource>()));
  gh.factory<_i40.ManageWithdrawalsDatasource>(
      () => _i40.ManageWithdrawalsDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i41.ManageWithdrawalsRepository>(() =>
      _i42.ManageWithdrawalsRepositoryImpl(
          gh<_i40.ManageWithdrawalsDatasource>()));
  gh.factory<_i43.ParticipatesListDatasource>(
      () => _i43.ParticipatesListDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i44.PrivilegeDatasource>(
      () => _i44.PrivilegeDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i45.PrivilegeRepository>(
      () => _i46.PrivilegeRepositoryImpl(gh<_i44.PrivilegeDatasource>()));
  gh.factory<_i47.SetApproveSeriesUsecase>(() =>
      _i47.SetApproveSeriesUsecase(gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i48.TaskDatasource>(
      () => _i48.TaskDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i49.TaskRepository>(
      () => _i50.TaskRepositoryImpl(gh<_i48.TaskDatasource>()));
  gh.factory<_i51.UpdatePrivilegeUsecase>(
      () => _i51.UpdatePrivilegeUsecase(gh<_i45.PrivilegeRepository>()));
  gh.factory<_i52.UpdateSeriesUsecase>(
      () => _i52.UpdateSeriesUsecase(gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i53.UsersDatasource>(
      () => _i53.UsersDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i54.UsersRepository>(
      () => _i55.UsersRepositoryImpl(gh<_i53.UsersDatasource>()));
  gh.factory<_i56.ActionLinkUsecase>(
      () => _i56.ActionLinkUsecase(gh<_i38.LinksImportantRepository>()));
  gh.factory<_i57.ActionUserUsecase>(
      () => _i57.ActionUserUsecase(gh<_i54.UsersRepository>()));
  gh.factory<_i58.AddClientUserUsecase>(
      () => _i58.AddClientUserUsecase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i59.AddCommentUsecase>(
      () => _i59.AddCommentUsecase(gh<_i25.CompanyRepository>()));
  gh.factory<_i60.AddLevelUsecase>(
      () => _i60.AddLevelUsecase(gh<_i45.PrivilegeRepository>()));
  gh.factory<_i61.AddRejectReasonsUsecase>(() =>
      _i61.AddRejectReasonsUsecase(gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i62.AddTaskUsecase>(
      () => _i62.AddTaskUsecase(gh<_i49.TaskRepository>()));
  gh.factory<_i63.AgentsDistributorsActionsCubit>(() =>
      _i63.AgentsDistributorsActionsCubit(gh<_i28.GetAllCitiesUseCase>()));
  gh.lazySingleton<_i64.AgentsDistributorsProfileDataSource>(() =>
      _i64.AgentsDistributorsProfileDataSourceImpl(gh<_i15.ApiServices>()));
  gh.lazySingleton<_i65.AgentsDistributorsProfileRepo>(() =>
      _i66.AgentsDistributorsProfileRepoImpl(
          gh<_i64.AgentsDistributorsProfileDataSource>()));
  gh.factory<_i67.AppDatasource>(
      () => _i67.AppDatasource(gh<_i17.ClientApi>()));
  gh.factory<_i68.AppRepository>(
      () => _i69.AppRepositoryImpl(gh<_i67.AppDatasource>()));
  gh.factory<_i70.ApproveRejectClientUsecase>(
      () => _i70.ApproveRejectClientUsecase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i71.ChangeStatusTaskUsecase>(
      () => _i71.ChangeStatusTaskUsecase(gh<_i49.TaskRepository>()));
  gh.factory<_i72.ChangeTypeClientUsecase>(
      () => _i72.ChangeTypeClientUsecase(gh<_i19.ClientsListRepository>()));
  gh.factory<_i73.ClientsListBloc>(() => _i73.ClientsListBloc(
        gh<_i32.GetClientsWithFilterUserUsecase>(),
        gh<_i35.GetRecommendedClientsUsecase>(),
        gh<_i58.AddClientUserUsecase>(),
        gh<_i27.EditClientUserUsecase>(),
        gh<_i72.ChangeTypeClientUsecase>(),
        gh<_i36.GetSimilarClientsUsecase>(),
        gh<_i70.ApproveRejectClientUsecase>(),
      ));
  gh.factory<_i74.CommunicationListBloc>(
      () => _i74.CommunicationListBloc(gh<_i34.GetCommunicationListUsecase>()));
  gh.factory<_i75.CompanyCubit>(() => _i75.CompanyCubit(
        gh<_i33.GetCommentUsecase>(),
        gh<_i59.AddCommentUsecase>(),
      ));
  gh.factory<_i76.EditRejectReasonsUsecase>(() =>
      _i76.EditRejectReasonsUsecase(gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i77.FilterTaskUsecase>(
      () => _i77.FilterTaskUsecase(gh<_i49.TaskRepository>()));
  gh.lazySingleton<_i78.GetAgentClientListUsecase>(() =>
      _i78.GetAgentClientListUsecase(gh<_i65.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i79.GetAgentCommentsListUsecase>(() =>
      _i79.GetAgentCommentsListUsecase(
          gh<_i65.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i80.GetAgentDatesListUsecase>(() =>
      _i80.GetAgentDatesListUsecase(gh<_i65.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i81.GetAgentInvoiceListUsecase>(() =>
      _i81.GetAgentInvoiceListUsecase(
          gh<_i65.AgentsDistributorsProfileRepo>()));
  gh.factory<_i82.GetAllUsersUsecase>(
      () => _i82.GetAllUsersUsecase(gh<_i54.UsersRepository>()));
  gh.factory<_i83.GetLevelsUsecase>(
      () => _i83.GetLevelsUsecase(gh<_i45.PrivilegeRepository>()));
  gh.factory<_i84.GetLinkUsecase>(
      () => _i84.GetLinkUsecase(gh<_i38.LinksImportantRepository>()));
  gh.factory<_i85.GetPrivilegesUsecase>(
      () => _i85.GetPrivilegesUsecase(gh<_i45.PrivilegeRepository>()));
  gh.factory<_i86.GetRejectReasonsUsecase>(() =>
      _i86.GetRejectReasonsUsecase(gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i87.GetUserSeriesUsecase>(
      () => _i87.GetUserSeriesUsecase(gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i88.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i88.GetUsersByDepartmentAndRegionUsecase(gh<_i49.TaskRepository>()));
  gh.factory<_i89.GetVersionUseCase>(
      () => _i89.GetVersionUseCase(gh<_i68.AppRepository>()));
  gh.factory<_i90.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i90.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i91.GetWithdrawalsInvoicesUsecase>(() =>
      _i91.GetWithdrawalsInvoicesUsecase(
          gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i92.GetWithdrawnDetailsUsecase>(() =>
      _i92.GetWithdrawnDetailsUsecase(gh<_i41.ManageWithdrawalsRepository>()));
  gh.factory<_i93.LinkCubit>(() => _i93.LinkCubit(
        gh<_i84.GetLinkUsecase>(),
        gh<_i56.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i94.ManageWithdrawalsCubit>(
      () => _i94.ManageWithdrawalsCubit(
            gh<_i87.GetUserSeriesUsecase>(),
            gh<_i52.UpdateSeriesUsecase>(),
            gh<_i82.GetAllUsersUsecase>(),
            gh<_i91.GetWithdrawalsInvoicesUsecase>(),
            gh<_i90.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i47.SetApproveSeriesUsecase>(),
            gh<_i92.GetWithdrawnDetailsUsecase>(),
            gh<_i61.AddRejectReasonsUsecase>(),
            gh<_i86.GetRejectReasonsUsecase>(),
            gh<_i76.EditRejectReasonsUsecase>(),
          ));
  gh.factory<_i95.ParticipateListRepository>(() =>
      _i96.ParticipateListRepositoryImpl(
          gh<_i43.ParticipatesListDatasource>()));
  gh.factory<_i97.ParticipateListUsecase>(
      () => _i97.ParticipateListUsecase(gh<_i95.ParticipateListRepository>()));
  gh.lazySingleton<_i98.PrivilegeCubit>(() => _i98.PrivilegeCubit(
        gh<_i83.GetLevelsUsecase>(),
        gh<_i85.GetPrivilegesUsecase>(),
        gh<_i51.UpdatePrivilegeUsecase>(),
        gh<_i60.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i99.TaskCubit>(() => _i99.TaskCubit(
        gh<_i62.AddTaskUsecase>(),
        gh<_i77.FilterTaskUsecase>(),
        gh<_i71.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i100.UsersCubit>(() => _i100.UsersCubit(
        gh<_i82.GetAllUsersUsecase>(),
        gh<_i57.ActionUserUsecase>(),
        gh<_i88.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i101.AddAgentCommentUsecase>(() =>
      _i101.AddAgentCommentUsecase(gh<_i65.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i102.AddAgentDateUseCase>(() =>
      _i102.AddAgentDateUseCase(gh<_i65.AgentsDistributorsProfileRepo>()));
  gh.factory<_i103.AddParticipateCommentUsecase>(() =>
      _i103.AddParticipateCommentUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i104.AddParticipateUserUsecase>(() =>
      _i104.AddParticipateUserUsecase(gh<_i95.ParticipateListRepository>()));
  gh.singleton<_i105.AppManagerCubit>(
      _i105.AppManagerCubit(gh<_i89.GetVersionUseCase>()));
  gh.factory<_i106.EditParticipateUserUsecase>(() =>
      _i106.EditParticipateUserUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i107.GetInvoiceByIdUsecase>(
      () => _i107.GetInvoiceByIdUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i108.ParticipateClientListUsecase>(() =>
      _i108.ParticipateClientListUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i109.ParticipateCommentListUsecase>(() =>
      _i109.ParticipateCommentListUsecase(
          gh<_i95.ParticipateListRepository>()));
  gh.factory<_i110.ParticipateInvoiceListUsecase>(() =>
      _i110.ParticipateInvoiceListUsecase(
          gh<_i95.ParticipateListRepository>()));
  gh.factory<_i111.ParticipateListBloc>(() => _i111.ParticipateListBloc(
        gh<_i97.ParticipateListUsecase>(),
        gh<_i104.AddParticipateUserUsecase>(),
        gh<_i106.EditParticipateUserUsecase>(),
        gh<_i108.ParticipateClientListUsecase>(),
        gh<_i110.ParticipateInvoiceListUsecase>(),
        gh<_i107.GetInvoiceByIdUsecase>(),
        gh<_i109.ParticipateCommentListUsecase>(),
        gh<_i103.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i112.AgentsDistributorsProfileBloc>(
      () => _i112.AgentsDistributorsProfileBloc(
            gh<_i78.GetAgentClientListUsecase>(),
            gh<_i81.GetAgentInvoiceListUsecase>(),
            gh<_i107.GetInvoiceByIdUsecase>(),
            gh<_i79.GetAgentCommentsListUsecase>(),
            gh<_i101.AddAgentCommentUsecase>(),
            gh<_i102.AddAgentDateUseCase>(),
            gh<_i80.GetAgentDatesListUsecase>(),
          ));
  return getIt;
}

class _$AppModule extends _i113.AppModule {}
