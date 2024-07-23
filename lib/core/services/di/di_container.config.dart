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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i22;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i74;
import '../../../features/app/domain/repositories/app_repository.dart' as _i73;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i160;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i201;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i37;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i56;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i67;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i66;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i82;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i83;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i84;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i85;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i86;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i173;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i15;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i18;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i17;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i87;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i136;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i19;
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
    as _i161;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i65;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i55;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i23;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i106;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i105;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i128;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i205;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i30;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i47;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i46;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i48;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i104;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i44;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i78;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i77;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i96;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i97;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i98;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i99;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i100;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i101;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i102;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i169;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i69;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i118;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i117;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i182;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i202;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i31;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i58;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i57;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i144;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i145;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i184;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i36;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i89;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i88;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i162;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i163;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i186;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i24;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i72;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i71;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i175;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i176;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i177;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i178;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i183;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i20;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i35;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i34;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i38;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i107;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i108;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i109;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i110;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i204;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i21;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i114;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i113;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i194;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i195;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i137;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i196;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i197;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i139;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i138;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i198;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i199;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i200;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i218;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i25;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i93;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i92;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i148;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i149;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i150;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i129;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i151;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i155;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i130;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i152;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i153;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i154;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i156;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i157;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i158;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i159;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i171;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i26;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i91;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i90;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i180;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i181;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i217;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i45;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i62;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i61;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i103;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i81;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i174;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i29;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i43;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i42;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i167;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i207;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i41;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i64;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i76;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i95;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i116;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i75;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i94;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i115;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i187;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i170;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i164;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i134;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i166;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i188;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i190;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i191;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i192;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i193;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i135;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i165;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i172;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i215;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i206;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i27;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i80;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i79;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i111;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i112;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i131;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i16;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i60;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i59;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i119;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i120;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i127;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i121;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i122;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i123;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i124;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i125;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i126;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i185;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i68;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i147;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i146;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i208;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i209;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i210;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i211;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i212;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i213;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i214;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i216;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i63;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i133;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i132;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i203;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i219;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i28;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i40;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i39;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i140;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i141;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i142;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i143;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i168;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i179;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i70;
