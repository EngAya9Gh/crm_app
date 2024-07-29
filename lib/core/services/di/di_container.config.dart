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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i25;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i85;
import '../../../features/app/domain/repositories/app_repository.dart' as _i84;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i173;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i216;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i43;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i64;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i76;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i75;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i93;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i94;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i95;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i96;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i97;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i187;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i16;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i20;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i19;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i98;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i147;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i21;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i36;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i35;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i57;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i58;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i59;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i61;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i60;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i62;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i174;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i74;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i63;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i26;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i117;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i116;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i139;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i220;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i33;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i55;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i54;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i56;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i115;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i52;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i89;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i88;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i107;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i108;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i109;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i110;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i111;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i112;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i113;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i183;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i78;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i129;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i128;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i197;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i217;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i34;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i66;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i65;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i157;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i158;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i199;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i42;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i100;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i99;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i175;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i176;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i201;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i27;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i81;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i80;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i189;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i190;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i191;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i192;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i198;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i22;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i41;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i40;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i46;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i118;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i119;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i120;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i121;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i219;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i24;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i125;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i124;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i209;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i210;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i148;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i211;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i212;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i150;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i149;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i213;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i214;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i215;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i234;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i28;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i104;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i103;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i161;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i162;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i163;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i140;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i164;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i168;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i141;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i165;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i166;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i167;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i169;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i170;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i171;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i172;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i185;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i29;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i102;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i101;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i194;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i195;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i233;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i23;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i45;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i44;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i155;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i156;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i222;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i53;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i70;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i69;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i114;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i92;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i188;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i32;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i51;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i50;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i181;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i223;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i15;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i49;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i73;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i87;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i106;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i127;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i86;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i105;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i126;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i202;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i184;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i177;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i145;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i180;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i203;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i204;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i205;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i206;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i207;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i208;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i146;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i178;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i186;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i221;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i30;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i91;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i90;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i122;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i123;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i142;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i18;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i68;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i67;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i130;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i131;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i138;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i132;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i133;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i134;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i135;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i136;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i137;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i200;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i77;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i160;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i159;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i224;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i225;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i226;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i227;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i228;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i229;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i230;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i232;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i17;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i83;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i82;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i179;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i196;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i38;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i37;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i39;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i71;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i72;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i144;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i143;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i218;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i235;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i31;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i48;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i47;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i151;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i152;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i153;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i154;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i182;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i193;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i79;
import 'di_container.dart' as _i236;

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
  gh.lazySingleton<_i23.ExceededClientsDatasource>(
      () => _i23.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i24.ManageWithdrawalsDatasource>(
      () => _i24.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i25.AppDatasource>(
      () => _i25.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i26.CommunicationListDatasource>(
      () => _i26.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i27.PrivilegeDatasource>(
      () => _i27.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.ClientsListDatasource>(
      () => _i28.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i29.CommentCompanyDatasource>(
      () => _i29.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i30.LinkDatasource>(
      () => _i30.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i31.TaskDatasource>(
      () => _i31.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i32.LatestClientsUpdatesDatasource>(
      () => _i32.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i33.CitiesDatasource>(
      () => _i33.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i34.AdvancedConfigsDatasource>(
      () => _i34.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i35.TicketsRepo>(
      () => _i36.TicketsRepoImpl(gh<_i21.TicketsDataSource>()));
  gh.lazySingleton<_i37.SupportClientsAcceptRepository>(() =>
      _i38.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i39.GetSupportClientsAcceptUseCase>(() =>
      _i39.GetSupportClientsAcceptUseCase(
          gh<_i37.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i40.UsersRepository>(
      () => _i41.UsersRepositoryImpl(gh<_i22.UsersDatasource>()));
  gh.lazySingleton<_i42.GeneralConfigsDatasource>(
      () => _i42.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i43.LoginLocalDataSource>(() =>
      _i43.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i44.ExceededClientsRepo>(
      () => _i45.ExceededClientsRepoImpl(gh<_i23.ExceededClientsDatasource>()));
  gh.factory<_i46.ActionUserUsecase>(
      () => _i46.ActionUserUsecase(gh<_i40.UsersRepository>()));
  gh.factory<_i47.TaskRepository>(
      () => _i48.TaskRepositoryImpl(gh<_i31.TaskDatasource>()));
  gh.lazySingleton<_i49.AgentsDistributorsDataSource>(
      () => _i49.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i50.LatestClientsUpdatesRepository>(() =>
      _i51.LatestClientsUpdatesRepositoryImpl(
          gh<_i32.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i52.SupportTabDataSource>(
      () => _i52.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i53.InvoicesTabDataSource>(
      () => _i53.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i54.CitiesRepository>(
      () => _i55.CitiesRepositoryImpl(gh<_i33.CitiesDatasource>()));
  gh.lazySingleton<_i56.GetCitiesUseCase>(
      () => _i56.GetCitiesUseCase(gh<_i54.CitiesRepository>()));
  gh.lazySingleton<_i57.AddTicketUseCase>(
      () => _i57.AddTicketUseCase(gh<_i35.TicketsRepo>()));
  gh.lazySingleton<_i58.EditTicketTypeUseCase>(
      () => _i58.EditTicketTypeUseCase(gh<_i35.TicketsRepo>()));
  gh.lazySingleton<_i59.GetClientTicketsUseCase>(
      () => _i59.GetClientTicketsUseCase(gh<_i35.TicketsRepo>()));
  gh.lazySingleton<_i60.GetTicketsUseCase>(
      () => _i60.GetTicketsUseCase(gh<_i35.TicketsRepo>()));
  gh.lazySingleton<_i61.GetTicketByIdUseCase>(
      () => _i61.GetTicketByIdUseCase(gh<_i35.TicketsRepo>()));
  gh.lazySingleton<_i62.TransferTicketUseCase>(
      () => _i62.TransferTicketUseCase(gh<_i35.TicketsRepo>()));
  gh.factory<_i63.TicketsCubit>(() => _i63.TicketsCubit(
        gh<_i60.GetTicketsUseCase>(),
        gh<_i61.GetTicketByIdUseCase>(),
        gh<_i59.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i64.LoginRemoteDataSource>(
      () => _i64.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i65.AdvancedConfigsRepository>(() =>
      _i66.AdvancedConfigsRepositoryImpl(gh<_i34.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i67.ParticipateListRepository>(() =>
      _i68.ParticipateListRepositoryImpl(
          gh<_i18.ParticipatesListDatasource>()));
  gh.lazySingleton<_i69.InvoicesSectionRepo>(
      () => _i70.InvoicesTabRepoImpl(gh<_i53.InvoicesTabDataSource>()));
  gh.factory<_i71.SupportClientsAcceptCubit>(() =>
      _i71.SupportClientsAcceptCubit(
          gh<_i39.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i72.WaitingAgentsDataSource>(
      () => _i72.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i73.AgentsDistributorsProfileDataSource>(() =>
      _i73.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i74.EditTicketCubit>(() => _i74.EditTicketCubit(
        gh<_i58.EditTicketTypeUseCase>(),
        gh<_i62.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i75.LoginRepo>(() => _i76.LoginRepoImpl(
        gh<_i64.LoginRemoteDataSource>(),
        gh<_i43.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i77.DatesTableDataSource>(
      () => _i77.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i78.RegionsDatasource>(
      () => _i78.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i79.LocationServices>(
      () => _i79.LocationServices(gh<_i8.Location>()));
  gh.factory<_i80.PrivilegeRepository>(
      () => _i81.PrivilegeRepositoryImpl(gh<_i27.PrivilegeDatasource>()));
  gh.lazySingleton<_i82.DelayInstallReportsRepo>(() =>
      _i83.DelayInstallReportsRepoImpl(
          gh<_i17.DelayInstallReportsDatasource>()));
  gh.factory<_i84.AppRepository>(
      () => _i85.AppRepositoryImpl(gh<_i25.AppDatasource>()));
  gh.lazySingleton<_i86.AgentsDistributorsActionsRepo>(() =>
      _i87.AgentsDistributorsActionsRepoImpl(
          gh<_i15.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i88.SupportTabRepo>(
      () => _i89.SupportTabRepoImpl(gh<_i52.SupportTabDataSource>()));
  gh.factory<_i90.LinksImportantRepository>(
      () => _i91.LinkRepositoryImpl(gh<_i30.LinkDatasource>()));
  gh.lazySingleton<_i92.GetInvoicesByPrivilegesUsecase>(() =>
      _i92.GetInvoicesByPrivilegesUsecase(gh<_i69.InvoicesSectionRepo>()));
  gh.lazySingleton<_i93.CacheTokenUsecase>(
      () => _i93.CacheTokenUsecase(gh<_i75.LoginRepo>()));
  gh.lazySingleton<_i94.GetTokenUsecase>(
      () => _i94.GetTokenUsecase(gh<_i75.LoginRepo>()));
  gh.lazySingleton<_i95.LoginUsecase>(
      () => _i95.LoginUsecase(gh<_i75.LoginRepo>()));
  gh.lazySingleton<_i96.ValidateTokenUsecase>(
      () => _i96.ValidateTokenUsecase(gh<_i75.LoginRepo>()));
  gh.lazySingleton<_i97.VerifyOtpUsecase>(
      () => _i97.VerifyOtpUsecase(gh<_i75.LoginRepo>()));
  gh.lazySingleton<_i98.GetClientsAcceptUseCase>(
      () => _i98.GetClientsAcceptUseCase(gh<_i19.ClientsAcceptRepository>()));
  gh.lazySingleton<_i99.GeneralConfigsRepository>(() =>
      _i100.GeneralConfigsRepositoryImpl(gh<_i42.GeneralConfigsDatasource>()));
  gh.factory<_i101.CompanyRepository>(
      () => _i102.CompanyRepositoryImpl(gh<_i29.CommentCompanyDatasource>()));
  gh.factory<_i103.ClientsListRepository>(
      () => _i104.ClientsListRepositoryImpl(gh<_i28.ClientsListDatasource>()));
  gh.lazySingleton<_i105.AgentsDistributorsProfileRepo>(() =>
      _i106.AgentsDistributorsProfileRepoImpl(
          gh<_i73.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i107.AddDateInstallUsecase>(
      () => _i107.AddDateInstallUsecase(gh<_i88.SupportTabRepo>()));
  gh.lazySingleton<_i108.CancelDateInstallUsecase>(
      () => _i108.CancelDateInstallUsecase(gh<_i88.SupportTabRepo>()));
  gh.lazySingleton<_i109.GetInvoiceByClientUsecase>(
      () => _i109.GetInvoiceByClientUsecase(gh<_i88.SupportTabRepo>()));
  gh.lazySingleton<_i110.ReceiveDeviceUsecase>(
      () => _i110.ReceiveDeviceUsecase(gh<_i88.SupportTabRepo>()));
  gh.lazySingleton<_i111.ReturnInvoiceApproveUsecase>(
      () => _i111.ReturnInvoiceApproveUsecase(gh<_i88.SupportTabRepo>()));
  gh.lazySingleton<_i112.SetDateDoneUsecase>(
      () => _i112.SetDateDoneUsecase(gh<_i88.SupportTabRepo>()));
  gh.lazySingleton<_i113.SetReadyInstallUsecase>(
      () => _i113.SetReadyInstallUsecase(gh<_i88.SupportTabRepo>()));
  gh.lazySingleton<_i114.GetAllUsersUseCase>(
      () => _i114.GetAllUsersUseCase(gh<_i69.InvoicesSectionRepo>()));
  gh.singleton<_i115.CitiesCubit>(
      () => _i115.CitiesCubit(gh<_i56.GetCitiesUseCase>()));
  gh.factory<_i116.CommunicationListRepository>(() =>
      _i117.CommunicationListRepositoryImpl(
          gh<_i26.CommunicationListDatasource>()));
  gh.lazySingleton<_i118.GetBranchesForUserUsecase>(
      () => _i118.GetBranchesForUserUsecase(gh<_i40.UsersRepository>()));
  gh.lazySingleton<_i119.GetLevelsForUserUsecase>(
      () => _i119.GetLevelsForUserUsecase(gh<_i40.UsersRepository>()));
  gh.lazySingleton<_i120.GetManagesForUserUsecase>(
      () => _i120.GetManagesForUserUsecase(gh<_i40.UsersRepository>()));
  gh.factory<_i121.GetUsersUsecase>(
      () => _i121.GetUsersUsecase(gh<_i40.UsersRepository>()));
  gh.factory<_i122.ActionLinkUsecase>(
      () => _i122.ActionLinkUsecase(gh<_i90.LinksImportantRepository>()));
  gh.factory<_i123.GetLinkUsecase>(
      () => _i123.GetLinkUsecase(gh<_i90.LinksImportantRepository>()));
  gh.lazySingleton<_i124.ManageWithdrawalsRepository>(() =>
      _i125.ManageWithdrawalsRepositoryImpl(
          gh<_i24.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i126.AgentsDistributorsRepo>(() =>
      _i127.AgentsDistributorsRepoImpl(
          gh<_i49.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i128.RegionsRepository>(
      () => _i129.RegionsRepositoryImpl(gh<_i78.RegionsDatasource>()));
  gh.factory<_i130.AddParticipateCommentUsecase>(() =>
      _i130.AddParticipateCommentUsecase(gh<_i67.ParticipateListRepository>()));
  gh.factory<_i131.AddParticipateUserUsecase>(() =>
      _i131.AddParticipateUserUsecase(gh<_i67.ParticipateListRepository>()));
  gh.factory<_i132.EditParticipateUserUsecase>(() =>
      _i132.EditParticipateUserUsecase(gh<_i67.ParticipateListRepository>()));
  gh.factory<_i133.GetInvoiceByIdUsecase>(
      () => _i133.GetInvoiceByIdUsecase(gh<_i67.ParticipateListRepository>()));
  gh.factory<_i134.ParticipateClientListUsecase>(() =>
      _i134.ParticipateClientListUsecase(gh<_i67.ParticipateListRepository>()));
  gh.factory<_i135.ParticipateCommentListUsecase>(() =>
      _i135.ParticipateCommentListUsecase(
          gh<_i67.ParticipateListRepository>()));
  gh.factory<_i136.ParticipateInvoiceListUsecase>(() =>
      _i136.ParticipateInvoiceListUsecase(
          gh<_i67.ParticipateListRepository>()));
  gh.factory<_i137.ParticipateListUsecase>(
      () => _i137.ParticipateListUsecase(gh<_i67.ParticipateListRepository>()));
  gh.lazySingleton<_i138.ChangeParticipateStatusUsecase>(() =>
      _i138.ChangeParticipateStatusUsecase(
          gh<_i67.ParticipateListRepository>()));
  gh.factory<_i139.GetCommunicationListUsecase>(() =>
      _i139.GetCommunicationListUsecase(
          gh<_i116.CommunicationListRepository>()));
  gh.lazySingleton<_i140.CrudClientSupportFilesUsecase>(() =>
      _i140.CrudClientSupportFilesUsecase(
          repository: gh<_i103.ClientsListRepository>()));
  gh.lazySingleton<_i141.GetClientSupportFilesUsecase>(() =>
      _i141.GetClientSupportFilesUsecase(
          repository: gh<_i103.ClientsListRepository>()));
  gh.factory<_i142.LinkCubit>(() => _i142.LinkCubit(
        gh<_i123.GetLinkUsecase>(),
        gh<_i122.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i143.WaitingAgentsRepo>(
      () => _i144.WaitingAgentsRepoImpl(gh<_i72.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i145.ChangeStateAgentUseCase>(
      () => _i145.ChangeStateAgentUseCase(gh<_i126.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i146.GetAgentsAndDistributorsUseCase>(() =>
      _i146.GetAgentsAndDistributorsUseCase(
          gh<_i126.AgentsDistributorsRepo>()));
  gh.factory<_i147.ClientsAcceptCubit>(
      () => _i147.ClientsAcceptCubit(gh<_i98.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i148.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i148.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i124.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i149.GetWithdrawalsInvoicesUsecase>(() =>
      _i149.GetWithdrawalsInvoicesUsecase(
          gh<_i124.ManageWithdrawalsRepository>()));
  gh.factory<_i150.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i150.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i124.ManageWithdrawalsRepository>()));
  gh.factory<_i151.AddTaskUsecase>(
      () => _i151.AddTaskUsecase(gh<_i47.TaskRepository>()));
  gh.factory<_i152.ChangeStatusTaskUsecase>(
      () => _i152.ChangeStatusTaskUsecase(gh<_i47.TaskRepository>()));
  gh.factory<_i153.FilterTaskUsecase>(
      () => _i153.FilterTaskUsecase(gh<_i47.TaskRepository>()));
  gh.factory<_i154.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i154.GetUsersByDepartmentAndRegionUsecase(gh<_i47.TaskRepository>()));
  gh.lazySingleton<_i155.ExceededClientsUseCase>(
      () => _i155.ExceededClientsUseCase(gh<_i44.ExceededClientsRepo>()));
  gh.lazySingleton<_i156.TransferExceededClientsUseCase>(() =>
      _i156.TransferExceededClientsUseCase(gh<_i44.ExceededClientsRepo>()));
  gh.lazySingleton<_i157.EditAdvancedConfigsUsecase>(() =>
      _i157.EditAdvancedConfigsUsecase(gh<_i65.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i158.GetAdvancedConfigsUsecase>(() =>
      _i158.GetAdvancedConfigsUsecase(gh<_i65.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i159.DatesTableRepo>(
      () => _i160.DatesTableRepoImpl(gh<_i77.DatesTableDataSource>()));
  gh.factory<_i161.AddClientUserUsecase>(
      () => _i161.AddClientUserUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i162.ApproveRejectClientUsecase>(() =>
      _i162.ApproveRejectClientUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i163.ChangeTypeClientUsecase>(
      () => _i163.ChangeTypeClientUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i164.EditClientUserUsecase>(
      () => _i164.EditClientUserUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i165.GetClientsListByRegionUseCase>(() =>
      _i165.GetClientsListByRegionUseCase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i166.GetClientsListByUserUseCase>(() =>
      _i166.GetClientsListByUserUseCase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i167.GetClientsWithFilterUserUsecase>(() =>
      _i167.GetClientsWithFilterUserUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i168.GetClientMarketingReportUsecase>(() =>
      _i168.GetClientMarketingReportUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i169.GetRecommendedClientsUsecase>(() =>
      _i169.GetRecommendedClientsUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i170.GetSimilarClientsUsecase>(
      () => _i170.GetSimilarClientsUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i171.ReceiveClientUserUsecase>(
      () => _i171.ReceiveClientUserUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i172.TransferClientUserUsecase>(
      () => _i172.TransferClientUserUsecase(gh<_i103.ClientsListRepository>()));
  gh.factory<_i173.GetVersionUseCase>(
      () => _i173.GetVersionUseCase(gh<_i84.AppRepository>()));
  gh.factory<_i174.AddTicketCubit>(
      () => _i174.AddTicketCubit(gh<_i57.AddTicketUseCase>()));
  gh.lazySingleton<_i175.EditGeneralConfigsUsecase>(() =>
      _i175.EditGeneralConfigsUsecase(gh<_i99.GeneralConfigsRepository>()));
  gh.lazySingleton<_i176.GetGeneralConfigsUsecase>(() =>
      _i176.GetGeneralConfigsUsecase(gh<_i99.GeneralConfigsRepository>()));
  gh.lazySingleton<_i177.AddAgentUseCase>(
      () => _i177.AddAgentUseCase(gh<_i86.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i178.UpdateAgentUseCase>(
      () => _i178.UpdateAgentUseCase(gh<_i86.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i179.GetDelayInstallReportsUseCase>(() =>
      _i179.GetDelayInstallReportsUseCase(gh<_i82.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i180.CrudAgentSupportFilesUsecase>(() =>
      _i180.CrudAgentSupportFilesUsecase(
          gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i181.GetLatestClientsUseCase>(() =>
      _i181.GetLatestClientsUseCase(gh<_i50.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i182.TaskCubit>(() => _i182.TaskCubit(
        gh<_i151.AddTaskUsecase>(),
        gh<_i153.FilterTaskUsecase>(),
        gh<_i152.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i183.SupportTabCubit>(() => _i183.SupportTabCubit(
        gh<_i109.GetInvoiceByClientUsecase>(),
        gh<_i107.AddDateInstallUsecase>(),
        gh<_i112.SetDateDoneUsecase>(),
        gh<_i113.SetReadyInstallUsecase>(),
        gh<_i111.ReturnInvoiceApproveUsecase>(),
        gh<_i110.ReceiveDeviceUsecase>(),
        gh<_i108.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i184.AddAgentDateUseCase>(() =>
      _i184.AddAgentDateUseCase(gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.factory<_i185.ClientsListBloc>(() => _i185.ClientsListBloc(
        gh<_i167.GetClientsWithFilterUserUsecase>(),
        gh<_i169.GetRecommendedClientsUsecase>(),
        gh<_i161.AddClientUserUsecase>(),
        gh<_i164.EditClientUserUsecase>(),
        gh<_i163.ChangeTypeClientUsecase>(),
        gh<_i170.GetSimilarClientsUsecase>(),
        gh<_i162.ApproveRejectClientUsecase>(),
        gh<_i140.CrudClientSupportFilesUsecase>(),
        gh<_i141.GetClientSupportFilesUsecase>(),
        gh<_i172.TransferClientUserUsecase>(),
        gh<_i171.ReceiveClientUserUsecase>(),
        gh<_i168.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i186.AgentsDistributorsActionsCubit>(
      () => _i186.AgentsDistributorsActionsCubit(
            gh<_i56.GetCitiesUseCase>(),
            gh<_i177.AddAgentUseCase>(),
            gh<_i178.UpdateAgentUseCase>(),
          ));
  gh.factory<_i187.LoginCubit>(() => _i187.LoginCubit(
        gh<_i95.LoginUsecase>(),
        gh<_i97.VerifyOtpUsecase>(),
        gh<_i93.CacheTokenUsecase>(),
        gh<_i94.GetTokenUsecase>(),
        gh<_i96.ValidateTokenUsecase>(),
      ));
  gh.factory<_i188.InvoicesSectionCubit>(() => _i188.InvoicesSectionCubit(
        gh<_i92.GetInvoicesByPrivilegesUsecase>(),
        gh<_i146.GetAgentsAndDistributorsUseCase>(),
        gh<_i137.ParticipateListUsecase>(),
        gh<_i114.GetAllUsersUseCase>(),
      ));
  gh.factory<_i189.AddLevelUsecase>(
      () => _i189.AddLevelUsecase(gh<_i80.PrivilegeRepository>()));
  gh.factory<_i190.GetLevelsUsecase>(
      () => _i190.GetLevelsUsecase(gh<_i80.PrivilegeRepository>()));
  gh.factory<_i191.GetPrivilegesUsecase>(
      () => _i191.GetPrivilegesUsecase(gh<_i80.PrivilegeRepository>()));
  gh.factory<_i192.UpdatePrivilegeUsecase>(
      () => _i192.UpdatePrivilegeUsecase(gh<_i80.PrivilegeRepository>()));
  gh.factory<_i193.AttachmentsRowCubit>(() => _i193.AttachmentsRowCubit(
        gh<_i141.GetClientSupportFilesUsecase>(),
        gh<_i140.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i194.AddCommentUsecase>(
      () => _i194.AddCommentUsecase(gh<_i101.CompanyRepository>()));
  gh.factory<_i195.GetCommentUsecase>(
      () => _i195.GetCommentUsecase(gh<_i101.CompanyRepository>()));
  gh.factory<_i196.DelayInstallReportsCubit>(() =>
      _i196.DelayInstallReportsCubit(
          gh<_i179.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i197.GetRegionsByIdCountryUseCase>(
      () => _i197.GetRegionsByIdCountryUseCase(gh<_i128.RegionsRepository>()));
  gh.lazySingleton<_i198.PrivilegeCubit>(() => _i198.PrivilegeCubit(
        gh<_i190.GetLevelsUsecase>(),
        gh<_i191.GetPrivilegesUsecase>(),
        gh<_i192.UpdatePrivilegeUsecase>(),
        gh<_i189.AddLevelUsecase>(),
      ));
  gh.factory<_i199.AdvancedCofigsCubit>(() => _i199.AdvancedCofigsCubit(
        gh<_i158.GetAdvancedConfigsUsecase>(),
        gh<_i157.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i200.ParticipateListBloc>(() => _i200.ParticipateListBloc(
        gh<_i137.ParticipateListUsecase>(),
        gh<_i131.AddParticipateUserUsecase>(),
        gh<_i132.EditParticipateUserUsecase>(),
        gh<_i134.ParticipateClientListUsecase>(),
        gh<_i136.ParticipateInvoiceListUsecase>(),
        gh<_i133.GetInvoiceByIdUsecase>(),
        gh<_i135.ParticipateCommentListUsecase>(),
        gh<_i130.AddParticipateCommentUsecase>(),
        gh<_i138.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i201.GeneralCofigsCubit>(() => _i201.GeneralCofigsCubit(
        gh<_i176.GetGeneralConfigsUsecase>(),
        gh<_i175.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i202.AddAgentCommentUsecase>(() =>
      _i202.AddAgentCommentUsecase(gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i203.DoneTrainingUsecase>(() =>
      _i203.DoneTrainingUsecase(gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i204.GetAgentUsecase>(
      () => _i204.GetAgentUsecase(gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i205.GetAgentClientListUsecase>(() =>
      _i205.GetAgentClientListUsecase(
          gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i206.GetAgentCommentsListUsecase>(() =>
      _i206.GetAgentCommentsListUsecase(
          gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i207.GetAgentDatesListUsecase>(() =>
      _i207.GetAgentDatesListUsecase(
          gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i208.GetAgentInvoiceListUsecase>(() =>
      _i208.GetAgentInvoiceListUsecase(
          gh<_i105.AgentsDistributorsProfileRepo>()));
  gh.factory<_i209.AddRejectReasonsUsecase>(() =>
      _i209.AddRejectReasonsUsecase(gh<_i124.ManageWithdrawalsRepository>()));
  gh.factory<_i210.EditRejectReasonsUsecase>(() =>
      _i210.EditRejectReasonsUsecase(gh<_i124.ManageWithdrawalsRepository>()));
  gh.factory<_i211.GetRejectReasonsUsecase>(() =>
      _i211.GetRejectReasonsUsecase(gh<_i124.ManageWithdrawalsRepository>()));
  gh.factory<_i212.GetUserSeriesUsecase>(() =>
      _i212.GetUserSeriesUsecase(gh<_i124.ManageWithdrawalsRepository>()));
  gh.factory<_i213.GetWithdrawnDetailsUsecase>(() =>
      _i213.GetWithdrawnDetailsUsecase(
          gh<_i124.ManageWithdrawalsRepository>()));
  gh.factory<_i214.SetApproveSeriesUsecase>(() =>
      _i214.SetApproveSeriesUsecase(gh<_i124.ManageWithdrawalsRepository>()));
  gh.factory<_i215.UpdateSeriesUsecase>(
      () => _i215.UpdateSeriesUsecase(gh<_i124.ManageWithdrawalsRepository>()));
  gh.singleton<_i216.AppManagerCubit>(
      () => _i216.AppManagerCubit(gh<_i173.GetVersionUseCase>()));
  gh.factory<_i217.RegionsCubit>(
      () => _i217.RegionsCubit(gh<_i197.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i218.GetWaitingAgentsUsecase>(
      () => _i218.GetWaitingAgentsUsecase(gh<_i143.WaitingAgentsRepo>()));
  gh.factory<_i219.UsersCubit>(() => _i219.UsersCubit(
        gh<_i121.GetUsersUsecase>(),
        gh<_i46.ActionUserUsecase>(),
        gh<_i154.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i120.GetManagesForUserUsecase>(),
        gh<_i119.GetLevelsForUserUsecase>(),
        gh<_i118.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i220.CommunicationListBloc>(() =>
      _i220.CommunicationListBloc(gh<_i139.GetCommunicationListUsecase>()));
  gh.factory<_i221.AgentsDistributorsCubit>(() => _i221.AgentsDistributorsCubit(
        gh<_i146.GetAgentsAndDistributorsUseCase>(),
        gh<_i145.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i222.ExceededClientsCubit>(() => _i222.ExceededClientsCubit(
        gh<_i155.ExceededClientsUseCase>(),
        gh<_i156.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i223.LatestClientsUpdatesCubit>(() =>
      _i223.LatestClientsUpdatesCubit(gh<_i181.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i224.CancelScheduleUsecase>(
      () => _i224.CancelScheduleUsecase(gh<_i159.DatesTableRepo>()));
  gh.lazySingleton<_i225.ChangeDateToDonUsecase>(
      () => _i225.ChangeDateToDonUsecase(gh<_i159.DatesTableRepo>()));
  gh.lazySingleton<_i226.GetDateInstallationUsecase>(
      () => _i226.GetDateInstallationUsecase(gh<_i159.DatesTableRepo>()));
  gh.lazySingleton<_i227.GetInvoicesByClientForDateUsecase>(() =>
      _i227.GetInvoicesByClientForDateUsecase(gh<_i159.DatesTableRepo>()));
  gh.lazySingleton<_i228.GetSubscribedClientsUsecase>(
      () => _i228.GetSubscribedClientsUsecase(gh<_i159.DatesTableRepo>()));
  gh.lazySingleton<_i229.RescheduleDateUsecase>(
      () => _i229.RescheduleDateUsecase(gh<_i159.DatesTableRepo>()));
  gh.lazySingleton<_i230.ReturnScheduleVisitToOpenUsecase>(
      () => _i230.ReturnScheduleVisitToOpenUsecase(gh<_i159.DatesTableRepo>()));
  gh.factory<_i231.AgentsDistributorsProfileBloc>(
      () => _i231.AgentsDistributorsProfileBloc(
            gh<_i205.GetAgentClientListUsecase>(),
            gh<_i208.GetAgentInvoiceListUsecase>(),
            gh<_i133.GetInvoiceByIdUsecase>(),
            gh<_i206.GetAgentCommentsListUsecase>(),
            gh<_i202.AddAgentCommentUsecase>(),
            gh<_i203.DoneTrainingUsecase>(),
            gh<_i184.AddAgentDateUseCase>(),
            gh<_i207.GetAgentDatesListUsecase>(),
            gh<_i180.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i232.DatesTableCubit>(() => _i232.DatesTableCubit(
        gh<_i226.GetDateInstallationUsecase>(),
        gh<_i229.RescheduleDateUsecase>(),
        gh<_i225.ChangeDateToDonUsecase>(),
        gh<_i224.CancelScheduleUsecase>(),
        gh<_i230.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i228.GetSubscribedClientsUsecase>(),
        gh<_i227.GetInvoicesByClientForDateUsecase>(),
        gh<_i107.AddDateInstallUsecase>(),
      ));
  gh.factory<_i233.CompanyCubit>(() => _i233.CompanyCubit(
        gh<_i195.GetCommentUsecase>(),
        gh<_i194.AddCommentUsecase>(),
      ));
  gh.factory<_i234.ManageWithdrawalsCubit>(() => _i234.ManageWithdrawalsCubit(
        gh<_i212.GetUserSeriesUsecase>(),
        gh<_i215.UpdateSeriesUsecase>(),
        gh<_i121.GetUsersUsecase>(),
        gh<_i149.GetWithdrawalsInvoicesUsecase>(),
        gh<_i150.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i214.SetApproveSeriesUsecase>(),
        gh<_i213.GetWithdrawnDetailsUsecase>(),
        gh<_i209.AddRejectReasonsUsecase>(),
        gh<_i211.GetRejectReasonsUsecase>(),
        gh<_i210.EditRejectReasonsUsecase>(),
        gh<_i148.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i235.WaitingAgentsCubit>(
      () => _i235.WaitingAgentsCubit(gh<_i218.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i236.AppModule {}
