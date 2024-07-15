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
import 'package:location/location.dart' as _i8;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../../api/api.dart' as _i6;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i17;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i61;
import '../../../features/app/domain/repositories/app_repository.dart' as _i60;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i129;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i164;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i31;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i46;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i55;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i54;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i69;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i70;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i71;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i72;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i73;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i139;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i15;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i28;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i27;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i39;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i40;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i41;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i43;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i42;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i44;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i130;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i53;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i45;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i18;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i89;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i88;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i96;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i167;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i37;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i65;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i64;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i80;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i81;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i82;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i83;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i84;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i85;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i86;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i136;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i26;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i48;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i47;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i114;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i113;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i148;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i59;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i58;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i140;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i141;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i142;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i143;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i147;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i20;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i30;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i29;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i32;
import '../../../features/mangement/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i33;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i177;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i93;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i92;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i157;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i158;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i106;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i159;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i160;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i108;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i107;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i161;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i162;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i163;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i166;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i21;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i77;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i76;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i117;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i118;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i119;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i97;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i120;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i124;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i98;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i121;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i122;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i123;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i125;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i126;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i127;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i128;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i138;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i22;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i75;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i74;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i145;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i146;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i188;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i38;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i50;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i49;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i87;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i68;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i189;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i36;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i52;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i63;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i79;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i95;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i62;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i78;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i94;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i149;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i131;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i104;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i134;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i151;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i152;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i153;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i105;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i132;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i133;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i187;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i185;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i176;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i23;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i67;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i66;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i90;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i91;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i99;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i24;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i101;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i100;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i168;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i169;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i170;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i171;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i172;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i173;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i174;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i190;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i56;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i116;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i115;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i178;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i179;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i180;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i181;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i182;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i183;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i184;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i186;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i51;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i103;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i102;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i165;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i191;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i25;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i35;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i34;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i109;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i110;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i111;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i112;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i135;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i144;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i156;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i57;
import 'di_container.dart' as _i192;

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
  final appModule = _$AppModule();
  gh.singletonAsync<_i3.SharedPreferences>(() => appModule.sharedPreferences);
  gh.singleton<_i4.FlutterSecureStorage>(() => appModule.secureStorage);
  gh.singleton<_i5.Logger>(() => appModule.logger);
  gh.lazySingleton<_i6.Api>(() => _i6.Api());
  gh.lazySingleton<_i7.Dio>(() => appModule.dio);
  gh.lazySingleton<_i8.Location>(() => appModule.location);
  gh.lazySingleton<_i9.ApiServices>(() => _i10.DioServices(gh<_i7.Dio>()));
  gh.lazySingleton<_i11.CacheServices>(
    () => _i12.SecureStorageConsumer(gh<_i4.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingletonAsync<_i11.CacheServices>(() async =>
      _i13.PrefsConsumer(await gh.getAsync<_i3.SharedPreferences>()));
  gh.lazySingleton<_i14.AgentsDistributorsActionsDataSource>(() =>
      _i14.AgentsDistributorsActionsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i15.TicketsDataSource>(
      () => _i15.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i16.ManageWithdrawalsDatasource>(
      () => _i16.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i17.AppDatasource>(
      () => _i17.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i18.CommunicationListDatasource>(
      () => _i18.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i19.PrivilegeDatasource>(
      () => _i19.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i20.UsersDatasource>(
      () => _i20.UsersDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i21.ClientsListDatasource>(
      () => _i21.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i22.CommentCompanyDatasource>(
      () => _i22.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i23.LinkDatasource>(
      () => _i23.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i24.ParticipatesListDatasource>(
      () => _i24.ParticipatesListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i25.TaskDatasource>(
      () => _i25.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i26.AdvancedConfigsDatasource>(
      () => _i26.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i27.TicketsRepo>(
      () => _i28.TicketsRepoImpl(gh<_i15.TicketsDataSource>()));
  gh.factory<_i29.UsersRepository>(
      () => _i30.UsersRepositoryImpl(gh<_i20.UsersDatasource>()));
  gh.lazySingleton<_i31.LoginLocalDataSource>(() =>
      _i31.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i32.ActionUserUsecase>(
      () => _i32.ActionUserUsecase(gh<_i29.UsersRepository>()));
  gh.factory<_i33.GetAllUsersUsecase>(
      () => _i33.GetAllUsersUsecase(gh<_i29.UsersRepository>()));
  gh.factory<_i34.TaskRepository>(
      () => _i35.TaskRepositoryImpl(gh<_i25.TaskDatasource>()));
  gh.lazySingleton<_i36.AgentsDistributorsDataSource>(
      () => _i36.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i37.SupportTabDataSource>(
      () => _i37.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i38.InvoicesTabDataSource>(
      () => _i38.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i39.AddTicketUseCase>(
      () => _i39.AddTicketUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i40.EditTicketTypeUseCase>(
      () => _i40.EditTicketTypeUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i41.GetClientTicketsUseCase>(
      () => _i41.GetClientTicketsUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i42.GetTicketsUseCase>(
      () => _i42.GetTicketsUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i43.GetTicketByIdUseCase>(
      () => _i43.GetTicketByIdUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i44.TransferTicketUseCase>(
      () => _i44.TransferTicketUseCase(gh<_i27.TicketsRepo>()));
  gh.factory<_i45.TicketsCubit>(() => _i45.TicketsCubit(
        gh<_i42.GetTicketsUseCase>(),
        gh<_i43.GetTicketByIdUseCase>(),
        gh<_i41.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i46.LoginRemoteDataSource>(
      () => _i46.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i47.AdvancedConfigsRepository>(() =>
      _i48.AdvancedConfigsRepositoryImpl(gh<_i26.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i49.InvoicesSectionRepo>(
      () => _i50.InvoicesTabRepoImpl(gh<_i38.InvoicesTabDataSource>()));
  gh.lazySingleton<_i51.WaitingAgentsDataSource>(
      () => _i51.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i52.AgentsDistributorsProfileDataSource>(() =>
      _i52.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i53.EditTicketCubit>(() => _i53.EditTicketCubit(
        gh<_i40.EditTicketTypeUseCase>(),
        gh<_i44.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i54.LoginRepo>(() => _i55.LoginRepoImpl(
        gh<_i46.LoginRemoteDataSource>(),
        gh<_i31.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i56.DatesTableDataSource>(
      () => _i56.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i57.LocationServices>(
      () => _i57.LocationServices(gh<_i8.Location>()));
  gh.factory<_i58.PrivilegeRepository>(
      () => _i59.PrivilegeRepositoryImpl(gh<_i19.PrivilegeDatasource>()));
  gh.factory<_i60.AppRepository>(
      () => _i61.AppRepositoryImpl(gh<_i17.AppDatasource>()));
  gh.lazySingleton<_i62.AgentsDistributorsActionsRepo>(() =>
      _i63.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i64.SupportTabRepo>(
      () => _i65.SupportTabRepoImpl(gh<_i37.SupportTabDataSource>()));
  gh.factory<_i66.LinksImportantRepository>(
      () => _i67.LinkRepositoryImpl(gh<_i23.LinkDatasource>()));
  gh.lazySingleton<_i68.GetInvoicesByPrivilegesUsecase>(() =>
      _i68.GetInvoicesByPrivilegesUsecase(gh<_i49.InvoicesSectionRepo>()));
  gh.lazySingleton<_i69.CacheTokenUsecase>(
      () => _i69.CacheTokenUsecase(gh<_i54.LoginRepo>()));
  gh.lazySingleton<_i70.GetTokenUsecase>(
      () => _i70.GetTokenUsecase(gh<_i54.LoginRepo>()));
  gh.lazySingleton<_i71.LoginUsecase>(
      () => _i71.LoginUsecase(gh<_i54.LoginRepo>()));
  gh.lazySingleton<_i72.ValidateTokenUsecase>(
      () => _i72.ValidateTokenUsecase(gh<_i54.LoginRepo>()));
  gh.lazySingleton<_i73.VerifyOtpUsecase>(
      () => _i73.VerifyOtpUsecase(gh<_i54.LoginRepo>()));
  gh.factory<_i74.CompanyRepository>(
      () => _i75.CompanyRepositoryImpl(gh<_i22.CommentCompanyDatasource>()));
  gh.factory<_i76.ClientsListRepository>(
      () => _i77.ClientsListRepositoryImpl(gh<_i21.ClientsListDatasource>()));
  gh.lazySingleton<_i78.AgentsDistributorsProfileRepo>(() =>
      _i79.AgentsDistributorsProfileRepoImpl(
          gh<_i52.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i80.AddDateInstallUsecase>(
      () => _i80.AddDateInstallUsecase(gh<_i64.SupportTabRepo>()));
  gh.lazySingleton<_i81.CancelDateInstallUsecase>(
      () => _i81.CancelDateInstallUsecase(gh<_i64.SupportTabRepo>()));
  gh.lazySingleton<_i82.GetInvoiceByClientUsecase>(
      () => _i82.GetInvoiceByClientUsecase(gh<_i64.SupportTabRepo>()));
  gh.lazySingleton<_i83.ReceiveDeviceUsecase>(
      () => _i83.ReceiveDeviceUsecase(gh<_i64.SupportTabRepo>()));
  gh.lazySingleton<_i84.ReturnInvoiceApproveUsecase>(
      () => _i84.ReturnInvoiceApproveUsecase(gh<_i64.SupportTabRepo>()));
  gh.lazySingleton<_i85.SetDateDoneUsecase>(
      () => _i85.SetDateDoneUsecase(gh<_i64.SupportTabRepo>()));
  gh.lazySingleton<_i86.SetReadyInstallUsecase>(
      () => _i86.SetReadyInstallUsecase(gh<_i64.SupportTabRepo>()));
  gh.lazySingleton<_i87.GetAllUsersUseCase>(
      () => _i87.GetAllUsersUseCase(gh<_i49.InvoicesSectionRepo>()));
  gh.factory<_i88.CommunicationListRepository>(() =>
      _i89.CommunicationListRepositoryImpl(
          gh<_i18.CommunicationListDatasource>()));
  gh.factory<_i90.ActionLinkUsecase>(
      () => _i90.ActionLinkUsecase(gh<_i66.LinksImportantRepository>()));
  gh.factory<_i91.GetLinkUsecase>(
      () => _i91.GetLinkUsecase(gh<_i66.LinksImportantRepository>()));
  gh.lazySingleton<_i92.ManageWithdrawalsRepository>(() =>
      _i93.ManageWithdrawalsRepositoryImpl(
          gh<_i16.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i94.AgentsDistributorsRepo>(() =>
      _i95.AgentsDistributorsRepoImpl(gh<_i36.AgentsDistributorsDataSource>()));
  gh.factory<_i96.GetCommunicationListUsecase>(() =>
      _i96.GetCommunicationListUsecase(gh<_i88.CommunicationListRepository>()));
  gh.lazySingleton<_i97.CrudClientSupportFilesUsecase>(() =>
      _i97.CrudClientSupportFilesUsecase(
          repository: gh<_i76.ClientsListRepository>()));
  gh.lazySingleton<_i98.GetClientSupportFilesUsecase>(() =>
      _i98.GetClientSupportFilesUsecase(
          repository: gh<_i76.ClientsListRepository>()));
  gh.factory<_i99.LinkCubit>(() => _i99.LinkCubit(
        gh<_i91.GetLinkUsecase>(),
        gh<_i90.ActionLinkUsecase>(),
      ));
  gh.factory<_i100.ParticipateListRepository>(() =>
      _i101.ParticipateListRepositoryImpl(
          gh<_i24.ParticipatesListDatasource>()));
  gh.lazySingleton<_i102.WaitingAgentsRepo>(
      () => _i103.WaitingAgentsRepoImpl(gh<_i51.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i104.ChangeStateAgentUseCase>(
      () => _i104.ChangeStateAgentUseCase(gh<_i94.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i105.GetAgentsAndDistributorsUseCase>(() =>
      _i105.GetAgentsAndDistributorsUseCase(gh<_i94.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i106.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i106.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i92.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i107.GetWithdrawalsInvoicesUsecase>(() =>
      _i107.GetWithdrawalsInvoicesUsecase(
          gh<_i92.ManageWithdrawalsRepository>()));
  gh.factory<_i108.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i108.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i92.ManageWithdrawalsRepository>()));
  gh.factory<_i109.AddTaskUsecase>(
      () => _i109.AddTaskUsecase(gh<_i34.TaskRepository>()));
  gh.factory<_i110.ChangeStatusTaskUsecase>(
      () => _i110.ChangeStatusTaskUsecase(gh<_i34.TaskRepository>()));
  gh.factory<_i111.FilterTaskUsecase>(
      () => _i111.FilterTaskUsecase(gh<_i34.TaskRepository>()));
  gh.factory<_i112.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i112.GetUsersByDepartmentAndRegionUsecase(gh<_i34.TaskRepository>()));
  gh.lazySingleton<_i113.GetAdvancedConfigsUsecase>(() =>
      _i113.GetAdvancedConfigsUsecase(gh<_i47.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i114.EditAdvancedConfigsUsecase>(() =>
      _i114.EditAdvancedConfigsUsecase(gh<_i47.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i115.DatesTableRepo>(
      () => _i116.DatesTableRepoImpl(gh<_i56.DatesTableDataSource>()));
  gh.factory<_i117.AddClientUserUsecase>(
      () => _i117.AddClientUserUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i118.ApproveRejectClientUsecase>(
      () => _i118.ApproveRejectClientUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i119.ChangeTypeClientUsecase>(
      () => _i119.ChangeTypeClientUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i120.EditClientUserUsecase>(
      () => _i120.EditClientUserUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i121.GetClientsListByRegionUseCase>(() =>
      _i121.GetClientsListByRegionUseCase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i122.GetClientsListByUserUseCase>(() =>
      _i122.GetClientsListByUserUseCase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i123.GetClientsWithFilterUserUsecase>(() =>
      _i123.GetClientsWithFilterUserUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i124.GetClientMarketingReportUsecase>(() =>
      _i124.GetClientMarketingReportUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i125.GetRecommendedClientsUsecase>(() =>
      _i125.GetRecommendedClientsUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i126.GetSimilarClientsUsecase>(
      () => _i126.GetSimilarClientsUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i127.ReceiveClientUserUsecase>(
      () => _i127.ReceiveClientUserUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i128.TransferClientUserUsecase>(
      () => _i128.TransferClientUserUsecase(gh<_i76.ClientsListRepository>()));
  gh.factory<_i129.GetVersionUseCase>(
      () => _i129.GetVersionUseCase(gh<_i60.AppRepository>()));
  gh.factory<_i130.AddTicketCubit>(
      () => _i130.AddTicketCubit(gh<_i39.AddTicketUseCase>()));
  gh.lazySingleton<_i131.AddAgentUseCase>(
      () => _i131.AddAgentUseCase(gh<_i62.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i132.GetAllCitiesUseCase>(() =>
      _i132.GetAllCitiesUseCase(gh<_i62.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i133.UpdateAgentUseCase>(
      () => _i133.UpdateAgentUseCase(gh<_i62.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i134.CrudAgentSupportFilesUsecase>(() =>
      _i134.CrudAgentSupportFilesUsecase(
          gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i135.TaskCubit>(() => _i135.TaskCubit(
        gh<_i109.AddTaskUsecase>(),
        gh<_i111.FilterTaskUsecase>(),
        gh<_i110.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i136.SupportTabCubit>(() => _i136.SupportTabCubit(
        gh<_i82.GetInvoiceByClientUsecase>(),
        gh<_i80.AddDateInstallUsecase>(),
        gh<_i85.SetDateDoneUsecase>(),
        gh<_i86.SetReadyInstallUsecase>(),
        gh<_i84.ReturnInvoiceApproveUsecase>(),
        gh<_i83.ReceiveDeviceUsecase>(),
        gh<_i81.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i137.AddAgentDateUseCase>(() =>
      _i137.AddAgentDateUseCase(gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.factory<_i138.ClientsListBloc>(() => _i138.ClientsListBloc(
        gh<_i123.GetClientsWithFilterUserUsecase>(),
        gh<_i125.GetRecommendedClientsUsecase>(),
        gh<_i117.AddClientUserUsecase>(),
        gh<_i120.EditClientUserUsecase>(),
        gh<_i119.ChangeTypeClientUsecase>(),
        gh<_i126.GetSimilarClientsUsecase>(),
        gh<_i118.ApproveRejectClientUsecase>(),
        gh<_i97.CrudClientSupportFilesUsecase>(),
        gh<_i98.GetClientSupportFilesUsecase>(),
        gh<_i128.TransferClientUserUsecase>(),
        gh<_i127.ReceiveClientUserUsecase>(),
        gh<_i124.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i139.LoginCubit>(() => _i139.LoginCubit(
        gh<_i71.LoginUsecase>(),
        gh<_i73.VerifyOtpUsecase>(),
        gh<_i69.CacheTokenUsecase>(),
        gh<_i70.GetTokenUsecase>(),
        gh<_i72.ValidateTokenUsecase>(),
      ));
  gh.factory<_i140.AddLevelUsecase>(
      () => _i140.AddLevelUsecase(gh<_i58.PrivilegeRepository>()));
  gh.factory<_i141.GetLevelsUsecase>(
      () => _i141.GetLevelsUsecase(gh<_i58.PrivilegeRepository>()));
  gh.factory<_i142.GetPrivilegesUsecase>(
      () => _i142.GetPrivilegesUsecase(gh<_i58.PrivilegeRepository>()));
  gh.factory<_i143.UpdatePrivilegeUsecase>(
      () => _i143.UpdatePrivilegeUsecase(gh<_i58.PrivilegeRepository>()));
  gh.factory<_i144.AttachmentsRowCubit>(() => _i144.AttachmentsRowCubit(
        gh<_i98.GetClientSupportFilesUsecase>(),
        gh<_i97.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i145.AddCommentUsecase>(
      () => _i145.AddCommentUsecase(gh<_i74.CompanyRepository>()));
  gh.factory<_i146.GetCommentUsecase>(
      () => _i146.GetCommentUsecase(gh<_i74.CompanyRepository>()));
  gh.lazySingleton<_i147.PrivilegeCubit>(() => _i147.PrivilegeCubit(
        gh<_i141.GetLevelsUsecase>(),
        gh<_i142.GetPrivilegesUsecase>(),
        gh<_i143.UpdatePrivilegeUsecase>(),
        gh<_i140.AddLevelUsecase>(),
      ));
  gh.factory<_i148.AdvancedCofigsCubit>(() => _i148.AdvancedCofigsCubit(
        gh<_i113.GetAdvancedConfigsUsecase>(),
        gh<_i114.EditAdvancedConfigsUsecase>(),
      ));
  gh.lazySingleton<_i149.AddAgentCommentUsecase>(() =>
      _i149.AddAgentCommentUsecase(gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i150.DoneTrainingUsecase>(() =>
      _i150.DoneTrainingUsecase(gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i151.GetAgentUsecase>(
      () => _i151.GetAgentUsecase(gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i152.GetAgentClientListUsecase>(() =>
      _i152.GetAgentClientListUsecase(
          gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i153.GetAgentCommentsListUsecase>(() =>
      _i153.GetAgentCommentsListUsecase(
          gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i154.GetAgentDatesListUsecase>(() =>
      _i154.GetAgentDatesListUsecase(gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i155.GetAgentInvoiceListUsecase>(() =>
      _i155.GetAgentInvoiceListUsecase(
          gh<_i78.AgentsDistributorsProfileRepo>()));
  gh.singleton<_i156.CitiesCubit>(
      () => _i156.CitiesCubit(gh<_i132.GetAllCitiesUseCase>()));
  gh.factory<_i157.AddRejectReasonsUsecase>(() =>
      _i157.AddRejectReasonsUsecase(gh<_i92.ManageWithdrawalsRepository>()));
  gh.factory<_i158.EditRejectReasonsUsecase>(() =>
      _i158.EditRejectReasonsUsecase(gh<_i92.ManageWithdrawalsRepository>()));
  gh.factory<_i159.GetRejectReasonsUsecase>(() =>
      _i159.GetRejectReasonsUsecase(gh<_i92.ManageWithdrawalsRepository>()));
  gh.factory<_i160.GetUserSeriesUsecase>(
      () => _i160.GetUserSeriesUsecase(gh<_i92.ManageWithdrawalsRepository>()));
  gh.factory<_i161.GetWithdrawnDetailsUsecase>(() =>
      _i161.GetWithdrawnDetailsUsecase(gh<_i92.ManageWithdrawalsRepository>()));
  gh.factory<_i162.SetApproveSeriesUsecase>(() =>
      _i162.SetApproveSeriesUsecase(gh<_i92.ManageWithdrawalsRepository>()));
  gh.factory<_i163.UpdateSeriesUsecase>(
      () => _i163.UpdateSeriesUsecase(gh<_i92.ManageWithdrawalsRepository>()));
  gh.singleton<_i164.AppManagerCubit>(
      () => _i164.AppManagerCubit(gh<_i129.GetVersionUseCase>()));
  gh.lazySingleton<_i165.GetWaitingAgentsUsecase>(
      () => _i165.GetWaitingAgentsUsecase(gh<_i102.WaitingAgentsRepo>()));
  gh.lazySingleton<_i166.ManageWithdrawalsCubit>(
      () => _i166.ManageWithdrawalsCubit(
            gh<_i160.GetUserSeriesUsecase>(),
            gh<_i163.UpdateSeriesUsecase>(),
            gh<_i33.GetAllUsersUsecase>(),
            gh<_i107.GetWithdrawalsInvoicesUsecase>(),
            gh<_i108.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i162.SetApproveSeriesUsecase>(),
            gh<_i161.GetWithdrawnDetailsUsecase>(),
            gh<_i157.AddRejectReasonsUsecase>(),
            gh<_i159.GetRejectReasonsUsecase>(),
            gh<_i158.EditRejectReasonsUsecase>(),
            gh<_i106.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i167.CommunicationListBloc>(() =>
      _i167.CommunicationListBloc(gh<_i96.GetCommunicationListUsecase>()));
  gh.factory<_i168.AddParticipateCommentUsecase>(() =>
      _i168.AddParticipateCommentUsecase(
          gh<_i100.ParticipateListRepository>()));
  gh.factory<_i169.AddParticipateUserUsecase>(() =>
      _i169.AddParticipateUserUsecase(gh<_i100.ParticipateListRepository>()));
  gh.factory<_i170.EditParticipateUserUsecase>(() =>
      _i170.EditParticipateUserUsecase(gh<_i100.ParticipateListRepository>()));
  gh.factory<_i171.GetInvoiceByIdUsecase>(
      () => _i171.GetInvoiceByIdUsecase(gh<_i100.ParticipateListRepository>()));
  gh.factory<_i172.ParticipateClientListUsecase>(() =>
      _i172.ParticipateClientListUsecase(
          gh<_i100.ParticipateListRepository>()));
  gh.factory<_i173.ParticipateCommentListUsecase>(() =>
      _i173.ParticipateCommentListUsecase(
          gh<_i100.ParticipateListRepository>()));
  gh.factory<_i174.ParticipateInvoiceListUsecase>(() =>
      _i174.ParticipateInvoiceListUsecase(
          gh<_i100.ParticipateListRepository>()));
  gh.factory<_i175.ParticipateListUsecase>(() =>
      _i175.ParticipateListUsecase(gh<_i100.ParticipateListRepository>()));
  gh.factory<_i176.AgentsDistributorsCubit>(() => _i176.AgentsDistributorsCubit(
        gh<_i105.GetAgentsAndDistributorsUseCase>(),
        gh<_i104.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i177.UsersCubit>(() => _i177.UsersCubit(
        gh<_i33.GetAllUsersUsecase>(),
        gh<_i32.ActionUserUsecase>(),
        gh<_i112.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i178.CancelScheduleUsecase>(
      () => _i178.CancelScheduleUsecase(gh<_i115.DatesTableRepo>()));
  gh.lazySingleton<_i179.ChangeDateToDonUsecase>(
      () => _i179.ChangeDateToDonUsecase(gh<_i115.DatesTableRepo>()));
  gh.lazySingleton<_i180.GetDateInstallationUsecase>(
      () => _i180.GetDateInstallationUsecase(gh<_i115.DatesTableRepo>()));
  gh.lazySingleton<_i181.GetInvoicesByClientForDateUsecase>(() =>
      _i181.GetInvoicesByClientForDateUsecase(gh<_i115.DatesTableRepo>()));
  gh.lazySingleton<_i182.GetSubscribedClientsUsecase>(
      () => _i182.GetSubscribedClientsUsecase(gh<_i115.DatesTableRepo>()));
  gh.lazySingleton<_i183.RescheduleDateUsecase>(
      () => _i183.RescheduleDateUsecase(gh<_i115.DatesTableRepo>()));
  gh.lazySingleton<_i184.ReturnScheduleVisitToOpenUsecase>(
      () => _i184.ReturnScheduleVisitToOpenUsecase(gh<_i115.DatesTableRepo>()));
  gh.factory<_i185.AgentsDistributorsProfileBloc>(
      () => _i185.AgentsDistributorsProfileBloc(
            gh<_i152.GetAgentClientListUsecase>(),
            gh<_i155.GetAgentInvoiceListUsecase>(),
            gh<_i171.GetInvoiceByIdUsecase>(),
            gh<_i153.GetAgentCommentsListUsecase>(),
            gh<_i149.AddAgentCommentUsecase>(),
            gh<_i150.DoneTrainingUsecase>(),
            gh<_i137.AddAgentDateUseCase>(),
            gh<_i154.GetAgentDatesListUsecase>(),
            gh<_i134.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i186.DatesTableCubit>(() => _i186.DatesTableCubit(
        gh<_i180.GetDateInstallationUsecase>(),
        gh<_i183.RescheduleDateUsecase>(),
        gh<_i179.ChangeDateToDonUsecase>(),
        gh<_i178.CancelScheduleUsecase>(),
        gh<_i184.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i182.GetSubscribedClientsUsecase>(),
        gh<_i181.GetInvoicesByClientForDateUsecase>(),
        gh<_i80.AddDateInstallUsecase>(),
      ));
  gh.factory<_i187.AgentsDistributorsActionsCubit>(
      () => _i187.AgentsDistributorsActionsCubit(
            gh<_i132.GetAllCitiesUseCase>(),
            gh<_i131.AddAgentUseCase>(),
            gh<_i133.UpdateAgentUseCase>(),
          ));
  gh.factory<_i188.CompanyCubit>(() => _i188.CompanyCubit(
        gh<_i146.GetCommentUsecase>(),
        gh<_i145.AddCommentUsecase>(),
      ));
  gh.factory<_i189.InvoicesSectionCubit>(() => _i189.InvoicesSectionCubit(
        gh<_i68.GetInvoicesByPrivilegesUsecase>(),
        gh<_i105.GetAgentsAndDistributorsUseCase>(),
        gh<_i175.ParticipateListUsecase>(),
        gh<_i87.GetAllUsersUseCase>(),
      ));
  gh.factory<_i190.ParticipateListBloc>(() => _i190.ParticipateListBloc(
        gh<_i175.ParticipateListUsecase>(),
        gh<_i169.AddParticipateUserUsecase>(),
        gh<_i170.EditParticipateUserUsecase>(),
        gh<_i172.ParticipateClientListUsecase>(),
        gh<_i174.ParticipateInvoiceListUsecase>(),
        gh<_i171.GetInvoiceByIdUsecase>(),
        gh<_i173.ParticipateCommentListUsecase>(),
        gh<_i168.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i191.WaitingAgentsCubit>(
      () => _i191.WaitingAgentsCubit(gh<_i165.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i192.AppModule {}