import 'di_container.dart' as _i220;

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
  gh.lazySingleton<_i16.ParticipatesListDatasource>(
      () => _i16.ParticipatesListDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i17.ClientsAcceptRepository>(() =>
      _i18.ClientsAcceptRepositoryImpl(gh<_i15.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i19.TicketsDataSource>(
      () => _i19.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i20.UsersDatasource>(
      () => _i20.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i21.ManageWithdrawalsDatasource>(
      () => _i21.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i22.AppDatasource>(
      () => _i22.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i23.CommunicationListDatasource>(
      () => _i23.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i24.PrivilegeDatasource>(
      () => _i24.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i25.ClientsListDatasource>(
      () => _i25.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i26.CommentCompanyDatasource>(
      () => _i26.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i27.LinkDatasource>(
      () => _i27.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.TaskDatasource>(
      () => _i28.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i29.LatestClientsUpdatesDatasource>(
      () => _i29.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.CitiesDatasource>(
      () => _i30.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i31.AdvancedConfigsDatasource>(
      () => _i31.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i32.TicketsRepo>(
      () => _i33.TicketsRepoImpl(gh<_i19.TicketsDataSource>()));
  gh.lazySingleton<_i34.UsersRepository>(
      () => _i35.UsersRepositoryImpl(gh<_i20.UsersDatasource>()));
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
  gh.lazySingleton<_i59.ParticipateListRepository>(() =>
      _i60.ParticipateListRepositoryImpl(
          gh<_i16.ParticipatesListDatasource>()));
  gh.lazySingleton<_i61.InvoicesSectionRepo>(
      () => _i62.InvoicesTabRepoImpl(gh<_i45.InvoicesTabDataSource>()));
  gh.lazySingleton<_i63.WaitingAgentsDataSource>(
      () => _i63.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i64.AgentsDistributorsProfileDataSource>(() =>
      _i64.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i65.EditTicketCubit>(() => _i65.EditTicketCubit(
        gh<_i50.EditTicketTypeUseCase>(),
        gh<_i54.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i66.LoginRepo>(() => _i67.LoginRepoImpl(
        gh<_i56.LoginRemoteDataSource>(),
        gh<_i37.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i68.DatesTableDataSource>(
      () => _i68.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i69.RegionsDatasource>(
      () => _i69.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i70.LocationServices>(
      () => _i70.LocationServices(gh<_i8.Location>()));
  gh.factory<_i71.PrivilegeRepository>(
      () => _i72.PrivilegeRepositoryImpl(gh<_i24.PrivilegeDatasource>()));
  gh.factory<_i73.AppRepository>(
      () => _i74.AppRepositoryImpl(gh<_i22.AppDatasource>()));
  gh.lazySingleton<_i75.AgentsDistributorsActionsRepo>(() =>
      _i76.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i77.SupportTabRepo>(
      () => _i78.SupportTabRepoImpl(gh<_i44.SupportTabDataSource>()));
  gh.factory<_i79.LinksImportantRepository>(
      () => _i80.LinkRepositoryImpl(gh<_i27.LinkDatasource>()));
  gh.lazySingleton<_i81.GetInvoicesByPrivilegesUsecase>(() =>
      _i81.GetInvoicesByPrivilegesUsecase(gh<_i61.InvoicesSectionRepo>()));
  gh.lazySingleton<_i82.CacheTokenUsecase>(
      () => _i82.CacheTokenUsecase(gh<_i66.LoginRepo>()));
  gh.lazySingleton<_i83.GetTokenUsecase>(
      () => _i83.GetTokenUsecase(gh<_i66.LoginRepo>()));
  gh.lazySingleton<_i84.LoginUsecase>(
      () => _i84.LoginUsecase(gh<_i66.LoginRepo>()));
  gh.lazySingleton<_i85.ValidateTokenUsecase>(
      () => _i85.ValidateTokenUsecase(gh<_i66.LoginRepo>()));
  gh.lazySingleton<_i86.VerifyOtpUsecase>(
      () => _i86.VerifyOtpUsecase(gh<_i66.LoginRepo>()));
  gh.lazySingleton<_i87.GetClientsAcceptUseCase>(
      () => _i87.GetClientsAcceptUseCase(gh<_i17.ClientsAcceptRepository>()));
  gh.lazySingleton<_i88.GeneralConfigsRepository>(() =>
      _i89.GeneralConfigsRepositoryImpl(gh<_i36.GeneralConfigsDatasource>()));
  gh.factory<_i90.CompanyRepository>(
      () => _i91.CompanyRepositoryImpl(gh<_i26.CommentCompanyDatasource>()));
  gh.factory<_i92.ClientsListRepository>(
      () => _i93.ClientsListRepositoryImpl(gh<_i25.ClientsListDatasource>()));
  gh.lazySingleton<_i94.AgentsDistributorsProfileRepo>(() =>
      _i95.AgentsDistributorsProfileRepoImpl(
          gh<_i64.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i96.AddDateInstallUsecase>(
      () => _i96.AddDateInstallUsecase(gh<_i77.SupportTabRepo>()));
  gh.lazySingleton<_i97.CancelDateInstallUsecase>(
      () => _i97.CancelDateInstallUsecase(gh<_i77.SupportTabRepo>()));
  gh.lazySingleton<_i98.GetInvoiceByClientUsecase>(
      () => _i98.GetInvoiceByClientUsecase(gh<_i77.SupportTabRepo>()));
  gh.lazySingleton<_i99.ReceiveDeviceUsecase>(
      () => _i99.ReceiveDeviceUsecase(gh<_i77.SupportTabRepo>()));
  gh.lazySingleton<_i100.ReturnInvoiceApproveUsecase>(
      () => _i100.ReturnInvoiceApproveUsecase(gh<_i77.SupportTabRepo>()));
  gh.lazySingleton<_i101.SetDateDoneUsecase>(
      () => _i101.SetDateDoneUsecase(gh<_i77.SupportTabRepo>()));
  gh.lazySingleton<_i102.SetReadyInstallUsecase>(
      () => _i102.SetReadyInstallUsecase(gh<_i77.SupportTabRepo>()));
  gh.lazySingleton<_i103.GetAllUsersUseCase>(
      () => _i103.GetAllUsersUseCase(gh<_i61.InvoicesSectionRepo>()));
  gh.singleton<_i104.CitiesCubit>(
      () => _i104.CitiesCubit(gh<_i48.GetCitiesUseCase>()));
  gh.factory<_i105.CommunicationListRepository>(() =>
      _i106.CommunicationListRepositoryImpl(
          gh<_i23.CommunicationListDatasource>()));
  gh.lazySingleton<_i107.GetBranchesForUserUsecase>(
      () => _i107.GetBranchesForUserUsecase(gh<_i34.UsersRepository>()));
  gh.lazySingleton<_i108.GetLevelsForUserUsecase>(
      () => _i108.GetLevelsForUserUsecase(gh<_i34.UsersRepository>()));
  gh.lazySingleton<_i109.GetManagesForUserUsecase>(
      () => _i109.GetManagesForUserUsecase(gh<_i34.UsersRepository>()));
  gh.factory<_i110.GetUsersUsecase>(
      () => _i110.GetUsersUsecase(gh<_i34.UsersRepository>()));
  gh.factory<_i111.ActionLinkUsecase>(
      () => _i111.ActionLinkUsecase(gh<_i79.LinksImportantRepository>()));
  gh.factory<_i112.GetLinkUsecase>(
      () => _i112.GetLinkUsecase(gh<_i79.LinksImportantRepository>()));
  gh.lazySingleton<_i113.ManageWithdrawalsRepository>(() =>
      _i114.ManageWithdrawalsRepositoryImpl(
          gh<_i21.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i115.AgentsDistributorsRepo>(() =>
      _i116.AgentsDistributorsRepoImpl(
          gh<_i41.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i117.RegionsRepository>(
      () => _i118.RegionsRepositoryImpl(gh<_i69.RegionsDatasource>()));
  gh.factory<_i119.AddParticipateCommentUsecase>(() =>
      _i119.AddParticipateCommentUsecase(gh<_i59.ParticipateListRepository>()));
  gh.factory<_i120.AddParticipateUserUsecase>(() =>
      _i120.AddParticipateUserUsecase(gh<_i59.ParticipateListRepository>()));
  gh.factory<_i121.EditParticipateUserUsecase>(() =>
      _i121.EditParticipateUserUsecase(gh<_i59.ParticipateListRepository>()));
  gh.factory<_i122.GetInvoiceByIdUsecase>(
      () => _i122.GetInvoiceByIdUsecase(gh<_i59.ParticipateListRepository>()));
  gh.factory<_i123.ParticipateClientListUsecase>(() =>
      _i123.ParticipateClientListUsecase(gh<_i59.ParticipateListRepository>()));
  gh.factory<_i124.ParticipateCommentListUsecase>(() =>
      _i124.ParticipateCommentListUsecase(
          gh<_i59.ParticipateListRepository>()));
  gh.factory<_i125.ParticipateInvoiceListUsecase>(() =>
      _i125.ParticipateInvoiceListUsecase(
          gh<_i59.ParticipateListRepository>()));
  gh.factory<_i126.ParticipateListUsecase>(
      () => _i126.ParticipateListUsecase(gh<_i59.ParticipateListRepository>()));
  gh.lazySingleton<_i127.ChangeParticipateStatusUsecase>(() =>
      _i127.ChangeParticipateStatusUsecase(
          gh<_i59.ParticipateListRepository>()));
  gh.factory<_i128.GetCommunicationListUsecase>(() =>
      _i128.GetCommunicationListUsecase(
          gh<_i105.CommunicationListRepository>()));
  gh.lazySingleton<_i129.CrudClientSupportFilesUsecase>(() =>
      _i129.CrudClientSupportFilesUsecase(
          repository: gh<_i92.ClientsListRepository>()));
  gh.lazySingleton<_i130.GetClientSupportFilesUsecase>(() =>
      _i130.GetClientSupportFilesUsecase(
          repository: gh<_i92.ClientsListRepository>()));
  gh.factory<_i131.LinkCubit>(() => _i131.LinkCubit(
        gh<_i112.GetLinkUsecase>(),
        gh<_i111.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i132.WaitingAgentsRepo>(
      () => _i133.WaitingAgentsRepoImpl(gh<_i63.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i134.ChangeStateAgentUseCase>(
      () => _i134.ChangeStateAgentUseCase(gh<_i115.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i135.GetAgentsAndDistributorsUseCase>(() =>
      _i135.GetAgentsAndDistributorsUseCase(
          gh<_i115.AgentsDistributorsRepo>()));
  gh.factory<_i136.ClientsAcceptCubit>(
      () => _i136.ClientsAcceptCubit(gh<_i87.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i137.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i137.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i113.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i138.GetWithdrawalsInvoicesUsecase>(() =>
      _i138.GetWithdrawalsInvoicesUsecase(
          gh<_i113.ManageWithdrawalsRepository>()));
  gh.factory<_i139.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i139.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i113.ManageWithdrawalsRepository>()));
  gh.factory<_i140.AddTaskUsecase>(
      () => _i140.AddTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i141.ChangeStatusTaskUsecase>(
      () => _i141.ChangeStatusTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i142.FilterTaskUsecase>(
      () => _i142.FilterTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i143.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i143.GetUsersByDepartmentAndRegionUsecase(gh<_i39.TaskRepository>()));
  gh.lazySingleton<_i144.EditAdvancedConfigsUsecase>(() =>
      _i144.EditAdvancedConfigsUsecase(gh<_i57.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i145.GetAdvancedConfigsUsecase>(() =>
      _i145.GetAdvancedConfigsUsecase(gh<_i57.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i146.DatesTableRepo>(
      () => _i147.DatesTableRepoImpl(gh<_i68.DatesTableDataSource>()));
  gh.factory<_i148.AddClientUserUsecase>(
      () => _i148.AddClientUserUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i149.ApproveRejectClientUsecase>(
      () => _i149.ApproveRejectClientUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i150.ChangeTypeClientUsecase>(
      () => _i150.ChangeTypeClientUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i151.EditClientUserUsecase>(
      () => _i151.EditClientUserUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i152.GetClientsListByRegionUseCase>(() =>
      _i152.GetClientsListByRegionUseCase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i153.GetClientsListByUserUseCase>(() =>
      _i153.GetClientsListByUserUseCase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i154.GetClientsWithFilterUserUsecase>(() =>
      _i154.GetClientsWithFilterUserUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i155.GetClientMarketingReportUsecase>(() =>
      _i155.GetClientMarketingReportUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i156.GetRecommendedClientsUsecase>(() =>
      _i156.GetRecommendedClientsUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i157.GetSimilarClientsUsecase>(
      () => _i157.GetSimilarClientsUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i158.ReceiveClientUserUsecase>(
      () => _i158.ReceiveClientUserUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i159.TransferClientUserUsecase>(
      () => _i159.TransferClientUserUsecase(gh<_i92.ClientsListRepository>()));
  gh.factory<_i160.GetVersionUseCase>(
      () => _i160.GetVersionUseCase(gh<_i73.AppRepository>()));
  gh.factory<_i161.AddTicketCubit>(
      () => _i161.AddTicketCubit(gh<_i49.AddTicketUseCase>()));
  gh.lazySingleton<_i162.EditGeneralConfigsUsecase>(() =>
      _i162.EditGeneralConfigsUsecase(gh<_i88.GeneralConfigsRepository>()));
  gh.lazySingleton<_i163.GetGeneralConfigsUsecase>(() =>
      _i163.GetGeneralConfigsUsecase(gh<_i88.GeneralConfigsRepository>()));
  gh.lazySingleton<_i164.AddAgentUseCase>(
      () => _i164.AddAgentUseCase(gh<_i75.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i165.UpdateAgentUseCase>(
      () => _i165.UpdateAgentUseCase(gh<_i75.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i166.CrudAgentSupportFilesUsecase>(() =>
      _i166.CrudAgentSupportFilesUsecase(
          gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i167.GetLatestClientsUseCase>(() =>
      _i167.GetLatestClientsUseCase(gh<_i42.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i168.TaskCubit>(() => _i168.TaskCubit(
        gh<_i140.AddTaskUsecase>(),
        gh<_i142.FilterTaskUsecase>(),
        gh<_i141.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i169.SupportTabCubit>(() => _i169.SupportTabCubit(
        gh<_i98.GetInvoiceByClientUsecase>(),
        gh<_i96.AddDateInstallUsecase>(),
        gh<_i101.SetDateDoneUsecase>(),
        gh<_i102.SetReadyInstallUsecase>(),
        gh<_i100.ReturnInvoiceApproveUsecase>(),
        gh<_i99.ReceiveDeviceUsecase>(),
        gh<_i97.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i170.AddAgentDateUseCase>(() =>
      _i170.AddAgentDateUseCase(gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.factory<_i171.ClientsListBloc>(() => _i171.ClientsListBloc(
        gh<_i154.GetClientsWithFilterUserUsecase>(),
        gh<_i156.GetRecommendedClientsUsecase>(),
        gh<_i148.AddClientUserUsecase>(),
        gh<_i151.EditClientUserUsecase>(),
        gh<_i150.ChangeTypeClientUsecase>(),
        gh<_i157.GetSimilarClientsUsecase>(),
        gh<_i149.ApproveRejectClientUsecase>(),
        gh<_i129.CrudClientSupportFilesUsecase>(),
        gh<_i130.GetClientSupportFilesUsecase>(),
        gh<_i159.TransferClientUserUsecase>(),
        gh<_i158.ReceiveClientUserUsecase>(),
        gh<_i155.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i172.AgentsDistributorsActionsCubit>(
      () => _i172.AgentsDistributorsActionsCubit(
            gh<_i48.GetCitiesUseCase>(),
            gh<_i164.AddAgentUseCase>(),
            gh<_i165.UpdateAgentUseCase>(),
          ));
  gh.factory<_i173.LoginCubit>(() => _i173.LoginCubit(
        gh<_i84.LoginUsecase>(),
        gh<_i86.VerifyOtpUsecase>(),
        gh<_i82.CacheTokenUsecase>(),
        gh<_i83.GetTokenUsecase>(),
        gh<_i85.ValidateTokenUsecase>(),
      ));
  gh.factory<_i174.InvoicesSectionCubit>(() => _i174.InvoicesSectionCubit(
        gh<_i81.GetInvoicesByPrivilegesUsecase>(),
        gh<_i135.GetAgentsAndDistributorsUseCase>(),
        gh<_i126.ParticipateListUsecase>(),
        gh<_i103.GetAllUsersUseCase>(),
      ));
  gh.factory<_i175.AddLevelUsecase>(
      () => _i175.AddLevelUsecase(gh<_i71.PrivilegeRepository>()));
  gh.factory<_i176.GetLevelsUsecase>(
      () => _i176.GetLevelsUsecase(gh<_i71.PrivilegeRepository>()));
  gh.factory<_i177.GetPrivilegesUsecase>(
      () => _i177.GetPrivilegesUsecase(gh<_i71.PrivilegeRepository>()));
  gh.factory<_i178.UpdatePrivilegeUsecase>(
      () => _i178.UpdatePrivilegeUsecase(gh<_i71.PrivilegeRepository>()));
  gh.factory<_i179.AttachmentsRowCubit>(() => _i179.AttachmentsRowCubit(
        gh<_i130.GetClientSupportFilesUsecase>(),
        gh<_i129.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i180.AddCommentUsecase>(
      () => _i180.AddCommentUsecase(gh<_i90.CompanyRepository>()));
  gh.factory<_i181.GetCommentUsecase>(
      () => _i181.GetCommentUsecase(gh<_i90.CompanyRepository>()));
  gh.lazySingleton<_i182.GetRegionsByIdCountryUseCase>(
      () => _i182.GetRegionsByIdCountryUseCase(gh<_i117.RegionsRepository>()));
  gh.lazySingleton<_i183.PrivilegeCubit>(() => _i183.PrivilegeCubit(
        gh<_i176.GetLevelsUsecase>(),
        gh<_i177.GetPrivilegesUsecase>(),
        gh<_i178.UpdatePrivilegeUsecase>(),
        gh<_i175.AddLevelUsecase>(),
      ));
  gh.factory<_i184.AdvancedCofigsCubit>(() => _i184.AdvancedCofigsCubit(
        gh<_i145.GetAdvancedConfigsUsecase>(),
        gh<_i144.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i185.ParticipateListBloc>(() => _i185.ParticipateListBloc(
        gh<_i126.ParticipateListUsecase>(),
        gh<_i120.AddParticipateUserUsecase>(),
        gh<_i121.EditParticipateUserUsecase>(),
        gh<_i123.ParticipateClientListUsecase>(),
        gh<_i125.ParticipateInvoiceListUsecase>(),
        gh<_i122.GetInvoiceByIdUsecase>(),
        gh<_i124.ParticipateCommentListUsecase>(),
        gh<_i119.AddParticipateCommentUsecase>(),
        gh<_i127.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i186.GeneralCofigsCubit>(() => _i186.GeneralCofigsCubit(
        gh<_i163.GetGeneralConfigsUsecase>(),
        gh<_i162.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i187.AddAgentCommentUsecase>(() =>
      _i187.AddAgentCommentUsecase(gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i188.DoneTrainingUsecase>(() =>
      _i188.DoneTrainingUsecase(gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i189.GetAgentUsecase>(
      () => _i189.GetAgentUsecase(gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i190.GetAgentClientListUsecase>(() =>
      _i190.GetAgentClientListUsecase(
          gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i191.GetAgentCommentsListUsecase>(() =>
      _i191.GetAgentCommentsListUsecase(
          gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i192.GetAgentDatesListUsecase>(() =>
      _i192.GetAgentDatesListUsecase(gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i193.GetAgentInvoiceListUsecase>(() =>
      _i193.GetAgentInvoiceListUsecase(
          gh<_i94.AgentsDistributorsProfileRepo>()));
  gh.factory<_i194.AddRejectReasonsUsecase>(() =>
      _i194.AddRejectReasonsUsecase(gh<_i113.ManageWithdrawalsRepository>()));
  gh.factory<_i195.EditRejectReasonsUsecase>(() =>
      _i195.EditRejectReasonsUsecase(gh<_i113.ManageWithdrawalsRepository>()));
  gh.factory<_i196.GetRejectReasonsUsecase>(() =>
      _i196.GetRejectReasonsUsecase(gh<_i113.ManageWithdrawalsRepository>()));
  gh.factory<_i197.GetUserSeriesUsecase>(() =>
      _i197.GetUserSeriesUsecase(gh<_i113.ManageWithdrawalsRepository>()));
  gh.factory<_i198.GetWithdrawnDetailsUsecase>(() =>
      _i198.GetWithdrawnDetailsUsecase(
          gh<_i113.ManageWithdrawalsRepository>()));
  gh.factory<_i199.SetApproveSeriesUsecase>(() =>
      _i199.SetApproveSeriesUsecase(gh<_i113.ManageWithdrawalsRepository>()));
  gh.factory<_i200.UpdateSeriesUsecase>(
      () => _i200.UpdateSeriesUsecase(gh<_i113.ManageWithdrawalsRepository>()));
  gh.singleton<_i201.AppManagerCubit>(
      () => _i201.AppManagerCubit(gh<_i160.GetVersionUseCase>()));
  gh.factory<_i202.RegionsCubit>(
      () => _i202.RegionsCubit(gh<_i182.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i203.GetWaitingAgentsUsecase>(
      () => _i203.GetWaitingAgentsUsecase(gh<_i132.WaitingAgentsRepo>()));
  gh.factory<_i204.UsersCubit>(() => _i204.UsersCubit(
        gh<_i110.GetUsersUsecase>(),
        gh<_i38.ActionUserUsecase>(),
        gh<_i143.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i109.GetManagesForUserUsecase>(),
        gh<_i108.GetLevelsForUserUsecase>(),
        gh<_i107.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i205.CommunicationListBloc>(() =>
      _i205.CommunicationListBloc(gh<_i128.GetCommunicationListUsecase>()));
  gh.factory<_i206.AgentsDistributorsCubit>(() => _i206.AgentsDistributorsCubit(
        gh<_i135.GetAgentsAndDistributorsUseCase>(),
        gh<_i134.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i207.LatestClientsUpdatesCubit>(() =>
      _i207.LatestClientsUpdatesCubit(gh<_i167.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i208.CancelScheduleUsecase>(
      () => _i208.CancelScheduleUsecase(gh<_i146.DatesTableRepo>()));
  gh.lazySingleton<_i209.ChangeDateToDonUsecase>(
      () => _i209.ChangeDateToDonUsecase(gh<_i146.DatesTableRepo>()));
  gh.lazySingleton<_i210.GetDateInstallationUsecase>(
      () => _i210.GetDateInstallationUsecase(gh<_i146.DatesTableRepo>()));
  gh.lazySingleton<_i211.GetInvoicesByClientForDateUsecase>(() =>
      _i211.GetInvoicesByClientForDateUsecase(gh<_i146.DatesTableRepo>()));
  gh.lazySingleton<_i212.GetSubscribedClientsUsecase>(
      () => _i212.GetSubscribedClientsUsecase(gh<_i146.DatesTableRepo>()));
  gh.lazySingleton<_i213.RescheduleDateUsecase>(
      () => _i213.RescheduleDateUsecase(gh<_i146.DatesTableRepo>()));
  gh.lazySingleton<_i214.ReturnScheduleVisitToOpenUsecase>(
      () => _i214.ReturnScheduleVisitToOpenUsecase(gh<_i146.DatesTableRepo>()));
  gh.factory<_i215.AgentsDistributorsProfileBloc>(
      () => _i215.AgentsDistributorsProfileBloc(
            gh<_i190.GetAgentClientListUsecase>(),
            gh<_i193.GetAgentInvoiceListUsecase>(),
            gh<_i122.GetInvoiceByIdUsecase>(),
            gh<_i191.GetAgentCommentsListUsecase>(),
            gh<_i187.AddAgentCommentUsecase>(),
            gh<_i188.DoneTrainingUsecase>(),
            gh<_i170.AddAgentDateUseCase>(),
            gh<_i192.GetAgentDatesListUsecase>(),
            gh<_i166.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i216.DatesTableCubit>(() => _i216.DatesTableCubit(
        gh<_i210.GetDateInstallationUsecase>(),
        gh<_i213.RescheduleDateUsecase>(),
        gh<_i209.ChangeDateToDonUsecase>(),
        gh<_i208.CancelScheduleUsecase>(),
        gh<_i214.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i212.GetSubscribedClientsUsecase>(),
        gh<_i211.GetInvoicesByClientForDateUsecase>(),
        gh<_i96.AddDateInstallUsecase>(),
      ));
  gh.factory<_i217.CompanyCubit>(() => _i217.CompanyCubit(
        gh<_i181.GetCommentUsecase>(),
        gh<_i180.AddCommentUsecase>(),
      ));
  gh.factory<_i218.ManageWithdrawalsCubit>(() => _i218.ManageWithdrawalsCubit(
        gh<_i197.GetUserSeriesUsecase>(),
        gh<_i200.UpdateSeriesUsecase>(),
        gh<_i110.GetUsersUsecase>(),
        gh<_i138.GetWithdrawalsInvoicesUsecase>(),
        gh<_i139.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i199.SetApproveSeriesUsecase>(),
        gh<_i198.GetWithdrawnDetailsUsecase>(),
        gh<_i194.AddRejectReasonsUsecase>(),
        gh<_i196.GetRejectReasonsUsecase>(),
        gh<_i195.EditRejectReasonsUsecase>(),
        gh<_i137.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i219.WaitingAgentsCubit>(
      () => _i219.WaitingAgentsCubit(gh<_i203.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i220.AppModule {}
