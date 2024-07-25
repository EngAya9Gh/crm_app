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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i23;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i79;
import '../../../features/app/domain/repositories/app_repository.dart' as _i78;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i165;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i206;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i41;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i60;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i72;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i71;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i87;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i88;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i89;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i90;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i91;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i178;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i16;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i19;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i18;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i92;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i141;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i20;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i34;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i33;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i53;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i54;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i55;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i57;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i56;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i58;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i166;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i70;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i59;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i24;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i111;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i110;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i133;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i210;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i31;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i51;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i50;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i52;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i109;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i48;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i83;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i82;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i101;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i102;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i103;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i104;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i105;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i106;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i107;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i174;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i74;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i123;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i122;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i187;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i207;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i32;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i62;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i61;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i149;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i150;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i189;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i40;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i94;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i93;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i167;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i168;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i191;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i25;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i77;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i76;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i180;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i181;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i182;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i183;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i188;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i21;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i39;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i38;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i42;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i112;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i113;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i114;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i115;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i209;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i22;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i119;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i118;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i199;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i200;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i142;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i201;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i202;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i144;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i143;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i203;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i204;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i205;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i223;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i26;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i98;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i97;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i153;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i154;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i155;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i134;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i156;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i160;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i135;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i157;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i158;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i159;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i161;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i162;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i163;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i164;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i176;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i27;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i96;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i95;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i185;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i186;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i222;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i49;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i66;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i65;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i108;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i86;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i179;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i30;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i47;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i46;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i172;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i212;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i15;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i45;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i69;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i81;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i100;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i121;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i80;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i99;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i120;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i192;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i169;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i139;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i193;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i194;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i195;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i196;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i197;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i198;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i140;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i170;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i177;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i220;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i211;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i28;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i85;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i84;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i116;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i117;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i136;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i17;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i64;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i63;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i124;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i125;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i132;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i126;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i127;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i128;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i129;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i130;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i131;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i190;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i73;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i152;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i151;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i213;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i214;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i215;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i216;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i217;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i218;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i219;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i221;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i36;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i35;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i37;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i67;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i68;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i138;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i137;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i208;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i224;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i29;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i44;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i43;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i145;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i146;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i147;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i148;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i173;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i184;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i75;
import 'di_container.dart' as _i225;

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
  gh.lazySingleton<_i13.SupportClientsAcceptDatasource>(
      () => _i13.SupportClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingletonAsync<_i11.CacheServices>(() async =>
      _i14.PrefsConsumer(await gh.getAsync<_i3.SharedPreferences>()));
  gh.lazySingleton<_i15.AgentsDistributorsActionsDataSource>(() =>
      _i15.AgentsDistributorsActionsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i16.ClientsAcceptDatasource>(
      () => _i16.ClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i17.ParticipatesListDatasource>(
      () => _i17.ParticipatesListDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i18.ClientsAcceptRepository>(() =>
      _i19.ClientsAcceptRepositoryImpl(gh<_i16.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i20.TicketsDataSource>(
      () => _i20.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i21.UsersDatasource>(
      () => _i21.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i22.ManageWithdrawalsDatasource>(
      () => _i22.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i23.AppDatasource>(
      () => _i23.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i24.CommunicationListDatasource>(
      () => _i24.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i25.PrivilegeDatasource>(
      () => _i25.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i26.ClientsListDatasource>(
      () => _i26.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i27.CommentCompanyDatasource>(
      () => _i27.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.LinkDatasource>(
      () => _i28.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i29.TaskDatasource>(
      () => _i29.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.LatestClientsUpdatesDatasource>(
      () => _i30.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i31.CitiesDatasource>(
      () => _i31.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i32.AdvancedConfigsDatasource>(
      () => _i32.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i33.TicketsRepo>(
      () => _i34.TicketsRepoImpl(gh<_i20.TicketsDataSource>()));
  gh.lazySingleton<_i35.SupportClientsAcceptRepository>(() =>
      _i36.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i37.GetSupportClientsAcceptUseCase>(() =>
      _i37.GetSupportClientsAcceptUseCase(
          gh<_i35.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i38.UsersRepository>(
      () => _i39.UsersRepositoryImpl(gh<_i21.UsersDatasource>()));
  gh.lazySingleton<_i40.GeneralConfigsDatasource>(
      () => _i40.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i41.LoginLocalDataSource>(() =>
      _i41.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i42.ActionUserUsecase>(
      () => _i42.ActionUserUsecase(gh<_i38.UsersRepository>()));
  gh.factory<_i43.TaskRepository>(
      () => _i44.TaskRepositoryImpl(gh<_i29.TaskDatasource>()));
  gh.lazySingleton<_i45.AgentsDistributorsDataSource>(
      () => _i45.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i46.LatestClientsUpdatesRepository>(() =>
      _i47.LatestClientsUpdatesRepositoryImpl(
          gh<_i30.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i48.SupportTabDataSource>(
      () => _i48.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i49.InvoicesTabDataSource>(
      () => _i49.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i50.CitiesRepository>(
      () => _i51.CitiesRepositoryImpl(gh<_i31.CitiesDatasource>()));
  gh.lazySingleton<_i52.GetCitiesUseCase>(
      () => _i52.GetCitiesUseCase(gh<_i50.CitiesRepository>()));
  gh.lazySingleton<_i53.AddTicketUseCase>(
      () => _i53.AddTicketUseCase(gh<_i33.TicketsRepo>()));
  gh.lazySingleton<_i54.EditTicketTypeUseCase>(
      () => _i54.EditTicketTypeUseCase(gh<_i33.TicketsRepo>()));
  gh.lazySingleton<_i55.GetClientTicketsUseCase>(
      () => _i55.GetClientTicketsUseCase(gh<_i33.TicketsRepo>()));
  gh.lazySingleton<_i56.GetTicketsUseCase>(
      () => _i56.GetTicketsUseCase(gh<_i33.TicketsRepo>()));
  gh.lazySingleton<_i57.GetTicketByIdUseCase>(
      () => _i57.GetTicketByIdUseCase(gh<_i33.TicketsRepo>()));
  gh.lazySingleton<_i58.TransferTicketUseCase>(
      () => _i58.TransferTicketUseCase(gh<_i33.TicketsRepo>()));
  gh.factory<_i59.TicketsCubit>(() => _i59.TicketsCubit(
        gh<_i56.GetTicketsUseCase>(),
        gh<_i57.GetTicketByIdUseCase>(),
        gh<_i55.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i60.LoginRemoteDataSource>(
      () => _i60.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i61.AdvancedConfigsRepository>(() =>
      _i62.AdvancedConfigsRepositoryImpl(gh<_i32.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i63.ParticipateListRepository>(() =>
      _i64.ParticipateListRepositoryImpl(
          gh<_i17.ParticipatesListDatasource>()));
  gh.lazySingleton<_i65.InvoicesSectionRepo>(
      () => _i66.InvoicesTabRepoImpl(gh<_i49.InvoicesTabDataSource>()));
  gh.factory<_i67.SupportClientsAcceptCubit>(() =>
      _i67.SupportClientsAcceptCubit(
          gh<_i37.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i68.WaitingAgentsDataSource>(
      () => _i68.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i69.AgentsDistributorsProfileDataSource>(() =>
      _i69.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i70.EditTicketCubit>(() => _i70.EditTicketCubit(
        gh<_i54.EditTicketTypeUseCase>(),
        gh<_i58.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i71.LoginRepo>(() => _i72.LoginRepoImpl(
        gh<_i60.LoginRemoteDataSource>(),
        gh<_i41.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i73.DatesTableDataSource>(
      () => _i73.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i74.RegionsDatasource>(
      () => _i74.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i75.LocationServices>(
      () => _i75.LocationServices(gh<_i8.Location>()));
  gh.factory<_i76.PrivilegeRepository>(
      () => _i77.PrivilegeRepositoryImpl(gh<_i25.PrivilegeDatasource>()));
  gh.factory<_i78.AppRepository>(
      () => _i79.AppRepositoryImpl(gh<_i23.AppDatasource>()));
  gh.lazySingleton<_i80.AgentsDistributorsActionsRepo>(() =>
      _i81.AgentsDistributorsActionsRepoImpl(
          gh<_i15.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i82.SupportTabRepo>(
      () => _i83.SupportTabRepoImpl(gh<_i48.SupportTabDataSource>()));
  gh.factory<_i84.LinksImportantRepository>(
      () => _i85.LinkRepositoryImpl(gh<_i28.LinkDatasource>()));
  gh.lazySingleton<_i86.GetInvoicesByPrivilegesUsecase>(() =>
      _i86.GetInvoicesByPrivilegesUsecase(gh<_i65.InvoicesSectionRepo>()));
  gh.lazySingleton<_i87.CacheTokenUsecase>(
      () => _i87.CacheTokenUsecase(gh<_i71.LoginRepo>()));
  gh.lazySingleton<_i88.GetTokenUsecase>(
      () => _i88.GetTokenUsecase(gh<_i71.LoginRepo>()));
  gh.lazySingleton<_i89.LoginUsecase>(
      () => _i89.LoginUsecase(gh<_i71.LoginRepo>()));
  gh.lazySingleton<_i90.ValidateTokenUsecase>(
      () => _i90.ValidateTokenUsecase(gh<_i71.LoginRepo>()));
  gh.lazySingleton<_i91.VerifyOtpUsecase>(
      () => _i91.VerifyOtpUsecase(gh<_i71.LoginRepo>()));
  gh.lazySingleton<_i92.GetClientsAcceptUseCase>(
      () => _i92.GetClientsAcceptUseCase(gh<_i18.ClientsAcceptRepository>()));
  gh.lazySingleton<_i93.GeneralConfigsRepository>(() =>
      _i94.GeneralConfigsRepositoryImpl(gh<_i40.GeneralConfigsDatasource>()));
  gh.factory<_i95.CompanyRepository>(
      () => _i96.CompanyRepositoryImpl(gh<_i27.CommentCompanyDatasource>()));
  gh.factory<_i97.ClientsListRepository>(
      () => _i98.ClientsListRepositoryImpl(gh<_i26.ClientsListDatasource>()));
  gh.lazySingleton<_i99.AgentsDistributorsProfileRepo>(() =>
      _i100.AgentsDistributorsProfileRepoImpl(
          gh<_i69.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i101.AddDateInstallUsecase>(
      () => _i101.AddDateInstallUsecase(gh<_i82.SupportTabRepo>()));
  gh.lazySingleton<_i102.CancelDateInstallUsecase>(
      () => _i102.CancelDateInstallUsecase(gh<_i82.SupportTabRepo>()));
  gh.lazySingleton<_i103.GetInvoiceByClientUsecase>(
      () => _i103.GetInvoiceByClientUsecase(gh<_i82.SupportTabRepo>()));
  gh.lazySingleton<_i104.ReceiveDeviceUsecase>(
      () => _i104.ReceiveDeviceUsecase(gh<_i82.SupportTabRepo>()));
  gh.lazySingleton<_i105.ReturnInvoiceApproveUsecase>(
      () => _i105.ReturnInvoiceApproveUsecase(gh<_i82.SupportTabRepo>()));
  gh.lazySingleton<_i106.SetDateDoneUsecase>(
      () => _i106.SetDateDoneUsecase(gh<_i82.SupportTabRepo>()));
  gh.lazySingleton<_i107.SetReadyInstallUsecase>(
      () => _i107.SetReadyInstallUsecase(gh<_i82.SupportTabRepo>()));
  gh.lazySingleton<_i108.GetAllUsersUseCase>(
      () => _i108.GetAllUsersUseCase(gh<_i65.InvoicesSectionRepo>()));
  gh.singleton<_i109.CitiesCubit>(
      () => _i109.CitiesCubit(gh<_i52.GetCitiesUseCase>()));
  gh.factory<_i110.CommunicationListRepository>(() =>
      _i111.CommunicationListRepositoryImpl(
          gh<_i24.CommunicationListDatasource>()));
  gh.lazySingleton<_i112.GetBranchesForUserUsecase>(
      () => _i112.GetBranchesForUserUsecase(gh<_i38.UsersRepository>()));
  gh.lazySingleton<_i113.GetLevelsForUserUsecase>(
      () => _i113.GetLevelsForUserUsecase(gh<_i38.UsersRepository>()));
  gh.lazySingleton<_i114.GetManagesForUserUsecase>(
      () => _i114.GetManagesForUserUsecase(gh<_i38.UsersRepository>()));
  gh.factory<_i115.GetUsersUsecase>(
      () => _i115.GetUsersUsecase(gh<_i38.UsersRepository>()));
  gh.factory<_i116.ActionLinkUsecase>(
      () => _i116.ActionLinkUsecase(gh<_i84.LinksImportantRepository>()));
  gh.factory<_i117.GetLinkUsecase>(
      () => _i117.GetLinkUsecase(gh<_i84.LinksImportantRepository>()));
  gh.lazySingleton<_i118.ManageWithdrawalsRepository>(() =>
      _i119.ManageWithdrawalsRepositoryImpl(
          gh<_i22.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i120.AgentsDistributorsRepo>(() =>
      _i121.AgentsDistributorsRepoImpl(
          gh<_i45.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i122.RegionsRepository>(
      () => _i123.RegionsRepositoryImpl(gh<_i74.RegionsDatasource>()));
  gh.factory<_i124.AddParticipateCommentUsecase>(() =>
      _i124.AddParticipateCommentUsecase(gh<_i63.ParticipateListRepository>()));
  gh.factory<_i125.AddParticipateUserUsecase>(() =>
      _i125.AddParticipateUserUsecase(gh<_i63.ParticipateListRepository>()));
  gh.factory<_i126.EditParticipateUserUsecase>(() =>
      _i126.EditParticipateUserUsecase(gh<_i63.ParticipateListRepository>()));
  gh.factory<_i127.GetInvoiceByIdUsecase>(
      () => _i127.GetInvoiceByIdUsecase(gh<_i63.ParticipateListRepository>()));
  gh.factory<_i128.ParticipateClientListUsecase>(() =>
      _i128.ParticipateClientListUsecase(gh<_i63.ParticipateListRepository>()));
  gh.factory<_i129.ParticipateCommentListUsecase>(() =>
      _i129.ParticipateCommentListUsecase(
          gh<_i63.ParticipateListRepository>()));
  gh.factory<_i130.ParticipateInvoiceListUsecase>(() =>
      _i130.ParticipateInvoiceListUsecase(
          gh<_i63.ParticipateListRepository>()));
  gh.factory<_i131.ParticipateListUsecase>(
      () => _i131.ParticipateListUsecase(gh<_i63.ParticipateListRepository>()));
  gh.lazySingleton<_i132.ChangeParticipateStatusUsecase>(() =>
      _i132.ChangeParticipateStatusUsecase(
          gh<_i63.ParticipateListRepository>()));
  gh.factory<_i133.GetCommunicationListUsecase>(() =>
      _i133.GetCommunicationListUsecase(
          gh<_i110.CommunicationListRepository>()));
  gh.lazySingleton<_i134.CrudClientSupportFilesUsecase>(() =>
      _i134.CrudClientSupportFilesUsecase(
          repository: gh<_i97.ClientsListRepository>()));
  gh.lazySingleton<_i135.GetClientSupportFilesUsecase>(() =>
      _i135.GetClientSupportFilesUsecase(
          repository: gh<_i97.ClientsListRepository>()));
  gh.factory<_i136.LinkCubit>(() => _i136.LinkCubit(
        gh<_i117.GetLinkUsecase>(),
        gh<_i116.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i137.WaitingAgentsRepo>(
      () => _i138.WaitingAgentsRepoImpl(gh<_i68.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i139.ChangeStateAgentUseCase>(
      () => _i139.ChangeStateAgentUseCase(gh<_i120.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i140.GetAgentsAndDistributorsUseCase>(() =>
      _i140.GetAgentsAndDistributorsUseCase(
          gh<_i120.AgentsDistributorsRepo>()));
  gh.factory<_i141.ClientsAcceptCubit>(
      () => _i141.ClientsAcceptCubit(gh<_i92.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i142.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i142.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i118.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i143.GetWithdrawalsInvoicesUsecase>(() =>
      _i143.GetWithdrawalsInvoicesUsecase(
          gh<_i118.ManageWithdrawalsRepository>()));
  gh.factory<_i144.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i144.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i118.ManageWithdrawalsRepository>()));
  gh.factory<_i145.AddTaskUsecase>(
      () => _i145.AddTaskUsecase(gh<_i43.TaskRepository>()));
  gh.factory<_i146.ChangeStatusTaskUsecase>(
      () => _i146.ChangeStatusTaskUsecase(gh<_i43.TaskRepository>()));
  gh.factory<_i147.FilterTaskUsecase>(
      () => _i147.FilterTaskUsecase(gh<_i43.TaskRepository>()));
  gh.factory<_i148.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i148.GetUsersByDepartmentAndRegionUsecase(gh<_i43.TaskRepository>()));
  gh.lazySingleton<_i149.EditAdvancedConfigsUsecase>(() =>
      _i149.EditAdvancedConfigsUsecase(gh<_i61.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i150.GetAdvancedConfigsUsecase>(() =>
      _i150.GetAdvancedConfigsUsecase(gh<_i61.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i151.DatesTableRepo>(
      () => _i152.DatesTableRepoImpl(gh<_i73.DatesTableDataSource>()));
  gh.factory<_i153.AddClientUserUsecase>(
      () => _i153.AddClientUserUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i154.ApproveRejectClientUsecase>(
      () => _i154.ApproveRejectClientUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i155.ChangeTypeClientUsecase>(
      () => _i155.ChangeTypeClientUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i156.EditClientUserUsecase>(
      () => _i156.EditClientUserUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i157.GetClientsListByRegionUseCase>(() =>
      _i157.GetClientsListByRegionUseCase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i158.GetClientsListByUserUseCase>(() =>
      _i158.GetClientsListByUserUseCase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i159.GetClientsWithFilterUserUsecase>(() =>
      _i159.GetClientsWithFilterUserUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i160.GetClientMarketingReportUsecase>(() =>
      _i160.GetClientMarketingReportUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i161.GetRecommendedClientsUsecase>(() =>
      _i161.GetRecommendedClientsUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i162.GetSimilarClientsUsecase>(
      () => _i162.GetSimilarClientsUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i163.ReceiveClientUserUsecase>(
      () => _i163.ReceiveClientUserUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i164.TransferClientUserUsecase>(
      () => _i164.TransferClientUserUsecase(gh<_i97.ClientsListRepository>()));
  gh.factory<_i165.GetVersionUseCase>(
      () => _i165.GetVersionUseCase(gh<_i78.AppRepository>()));
  gh.factory<_i166.AddTicketCubit>(
      () => _i166.AddTicketCubit(gh<_i53.AddTicketUseCase>()));
  gh.lazySingleton<_i167.EditGeneralConfigsUsecase>(() =>
      _i167.EditGeneralConfigsUsecase(gh<_i93.GeneralConfigsRepository>()));
  gh.lazySingleton<_i168.GetGeneralConfigsUsecase>(() =>
      _i168.GetGeneralConfigsUsecase(gh<_i93.GeneralConfigsRepository>()));
  gh.lazySingleton<_i169.AddAgentUseCase>(
      () => _i169.AddAgentUseCase(gh<_i80.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i170.UpdateAgentUseCase>(
      () => _i170.UpdateAgentUseCase(gh<_i80.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i171.CrudAgentSupportFilesUsecase>(() =>
      _i171.CrudAgentSupportFilesUsecase(
          gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i172.GetLatestClientsUseCase>(() =>
      _i172.GetLatestClientsUseCase(gh<_i46.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i173.TaskCubit>(() => _i173.TaskCubit(
        gh<_i145.AddTaskUsecase>(),
        gh<_i147.FilterTaskUsecase>(),
        gh<_i146.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i174.SupportTabCubit>(() => _i174.SupportTabCubit(
        gh<_i103.GetInvoiceByClientUsecase>(),
        gh<_i101.AddDateInstallUsecase>(),
        gh<_i106.SetDateDoneUsecase>(),
        gh<_i107.SetReadyInstallUsecase>(),
        gh<_i105.ReturnInvoiceApproveUsecase>(),
        gh<_i104.ReceiveDeviceUsecase>(),
        gh<_i102.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i175.AddAgentDateUseCase>(() =>
      _i175.AddAgentDateUseCase(gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.factory<_i176.ClientsListBloc>(() => _i176.ClientsListBloc(
        gh<_i159.GetClientsWithFilterUserUsecase>(),
        gh<_i161.GetRecommendedClientsUsecase>(),
        gh<_i153.AddClientUserUsecase>(),
        gh<_i156.EditClientUserUsecase>(),
        gh<_i155.ChangeTypeClientUsecase>(),
        gh<_i162.GetSimilarClientsUsecase>(),
        gh<_i154.ApproveRejectClientUsecase>(),
        gh<_i134.CrudClientSupportFilesUsecase>(),
        gh<_i135.GetClientSupportFilesUsecase>(),
        gh<_i164.TransferClientUserUsecase>(),
        gh<_i163.ReceiveClientUserUsecase>(),
        gh<_i160.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i177.AgentsDistributorsActionsCubit>(
      () => _i177.AgentsDistributorsActionsCubit(
            gh<_i52.GetCitiesUseCase>(),
            gh<_i169.AddAgentUseCase>(),
            gh<_i170.UpdateAgentUseCase>(),
          ));
  gh.factory<_i178.LoginCubit>(() => _i178.LoginCubit(
        gh<_i89.LoginUsecase>(),
        gh<_i91.VerifyOtpUsecase>(),
        gh<_i87.CacheTokenUsecase>(),
        gh<_i88.GetTokenUsecase>(),
        gh<_i90.ValidateTokenUsecase>(),
      ));
  gh.factory<_i179.InvoicesSectionCubit>(() => _i179.InvoicesSectionCubit(
        gh<_i86.GetInvoicesByPrivilegesUsecase>(),
        gh<_i140.GetAgentsAndDistributorsUseCase>(),
        gh<_i131.ParticipateListUsecase>(),
        gh<_i108.GetAllUsersUseCase>(),
      ));
  gh.factory<_i180.AddLevelUsecase>(
      () => _i180.AddLevelUsecase(gh<_i76.PrivilegeRepository>()));
  gh.factory<_i181.GetLevelsUsecase>(
      () => _i181.GetLevelsUsecase(gh<_i76.PrivilegeRepository>()));
  gh.factory<_i182.GetPrivilegesUsecase>(
      () => _i182.GetPrivilegesUsecase(gh<_i76.PrivilegeRepository>()));
  gh.factory<_i183.UpdatePrivilegeUsecase>(
      () => _i183.UpdatePrivilegeUsecase(gh<_i76.PrivilegeRepository>()));
  gh.factory<_i184.AttachmentsRowCubit>(() => _i184.AttachmentsRowCubit(
        gh<_i135.GetClientSupportFilesUsecase>(),
        gh<_i134.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i185.AddCommentUsecase>(
      () => _i185.AddCommentUsecase(gh<_i95.CompanyRepository>()));
  gh.factory<_i186.GetCommentUsecase>(
      () => _i186.GetCommentUsecase(gh<_i95.CompanyRepository>()));
  gh.lazySingleton<_i187.GetRegionsByIdCountryUseCase>(
      () => _i187.GetRegionsByIdCountryUseCase(gh<_i122.RegionsRepository>()));
  gh.lazySingleton<_i188.PrivilegeCubit>(() => _i188.PrivilegeCubit(
        gh<_i181.GetLevelsUsecase>(),
        gh<_i182.GetPrivilegesUsecase>(),
        gh<_i183.UpdatePrivilegeUsecase>(),
        gh<_i180.AddLevelUsecase>(),
      ));
  gh.factory<_i189.AdvancedCofigsCubit>(() => _i189.AdvancedCofigsCubit(
        gh<_i150.GetAdvancedConfigsUsecase>(),
        gh<_i149.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i190.ParticipateListBloc>(() => _i190.ParticipateListBloc(
        gh<_i131.ParticipateListUsecase>(),
        gh<_i125.AddParticipateUserUsecase>(),
        gh<_i126.EditParticipateUserUsecase>(),
        gh<_i128.ParticipateClientListUsecase>(),
        gh<_i130.ParticipateInvoiceListUsecase>(),
        gh<_i127.GetInvoiceByIdUsecase>(),
        gh<_i129.ParticipateCommentListUsecase>(),
        gh<_i124.AddParticipateCommentUsecase>(),
        gh<_i132.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i191.GeneralCofigsCubit>(() => _i191.GeneralCofigsCubit(
        gh<_i168.GetGeneralConfigsUsecase>(),
        gh<_i167.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i192.AddAgentCommentUsecase>(() =>
      _i192.AddAgentCommentUsecase(gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i193.DoneTrainingUsecase>(() =>
      _i193.DoneTrainingUsecase(gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i194.GetAgentUsecase>(
      () => _i194.GetAgentUsecase(gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i195.GetAgentClientListUsecase>(() =>
      _i195.GetAgentClientListUsecase(
          gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i196.GetAgentCommentsListUsecase>(() =>
      _i196.GetAgentCommentsListUsecase(
          gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i197.GetAgentDatesListUsecase>(() =>
      _i197.GetAgentDatesListUsecase(gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i198.GetAgentInvoiceListUsecase>(() =>
      _i198.GetAgentInvoiceListUsecase(
          gh<_i99.AgentsDistributorsProfileRepo>()));
  gh.factory<_i199.AddRejectReasonsUsecase>(() =>
      _i199.AddRejectReasonsUsecase(gh<_i118.ManageWithdrawalsRepository>()));
  gh.factory<_i200.EditRejectReasonsUsecase>(() =>
      _i200.EditRejectReasonsUsecase(gh<_i118.ManageWithdrawalsRepository>()));
  gh.factory<_i201.GetRejectReasonsUsecase>(() =>
      _i201.GetRejectReasonsUsecase(gh<_i118.ManageWithdrawalsRepository>()));
  gh.factory<_i202.GetUserSeriesUsecase>(() =>
      _i202.GetUserSeriesUsecase(gh<_i118.ManageWithdrawalsRepository>()));
  gh.factory<_i203.GetWithdrawnDetailsUsecase>(() =>
      _i203.GetWithdrawnDetailsUsecase(
          gh<_i118.ManageWithdrawalsRepository>()));
  gh.factory<_i204.SetApproveSeriesUsecase>(() =>
      _i204.SetApproveSeriesUsecase(gh<_i118.ManageWithdrawalsRepository>()));
  gh.factory<_i205.UpdateSeriesUsecase>(
      () => _i205.UpdateSeriesUsecase(gh<_i118.ManageWithdrawalsRepository>()));
  gh.singleton<_i206.AppManagerCubit>(
      () => _i206.AppManagerCubit(gh<_i165.GetVersionUseCase>()));
  gh.factory<_i207.RegionsCubit>(
      () => _i207.RegionsCubit(gh<_i187.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i208.GetWaitingAgentsUsecase>(
      () => _i208.GetWaitingAgentsUsecase(gh<_i137.WaitingAgentsRepo>()));
  gh.factory<_i209.UsersCubit>(() => _i209.UsersCubit(
        gh<_i115.GetUsersUsecase>(),
        gh<_i42.ActionUserUsecase>(),
        gh<_i148.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i114.GetManagesForUserUsecase>(),
        gh<_i113.GetLevelsForUserUsecase>(),
        gh<_i112.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i210.CommunicationListBloc>(() =>
      _i210.CommunicationListBloc(gh<_i133.GetCommunicationListUsecase>()));
  gh.factory<_i211.AgentsDistributorsCubit>(() => _i211.AgentsDistributorsCubit(
        gh<_i140.GetAgentsAndDistributorsUseCase>(),
        gh<_i139.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i212.LatestClientsUpdatesCubit>(() =>
      _i212.LatestClientsUpdatesCubit(gh<_i172.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i213.CancelScheduleUsecase>(
      () => _i213.CancelScheduleUsecase(gh<_i151.DatesTableRepo>()));
  gh.lazySingleton<_i214.ChangeDateToDonUsecase>(
      () => _i214.ChangeDateToDonUsecase(gh<_i151.DatesTableRepo>()));
  gh.lazySingleton<_i215.GetDateInstallationUsecase>(
      () => _i215.GetDateInstallationUsecase(gh<_i151.DatesTableRepo>()));
  gh.lazySingleton<_i216.GetInvoicesByClientForDateUsecase>(() =>
      _i216.GetInvoicesByClientForDateUsecase(gh<_i151.DatesTableRepo>()));
  gh.lazySingleton<_i217.GetSubscribedClientsUsecase>(
      () => _i217.GetSubscribedClientsUsecase(gh<_i151.DatesTableRepo>()));
  gh.lazySingleton<_i218.RescheduleDateUsecase>(
      () => _i218.RescheduleDateUsecase(gh<_i151.DatesTableRepo>()));
  gh.lazySingleton<_i219.ReturnScheduleVisitToOpenUsecase>(
      () => _i219.ReturnScheduleVisitToOpenUsecase(gh<_i151.DatesTableRepo>()));
  gh.factory<_i220.AgentsDistributorsProfileBloc>(
      () => _i220.AgentsDistributorsProfileBloc(
            gh<_i195.GetAgentClientListUsecase>(),
            gh<_i198.GetAgentInvoiceListUsecase>(),
            gh<_i127.GetInvoiceByIdUsecase>(),
            gh<_i196.GetAgentCommentsListUsecase>(),
            gh<_i192.AddAgentCommentUsecase>(),
            gh<_i193.DoneTrainingUsecase>(),
            gh<_i175.AddAgentDateUseCase>(),
            gh<_i197.GetAgentDatesListUsecase>(),
            gh<_i171.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i221.DatesTableCubit>(() => _i221.DatesTableCubit(
        gh<_i215.GetDateInstallationUsecase>(),
        gh<_i218.RescheduleDateUsecase>(),
        gh<_i214.ChangeDateToDonUsecase>(),
        gh<_i213.CancelScheduleUsecase>(),
        gh<_i219.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i217.GetSubscribedClientsUsecase>(),
        gh<_i216.GetInvoicesByClientForDateUsecase>(),
        gh<_i101.AddDateInstallUsecase>(),
      ));
  gh.factory<_i222.CompanyCubit>(() => _i222.CompanyCubit(
        gh<_i186.GetCommentUsecase>(),
        gh<_i185.AddCommentUsecase>(),
      ));
  gh.factory<_i223.ManageWithdrawalsCubit>(() => _i223.ManageWithdrawalsCubit(
        gh<_i202.GetUserSeriesUsecase>(),
        gh<_i205.UpdateSeriesUsecase>(),
        gh<_i115.GetUsersUsecase>(),
        gh<_i143.GetWithdrawalsInvoicesUsecase>(),
        gh<_i144.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i204.SetApproveSeriesUsecase>(),
        gh<_i203.GetWithdrawnDetailsUsecase>(),
        gh<_i199.AddRejectReasonsUsecase>(),
        gh<_i201.GetRejectReasonsUsecase>(),
        gh<_i200.EditRejectReasonsUsecase>(),
        gh<_i142.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i224.WaitingAgentsCubit>(
      () => _i224.WaitingAgentsCubit(gh<_i208.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i225.AppModule {}
