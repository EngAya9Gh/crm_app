// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../../api/api.dart' as _i6;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i21;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i83;
import '../../../features/app/domain/repositories/app_repository.dart' as _i82;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i126;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i149;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i36;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i61;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i71;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i70;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i99;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i100;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i101;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i102;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i103;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i135;
import '../../../features/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i62;
import '../../../features/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i134;
import '../../../features/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i133;
import '../../../features/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i143;
import '../../../features/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i144;
import '../../../features/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i145;
import '../../../features/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i148;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i19;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i35;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i34;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i54;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i55;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i56;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i58;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i57;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i59;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i127;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i69;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i60;
import '../../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i22;
import '../../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i53;
import '../../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i52;
import '../../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i85;
import '../../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i86;
import '../../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i87;
import '../../../features/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i116;
import '../../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i88;
import '../../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i89;
import '../../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i117;
import '../../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i90;
import '../../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i91;
import '../../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i92;
import '../../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i93;
import '../../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i94;
import '../../../features/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i95;
import '../../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i153;
import '../../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i23;
import '../../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i111;
import '../../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i110;
import '../../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i138;
import '../../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i152;
import '../../../features/company/data/data_sources/company_datasource.dart'
    as _i24;
import '../../../features/company/data/repositories/com_repo_impl.dart' as _i80;
import '../../../features/company/domain/repositories/comment_repo.dart'
    as _i79;
import '../../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i131;
import '../../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i132;
import '../../../features/company/presentation/manager/company_cubit.dart'
    as _i147;
import '../../../features/links/data/data_sources/link_datasource.dart' as _i25;
import '../../../features/links/data/repositories/link_repo_impl.dart' as _i68;
import '../../../features/links/domain/repositories/links_repo.dart' as _i67;
import '../../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i129;
import '../../../features/links/domain/use_cases/get_link_usecase.dart'
    as _i130;
import '../../../features/links/presentation/manager/link_cubit.dart' as _i136;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i13;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i30;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i33;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i15;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i40;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i50;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i14;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i39;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i49;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i119;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i104;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i16;
import '../../../features/manage_agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i120;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i121;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i122;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i123;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i124;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i125;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i105;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i17;
import '../../../features/manage_agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i18;
import '../../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i84;
import '../../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i137;
import '../../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i146;
import '../../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i26;
import '../../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i32;
import '../../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i31;
import '../../../features/manage_participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i41;
import '../../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i42;
import '../../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i43;
import '../../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i44;
import '../../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i45;
import '../../../features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i46;
import '../../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i47;
import '../../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i48;
import '../../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i81;
import '../../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i27;
import '../../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i107;
import '../../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i106;
import '../../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i139;
import '../../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i140;
import '../../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i141;
import '../../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i142;
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i154;
import '../../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i28;
import '../../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i64;
import '../../../features/manage_users/domain/repositories/users_repository.dart'
    as _i63;
