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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i24;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i82;
import '../../../features/app/domain/repositories/app_repository.dart' as _i81;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i168;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i211;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i42;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i61;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i73;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i72;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i90;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i91;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i92;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i93;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i94;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i182;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i16;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i20;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i19;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i95;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i144;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i21;
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
    as _i169;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i71;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i60;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i25;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i114;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i113;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i136;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i215;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i32;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i52;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i51;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i53;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i112;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i49;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i86;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i85;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i104;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i105;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i106;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i107;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i108;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i109;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i110;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i178;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i75;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i126;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i125;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i192;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i212;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i33;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i63;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i62;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i152;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i153;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i194;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i41;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i97;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i96;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i170;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i171;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i196;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i26;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i78;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i77;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i184;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i185;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i186;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i187;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i193;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i22;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i40;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i39;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i43;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i115;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i116;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i117;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i118;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i214;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i23;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i122;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i121;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i204;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i205;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i145;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i206;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i207;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i147;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i146;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i208;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i209;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i210;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i228;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i27;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i101;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i100;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i156;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i157;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i158;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i137;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i159;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i163;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i138;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i160;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i161;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i162;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i164;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i165;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i166;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i167;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i180;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i28;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i99;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i98;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i189;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i190;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i227;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i50;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i67;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i66;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i111;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i89;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i183;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i31;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i48;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i47;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i176;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i217;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i15;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i46;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i70;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i84;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i103;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i124;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i83;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i102;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i123;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i197;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i172;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i142;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i198;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i199;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i200;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i201;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i202;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i203;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i143;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i173;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i181;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i225;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i216;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i29;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i88;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i87;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i119;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i120;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i139;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i18;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i65;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i64;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i127;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i128;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i135;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i129;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i130;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i131;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i132;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i133;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i134;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i195;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i74;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i155;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i154;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i218;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i219;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i220;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i221;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i222;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i223;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i224;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i226;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i17;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i80;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i79;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i174;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i191;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i37;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i36;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i38;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i68;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i69;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i141;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i140;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i213;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i229;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i30;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i45;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i44;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i148;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i149;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i150;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i151;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i177;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i188;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i76;
