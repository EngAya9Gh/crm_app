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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i21;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i72;
import '../../../features/app/domain/repositories/app_repository.dart' as _i71;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i151;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i190;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i37;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i56;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i65;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i64;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i80;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i81;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i82;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i83;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i84;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i164;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i15;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i17;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i16;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i85;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i127;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i18;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i33;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i32;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i49;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i50;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i51;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i53;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i52;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i54;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i152;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i63;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i55;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i22;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i104;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i103;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i117;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i194;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i30;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i47;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i46;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i48;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i102;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i44;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i76;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i75;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i94;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i95;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i96;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i97;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i98;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i99;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i100;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i160;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i67;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i116;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i115;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i172;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i191;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i31;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i58;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i57;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i135;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i136;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i174;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i36;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i87;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i86;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i153;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i154;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i175;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i23;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i70;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i69;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i165;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i166;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i167;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i168;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i173;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i35;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i34;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i38;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i105;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i106;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i107;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i108;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i193;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i20;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i112;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i111;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i183;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i184;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i128;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i185;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i186;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i130;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i129;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i187;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i188;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i189;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i216;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i24;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i91;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i90;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i139;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i140;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i141;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i118;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i142;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i146;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i119;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i143;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i144;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i145;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i147;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i148;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i149;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i150;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i162;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i25;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i89;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i88;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i170;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i171;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i214;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i45;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i60;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i59;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i101;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i79;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i215;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i29;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i43;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i42;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i158;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i204;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i41;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i62;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i74;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i93;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i114;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i73;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i92;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i113;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i176;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i161;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i125;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i157;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i177;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i178;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i180;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i181;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i182;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i126;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i156;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i163;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i212;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i203;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i26;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i78;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i77;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i109;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i110;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i120;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i27;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i122;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i121;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i195;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i196;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i197;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i198;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i199;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i200;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i201;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i202;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i217;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i66;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i138;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i137;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i205;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i206;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i207;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i208;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i209;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i210;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i211;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i213;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i61;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i124;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i123;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i192;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i218;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i28;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i40;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i39;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i131;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i132;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i133;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i134;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i159;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i169;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i68;
import 'di_container.dart' as _i219;

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
  gh.lazySingleton<_i19.UsersDatasource>(
      () => _i19.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i20.ManageWithdrawalsDatasource>(
      () => _i20.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i21.AppDatasource>(
      () => _i21.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i22.CommunicationListDatasource>(
      () => _i22.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i23.PrivilegeDatasource>(
      () => _i23.PrivilegeDatasource(gh<_i9.ApiServices>()));
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
  gh.lazySingleton<_i29.LatestClientsUpdatesDatasource>(
      () => _i29.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.CitiesDatasource>(
      () => _i30.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i31.AdvancedConfigsDatasource>(
      () => _i31.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i32.TicketsRepo>(
      () => _i33.TicketsRepoImpl(gh<_i18.TicketsDataSource>()));
  gh.lazySingleton<_i34.UsersRepository>(
      () => _i35.UsersRepositoryImpl(gh<_i19.UsersDatasource>()));
  gh.lazySingleton<_i36.GeneralConfigsDatasource>(
      () => _i36.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i37.LoginLocalDataSource>(() =>
      _i37.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i38.ActionUserUsecase>(
      () => _i38.ActionUserUsecase(gh<_i34.UsersRepository>()));
  gh.factory<_i39.TaskRepository>(
      () => _i40.TaskRepositoryImpl(gh<_i28.TaskDatasource>()));
  gh.lazySingleton<_i41.AgentsDistributorsDataSource>(
      () => _i41.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i42.LatestClientsUpdatesRepository>(() =>
      _i43.LatestClientsUpdatesRepositoryImpl(
          gh<_i29.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i44.SupportTabDataSource>(
      () => _i44.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i45.InvoicesTabDataSource>(
      () => _i45.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i46.CitiesRepository>(
      () => _i47.CitiesRepositoryImpl(gh<_i30.CitiesDatasource>()));
  gh.lazySingleton<_i48.GetCitiesUseCase>(
      () => _i48.GetCitiesUseCase(gh<_i46.CitiesRepository>()));
  gh.lazySingleton<_i49.AddTicketUseCase>(
      () => _i49.AddTicketUseCase(gh<_i32.TicketsRepo>()));
  gh.lazySingleton<_i50.EditTicketTypeUseCase>(
      () => _i50.EditTicketTypeUseCase(gh<_i32.TicketsRepo>()));
  gh.lazySingleton<_i51.GetClientTicketsUseCase>(
      () => _i51.GetClientTicketsUseCase(gh<_i32.TicketsRepo>()));
  gh.lazySingleton<_i52.GetTicketsUseCase>(
      () => _i52.GetTicketsUseCase(gh<_i32.TicketsRepo>()));
  gh.lazySingleton<_i53.GetTicketByIdUseCase>(
      () => _i53.GetTicketByIdUseCase(gh<_i32.TicketsRepo>()));
  gh.lazySingleton<_i54.TransferTicketUseCase>(
      () => _i54.TransferTicketUseCase(gh<_i32.TicketsRepo>()));
  gh.factory<_i55.TicketsCubit>(() => _i55.TicketsCubit(
        gh<_i52.GetTicketsUseCase>(),
        gh<_i53.GetTicketByIdUseCase>(),
        gh<_i51.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i56.LoginRemoteDataSource>(
      () => _i56.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i57.AdvancedConfigsRepository>(() =>
      _i58.AdvancedConfigsRepositoryImpl(gh<_i31.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i59.InvoicesSectionRepo>(
      () => _i60.InvoicesTabRepoImpl(gh<_i45.InvoicesTabDataSource>()));
  gh.lazySingleton<_i61.WaitingAgentsDataSource>(
      () => _i61.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i62.AgentsDistributorsProfileDataSource>(() =>
      _i62.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i63.EditTicketCubit>(() => _i63.EditTicketCubit(
        gh<_i50.EditTicketTypeUseCase>(),
        gh<_i54.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i64.LoginRepo>(() => _i65.LoginRepoImpl(
        gh<_i56.LoginRemoteDataSource>(),
        gh<_i37.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i66.DatesTableDataSource>(
      () => _i66.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i67.RegionsDatasource>(
      () => _i67.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i68.LocationServices>(
      () => _i68.LocationServices(gh<_i8.Location>()));
  gh.factory<_i69.PrivilegeRepository>(
      () => _i70.PrivilegeRepositoryImpl(gh<_i23.PrivilegeDatasource>()));
  gh.factory<_i71.AppRepository>(
      () => _i72.AppRepositoryImpl(gh<_i21.AppDatasource>()));
  gh.lazySingleton<_i73.AgentsDistributorsActionsRepo>(() =>
      _i74.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i75.SupportTabRepo>(
      () => _i76.SupportTabRepoImpl(gh<_i44.SupportTabDataSource>()));
  gh.factory<_i77.LinksImportantRepository>(
      () => _i78.LinkRepositoryImpl(gh<_i26.LinkDatasource>()));
  gh.lazySingleton<_i79.GetInvoicesByPrivilegesUsecase>(() =>
      _i79.GetInvoicesByPrivilegesUsecase(gh<_i59.InvoicesSectionRepo>()));
  gh.lazySingleton<_i80.CacheTokenUsecase>(
      () => _i80.CacheTokenUsecase(gh<_i64.LoginRepo>()));
  gh.lazySingleton<_i81.GetTokenUsecase>(
      () => _i81.GetTokenUsecase(gh<_i64.LoginRepo>()));
  gh.lazySingleton<_i82.LoginUsecase>(
      () => _i82.LoginUsecase(gh<_i64.LoginRepo>()));
  gh.lazySingleton<_i83.ValidateTokenUsecase>(
      () => _i83.ValidateTokenUsecase(gh<_i64.LoginRepo>()));
  gh.lazySingleton<_i84.VerifyOtpUsecase>(
      () => _i84.VerifyOtpUsecase(gh<_i64.LoginRepo>()));
  gh.lazySingleton<_i85.GetClientsAcceptUseCase>(
      () => _i85.GetClientsAcceptUseCase(gh<_i16.ClientsAcceptRepository>()));
  gh.lazySingleton<_i86.GeneralConfigsRepository>(() =>
      _i87.GeneralConfigsRepositoryImpl(gh<_i36.GeneralConfigsDatasource>()));
  gh.factory<_i88.CompanyRepository>(
      () => _i89.CompanyRepositoryImpl(gh<_i25.CommentCompanyDatasource>()));
  gh.factory<_i90.ClientsListRepository>(
      () => _i91.ClientsListRepositoryImpl(gh<_i24.ClientsListDatasource>()));
  gh.lazySingleton<_i92.AgentsDistributorsProfileRepo>(() =>
      _i93.AgentsDistributorsProfileRepoImpl(
          gh<_i62.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i94.AddDateInstallUsecase>(
      () => _i94.AddDateInstallUsecase(gh<_i75.SupportTabRepo>()));
  gh.lazySingleton<_i95.CancelDateInstallUsecase>(
      () => _i95.CancelDateInstallUsecase(gh<_i75.SupportTabRepo>()));
  gh.lazySingleton<_i96.GetInvoiceByClientUsecase>(
      () => _i96.GetInvoiceByClientUsecase(gh<_i75.SupportTabRepo>()));
  gh.lazySingleton<_i97.ReceiveDeviceUsecase>(
      () => _i97.ReceiveDeviceUsecase(gh<_i75.SupportTabRepo>()));
  gh.lazySingleton<_i98.ReturnInvoiceApproveUsecase>(
      () => _i98.ReturnInvoiceApproveUsecase(gh<_i75.SupportTabRepo>()));
  gh.lazySingleton<_i99.SetDateDoneUsecase>(
      () => _i99.SetDateDoneUsecase(gh<_i75.SupportTabRepo>()));
  gh.lazySingleton<_i100.SetReadyInstallUsecase>(
      () => _i100.SetReadyInstallUsecase(gh<_i75.SupportTabRepo>()));
  gh.lazySingleton<_i101.GetAllUsersUseCase>(
      () => _i101.GetAllUsersUseCase(gh<_i59.InvoicesSectionRepo>()));
  gh.singleton<_i102.CitiesCubit>(
      () => _i102.CitiesCubit(gh<_i48.GetCitiesUseCase>()));
  gh.factory<_i103.CommunicationListRepository>(() =>
      _i104.CommunicationListRepositoryImpl(
          gh<_i22.CommunicationListDatasource>()));
  gh.lazySingleton<_i105.GetBranchesForUserUsecase>(
      () => _i105.GetBranchesForUserUsecase(gh<_i34.UsersRepository>()));
  gh.lazySingleton<_i106.GetLevelsForUserUsecase>(
      () => _i106.GetLevelsForUserUsecase(gh<_i34.UsersRepository>()));
  gh.lazySingleton<_i107.GetManagesForUserUsecase>(
      () => _i107.GetManagesForUserUsecase(gh<_i34.UsersRepository>()));
  gh.factory<_i108.GetUsersUsecase>(
      () => _i108.GetUsersUsecase(gh<_i34.UsersRepository>()));
  gh.factory<_i109.ActionLinkUsecase>(
      () => _i109.ActionLinkUsecase(gh<_i77.LinksImportantRepository>()));
  gh.factory<_i110.GetLinkUsecase>(
      () => _i110.GetLinkUsecase(gh<_i77.LinksImportantRepository>()));
  gh.lazySingleton<_i111.ManageWithdrawalsRepository>(() =>
      _i112.ManageWithdrawalsRepositoryImpl(
          gh<_i20.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i113.AgentsDistributorsRepo>(() =>
      _i114.AgentsDistributorsRepoImpl(
          gh<_i41.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i115.RegionsRepository>(
      () => _i116.RegionsRepositoryImpl(gh<_i67.RegionsDatasource>()));
  gh.factory<_i117.GetCommunicationListUsecase>(() =>
      _i117.GetCommunicationListUsecase(
          gh<_i103.CommunicationListRepository>()));
  gh.lazySingleton<_i118.CrudClientSupportFilesUsecase>(() =>
      _i118.CrudClientSupportFilesUsecase(
          repository: gh<_i90.ClientsListRepository>()));
  gh.lazySingleton<_i119.GetClientSupportFilesUsecase>(() =>
      _i119.GetClientSupportFilesUsecase(
          repository: gh<_i90.ClientsListRepository>()));
  gh.factory<_i120.LinkCubit>(() => _i120.LinkCubit(
        gh<_i110.GetLinkUsecase>(),
        gh<_i109.ActionLinkUsecase>(),
      ));
  gh.factory<_i121.ParticipateListRepository>(() =>
      _i122.ParticipateListRepositoryImpl(
          gh<_i27.ParticipatesListDatasource>()));
  gh.lazySingleton<_i123.WaitingAgentsRepo>(
      () => _i124.WaitingAgentsRepoImpl(gh<_i61.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i125.ChangeStateAgentUseCase>(
      () => _i125.ChangeStateAgentUseCase(gh<_i113.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i126.GetAgentsAndDistributorsUseCase>(() =>
      _i126.GetAgentsAndDistributorsUseCase(
          gh<_i113.AgentsDistributorsRepo>()));
  gh.factory<_i127.ClientsAcceptCubit>(
      () => _i127.ClientsAcceptCubit(gh<_i85.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i128.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i128.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i111.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i129.GetWithdrawalsInvoicesUsecase>(() =>
      _i129.GetWithdrawalsInvoicesUsecase(
          gh<_i111.ManageWithdrawalsRepository>()));
  gh.factory<_i130.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i130.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i111.ManageWithdrawalsRepository>()));
  gh.factory<_i131.AddTaskUsecase>(
      () => _i131.AddTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i132.ChangeStatusTaskUsecase>(
      () => _i132.ChangeStatusTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i133.FilterTaskUsecase>(
      () => _i133.FilterTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i134.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i134.GetUsersByDepartmentAndRegionUsecase(gh<_i39.TaskRepository>()));
  gh.lazySingleton<_i135.EditAdvancedConfigsUsecase>(() =>
      _i135.EditAdvancedConfigsUsecase(gh<_i57.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i136.GetAdvancedConfigsUsecase>(() =>
      _i136.GetAdvancedConfigsUsecase(gh<_i57.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i137.DatesTableRepo>(
      () => _i138.DatesTableRepoImpl(gh<_i66.DatesTableDataSource>()));
  gh.factory<_i139.AddClientUserUsecase>(
      () => _i139.AddClientUserUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i140.ApproveRejectClientUsecase>(
      () => _i140.ApproveRejectClientUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i141.ChangeTypeClientUsecase>(
      () => _i141.ChangeTypeClientUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i142.EditClientUserUsecase>(
      () => _i142.EditClientUserUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i143.GetClientsListByRegionUseCase>(() =>
      _i143.GetClientsListByRegionUseCase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i144.GetClientsListByUserUseCase>(() =>
      _i144.GetClientsListByUserUseCase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i145.GetClientsWithFilterUserUsecase>(() =>
      _i145.GetClientsWithFilterUserUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i146.GetClientMarketingReportUsecase>(() =>
      _i146.GetClientMarketingReportUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i147.GetRecommendedClientsUsecase>(() =>
      _i147.GetRecommendedClientsUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i148.GetSimilarClientsUsecase>(
      () => _i148.GetSimilarClientsUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i149.ReceiveClientUserUsecase>(
      () => _i149.ReceiveClientUserUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i150.TransferClientUserUsecase>(
      () => _i150.TransferClientUserUsecase(gh<_i90.ClientsListRepository>()));
  gh.factory<_i151.GetVersionUseCase>(
      () => _i151.GetVersionUseCase(gh<_i71.AppRepository>()));
  gh.factory<_i152.AddTicketCubit>(
      () => _i152.AddTicketCubit(gh<_i49.AddTicketUseCase>()));
  gh.lazySingleton<_i153.EditGeneralConfigsUsecase>(() =>
      _i153.EditGeneralConfigsUsecase(gh<_i86.GeneralConfigsRepository>()));
  gh.lazySingleton<_i154.GetGeneralConfigsUsecase>(() =>
      _i154.GetGeneralConfigsUsecase(gh<_i86.GeneralConfigsRepository>()));
  gh.lazySingleton<_i155.AddAgentUseCase>(
      () => _i155.AddAgentUseCase(gh<_i73.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i156.UpdateAgentUseCase>(
      () => _i156.UpdateAgentUseCase(gh<_i73.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i157.CrudAgentSupportFilesUsecase>(() =>
      _i157.CrudAgentSupportFilesUsecase(
          gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i158.GetLatestClientsUseCase>(() =>
      _i158.GetLatestClientsUseCase(gh<_i42.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i159.TaskCubit>(() => _i159.TaskCubit(
        gh<_i131.AddTaskUsecase>(),
        gh<_i133.FilterTaskUsecase>(),
        gh<_i132.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i160.SupportTabCubit>(() => _i160.SupportTabCubit(
        gh<_i96.GetInvoiceByClientUsecase>(),
        gh<_i94.AddDateInstallUsecase>(),
        gh<_i99.SetDateDoneUsecase>(),
        gh<_i100.SetReadyInstallUsecase>(),
        gh<_i98.ReturnInvoiceApproveUsecase>(),
        gh<_i97.ReceiveDeviceUsecase>(),
        gh<_i95.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i161.AddAgentDateUseCase>(() =>
      _i161.AddAgentDateUseCase(gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.factory<_i162.ClientsListBloc>(() => _i162.ClientsListBloc(
        gh<_i145.GetClientsWithFilterUserUsecase>(),
        gh<_i147.GetRecommendedClientsUsecase>(),
        gh<_i139.AddClientUserUsecase>(),
        gh<_i142.EditClientUserUsecase>(),
        gh<_i141.ChangeTypeClientUsecase>(),
        gh<_i148.GetSimilarClientsUsecase>(),
        gh<_i140.ApproveRejectClientUsecase>(),
        gh<_i118.CrudClientSupportFilesUsecase>(),
        gh<_i119.GetClientSupportFilesUsecase>(),
        gh<_i150.TransferClientUserUsecase>(),
        gh<_i149.ReceiveClientUserUsecase>(),
        gh<_i146.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i163.AgentsDistributorsActionsCubit>(
      () => _i163.AgentsDistributorsActionsCubit(
            gh<_i48.GetCitiesUseCase>(),
            gh<_i155.AddAgentUseCase>(),
            gh<_i156.UpdateAgentUseCase>(),
          ));
  gh.factory<_i164.LoginCubit>(() => _i164.LoginCubit(
        gh<_i82.LoginUsecase>(),
        gh<_i84.VerifyOtpUsecase>(),
        gh<_i80.CacheTokenUsecase>(),
        gh<_i81.GetTokenUsecase>(),
        gh<_i83.ValidateTokenUsecase>(),
      ));
  gh.factory<_i165.AddLevelUsecase>(
      () => _i165.AddLevelUsecase(gh<_i69.PrivilegeRepository>()));
  gh.factory<_i166.GetLevelsUsecase>(
      () => _i166.GetLevelsUsecase(gh<_i69.PrivilegeRepository>()));
  gh.factory<_i167.GetPrivilegesUsecase>(
      () => _i167.GetPrivilegesUsecase(gh<_i69.PrivilegeRepository>()));
  gh.factory<_i168.UpdatePrivilegeUsecase>(
      () => _i168.UpdatePrivilegeUsecase(gh<_i69.PrivilegeRepository>()));
  gh.factory<_i169.AttachmentsRowCubit>(() => _i169.AttachmentsRowCubit(
        gh<_i119.GetClientSupportFilesUsecase>(),
        gh<_i118.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i170.AddCommentUsecase>(
      () => _i170.AddCommentUsecase(gh<_i88.CompanyRepository>()));
  gh.factory<_i171.GetCommentUsecase>(
      () => _i171.GetCommentUsecase(gh<_i88.CompanyRepository>()));
  gh.lazySingleton<_i172.GetRegionsByIdCountryUseCase>(
      () => _i172.GetRegionsByIdCountryUseCase(gh<_i115.RegionsRepository>()));
  gh.lazySingleton<_i173.PrivilegeCubit>(() => _i173.PrivilegeCubit(
        gh<_i166.GetLevelsUsecase>(),
        gh<_i167.GetPrivilegesUsecase>(),
        gh<_i168.UpdatePrivilegeUsecase>(),
        gh<_i165.AddLevelUsecase>(),
      ));
  gh.factory<_i174.AdvancedCofigsCubit>(() => _i174.AdvancedCofigsCubit(
        gh<_i136.GetAdvancedConfigsUsecase>(),
        gh<_i135.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i175.GeneralCofigsCubit>(() => _i175.GeneralCofigsCubit(
        gh<_i154.GetGeneralConfigsUsecase>(),
        gh<_i153.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i176.AddAgentCommentUsecase>(() =>
      _i176.AddAgentCommentUsecase(gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i177.DoneTrainingUsecase>(() =>
      _i177.DoneTrainingUsecase(gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i178.GetAgentUsecase>(
      () => _i178.GetAgentUsecase(gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i179.GetAgentClientListUsecase>(() =>
      _i179.GetAgentClientListUsecase(
          gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i180.GetAgentCommentsListUsecase>(() =>
      _i180.GetAgentCommentsListUsecase(
          gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i181.GetAgentDatesListUsecase>(() =>
      _i181.GetAgentDatesListUsecase(gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i182.GetAgentInvoiceListUsecase>(() =>
      _i182.GetAgentInvoiceListUsecase(
          gh<_i92.AgentsDistributorsProfileRepo>()));
  gh.factory<_i183.AddRejectReasonsUsecase>(() =>
      _i183.AddRejectReasonsUsecase(gh<_i111.ManageWithdrawalsRepository>()));
  gh.factory<_i184.EditRejectReasonsUsecase>(() =>
      _i184.EditRejectReasonsUsecase(gh<_i111.ManageWithdrawalsRepository>()));
  gh.factory<_i185.GetRejectReasonsUsecase>(() =>
      _i185.GetRejectReasonsUsecase(gh<_i111.ManageWithdrawalsRepository>()));
  gh.factory<_i186.GetUserSeriesUsecase>(() =>
      _i186.GetUserSeriesUsecase(gh<_i111.ManageWithdrawalsRepository>()));
  gh.factory<_i187.GetWithdrawnDetailsUsecase>(() =>
      _i187.GetWithdrawnDetailsUsecase(
          gh<_i111.ManageWithdrawalsRepository>()));
  gh.factory<_i188.SetApproveSeriesUsecase>(() =>
      _i188.SetApproveSeriesUsecase(gh<_i111.ManageWithdrawalsRepository>()));
  gh.factory<_i189.UpdateSeriesUsecase>(
      () => _i189.UpdateSeriesUsecase(gh<_i111.ManageWithdrawalsRepository>()));
  gh.singleton<_i190.AppManagerCubit>(
      () => _i190.AppManagerCubit(gh<_i151.GetVersionUseCase>()));
  gh.factory<_i191.RegionsCubit>(
      () => _i191.RegionsCubit(gh<_i172.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i192.GetWaitingAgentsUsecase>(
      () => _i192.GetWaitingAgentsUsecase(gh<_i123.WaitingAgentsRepo>()));
  gh.factory<_i193.UsersCubit>(() => _i193.UsersCubit(
        gh<_i108.GetUsersUsecase>(),
        gh<_i38.ActionUserUsecase>(),
        gh<_i134.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i107.GetManagesForUserUsecase>(),
        gh<_i106.GetLevelsForUserUsecase>(),
        gh<_i105.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i194.CommunicationListBloc>(() =>
      _i194.CommunicationListBloc(gh<_i117.GetCommunicationListUsecase>()));
  gh.factory<_i195.AddParticipateCommentUsecase>(() =>
      _i195.AddParticipateCommentUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i196.AddParticipateUserUsecase>(() =>
      _i196.AddParticipateUserUsecase(gh<_i121.ParticipateListRepository>()));
  gh.factory<_i197.EditParticipateUserUsecase>(() =>
      _i197.EditParticipateUserUsecase(gh<_i121.ParticipateListRepository>()));
  gh.factory<_i198.GetInvoiceByIdUsecase>(
      () => _i198.GetInvoiceByIdUsecase(gh<_i121.ParticipateListRepository>()));
  gh.factory<_i199.ParticipateClientListUsecase>(() =>
      _i199.ParticipateClientListUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i200.ParticipateCommentListUsecase>(() =>
      _i200.ParticipateCommentListUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i201.ParticipateInvoiceListUsecase>(() =>
      _i201.ParticipateInvoiceListUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i202.ParticipateListUsecase>(() =>
      _i202.ParticipateListUsecase(gh<_i121.ParticipateListRepository>()));
  gh.factory<_i203.AgentsDistributorsCubit>(() => _i203.AgentsDistributorsCubit(
        gh<_i126.GetAgentsAndDistributorsUseCase>(),
        gh<_i125.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i204.LatestClientsUpdatesCubit>(() =>
      _i204.LatestClientsUpdatesCubit(gh<_i158.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i205.CancelScheduleUsecase>(
      () => _i205.CancelScheduleUsecase(gh<_i137.DatesTableRepo>()));
  gh.lazySingleton<_i206.ChangeDateToDonUsecase>(
      () => _i206.ChangeDateToDonUsecase(gh<_i137.DatesTableRepo>()));
  gh.lazySingleton<_i207.GetDateInstallationUsecase>(
      () => _i207.GetDateInstallationUsecase(gh<_i137.DatesTableRepo>()));
  gh.lazySingleton<_i208.GetInvoicesByClientForDateUsecase>(() =>
      _i208.GetInvoicesByClientForDateUsecase(gh<_i137.DatesTableRepo>()));
  gh.lazySingleton<_i209.GetSubscribedClientsUsecase>(
      () => _i209.GetSubscribedClientsUsecase(gh<_i137.DatesTableRepo>()));
  gh.lazySingleton<_i210.RescheduleDateUsecase>(
      () => _i210.RescheduleDateUsecase(gh<_i137.DatesTableRepo>()));
  gh.lazySingleton<_i211.ReturnScheduleVisitToOpenUsecase>(
      () => _i211.ReturnScheduleVisitToOpenUsecase(gh<_i137.DatesTableRepo>()));
  gh.factory<_i212.AgentsDistributorsProfileBloc>(
      () => _i212.AgentsDistributorsProfileBloc(
            gh<_i179.GetAgentClientListUsecase>(),
            gh<_i182.GetAgentInvoiceListUsecase>(),
            gh<_i198.GetInvoiceByIdUsecase>(),
            gh<_i180.GetAgentCommentsListUsecase>(),
            gh<_i176.AddAgentCommentUsecase>(),
            gh<_i177.DoneTrainingUsecase>(),
            gh<_i161.AddAgentDateUseCase>(),
            gh<_i181.GetAgentDatesListUsecase>(),
            gh<_i157.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i213.DatesTableCubit>(() => _i213.DatesTableCubit(
        gh<_i207.GetDateInstallationUsecase>(),
        gh<_i210.RescheduleDateUsecase>(),
        gh<_i206.ChangeDateToDonUsecase>(),
        gh<_i205.CancelScheduleUsecase>(),
        gh<_i211.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i209.GetSubscribedClientsUsecase>(),
        gh<_i208.GetInvoicesByClientForDateUsecase>(),
        gh<_i94.AddDateInstallUsecase>(),
      ));
  gh.factory<_i214.CompanyCubit>(() => _i214.CompanyCubit(
        gh<_i171.GetCommentUsecase>(),
        gh<_i170.AddCommentUsecase>(),
      ));
  gh.factory<_i215.InvoicesSectionCubit>(() => _i215.InvoicesSectionCubit(
        gh<_i79.GetInvoicesByPrivilegesUsecase>(),
        gh<_i126.GetAgentsAndDistributorsUseCase>(),
        gh<_i202.ParticipateListUsecase>(),
        gh<_i101.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i216.ManageWithdrawalsCubit>(
      () => _i216.ManageWithdrawalsCubit(
            gh<_i186.GetUserSeriesUsecase>(),
            gh<_i189.UpdateSeriesUsecase>(),
            gh<_i108.GetUsersUsecase>(),
            gh<_i129.GetWithdrawalsInvoicesUsecase>(),
            gh<_i130.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i188.SetApproveSeriesUsecase>(),
            gh<_i187.GetWithdrawnDetailsUsecase>(),
            gh<_i183.AddRejectReasonsUsecase>(),
            gh<_i185.GetRejectReasonsUsecase>(),
            gh<_i184.EditRejectReasonsUsecase>(),
            gh<_i128.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i217.ParticipateListBloc>(() => _i217.ParticipateListBloc(
        gh<_i202.ParticipateListUsecase>(),
        gh<_i196.AddParticipateUserUsecase>(),
        gh<_i197.EditParticipateUserUsecase>(),
        gh<_i199.ParticipateClientListUsecase>(),
        gh<_i201.ParticipateInvoiceListUsecase>(),
        gh<_i198.GetInvoiceByIdUsecase>(),
        gh<_i200.ParticipateCommentListUsecase>(),
        gh<_i195.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i218.WaitingAgentsCubit>(
      () => _i218.WaitingAgentsCubit(gh<_i192.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i219.AppModule {}
