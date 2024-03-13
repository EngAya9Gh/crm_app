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
import '../../features/app/domain/use_cases/get_version_usecase.dart' as _i32;
import '../../features/app/presentation/bloc/app_manager_cubit.dart' as _i68;
import '../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i12;
import '../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i14;
import '../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i13;
import '../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i54;
import '../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i69;
import '../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i72;
import '../../features/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i21;
import '../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i22;
import '../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i23;
import '../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i24;
import '../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i25;
import '../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i26;
import '../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i27;
import '../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i30;
import '../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i31;
import '../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i73;
import '../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i16;
import '../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i18;
import '../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i17;
import '../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i29;
import '../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i74;
import '../../features/company/data/data_sources/company_datasource.dart'
    as _i15;
import '../../features/company/data/repositories/com_repo_impl.dart' as _i20;
import '../../features/company/domain/repositories/comment_repo.dart' as _i19;
import '../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i55;
import '../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i28;
import '../../features/company/presentation/manager/company_cubit.dart' as _i75;
import '../../features/links/data/data_sources/link_datasource.dart' as _i33;
import '../../features/links/data/repositories/link_repo_impl.dart' as _i35;
import '../../features/links/domain/repositories/links_repo.dart' as _i34;
import '../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i52;
import '../../features/links/domain/use_cases/get_link_usecase.dart' as _i89;
import '../../features/links/presentation/manager/link_cubit.dart' as _i97;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i59;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i62;
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i63;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i61;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i65;
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i67;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i60;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i64;
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i66;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i106;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i107;
import '../../features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i108;
import '../../features/manage_agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i76;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i83;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i79;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i80;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i81;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i82;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i84;
import '../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i85;
import '../../features/manage_agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i104;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i111;
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i120;
import '../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i112;
import '../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i39;
import '../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i100;
import '../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i99;
import '../../features/manage_participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i109;
import '../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i110;
import '../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i114;
import '../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i115;
import '../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i116;
import '../../features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i117;
import '../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i118;
import '../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i101;
import '../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i119;
import '../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i40;
import '../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i42;
import '../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i41;
import '../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i56;
import '../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i88;
import '../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i90;
import '../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i47;
import '../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i102;
import '../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i49;
import '../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i51;
import '../../features/manage_users/domain/repositories/users_repository.dart'
    as _i50;
import '../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i53;
import '../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i86;
import '../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i105;
import '../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i36;
import '../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i38;
import '../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i37;
import '../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i57;
import '../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i77;
import '../../features/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i87;
import '../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i91;
import '../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i92;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i94;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i95;
import '../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i96;
import '../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i43;
import '../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i48;
import '../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i98;
import '../../features/task_management/data/data_sources/task_datasource.dart'
    as _i44;
import '../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i46;
import '../../features/task_management/domain/repositories/task_repository.dart'
    as _i45;
import '../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i58;
import '../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i71;
import '../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i78;
import '../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i93;
import '../../features/task_management/presentation/manager/task_cubit.dart'
    as _i103;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i70;
