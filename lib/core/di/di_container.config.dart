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

import '../../api/api.dart' as _i3;
import '../../features/app/data/data_sources/app_datasource.dart' as _i12;
import '../../features/app/data/repositories/app_repository_impl.dart' as _i14;
import '../../features/app/domain/repositories/app_repository.dart' as _i13;
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i34;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i70;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i15;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i17;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i16;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i58;
import '../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i71;
import '../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i73;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i24;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i26;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i27;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i28;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i29;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i32;
import '../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i33;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i74;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i19;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i21;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i20;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i31;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i75;
import '../../features/company/data/data_sources/company_datasource.dart'
    as _i18;
import '../../features/company/data/repositories/com_repo_impl.dart' as _i23;
import '../../features/company/domain/repositories/comment_repo.dart' as _i22;
import '../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i59;
import '../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i30;
import '../../features/company/presentation/manager/company_cubit.dart' as _i76;
import '../../features/links/data/data_sources/link_datasource.dart' as _i35;
import '../../features/links/data/repositories/link_repo_impl.dart' as _i37;
import '../../features/links/domain/repositories/links_repo.dart' as _i36;
import '../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i55;
import '../../features/links/domain/use_cases/get_link_usecase.dart' as _i88;
import '../../features/links/presentation/manager/link_cubit.dart' as _i96;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i7;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i64;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i65;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i9;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i67;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i69;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i8;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i66;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i68;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i104;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i105;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i57;
import '../../features/manage_agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i77;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i84;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i80;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i81;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i82;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i83;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i85;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i25;
import '../../features/manage_agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i49;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i63;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i115;
import '../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i108;
import '../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i41;
import '../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i99;
import '../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i98;
import '../../features/manage_participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i106;
import '../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i107;
import '../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i109;
import '../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i110;
import '../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i111;
import '../../features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i112;
import '../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i113;
import '../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i100;
import '../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i114;
import '../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i42;
import '../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i44;
import '../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i43;
import '../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i60;
import '../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i87;
import '../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i89;
import '../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i50;
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i101;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i52;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i54;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i53;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i56;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i86;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i103;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i38;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i40;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i39;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i61;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i78;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i90;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i91;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i93;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i94;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i95;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i45;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i51;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i97;
import '../../features/task_management/data/data_sources/task_datasource.dart'
    as _i46;
import '../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i48;
import '../../features/task_management/domain/repositories/task_repository.dart'
    as _i47;
import '../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i62;
import '../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i72;
import '../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i79;
import '../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i92;
import '../../features/task_management/presentation/manager/task_cubit.dart'
    as _i102;
