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
import '../../features/app/data/data_sources/app_datasource.dart' as _i9;
import '../../features/app/data/repositories/app_repository_impl.dart' as _i11;
import '../../features/app/domain/repositories/app_repository.dart' as _i10;
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i30;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i66;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i12;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i14;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i13;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i52;
import '../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i67;
import '../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i69;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i21;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i22;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i23;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i24;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i25;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i28;
import '../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i29;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i70;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i16;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i18;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i17;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i27;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i71;
import '../../features/company/data/data_sources/company_datasource.dart'
    as _i15;
import '../../features/company/data/repositories/com_repo_impl.dart' as _i20;
import '../../features/company/domain/repositories/comment_repo.dart' as _i19;
import '../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i53;
import '../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i26;
import '../../features/company/presentation/manager/company_cubit.dart' as _i72;
import '../../features/links/data/data_sources/link_datasource.dart' as _i31;
import '../../features/links/data/repositories/link_repo_impl.dart' as _i33;
import '../../features/links/domain/repositories/links_repo.dart' as _i32;
import '../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i50;
import '../../features/links/domain/use_cases/get_link_usecase.dart' as _i85;
import '../../features/links/presentation/manager/link_cubit.dart' as _i93;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i57;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i60;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i61;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i59;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i63;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i65;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i58;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i62;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i64;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i102;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i103;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i104;
import '../../features/manage_agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i73;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i80;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i76;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i77;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i78;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i79;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i81;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i82;
import '../../features/manage_agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i100;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i107;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i116;
import '../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i108;
import '../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i37;
import '../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i96;
import '../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i95;
import '../../features/manage_participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i105;
import '../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i106;
import '../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i110;
import '../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i111;
import '../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i112;
import '../../features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i113;
import '../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i114;
import '../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i97;
import '../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i115;
import '../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i38;
import '../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i40;
import '../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i39;
import '../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i54;
import '../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i84;
import '../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i86;
import '../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i45;
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i98;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i47;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i49;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i48;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i51;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i83;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i101;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i34;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i36;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i35;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i55;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i74;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i87;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i88;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i90;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i91;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i92;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i41;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i46;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i94;
import '../../features/task_management/data/data_sources/task_datasource.dart'
    as _i42;
import '../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i44;
import '../../features/task_management/domain/repositories/task_repository.dart'
    as _i43;
import '../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i56;
import '../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i68;
import '../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i75;
import '../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i89;
import '../../features/task_management/presentation/manager/task_cubit.dart'
    as _i99;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../common/manager/cities_cubit/cities_cubit.dart' as _i109;