import '../common/manager/cities_cubit/cities_cubit.dart' as _i113;
import 'di_container.dart' as _i121;

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
  gh.lazySingleton<_i21.CrudClientSupportFilesUsecase>(() =>
      _i21.CrudClientSupportFilesUsecase(
          repository: gh<_i13.ClientsListRepository>()));
  gh.factory<_i22.EditClientUserUsecase>(
      () => _i22.EditClientUserUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i23.GetAllClientsListUseCase>(
      () => _i23.GetAllClientsListUseCase(gh<_i13.ClientsListRepository>()));
  gh.lazySingleton<_i24.GetClientSupportFilesUsecase>(() =>
      _i24.GetClientSupportFilesUsecase(
          repository: gh<_i13.ClientsListRepository>()));
  gh.factory<_i25.GetClientsListByRegionUseCase>(() =>
      _i25.GetClientsListByRegionUseCase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i26.GetClientsListByUserUseCase>(
      () => _i26.GetClientsListByUserUseCase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i27.GetClientsWithFilterUserUsecase>(() =>
      _i27.GetClientsWithFilterUserUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i28.GetCommentUsecase>(
      () => _i28.GetCommentUsecase(gh<_i19.CompanyRepository>()));
  gh.factory<_i29.GetCommunicationListUsecase>(() =>
      _i29.GetCommunicationListUsecase(gh<_i17.CommunicationListRepository>()));
  gh.factory<_i30.GetRecommendedClientsUsecase>(() =>
      _i30.GetRecommendedClientsUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i31.GetSimilarClientsUsecase>(
      () => _i31.GetSimilarClientsUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i32.GetVersionUseCase>(
      () => _i32.GetVersionUseCase(gh<_i10.AppRepository>()));
  gh.factory<_i33.LinkDatasource>(
      () => _i33.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i34.LinksImportantRepository>(
      () => _i35.LinkRepositoryImpl(gh<_i33.LinkDatasource>()));
  gh.lazySingleton<_i36.ManageWithdrawalsDatasource>(
      () => _i36.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i37.ManageWithdrawalsRepository>(() =>
      _i38.ManageWithdrawalsRepositoryImpl(
          gh<_i36.ManageWithdrawalsDatasource>()));
  gh.factory<_i39.ParticipatesListDatasource>(
      () => _i39.ParticipatesListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i40.PrivilegeDatasource>(
      () => _i40.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i41.PrivilegeRepository>(
      () => _i42.PrivilegeRepositoryImpl(gh<_i40.PrivilegeDatasource>()));
  gh.factory<_i43.SetApproveSeriesUsecase>(() =>
      _i43.SetApproveSeriesUsecase(gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i44.TaskDatasource>(
      () => _i44.TaskDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i45.TaskRepository>(
      () => _i46.TaskRepositoryImpl(gh<_i44.TaskDatasource>()));
  gh.factory<_i47.UpdatePrivilegeUsecase>(
      () => _i47.UpdatePrivilegeUsecase(gh<_i41.PrivilegeRepository>()));
  gh.factory<_i48.UpdateSeriesUsecase>(
      () => _i48.UpdateSeriesUsecase(gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i49.UsersDatasource>(
      () => _i49.UsersDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i50.UsersRepository>(
      () => _i51.UsersRepositoryImpl(gh<_i49.UsersDatasource>()));
  gh.factory<_i52.ActionLinkUsecase>(
      () => _i52.ActionLinkUsecase(gh<_i34.LinksImportantRepository>()));
  gh.factory<_i53.ActionUserUsecase>(
      () => _i53.ActionUserUsecase(gh<_i50.UsersRepository>()));
  gh.factory<_i54.AddClientUserUsecase>(
      () => _i54.AddClientUserUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i55.AddCommentUsecase>(
      () => _i55.AddCommentUsecase(gh<_i19.CompanyRepository>()));
  gh.factory<_i56.AddLevelUsecase>(
      () => _i56.AddLevelUsecase(gh<_i41.PrivilegeRepository>()));
  gh.factory<_i57.AddRejectReasonsUsecase>(() =>
      _i57.AddRejectReasonsUsecase(gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i58.AddTaskUsecase>(
      () => _i58.AddTaskUsecase(gh<_i45.TaskRepository>()));
  gh.lazySingleton<_i59.AgentsDistributorsActionsDataSource>(() =>
      _i59.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i60.AgentsDistributorsActionsRepo>(() =>
      _i61.AgentsDistributorsActionsRepoImpl(
          gh<_i59.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i62.AgentsDistributorsDataSource>(
      () => _i62.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i63.AgentsDistributorsProfileDataSource>(() =>
      _i63.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i64.AgentsDistributorsProfileRepo>(() =>
      _i65.AgentsDistributorsProfileRepoImpl(
          gh<_i63.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i66.AgentsDistributorsRepo>(() =>
      _i67.AgentsDistributorsRepoImpl(gh<_i62.AgentsDistributorsDataSource>()));
  gh.singleton<_i68.AppManagerCubit>(
      _i68.AppManagerCubit(gh<_i32.GetVersionUseCase>()));
  gh.factory<_i69.ApproveRejectClientUsecase>(
      () => _i69.ApproveRejectClientUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i70.AttachmentsRowCubit>(
      () => _i70.AttachmentsRowCubit(gh<_i24.GetClientSupportFilesUsecase>()));
  gh.factory<_i71.ChangeStatusTaskUsecase>(
      () => _i71.ChangeStatusTaskUsecase(gh<_i45.TaskRepository>()));
  gh.factory<_i72.ChangeTypeClientUsecase>(
      () => _i72.ChangeTypeClientUsecase(gh<_i13.ClientsListRepository>()));
  gh.factory<_i73.ClientsListBloc>(() => _i73.ClientsListBloc(
        gh<_i27.GetClientsWithFilterUserUsecase>(),
        gh<_i30.GetRecommendedClientsUsecase>(),
        gh<_i54.AddClientUserUsecase>(),
        gh<_i22.EditClientUserUsecase>(),
        gh<_i72.ChangeTypeClientUsecase>(),
        gh<_i31.GetSimilarClientsUsecase>(),
        gh<_i69.ApproveRejectClientUsecase>(),
        gh<_i21.CrudClientSupportFilesUsecase>(),
        gh<_i24.GetClientSupportFilesUsecase>(),
      ));
  gh.factory<_i74.CommunicationListBloc>(
      () => _i74.CommunicationListBloc(gh<_i29.GetCommunicationListUsecase>()));
  gh.factory<_i75.CompanyCubit>(() => _i75.CompanyCubit(
        gh<_i28.GetCommentUsecase>(),
        gh<_i55.AddCommentUsecase>(),
      ));
  gh.lazySingleton<_i76.DoneTrainingUsecase>(
      () => _i76.DoneTrainingUsecase(gh<_i64.AgentsDistributorsProfileRepo>()));
  gh.factory<_i77.EditRejectReasonsUsecase>(() =>
      _i77.EditRejectReasonsUsecase(gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i78.FilterTaskUsecase>(
      () => _i78.FilterTaskUsecase(gh<_i45.TaskRepository>()));
  gh.lazySingleton<_i79.GetAgentClientListUsecase>(() =>
      _i79.GetAgentClientListUsecase(gh<_i64.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i80.GetAgentCommentsListUsecase>(() =>
      _i80.GetAgentCommentsListUsecase(
          gh<_i64.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i81.GetAgentDatesListUsecase>(() =>
      _i81.GetAgentDatesListUsecase(gh<_i64.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i82.GetAgentInvoiceListUsecase>(() =>
      _i82.GetAgentInvoiceListUsecase(
          gh<_i64.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i83.GetAgentUsecase>(
      () => _i83.GetAgentUsecase(gh<_i64.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i84.GetAgentsAndDistributorsUseCase>(() =>
      _i84.GetAgentsAndDistributorsUseCase(gh<_i66.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i85.GetAllCitiesUseCase>(
      () => _i85.GetAllCitiesUseCase(gh<_i60.AgentsDistributorsActionsRepo>()));
  gh.factory<_i86.GetAllUsersUsecase>(
      () => _i86.GetAllUsersUsecase(gh<_i50.UsersRepository>()));
  gh.lazySingleton<_i87.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i87.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i88.GetLevelsUsecase>(
      () => _i88.GetLevelsUsecase(gh<_i41.PrivilegeRepository>()));
  gh.factory<_i89.GetLinkUsecase>(
      () => _i89.GetLinkUsecase(gh<_i34.LinksImportantRepository>()));
  gh.factory<_i90.GetPrivilegesUsecase>(
      () => _i90.GetPrivilegesUsecase(gh<_i41.PrivilegeRepository>()));
  gh.factory<_i91.GetRejectReasonsUsecase>(() =>
      _i91.GetRejectReasonsUsecase(gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i92.GetUserSeriesUsecase>(
      () => _i92.GetUserSeriesUsecase(gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i93.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i93.GetUsersByDepartmentAndRegionUsecase(gh<_i45.TaskRepository>()));
  gh.factory<_i94.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i94.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i37.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i95.GetWithdrawalsInvoicesUsecase>(() =>
      _i95.GetWithdrawalsInvoicesUsecase(
          gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i96.GetWithdrawnDetailsUsecase>(() =>
      _i96.GetWithdrawnDetailsUsecase(gh<_i37.ManageWithdrawalsRepository>()));
  gh.factory<_i97.LinkCubit>(() => _i97.LinkCubit(
        gh<_i89.GetLinkUsecase>(),
        gh<_i52.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i98.ManageWithdrawalsCubit>(
      () => _i98.ManageWithdrawalsCubit(
            gh<_i92.GetUserSeriesUsecase>(),
            gh<_i48.UpdateSeriesUsecase>(),
            gh<_i86.GetAllUsersUsecase>(),
            gh<_i95.GetWithdrawalsInvoicesUsecase>(),
            gh<_i94.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i43.SetApproveSeriesUsecase>(),
            gh<_i96.GetWithdrawnDetailsUsecase>(),
            gh<_i57.AddRejectReasonsUsecase>(),
            gh<_i91.GetRejectReasonsUsecase>(),
            gh<_i77.EditRejectReasonsUsecase>(),
            gh<_i87.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i99.ParticipateListRepository>(() =>
      _i100.ParticipateListRepositoryImpl(
          gh<_i39.ParticipatesListDatasource>()));
  gh.factory<_i101.ParticipateListUsecase>(
      () => _i101.ParticipateListUsecase(gh<_i99.ParticipateListRepository>()));
  gh.lazySingleton<_i102.PrivilegeCubit>(() => _i102.PrivilegeCubit(
        gh<_i88.GetLevelsUsecase>(),
        gh<_i90.GetPrivilegesUsecase>(),
        gh<_i47.UpdatePrivilegeUsecase>(),
        gh<_i56.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i103.TaskCubit>(() => _i103.TaskCubit(
        gh<_i58.AddTaskUsecase>(),
        gh<_i78.FilterTaskUsecase>(),
        gh<_i71.ChangeStatusTaskUsecase>(),
      ));
  gh.lazySingleton<_i104.UpdateAgentUseCase>(
      () => _i104.UpdateAgentUseCase(gh<_i60.AgentsDistributorsActionsRepo>()));
  gh.factory<_i105.UsersCubit>(() => _i105.UsersCubit(
        gh<_i86.GetAllUsersUsecase>(),
        gh<_i53.ActionUserUsecase>(),
        gh<_i93.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i106.AddAgentCommentUsecase>(() =>
      _i106.AddAgentCommentUsecase(gh<_i64.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i107.AddAgentDateUseCase>(() =>
      _i107.AddAgentDateUseCase(gh<_i64.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i108.AddAgentUseCase>(
      () => _i108.AddAgentUseCase(gh<_i60.AgentsDistributorsActionsRepo>()));
  gh.factory<_i109.AddParticipateCommentUsecase>(() =>
      _i109.AddParticipateCommentUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i110.AddParticipateUserUsecase>(() =>
      _i110.AddParticipateUserUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i111.AgentsDistributorsActionsCubit>(
      () => _i111.AgentsDistributorsActionsCubit(
            gh<_i85.GetAllCitiesUseCase>(),
            gh<_i108.AddAgentUseCase>(),
            gh<_i104.UpdateAgentUseCase>(),
          ));
  gh.factory<_i112.AgentsDistributorsCubit>(() => _i112.AgentsDistributorsCubit(
      gh<_i84.GetAgentsAndDistributorsUseCase>()));
  gh.singleton<_i113.CitiesCubit>(
      _i113.CitiesCubit(gh<_i85.GetAllCitiesUseCase>()));
  gh.factory<_i114.EditParticipateUserUsecase>(() =>
      _i114.EditParticipateUserUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i115.GetInvoiceByIdUsecase>(
      () => _i115.GetInvoiceByIdUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i116.ParticipateClientListUsecase>(() =>
      _i116.ParticipateClientListUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i117.ParticipateCommentListUsecase>(() =>
      _i117.ParticipateCommentListUsecase(
          gh<_i99.ParticipateListRepository>()));
  gh.factory<_i118.ParticipateInvoiceListUsecase>(() =>
      _i118.ParticipateInvoiceListUsecase(
          gh<_i99.ParticipateListRepository>()));
  gh.factory<_i119.ParticipateListBloc>(() => _i119.ParticipateListBloc(
        gh<_i101.ParticipateListUsecase>(),
        gh<_i110.AddParticipateUserUsecase>(),
        gh<_i114.EditParticipateUserUsecase>(),
        gh<_i116.ParticipateClientListUsecase>(),
        gh<_i118.ParticipateInvoiceListUsecase>(),
        gh<_i115.GetInvoiceByIdUsecase>(),
        gh<_i117.ParticipateCommentListUsecase>(),
        gh<_i109.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i120.AgentsDistributorsProfileBloc>(
      () => _i120.AgentsDistributorsProfileBloc(
            gh<_i79.GetAgentClientListUsecase>(),
            gh<_i83.GetAgentUsecase>(),
            gh<_i82.GetAgentInvoiceListUsecase>(),
            gh<_i115.GetInvoiceByIdUsecase>(),
            gh<_i80.GetAgentCommentsListUsecase>(),
            gh<_i106.AddAgentCommentUsecase>(),
            gh<_i76.DoneTrainingUsecase>(),
            gh<_i107.AddAgentDateUseCase>(),
            gh<_i81.GetAgentDatesListUsecase>(),
          ));
  return getIt;
}

class _$AppModule extends _i121.AppModule {}
