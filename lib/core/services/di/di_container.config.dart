// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i7;

import '../../../api/api.dart' as _i3;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i10;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i12;
import '../../../features/app/domain/repositories/app_repository.dart' as _i11;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i36;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart' as _i85;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i40;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i41;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i43;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i42;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i88;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i113;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i44;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i66;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i67;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i120;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i56;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i58;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i57;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i75;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i96;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i111;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i112;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i60;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i135;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i140;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i127;
import '../../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i16;
import '../../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i18;
import '../../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i17;
import '../../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i70;
import '../../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i86;
import '../../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i90;
import '../../../features/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i25;
import '../../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i26;
import '../../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i27;
import '../../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i28;
import '../../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i29;
import '../../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i30;
import '../../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i31;
import '../../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i34;
import '../../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i35;
import '../../../features/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i59;
import '../../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i91;
import '../../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i20;
import '../../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i22;
import '../../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i21;
import '../../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i33;
import '../../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i92;
import '../../../features/company/data/data_sources/company_datasource.dart'
    as _i19;
import '../../../features/company/data/repositories/com_repo_impl.dart' as _i24;
import '../../../features/company/domain/repositories/comment_repo.dart'
    as _i23;
import '../../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i71;
import '../../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i32;
import '../../../features/company/presentation/manager/company_cubit.dart'
    as _i93;
import '../../../features/links/data/data_sources/link_datasource.dart' as _i37;
import '../../../features/links/data/repositories/link_repo_impl.dart' as _i39;
import '../../../features/links/domain/repositories/links_repo.dart' as _i38;
import '../../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i68;
import '../../../features/links/domain/use_cases/get_link_usecase.dart'
    as _i108;
import '../../../features/links/presentation/manager/link_cubit.dart' as _i119;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i76;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i79;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i80;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i78;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i82;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i84;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i77;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i81;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i83;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i130;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i131;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i132;
import '../../../features/manage_agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i94;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i102;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i98;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i99;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i100;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i101;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i103;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i104;
import '../../../features/manage_agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i128;
import '../../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i136;
import '../../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i146;
import '../../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i137;
import '../../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i48;
import '../../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i123;
import '../../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i122;
import '../../../features/manage_participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i133;
import '../../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i134;
import '../../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i139;
import '../../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i141;
import '../../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i142;
import '../../../features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i143;
import '../../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i144;
import '../../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i124;
import '../../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i145;
import '../../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i49;
import '../../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i51;
import '../../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i50;
import '../../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i72;
import '../../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i107;
import '../../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i109;
import '../../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i61;
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i125;
import '../../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i63;
import '../../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i65;
import '../../../features/manage_users/domain/repositories/users_repository.dart'
    as _i64;
