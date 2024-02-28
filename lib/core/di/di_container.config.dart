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
import '../../features/app/data/data_sources/app_datasource.dart' as _i17;
import '../../features/app/data/repositories/app_repository_impl.dart' as _i19;
import '../../features/app/domain/repositories/app_repository.dart' as _i18;
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i39;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i71;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i20;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i22;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i21;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i62;
import '../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i72;
import '../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i74;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i29;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i31;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i32;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i33;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i34;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i37;
import '../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i38;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i75;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i24;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i26;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i25;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i36;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i76;
import '../../features/company/data/data_sources/company_datasource.dart'
    as _i23;
import '../../features/company/data/repositories/com_repo_impl.dart' as _i28;
import '../../features/company/domain/repositories/comment_repo.dart' as _i27;
import '../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i63;
import '../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i35;
import '../../features/company/presentation/manager/company_cubit.dart' as _i77;
import '../../features/links/data/data_sources/link_datasource.dart' as _i40;
import '../../features/links/data/repositories/link_repo_impl.dart' as _i42;
import '../../features/links/domain/repositories/links_repo.dart' as _i41;
import '../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i59;
import '../../features/links/domain/use_cases/get_link_usecase.dart' as _i88;
import '../../features/links/presentation/manager/link_cubit.dart' as _i96;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i11;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i3;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i68;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i13;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i70;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i5;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i12;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i69;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i4;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i104;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i105;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i61;
import '../../features/manage_agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i78;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i85;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i81;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i82;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i83;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i84;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i8;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i30;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i67;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i114;
import '../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i14;
import '../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i46;
import '../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i99;
import '../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i98;
import '../../features/manage_participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i106;
import '../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i107;
import '../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i108;
import '../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i109;
import '../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i110;
import '../../features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i111;
import '../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i112;
import '../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i100;
import '../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i113;
import '../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i47;
import '../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i49;
import '../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i48;
import '../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i64;
import '../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i87;
import '../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i89;
import '../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i54;
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i101;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i56;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i58;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i57;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i60;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i86;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i103;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i43;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i45;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i44;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i65;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i79;
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
    as _i50;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i55;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i97;
import '../../features/task_management/data/data_sources/task_datasource.dart'
    as _i51;
import '../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i53;
import '../../features/task_management/domain/repositories/task_repository.dart'
    as _i52;
import '../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i66;
import '../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i73;
import '../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i80;
import '../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i92;
import '../../features/task_management/presentation/manager/task_cubit.dart'
    as _i102;