import 'di_container.dart' as _i230;

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
  gh.lazySingleton<_i17.DelayInstallReportsDatasource>(
      () => _i17.DelayInstallReportsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i18.ParticipatesListDatasource>(
      () => _i18.ParticipatesListDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i19.ClientsAcceptRepository>(() =>
      _i20.ClientsAcceptRepositoryImpl(gh<_i16.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i21.TicketsDataSource>(
      () => _i21.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i22.UsersDatasource>(
      () => _i22.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i23.ManageWithdrawalsDatasource>(
      () => _i23.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i24.AppDatasource>(
      () => _i24.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i25.CommunicationListDatasource>(
      () => _i25.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i26.PrivilegeDatasource>(
      () => _i26.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i27.ClientsListDatasource>(
      () => _i27.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.CommentCompanyDatasource>(
      () => _i28.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i29.LinkDatasource>(
      () => _i29.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i30.TaskDatasource>(
      () => _i30.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i31.LatestClientsUpdatesDatasource>(
      () => _i31.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i32.CitiesDatasource>(
      () => _i32.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i33.AdvancedConfigsDatasource>(
      () => _i33.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i34.TicketsRepo>(
      () => _i35.TicketsRepoImpl(gh<_i21.TicketsDataSource>()));
  gh.lazySingleton<_i36.SupportClientsAcceptRepository>(() =>
      _i37.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i38.GetSupportClientsAcceptUseCase>(() =>
      _i38.GetSupportClientsAcceptUseCase(
          gh<_i36.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i39.UsersRepository>(
      () => _i40.UsersRepositoryImpl(gh<_i22.UsersDatasource>()));
  gh.lazySingleton<_i41.GeneralConfigsDatasource>(
      () => _i41.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i42.LoginLocalDataSource>(() =>
      _i42.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i43.ActionUserUsecase>(
      () => _i43.ActionUserUsecase(gh<_i39.UsersRepository>()));
  gh.factory<_i44.TaskRepository>(
      () => _i45.TaskRepositoryImpl(gh<_i30.TaskDatasource>()));
  gh.lazySingleton<_i46.AgentsDistributorsDataSource>(
      () => _i46.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i47.LatestClientsUpdatesRepository>(() =>
      _i48.LatestClientsUpdatesRepositoryImpl(
          gh<_i31.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i49.SupportTabDataSource>(
      () => _i49.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i50.InvoicesTabDataSource>(
      () => _i50.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i51.CitiesRepository>(
      () => _i52.CitiesRepositoryImpl(gh<_i32.CitiesDatasource>()));
  gh.lazySingleton<_i53.GetCitiesUseCase>(
      () => _i53.GetCitiesUseCase(gh<_i51.CitiesRepository>()));
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
      () => _i61.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i62.AdvancedConfigsRepository>(() =>
      _i63.AdvancedConfigsRepositoryImpl(gh<_i33.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i64.ParticipateListRepository>(() =>
      _i65.ParticipateListRepositoryImpl(
          gh<_i18.ParticipatesListDatasource>()));
  gh.lazySingleton<_i66.InvoicesSectionRepo>(
      () => _i67.InvoicesTabRepoImpl(gh<_i50.InvoicesTabDataSource>()));
  gh.factory<_i68.SupportClientsAcceptCubit>(() =>
      _i68.SupportClientsAcceptCubit(
          gh<_i38.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i69.WaitingAgentsDataSource>(
      () => _i69.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i70.AgentsDistributorsProfileDataSource>(() =>
      _i70.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i71.EditTicketCubit>(() => _i71.EditTicketCubit(
        gh<_i55.EditTicketTypeUseCase>(),
        gh<_i59.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i72.LoginRepo>(() => _i73.LoginRepoImpl(
        gh<_i61.LoginRemoteDataSource>(),
        gh<_i42.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i74.DatesTableDataSource>(
      () => _i74.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i75.RegionsDatasource>(
      () => _i75.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i76.LocationServices>(
      () => _i76.LocationServices(gh<_i8.Location>()));
  gh.factory<_i77.PrivilegeRepository>(
      () => _i78.PrivilegeRepositoryImpl(gh<_i26.PrivilegeDatasource>()));
  gh.lazySingleton<_i79.DelayInstallReportsRepo>(() =>
      _i80.DelayInstallReportsRepoImpl(
          gh<_i17.DelayInstallReportsDatasource>()));
  gh.factory<_i81.AppRepository>(
      () => _i82.AppRepositoryImpl(gh<_i24.AppDatasource>()));
  gh.lazySingleton<_i83.AgentsDistributorsActionsRepo>(() =>
      _i84.AgentsDistributorsActionsRepoImpl(
          gh<_i15.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i85.SupportTabRepo>(
      () => _i86.SupportTabRepoImpl(gh<_i49.SupportTabDataSource>()));
  gh.factory<_i87.LinksImportantRepository>(
      () => _i88.LinkRepositoryImpl(gh<_i29.LinkDatasource>()));
  gh.lazySingleton<_i89.GetInvoicesByPrivilegesUsecase>(() =>
      _i89.GetInvoicesByPrivilegesUsecase(gh<_i66.InvoicesSectionRepo>()));
  gh.lazySingleton<_i90.CacheTokenUsecase>(
      () => _i90.CacheTokenUsecase(gh<_i72.LoginRepo>()));
  gh.lazySingleton<_i91.GetTokenUsecase>(
      () => _i91.GetTokenUsecase(gh<_i72.LoginRepo>()));
  gh.lazySingleton<_i92.LoginUsecase>(
      () => _i92.LoginUsecase(gh<_i72.LoginRepo>()));
  gh.lazySingleton<_i93.ValidateTokenUsecase>(
      () => _i93.ValidateTokenUsecase(gh<_i72.LoginRepo>()));
  gh.lazySingleton<_i94.VerifyOtpUsecase>(
      () => _i94.VerifyOtpUsecase(gh<_i72.LoginRepo>()));
  gh.lazySingleton<_i95.GetClientsAcceptUseCase>(
      () => _i95.GetClientsAcceptUseCase(gh<_i19.ClientsAcceptRepository>()));
  gh.lazySingleton<_i96.GeneralConfigsRepository>(() =>
      _i97.GeneralConfigsRepositoryImpl(gh<_i41.GeneralConfigsDatasource>()));
  gh.factory<_i98.CompanyRepository>(
      () => _i99.CompanyRepositoryImpl(gh<_i28.CommentCompanyDatasource>()));
  gh.factory<_i100.ClientsListRepository>(
      () => _i101.ClientsListRepositoryImpl(gh<_i27.ClientsListDatasource>()));
  gh.lazySingleton<_i102.AgentsDistributorsProfileRepo>(() =>
      _i103.AgentsDistributorsProfileRepoImpl(
          gh<_i70.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i104.AddDateInstallUsecase>(
      () => _i104.AddDateInstallUsecase(gh<_i85.SupportTabRepo>()));
  gh.lazySingleton<_i105.CancelDateInstallUsecase>(
      () => _i105.CancelDateInstallUsecase(gh<_i85.SupportTabRepo>()));
  gh.lazySingleton<_i106.GetInvoiceByClientUsecase>(
      () => _i106.GetInvoiceByClientUsecase(gh<_i85.SupportTabRepo>()));
  gh.lazySingleton<_i107.ReceiveDeviceUsecase>(
      () => _i107.ReceiveDeviceUsecase(gh<_i85.SupportTabRepo>()));
  gh.lazySingleton<_i108.ReturnInvoiceApproveUsecase>(
      () => _i108.ReturnInvoiceApproveUsecase(gh<_i85.SupportTabRepo>()));
  gh.lazySingleton<_i109.SetDateDoneUsecase>(
      () => _i109.SetDateDoneUsecase(gh<_i85.SupportTabRepo>()));
  gh.lazySingleton<_i110.SetReadyInstallUsecase>(
      () => _i110.SetReadyInstallUsecase(gh<_i85.SupportTabRepo>()));
  gh.lazySingleton<_i111.GetAllUsersUseCase>(
      () => _i111.GetAllUsersUseCase(gh<_i66.InvoicesSectionRepo>()));
  gh.singleton<_i112.CitiesCubit>(
      () => _i112.CitiesCubit(gh<_i53.GetCitiesUseCase>()));
  gh.factory<_i113.CommunicationListRepository>(() =>
      _i114.CommunicationListRepositoryImpl(
          gh<_i25.CommunicationListDatasource>()));
  gh.lazySingleton<_i115.GetBranchesForUserUsecase>(
      () => _i115.GetBranchesForUserUsecase(gh<_i39.UsersRepository>()));
  gh.lazySingleton<_i116.GetLevelsForUserUsecase>(
      () => _i116.GetLevelsForUserUsecase(gh<_i39.UsersRepository>()));
  gh.lazySingleton<_i117.GetManagesForUserUsecase>(
      () => _i117.GetManagesForUserUsecase(gh<_i39.UsersRepository>()));
  gh.factory<_i118.GetUsersUsecase>(
      () => _i118.GetUsersUsecase(gh<_i39.UsersRepository>()));
  gh.factory<_i119.ActionLinkUsecase>(
      () => _i119.ActionLinkUsecase(gh<_i87.LinksImportantRepository>()));
  gh.factory<_i120.GetLinkUsecase>(
      () => _i120.GetLinkUsecase(gh<_i87.LinksImportantRepository>()));
  gh.lazySingleton<_i121.ManageWithdrawalsRepository>(() =>
      _i122.ManageWithdrawalsRepositoryImpl(
          gh<_i23.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i123.AgentsDistributorsRepo>(() =>
      _i124.AgentsDistributorsRepoImpl(
          gh<_i46.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i125.RegionsRepository>(
      () => _i126.RegionsRepositoryImpl(gh<_i75.RegionsDatasource>()));
  gh.factory<_i127.AddParticipateCommentUsecase>(() =>
      _i127.AddParticipateCommentUsecase(gh<_i64.ParticipateListRepository>()));
  gh.factory<_i128.AddParticipateUserUsecase>(() =>
      _i128.AddParticipateUserUsecase(gh<_i64.ParticipateListRepository>()));
  gh.factory<_i129.EditParticipateUserUsecase>(() =>
      _i129.EditParticipateUserUsecase(gh<_i64.ParticipateListRepository>()));
  gh.factory<_i130.GetInvoiceByIdUsecase>(
      () => _i130.GetInvoiceByIdUsecase(gh<_i64.ParticipateListRepository>()));
  gh.factory<_i131.ParticipateClientListUsecase>(() =>
      _i131.ParticipateClientListUsecase(gh<_i64.ParticipateListRepository>()));
  gh.factory<_i132.ParticipateCommentListUsecase>(() =>
      _i132.ParticipateCommentListUsecase(
          gh<_i64.ParticipateListRepository>()));
  gh.factory<_i133.ParticipateInvoiceListUsecase>(() =>
      _i133.ParticipateInvoiceListUsecase(
          gh<_i64.ParticipateListRepository>()));
  gh.factory<_i134.ParticipateListUsecase>(
      () => _i134.ParticipateListUsecase(gh<_i64.ParticipateListRepository>()));
  gh.lazySingleton<_i135.ChangeParticipateStatusUsecase>(() =>
      _i135.ChangeParticipateStatusUsecase(
          gh<_i64.ParticipateListRepository>()));
  gh.factory<_i136.GetCommunicationListUsecase>(() =>
      _i136.GetCommunicationListUsecase(
          gh<_i113.CommunicationListRepository>()));
  gh.lazySingleton<_i137.CrudClientSupportFilesUsecase>(() =>
      _i137.CrudClientSupportFilesUsecase(
          repository: gh<_i100.ClientsListRepository>()));
  gh.lazySingleton<_i138.GetClientSupportFilesUsecase>(() =>
      _i138.GetClientSupportFilesUsecase(
          repository: gh<_i100.ClientsListRepository>()));
  gh.factory<_i139.LinkCubit>(() => _i139.LinkCubit(
        gh<_i120.GetLinkUsecase>(),
        gh<_i119.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i140.WaitingAgentsRepo>(
      () => _i141.WaitingAgentsRepoImpl(gh<_i69.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i142.ChangeStateAgentUseCase>(
      () => _i142.ChangeStateAgentUseCase(gh<_i123.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i143.GetAgentsAndDistributorsUseCase>(() =>
      _i143.GetAgentsAndDistributorsUseCase(
          gh<_i123.AgentsDistributorsRepo>()));
  gh.factory<_i144.ClientsAcceptCubit>(
      () => _i144.ClientsAcceptCubit(gh<_i95.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i145.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i145.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i121.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i146.GetWithdrawalsInvoicesUsecase>(() =>
      _i146.GetWithdrawalsInvoicesUsecase(
          gh<_i121.ManageWithdrawalsRepository>()));
  gh.factory<_i147.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i147.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i121.ManageWithdrawalsRepository>()));
  gh.factory<_i148.AddTaskUsecase>(
      () => _i148.AddTaskUsecase(gh<_i44.TaskRepository>()));
  gh.factory<_i149.ChangeStatusTaskUsecase>(
      () => _i149.ChangeStatusTaskUsecase(gh<_i44.TaskRepository>()));
  gh.factory<_i150.FilterTaskUsecase>(
      () => _i150.FilterTaskUsecase(gh<_i44.TaskRepository>()));
  gh.factory<_i151.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i151.GetUsersByDepartmentAndRegionUsecase(gh<_i44.TaskRepository>()));
  gh.lazySingleton<_i152.EditAdvancedConfigsUsecase>(() =>
      _i152.EditAdvancedConfigsUsecase(gh<_i62.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i153.GetAdvancedConfigsUsecase>(() =>
      _i153.GetAdvancedConfigsUsecase(gh<_i62.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i154.DatesTableRepo>(
      () => _i155.DatesTableRepoImpl(gh<_i74.DatesTableDataSource>()));
  gh.factory<_i156.AddClientUserUsecase>(
      () => _i156.AddClientUserUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i157.ApproveRejectClientUsecase>(() =>
      _i157.ApproveRejectClientUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i158.ChangeTypeClientUsecase>(
      () => _i158.ChangeTypeClientUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i159.EditClientUserUsecase>(
      () => _i159.EditClientUserUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i160.GetClientsListByRegionUseCase>(() =>
      _i160.GetClientsListByRegionUseCase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i161.GetClientsListByUserUseCase>(() =>
      _i161.GetClientsListByUserUseCase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i162.GetClientsWithFilterUserUsecase>(() =>
      _i162.GetClientsWithFilterUserUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i163.GetClientMarketingReportUsecase>(() =>
      _i163.GetClientMarketingReportUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i164.GetRecommendedClientsUsecase>(() =>
      _i164.GetRecommendedClientsUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i165.GetSimilarClientsUsecase>(
      () => _i165.GetSimilarClientsUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i166.ReceiveClientUserUsecase>(
      () => _i166.ReceiveClientUserUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i167.TransferClientUserUsecase>(
      () => _i167.TransferClientUserUsecase(gh<_i100.ClientsListRepository>()));
  gh.factory<_i168.GetVersionUseCase>(
      () => _i168.GetVersionUseCase(gh<_i81.AppRepository>()));
  gh.factory<_i169.AddTicketCubit>(
      () => _i169.AddTicketCubit(gh<_i54.AddTicketUseCase>()));
  gh.lazySingleton<_i170.EditGeneralConfigsUsecase>(() =>
      _i170.EditGeneralConfigsUsecase(gh<_i96.GeneralConfigsRepository>()));
  gh.lazySingleton<_i171.GetGeneralConfigsUsecase>(() =>
      _i171.GetGeneralConfigsUsecase(gh<_i96.GeneralConfigsRepository>()));
  gh.lazySingleton<_i172.AddAgentUseCase>(
      () => _i172.AddAgentUseCase(gh<_i83.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i173.UpdateAgentUseCase>(
      () => _i173.UpdateAgentUseCase(gh<_i83.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i174.GetDelayInstallReportsUseCase>(() =>
      _i174.GetDelayInstallReportsUseCase(gh<_i79.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i175.CrudAgentSupportFilesUsecase>(() =>
      _i175.CrudAgentSupportFilesUsecase(
          gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i176.GetLatestClientsUseCase>(() =>
      _i176.GetLatestClientsUseCase(gh<_i47.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i177.TaskCubit>(() => _i177.TaskCubit(
        gh<_i148.AddTaskUsecase>(),
        gh<_i150.FilterTaskUsecase>(),
        gh<_i149.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i178.SupportTabCubit>(() => _i178.SupportTabCubit(
        gh<_i106.GetInvoiceByClientUsecase>(),
        gh<_i104.AddDateInstallUsecase>(),
        gh<_i109.SetDateDoneUsecase>(),
        gh<_i110.SetReadyInstallUsecase>(),
        gh<_i108.ReturnInvoiceApproveUsecase>(),
        gh<_i107.ReceiveDeviceUsecase>(),
        gh<_i105.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i179.AddAgentDateUseCase>(() =>
      _i179.AddAgentDateUseCase(gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.factory<_i180.ClientsListBloc>(() => _i180.ClientsListBloc(
        gh<_i162.GetClientsWithFilterUserUsecase>(),
        gh<_i164.GetRecommendedClientsUsecase>(),
        gh<_i156.AddClientUserUsecase>(),
        gh<_i159.EditClientUserUsecase>(),
        gh<_i158.ChangeTypeClientUsecase>(),
        gh<_i165.GetSimilarClientsUsecase>(),
        gh<_i157.ApproveRejectClientUsecase>(),
        gh<_i137.CrudClientSupportFilesUsecase>(),
        gh<_i138.GetClientSupportFilesUsecase>(),
        gh<_i167.TransferClientUserUsecase>(),
        gh<_i166.ReceiveClientUserUsecase>(),
        gh<_i163.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i181.AgentsDistributorsActionsCubit>(
      () => _i181.AgentsDistributorsActionsCubit(
            gh<_i53.GetCitiesUseCase>(),
            gh<_i172.AddAgentUseCase>(),
            gh<_i173.UpdateAgentUseCase>(),
          ));
  gh.factory<_i182.LoginCubit>(() => _i182.LoginCubit(
        gh<_i92.LoginUsecase>(),
        gh<_i94.VerifyOtpUsecase>(),
        gh<_i90.CacheTokenUsecase>(),
        gh<_i91.GetTokenUsecase>(),
        gh<_i93.ValidateTokenUsecase>(),
      ));
  gh.factory<_i183.InvoicesSectionCubit>(() => _i183.InvoicesSectionCubit(
        gh<_i89.GetInvoicesByPrivilegesUsecase>(),
        gh<_i143.GetAgentsAndDistributorsUseCase>(),
        gh<_i134.ParticipateListUsecase>(),
        gh<_i111.GetAllUsersUseCase>(),
      ));
  gh.factory<_i184.AddLevelUsecase>(
      () => _i184.AddLevelUsecase(gh<_i77.PrivilegeRepository>()));
  gh.factory<_i185.GetLevelsUsecase>(
      () => _i185.GetLevelsUsecase(gh<_i77.PrivilegeRepository>()));
  gh.factory<_i186.GetPrivilegesUsecase>(
      () => _i186.GetPrivilegesUsecase(gh<_i77.PrivilegeRepository>()));
  gh.factory<_i187.UpdatePrivilegeUsecase>(
      () => _i187.UpdatePrivilegeUsecase(gh<_i77.PrivilegeRepository>()));
  gh.factory<_i188.AttachmentsRowCubit>(() => _i188.AttachmentsRowCubit(
        gh<_i138.GetClientSupportFilesUsecase>(),
        gh<_i137.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i189.AddCommentUsecase>(
      () => _i189.AddCommentUsecase(gh<_i98.CompanyRepository>()));
  gh.factory<_i190.GetCommentUsecase>(
      () => _i190.GetCommentUsecase(gh<_i98.CompanyRepository>()));
  gh.factory<_i191.DelayInstallReportsCubit>(() =>
      _i191.DelayInstallReportsCubit(
          gh<_i174.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i192.GetRegionsByIdCountryUseCase>(
      () => _i192.GetRegionsByIdCountryUseCase(gh<_i125.RegionsRepository>()));
  gh.lazySingleton<_i193.PrivilegeCubit>(() => _i193.PrivilegeCubit(
        gh<_i185.GetLevelsUsecase>(),
        gh<_i186.GetPrivilegesUsecase>(),
        gh<_i187.UpdatePrivilegeUsecase>(),
        gh<_i184.AddLevelUsecase>(),
      ));
  gh.factory<_i194.AdvancedCofigsCubit>(() => _i194.AdvancedCofigsCubit(
        gh<_i153.GetAdvancedConfigsUsecase>(),
        gh<_i152.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i195.ParticipateListBloc>(() => _i195.ParticipateListBloc(
        gh<_i134.ParticipateListUsecase>(),
        gh<_i128.AddParticipateUserUsecase>(),
        gh<_i129.EditParticipateUserUsecase>(),
        gh<_i131.ParticipateClientListUsecase>(),
        gh<_i133.ParticipateInvoiceListUsecase>(),
        gh<_i130.GetInvoiceByIdUsecase>(),
        gh<_i132.ParticipateCommentListUsecase>(),
        gh<_i127.AddParticipateCommentUsecase>(),
        gh<_i135.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i196.GeneralCofigsCubit>(() => _i196.GeneralCofigsCubit(
        gh<_i171.GetGeneralConfigsUsecase>(),
        gh<_i170.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i197.AddAgentCommentUsecase>(() =>
      _i197.AddAgentCommentUsecase(gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i198.DoneTrainingUsecase>(() =>
      _i198.DoneTrainingUsecase(gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i199.GetAgentUsecase>(
      () => _i199.GetAgentUsecase(gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i200.GetAgentClientListUsecase>(() =>
      _i200.GetAgentClientListUsecase(
          gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i201.GetAgentCommentsListUsecase>(() =>
      _i201.GetAgentCommentsListUsecase(
          gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i202.GetAgentDatesListUsecase>(() =>
      _i202.GetAgentDatesListUsecase(
          gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i203.GetAgentInvoiceListUsecase>(() =>
      _i203.GetAgentInvoiceListUsecase(
          gh<_i102.AgentsDistributorsProfileRepo>()));
  gh.factory<_i204.AddRejectReasonsUsecase>(() =>
      _i204.AddRejectReasonsUsecase(gh<_i121.ManageWithdrawalsRepository>()));
  gh.factory<_i205.EditRejectReasonsUsecase>(() =>
      _i205.EditRejectReasonsUsecase(gh<_i121.ManageWithdrawalsRepository>()));
  gh.factory<_i206.GetRejectReasonsUsecase>(() =>
      _i206.GetRejectReasonsUsecase(gh<_i121.ManageWithdrawalsRepository>()));
  gh.factory<_i207.GetUserSeriesUsecase>(() =>
      _i207.GetUserSeriesUsecase(gh<_i121.ManageWithdrawalsRepository>()));
  gh.factory<_i208.GetWithdrawnDetailsUsecase>(() =>
      _i208.GetWithdrawnDetailsUsecase(
          gh<_i121.ManageWithdrawalsRepository>()));
  gh.factory<_i209.SetApproveSeriesUsecase>(() =>
      _i209.SetApproveSeriesUsecase(gh<_i121.ManageWithdrawalsRepository>()));
  gh.factory<_i210.UpdateSeriesUsecase>(
      () => _i210.UpdateSeriesUsecase(gh<_i121.ManageWithdrawalsRepository>()));
  gh.singleton<_i211.AppManagerCubit>(
      () => _i211.AppManagerCubit(gh<_i168.GetVersionUseCase>()));
  gh.factory<_i212.RegionsCubit>(
      () => _i212.RegionsCubit(gh<_i192.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i213.GetWaitingAgentsUsecase>(
      () => _i213.GetWaitingAgentsUsecase(gh<_i140.WaitingAgentsRepo>()));
  gh.factory<_i214.UsersCubit>(() => _i214.UsersCubit(
        gh<_i118.GetUsersUsecase>(),
        gh<_i43.ActionUserUsecase>(),
        gh<_i151.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i117.GetManagesForUserUsecase>(),
        gh<_i116.GetLevelsForUserUsecase>(),
        gh<_i115.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i215.CommunicationListBloc>(() =>
      _i215.CommunicationListBloc(gh<_i136.GetCommunicationListUsecase>()));
  gh.factory<_i216.AgentsDistributorsCubit>(() => _i216.AgentsDistributorsCubit(
        gh<_i143.GetAgentsAndDistributorsUseCase>(),
        gh<_i142.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i217.LatestClientsUpdatesCubit>(() =>
      _i217.LatestClientsUpdatesCubit(gh<_i176.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i218.CancelScheduleUsecase>(
      () => _i218.CancelScheduleUsecase(gh<_i154.DatesTableRepo>()));
  gh.lazySingleton<_i219.ChangeDateToDonUsecase>(
      () => _i219.ChangeDateToDonUsecase(gh<_i154.DatesTableRepo>()));
  gh.lazySingleton<_i220.GetDateInstallationUsecase>(
      () => _i220.GetDateInstallationUsecase(gh<_i154.DatesTableRepo>()));
  gh.lazySingleton<_i221.GetInvoicesByClientForDateUsecase>(() =>
      _i221.GetInvoicesByClientForDateUsecase(gh<_i154.DatesTableRepo>()));
  gh.lazySingleton<_i222.GetSubscribedClientsUsecase>(
      () => _i222.GetSubscribedClientsUsecase(gh<_i154.DatesTableRepo>()));
  gh.lazySingleton<_i223.RescheduleDateUsecase>(
      () => _i223.RescheduleDateUsecase(gh<_i154.DatesTableRepo>()));
  gh.lazySingleton<_i224.ReturnScheduleVisitToOpenUsecase>(
      () => _i224.ReturnScheduleVisitToOpenUsecase(gh<_i154.DatesTableRepo>()));
  gh.factory<_i225.AgentsDistributorsProfileBloc>(
      () => _i225.AgentsDistributorsProfileBloc(
            gh<_i200.GetAgentClientListUsecase>(),
            gh<_i203.GetAgentInvoiceListUsecase>(),
            gh<_i130.GetInvoiceByIdUsecase>(),
            gh<_i201.GetAgentCommentsListUsecase>(),
            gh<_i197.AddAgentCommentUsecase>(),
            gh<_i198.DoneTrainingUsecase>(),
            gh<_i179.AddAgentDateUseCase>(),
            gh<_i202.GetAgentDatesListUsecase>(),
            gh<_i175.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i226.DatesTableCubit>(() => _i226.DatesTableCubit(
        gh<_i220.GetDateInstallationUsecase>(),
        gh<_i223.RescheduleDateUsecase>(),
        gh<_i219.ChangeDateToDonUsecase>(),
        gh<_i218.CancelScheduleUsecase>(),
        gh<_i224.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i222.GetSubscribedClientsUsecase>(),
        gh<_i221.GetInvoicesByClientForDateUsecase>(),
        gh<_i104.AddDateInstallUsecase>(),
      ));
  gh.factory<_i227.CompanyCubit>(() => _i227.CompanyCubit(
        gh<_i190.GetCommentUsecase>(),
        gh<_i189.AddCommentUsecase>(),
      ));
  gh.factory<_i228.ManageWithdrawalsCubit>(() => _i228.ManageWithdrawalsCubit(
        gh<_i207.GetUserSeriesUsecase>(),
        gh<_i210.UpdateSeriesUsecase>(),
        gh<_i118.GetUsersUsecase>(),
        gh<_i146.GetWithdrawalsInvoicesUsecase>(),
        gh<_i147.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i209.SetApproveSeriesUsecase>(),
        gh<_i208.GetWithdrawnDetailsUsecase>(),
        gh<_i204.AddRejectReasonsUsecase>(),
        gh<_i206.GetRejectReasonsUsecase>(),
        gh<_i205.EditRejectReasonsUsecase>(),
        gh<_i145.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i229.WaitingAgentsCubit>(
      () => _i229.WaitingAgentsCubit(gh<_i213.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i230.AppModule {}