import '../../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i69;
import '../../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i105;
import '../../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i129;
import '../../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i45;
import '../../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i47;
import '../../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i46;
import '../../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i73;
import '../../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i95;
import '../../../features/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i106;
import '../../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i110;
import '../../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i114;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i116;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i117;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i118;
import '../../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i52;
import '../../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i62;
import '../../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i121;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i53;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i55;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i54;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i74;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i89;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i97;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i115;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i126;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i87;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i138;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i13;
import '../cache_services/prefs_consumer.dart' as _i15;
import '../cache_services/secure_storage_consumer.dart' as _i14;
import 'di_container.dart' as _i147;

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
  gh.lazySingleton<_i4.Dio>(() => appModule.dio);
  gh.singleton<_i5.FlutterSecureStorage>(appModule.secureStorage);
  gh.singleton<_i6.Logger>(appModule.logger);
  await gh.singletonAsync<_i7.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.lazySingleton<_i8.ApiServices>(() => _i9.DioServices(gh<_i4.Dio>()));
  gh.factory<_i10.AppDatasource>(
      () => _i10.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i11.AppRepository>(
      () => _i12.AppRepositoryImpl(gh<_i10.AppDatasource>()));
  gh.lazySingleton<_i13.CacheServices>(
    () => _i14.SecureStorageConsumer(gh<_i5.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i13.CacheServices>(
      () => _i15.PrefsConsumer(gh<_i7.SharedPreferences>()));
  gh.factory<_i16.ClientsListDatasource>(
      () => _i16.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i17.ClientsListRepository>(
      () => _i18.ClientsListRepositoryImpl(gh<_i16.ClientsListDatasource>()));
  gh.factory<_i19.CommentCompanyDatasource>(
      () => _i19.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i20.CommunicationListDatasource>(
      () => _i20.CommunicationListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i21.CommunicationListRepository>(() =>
      _i22.CommunicationListRepositoryImpl(
          gh<_i20.CommunicationListDatasource>()));
  gh.factory<_i23.CompanyRepository>(
      () => _i24.CompanyRepositoryImpl(gh<_i19.CommentCompanyDatasource>()));
  gh.lazySingleton<_i25.CrudClientSupportFilesUsecase>(() =>
      _i25.CrudClientSupportFilesUsecase(
          repository: gh<_i17.ClientsListRepository>()));
  gh.factory<_i26.EditClientUserUsecase>(
      () => _i26.EditClientUserUsecase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i27.GetAllClientsListUseCase>(
      () => _i27.GetAllClientsListUseCase(gh<_i17.ClientsListRepository>()));
  gh.lazySingleton<_i28.GetClientSupportFilesUsecase>(() =>
      _i28.GetClientSupportFilesUsecase(
          repository: gh<_i17.ClientsListRepository>()));
  gh.factory<_i29.GetClientsListByRegionUseCase>(() =>
      _i29.GetClientsListByRegionUseCase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i30.GetClientsListByUserUseCase>(
      () => _i30.GetClientsListByUserUseCase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i31.GetClientsWithFilterUserUsecase>(() =>
      _i31.GetClientsWithFilterUserUsecase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i32.GetCommentUsecase>(
      () => _i32.GetCommentUsecase(gh<_i23.CompanyRepository>()));
  gh.factory<_i33.GetCommunicationListUsecase>(() =>
      _i33.GetCommunicationListUsecase(gh<_i21.CommunicationListRepository>()));
  gh.factory<_i34.GetRecommendedClientsUsecase>(() =>
      _i34.GetRecommendedClientsUsecase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i35.GetSimilarClientsUsecase>(
      () => _i35.GetSimilarClientsUsecase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i36.GetVersionUseCase>(
      () => _i36.GetVersionUseCase(gh<_i11.AppRepository>()));
  gh.factory<_i37.LinkDatasource>(
      () => _i37.LinkDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i38.LinksImportantRepository>(
      () => _i39.LinkRepositoryImpl(gh<_i37.LinkDatasource>()));
  gh.lazySingleton<_i40.LoginLocalDataSource>(() =>
      _i40.LoginLocalDataSourceImpl(
          gh<_i13.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i41.LoginRemoteDataSource>(
      () => _i41.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i42.LoginRepo>(() => _i43.LoginRepoImpl(
        gh<_i41.LoginRemoteDataSource>(),
        gh<_i40.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i44.LoginUsecase>(
      () => _i44.LoginUsecase(gh<_i42.LoginRepo>()));
  gh.lazySingleton<_i45.ManageWithdrawalsDatasource>(
      () => _i45.ManageWithdrawalsDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i46.ManageWithdrawalsRepository>(() =>
      _i47.ManageWithdrawalsRepositoryImpl(
          gh<_i45.ManageWithdrawalsDatasource>()));
  gh.factory<_i48.ParticipatesListDatasource>(
      () => _i48.ParticipatesListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i49.PrivilegeDatasource>(
      () => _i49.PrivilegeDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i50.PrivilegeRepository>(
      () => _i51.PrivilegeRepositoryImpl(gh<_i49.PrivilegeDatasource>()));
  gh.factory<_i52.SetApproveSeriesUsecase>(() =>
      _i52.SetApproveSeriesUsecase(gh<_i46.ManageWithdrawalsRepository>()));
  gh.factory<_i53.TaskDatasource>(
      () => _i53.TaskDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i54.TaskRepository>(
      () => _i55.TaskRepositoryImpl(gh<_i53.TaskDatasource>()));
  gh.lazySingleton<_i56.TicketsDataSource>(
      () => _i56.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i57.TicketsRepo>(
      () => _i58.TicketsRepoImpl(gh<_i56.TicketsDataSource>()));
  gh.factory<_i59.TransferClientUserUsecase>(
      () => _i59.TransferClientUserUsecase(gh<_i17.ClientsListRepository>()));
  gh.lazySingleton<_i60.TransferTicketUseCase>(
      () => _i60.TransferTicketUseCase(gh<_i57.TicketsRepo>()));
  gh.factory<_i61.UpdatePrivilegeUsecase>(
      () => _i61.UpdatePrivilegeUsecase(gh<_i50.PrivilegeRepository>()));
  gh.factory<_i62.UpdateSeriesUsecase>(
      () => _i62.UpdateSeriesUsecase(gh<_i46.ManageWithdrawalsRepository>()));
  gh.factory<_i63.UsersDatasource>(
      () => _i63.UsersDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i64.UsersRepository>(
      () => _i65.UsersRepositoryImpl(gh<_i63.UsersDatasource>()));
  gh.lazySingleton<_i66.ValidateTokenUsecase>(
      () => _i66.ValidateTokenUsecase(gh<_i42.LoginRepo>()));
  gh.lazySingleton<_i67.VerifyOtpUsecase>(
      () => _i67.VerifyOtpUsecase(gh<_i42.LoginRepo>()));
  gh.factory<_i68.ActionLinkUsecase>(
      () => _i68.ActionLinkUsecase(gh<_i38.LinksImportantRepository>()));
  gh.factory<_i69.ActionUserUsecase>(
      () => _i69.ActionUserUsecase(gh<_i64.UsersRepository>()));
  gh.factory<_i70.AddClientUserUsecase>(
      () => _i70.AddClientUserUsecase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i71.AddCommentUsecase>(
      () => _i71.AddCommentUsecase(gh<_i23.CompanyRepository>()));
  gh.factory<_i72.AddLevelUsecase>(
      () => _i72.AddLevelUsecase(gh<_i50.PrivilegeRepository>()));
  gh.factory<_i73.AddRejectReasonsUsecase>(() =>
      _i73.AddRejectReasonsUsecase(gh<_i46.ManageWithdrawalsRepository>()));
  gh.factory<_i74.AddTaskUsecase>(
      () => _i74.AddTaskUsecase(gh<_i54.TaskRepository>()));
  gh.lazySingleton<_i75.AddTicketUseCase>(
      () => _i75.AddTicketUseCase(gh<_i57.TicketsRepo>()));
  gh.lazySingleton<_i76.AgentsDistributorsActionsDataSource>(() =>
      _i76.AgentsDistributorsActionsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i77.AgentsDistributorsActionsRepo>(() =>
      _i78.AgentsDistributorsActionsRepoImpl(
          gh<_i76.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i79.AgentsDistributorsDataSource>(
      () => _i79.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i80.AgentsDistributorsProfileDataSource>(() =>
      _i80.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i81.AgentsDistributorsProfileRepo>(() =>
      _i82.AgentsDistributorsProfileRepoImpl(
          gh<_i80.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i83.AgentsDistributorsRepo>(() =>
      _i84.AgentsDistributorsRepoImpl(gh<_i79.AgentsDistributorsDataSource>()));
  gh.singleton<_i85.AppManagerCubit>(
      _i85.AppManagerCubit(gh<_i36.GetVersionUseCase>()));
  gh.factory<_i86.ApproveRejectClientUsecase>(
      () => _i86.ApproveRejectClientUsecase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i87.AttachmentsRowCubit>(() => _i87.AttachmentsRowCubit(
        gh<_i28.GetClientSupportFilesUsecase>(),
        gh<_i25.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i88.CacheTokenUsecase>(
      () => _i88.CacheTokenUsecase(gh<_i42.LoginRepo>()));
  gh.factory<_i89.ChangeStatusTaskUsecase>(
      () => _i89.ChangeStatusTaskUsecase(gh<_i54.TaskRepository>()));
  gh.factory<_i90.ChangeTypeClientUsecase>(
      () => _i90.ChangeTypeClientUsecase(gh<_i17.ClientsListRepository>()));
  gh.factory<_i91.ClientsListBloc>(() => _i91.ClientsListBloc(
        gh<_i31.GetClientsWithFilterUserUsecase>(),
        gh<_i34.GetRecommendedClientsUsecase>(),
        gh<_i70.AddClientUserUsecase>(),
        gh<_i26.EditClientUserUsecase>(),
        gh<_i90.ChangeTypeClientUsecase>(),
        gh<_i35.GetSimilarClientsUsecase>(),
        gh<_i86.ApproveRejectClientUsecase>(),
        gh<_i25.CrudClientSupportFilesUsecase>(),
        gh<_i28.GetClientSupportFilesUsecase>(),
        gh<_i59.TransferClientUserUsecase>(),
      ));
  gh.factory<_i92.CommunicationListBloc>(
      () => _i92.CommunicationListBloc(gh<_i33.GetCommunicationListUsecase>()));
  gh.factory<_i93.CompanyCubit>(() => _i93.CompanyCubit(
        gh<_i32.GetCommentUsecase>(),
        gh<_i71.AddCommentUsecase>(),
      ));
  gh.lazySingleton<_i94.DoneTrainingUsecase>(
      () => _i94.DoneTrainingUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.factory<_i95.EditRejectReasonsUsecase>(() =>
      _i95.EditRejectReasonsUsecase(gh<_i46.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i96.EditTicketTypeUseCase>(
      () => _i96.EditTicketTypeUseCase(gh<_i57.TicketsRepo>()));
  gh.factory<_i97.FilterTaskUsecase>(
      () => _i97.FilterTaskUsecase(gh<_i54.TaskRepository>()));
  gh.lazySingleton<_i98.GetAgentClientListUsecase>(() =>
      _i98.GetAgentClientListUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i99.GetAgentCommentsListUsecase>(() =>
      _i99.GetAgentCommentsListUsecase(
          gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i100.GetAgentDatesListUsecase>(() =>
      _i100.GetAgentDatesListUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i101.GetAgentInvoiceListUsecase>(() =>
      _i101.GetAgentInvoiceListUsecase(
          gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i102.GetAgentUsecase>(
      () => _i102.GetAgentUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i103.GetAgentsAndDistributorsUseCase>(() =>
      _i103.GetAgentsAndDistributorsUseCase(gh<_i83.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i104.GetAllCitiesUseCase>(() =>
      _i104.GetAllCitiesUseCase(gh<_i77.AgentsDistributorsActionsRepo>()));
  gh.factory<_i105.GetAllUsersUsecase>(
      () => _i105.GetAllUsersUsecase(gh<_i64.UsersRepository>()));
  gh.lazySingleton<_i106.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i106.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i46.ManageWithdrawalsRepository>()));
  gh.factory<_i107.GetLevelsUsecase>(
      () => _i107.GetLevelsUsecase(gh<_i50.PrivilegeRepository>()));
  gh.factory<_i108.GetLinkUsecase>(
      () => _i108.GetLinkUsecase(gh<_i38.LinksImportantRepository>()));
  gh.factory<_i109.GetPrivilegesUsecase>(
      () => _i109.GetPrivilegesUsecase(gh<_i50.PrivilegeRepository>()));
  gh.factory<_i110.GetRejectReasonsUsecase>(() =>
      _i110.GetRejectReasonsUsecase(gh<_i46.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i111.GetTicketByIdUseCase>(
      () => _i111.GetTicketByIdUseCase(gh<_i57.TicketsRepo>()));
  gh.lazySingleton<_i112.GetTicketsUseCase>(
      () => _i112.GetTicketsUseCase(gh<_i57.TicketsRepo>()));
  gh.lazySingleton<_i113.GetTokenUsecase>(
      () => _i113.GetTokenUsecase(gh<_i42.LoginRepo>()));
  gh.factory<_i114.GetUserSeriesUsecase>(
      () => _i114.GetUserSeriesUsecase(gh<_i46.ManageWithdrawalsRepository>()));
  gh.factory<_i115.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i115.GetUsersByDepartmentAndRegionUsecase(gh<_i54.TaskRepository>()));
  gh.factory<_i116.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i116.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i46.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i117.GetWithdrawalsInvoicesUsecase>(() =>
      _i117.GetWithdrawalsInvoicesUsecase(
          gh<_i46.ManageWithdrawalsRepository>()));
  gh.factory<_i118.GetWithdrawnDetailsUsecase>(() =>
      _i118.GetWithdrawnDetailsUsecase(gh<_i46.ManageWithdrawalsRepository>()));
  gh.factory<_i119.LinkCubit>(() => _i119.LinkCubit(
        gh<_i108.GetLinkUsecase>(),
        gh<_i68.ActionLinkUsecase>(),
      ));
  gh.factory<_i120.LoginCubit>(() => _i120.LoginCubit(
        gh<_i44.LoginUsecase>(),
        gh<_i67.VerifyOtpUsecase>(),
        gh<_i88.CacheTokenUsecase>(),
        gh<_i113.GetTokenUsecase>(),
        gh<_i66.ValidateTokenUsecase>(),
      ));
  gh.lazySingleton<_i121.ManageWithdrawalsCubit>(
      () => _i121.ManageWithdrawalsCubit(
            gh<_i114.GetUserSeriesUsecase>(),
            gh<_i62.UpdateSeriesUsecase>(),
            gh<_i105.GetAllUsersUsecase>(),
            gh<_i117.GetWithdrawalsInvoicesUsecase>(),
            gh<_i116.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i52.SetApproveSeriesUsecase>(),
            gh<_i118.GetWithdrawnDetailsUsecase>(),
            gh<_i73.AddRejectReasonsUsecase>(),
            gh<_i110.GetRejectReasonsUsecase>(),
            gh<_i95.EditRejectReasonsUsecase>(),
            gh<_i106.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i122.ParticipateListRepository>(() =>
      _i123.ParticipateListRepositoryImpl(
          gh<_i48.ParticipatesListDatasource>()));
  gh.factory<_i124.ParticipateListUsecase>(() =>
      _i124.ParticipateListUsecase(gh<_i122.ParticipateListRepository>()));
  gh.lazySingleton<_i125.PrivilegeCubit>(() => _i125.PrivilegeCubit(
        gh<_i107.GetLevelsUsecase>(),
        gh<_i109.GetPrivilegesUsecase>(),
        gh<_i61.UpdatePrivilegeUsecase>(),
        gh<_i72.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i126.TaskCubit>(() => _i126.TaskCubit(
        gh<_i74.AddTaskUsecase>(),
        gh<_i97.FilterTaskUsecase>(),
        gh<_i89.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i127.TicketsCubit>(() => _i127.TicketsCubit(
        gh<_i112.GetTicketsUseCase>(),
        gh<_i111.GetTicketByIdUseCase>(),
      ));
  gh.lazySingleton<_i128.UpdateAgentUseCase>(
      () => _i128.UpdateAgentUseCase(gh<_i77.AgentsDistributorsActionsRepo>()));
  gh.factory<_i129.UsersCubit>(() => _i129.UsersCubit(
        gh<_i105.GetAllUsersUsecase>(),
        gh<_i69.ActionUserUsecase>(),
        gh<_i115.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i130.AddAgentCommentUsecase>(() =>
      _i130.AddAgentCommentUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i131.AddAgentDateUseCase>(() =>
      _i131.AddAgentDateUseCase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i132.AddAgentUseCase>(
      () => _i132.AddAgentUseCase(gh<_i77.AgentsDistributorsActionsRepo>()));
  gh.factory<_i133.AddParticipateCommentUsecase>(() =>
      _i133.AddParticipateCommentUsecase(
          gh<_i122.ParticipateListRepository>()));
  gh.factory<_i134.AddParticipateUserUsecase>(() =>
      _i134.AddParticipateUserUsecase(gh<_i122.ParticipateListRepository>()));
  gh.factory<_i135.AddTicketCubit>(
      () => _i135.AddTicketCubit(gh<_i75.AddTicketUseCase>()));
  gh.factory<_i136.AgentsDistributorsActionsCubit>(
      () => _i136.AgentsDistributorsActionsCubit(
            gh<_i104.GetAllCitiesUseCase>(),
            gh<_i132.AddAgentUseCase>(),
            gh<_i128.UpdateAgentUseCase>(),
          ));
  gh.factory<_i137.AgentsDistributorsCubit>(() => _i137.AgentsDistributorsCubit(
      gh<_i103.GetAgentsAndDistributorsUseCase>()));
  gh.singleton<_i138.CitiesCubit>(
      _i138.CitiesCubit(gh<_i104.GetAllCitiesUseCase>()));
  gh.factory<_i139.EditParticipateUserUsecase>(() =>
      _i139.EditParticipateUserUsecase(gh<_i122.ParticipateListRepository>()));
  gh.factory<_i140.EditTicketCubit>(() => _i140.EditTicketCubit(
        gh<_i96.EditTicketTypeUseCase>(),
        gh<_i60.TransferTicketUseCase>(),
      ));
  gh.factory<_i141.GetInvoiceByIdUsecase>(
      () => _i141.GetInvoiceByIdUsecase(gh<_i122.ParticipateListRepository>()));
  gh.factory<_i142.ParticipateClientListUsecase>(() =>
      _i142.ParticipateClientListUsecase(
          gh<_i122.ParticipateListRepository>()));
  gh.factory<_i143.ParticipateCommentListUsecase>(() =>
      _i143.ParticipateCommentListUsecase(
          gh<_i122.ParticipateListRepository>()));
  gh.factory<_i144.ParticipateInvoiceListUsecase>(() =>
      _i144.ParticipateInvoiceListUsecase(
          gh<_i122.ParticipateListRepository>()));
  gh.factory<_i145.ParticipateListBloc>(() => _i145.ParticipateListBloc(
        gh<_i124.ParticipateListUsecase>(),
        gh<_i134.AddParticipateUserUsecase>(),
        gh<_i139.EditParticipateUserUsecase>(),
        gh<_i142.ParticipateClientListUsecase>(),
        gh<_i144.ParticipateInvoiceListUsecase>(),
        gh<_i141.GetInvoiceByIdUsecase>(),
        gh<_i143.ParticipateCommentListUsecase>(),
        gh<_i133.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i146.AgentsDistributorsProfileBloc>(
      () => _i146.AgentsDistributorsProfileBloc(
            gh<_i98.GetAgentClientListUsecase>(),
            gh<_i102.GetAgentUsecase>(),
            gh<_i101.GetAgentInvoiceListUsecase>(),
            gh<_i141.GetInvoiceByIdUsecase>(),
            gh<_i99.GetAgentCommentsListUsecase>(),
            gh<_i130.AddAgentCommentUsecase>(),
            gh<_i94.DoneTrainingUsecase>(),
            gh<_i131.AddAgentDateUseCase>(),
            gh<_i100.GetAgentDatesListUsecase>(),
          ));
  return getIt;
}

class _$AppModule extends _i147.AppModule {}