import '../api/api_services.dart' as _i10;
import '../api/dio/dio_services.dart' as _i11;
import 'di_container.dart' as _i116;

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
  gh.lazySingleton<_i3.Api>(() => _i3.Api());
  gh.factory<_i4.BaseOptions>(() => appModule.dioOption);
  gh.lazySingleton<_i4.Dio>(() => appModule.dio());
  gh.singleton<_i5.Logger>(appModule.logger);
  await gh.singletonAsync<_i6.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i7.AgentsDistributorsActionsDataSource>(
      () => _i7.AgentsDistributorsActionsDataSourceImpl(gh<_i3.Api>()));
  gh.lazySingleton<_i8.AgentsDistributorsActionsRepo>(() =>
      _i9.AgentsDistributorsActionsRepoImpl(
          gh<_i7.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i10.ApiServices>(() => _i11.DioServices(gh<_i4.Dio>()));
  gh.factory<_i12.AppDatasource>(
      () => _i12.AppDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i13.AppRepository>(
      () => _i14.AppRepositoryImpl(gh<_i12.AppDatasource>()));
  gh.factory<_i15.ClientsListDatasource>(
      () => _i15.ClientsListDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i16.ClientsListRepository>(
      () => _i17.ClientsListRepositoryImpl(gh<_i15.ClientsListDatasource>()));
  gh.factory<_i18.CommentCompanyDatasource>(
      () => _i18.CommentCompanyDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i19.CommunicationListDatasource>(
      () => _i19.CommunicationListDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i20.CommunicationListRepository>(() =>
      _i21.CommunicationListRepositoryImpl(
          gh<_i19.CommunicationListDatasource>()));
  gh.factory<_i22.CompanyRepository>(
      () => _i23.CompanyRepositoryImpl(gh<_i18.CommentCompanyDatasource>()));
  gh.factory<_i24.EditClientUserUsecase>(
      () => _i24.EditClientUserUsecase(gh<_i16.ClientsListRepository>()));
  gh.lazySingleton<_i25.GetAllCitiesUseCase>(
      () => _i25.GetAllCitiesUseCase(gh<_i8.AgentsDistributorsActionsRepo>()));
  gh.factory<_i26.GetAllClientsListUseCase>(
      () => _i26.GetAllClientsListUseCase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i27.GetClientsListByRegionUseCase>(() =>
      _i27.GetClientsListByRegionUseCase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i28.GetClientsListByUserUseCase>(
      () => _i28.GetClientsListByUserUseCase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i29.GetClientsWithFilterUserUsecase>(() =>
      _i29.GetClientsWithFilterUserUsecase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i30.GetCommentUsecase>(
      () => _i30.GetCommentUsecase(gh<_i22.CompanyRepository>()));
  gh.factory<_i31.GetCommunicationListUsecase>(() =>
      _i31.GetCommunicationListUsecase(gh<_i20.CommunicationListRepository>()));
  gh.factory<_i32.GetRecommendedClientsUsecase>(() =>
      _i32.GetRecommendedClientsUsecase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i33.GetSimilarClientsUsecase>(
      () => _i33.GetSimilarClientsUsecase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i34.GetVersionUseCase>(
      () => _i34.GetVersionUseCase(gh<_i13.AppRepository>()));
  gh.factory<_i35.LinkDatasource>(
      () => _i35.LinkDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i36.LinksImportantRepository>(
      () => _i37.LinkRepositoryImpl(gh<_i35.LinkDatasource>()));
  gh.factory<_i38.ManageWithdrawalsDatasource>(
      () => _i38.ManageWithdrawalsDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i39.ManageWithdrawalsRepository>(() =>
      _i40.ManageWithdrawalsRepositoryImpl(
          gh<_i38.ManageWithdrawalsDatasource>()));
  gh.factory<_i41.ParticipatesListDatasource>(
      () => _i41.ParticipatesListDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i42.PrivilegeDatasource>(
      () => _i42.PrivilegeDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i43.PrivilegeRepository>(
      () => _i44.PrivilegeRepositoryImpl(gh<_i42.PrivilegeDatasource>()));
  gh.factory<_i45.SetApproveSeriesUsecase>(() =>
      _i45.SetApproveSeriesUsecase(gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i46.TaskDatasource>(
      () => _i46.TaskDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i47.TaskRepository>(
      () => _i48.TaskRepositoryImpl(gh<_i46.TaskDatasource>()));
  gh.lazySingleton<_i49.UpdateAgentUseCase>(
      () => _i49.UpdateAgentUseCase(gh<_i8.AgentsDistributorsActionsRepo>()));
  gh.factory<_i50.UpdatePrivilegeUsecase>(
      () => _i50.UpdatePrivilegeUsecase(gh<_i43.PrivilegeRepository>()));
  gh.factory<_i51.UpdateSeriesUsecase>(
      () => _i51.UpdateSeriesUsecase(gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i52.UsersDatasource>(
      () => _i52.UsersDatasource(gh<_i10.ApiServices>()));
  gh.factory<_i53.UsersRepository>(
      () => _i54.UsersRepositoryImpl(gh<_i52.UsersDatasource>()));
  gh.factory<_i55.ActionLinkUsecase>(
      () => _i55.ActionLinkUsecase(gh<_i36.LinksImportantRepository>()));
  gh.factory<_i56.ActionUserUsecase>(
      () => _i56.ActionUserUsecase(gh<_i53.UsersRepository>()));
  gh.lazySingleton<_i57.AddAgentUseCase>(
      () => _i57.AddAgentUseCase(gh<_i8.AgentsDistributorsActionsRepo>()));
  gh.factory<_i58.AddClientUserUsecase>(
      () => _i58.AddClientUserUsecase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i59.AddCommentUsecase>(
      () => _i59.AddCommentUsecase(gh<_i22.CompanyRepository>()));
  gh.factory<_i60.AddLevelUsecase>(
      () => _i60.AddLevelUsecase(gh<_i43.PrivilegeRepository>()));
  gh.factory<_i61.AddRejectReasonsUsecase>(() =>
      _i61.AddRejectReasonsUsecase(gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i62.AddTaskUsecase>(
      () => _i62.AddTaskUsecase(gh<_i47.TaskRepository>()));
  gh.factory<_i63.AgentsDistributorsActionsCubit>(
      () => _i63.AgentsDistributorsActionsCubit(
            gh<_i25.GetAllCitiesUseCase>(),
            gh<_i57.AddAgentUseCase>(),
            gh<_i49.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i64.AgentsDistributorsDataSource>(
      () => _i64.AgentsDistributorsDataSourceImpl(gh<_i10.ApiServices>()));
  gh.lazySingleton<_i65.AgentsDistributorsProfileDataSource>(() =>
      _i65.AgentsDistributorsProfileDataSourceImpl(gh<_i10.ApiServices>()));
  gh.lazySingleton<_i66.AgentsDistributorsProfileRepo>(() =>
      _i67.AgentsDistributorsProfileRepoImpl(
          gh<_i65.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i68.AgentsDistributorsRepo>(() =>
      _i69.AgentsDistributorsRepoImpl(gh<_i64.AgentsDistributorsDataSource>()));
  gh.singleton<_i70.AppManagerCubit>(
      _i70.AppManagerCubit(gh<_i34.GetVersionUseCase>()));
  gh.factory<_i71.ApproveRejectClientUsecase>(
      () => _i71.ApproveRejectClientUsecase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i72.ChangeStatusTaskUsecase>(
      () => _i72.ChangeStatusTaskUsecase(gh<_i47.TaskRepository>()));
  gh.factory<_i73.ChangeTypeClientUsecase>(
      () => _i73.ChangeTypeClientUsecase(gh<_i16.ClientsListRepository>()));
  gh.factory<_i74.ClientsListBloc>(() => _i74.ClientsListBloc(
        gh<_i29.GetClientsWithFilterUserUsecase>(),
        gh<_i32.GetRecommendedClientsUsecase>(),
        gh<_i58.AddClientUserUsecase>(),
        gh<_i24.EditClientUserUsecase>(),
        gh<_i73.ChangeTypeClientUsecase>(),
        gh<_i33.GetSimilarClientsUsecase>(),
        gh<_i71.ApproveRejectClientUsecase>(),
      ));
  gh.factory<_i75.CommunicationListBloc>(
      () => _i75.CommunicationListBloc(gh<_i31.GetCommunicationListUsecase>()));
  gh.factory<_i76.CompanyCubit>(() => _i76.CompanyCubit(
        gh<_i30.GetCommentUsecase>(),
        gh<_i59.AddCommentUsecase>(),
      ));
  gh.lazySingleton<_i77.DoneTrainingUsecase>(
      () => _i77.DoneTrainingUsecase(gh<_i66.AgentsDistributorsProfileRepo>()));
  gh.factory<_i78.EditRejectReasonsUsecase>(() =>
      _i78.EditRejectReasonsUsecase(gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i79.FilterTaskUsecase>(
      () => _i79.FilterTaskUsecase(gh<_i47.TaskRepository>()));
  gh.lazySingleton<_i80.GetAgentClientListUsecase>(() =>
      _i80.GetAgentClientListUsecase(gh<_i66.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i81.GetAgentCommentsListUsecase>(() =>
      _i81.GetAgentCommentsListUsecase(
          gh<_i66.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i82.GetAgentDatesListUsecase>(() =>
      _i82.GetAgentDatesListUsecase(gh<_i66.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i83.GetAgentInvoiceListUsecase>(() =>
      _i83.GetAgentInvoiceListUsecase(
          gh<_i66.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i84.GetAgentUsecase>(
      () => _i84.GetAgentUsecase(gh<_i66.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i85.GetAgentsAndDistributorsUseCase>(() =>
      _i85.GetAgentsAndDistributorsUseCase(gh<_i68.AgentsDistributorsRepo>()));
  gh.factory<_i86.GetAllUsersUsecase>(
      () => _i86.GetAllUsersUsecase(gh<_i53.UsersRepository>()));
  gh.factory<_i87.GetLevelsUsecase>(
      () => _i87.GetLevelsUsecase(gh<_i43.PrivilegeRepository>()));
  gh.factory<_i88.GetLinkUsecase>(
      () => _i88.GetLinkUsecase(gh<_i36.LinksImportantRepository>()));
  gh.factory<_i89.GetPrivilegesUsecase>(
      () => _i89.GetPrivilegesUsecase(gh<_i43.PrivilegeRepository>()));
  gh.factory<_i90.GetRejectReasonsUsecase>(() =>
      _i90.GetRejectReasonsUsecase(gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i91.GetUserSeriesUsecase>(
      () => _i91.GetUserSeriesUsecase(gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i92.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i92.GetUsersByDepartmentAndRegionUsecase(gh<_i47.TaskRepository>()));
  gh.factory<_i93.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i93.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i94.GetWithdrawalsInvoicesUsecase>(() =>
      _i94.GetWithdrawalsInvoicesUsecase(
          gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i95.GetWithdrawnDetailsUsecase>(() =>
      _i95.GetWithdrawnDetailsUsecase(gh<_i39.ManageWithdrawalsRepository>()));
  gh.factory<_i96.LinkCubit>(() => _i96.LinkCubit(
        gh<_i88.GetLinkUsecase>(),
        gh<_i55.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i97.ManageWithdrawalsCubit>(
      () => _i97.ManageWithdrawalsCubit(
            gh<_i91.GetUserSeriesUsecase>(),
            gh<_i51.UpdateSeriesUsecase>(),
            gh<_i86.GetAllUsersUsecase>(),
            gh<_i94.GetWithdrawalsInvoicesUsecase>(),
            gh<_i93.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i45.SetApproveSeriesUsecase>(),
            gh<_i95.GetWithdrawnDetailsUsecase>(),
            gh<_i61.AddRejectReasonsUsecase>(),
            gh<_i90.GetRejectReasonsUsecase>(),
            gh<_i78.EditRejectReasonsUsecase>(),
          ));
  gh.factory<_i98.ParticipateListRepository>(() =>
      _i99.ParticipateListRepositoryImpl(
          gh<_i41.ParticipatesListDatasource>()));
  gh.factory<_i100.ParticipateListUsecase>(
      () => _i100.ParticipateListUsecase(gh<_i98.ParticipateListRepository>()));
  gh.lazySingleton<_i101.PrivilegeCubit>(() => _i101.PrivilegeCubit(
        gh<_i87.GetLevelsUsecase>(),
        gh<_i89.GetPrivilegesUsecase>(),
        gh<_i50.UpdatePrivilegeUsecase>(),
        gh<_i60.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i102.TaskCubit>(() => _i102.TaskCubit(
        gh<_i62.AddTaskUsecase>(),
        gh<_i79.FilterTaskUsecase>(),
        gh<_i72.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i103.UsersCubit>(() => _i103.UsersCubit(
        gh<_i86.GetAllUsersUsecase>(),
        gh<_i56.ActionUserUsecase>(),
        gh<_i92.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i104.AddAgentCommentUsecase>(() =>
      _i104.AddAgentCommentUsecase(gh<_i66.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i105.AddAgentDateUseCase>(() =>
      _i105.AddAgentDateUseCase(gh<_i66.AgentsDistributorsProfileRepo>()));
  gh.factory<_i106.AddParticipateCommentUsecase>(() =>
      _i106.AddParticipateCommentUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i107.AddParticipateUserUsecase>(() =>
      _i107.AddParticipateUserUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i108.AgentsDistributorsCubit>(() => _i108.AgentsDistributorsCubit(
      gh<_i85.GetAgentsAndDistributorsUseCase>()));
  gh.factory<_i109.EditParticipateUserUsecase>(() =>
      _i109.EditParticipateUserUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i110.GetInvoiceByIdUsecase>(
      () => _i110.GetInvoiceByIdUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i111.ParticipateClientListUsecase>(() =>
      _i111.ParticipateClientListUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i112.ParticipateCommentListUsecase>(() =>
      _i112.ParticipateCommentListUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i113.ParticipateInvoiceListUsecase>(() =>
      _i113.ParticipateInvoiceListUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i114.ParticipateListBloc>(() => _i114.ParticipateListBloc(
        gh<_i100.ParticipateListUsecase>(),
        gh<_i107.AddParticipateUserUsecase>(),
        gh<_i109.EditParticipateUserUsecase>(),
        gh<_i111.ParticipateClientListUsecase>(),
        gh<_i113.ParticipateInvoiceListUsecase>(),
        gh<_i110.GetInvoiceByIdUsecase>(),
        gh<_i112.ParticipateCommentListUsecase>(),
        gh<_i106.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i115.AgentsDistributorsProfileBloc>(
      () => _i115.AgentsDistributorsProfileBloc(
            gh<_i80.GetAgentClientListUsecase>(),
            gh<_i84.GetAgentUsecase>(),
            gh<_i83.GetAgentInvoiceListUsecase>(),
            gh<_i110.GetInvoiceByIdUsecase>(),
            gh<_i81.GetAgentCommentsListUsecase>(),
            gh<_i104.AddAgentCommentUsecase>(),
            gh<_i77.DoneTrainingUsecase>(),
            gh<_i105.AddAgentDateUseCase>(),
            gh<_i82.GetAgentDatesListUsecase>(),
          ));
  return getIt;
}

class _$AppModule extends _i116.AppModule {}
