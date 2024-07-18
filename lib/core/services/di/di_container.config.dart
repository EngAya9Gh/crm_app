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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i20;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i66;
import '../../../features/app/domain/repositories/app_repository.dart' as _i65;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i140;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i179;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i35;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i50;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i59;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i58;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i74;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i75;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i76;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i77;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i78;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i152;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i15;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i17;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i16;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i79;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i116;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i18;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i31;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i30;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i43;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i44;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i45;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i47;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i46;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i48;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i141;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i57;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i49;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i21;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i97;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i96;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i106;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i183;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i41;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i70;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i69;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i88;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i89;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i90;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i91;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i92;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i93;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i94;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i149;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i61;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i105;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i104;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i160;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i180;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i29;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i52;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i51;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i125;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i124;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i162;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i34;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i81;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i80;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i142;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i143;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i163;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i22;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i64;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i63;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i153;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i154;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i155;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i156;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i161;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i23;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i33;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i32;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i36;
import '../../../features/mangement/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i37;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i193;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i101;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i100;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i172;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i173;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i117;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i174;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i175;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i119;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i118;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i176;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i177;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i178;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i182;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i24;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i85;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i84;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i128;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i129;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i130;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i107;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i131;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i135;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i108;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i132;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i133;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i134;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i136;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i137;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i138;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i139;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i151;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i25;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i83;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i82;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i158;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i159;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i204;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i42;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i54;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i53;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i95;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i73;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i205;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i40;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i56;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i68;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i87;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i103;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i67;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i86;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i102;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i164;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i144;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i114;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i147;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i165;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i166;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i167;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i168;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i169;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i170;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i115;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i145;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i146;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i203;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i201;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i192;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i26;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i72;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i71;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i98;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i99;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i109;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i27;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i111;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i110;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i184;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i185;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i186;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i187;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i188;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i190;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i191;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i206;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i60;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i127;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i126;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i194;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i195;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i196;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i197;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i198;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i199;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i200;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i202;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i55;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i113;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i112;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i181;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i207;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i28;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i39;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i38;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i120;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i121;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i122;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i123;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i148;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i157;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i171;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i62;
import 'di_container.dart' as _i208;

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
  gh.lazySingleton<_i15.ClientsAcceptDatasource>(
      () => _i15.ClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i16.ClientsAcceptRepository>(() =>
      _i17.ClientsAcceptRepositoryImpl(gh<_i15.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i18.TicketsDataSource>(
      () => _i18.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i19.ManageWithdrawalsDatasource>(
      () => _i19.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i20.AppDatasource>(
      () => _i20.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i21.CommunicationListDatasource>(
      () => _i21.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i22.PrivilegeDatasource>(
      () => _i22.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i23.UsersDatasource>(
      () => _i23.UsersDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i24.ClientsListDatasource>(
      () => _i24.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i25.CommentCompanyDatasource>(
      () => _i25.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i26.LinkDatasource>(
      () => _i26.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i27.ParticipatesListDatasource>(
      () => _i27.ParticipatesListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.TaskDatasource>(
      () => _i28.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i29.AdvancedConfigsDatasource>(
      () => _i29.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.TicketsRepo>(
      () => _i31.TicketsRepoImpl(gh<_i18.TicketsDataSource>()));
  gh.factory<_i32.UsersRepository>(
      () => _i33.UsersRepositoryImpl(gh<_i23.UsersDatasource>()));
  gh.lazySingleton<_i34.GeneralConfigsDatasource>(
      () => _i34.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i35.LoginLocalDataSource>(() =>
      _i35.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i36.ActionUserUsecase>(
      () => _i36.ActionUserUsecase(gh<_i32.UsersRepository>()));
  gh.factory<_i37.GetAllUsersUsecase>(
      () => _i37.GetAllUsersUsecase(gh<_i32.UsersRepository>()));
  gh.factory<_i38.TaskRepository>(
      () => _i39.TaskRepositoryImpl(gh<_i28.TaskDatasource>()));
  gh.lazySingleton<_i40.AgentsDistributorsDataSource>(
      () => _i40.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i41.SupportTabDataSource>(
      () => _i41.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i42.InvoicesTabDataSource>(
      () => _i42.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i43.AddTicketUseCase>(
      () => _i43.AddTicketUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i44.EditTicketTypeUseCase>(
      () => _i44.EditTicketTypeUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i45.GetClientTicketsUseCase>(
      () => _i45.GetClientTicketsUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i46.GetTicketsUseCase>(
      () => _i46.GetTicketsUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i47.GetTicketByIdUseCase>(
      () => _i47.GetTicketByIdUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i48.TransferTicketUseCase>(
      () => _i48.TransferTicketUseCase(gh<_i30.TicketsRepo>()));
  gh.factory<_i49.TicketsCubit>(() => _i49.TicketsCubit(
        gh<_i46.GetTicketsUseCase>(),
        gh<_i47.GetTicketByIdUseCase>(),
        gh<_i45.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i50.LoginRemoteDataSource>(
      () => _i50.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i51.AdvancedConfigsRepository>(() =>
      _i52.AdvancedConfigsRepositoryImpl(gh<_i29.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i53.InvoicesSectionRepo>(
      () => _i54.InvoicesTabRepoImpl(gh<_i42.InvoicesTabDataSource>()));
  gh.lazySingleton<_i55.WaitingAgentsDataSource>(
      () => _i55.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i56.AgentsDistributorsProfileDataSource>(() =>
      _i56.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i57.EditTicketCubit>(() => _i57.EditTicketCubit(
        gh<_i44.EditTicketTypeUseCase>(),
        gh<_i48.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i58.LoginRepo>(() => _i59.LoginRepoImpl(
        gh<_i50.LoginRemoteDataSource>(),
        gh<_i35.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i60.DatesTableDataSource>(
      () => _i60.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i61.RegionsDatasource>(
      () => _i61.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i62.LocationServices>(
      () => _i62.LocationServices(gh<_i8.Location>()));
  gh.factory<_i63.PrivilegeRepository>(
      () => _i64.PrivilegeRepositoryImpl(gh<_i22.PrivilegeDatasource>()));
  gh.factory<_i65.AppRepository>(
      () => _i66.AppRepositoryImpl(gh<_i20.AppDatasource>()));
  gh.lazySingleton<_i67.AgentsDistributorsActionsRepo>(() =>
      _i68.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i69.SupportTabRepo>(
      () => _i70.SupportTabRepoImpl(gh<_i41.SupportTabDataSource>()));
  gh.factory<_i71.LinksImportantRepository>(
      () => _i72.LinkRepositoryImpl(gh<_i26.LinkDatasource>()));
  gh.lazySingleton<_i73.GetInvoicesByPrivilegesUsecase>(() =>
      _i73.GetInvoicesByPrivilegesUsecase(gh<_i53.InvoicesSectionRepo>()));
  gh.lazySingleton<_i74.CacheTokenUsecase>(
      () => _i74.CacheTokenUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i75.GetTokenUsecase>(
      () => _i75.GetTokenUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i76.LoginUsecase>(
      () => _i76.LoginUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i77.ValidateTokenUsecase>(
      () => _i77.ValidateTokenUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i78.VerifyOtpUsecase>(
      () => _i78.VerifyOtpUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i79.GetClientsAcceptUseCase>(
      () => _i79.GetClientsAcceptUseCase(gh<_i16.ClientsAcceptRepository>()));
  gh.lazySingleton<_i80.GeneralConfigsRepository>(() =>
      _i81.GeneralConfigsRepositoryImpl(gh<_i34.GeneralConfigsDatasource>()));
  gh.factory<_i82.CompanyRepository>(
      () => _i83.CompanyRepositoryImpl(gh<_i25.CommentCompanyDatasource>()));
  gh.factory<_i84.ClientsListRepository>(
      () => _i85.ClientsListRepositoryImpl(gh<_i24.ClientsListDatasource>()));
  gh.lazySingleton<_i86.AgentsDistributorsProfileRepo>(() =>
      _i87.AgentsDistributorsProfileRepoImpl(
          gh<_i56.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i88.AddDateInstallUsecase>(
      () => _i88.AddDateInstallUsecase(gh<_i69.SupportTabRepo>()));
  gh.lazySingleton<_i89.CancelDateInstallUsecase>(
      () => _i89.CancelDateInstallUsecase(gh<_i69.SupportTabRepo>()));
  gh.lazySingleton<_i90.GetInvoiceByClientUsecase>(
      () => _i90.GetInvoiceByClientUsecase(gh<_i69.SupportTabRepo>()));
  gh.lazySingleton<_i91.ReceiveDeviceUsecase>(
      () => _i91.ReceiveDeviceUsecase(gh<_i69.SupportTabRepo>()));
  gh.lazySingleton<_i92.ReturnInvoiceApproveUsecase>(
      () => _i92.ReturnInvoiceApproveUsecase(gh<_i69.SupportTabRepo>()));
  gh.lazySingleton<_i93.SetDateDoneUsecase>(
      () => _i93.SetDateDoneUsecase(gh<_i69.SupportTabRepo>()));
  gh.lazySingleton<_i94.SetReadyInstallUsecase>(
      () => _i94.SetReadyInstallUsecase(gh<_i69.SupportTabRepo>()));
  gh.lazySingleton<_i95.GetAllUsersUseCase>(
      () => _i95.GetAllUsersUseCase(gh<_i53.InvoicesSectionRepo>()));
  gh.factory<_i96.CommunicationListRepository>(() =>
      _i97.CommunicationListRepositoryImpl(
          gh<_i21.CommunicationListDatasource>()));
  gh.factory<_i98.ActionLinkUsecase>(
      () => _i98.ActionLinkUsecase(gh<_i71.LinksImportantRepository>()));
  gh.factory<_i99.GetLinkUsecase>(
      () => _i99.GetLinkUsecase(gh<_i71.LinksImportantRepository>()));
  gh.lazySingleton<_i100.ManageWithdrawalsRepository>(() =>
      _i101.ManageWithdrawalsRepositoryImpl(
          gh<_i19.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i102.AgentsDistributorsRepo>(() =>
      _i103.AgentsDistributorsRepoImpl(
          gh<_i40.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i104.RegionsRepository>(
      () => _i105.RegionsRepositoryImpl(gh<_i61.RegionsDatasource>()));
  gh.factory<_i106.GetCommunicationListUsecase>(() =>
      _i106.GetCommunicationListUsecase(
          gh<_i96.CommunicationListRepository>()));
  gh.lazySingleton<_i107.CrudClientSupportFilesUsecase>(() =>
      _i107.CrudClientSupportFilesUsecase(
          repository: gh<_i84.ClientsListRepository>()));
  gh.lazySingleton<_i108.GetClientSupportFilesUsecase>(() =>
      _i108.GetClientSupportFilesUsecase(
          repository: gh<_i84.ClientsListRepository>()));
  gh.factory<_i109.LinkCubit>(() => _i109.LinkCubit(
        gh<_i99.GetLinkUsecase>(),
        gh<_i98.ActionLinkUsecase>(),
      ));
  gh.factory<_i110.ParticipateListRepository>(() =>
      _i111.ParticipateListRepositoryImpl(
          gh<_i27.ParticipatesListDatasource>()));
  gh.lazySingleton<_i112.WaitingAgentsRepo>(
      () => _i113.WaitingAgentsRepoImpl(gh<_i55.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i114.ChangeStateAgentUseCase>(
      () => _i114.ChangeStateAgentUseCase(gh<_i102.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i115.GetAgentsAndDistributorsUseCase>(() =>
      _i115.GetAgentsAndDistributorsUseCase(
          gh<_i102.AgentsDistributorsRepo>()));
  gh.factory<_i116.ClientsAcceptCubit>(
      () => _i116.ClientsAcceptCubit(gh<_i79.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i117.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i117.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i100.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i118.GetWithdrawalsInvoicesUsecase>(() =>
      _i118.GetWithdrawalsInvoicesUsecase(
          gh<_i100.ManageWithdrawalsRepository>()));
  gh.factory<_i119.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i119.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i100.ManageWithdrawalsRepository>()));
  gh.factory<_i120.AddTaskUsecase>(
      () => _i120.AddTaskUsecase(gh<_i38.TaskRepository>()));
  gh.factory<_i121.ChangeStatusTaskUsecase>(
      () => _i121.ChangeStatusTaskUsecase(gh<_i38.TaskRepository>()));
  gh.factory<_i122.FilterTaskUsecase>(
      () => _i122.FilterTaskUsecase(gh<_i38.TaskRepository>()));
  gh.factory<_i123.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i123.GetUsersByDepartmentAndRegionUsecase(gh<_i38.TaskRepository>()));
  gh.lazySingleton<_i124.GetAdvancedConfigsUsecase>(() =>
      _i124.GetAdvancedConfigsUsecase(gh<_i51.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i125.EditAdvancedConfigsUsecase>(() =>
      _i125.EditAdvancedConfigsUsecase(gh<_i51.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i126.DatesTableRepo>(
      () => _i127.DatesTableRepoImpl(gh<_i60.DatesTableDataSource>()));
  gh.factory<_i128.AddClientUserUsecase>(
      () => _i128.AddClientUserUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i129.ApproveRejectClientUsecase>(
      () => _i129.ApproveRejectClientUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i130.ChangeTypeClientUsecase>(
      () => _i130.ChangeTypeClientUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i131.EditClientUserUsecase>(
      () => _i131.EditClientUserUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i132.GetClientsListByRegionUseCase>(() =>
      _i132.GetClientsListByRegionUseCase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i133.GetClientsListByUserUseCase>(() =>
      _i133.GetClientsListByUserUseCase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i134.GetClientsWithFilterUserUsecase>(() =>
      _i134.GetClientsWithFilterUserUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i135.GetClientMarketingReportUsecase>(() =>
      _i135.GetClientMarketingReportUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i136.GetRecommendedClientsUsecase>(() =>
      _i136.GetRecommendedClientsUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i137.GetSimilarClientsUsecase>(
      () => _i137.GetSimilarClientsUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i138.ReceiveClientUserUsecase>(
      () => _i138.ReceiveClientUserUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i139.TransferClientUserUsecase>(
      () => _i139.TransferClientUserUsecase(gh<_i84.ClientsListRepository>()));
  gh.factory<_i140.GetVersionUseCase>(
      () => _i140.GetVersionUseCase(gh<_i65.AppRepository>()));
  gh.factory<_i141.AddTicketCubit>(
      () => _i141.AddTicketCubit(gh<_i43.AddTicketUseCase>()));
  gh.lazySingleton<_i142.EditGeneralConfigsUsecase>(() =>
      _i142.EditGeneralConfigsUsecase(gh<_i80.GeneralConfigsRepository>()));
  gh.lazySingleton<_i143.GetGeneralConfigsUsecase>(() =>
      _i143.GetGeneralConfigsUsecase(gh<_i80.GeneralConfigsRepository>()));
  gh.lazySingleton<_i144.AddAgentUseCase>(
      () => _i144.AddAgentUseCase(gh<_i67.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i145.GetAllCitiesUseCase>(() =>
      _i145.GetAllCitiesUseCase(gh<_i67.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i146.UpdateAgentUseCase>(
      () => _i146.UpdateAgentUseCase(gh<_i67.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i147.CrudAgentSupportFilesUsecase>(() =>
      _i147.CrudAgentSupportFilesUsecase(
          gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i148.TaskCubit>(() => _i148.TaskCubit(
        gh<_i120.AddTaskUsecase>(),
        gh<_i122.FilterTaskUsecase>(),
        gh<_i121.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i149.SupportTabCubit>(() => _i149.SupportTabCubit(
        gh<_i90.GetInvoiceByClientUsecase>(),
        gh<_i88.AddDateInstallUsecase>(),
        gh<_i93.SetDateDoneUsecase>(),
        gh<_i94.SetReadyInstallUsecase>(),
        gh<_i92.ReturnInvoiceApproveUsecase>(),
        gh<_i91.ReceiveDeviceUsecase>(),
        gh<_i89.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i150.AddAgentDateUseCase>(() =>
      _i150.AddAgentDateUseCase(gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.factory<_i151.ClientsListBloc>(() => _i151.ClientsListBloc(
        gh<_i134.GetClientsWithFilterUserUsecase>(),
        gh<_i136.GetRecommendedClientsUsecase>(),
        gh<_i128.AddClientUserUsecase>(),
        gh<_i131.EditClientUserUsecase>(),
        gh<_i130.ChangeTypeClientUsecase>(),
        gh<_i137.GetSimilarClientsUsecase>(),
        gh<_i129.ApproveRejectClientUsecase>(),
        gh<_i107.CrudClientSupportFilesUsecase>(),
        gh<_i108.GetClientSupportFilesUsecase>(),
        gh<_i139.TransferClientUserUsecase>(),
        gh<_i138.ReceiveClientUserUsecase>(),
        gh<_i135.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i152.LoginCubit>(() => _i152.LoginCubit(
        gh<_i76.LoginUsecase>(),
        gh<_i78.VerifyOtpUsecase>(),
        gh<_i74.CacheTokenUsecase>(),
        gh<_i75.GetTokenUsecase>(),
        gh<_i77.ValidateTokenUsecase>(),
      ));
  gh.factory<_i153.AddLevelUsecase>(
      () => _i153.AddLevelUsecase(gh<_i63.PrivilegeRepository>()));
  gh.factory<_i154.GetLevelsUsecase>(
      () => _i154.GetLevelsUsecase(gh<_i63.PrivilegeRepository>()));
  gh.factory<_i155.GetPrivilegesUsecase>(
      () => _i155.GetPrivilegesUsecase(gh<_i63.PrivilegeRepository>()));
  gh.factory<_i156.UpdatePrivilegeUsecase>(
      () => _i156.UpdatePrivilegeUsecase(gh<_i63.PrivilegeRepository>()));
  gh.factory<_i157.AttachmentsRowCubit>(() => _i157.AttachmentsRowCubit(
        gh<_i108.GetClientSupportFilesUsecase>(),
        gh<_i107.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i158.AddCommentUsecase>(
      () => _i158.AddCommentUsecase(gh<_i82.CompanyRepository>()));
  gh.factory<_i159.GetCommentUsecase>(
      () => _i159.GetCommentUsecase(gh<_i82.CompanyRepository>()));
  gh.lazySingleton<_i160.GetRegionsByIdCountryUseCase>(
      () => _i160.GetRegionsByIdCountryUseCase(gh<_i104.RegionsRepository>()));
  gh.lazySingleton<_i161.PrivilegeCubit>(() => _i161.PrivilegeCubit(
        gh<_i154.GetLevelsUsecase>(),
        gh<_i155.GetPrivilegesUsecase>(),
        gh<_i156.UpdatePrivilegeUsecase>(),
        gh<_i153.AddLevelUsecase>(),
      ));
  gh.factory<_i162.AdvancedCofigsCubit>(() => _i162.AdvancedCofigsCubit(
        gh<_i124.GetAdvancedConfigsUsecase>(),
        gh<_i125.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i163.GeneralCofigsCubit>(() => _i163.GeneralCofigsCubit(
        gh<_i143.GetGeneralConfigsUsecase>(),
        gh<_i142.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i164.AddAgentCommentUsecase>(() =>
      _i164.AddAgentCommentUsecase(gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i165.DoneTrainingUsecase>(() =>
      _i165.DoneTrainingUsecase(gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i166.GetAgentUsecase>(
      () => _i166.GetAgentUsecase(gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i167.GetAgentClientListUsecase>(() =>
      _i167.GetAgentClientListUsecase(
          gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i168.GetAgentCommentsListUsecase>(() =>
      _i168.GetAgentCommentsListUsecase(
          gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i169.GetAgentDatesListUsecase>(() =>
      _i169.GetAgentDatesListUsecase(gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i170.GetAgentInvoiceListUsecase>(() =>
      _i170.GetAgentInvoiceListUsecase(
          gh<_i86.AgentsDistributorsProfileRepo>()));
  gh.singleton<_i171.CitiesCubit>(
      () => _i171.CitiesCubit(gh<_i145.GetAllCitiesUseCase>()));
  gh.factory<_i172.AddRejectReasonsUsecase>(() =>
      _i172.AddRejectReasonsUsecase(gh<_i100.ManageWithdrawalsRepository>()));
  gh.factory<_i173.EditRejectReasonsUsecase>(() =>
      _i173.EditRejectReasonsUsecase(gh<_i100.ManageWithdrawalsRepository>()));
  gh.factory<_i174.GetRejectReasonsUsecase>(() =>
      _i174.GetRejectReasonsUsecase(gh<_i100.ManageWithdrawalsRepository>()));
  gh.factory<_i175.GetUserSeriesUsecase>(() =>
      _i175.GetUserSeriesUsecase(gh<_i100.ManageWithdrawalsRepository>()));
  gh.factory<_i176.GetWithdrawnDetailsUsecase>(() =>
      _i176.GetWithdrawnDetailsUsecase(
          gh<_i100.ManageWithdrawalsRepository>()));
  gh.factory<_i177.SetApproveSeriesUsecase>(() =>
      _i177.SetApproveSeriesUsecase(gh<_i100.ManageWithdrawalsRepository>()));
  gh.factory<_i178.UpdateSeriesUsecase>(
      () => _i178.UpdateSeriesUsecase(gh<_i100.ManageWithdrawalsRepository>()));
  gh.singleton<_i179.AppManagerCubit>(
      () => _i179.AppManagerCubit(gh<_i140.GetVersionUseCase>()));
  gh.factory<_i180.RegionsCubit>(
      () => _i180.RegionsCubit(gh<_i160.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i181.GetWaitingAgentsUsecase>(
      () => _i181.GetWaitingAgentsUsecase(gh<_i112.WaitingAgentsRepo>()));
  gh.lazySingleton<_i182.ManageWithdrawalsCubit>(
      () => _i182.ManageWithdrawalsCubit(
            gh<_i175.GetUserSeriesUsecase>(),
            gh<_i178.UpdateSeriesUsecase>(),
            gh<_i37.GetAllUsersUsecase>(),
            gh<_i118.GetWithdrawalsInvoicesUsecase>(),
            gh<_i119.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i177.SetApproveSeriesUsecase>(),
            gh<_i176.GetWithdrawnDetailsUsecase>(),
            gh<_i172.AddRejectReasonsUsecase>(),
            gh<_i174.GetRejectReasonsUsecase>(),
            gh<_i173.EditRejectReasonsUsecase>(),
            gh<_i117.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i183.CommunicationListBloc>(() =>
      _i183.CommunicationListBloc(gh<_i106.GetCommunicationListUsecase>()));
  gh.factory<_i184.AddParticipateCommentUsecase>(() =>
      _i184.AddParticipateCommentUsecase(
          gh<_i110.ParticipateListRepository>()));
  gh.factory<_i185.AddParticipateUserUsecase>(() =>
      _i185.AddParticipateUserUsecase(gh<_i110.ParticipateListRepository>()));
  gh.factory<_i186.EditParticipateUserUsecase>(() =>
      _i186.EditParticipateUserUsecase(gh<_i110.ParticipateListRepository>()));
  gh.factory<_i187.GetInvoiceByIdUsecase>(
      () => _i187.GetInvoiceByIdUsecase(gh<_i110.ParticipateListRepository>()));
  gh.factory<_i188.ParticipateClientListUsecase>(() =>
      _i188.ParticipateClientListUsecase(
          gh<_i110.ParticipateListRepository>()));
  gh.factory<_i189.ParticipateCommentListUsecase>(() =>
      _i189.ParticipateCommentListUsecase(
          gh<_i110.ParticipateListRepository>()));
  gh.factory<_i190.ParticipateInvoiceListUsecase>(() =>
      _i190.ParticipateInvoiceListUsecase(
          gh<_i110.ParticipateListRepository>()));
  gh.factory<_i191.ParticipateListUsecase>(() =>
      _i191.ParticipateListUsecase(gh<_i110.ParticipateListRepository>()));
  gh.factory<_i192.AgentsDistributorsCubit>(() => _i192.AgentsDistributorsCubit(
        gh<_i115.GetAgentsAndDistributorsUseCase>(),
        gh<_i114.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i193.UsersCubit>(() => _i193.UsersCubit(
        gh<_i37.GetAllUsersUsecase>(),
        gh<_i36.ActionUserUsecase>(),
        gh<_i123.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i194.CancelScheduleUsecase>(
      () => _i194.CancelScheduleUsecase(gh<_i126.DatesTableRepo>()));
  gh.lazySingleton<_i195.ChangeDateToDonUsecase>(
      () => _i195.ChangeDateToDonUsecase(gh<_i126.DatesTableRepo>()));
  gh.lazySingleton<_i196.GetDateInstallationUsecase>(
      () => _i196.GetDateInstallationUsecase(gh<_i126.DatesTableRepo>()));
  gh.lazySingleton<_i197.GetInvoicesByClientForDateUsecase>(() =>
      _i197.GetInvoicesByClientForDateUsecase(gh<_i126.DatesTableRepo>()));
  gh.lazySingleton<_i198.GetSubscribedClientsUsecase>(
      () => _i198.GetSubscribedClientsUsecase(gh<_i126.DatesTableRepo>()));
  gh.lazySingleton<_i199.RescheduleDateUsecase>(
      () => _i199.RescheduleDateUsecase(gh<_i126.DatesTableRepo>()));
  gh.lazySingleton<_i200.ReturnScheduleVisitToOpenUsecase>(
      () => _i200.ReturnScheduleVisitToOpenUsecase(gh<_i126.DatesTableRepo>()));
  gh.factory<_i201.AgentsDistributorsProfileBloc>(
      () => _i201.AgentsDistributorsProfileBloc(
            gh<_i167.GetAgentClientListUsecase>(),
            gh<_i170.GetAgentInvoiceListUsecase>(),
            gh<_i187.GetInvoiceByIdUsecase>(),
            gh<_i168.GetAgentCommentsListUsecase>(),
            gh<_i164.AddAgentCommentUsecase>(),
            gh<_i165.DoneTrainingUsecase>(),
            gh<_i150.AddAgentDateUseCase>(),
            gh<_i169.GetAgentDatesListUsecase>(),
            gh<_i147.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i202.DatesTableCubit>(() => _i202.DatesTableCubit(
        gh<_i196.GetDateInstallationUsecase>(),
        gh<_i199.RescheduleDateUsecase>(),
        gh<_i195.ChangeDateToDonUsecase>(),
        gh<_i194.CancelScheduleUsecase>(),
        gh<_i200.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i198.GetSubscribedClientsUsecase>(),
        gh<_i197.GetInvoicesByClientForDateUsecase>(),
        gh<_i88.AddDateInstallUsecase>(),
      ));
  gh.factory<_i203.AgentsDistributorsActionsCubit>(
      () => _i203.AgentsDistributorsActionsCubit(
            gh<_i145.GetAllCitiesUseCase>(),
            gh<_i144.AddAgentUseCase>(),
            gh<_i146.UpdateAgentUseCase>(),
          ));
  gh.factory<_i204.CompanyCubit>(() => _i204.CompanyCubit(
        gh<_i159.GetCommentUsecase>(),
        gh<_i158.AddCommentUsecase>(),
      ));
  gh.factory<_i205.InvoicesSectionCubit>(() => _i205.InvoicesSectionCubit(
        gh<_i73.GetInvoicesByPrivilegesUsecase>(),
        gh<_i115.GetAgentsAndDistributorsUseCase>(),
        gh<_i191.ParticipateListUsecase>(),
        gh<_i95.GetAllUsersUseCase>(),
      ));
  gh.factory<_i206.ParticipateListBloc>(() => _i206.ParticipateListBloc(
        gh<_i191.ParticipateListUsecase>(),
        gh<_i185.AddParticipateUserUsecase>(),
        gh<_i186.EditParticipateUserUsecase>(),
        gh<_i188.ParticipateClientListUsecase>(),
        gh<_i190.ParticipateInvoiceListUsecase>(),
        gh<_i187.GetInvoiceByIdUsecase>(),
        gh<_i189.ParticipateCommentListUsecase>(),
        gh<_i184.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i207.WaitingAgentsCubit>(
      () => _i207.WaitingAgentsCubit(gh<_i181.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i208.AppModule {}