import 'di_container.dart' as _i117;

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
  gh.lazySingleton<_i7.ApiServices>(() => _i8.DioServices(gh<_i4.Dio>()));
  gh.factory<_i9.AppDatasource>(() => _i9.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i10.AppRepository>(
      () => _i11.AppRepositoryImpl(gh<_i9.AppDatasource>()));
  gh.factory<_i12.ClientsListDatasource>(
      () => _i12.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i13.ClientsListRepository>(
      () => _i14.ClientsListRepositoryImpl(gh<_i12.ClientsListDatasource>()));
  gh.factory<_i15.CommentCompanyDatasource>(
      () => _i15.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i16.CommunicationListDatasource>(
      () => _i16.CommunicationListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i17.CommunicationListRepository>(() =>
      _i18.CommunicationListRepositoryImpl(
          gh<_i16.CommunicationListDatasource>()));
  gh.factory<_i19.CompanyRepository>(
      () => _i20.CompanyRepositoryImpl(gh<_i15.CommentCompanyDatasource>()));
  gh.factory<_i21.EditClientUserUsecase>(
      () => _i21.EditClientUserUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i22.GetAllClientsListUseCase>(
      () => _i22.GetAllClientsListUseCase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i23.GetClientsListByRegionUseCase>(() =>
      _i23.GetClientsListByRegionUseCase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i24.GetClientsListByUserUseCase>(
      () => _i24.GetClientsListByUserUseCase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i25.GetClientsWithFilterUserUsecase>(() =>
      _i25.GetClientsWithFilterUserUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i26.GetCommentUsecase>(
      () => _i26.GetCommentUsecase(gh<_i19.CompanyRepository>()));
  gh.factory<_i27.GetCommunicationListUsecase>(() =>
      _i27.GetCommunicationListUsecase(gh<_i17.CommunicationListRepository>()));
  gh.factory<_i28.GetRecommendedClientsUsecase>(() =>
      _i28.GetRecommendedClientsUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i29.GetSimilarClientsUsecase>(
      () => _i29.GetSimilarClientsUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i30.GetVersionUseCase>(
      () => _i30.GetVersionUseCase(gh<_i10.AppRepository>()));
  gh.factory<_i31.LinkDatasource>(
      () => _i31.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i32.LinksImportantRepository>(
      () => _i33.LinkRepositoryImpl(gh<_i31.LinkDatasource>()));
  gh.factory<_i34.ManageWithdrawalsDatasource>(
      () => _i34.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i35.ManageWithdrawalsRepository>(() =>
      _i36.ManageWithdrawalsRepositoryImpl(
          gh<_i34.ManageWithdrawalsDatasource>()));
  gh.factory<_i37.ParticipatesListDatasource>(
      () => _i37.ParticipatesListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i38.PrivilegeDatasource>(
      () => _i38.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i39.PrivilegeRepository>(
      () => _i40.PrivilegeRepositoryImpl(gh<_i38.PrivilegeDatasource>()));
  gh.factory<_i41.SetApproveSeriesUsecase>(() =>
      _i41.SetApproveSeriesUsecase(gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i42.TaskDatasource>(
      () => _i42.TaskDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i43.TaskRepository>(
      () => _i44.TaskRepositoryImpl(gh<_i42.TaskDatasource>()));
  gh.factory<_i45.UpdatePrivilegeUsecase>(
      () => _i45.UpdatePrivilegeUsecase(gh<_i39.PrivilegeRepository>()));
  gh.factory<_i46.UpdateSeriesUsecase>(
      () => _i46.UpdateSeriesUsecase(gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i47.UsersDatasource>(
      () => _i47.UsersDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i48.UsersRepository>(
      () => _i49.UsersRepositoryImpl(gh<_i47.UsersDatasource>()));
  gh.factory<_i50.ActionLinkUsecase>(
      () => _i50.ActionLinkUsecase(gh<_i32.LinksImportantRepository>()));
  gh.factory<_i51.ActionUserUsecase>(
      () => _i51.ActionUserUsecase(gh<_i48.UsersRepository>()));
  gh.factory<_i52.AddClientUserUsecase>(
      () => _i52.AddClientUserUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i53.AddCommentUsecase>(
      () => _i53.AddCommentUsecase(gh<_i19.CompanyRepository>()));
  gh.factory<_i54.AddLevelUsecase>(
      () => _i54.AddLevelUsecase(gh<_i39.PrivilegeRepository>()));
  gh.factory<_i55.AddRejectReasonsUsecase>(() =>
      _i55.AddRejectReasonsUsecase(gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i56.AddTaskUsecase>(
      () => _i56.AddTaskUsecase(gh<_i43.TaskRepository>()));
  gh.lazySingleton<_i57.AgentsDistributorsActionsDataSource>(() =>
      _i57.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i58.AgentsDistributorsActionsRepo>(() =>
      _i59.AgentsDistributorsActionsRepoImpl(
          gh<_i57.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i60.AgentsDistributorsDataSource>(
      () => _i60.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i61.AgentsDistributorsProfileDataSource>(() =>
      _i61.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i62.AgentsDistributorsProfileRepo>(() =>
      _i63.AgentsDistributorsProfileRepoImpl(
          gh<_i61.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i64.AgentsDistributorsRepo>(() =>
      _i65.AgentsDistributorsRepoImpl(gh<_i60.AgentsDistributorsDataSource>()));
  gh.singleton<_i66.AppManagerCubit>(
      _i66.AppManagerCubit(gh<_i30.GetVersionUseCase>()));
  gh.factory<_i67.ApproveRejectClientUsecase>(
      () => _i67.ApproveRejectClientUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i68.ChangeStatusTaskUsecase>(
      () => _i68.ChangeStatusTaskUsecase(gh<_i43.TaskRepository>()));
  gh.factory<_i69.ChangeTypeClientUsecase>(
      () => _i69.ChangeTypeClientUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i70.ClientsListBloc>(() => _i70.ClientsListBloc(
        gh<_i25.GetClientsWithFilterUserUsecase>(),
        gh<_i28.GetRecommendedClientsUsecase>(),
        gh<_i52.AddClientUserUsecase>(),
        gh<_i21.EditClientUserUsecase>(),
        gh<_i69.ChangeTypeClientUsecase>(),
        gh<_i29.GetSimilarClientsUsecase>(),
        gh<_i67.ApproveRejectClientUsecase>(),
      ));
  gh.factory<_i71.CommunicationListBloc>(
      () => _i71.CommunicationListBloc(gh<_i27.GetCommunicationListUsecase>()));
  gh.factory<_i72.CompanyCubit>(() => _i72.CompanyCubit(
        gh<_i26.GetCommentUsecase>(),
        gh<_i53.AddCommentUsecase>(),
      ));
  gh.lazySingleton<_i73.DoneTrainingUsecase>(
      () => _i73.DoneTrainingUsecase(gh<_i62.AgentsDistributorsProfileRepo>()));
  gh.factory<_i74.EditRejectReasonsUsecase>(() =>
      _i74.EditRejectReasonsUsecase(gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i75.FilterTaskUsecase>(
      () => _i75.FilterTaskUsecase(gh<_i43.TaskRepository>()));
  gh.lazySingleton<_i76.GetAgentClientListUsecase>(() =>
      _i76.GetAgentClientListUsecase(gh<_i62.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i77.GetAgentCommentsListUsecase>(() =>
      _i77.GetAgentCommentsListUsecase(
          gh<_i62.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i78.GetAgentDatesListUsecase>(() =>
      _i78.GetAgentDatesListUsecase(gh<_i62.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i79.GetAgentInvoiceListUsecase>(() =>
      _i79.GetAgentInvoiceListUsecase(
          gh<_i62.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i80.GetAgentUsecase>(
      () => _i80.GetAgentUsecase(gh<_i62.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i81.GetAgentsAndDistributorsUseCase>(() =>
      _i81.GetAgentsAndDistributorsUseCase(gh<_i64.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i82.GetAllCitiesUseCase>(
      () => _i82.GetAllCitiesUseCase(gh<_i58.AgentsDistributorsActionsRepo>()));
  gh.factory<_i83.GetAllUsersUsecase>(
      () => _i83.GetAllUsersUsecase(gh<_i48.UsersRepository>()));
  gh.factory<_i84.GetLevelsUsecase>(
      () => _i84.GetLevelsUsecase(gh<_i39.PrivilegeRepository>()));
  gh.factory<_i85.GetLinkUsecase>(
      () => _i85.GetLinkUsecase(gh<_i32.LinksImportantRepository>()));
  gh.factory<_i86.GetPrivilegesUsecase>(
      () => _i86.GetPrivilegesUsecase(gh<_i39.PrivilegeRepository>()));
  gh.factory<_i87.GetRejectReasonsUsecase>(() =>
      _i87.GetRejectReasonsUsecase(gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i88.GetUserSeriesUsecase>(
      () => _i88.GetUserSeriesUsecase(gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i89.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i89.GetUsersByDepartmentAndRegionUsecase(gh<_i43.TaskRepository>()));
  gh.factory<_i90.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i90.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i91.GetWithdrawalsInvoicesUsecase>(() =>
      _i91.GetWithdrawalsInvoicesUsecase(
          gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i92.GetWithdrawnDetailsUsecase>(() =>
      _i92.GetWithdrawnDetailsUsecase(gh<_i35.ManageWithdrawalsRepository>()));
  gh.factory<_i93.LinkCubit>(() => _i93.LinkCubit(
        gh<_i85.GetLinkUsecase>(),
        gh<_i50.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i94.ManageWithdrawalsCubit>(
      () => _i94.ManageWithdrawalsCubit(
            gh<_i88.GetUserSeriesUsecase>(),
            gh<_i46.UpdateSeriesUsecase>(),
            gh<_i83.GetAllUsersUsecase>(),
            gh<_i91.GetWithdrawalsInvoicesUsecase>(),
            gh<_i90.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i41.SetApproveSeriesUsecase>(),
            gh<_i92.GetWithdrawnDetailsUsecase>(),
            gh<_i55.AddRejectReasonsUsecase>(),
            gh<_i87.GetRejectReasonsUsecase>(),
            gh<_i74.EditRejectReasonsUsecase>(),
          ));
  gh.factory<_i95.ParticipateListRepository>(() =>
      _i96.ParticipateListRepositoryImpl(
          gh<_i37.ParticipatesListDatasource>()));
  gh.factory<_i97.ParticipateListUsecase>(
      () => _i97.ParticipateListUsecase(gh<_i95.ParticipateListRepository>()));
  gh.lazySingleton<_i98.PrivilegeCubit>(() => _i98.PrivilegeCubit(
        gh<_i84.GetLevelsUsecase>(),
        gh<_i86.GetPrivilegesUsecase>(),
        gh<_i45.UpdatePrivilegeUsecase>(),
        gh<_i54.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i99.TaskCubit>(() => _i99.TaskCubit(
        gh<_i56.AddTaskUsecase>(),
        gh<_i75.FilterTaskUsecase>(),
        gh<_i68.ChangeStatusTaskUsecase>(),
      ));
  gh.lazySingleton<_i100.UpdateAgentUseCase>(
      () => _i100.UpdateAgentUseCase(gh<_i58.AgentsDistributorsActionsRepo>()));
  gh.factory<_i101.UsersCubit>(() => _i101.UsersCubit(
        gh<_i83.GetAllUsersUsecase>(),
        gh<_i51.ActionUserUsecase>(),
        gh<_i89.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i102.AddAgentCommentUsecase>(() =>
      _i102.AddAgentCommentUsecase(gh<_i62.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i103.AddAgentDateUseCase>(() =>
      _i103.AddAgentDateUseCase(gh<_i62.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i104.AddAgentUseCase>(
      () => _i104.AddAgentUseCase(gh<_i58.AgentsDistributorsActionsRepo>()));
  gh.factory<_i105.AddParticipateCommentUsecase>(() =>
      _i105.AddParticipateCommentUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i106.AddParticipateUserUsecase>(() =>
      _i106.AddParticipateUserUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i107.AgentsDistributorsActionsCubit>(
      () => _i107.AgentsDistributorsActionsCubit(
            gh<_i82.GetAllCitiesUseCase>(),
            gh<_i104.AddAgentUseCase>(),
            gh<_i100.UpdateAgentUseCase>(),
          ));
  gh.factory<_i108.AgentsDistributorsCubit>(() => _i108.AgentsDistributorsCubit(
      gh<_i81.GetAgentsAndDistributorsUseCase>()));
  gh.singleton<_i109.CitiesCubit>(
      _i109.CitiesCubit(gh<_i82.GetAllCitiesUseCase>()));
  gh.factory<_i110.EditParticipateUserUsecase>(() =>
      _i110.EditParticipateUserUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i111.GetInvoiceByIdUsecase>(
      () => _i111.GetInvoiceByIdUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i112.ParticipateClientListUsecase>(() =>
      _i112.ParticipateClientListUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i113.ParticipateCommentListUsecase>(() =>
      _i113.ParticipateCommentListUsecase(
          gh<_i95.ParticipateListRepository>()));
  gh.factory<_i114.ParticipateInvoiceListUsecase>(() =>
      _i114.ParticipateInvoiceListUsecase(
          gh<_i95.ParticipateListRepository>()));
  gh.factory<_i115.ParticipateListBloc>(() => _i115.ParticipateListBloc(
        gh<_i97.ParticipateListUsecase>(),
        gh<_i106.AddParticipateUserUsecase>(),
        gh<_i110.EditParticipateUserUsecase>(),
        gh<_i112.ParticipateClientListUsecase>(),
        gh<_i114.ParticipateInvoiceListUsecase>(),
        gh<_i111.GetInvoiceByIdUsecase>(),
        gh<_i113.ParticipateCommentListUsecase>(),
        gh<_i105.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i116.AgentsDistributorsProfileBloc>(
      () => _i116.AgentsDistributorsProfileBloc(
            gh<_i76.GetAgentClientListUsecase>(),
            gh<_i80.GetAgentUsecase>(),
            gh<_i79.GetAgentInvoiceListUsecase>(),
            gh<_i111.GetInvoiceByIdUsecase>(),
            gh<_i77.GetAgentCommentsListUsecase>(),
            gh<_i102.AddAgentCommentUsecase>(),
            gh<_i73.DoneTrainingUsecase>(),
            gh<_i103.AddAgentDateUseCase>(),
            gh<_i78.GetAgentDatesListUsecase>(),
          ));
  return getIt;
}

class _$AppModule extends _i117.AppModule {}
