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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i27;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i93;
import '../../../features/app/domain/repositories/app_repository.dart' as _i92;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i183;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i226;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i49;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i70;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i83;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i82;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i103;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i104;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i105;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i106;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i107;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i197;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i17;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i20;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i108;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i157;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i23;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i38;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i37;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i63;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i64;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i65;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i67;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i66;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i184;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i81;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i69;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i28;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i127;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i126;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i149;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i230;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i35;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i61;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i60;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i62;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i125;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i58;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i99;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i98;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i117;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i118;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i119;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i120;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i121;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i122;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i123;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i193;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i86;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i139;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i138;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i207;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i227;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i36;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i72;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i71;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i167;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i168;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i209;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i46;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i110;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i109;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i185;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i186;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i211;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i29;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i89;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i88;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i199;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i200;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i201;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i202;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i208;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i24;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i45;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i44;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i52;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i128;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i129;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i130;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i131;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i229;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i26;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i135;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i134;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i219;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i220;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i158;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i221;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i222;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i160;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i159;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i223;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i224;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i225;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i244;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i22;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i48;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i47;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i79;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i96;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i30;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i114;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i113;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i171;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i172;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i173;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i150;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i174;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i178;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i151;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i175;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i176;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i177;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i179;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i180;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i181;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i182;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i195;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i31;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i112;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i111;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i204;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i205;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i243;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i25;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i51;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i50;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i165;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i166;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i232;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i59;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i76;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i75;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i124;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i102;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i198;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i34;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i57;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i56;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i191;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i233;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i16;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i55;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i80;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i95;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i116;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i94;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i115;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i136;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i212;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i194;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i187;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i190;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i213;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i214;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i215;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i216;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i217;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i218;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i156;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i188;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i196;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i241;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i231;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i32;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i101;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i100;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i132;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i133;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i152;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i19;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i74;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i73;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i140;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i141;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i148;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i142;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i143;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i144;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i145;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i146;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i147;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i210;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i84;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i170;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i169;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i234;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i235;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i236;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i237;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i238;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i239;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i240;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i242;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i42;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i41;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i85;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i97;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i18;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i91;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i90;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i189;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i206;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i40;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i39;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i43;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i77;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i78;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i154;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i153;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i228;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i245;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i33;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i54;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i53;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i161;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i162;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i163;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i164;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i192;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i203;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i87;
import 'di_container.dart' as _i246;

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
  gh.lazySingleton<_i15.DelayAfterInstallDatasource>(
      () => _i15.DelayAfterInstallDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i16.AgentsDistributorsActionsDataSource>(() =>
      _i16.AgentsDistributorsActionsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i17.ClientsAcceptDatasource>(
      () => _i17.ClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i18.DelayInstallReportsDatasource>(
      () => _i18.DelayInstallReportsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i19.ParticipatesListDatasource>(
      () => _i19.ParticipatesListDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i20.ClientsAcceptRepository>(() =>
      _i21.ClientsAcceptRepositoryImpl(gh<_i17.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i22.FinancePendingDatasource>(
      () => _i22.FinancePendingDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i23.TicketsDataSource>(
      () => _i23.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i24.UsersDatasource>(
      () => _i24.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i25.ExceededClientsDatasource>(
      () => _i25.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i26.ManageWithdrawalsDatasource>(
      () => _i26.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i27.AppDatasource>(
      () => _i27.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.CommunicationListDatasource>(
      () => _i28.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i29.PrivilegeDatasource>(
      () => _i29.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i30.ClientsListDatasource>(
      () => _i30.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i31.CommentCompanyDatasource>(
      () => _i31.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i32.LinkDatasource>(
      () => _i32.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i33.TaskDatasource>(
      () => _i33.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i34.LatestClientsUpdatesDatasource>(
      () => _i34.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i35.CitiesDatasource>(
      () => _i35.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i36.AdvancedConfigsDatasource>(
      () => _i36.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i37.TicketsRepo>(
      () => _i38.TicketsRepoImpl(gh<_i23.TicketsDataSource>()));
  gh.lazySingleton<_i39.SupportClientsAcceptRepository>(() =>
      _i40.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i41.DelayAfterInstallRepo>(() =>
      _i42.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i43.GetSupportClientsAcceptUseCase>(() =>
      _i43.GetSupportClientsAcceptUseCase(
          gh<_i39.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i44.UsersRepository>(
      () => _i45.UsersRepositoryImpl(gh<_i24.UsersDatasource>()));
  gh.lazySingleton<_i46.GeneralConfigsDatasource>(
      () => _i46.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i47.FinancePendingRepo>(
      () => _i48.FinancePendingRepoImpl(gh<_i22.FinancePendingDatasource>()));
  gh.lazySingleton<_i49.LoginLocalDataSource>(() =>
      _i49.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i50.ExceededClientsRepo>(
      () => _i51.ExceededClientsRepoImpl(gh<_i25.ExceededClientsDatasource>()));
  gh.factory<_i52.ActionUserUsecase>(
      () => _i52.ActionUserUsecase(gh<_i44.UsersRepository>()));
  gh.factory<_i53.TaskRepository>(
      () => _i54.TaskRepositoryImpl(gh<_i33.TaskDatasource>()));
  gh.lazySingleton<_i55.AgentsDistributorsDataSource>(
      () => _i55.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i56.LatestClientsUpdatesRepository>(() =>
      _i57.LatestClientsUpdatesRepositoryImpl(
          gh<_i34.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i58.SupportTabDataSource>(
      () => _i58.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i59.InvoicesTabDataSource>(
      () => _i59.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i60.CitiesRepository>(
      () => _i61.CitiesRepositoryImpl(gh<_i35.CitiesDatasource>()));
  gh.lazySingleton<_i62.GetCitiesUseCase>(
      () => _i62.GetCitiesUseCase(gh<_i60.CitiesRepository>()));
  gh.lazySingleton<_i63.AddTicketUseCase>(
      () => _i63.AddTicketUseCase(gh<_i37.TicketsRepo>()));
  gh.lazySingleton<_i64.EditTicketTypeUseCase>(
      () => _i64.EditTicketTypeUseCase(gh<_i37.TicketsRepo>()));
  gh.lazySingleton<_i65.GetClientTicketsUseCase>(
      () => _i65.GetClientTicketsUseCase(gh<_i37.TicketsRepo>()));
  gh.lazySingleton<_i66.GetTicketsUseCase>(
      () => _i66.GetTicketsUseCase(gh<_i37.TicketsRepo>()));
  gh.lazySingleton<_i67.GetTicketByIdUseCase>(
      () => _i67.GetTicketByIdUseCase(gh<_i37.TicketsRepo>()));
  gh.lazySingleton<_i68.TransferTicketUseCase>(
      () => _i68.TransferTicketUseCase(gh<_i37.TicketsRepo>()));
  gh.factory<_i69.TicketsCubit>(() => _i69.TicketsCubit(
        gh<_i66.GetTicketsUseCase>(),
        gh<_i67.GetTicketByIdUseCase>(),
        gh<_i65.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i70.LoginRemoteDataSource>(
      () => _i70.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i71.AdvancedConfigsRepository>(() =>
      _i72.AdvancedConfigsRepositoryImpl(gh<_i36.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i73.ParticipateListRepository>(() =>
      _i74.ParticipateListRepositoryImpl(
          gh<_i19.ParticipatesListDatasource>()));
  gh.lazySingleton<_i75.InvoicesSectionRepo>(
      () => _i76.InvoicesTabRepoImpl(gh<_i59.InvoicesTabDataSource>()));
  gh.factory<_i77.SupportClientsAcceptCubit>(() =>
      _i77.SupportClientsAcceptCubit(
          gh<_i43.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i78.WaitingAgentsDataSource>(
      () => _i78.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i79.GetFinancePendingInvoicesUsecase>(() =>
      _i79.GetFinancePendingInvoicesUsecase(gh<_i47.FinancePendingRepo>()));
  gh.lazySingleton<_i80.AgentsDistributorsProfileDataSource>(() =>
      _i80.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i81.EditTicketCubit>(() => _i81.EditTicketCubit(
        gh<_i64.EditTicketTypeUseCase>(),
        gh<_i68.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i82.LoginRepo>(() => _i83.LoginRepoImpl(
        gh<_i70.LoginRemoteDataSource>(),
        gh<_i49.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i84.DatesTableDataSource>(
      () => _i84.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i85.GetDelayAfterInstallUseCase>(
      () => _i85.GetDelayAfterInstallUseCase(gh<_i41.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i86.RegionsDatasource>(
      () => _i86.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i87.LocationServices>(
      () => _i87.LocationServices(gh<_i8.Location>()));
  gh.factory<_i88.PrivilegeRepository>(
      () => _i89.PrivilegeRepositoryImpl(gh<_i29.PrivilegeDatasource>()));
  gh.lazySingleton<_i90.DelayInstallReportsRepo>(() =>
      _i91.DelayInstallReportsRepoImpl(
          gh<_i18.DelayInstallReportsDatasource>()));
  gh.factory<_i92.AppRepository>(
      () => _i93.AppRepositoryImpl(gh<_i27.AppDatasource>()));
  gh.lazySingleton<_i94.AgentsDistributorsActionsRepo>(() =>
      _i95.AgentsDistributorsActionsRepoImpl(
          gh<_i16.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i96.FinancePendingCubit>(() =>
      _i96.FinancePendingCubit(gh<_i79.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i97.DelayAfterInstallCubit>(() =>
      _i97.DelayAfterInstallCubit(gh<_i85.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i98.SupportTabRepo>(
      () => _i99.SupportTabRepoImpl(gh<_i58.SupportTabDataSource>()));
  gh.factory<_i100.LinksImportantRepository>(
      () => _i101.LinkRepositoryImpl(gh<_i32.LinkDatasource>()));
  gh.lazySingleton<_i102.GetInvoicesByPrivilegesUsecase>(() =>
      _i102.GetInvoicesByPrivilegesUsecase(gh<_i75.InvoicesSectionRepo>()));
  gh.lazySingleton<_i103.CacheTokenUsecase>(
      () => _i103.CacheTokenUsecase(gh<_i82.LoginRepo>()));
  gh.lazySingleton<_i104.GetTokenUsecase>(
      () => _i104.GetTokenUsecase(gh<_i82.LoginRepo>()));
  gh.lazySingleton<_i105.LoginUsecase>(
      () => _i105.LoginUsecase(gh<_i82.LoginRepo>()));
  gh.lazySingleton<_i106.ValidateTokenUsecase>(
      () => _i106.ValidateTokenUsecase(gh<_i82.LoginRepo>()));
  gh.lazySingleton<_i107.VerifyOtpUsecase>(
      () => _i107.VerifyOtpUsecase(gh<_i82.LoginRepo>()));
  gh.lazySingleton<_i108.GetClientsAcceptUseCase>(
      () => _i108.GetClientsAcceptUseCase(gh<_i20.ClientsAcceptRepository>()));
  gh.lazySingleton<_i109.GeneralConfigsRepository>(() =>
      _i110.GeneralConfigsRepositoryImpl(gh<_i46.GeneralConfigsDatasource>()));
  gh.factory<_i111.CompanyRepository>(
      () => _i112.CompanyRepositoryImpl(gh<_i31.CommentCompanyDatasource>()));
  gh.factory<_i113.ClientsListRepository>(
      () => _i114.ClientsListRepositoryImpl(gh<_i30.ClientsListDatasource>()));
  gh.lazySingleton<_i115.AgentsDistributorsProfileRepo>(() =>
      _i116.AgentsDistributorsProfileRepoImpl(
          gh<_i80.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i117.AddDateInstallUsecase>(
      () => _i117.AddDateInstallUsecase(gh<_i98.SupportTabRepo>()));
  gh.lazySingleton<_i118.CancelDateInstallUsecase>(
      () => _i118.CancelDateInstallUsecase(gh<_i98.SupportTabRepo>()));
  gh.lazySingleton<_i119.GetInvoiceByClientUsecase>(
      () => _i119.GetInvoiceByClientUsecase(gh<_i98.SupportTabRepo>()));
  gh.lazySingleton<_i120.ReceiveDeviceUsecase>(
      () => _i120.ReceiveDeviceUsecase(gh<_i98.SupportTabRepo>()));
  gh.lazySingleton<_i121.ReturnInvoiceApproveUsecase>(
      () => _i121.ReturnInvoiceApproveUsecase(gh<_i98.SupportTabRepo>()));
  gh.lazySingleton<_i122.SetDateDoneUsecase>(
      () => _i122.SetDateDoneUsecase(gh<_i98.SupportTabRepo>()));
  gh.lazySingleton<_i123.SetReadyInstallUsecase>(
      () => _i123.SetReadyInstallUsecase(gh<_i98.SupportTabRepo>()));
  gh.lazySingleton<_i124.GetAllUsersUseCase>(
      () => _i124.GetAllUsersUseCase(gh<_i75.InvoicesSectionRepo>()));
  gh.singleton<_i125.CitiesCubit>(
      () => _i125.CitiesCubit(gh<_i62.GetCitiesUseCase>()));
  gh.factory<_i126.CommunicationListRepository>(() =>
      _i127.CommunicationListRepositoryImpl(
          gh<_i28.CommunicationListDatasource>()));
  gh.lazySingleton<_i128.GetBranchesForUserUsecase>(
      () => _i128.GetBranchesForUserUsecase(gh<_i44.UsersRepository>()));
  gh.lazySingleton<_i129.GetLevelsForUserUsecase>(
      () => _i129.GetLevelsForUserUsecase(gh<_i44.UsersRepository>()));
  gh.lazySingleton<_i130.GetManagesForUserUsecase>(
      () => _i130.GetManagesForUserUsecase(gh<_i44.UsersRepository>()));
  gh.factory<_i131.GetUsersUsecase>(
      () => _i131.GetUsersUsecase(gh<_i44.UsersRepository>()));
  gh.factory<_i132.ActionLinkUsecase>(
      () => _i132.ActionLinkUsecase(gh<_i100.LinksImportantRepository>()));
  gh.factory<_i133.GetLinkUsecase>(
      () => _i133.GetLinkUsecase(gh<_i100.LinksImportantRepository>()));
  gh.lazySingleton<_i134.ManageWithdrawalsRepository>(() =>
      _i135.ManageWithdrawalsRepositoryImpl(
          gh<_i26.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i136.AgentsDistributorsRepo>(() =>
      _i137.AgentsDistributorsRepoImpl(
          gh<_i55.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i138.RegionsRepository>(
      () => _i139.RegionsRepositoryImpl(gh<_i86.RegionsDatasource>()));
  gh.factory<_i140.AddParticipateCommentUsecase>(() =>
      _i140.AddParticipateCommentUsecase(gh<_i73.ParticipateListRepository>()));
  gh.factory<_i141.AddParticipateUserUsecase>(() =>
      _i141.AddParticipateUserUsecase(gh<_i73.ParticipateListRepository>()));
  gh.factory<_i142.EditParticipateUserUsecase>(() =>
      _i142.EditParticipateUserUsecase(gh<_i73.ParticipateListRepository>()));
  gh.factory<_i143.GetInvoiceByIdUsecase>(
      () => _i143.GetInvoiceByIdUsecase(gh<_i73.ParticipateListRepository>()));
  gh.factory<_i144.ParticipateClientListUsecase>(() =>
      _i144.ParticipateClientListUsecase(gh<_i73.ParticipateListRepository>()));
  gh.factory<_i145.ParticipateCommentListUsecase>(() =>
      _i145.ParticipateCommentListUsecase(
          gh<_i73.ParticipateListRepository>()));
  gh.factory<_i146.ParticipateInvoiceListUsecase>(() =>
      _i146.ParticipateInvoiceListUsecase(
          gh<_i73.ParticipateListRepository>()));
  gh.factory<_i147.ParticipateListUsecase>(
      () => _i147.ParticipateListUsecase(gh<_i73.ParticipateListRepository>()));
  gh.lazySingleton<_i148.ChangeParticipateStatusUsecase>(() =>
      _i148.ChangeParticipateStatusUsecase(
          gh<_i73.ParticipateListRepository>()));
  gh.factory<_i149.GetCommunicationListUsecase>(() =>
      _i149.GetCommunicationListUsecase(
          gh<_i126.CommunicationListRepository>()));
  gh.lazySingleton<_i150.CrudClientSupportFilesUsecase>(() =>
      _i150.CrudClientSupportFilesUsecase(
          repository: gh<_i113.ClientsListRepository>()));
  gh.lazySingleton<_i151.GetClientSupportFilesUsecase>(() =>
      _i151.GetClientSupportFilesUsecase(
          repository: gh<_i113.ClientsListRepository>()));
  gh.factory<_i152.LinkCubit>(() => _i152.LinkCubit(
        gh<_i133.GetLinkUsecase>(),
        gh<_i132.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i153.WaitingAgentsRepo>(
      () => _i154.WaitingAgentsRepoImpl(gh<_i78.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i155.ChangeStateAgentUseCase>(
      () => _i155.ChangeStateAgentUseCase(gh<_i136.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i156.GetAgentsAndDistributorsUseCase>(() =>
      _i156.GetAgentsAndDistributorsUseCase(
          gh<_i136.AgentsDistributorsRepo>()));
  gh.factory<_i157.ClientsAcceptCubit>(
      () => _i157.ClientsAcceptCubit(gh<_i108.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i158.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i158.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i134.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i159.GetWithdrawalsInvoicesUsecase>(() =>
      _i159.GetWithdrawalsInvoicesUsecase(
          gh<_i134.ManageWithdrawalsRepository>()));
  gh.factory<_i160.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i160.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i134.ManageWithdrawalsRepository>()));
  gh.factory<_i161.AddTaskUsecase>(
      () => _i161.AddTaskUsecase(gh<_i53.TaskRepository>()));
  gh.factory<_i162.ChangeStatusTaskUsecase>(
      () => _i162.ChangeStatusTaskUsecase(gh<_i53.TaskRepository>()));
  gh.factory<_i163.FilterTaskUsecase>(
      () => _i163.FilterTaskUsecase(gh<_i53.TaskRepository>()));
  gh.factory<_i164.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i164.GetUsersByDepartmentAndRegionUsecase(gh<_i53.TaskRepository>()));
  gh.lazySingleton<_i165.ExceededClientsUseCase>(
      () => _i165.ExceededClientsUseCase(gh<_i50.ExceededClientsRepo>()));
  gh.lazySingleton<_i166.TransferExceededClientsUseCase>(() =>
      _i166.TransferExceededClientsUseCase(gh<_i50.ExceededClientsRepo>()));
  gh.lazySingleton<_i167.EditAdvancedConfigsUsecase>(() =>
      _i167.EditAdvancedConfigsUsecase(gh<_i71.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i168.GetAdvancedConfigsUsecase>(() =>
      _i168.GetAdvancedConfigsUsecase(gh<_i71.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i169.DatesTableRepo>(
      () => _i170.DatesTableRepoImpl(gh<_i84.DatesTableDataSource>()));
  gh.factory<_i171.AddClientUserUsecase>(
      () => _i171.AddClientUserUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i172.ApproveRejectClientUsecase>(() =>
      _i172.ApproveRejectClientUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i173.ChangeTypeClientUsecase>(
      () => _i173.ChangeTypeClientUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i174.EditClientUserUsecase>(
      () => _i174.EditClientUserUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i175.GetClientsListByRegionUseCase>(() =>
      _i175.GetClientsListByRegionUseCase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i176.GetClientsListByUserUseCase>(() =>
      _i176.GetClientsListByUserUseCase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i177.GetClientsWithFilterUserUsecase>(() =>
      _i177.GetClientsWithFilterUserUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i178.GetClientMarketingReportUsecase>(() =>
      _i178.GetClientMarketingReportUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i179.GetRecommendedClientsUsecase>(() =>
      _i179.GetRecommendedClientsUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i180.GetSimilarClientsUsecase>(
      () => _i180.GetSimilarClientsUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i181.ReceiveClientUserUsecase>(
      () => _i181.ReceiveClientUserUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i182.TransferClientUserUsecase>(
      () => _i182.TransferClientUserUsecase(gh<_i113.ClientsListRepository>()));
  gh.factory<_i183.GetVersionUseCase>(
      () => _i183.GetVersionUseCase(gh<_i92.AppRepository>()));
  gh.factory<_i184.AddTicketCubit>(
      () => _i184.AddTicketCubit(gh<_i63.AddTicketUseCase>()));
  gh.lazySingleton<_i185.EditGeneralConfigsUsecase>(() =>
      _i185.EditGeneralConfigsUsecase(gh<_i109.GeneralConfigsRepository>()));
  gh.lazySingleton<_i186.GetGeneralConfigsUsecase>(() =>
      _i186.GetGeneralConfigsUsecase(gh<_i109.GeneralConfigsRepository>()));
  gh.lazySingleton<_i187.AddAgentUseCase>(
      () => _i187.AddAgentUseCase(gh<_i94.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i188.UpdateAgentUseCase>(
      () => _i188.UpdateAgentUseCase(gh<_i94.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i189.GetDelayInstallReportsUseCase>(() =>
      _i189.GetDelayInstallReportsUseCase(gh<_i90.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i190.CrudAgentSupportFilesUsecase>(() =>
      _i190.CrudAgentSupportFilesUsecase(
          gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i191.GetLatestClientsUseCase>(() =>
      _i191.GetLatestClientsUseCase(gh<_i56.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i192.TaskCubit>(() => _i192.TaskCubit(
        gh<_i161.AddTaskUsecase>(),
        gh<_i163.FilterTaskUsecase>(),
        gh<_i162.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i193.SupportTabCubit>(() => _i193.SupportTabCubit(
        gh<_i119.GetInvoiceByClientUsecase>(),
        gh<_i117.AddDateInstallUsecase>(),
        gh<_i122.SetDateDoneUsecase>(),
        gh<_i123.SetReadyInstallUsecase>(),
        gh<_i121.ReturnInvoiceApproveUsecase>(),
        gh<_i120.ReceiveDeviceUsecase>(),
        gh<_i118.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i194.AddAgentDateUseCase>(() =>
      _i194.AddAgentDateUseCase(gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.factory<_i195.ClientsListBloc>(() => _i195.ClientsListBloc(
        gh<_i177.GetClientsWithFilterUserUsecase>(),
        gh<_i179.GetRecommendedClientsUsecase>(),
        gh<_i171.AddClientUserUsecase>(),
        gh<_i174.EditClientUserUsecase>(),
        gh<_i173.ChangeTypeClientUsecase>(),
        gh<_i180.GetSimilarClientsUsecase>(),
        gh<_i172.ApproveRejectClientUsecase>(),
        gh<_i150.CrudClientSupportFilesUsecase>(),
        gh<_i151.GetClientSupportFilesUsecase>(),
        gh<_i182.TransferClientUserUsecase>(),
        gh<_i181.ReceiveClientUserUsecase>(),
        gh<_i178.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i196.AgentsDistributorsActionsCubit>(
      () => _i196.AgentsDistributorsActionsCubit(
            gh<_i62.GetCitiesUseCase>(),
            gh<_i187.AddAgentUseCase>(),
            gh<_i188.UpdateAgentUseCase>(),
          ));
  gh.factory<_i197.LoginCubit>(() => _i197.LoginCubit(
        gh<_i105.LoginUsecase>(),
        gh<_i107.VerifyOtpUsecase>(),
        gh<_i103.CacheTokenUsecase>(),
        gh<_i104.GetTokenUsecase>(),
        gh<_i106.ValidateTokenUsecase>(),
      ));
  gh.factory<_i198.InvoicesSectionCubit>(() => _i198.InvoicesSectionCubit(
        gh<_i102.GetInvoicesByPrivilegesUsecase>(),
        gh<_i156.GetAgentsAndDistributorsUseCase>(),
        gh<_i147.ParticipateListUsecase>(),
        gh<_i124.GetAllUsersUseCase>(),
      ));
  gh.factory<_i199.AddLevelUsecase>(
      () => _i199.AddLevelUsecase(gh<_i88.PrivilegeRepository>()));
  gh.factory<_i200.GetLevelsUsecase>(
      () => _i200.GetLevelsUsecase(gh<_i88.PrivilegeRepository>()));
  gh.factory<_i201.GetPrivilegesUsecase>(
      () => _i201.GetPrivilegesUsecase(gh<_i88.PrivilegeRepository>()));
  gh.factory<_i202.UpdatePrivilegeUsecase>(
      () => _i202.UpdatePrivilegeUsecase(gh<_i88.PrivilegeRepository>()));
  gh.factory<_i203.AttachmentsRowCubit>(() => _i203.AttachmentsRowCubit(
        gh<_i151.GetClientSupportFilesUsecase>(),
        gh<_i150.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i204.AddCommentUsecase>(
      () => _i204.AddCommentUsecase(gh<_i111.CompanyRepository>()));
  gh.factory<_i205.GetCommentUsecase>(
      () => _i205.GetCommentUsecase(gh<_i111.CompanyRepository>()));
  gh.factory<_i206.DelayInstallReportsCubit>(() =>
      _i206.DelayInstallReportsCubit(
          gh<_i189.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i207.GetRegionsByIdCountryUseCase>(
      () => _i207.GetRegionsByIdCountryUseCase(gh<_i138.RegionsRepository>()));
  gh.lazySingleton<_i208.PrivilegeCubit>(() => _i208.PrivilegeCubit(
        gh<_i200.GetLevelsUsecase>(),
        gh<_i201.GetPrivilegesUsecase>(),
        gh<_i202.UpdatePrivilegeUsecase>(),
        gh<_i199.AddLevelUsecase>(),
      ));
  gh.factory<_i209.AdvancedCofigsCubit>(() => _i209.AdvancedCofigsCubit(
        gh<_i168.GetAdvancedConfigsUsecase>(),
        gh<_i167.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i210.ParticipateListBloc>(() => _i210.ParticipateListBloc(
        gh<_i147.ParticipateListUsecase>(),
        gh<_i141.AddParticipateUserUsecase>(),
        gh<_i142.EditParticipateUserUsecase>(),
        gh<_i144.ParticipateClientListUsecase>(),
        gh<_i146.ParticipateInvoiceListUsecase>(),
        gh<_i143.GetInvoiceByIdUsecase>(),
        gh<_i145.ParticipateCommentListUsecase>(),
        gh<_i140.AddParticipateCommentUsecase>(),
        gh<_i148.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i211.GeneralCofigsCubit>(() => _i211.GeneralCofigsCubit(
        gh<_i186.GetGeneralConfigsUsecase>(),
        gh<_i185.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i212.AddAgentCommentUsecase>(() =>
      _i212.AddAgentCommentUsecase(gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i213.DoneTrainingUsecase>(() =>
      _i213.DoneTrainingUsecase(gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i214.GetAgentUsecase>(
      () => _i214.GetAgentUsecase(gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i215.GetAgentClientListUsecase>(() =>
      _i215.GetAgentClientListUsecase(
          gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i216.GetAgentCommentsListUsecase>(() =>
      _i216.GetAgentCommentsListUsecase(
          gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i217.GetAgentDatesListUsecase>(() =>
      _i217.GetAgentDatesListUsecase(
          gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i218.GetAgentInvoiceListUsecase>(() =>
      _i218.GetAgentInvoiceListUsecase(
          gh<_i115.AgentsDistributorsProfileRepo>()));
  gh.factory<_i219.AddRejectReasonsUsecase>(() =>
      _i219.AddRejectReasonsUsecase(gh<_i134.ManageWithdrawalsRepository>()));
  gh.factory<_i220.EditRejectReasonsUsecase>(() =>
      _i220.EditRejectReasonsUsecase(gh<_i134.ManageWithdrawalsRepository>()));
  gh.factory<_i221.GetRejectReasonsUsecase>(() =>
      _i221.GetRejectReasonsUsecase(gh<_i134.ManageWithdrawalsRepository>()));
  gh.factory<_i222.GetUserSeriesUsecase>(() =>
      _i222.GetUserSeriesUsecase(gh<_i134.ManageWithdrawalsRepository>()));
  gh.factory<_i223.GetWithdrawnDetailsUsecase>(() =>
      _i223.GetWithdrawnDetailsUsecase(
          gh<_i134.ManageWithdrawalsRepository>()));
  gh.factory<_i224.SetApproveSeriesUsecase>(() =>
      _i224.SetApproveSeriesUsecase(gh<_i134.ManageWithdrawalsRepository>()));
  gh.factory<_i225.UpdateSeriesUsecase>(
      () => _i225.UpdateSeriesUsecase(gh<_i134.ManageWithdrawalsRepository>()));
  gh.singleton<_i226.AppManagerCubit>(
      () => _i226.AppManagerCubit(gh<_i183.GetVersionUseCase>()));
  gh.factory<_i227.RegionsCubit>(
      () => _i227.RegionsCubit(gh<_i207.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i228.GetWaitingAgentsUsecase>(
      () => _i228.GetWaitingAgentsUsecase(gh<_i153.WaitingAgentsRepo>()));
  gh.factory<_i229.UsersCubit>(() => _i229.UsersCubit(
        gh<_i131.GetUsersUsecase>(),
        gh<_i52.ActionUserUsecase>(),
        gh<_i164.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i130.GetManagesForUserUsecase>(),
        gh<_i129.GetLevelsForUserUsecase>(),
        gh<_i128.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i230.CommunicationListBloc>(() =>
      _i230.CommunicationListBloc(gh<_i149.GetCommunicationListUsecase>()));
  gh.factory<_i231.AgentsDistributorsCubit>(() => _i231.AgentsDistributorsCubit(
        gh<_i156.GetAgentsAndDistributorsUseCase>(),
        gh<_i155.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i232.ExceededClientsCubit>(() => _i232.ExceededClientsCubit(
        gh<_i165.ExceededClientsUseCase>(),
        gh<_i166.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i233.LatestClientsUpdatesCubit>(() =>
      _i233.LatestClientsUpdatesCubit(gh<_i191.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i234.CancelScheduleUsecase>(
      () => _i234.CancelScheduleUsecase(gh<_i169.DatesTableRepo>()));
  gh.lazySingleton<_i235.ChangeDateToDonUsecase>(
      () => _i235.ChangeDateToDonUsecase(gh<_i169.DatesTableRepo>()));
  gh.lazySingleton<_i236.GetDateInstallationUsecase>(
      () => _i236.GetDateInstallationUsecase(gh<_i169.DatesTableRepo>()));
  gh.lazySingleton<_i237.GetInvoicesByClientForDateUsecase>(() =>
      _i237.GetInvoicesByClientForDateUsecase(gh<_i169.DatesTableRepo>()));
  gh.lazySingleton<_i238.GetSubscribedClientsUsecase>(
      () => _i238.GetSubscribedClientsUsecase(gh<_i169.DatesTableRepo>()));
  gh.lazySingleton<_i239.RescheduleDateUsecase>(
      () => _i239.RescheduleDateUsecase(gh<_i169.DatesTableRepo>()));
  gh.lazySingleton<_i240.ReturnScheduleVisitToOpenUsecase>(
      () => _i240.ReturnScheduleVisitToOpenUsecase(gh<_i169.DatesTableRepo>()));
  gh.factory<_i241.AgentsDistributorsProfileBloc>(
      () => _i241.AgentsDistributorsProfileBloc(
            gh<_i215.GetAgentClientListUsecase>(),
            gh<_i218.GetAgentInvoiceListUsecase>(),
            gh<_i143.GetInvoiceByIdUsecase>(),
            gh<_i216.GetAgentCommentsListUsecase>(),
            gh<_i212.AddAgentCommentUsecase>(),
            gh<_i213.DoneTrainingUsecase>(),
            gh<_i194.AddAgentDateUseCase>(),
            gh<_i217.GetAgentDatesListUsecase>(),
            gh<_i190.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i242.DatesTableCubit>(() => _i242.DatesTableCubit(
        gh<_i236.GetDateInstallationUsecase>(),
        gh<_i239.RescheduleDateUsecase>(),
        gh<_i235.ChangeDateToDonUsecase>(),
        gh<_i234.CancelScheduleUsecase>(),
        gh<_i240.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i238.GetSubscribedClientsUsecase>(),
        gh<_i237.GetInvoicesByClientForDateUsecase>(),
        gh<_i117.AddDateInstallUsecase>(),
      ));
  gh.factory<_i243.CompanyCubit>(() => _i243.CompanyCubit(
        gh<_i205.GetCommentUsecase>(),
        gh<_i204.AddCommentUsecase>(),
      ));
  gh.factory<_i244.ManageWithdrawalsCubit>(() => _i244.ManageWithdrawalsCubit(
        gh<_i222.GetUserSeriesUsecase>(),
        gh<_i225.UpdateSeriesUsecase>(),
        gh<_i131.GetUsersUsecase>(),
        gh<_i159.GetWithdrawalsInvoicesUsecase>(),
        gh<_i160.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i224.SetApproveSeriesUsecase>(),
        gh<_i223.GetWithdrawnDetailsUsecase>(),
        gh<_i219.AddRejectReasonsUsecase>(),
        gh<_i221.GetRejectReasonsUsecase>(),
        gh<_i220.EditRejectReasonsUsecase>(),
        gh<_i158.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i245.WaitingAgentsCubit>(
      () => _i245.WaitingAgentsCubit(gh<_i228.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i246.AppModule {}