import '../api/api_services.dart' as _i15;
import '../api/dio/dio_services.dart' as _i16;
import 'di_container.dart' as _i115;

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
  gh.factory<_i17.AppDatasource>(
      () => _i17.AppDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i18.AppRepository>(
      () => _i19.AppRepositoryImpl(gh<_i17.AppDatasource>()));
  gh.factory<_i20.ClientsListDatasource>(
      () => _i20.ClientsListDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i21.ClientsListRepository>(
      () => _i22.ClientsListRepositoryImpl(gh<_i20.ClientsListDatasource>()));
  gh.factory<_i23.CommentCompanyDatasource>(
      () => _i23.CommentCompanyDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i24.CommunicationListDatasource>(
      () => _i24.CommunicationListDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i25.CommunicationListRepository>(() =>
      _i26.CommunicationListRepositoryImpl(
          gh<_i24.CommunicationListDatasource>()));
  gh.factory<_i27.CompanyRepository>(
      () => _i28.CompanyRepositoryImpl(gh<_i23.CommentCompanyDatasource>()));
  gh.factory<_i29.EditClientUserUsecase>(
      () => _i29.EditClientUserUsecase(gh<_i21.ClientsListRepository>()));
  gh.lazySingleton<_i30.GetAllCitiesUseCase>(
      () => _i30.GetAllCitiesUseCase(gh<_i12.AgentsDistributorsActionsRepo>()));
  gh.factory<_i31.GetAllClientsListUseCase>(
      () => _i31.GetAllClientsListUseCase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i32.GetClientsListByRegionUseCase>(() =>
      _i32.GetClientsListByRegionUseCase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i33.GetClientsListByUserUseCase>(
      () => _i33.GetClientsListByUserUseCase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i34.GetClientsWithFilterUserUsecase>(() =>
      _i34.GetClientsWithFilterUserUsecase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i35.GetCommentUsecase>(
      () => _i35.GetCommentUsecase(gh<_i27.CompanyRepository>()));
  gh.factory<_i36.GetCommunicationListUsecase>(() =>
      _i36.GetCommunicationListUsecase(gh<_i25.CommunicationListRepository>()));
  gh.factory<_i37.GetRecommendedClientsUsecase>(() =>
      _i37.GetRecommendedClientsUsecase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i38.GetSimilarClientsUsecase>(
      () => _i38.GetSimilarClientsUsecase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i39.GetVersionUseCase>(
      () => _i39.GetVersionUseCase(gh<_i18.AppRepository>()));
  gh.factory<_i40.LinkDatasource>(
      () => _i40.LinkDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i41.LinksImportantRepository>(
      () => _i42.LinkRepositoryImpl(gh<_i40.LinkDatasource>()));
  gh.factory<_i43.ManageWithdrawalsDatasource>(
      () => _i43.ManageWithdrawalsDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i44.ManageWithdrawalsRepository>(() =>
      _i45.ManageWithdrawalsRepositoryImpl(
          gh<_i43.ManageWithdrawalsDatasource>()));
  gh.factory<_i46.ParticipatesListDatasource>(
      () => _i46.ParticipatesListDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i47.PrivilegeDatasource>(
      () => _i47.PrivilegeDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i48.PrivilegeRepository>(
      () => _i49.PrivilegeRepositoryImpl(gh<_i47.PrivilegeDatasource>()));
  gh.factory<_i50.SetApproveSeriesUsecase>(() =>
      _i50.SetApproveSeriesUsecase(gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i51.TaskDatasource>(
      () => _i51.TaskDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i52.TaskRepository>(
      () => _i53.TaskRepositoryImpl(gh<_i51.TaskDatasource>()));
  gh.factory<_i54.UpdatePrivilegeUsecase>(
      () => _i54.UpdatePrivilegeUsecase(gh<_i48.PrivilegeRepository>()));
  gh.factory<_i55.UpdateSeriesUsecase>(
      () => _i55.UpdateSeriesUsecase(gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i56.UsersDatasource>(
      () => _i56.UsersDatasource(gh<_i15.ApiServices>()));
  gh.factory<_i57.UsersRepository>(
      () => _i58.UsersRepositoryImpl(gh<_i56.UsersDatasource>()));
  gh.factory<_i59.ActionLinkUsecase>(
      () => _i59.ActionLinkUsecase(gh<_i41.LinksImportantRepository>()));
  gh.factory<_i60.ActionUserUsecase>(
      () => _i60.ActionUserUsecase(gh<_i57.UsersRepository>()));
  gh.lazySingleton<_i61.AddAgentUseCase>(
      () => _i61.AddAgentUseCase(gh<_i12.AgentsDistributorsActionsRepo>()));
  gh.factory<_i62.AddClientUserUsecase>(
      () => _i62.AddClientUserUsecase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i63.AddCommentUsecase>(
      () => _i63.AddCommentUsecase(gh<_i27.CompanyRepository>()));
  gh.factory<_i64.AddLevelUsecase>(
      () => _i64.AddLevelUsecase(gh<_i48.PrivilegeRepository>()));
  gh.factory<_i65.AddRejectReasonsUsecase>(() =>
      _i65.AddRejectReasonsUsecase(gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i66.AddTaskUsecase>(
      () => _i66.AddTaskUsecase(gh<_i52.TaskRepository>()));
  gh.factory<_i67.AgentsDistributorsActionsCubit>(
      () => _i67.AgentsDistributorsActionsCubit(
            gh<_i30.GetAllCitiesUseCase>(),
            gh<_i61.AddAgentUseCase>(),
          ));
  gh.lazySingleton<_i68.AgentsDistributorsProfileDataSource>(() =>
      _i68.AgentsDistributorsProfileDataSourceImpl(gh<_i15.ApiServices>()));
  gh.lazySingleton<_i69.AgentsDistributorsProfileRepo>(() =>
      _i70.AgentsDistributorsProfileRepoImpl(
          gh<_i68.AgentsDistributorsProfileDataSource>()));
  gh.singleton<_i71.AppManagerCubit>(
      _i71.AppManagerCubit(gh<_i39.GetVersionUseCase>()));
  gh.factory<_i72.ApproveRejectClientUsecase>(
      () => _i72.ApproveRejectClientUsecase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i73.ChangeStatusTaskUsecase>(
      () => _i73.ChangeStatusTaskUsecase(gh<_i52.TaskRepository>()));
  gh.factory<_i74.ChangeTypeClientUsecase>(
      () => _i74.ChangeTypeClientUsecase(gh<_i21.ClientsListRepository>()));
  gh.factory<_i75.ClientsListBloc>(() => _i75.ClientsListBloc(
        gh<_i34.GetClientsWithFilterUserUsecase>(),
        gh<_i37.GetRecommendedClientsUsecase>(),
        gh<_i62.AddClientUserUsecase>(),
        gh<_i29.EditClientUserUsecase>(),
        gh<_i74.ChangeTypeClientUsecase>(),
        gh<_i38.GetSimilarClientsUsecase>(),
        gh<_i72.ApproveRejectClientUsecase>(),
      ));
  gh.factory<_i76.CommunicationListBloc>(
      () => _i76.CommunicationListBloc(gh<_i36.GetCommunicationListUsecase>()));
  gh.factory<_i77.CompanyCubit>(() => _i77.CompanyCubit(
        gh<_i35.GetCommentUsecase>(),
        gh<_i63.AddCommentUsecase>(),
      ));
  gh.lazySingleton<_i78.DoneTrainingUsecase>(
      () => _i78.DoneTrainingUsecase(gh<_i69.AgentsDistributorsProfileRepo>()));
  gh.factory<_i79.EditRejectReasonsUsecase>(() =>
      _i79.EditRejectReasonsUsecase(gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i80.FilterTaskUsecase>(
      () => _i80.FilterTaskUsecase(gh<_i52.TaskRepository>()));
  gh.lazySingleton<_i81.GetAgentClientListUsecase>(() =>
      _i81.GetAgentClientListUsecase(gh<_i69.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i82.GetAgentCommentsListUsecase>(() =>
      _i82.GetAgentCommentsListUsecase(
          gh<_i69.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i83.GetAgentDatesListUsecase>(() =>
      _i83.GetAgentDatesListUsecase(gh<_i69.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i84.GetAgentInvoiceListUsecase>(() =>
      _i84.GetAgentInvoiceListUsecase(
          gh<_i69.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i85.GetAgentUsecase>(
      () => _i85.GetAgentUsecase(gh<_i69.AgentsDistributorsProfileRepo>()));
  gh.factory<_i86.GetAllUsersUsecase>(
      () => _i86.GetAllUsersUsecase(gh<_i57.UsersRepository>()));
  gh.factory<_i87.GetLevelsUsecase>(
      () => _i87.GetLevelsUsecase(gh<_i48.PrivilegeRepository>()));
  gh.factory<_i88.GetLinkUsecase>(
      () => _i88.GetLinkUsecase(gh<_i41.LinksImportantRepository>()));
  gh.factory<_i89.GetPrivilegesUsecase>(
      () => _i89.GetPrivilegesUsecase(gh<_i48.PrivilegeRepository>()));
  gh.factory<_i90.GetRejectReasonsUsecase>(() =>
      _i90.GetRejectReasonsUsecase(gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i91.GetUserSeriesUsecase>(
      () => _i91.GetUserSeriesUsecase(gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i92.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i92.GetUsersByDepartmentAndRegionUsecase(gh<_i52.TaskRepository>()));
  gh.factory<_i93.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i93.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i94.GetWithdrawalsInvoicesUsecase>(() =>
      _i94.GetWithdrawalsInvoicesUsecase(
          gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i95.GetWithdrawnDetailsUsecase>(() =>
      _i95.GetWithdrawnDetailsUsecase(gh<_i44.ManageWithdrawalsRepository>()));
  gh.factory<_i96.LinkCubit>(() => _i96.LinkCubit(
        gh<_i88.GetLinkUsecase>(),
        gh<_i59.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i97.ManageWithdrawalsCubit>(
      () => _i97.ManageWithdrawalsCubit(
            gh<_i91.GetUserSeriesUsecase>(),
            gh<_i55.UpdateSeriesUsecase>(),
            gh<_i86.GetAllUsersUsecase>(),
            gh<_i94.GetWithdrawalsInvoicesUsecase>(),
            gh<_i93.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i50.SetApproveSeriesUsecase>(),
            gh<_i95.GetWithdrawnDetailsUsecase>(),
            gh<_i65.AddRejectReasonsUsecase>(),
            gh<_i90.GetRejectReasonsUsecase>(),
            gh<_i79.EditRejectReasonsUsecase>(),
          ));
  gh.factory<_i98.ParticipateListRepository>(() =>
      _i99.ParticipateListRepositoryImpl(
          gh<_i46.ParticipatesListDatasource>()));
  gh.factory<_i100.ParticipateListUsecase>(
      () => _i100.ParticipateListUsecase(gh<_i98.ParticipateListRepository>()));
  gh.lazySingleton<_i101.PrivilegeCubit>(() => _i101.PrivilegeCubit(
        gh<_i87.GetLevelsUsecase>(),
        gh<_i89.GetPrivilegesUsecase>(),
        gh<_i54.UpdatePrivilegeUsecase>(),
        gh<_i64.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i102.TaskCubit>(() => _i102.TaskCubit(
        gh<_i66.AddTaskUsecase>(),
        gh<_i80.FilterTaskUsecase>(),
        gh<_i73.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i103.UsersCubit>(() => _i103.UsersCubit(
        gh<_i86.GetAllUsersUsecase>(),
        gh<_i60.ActionUserUsecase>(),
        gh<_i92.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i104.AddAgentCommentUsecase>(() =>
      _i104.AddAgentCommentUsecase(gh<_i69.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i105.AddAgentDateUseCase>(() =>
      _i105.AddAgentDateUseCase(gh<_i69.AgentsDistributorsProfileRepo>()));
  gh.factory<_i106.AddParticipateCommentUsecase>(() =>
      _i106.AddParticipateCommentUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i107.AddParticipateUserUsecase>(() =>
      _i107.AddParticipateUserUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i108.EditParticipateUserUsecase>(() =>
      _i108.EditParticipateUserUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i109.GetInvoiceByIdUsecase>(
      () => _i109.GetInvoiceByIdUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i110.ParticipateClientListUsecase>(() =>
      _i110.ParticipateClientListUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i111.ParticipateCommentListUsecase>(() =>
      _i111.ParticipateCommentListUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i112.ParticipateInvoiceListUsecase>(() =>
      _i112.ParticipateInvoiceListUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i113.ParticipateListBloc>(() => _i113.ParticipateListBloc(
        gh<_i100.ParticipateListUsecase>(),
        gh<_i107.AddParticipateUserUsecase>(),
        gh<_i108.EditParticipateUserUsecase>(),
        gh<_i110.ParticipateClientListUsecase>(),
        gh<_i112.ParticipateInvoiceListUsecase>(),
        gh<_i109.GetInvoiceByIdUsecase>(),
        gh<_i111.ParticipateCommentListUsecase>(),
        gh<_i106.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i114.AgentsDistributorsProfileBloc>(
      () => _i114.AgentsDistributorsProfileBloc(
            gh<_i81.GetAgentClientListUsecase>(),
            gh<_i85.GetAgentUsecase>(),
            gh<_i84.GetAgentInvoiceListUsecase>(),
            gh<_i109.GetInvoiceByIdUsecase>(),
            gh<_i82.GetAgentCommentsListUsecase>(),
            gh<_i104.AddAgentCommentUsecase>(),
            gh<_i78.DoneTrainingUsecase>(),
            gh<_i105.AddAgentDateUseCase>(),
            gh<_i83.GetAgentDatesListUsecase>(),
          ));
  return getIt;
}

class _$AppModule extends _i115.AppModule {}