import '../../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i108;
import '../../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i109;
import '../../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i118;
import '../../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i20;
import '../../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i66;
import '../../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i65;
import '../../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i72;
import '../../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i73;
import '../../../features/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i97;
import '../../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i74;
import '../../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i75;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i96;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i98;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i76;
import '../../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i77;
import '../../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i78;
import '../../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i150;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i29;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i38;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i37;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i112;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i113;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i114;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i115;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i128;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i151;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i51;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i10;
import '../cache_services/prefs_consumer.dart' as _i12;
import '../cache_services/secure_storage_consumer.dart' as _i11;
import 'di_container.dart' as _i155;

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
  await gh.singletonAsync<_i3.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.singleton<_i4.FlutterSecureStorage>(() => appModule.secureStorage);
  gh.singleton<_i5.Logger>(() => appModule.logger);
  gh.lazySingleton<_i6.Api>(() => _i6.Api());
  gh.lazySingleton<_i7.Dio>(() => appModule.dio);
  gh.lazySingleton<_i8.ApiServices>(() => _i9.DioServices(gh<_i7.Dio>()));
  gh.lazySingleton<_i10.CacheServices>(
    () => _i11.SecureStorageConsumer(gh<_i4.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i10.CacheServices>(
      () => _i12.PrefsConsumer(gh<_i3.SharedPreferences>()));
  gh.lazySingleton<_i13.AgentsDistributorsActionsDataSource>(() =>
      _i13.AgentsDistributorsActionsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i14.AgentsDistributorsActionsRepo>(() =>
      _i15.AgentsDistributorsActionsRepoImpl(
          gh<_i13.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i16.AddAgentUseCase>(
      () => _i16.AddAgentUseCase(gh<_i14.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i17.GetAllCitiesUseCase>(
      () => _i17.GetAllCitiesUseCase(gh<_i14.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i18.UpdateAgentUseCase>(
      () => _i18.UpdateAgentUseCase(gh<_i14.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i19.TicketsDataSource>(
      () => _i19.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i20.ManageWithdrawalsDatasource>(
      () => _i20.ManageWithdrawalsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i21.AppDatasource>(
      () => _i21.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i22.ClientsListDatasource>(
      () => _i22.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i23.CommunicationListDatasource>(
      () => _i23.CommunicationListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i24.CommentCompanyDatasource>(
      () => _i24.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i25.LinkDatasource>(
      () => _i25.LinkDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i26.ParticipatesListDatasource>(
      () => _i26.ParticipatesListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i27.PrivilegeDatasource>(
      () => _i27.PrivilegeDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i28.UsersDatasource>(
      () => _i28.UsersDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i29.TaskDatasource>(
      () => _i29.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i30.AgentsDistributorsDataSource>(
      () => _i30.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i31.ParticipateListRepository>(() =>
      _i32.ParticipateListRepositoryImpl(
          gh<_i26.ParticipatesListDatasource>()));
  gh.lazySingleton<_i33.AgentsDistributorsProfileDataSource>(() =>
      _i33.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i34.TicketsRepo>(
      () => _i35.TicketsRepoImpl(gh<_i19.TicketsDataSource>()));
  gh.lazySingleton<_i36.LoginLocalDataSource>(() =>
      _i36.LoginLocalDataSourceImpl(
          gh<_i10.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i37.TaskRepository>(
      () => _i38.TaskRepositoryImpl(gh<_i29.TaskDatasource>()));
  gh.lazySingleton<_i39.AgentsDistributorsProfileRepo>(() =>
      _i40.AgentsDistributorsProfileRepoImpl(
          gh<_i33.AgentsDistributorsProfileDataSource>()));
  gh.factory<_i41.AddParticipateCommentUsecase>(() =>
      _i41.AddParticipateCommentUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i42.AddParticipateUserUsecase>(() =>
      _i42.AddParticipateUserUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i43.EditParticipateUserUsecase>(() =>
      _i43.EditParticipateUserUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i44.GetInvoiceByIdUsecase>(
      () => _i44.GetInvoiceByIdUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i45.ParticipateClientListUsecase>(() =>
      _i45.ParticipateClientListUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i46.ParticipateCommentListUsecase>(() =>
      _i46.ParticipateCommentListUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i47.ParticipateInvoiceListUsecase>(() =>
      _i47.ParticipateInvoiceListUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i48.ParticipateListUsecase>(
      () => _i48.ParticipateListUsecase(gh<_i31.ParticipateListRepository>()));
  gh.lazySingleton<_i49.AgentsDistributorsRepo>(() =>
      _i50.AgentsDistributorsRepoImpl(gh<_i30.AgentsDistributorsDataSource>()));
  gh.singleton<_i51.CitiesCubit>(
      () => _i51.CitiesCubit(gh<_i17.GetAllCitiesUseCase>()));
  gh.factory<_i52.ClientsListRepository>(
      () => _i53.ClientsListRepositoryImpl(gh<_i22.ClientsListDatasource>()));
  gh.lazySingleton<_i54.AddTicketUseCase>(
      () => _i54.AddTicketUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i55.EditTicketTypeUseCase>(
      () => _i55.EditTicketTypeUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i56.GetClientTicketsUseCase>(
      () => _i56.GetClientTicketsUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i57.GetTicketsUseCase>(
      () => _i57.GetTicketsUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i58.GetTicketByIdUseCase>(
      () => _i58.GetTicketByIdUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i59.TransferTicketUseCase>(
      () => _i59.TransferTicketUseCase(gh<_i34.TicketsRepo>()));
  gh.factory<_i60.TicketsCubit>(() => _i60.TicketsCubit(
        gh<_i57.GetTicketsUseCase>(),
        gh<_i58.GetTicketByIdUseCase>(),
        gh<_i56.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i61.LoginRemoteDataSource>(
      () => _i61.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i62.SupportTabDataSource>(
      () => _i62.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i63.UsersRepository>(
      () => _i64.UsersRepositoryImpl(gh<_i28.UsersDatasource>()));
  gh.lazySingleton<_i65.ManageWithdrawalsRepository>(() =>
      _i66.ManageWithdrawalsRepositoryImpl(
          gh<_i20.ManageWithdrawalsDatasource>()));
  gh.factory<_i67.LinksImportantRepository>(
      () => _i68.LinkRepositoryImpl(gh<_i25.LinkDatasource>()));
  gh.factory<_i69.EditTicketCubit>(() => _i69.EditTicketCubit(
        gh<_i55.EditTicketTypeUseCase>(),
        gh<_i59.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i70.LoginRepo>(() => _i71.LoginRepoImpl(
        gh<_i61.LoginRemoteDataSource>(),
        gh<_i36.LoginLocalDataSource>(),
      ));
  gh.factory<_i72.AddRejectReasonsUsecase>(() =>
      _i72.AddRejectReasonsUsecase(gh<_i65.ManageWithdrawalsRepository>()));
  gh.factory<_i73.EditRejectReasonsUsecase>(() =>
      _i73.EditRejectReasonsUsecase(gh<_i65.ManageWithdrawalsRepository>()));
  gh.factory<_i74.GetRejectReasonsUsecase>(() =>
      _i74.GetRejectReasonsUsecase(gh<_i65.ManageWithdrawalsRepository>()));
  gh.factory<_i75.GetUserSeriesUsecase>(
      () => _i75.GetUserSeriesUsecase(gh<_i65.ManageWithdrawalsRepository>()));
  gh.factory<_i76.GetWithdrawnDetailsUsecase>(() =>
      _i76.GetWithdrawnDetailsUsecase(gh<_i65.ManageWithdrawalsRepository>()));
  gh.factory<_i77.SetApproveSeriesUsecase>(() =>
      _i77.SetApproveSeriesUsecase(gh<_i65.ManageWithdrawalsRepository>()));
  gh.factory<_i78.UpdateSeriesUsecase>(
      () => _i78.UpdateSeriesUsecase(gh<_i65.ManageWithdrawalsRepository>()));
  gh.factory<_i79.CompanyRepository>(
      () => _i80.CompanyRepositoryImpl(gh<_i24.CommentCompanyDatasource>()));
  gh.factory<_i81.ParticipateListBloc>(() => _i81.ParticipateListBloc(
        gh<_i48.ParticipateListUsecase>(),
        gh<_i42.AddParticipateUserUsecase>(),
        gh<_i43.EditParticipateUserUsecase>(),
        gh<_i45.ParticipateClientListUsecase>(),
        gh<_i47.ParticipateInvoiceListUsecase>(),
        gh<_i44.GetInvoiceByIdUsecase>(),
        gh<_i46.ParticipateCommentListUsecase>(),
        gh<_i41.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i82.AppRepository>(
      () => _i83.AppRepositoryImpl(gh<_i21.AppDatasource>()));
  gh.factory<_i84.AgentsDistributorsActionsCubit>(
      () => _i84.AgentsDistributorsActionsCubit(
            gh<_i17.GetAllCitiesUseCase>(),
            gh<_i16.AddAgentUseCase>(),
            gh<_i18.UpdateAgentUseCase>(),
          ));
  gh.factory<_i85.AddClientUserUsecase>(
      () => _i85.AddClientUserUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i86.ApproveRejectClientUsecase>(
      () => _i86.ApproveRejectClientUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i87.ChangeTypeClientUsecase>(
      () => _i87.ChangeTypeClientUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i88.EditClientUserUsecase>(
      () => _i88.EditClientUserUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i89.GetAllClientsListUseCase>(
      () => _i89.GetAllClientsListUseCase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i90.GetClientsListByRegionUseCase>(() =>
      _i90.GetClientsListByRegionUseCase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i91.GetClientsListByUserUseCase>(
      () => _i91.GetClientsListByUserUseCase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i92.GetClientsWithFilterUserUsecase>(() =>
      _i92.GetClientsWithFilterUserUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i93.GetRecommendedClientsUsecase>(() =>
      _i93.GetRecommendedClientsUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i94.GetSimilarClientsUsecase>(
      () => _i94.GetSimilarClientsUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i95.TransferClientUserUsecase>(
      () => _i95.TransferClientUserUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i96.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i96.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i65.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i97.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i97.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i65.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i98.GetWithdrawalsInvoicesUsecase>(() =>
      _i98.GetWithdrawalsInvoicesUsecase(
          gh<_i65.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i99.CacheTokenUsecase>(
      () => _i99.CacheTokenUsecase(gh<_i70.LoginRepo>()));
  gh.lazySingleton<_i100.GetTokenUsecase>(
      () => _i100.GetTokenUsecase(gh<_i70.LoginRepo>()));
  gh.lazySingleton<_i101.LoginUsecase>(
      () => _i101.LoginUsecase(gh<_i70.LoginRepo>()));
  gh.lazySingleton<_i102.ValidateTokenUsecase>(
      () => _i102.ValidateTokenUsecase(gh<_i70.LoginRepo>()));
  gh.lazySingleton<_i103.VerifyOtpUsecase>(
      () => _i103.VerifyOtpUsecase(gh<_i70.LoginRepo>()));
  gh.lazySingleton<_i104.AddAgentDateUseCase>(() =>
      _i104.AddAgentDateUseCase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i105.GetAgentsAndDistributorsUseCase>(() =>
      _i105.GetAgentsAndDistributorsUseCase(gh<_i49.AgentsDistributorsRepo>()));
  gh.factory<_i106.PrivilegeRepository>(
      () => _i107.PrivilegeRepositoryImpl(gh<_i27.PrivilegeDatasource>()));
  gh.factory<_i108.ActionUserUsecase>(
      () => _i108.ActionUserUsecase(gh<_i63.UsersRepository>()));
  gh.factory<_i109.GetAllUsersUsecase>(
      () => _i109.GetAllUsersUsecase(gh<_i63.UsersRepository>()));
  gh.factory<_i110.CommunicationListRepository>(() =>
      _i111.CommunicationListRepositoryImpl(
          gh<_i23.CommunicationListDatasource>()));
  gh.factory<_i112.AddTaskUsecase>(
      () => _i112.AddTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i113.ChangeStatusTaskUsecase>(
      () => _i113.ChangeStatusTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i114.FilterTaskUsecase>(
      () => _i114.FilterTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i115.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i115.GetUsersByDepartmentAndRegionUsecase(gh<_i37.TaskRepository>()));
  gh.lazySingleton<_i116.CrudClientSupportFilesUsecase>(() =>
      _i116.CrudClientSupportFilesUsecase(
          repository: gh<_i52.ClientsListRepository>()));
  gh.lazySingleton<_i117.GetClientSupportFilesUsecase>(() =>
      _i117.GetClientSupportFilesUsecase(
          repository: gh<_i52.ClientsListRepository>()));
  gh.factory<_i118.UsersCubit>(() => _i118.UsersCubit(
        gh<_i109.GetAllUsersUsecase>(),
        gh<_i108.ActionUserUsecase>(),
        gh<_i115.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i119.AddAgentCommentUsecase>(() =>
      _i119.AddAgentCommentUsecase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i120.DoneTrainingUsecase>(() =>
      _i120.DoneTrainingUsecase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i121.GetAgentUsecase>(
      () => _i121.GetAgentUsecase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i122.GetAgentClientListUsecase>(() =>
      _i122.GetAgentClientListUsecase(
          gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i123.GetAgentCommentsListUsecase>(() =>
      _i123.GetAgentCommentsListUsecase(
          gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i124.GetAgentDatesListUsecase>(() =>
      _i124.GetAgentDatesListUsecase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i125.GetAgentInvoiceListUsecase>(() =>
      _i125.GetAgentInvoiceListUsecase(
          gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.factory<_i126.GetVersionUseCase>(
      () => _i126.GetVersionUseCase(gh<_i82.AppRepository>()));
  gh.factory<_i127.AddTicketCubit>(
      () => _i127.AddTicketCubit(gh<_i54.AddTicketUseCase>()));
  gh.lazySingleton<_i128.TaskCubit>(() => _i128.TaskCubit(
        gh<_i112.AddTaskUsecase>(),
        gh<_i114.FilterTaskUsecase>(),
        gh<_i113.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i129.ActionLinkUsecase>(
      () => _i129.ActionLinkUsecase(gh<_i67.LinksImportantRepository>()));
  gh.factory<_i130.GetLinkUsecase>(
      () => _i130.GetLinkUsecase(gh<_i67.LinksImportantRepository>()));
  gh.factory<_i131.AddCommentUsecase>(
      () => _i131.AddCommentUsecase(gh<_i79.CompanyRepository>()));
  gh.factory<_i132.GetCommentUsecase>(
      () => _i132.GetCommentUsecase(gh<_i79.CompanyRepository>()));
  gh.lazySingleton<_i133.SupportTabRepo>(
      () => _i134.SupportTabRepoImpl(gh<_i62.SupportTabDataSource>()));
  gh.factory<_i135.LoginCubit>(() => _i135.LoginCubit(
        gh<_i101.LoginUsecase>(),
        gh<_i103.VerifyOtpUsecase>(),
        gh<_i99.CacheTokenUsecase>(),
        gh<_i100.GetTokenUsecase>(),
        gh<_i102.ValidateTokenUsecase>(),
      ));
  gh.factory<_i136.LinkCubit>(() => _i136.LinkCubit(
        gh<_i130.GetLinkUsecase>(),
        gh<_i129.ActionLinkUsecase>(),
      ));
  gh.factory<_i137.AgentsDistributorsProfileBloc>(
      () => _i137.AgentsDistributorsProfileBloc(
            gh<_i122.GetAgentClientListUsecase>(),
            gh<_i121.GetAgentUsecase>(),
            gh<_i125.GetAgentInvoiceListUsecase>(),
            gh<_i44.GetInvoiceByIdUsecase>(),
            gh<_i123.GetAgentCommentsListUsecase>(),
            gh<_i119.AddAgentCommentUsecase>(),
            gh<_i120.DoneTrainingUsecase>(),
            gh<_i104.AddAgentDateUseCase>(),
            gh<_i124.GetAgentDatesListUsecase>(),
          ));
  gh.factory<_i138.GetCommunicationListUsecase>(() =>
      _i138.GetCommunicationListUsecase(
          gh<_i110.CommunicationListRepository>()));
  gh.factory<_i139.AddLevelUsecase>(
      () => _i139.AddLevelUsecase(gh<_i106.PrivilegeRepository>()));
  gh.factory<_i140.GetLevelsUsecase>(
      () => _i140.GetLevelsUsecase(gh<_i106.PrivilegeRepository>()));
  gh.factory<_i141.GetPrivilegesUsecase>(
      () => _i141.GetPrivilegesUsecase(gh<_i106.PrivilegeRepository>()));
  gh.factory<_i142.UpdatePrivilegeUsecase>(
      () => _i142.UpdatePrivilegeUsecase(gh<_i106.PrivilegeRepository>()));
  gh.lazySingleton<_i143.GetInvoiceByClientUsecase>(
      () => _i143.GetInvoiceByClientUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i144.SetDateDoneUsecase>(
      () => _i144.SetDateDoneUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i145.SetReadyInstallUsecase>(
      () => _i145.SetReadyInstallUsecase(gh<_i133.SupportTabRepo>()));
  gh.factory<_i146.AgentsDistributorsCubit>(() => _i146.AgentsDistributorsCubit(
      gh<_i105.GetAgentsAndDistributorsUseCase>()));
  gh.factory<_i147.CompanyCubit>(() => _i147.CompanyCubit(
        gh<_i132.GetCommentUsecase>(),
        gh<_i131.AddCommentUsecase>(),
      ));
  gh.factory<_i148.SupportTabCubit>(() => _i148.SupportTabCubit(
        gh<_i143.GetInvoiceByClientUsecase>(),
        gh<_i144.SetDateDoneUsecase>(),
        gh<_i145.SetReadyInstallUsecase>(),
      ));
  gh.singleton<_i149.AppManagerCubit>(
      () => _i149.AppManagerCubit(gh<_i126.GetVersionUseCase>()));
  gh.lazySingleton<_i150.ManageWithdrawalsCubit>(
      () => _i150.ManageWithdrawalsCubit(
            gh<_i75.GetUserSeriesUsecase>(),
            gh<_i78.UpdateSeriesUsecase>(),
            gh<_i109.GetAllUsersUsecase>(),
            gh<_i98.GetWithdrawalsInvoicesUsecase>(),
            gh<_i96.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i77.SetApproveSeriesUsecase>(),
            gh<_i76.GetWithdrawnDetailsUsecase>(),
            gh<_i72.AddRejectReasonsUsecase>(),
            gh<_i74.GetRejectReasonsUsecase>(),
            gh<_i73.EditRejectReasonsUsecase>(),
            gh<_i97.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i151.AttachmentsRowCubit>(() => _i151.AttachmentsRowCubit(
        gh<_i117.GetClientSupportFilesUsecase>(),
        gh<_i116.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i152.CommunicationListBloc>(() =>
      _i152.CommunicationListBloc(gh<_i138.GetCommunicationListUsecase>()));
  gh.factory<_i153.ClientsListBloc>(() => _i153.ClientsListBloc(
        gh<_i92.GetClientsWithFilterUserUsecase>(),
        gh<_i93.GetRecommendedClientsUsecase>(),
        gh<_i85.AddClientUserUsecase>(),
        gh<_i88.EditClientUserUsecase>(),
        gh<_i87.ChangeTypeClientUsecase>(),
        gh<_i94.GetSimilarClientsUsecase>(),
        gh<_i86.ApproveRejectClientUsecase>(),
        gh<_i116.CrudClientSupportFilesUsecase>(),
        gh<_i117.GetClientSupportFilesUsecase>(),
        gh<_i95.TransferClientUserUsecase>(),
      ));
  gh.lazySingleton<_i154.PrivilegeCubit>(() => _i154.PrivilegeCubit(
        gh<_i140.GetLevelsUsecase>(),
        gh<_i141.GetPrivilegesUsecase>(),
        gh<_i142.UpdatePrivilegeUsecase>(),
        gh<_i139.AddLevelUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i155.AppModule {}
