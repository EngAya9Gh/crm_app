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
    as _i62;
import '../../../features/app/domain/repositories/app_repository.dart' as _i61;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i132;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i170;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i32;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i47;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i56;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i55;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i70;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i71;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i72;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i73;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i74;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i144;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i15;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i28;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i27;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i40;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i41;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i42;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i44;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i43;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i45;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i133;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i54;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i46;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i18;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i92;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i91;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i99;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i173;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i38;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i66;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i65;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i83;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i84;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i85;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i86;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i87;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i88;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i89;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i141;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i26;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i49;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i48;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i117;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i116;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i153;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i31;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i76;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i75;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i134;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i135;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i154;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i60;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i59;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i145;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i146;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i147;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i148;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i152;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i20;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i30;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i29;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i33;
import '../../../features/mangement/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i34;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i183;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i96;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i95;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i163;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i164;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i109;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i165;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i166;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i111;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i110;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i167;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i168;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i169;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i172;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i21;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i80;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i79;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i120;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i121;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i122;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i100;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i123;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i127;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i101;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i124;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i125;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i126;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i128;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i129;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i130;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i131;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i143;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i22;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i78;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i77;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i150;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i151;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i194;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i39;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i51;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i50;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i90;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i69;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i195;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i37;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i53;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i64;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i82;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i98;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i63;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i81;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i97;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i142;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i136;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i107;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i139;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i156;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i157;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i158;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i159;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i160;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i161;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i108;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i138;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i193;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i191;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i182;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i23;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i68;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i67;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i93;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i94;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i102;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i24;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i104;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i103;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i174;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i176;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i177;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i178;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i180;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i181;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i196;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i57;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i119;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i118;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i184;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i185;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i186;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i187;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i188;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i189;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i190;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i192;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i52;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i106;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i105;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i171;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i197;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i25;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i36;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i35;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i112;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i113;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i114;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i115;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i140;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i149;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i162;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i58;
import 'di_container.dart' as _i198;

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
  gh.lazySingleton<_i31.GeneralConfigsDatasource>(
      () => _i31.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i32.LoginLocalDataSource>(() =>
      _i32.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i33.ActionUserUsecase>(
      () => _i33.ActionUserUsecase(gh<_i29.UsersRepository>()));
  gh.factory<_i34.GetAllUsersUsecase>(
      () => _i34.GetAllUsersUsecase(gh<_i29.UsersRepository>()));
  gh.factory<_i35.TaskRepository>(
      () => _i36.TaskRepositoryImpl(gh<_i25.TaskDatasource>()));
  gh.lazySingleton<_i37.AgentsDistributorsDataSource>(
      () => _i37.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i38.SupportTabDataSource>(
      () => _i38.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i39.InvoicesTabDataSource>(
      () => _i39.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i40.AddTicketUseCase>(
      () => _i40.AddTicketUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i41.EditTicketTypeUseCase>(
      () => _i41.EditTicketTypeUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i42.GetClientTicketsUseCase>(
      () => _i42.GetClientTicketsUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i43.GetTicketsUseCase>(
      () => _i43.GetTicketsUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i44.GetTicketByIdUseCase>(
      () => _i44.GetTicketByIdUseCase(gh<_i27.TicketsRepo>()));
  gh.lazySingleton<_i45.TransferTicketUseCase>(
      () => _i45.TransferTicketUseCase(gh<_i27.TicketsRepo>()));
  gh.factory<_i46.TicketsCubit>(() => _i46.TicketsCubit(
        gh<_i43.GetTicketsUseCase>(),
        gh<_i44.GetTicketByIdUseCase>(),
        gh<_i42.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i47.LoginRemoteDataSource>(
      () => _i47.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i48.AdvancedConfigsRepository>(() =>
      _i49.AdvancedConfigsRepositoryImpl(gh<_i26.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i50.InvoicesSectionRepo>(
      () => _i51.InvoicesTabRepoImpl(gh<_i39.InvoicesTabDataSource>()));
  gh.lazySingleton<_i52.WaitingAgentsDataSource>(
      () => _i52.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i53.AgentsDistributorsProfileDataSource>(() =>
      _i53.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i54.EditTicketCubit>(() => _i54.EditTicketCubit(
        gh<_i41.EditTicketTypeUseCase>(),
        gh<_i45.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i55.LoginRepo>(() => _i56.LoginRepoImpl(
        gh<_i47.LoginRemoteDataSource>(),
        gh<_i32.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i57.DatesTableDataSource>(
      () => _i57.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i58.LocationServices>(
      () => _i58.LocationServices(gh<_i8.Location>()));
  gh.factory<_i59.PrivilegeRepository>(
      () => _i60.PrivilegeRepositoryImpl(gh<_i19.PrivilegeDatasource>()));
  gh.factory<_i61.AppRepository>(
      () => _i62.AppRepositoryImpl(gh<_i17.AppDatasource>()));
  gh.lazySingleton<_i63.AgentsDistributorsActionsRepo>(() =>
      _i64.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i65.SupportTabRepo>(
      () => _i66.SupportTabRepoImpl(gh<_i38.SupportTabDataSource>()));
  gh.factory<_i67.LinksImportantRepository>(
      () => _i68.LinkRepositoryImpl(gh<_i23.LinkDatasource>()));
  gh.lazySingleton<_i69.GetInvoicesByPrivilegesUsecase>(() =>
      _i69.GetInvoicesByPrivilegesUsecase(gh<_i50.InvoicesSectionRepo>()));
  gh.lazySingleton<_i70.CacheTokenUsecase>(
      () => _i70.CacheTokenUsecase(gh<_i55.LoginRepo>()));
  gh.lazySingleton<_i71.GetTokenUsecase>(
      () => _i71.GetTokenUsecase(gh<_i55.LoginRepo>()));
  gh.lazySingleton<_i72.LoginUsecase>(
      () => _i72.LoginUsecase(gh<_i55.LoginRepo>()));
  gh.lazySingleton<_i73.ValidateTokenUsecase>(
      () => _i73.ValidateTokenUsecase(gh<_i55.LoginRepo>()));
  gh.lazySingleton<_i74.VerifyOtpUsecase>(
      () => _i74.VerifyOtpUsecase(gh<_i55.LoginRepo>()));
  gh.lazySingleton<_i75.GeneralConfigsRepository>(() =>
      _i76.GeneralConfigsRepositoryImpl(gh<_i31.GeneralConfigsDatasource>()));
  gh.factory<_i77.CompanyRepository>(
      () => _i78.CompanyRepositoryImpl(gh<_i22.CommentCompanyDatasource>()));
  gh.factory<_i79.ClientsListRepository>(
      () => _i80.ClientsListRepositoryImpl(gh<_i21.ClientsListDatasource>()));
  gh.lazySingleton<_i81.AgentsDistributorsProfileRepo>(() =>
      _i82.AgentsDistributorsProfileRepoImpl(
          gh<_i53.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i83.AddDateInstallUsecase>(
      () => _i83.AddDateInstallUsecase(gh<_i65.SupportTabRepo>()));
  gh.lazySingleton<_i84.CancelDateInstallUsecase>(
      () => _i84.CancelDateInstallUsecase(gh<_i65.SupportTabRepo>()));
  gh.lazySingleton<_i85.GetInvoiceByClientUsecase>(
      () => _i85.GetInvoiceByClientUsecase(gh<_i65.SupportTabRepo>()));
  gh.lazySingleton<_i86.ReceiveDeviceUsecase>(
      () => _i86.ReceiveDeviceUsecase(gh<_i65.SupportTabRepo>()));
  gh.lazySingleton<_i87.ReturnInvoiceApproveUsecase>(
      () => _i87.ReturnInvoiceApproveUsecase(gh<_i65.SupportTabRepo>()));
  gh.lazySingleton<_i88.SetDateDoneUsecase>(
      () => _i88.SetDateDoneUsecase(gh<_i65.SupportTabRepo>()));
  gh.lazySingleton<_i89.SetReadyInstallUsecase>(
      () => _i89.SetReadyInstallUsecase(gh<_i65.SupportTabRepo>()));
  gh.lazySingleton<_i90.GetAllUsersUseCase>(
      () => _i90.GetAllUsersUseCase(gh<_i50.InvoicesSectionRepo>()));
  gh.factory<_i91.CommunicationListRepository>(() =>
      _i92.CommunicationListRepositoryImpl(
          gh<_i18.CommunicationListDatasource>()));
  gh.factory<_i93.ActionLinkUsecase>(
      () => _i93.ActionLinkUsecase(gh<_i67.LinksImportantRepository>()));
  gh.factory<_i94.GetLinkUsecase>(
      () => _i94.GetLinkUsecase(gh<_i67.LinksImportantRepository>()));
  gh.lazySingleton<_i95.ManageWithdrawalsRepository>(() =>
      _i96.ManageWithdrawalsRepositoryImpl(
          gh<_i16.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i97.AgentsDistributorsRepo>(() =>
      _i98.AgentsDistributorsRepoImpl(gh<_i37.AgentsDistributorsDataSource>()));
  gh.factory<_i99.GetCommunicationListUsecase>(() =>
      _i99.GetCommunicationListUsecase(gh<_i91.CommunicationListRepository>()));
  gh.lazySingleton<_i100.CrudClientSupportFilesUsecase>(() =>
      _i100.CrudClientSupportFilesUsecase(
          repository: gh<_i79.ClientsListRepository>()));
  gh.lazySingleton<_i101.GetClientSupportFilesUsecase>(() =>
      _i101.GetClientSupportFilesUsecase(
          repository: gh<_i79.ClientsListRepository>()));
  gh.factory<_i102.LinkCubit>(() => _i102.LinkCubit(
        gh<_i94.GetLinkUsecase>(),
        gh<_i93.ActionLinkUsecase>(),
      ));
  gh.factory<_i103.ParticipateListRepository>(() =>
      _i104.ParticipateListRepositoryImpl(
          gh<_i24.ParticipatesListDatasource>()));
  gh.lazySingleton<_i105.WaitingAgentsRepo>(
      () => _i106.WaitingAgentsRepoImpl(gh<_i52.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i107.ChangeStateAgentUseCase>(
      () => _i107.ChangeStateAgentUseCase(gh<_i97.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i108.GetAgentsAndDistributorsUseCase>(() =>
      _i108.GetAgentsAndDistributorsUseCase(gh<_i97.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i109.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i109.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i95.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i110.GetWithdrawalsInvoicesUsecase>(() =>
      _i110.GetWithdrawalsInvoicesUsecase(
          gh<_i95.ManageWithdrawalsRepository>()));
  gh.factory<_i111.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i111.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i95.ManageWithdrawalsRepository>()));
  gh.factory<_i112.AddTaskUsecase>(
      () => _i112.AddTaskUsecase(gh<_i35.TaskRepository>()));
  gh.factory<_i113.ChangeStatusTaskUsecase>(
      () => _i113.ChangeStatusTaskUsecase(gh<_i35.TaskRepository>()));
  gh.factory<_i114.FilterTaskUsecase>(
      () => _i114.FilterTaskUsecase(gh<_i35.TaskRepository>()));
  gh.factory<_i115.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i115.GetUsersByDepartmentAndRegionUsecase(gh<_i35.TaskRepository>()));
  gh.lazySingleton<_i116.GetAdvancedConfigsUsecase>(() =>
      _i116.GetAdvancedConfigsUsecase(gh<_i48.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i117.EditAdvancedConfigsUsecase>(() =>
      _i117.EditAdvancedConfigsUsecase(gh<_i48.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i118.DatesTableRepo>(
      () => _i119.DatesTableRepoImpl(gh<_i57.DatesTableDataSource>()));
  gh.factory<_i120.AddClientUserUsecase>(
      () => _i120.AddClientUserUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i121.ApproveRejectClientUsecase>(
      () => _i121.ApproveRejectClientUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i122.ChangeTypeClientUsecase>(
      () => _i122.ChangeTypeClientUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i123.EditClientUserUsecase>(
      () => _i123.EditClientUserUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i124.GetClientsListByRegionUseCase>(() =>
      _i124.GetClientsListByRegionUseCase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i125.GetClientsListByUserUseCase>(() =>
      _i125.GetClientsListByUserUseCase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i126.GetClientsWithFilterUserUsecase>(() =>
      _i126.GetClientsWithFilterUserUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i127.GetClientMarketingReportUsecase>(() =>
      _i127.GetClientMarketingReportUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i128.GetRecommendedClientsUsecase>(() =>
      _i128.GetRecommendedClientsUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i129.GetSimilarClientsUsecase>(
      () => _i129.GetSimilarClientsUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i130.ReceiveClientUserUsecase>(
      () => _i130.ReceiveClientUserUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i131.TransferClientUserUsecase>(
      () => _i131.TransferClientUserUsecase(gh<_i79.ClientsListRepository>()));
  gh.factory<_i132.GetVersionUseCase>(
      () => _i132.GetVersionUseCase(gh<_i61.AppRepository>()));
  gh.factory<_i133.AddTicketCubit>(
      () => _i133.AddTicketCubit(gh<_i40.AddTicketUseCase>()));
  gh.lazySingleton<_i134.EditGeneralConfigsUsecase>(() =>
      _i134.EditGeneralConfigsUsecase(gh<_i75.GeneralConfigsRepository>()));
  gh.lazySingleton<_i135.GetGeneralConfigsUsecase>(() =>
      _i135.GetGeneralConfigsUsecase(gh<_i75.GeneralConfigsRepository>()));
  gh.lazySingleton<_i136.AddAgentUseCase>(
      () => _i136.AddAgentUseCase(gh<_i63.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i137.GetAllCitiesUseCase>(() =>
      _i137.GetAllCitiesUseCase(gh<_i63.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i138.UpdateAgentUseCase>(
      () => _i138.UpdateAgentUseCase(gh<_i63.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i139.CrudAgentSupportFilesUsecase>(() =>
      _i139.CrudAgentSupportFilesUsecase(
          gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i140.TaskCubit>(() => _i140.TaskCubit(
        gh<_i112.AddTaskUsecase>(),
        gh<_i114.FilterTaskUsecase>(),
        gh<_i113.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i141.SupportTabCubit>(() => _i141.SupportTabCubit(
        gh<_i85.GetInvoiceByClientUsecase>(),
        gh<_i83.AddDateInstallUsecase>(),
        gh<_i88.SetDateDoneUsecase>(),
        gh<_i89.SetReadyInstallUsecase>(),
        gh<_i87.ReturnInvoiceApproveUsecase>(),
        gh<_i86.ReceiveDeviceUsecase>(),
        gh<_i84.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i142.AddAgentDateUseCase>(() =>
      _i142.AddAgentDateUseCase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.factory<_i143.ClientsListBloc>(() => _i143.ClientsListBloc(
        gh<_i126.GetClientsWithFilterUserUsecase>(),
        gh<_i128.GetRecommendedClientsUsecase>(),
        gh<_i120.AddClientUserUsecase>(),
        gh<_i123.EditClientUserUsecase>(),
        gh<_i122.ChangeTypeClientUsecase>(),
        gh<_i129.GetSimilarClientsUsecase>(),
        gh<_i121.ApproveRejectClientUsecase>(),
        gh<_i100.CrudClientSupportFilesUsecase>(),
        gh<_i101.GetClientSupportFilesUsecase>(),
        gh<_i131.TransferClientUserUsecase>(),
        gh<_i130.ReceiveClientUserUsecase>(),
        gh<_i127.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i144.LoginCubit>(() => _i144.LoginCubit(
        gh<_i72.LoginUsecase>(),
        gh<_i74.VerifyOtpUsecase>(),
        gh<_i70.CacheTokenUsecase>(),
        gh<_i71.GetTokenUsecase>(),
        gh<_i73.ValidateTokenUsecase>(),
      ));
  gh.factory<_i145.AddLevelUsecase>(
      () => _i145.AddLevelUsecase(gh<_i59.PrivilegeRepository>()));
  gh.factory<_i146.GetLevelsUsecase>(
      () => _i146.GetLevelsUsecase(gh<_i59.PrivilegeRepository>()));
  gh.factory<_i147.GetPrivilegesUsecase>(
      () => _i147.GetPrivilegesUsecase(gh<_i59.PrivilegeRepository>()));
  gh.factory<_i148.UpdatePrivilegeUsecase>(
      () => _i148.UpdatePrivilegeUsecase(gh<_i59.PrivilegeRepository>()));
  gh.factory<_i149.AttachmentsRowCubit>(() => _i149.AttachmentsRowCubit(
        gh<_i101.GetClientSupportFilesUsecase>(),
        gh<_i100.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i150.AddCommentUsecase>(
      () => _i150.AddCommentUsecase(gh<_i77.CompanyRepository>()));
  gh.factory<_i151.GetCommentUsecase>(
      () => _i151.GetCommentUsecase(gh<_i77.CompanyRepository>()));
  gh.lazySingleton<_i152.PrivilegeCubit>(() => _i152.PrivilegeCubit(
        gh<_i146.GetLevelsUsecase>(),
        gh<_i147.GetPrivilegesUsecase>(),
        gh<_i148.UpdatePrivilegeUsecase>(),
        gh<_i145.AddLevelUsecase>(),
      ));
  gh.factory<_i153.AdvancedCofigsCubit>(() => _i153.AdvancedCofigsCubit(
        gh<_i116.GetAdvancedConfigsUsecase>(),
        gh<_i117.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i154.GeneralCofigsCubit>(() => _i154.GeneralCofigsCubit(
        gh<_i135.GetGeneralConfigsUsecase>(),
        gh<_i134.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i155.AddAgentCommentUsecase>(() =>
      _i155.AddAgentCommentUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i156.DoneTrainingUsecase>(() =>
      _i156.DoneTrainingUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i157.GetAgentUsecase>(
      () => _i157.GetAgentUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i158.GetAgentClientListUsecase>(() =>
      _i158.GetAgentClientListUsecase(
          gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i159.GetAgentCommentsListUsecase>(() =>
      _i159.GetAgentCommentsListUsecase(
          gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i160.GetAgentDatesListUsecase>(() =>
      _i160.GetAgentDatesListUsecase(gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i161.GetAgentInvoiceListUsecase>(() =>
      _i161.GetAgentInvoiceListUsecase(
          gh<_i81.AgentsDistributorsProfileRepo>()));
  gh.singleton<_i162.CitiesCubit>(
      () => _i162.CitiesCubit(gh<_i137.GetAllCitiesUseCase>()));
  gh.factory<_i163.AddRejectReasonsUsecase>(() =>
      _i163.AddRejectReasonsUsecase(gh<_i95.ManageWithdrawalsRepository>()));
  gh.factory<_i164.EditRejectReasonsUsecase>(() =>
      _i164.EditRejectReasonsUsecase(gh<_i95.ManageWithdrawalsRepository>()));
  gh.factory<_i165.GetRejectReasonsUsecase>(() =>
      _i165.GetRejectReasonsUsecase(gh<_i95.ManageWithdrawalsRepository>()));
  gh.factory<_i166.GetUserSeriesUsecase>(
      () => _i166.GetUserSeriesUsecase(gh<_i95.ManageWithdrawalsRepository>()));
  gh.factory<_i167.GetWithdrawnDetailsUsecase>(() =>
      _i167.GetWithdrawnDetailsUsecase(gh<_i95.ManageWithdrawalsRepository>()));
  gh.factory<_i168.SetApproveSeriesUsecase>(() =>
      _i168.SetApproveSeriesUsecase(gh<_i95.ManageWithdrawalsRepository>()));
  gh.factory<_i169.UpdateSeriesUsecase>(
      () => _i169.UpdateSeriesUsecase(gh<_i95.ManageWithdrawalsRepository>()));
  gh.singleton<_i170.AppManagerCubit>(
      () => _i170.AppManagerCubit(gh<_i132.GetVersionUseCase>()));
  gh.lazySingleton<_i171.GetWaitingAgentsUsecase>(
      () => _i171.GetWaitingAgentsUsecase(gh<_i105.WaitingAgentsRepo>()));
  gh.lazySingleton<_i172.ManageWithdrawalsCubit>(
      () => _i172.ManageWithdrawalsCubit(
            gh<_i166.GetUserSeriesUsecase>(),
            gh<_i169.UpdateSeriesUsecase>(),
            gh<_i34.GetAllUsersUsecase>(),
            gh<_i110.GetWithdrawalsInvoicesUsecase>(),
            gh<_i111.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i168.SetApproveSeriesUsecase>(),
            gh<_i167.GetWithdrawnDetailsUsecase>(),
            gh<_i163.AddRejectReasonsUsecase>(),
            gh<_i165.GetRejectReasonsUsecase>(),
            gh<_i164.EditRejectReasonsUsecase>(),
            gh<_i109.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i173.CommunicationListBloc>(() =>
      _i173.CommunicationListBloc(gh<_i99.GetCommunicationListUsecase>()));
  gh.factory<_i174.AddParticipateCommentUsecase>(() =>
      _i174.AddParticipateCommentUsecase(
          gh<_i103.ParticipateListRepository>()));
  gh.factory<_i175.AddParticipateUserUsecase>(() =>
      _i175.AddParticipateUserUsecase(gh<_i103.ParticipateListRepository>()));
  gh.factory<_i176.EditParticipateUserUsecase>(() =>
      _i176.EditParticipateUserUsecase(gh<_i103.ParticipateListRepository>()));
  gh.factory<_i177.GetInvoiceByIdUsecase>(
      () => _i177.GetInvoiceByIdUsecase(gh<_i103.ParticipateListRepository>()));
  gh.factory<_i178.ParticipateClientListUsecase>(() =>
      _i178.ParticipateClientListUsecase(
          gh<_i103.ParticipateListRepository>()));
  gh.factory<_i179.ParticipateCommentListUsecase>(() =>
      _i179.ParticipateCommentListUsecase(
          gh<_i103.ParticipateListRepository>()));
  gh.factory<_i180.ParticipateInvoiceListUsecase>(() =>
      _i180.ParticipateInvoiceListUsecase(
          gh<_i103.ParticipateListRepository>()));
  gh.factory<_i181.ParticipateListUsecase>(() =>
      _i181.ParticipateListUsecase(gh<_i103.ParticipateListRepository>()));
  gh.factory<_i182.AgentsDistributorsCubit>(() => _i182.AgentsDistributorsCubit(
        gh<_i108.GetAgentsAndDistributorsUseCase>(),
        gh<_i107.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i183.UsersCubit>(() => _i183.UsersCubit(
        gh<_i34.GetAllUsersUsecase>(),
        gh<_i33.ActionUserUsecase>(),
        gh<_i115.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i184.CancelScheduleUsecase>(
      () => _i184.CancelScheduleUsecase(gh<_i118.DatesTableRepo>()));
  gh.lazySingleton<_i185.ChangeDateToDonUsecase>(
      () => _i185.ChangeDateToDonUsecase(gh<_i118.DatesTableRepo>()));
  gh.lazySingleton<_i186.GetDateInstallationUsecase>(
      () => _i186.GetDateInstallationUsecase(gh<_i118.DatesTableRepo>()));
  gh.lazySingleton<_i187.GetInvoicesByClientForDateUsecase>(() =>
      _i187.GetInvoicesByClientForDateUsecase(gh<_i118.DatesTableRepo>()));
  gh.lazySingleton<_i188.GetSubscribedClientsUsecase>(
      () => _i188.GetSubscribedClientsUsecase(gh<_i118.DatesTableRepo>()));
  gh.lazySingleton<_i189.RescheduleDateUsecase>(
      () => _i189.RescheduleDateUsecase(gh<_i118.DatesTableRepo>()));
  gh.lazySingleton<_i190.ReturnScheduleVisitToOpenUsecase>(
      () => _i190.ReturnScheduleVisitToOpenUsecase(gh<_i118.DatesTableRepo>()));
  gh.factory<_i191.AgentsDistributorsProfileBloc>(
      () => _i191.AgentsDistributorsProfileBloc(
            gh<_i158.GetAgentClientListUsecase>(),
            gh<_i161.GetAgentInvoiceListUsecase>(),
            gh<_i177.GetInvoiceByIdUsecase>(),
            gh<_i159.GetAgentCommentsListUsecase>(),
            gh<_i155.AddAgentCommentUsecase>(),
            gh<_i156.DoneTrainingUsecase>(),
            gh<_i142.AddAgentDateUseCase>(),
            gh<_i160.GetAgentDatesListUsecase>(),
            gh<_i139.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i192.DatesTableCubit>(() => _i192.DatesTableCubit(
        gh<_i186.GetDateInstallationUsecase>(),
        gh<_i189.RescheduleDateUsecase>(),
        gh<_i185.ChangeDateToDonUsecase>(),
        gh<_i184.CancelScheduleUsecase>(),
        gh<_i190.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i188.GetSubscribedClientsUsecase>(),
        gh<_i187.GetInvoicesByClientForDateUsecase>(),
        gh<_i83.AddDateInstallUsecase>(),
      ));
  gh.factory<_i193.AgentsDistributorsActionsCubit>(
      () => _i193.AgentsDistributorsActionsCubit(
            gh<_i137.GetAllCitiesUseCase>(),
            gh<_i136.AddAgentUseCase>(),
            gh<_i138.UpdateAgentUseCase>(),
          ));
  gh.factory<_i194.CompanyCubit>(() => _i194.CompanyCubit(
        gh<_i151.GetCommentUsecase>(),
        gh<_i150.AddCommentUsecase>(),
      ));
  gh.factory<_i195.InvoicesSectionCubit>(() => _i195.InvoicesSectionCubit(
        gh<_i69.GetInvoicesByPrivilegesUsecase>(),
        gh<_i108.GetAgentsAndDistributorsUseCase>(),
        gh<_i181.ParticipateListUsecase>(),
        gh<_i90.GetAllUsersUseCase>(),
      ));
  gh.factory<_i196.ParticipateListBloc>(() => _i196.ParticipateListBloc(
        gh<_i181.ParticipateListUsecase>(),
        gh<_i175.AddParticipateUserUsecase>(),
        gh<_i176.EditParticipateUserUsecase>(),
        gh<_i178.ParticipateClientListUsecase>(),
        gh<_i180.ParticipateInvoiceListUsecase>(),
        gh<_i177.GetInvoiceByIdUsecase>(),
        gh<_i179.ParticipateCommentListUsecase>(),
        gh<_i174.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i197.WaitingAgentsCubit>(
      () => _i197.WaitingAgentsCubit(gh<_i171.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i198.AppModule {}
