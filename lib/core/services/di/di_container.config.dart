// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i39;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i135;
import '../../../features/app/domain/repositories/app_repository.dart' as _i134;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i240;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i302;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i234;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i97;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i261;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i260;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i277;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i278;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i279;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i280;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i281;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i326;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i22;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i30;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i29;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i148;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i223;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i21;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i70;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i69;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i85;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i141;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i34;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i50;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i49;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i90;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i91;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i92;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i94;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i93;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i95;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i241;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i115;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i96;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i13;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i124;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i123;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i199;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i270;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i33;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i129;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i128;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i153;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i246;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i26;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i167;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i166;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i284;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i325;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i20;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i81;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i80;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i204;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i307;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i40;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i110;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i109;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i146;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i266;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i47;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i88;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i87;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i89;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i182;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i82;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i143;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i142;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i156;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i157;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i158;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i159;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i160;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i161;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i162;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i254;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i120;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i184;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i183;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i271;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i303;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i46;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i61;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i60;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i83;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i185;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i48;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i101;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i100;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i235;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i236;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i274;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i64;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i150;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i149;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i244;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i245;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i283;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i41;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i131;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i130;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i262;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i263;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i264;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i265;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i272;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i36;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i63;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i62;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i73;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i170;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i171;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i172;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i173;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i306;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i28;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i178;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i177;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i295;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i224;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i296;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i225;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i297;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i298;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i227;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i226;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i299;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i300;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i301;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i310;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i31;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i165;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i164;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i285;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i324;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i42;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i187;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i186;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i207;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i208;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i209;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i286;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i210;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i214;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i287;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i211;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i212;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i213;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i219;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i215;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i216;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i217;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i218;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i322;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i37;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i201;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i200;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i251;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i282;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i32;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i66;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i65;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i111;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i138;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i104;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i243;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i242;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i273;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i311;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i11;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i68;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i67;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i84;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i197;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i43;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i152;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i151;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i267;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i268;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i323;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i38;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i72;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i71;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i232;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i233;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i309;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i86;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i106;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i105;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i163;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i147;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i259;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i78;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i114;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i155;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i180;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i136;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i154;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i179;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i288;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i256;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i247;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i221;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i250;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i289;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i290;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i291;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i292;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i293;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i294;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i222;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i248;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i258;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i321;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i308;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i44;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i145;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i144;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i174;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i202;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i25;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i103;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i102;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i188;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i196;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i190;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i191;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i192;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i193;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i194;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i195;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i276;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i19;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i54;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i53;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i122;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i255;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i117;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i116;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i203;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i252;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i27;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i99;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i98;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i198;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i220;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i12;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i113;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i112;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i181;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i305;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i18;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i52;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i51;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i140;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i257;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i17;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i75;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i74;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i79;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i237;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i118;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i239;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i238;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i313;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i314;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i315;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i316;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i317;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i318;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i319;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i320;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i327;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i10;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i58;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i57;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i119;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i139;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i24;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i133;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i132;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i249;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i269;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i56;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i55;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i59;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i107;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i35;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i169;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i168;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i176;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i275;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i108;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i206;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i205;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i304;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i328;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i45;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i77;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i76;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i228;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i229;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i230;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i231;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i253;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i312;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i125;
import '../cache_services/prefs_consumer.dart' as _i127;
import '../cache_services/secure_storage_consumer.dart' as _i126;
import '../maps/location_services.dart' as _i121;
import 'di_container.dart' as _i329;

const String _dev = 'dev';
const String _test = 'test';

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
  gh.singleton<_i3.Logger>(() => appModule.logger);
  gh.singleton<_i4.Dio>(() => appModule.dio);
  gh.lazySingleton<_i5.Api>(() => _i5.Api());
  gh.lazySingleton<_i6.Location>(() => appModule.location);
  gh.singleton<_i7.ApiServices>(() => _i8.DioServices(gh<_i4.Dio>()));
  gh.lazySingleton<_i9.SupportClientsAcceptDatasource>(
      () => _i9.SupportClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i10.DelayAfterInstallDatasource>(
      () => _i10.DelayAfterInstallDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i11.PendingInvoicesDatasource>(
      () => _i11.PendingInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i12.ProductsSalesReportsDatasource>(
      () => _i12.ProductsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i13.GreetingCommunicationDatasource>(
      () => _i13.GreetingCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i14.AgentsDistributorsActionsDataSource>(() =>
      _i14.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i15.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i16.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i17.ClientsInstallReportsDatasource>(
      () => _i17.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i18.RegionsSalesReportsDatasource>(
      () => _i18.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i19.ClientsDebtsReportsDatasource>(
      () => _i19.ClientsDebtsReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.PreviousRatingsDatasource>(
      () => _i20.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.ClientsCareReportsDatasource>(
      () => _i21.ClientsCareReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.ClientsAcceptDatasource>(
      () => _i22.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.ClientsStatusReportsDatasource>(
      () => _i23.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.DelayInstallReportsDatasource>(
      () => _i24.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.ParticipatesListDatasource>(
      () => _i25.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.PeriodicCommunicationDatasource>(
      () => _i26.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.EmployeesSalesReportsDatasource>(
      () => _i27.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.ManageWithdrawalsDatasource>(
      () => _i28.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.ClientsAcceptRepository>(() =>
      _i30.ClientsAcceptRepositoryImpl(gh<_i22.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i31.ClientsDebtsDatasource>(
      () => _i31.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.FinancePendingDatasource>(
      () => _i32.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.InstallQualityDatasource>(
      () => _i33.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i34.TicketsDataSource>(
      () => _i34.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i35.SupportClientsInvoicesDatasource>(
      () => _i35.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i36.UsersDatasource>(
      () => _i36.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i15.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i16.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i37.ClientsTransferApprovalsDatasource>(
      () => _i37.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i38.ExceededClientsDatasource>(
      () => _i38.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i39.AppDatasource>(
      () => _i39.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i40.SpecialClientsDatasource>(
      () => _i40.SpecialClientsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i41.PrivilegeDatasource>(
      () => _i41.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i42.ClientsListDatasource>(
      () => _i42.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i43.CommentCompanyDatasource>(
      () => _i43.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i44.LinkDatasource>(
      () => _i44.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i45.TaskDatasource>(
      () => _i45.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i46.UsersDatasource>(
      () => _i46.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i47.CitiesDatasource>(
      () => _i47.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i48.AdvancedConfigsDatasource>(
      () => _i48.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i49.TicketsRepo>(
      () => _i50.TicketsRepoImpl(gh<_i34.TicketsDataSource>()));
  gh.lazySingleton<_i51.RegionsSalesReportsRepo>(() =>
      _i52.RegionsSalesReportsRepoImpl(
          gh<_i18.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i53.ClientsDebtsReportsRepo>(() =>
      _i54.ClientsDebtsReportsRepoImpl(
          gh<_i19.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i55.SupportClientsAcceptRepository>(() =>
      _i56.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i57.DelayAfterInstallRepo>(() =>
      _i58.DelayAfterInstallRepoImpl(gh<_i10.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i59.GetSupportClientsAcceptUseCase>(() =>
      _i59.GetSupportClientsAcceptUseCase(
          gh<_i55.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i60.UsersRepository>(
      () => _i61.UsersRepositoryImpl(gh<_i46.UsersDatasource>()));
  gh.lazySingleton<_i62.UsersRepository>(
      () => _i63.UsersRepositoryImpl(gh<_i36.UsersDatasource>()));
  gh.lazySingleton<_i64.GeneralConfigsDatasource>(
      () => _i64.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i65.FinancePendingRepo>(
      () => _i66.FinancePendingRepoImpl(gh<_i32.FinancePendingDatasource>()));
  gh.lazySingleton<_i67.PendingInvoicesRepo>(
      () => _i68.PendingInvoicesRepoImpl(gh<_i11.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i69.ClientsCareReportsRepo>(() =>
      _i70.ClientsCareReportsRepoImpl(gh<_i21.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i71.ExceededClientsRepo>(
      () => _i72.ExceededClientsRepoImpl(gh<_i38.ExceededClientsDatasource>()));
  gh.factory<_i73.ActionUserUsecase>(
      () => _i73.ActionUserUsecase(gh<_i62.UsersRepository>()));
  gh.lazySingleton<_i74.ClientsInstallReportsRepo>(() =>
      _i75.ClientsInstallReportsRepoImpl(
          gh<_i17.ClientsInstallReportsDatasource>()));
  gh.factory<_i76.TaskRepository>(
      () => _i77.TaskRepositoryImpl(gh<_i45.TaskDatasource>()));
  gh.lazySingleton<_i78.AgentsDistributorsDataSource>(
      () => _i78.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i79.GetClientsInstallReportsUsecase>(() =>
      _i79.GetClientsInstallReportsUsecase(
          gh<_i74.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i80.PreviousRatingsRepo>(
      () => _i81.PreviousRatingsRepoImpl(gh<_i20.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i82.SupportTabDataSource>(
      () => _i82.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i83.GetUsersUsecase>(
      () => _i83.GetUsersUsecase(gh<_i60.UsersRepository>()));
  gh.lazySingleton<_i84.GetPendingInvoicesUsecase>(
      () => _i84.GetPendingInvoicesUsecase(gh<_i67.PendingInvoicesRepo>()));
  gh.lazySingleton<_i85.GetClientsCareReportsUsecase>(() =>
      _i85.GetClientsCareReportsUsecase(gh<_i69.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i86.InvoicesTabDataSource>(
      () => _i86.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i87.CitiesRepository>(
      () => _i88.CitiesRepositoryImpl(gh<_i47.CitiesDatasource>()));
  gh.lazySingleton<_i89.GetCitiesUseCase>(
      () => _i89.GetCitiesUseCase(gh<_i87.CitiesRepository>()));
  gh.lazySingleton<_i90.AddTicketUseCase>(
      () => _i90.AddTicketUseCase(gh<_i49.TicketsRepo>()));
  gh.lazySingleton<_i91.EditTicketTypeUseCase>(
      () => _i91.EditTicketTypeUseCase(gh<_i49.TicketsRepo>()));
  gh.lazySingleton<_i92.GetClientTicketsUseCase>(
      () => _i92.GetClientTicketsUseCase(gh<_i49.TicketsRepo>()));
  gh.lazySingleton<_i93.GetTicketsUseCase>(
      () => _i93.GetTicketsUseCase(gh<_i49.TicketsRepo>()));
  gh.lazySingleton<_i94.GetTicketByIdUseCase>(
      () => _i94.GetTicketByIdUseCase(gh<_i49.TicketsRepo>()));
  gh.lazySingleton<_i95.TransferTicketUseCase>(
      () => _i95.TransferTicketUseCase(gh<_i49.TicketsRepo>()));
  gh.factory<_i96.TicketsCubit>(() => _i96.TicketsCubit(
        gh<_i93.GetTicketsUseCase>(),
        gh<_i94.GetTicketByIdUseCase>(),
        gh<_i92.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i97.LoginRemoteDataSource>(
      () => _i97.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i98.EmployeesSalesReportsRepo>(() =>
      _i99.EmployeesSalesReportsRepoImpl(
          gh<_i27.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i100.AdvancedConfigsRepository>(() =>
      _i101.AdvancedConfigsRepositoryImpl(
          gh<_i48.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i102.ParticipateListRepository>(() =>
      _i103.ParticipateListRepositoryImpl(
          gh<_i25.ParticipatesListDatasource>()));
  gh.lazySingleton<_i104.LatestClientsUpdatesDatasource>(
      () => _i104.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i105.InvoicesSectionRepo>(
      () => _i106.InvoicesTabRepoImpl(gh<_i86.InvoicesTabDataSource>()));
  gh.factory<_i107.SupportClientsAcceptCubit>(() =>
      _i107.SupportClientsAcceptCubit(
          gh<_i59.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i108.WaitingAgentsDataSource>(
      () => _i108.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i109.SpecialClientsRepository>(() =>
      _i110.SpecialClientsRepositoryImpl(gh<_i40.SpecialClientsDatasource>()));
  gh.lazySingleton<_i111.GetFinancePendingInvoicesUsecase>(() =>
      _i111.GetFinancePendingInvoicesUsecase(gh<_i65.FinancePendingRepo>()));
  gh.lazySingleton<_i112.ProductsSalesReportsRepo>(() =>
      _i113.ProductsSalesReportsRepoImpl(
          gh<_i12.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i114.AgentsDistributorsProfileDataSource>(() =>
      _i114.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i115.EditTicketCubit>(() => _i115.EditTicketCubit(
        gh<_i91.EditTicketTypeUseCase>(),
        gh<_i95.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i116.ClientsStatusReportsRepo>(() =>
      _i117.ClientsStatusReportsRepoImpl(
          gh<_i23.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i118.DatesTableDataSource>(
      () => _i118.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i119.GetDelayAfterInstallUseCase>(() =>
      _i119.GetDelayAfterInstallUseCase(gh<_i57.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i120.RegionsDatasource>(
      () => _i120.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i121.LocationServices>(
      () => _i121.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i122.GetClientsDebtsReportsUsecase>(() =>
      _i122.GetClientsDebtsReportsUsecase(gh<_i53.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i123.GreetingCommunicationRepo>(() =>
      _i124.GreetingCommunicationRepoImpl(
          gh<_i13.GreetingCommunicationDatasource>()));
  gh.singleton<_i125.CacheServices>(
    () => _i126.SecureStorageConsumer(gh<_i16.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i125.CacheServices>(() async =>
      _i127.PrefsConsumer(await gh.getAsync<_i15.SharedPreferences>()));
  gh.lazySingleton<_i128.InstallQualityRepo>(
      () => _i129.InstallQualityRepoImpl(gh<_i33.InstallQualityDatasource>()));
  gh.factory<_i130.PrivilegeRepository>(
      () => _i131.PrivilegeRepositoryImpl(gh<_i41.PrivilegeDatasource>()));
  gh.lazySingleton<_i132.DelayInstallReportsRepo>(() =>
      _i133.DelayInstallReportsRepoImpl(
          gh<_i24.DelayInstallReportsDatasource>()));
  gh.factory<_i134.AppRepository>(
      () => _i135.AppRepositoryImpl(gh<_i39.AppDatasource>()));
  gh.lazySingleton<_i136.AgentsDistributorsActionsRepo>(() =>
      _i137.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i138.FinancePendingCubit>(() =>
      _i138.FinancePendingCubit(gh<_i111.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i139.DelayAfterInstallCubit>(() =>
      _i139.DelayAfterInstallCubit(gh<_i119.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i140.GetRegionsSalesReportsUsecase>(() =>
      _i140.GetRegionsSalesReportsUsecase(gh<_i51.RegionsSalesReportsRepo>()));
  gh.factory<_i141.ClientsCareReportsCubit>(() =>
      _i141.ClientsCareReportsCubit(gh<_i85.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i142.SupportTabRepo>(
      () => _i143.SupportTabRepoImpl(gh<_i82.SupportTabDataSource>()));
  gh.factory<_i144.LinksImportantRepository>(
      () => _i145.LinkRepositoryImpl(gh<_i44.LinkDatasource>()));
  gh.factory<_i146.GetSpecialClientsUsecase>(() =>
      _i146.GetSpecialClientsUsecase(gh<_i109.SpecialClientsRepository>()));
  gh.lazySingleton<_i147.GetInvoicesByPrivilegesUsecase>(() =>
      _i147.GetInvoicesByPrivilegesUsecase(gh<_i105.InvoicesSectionRepo>()));
  gh.lazySingleton<_i148.GetClientsAcceptUseCase>(
      () => _i148.GetClientsAcceptUseCase(gh<_i29.ClientsAcceptRepository>()));
  gh.lazySingleton<_i149.GeneralConfigsRepository>(() =>
      _i150.GeneralConfigsRepositoryImpl(gh<_i64.GeneralConfigsDatasource>()));
  gh.factory<_i151.CompanyRepository>(
      () => _i152.CompanyRepositoryImpl(gh<_i43.CommentCompanyDatasource>()));
  gh.lazySingleton<_i153.GetInstallUseCase>(
      () => _i153.GetInstallUseCase(gh<_i128.InstallQualityRepo>()));
  gh.lazySingleton<_i154.AgentsDistributorsProfileRepo>(() =>
      _i155.AgentsDistributorsProfileRepoImpl(
          gh<_i114.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i156.AddDateInstallUsecase>(
      () => _i156.AddDateInstallUsecase(gh<_i142.SupportTabRepo>()));
  gh.lazySingleton<_i157.CancelDateInstallUsecase>(
      () => _i157.CancelDateInstallUsecase(gh<_i142.SupportTabRepo>()));
  gh.lazySingleton<_i158.GetInvoiceByClientUsecase>(
      () => _i158.GetInvoiceByClientUsecase(gh<_i142.SupportTabRepo>()));
  gh.lazySingleton<_i159.ReceiveDeviceUsecase>(
      () => _i159.ReceiveDeviceUsecase(gh<_i142.SupportTabRepo>()));
  gh.lazySingleton<_i160.ReturnInvoiceApproveUsecase>(
      () => _i160.ReturnInvoiceApproveUsecase(gh<_i142.SupportTabRepo>()));
  gh.lazySingleton<_i161.SetDateDoneUsecase>(
      () => _i161.SetDateDoneUsecase(gh<_i142.SupportTabRepo>()));
  gh.lazySingleton<_i162.SetReadyInstallUsecase>(
      () => _i162.SetReadyInstallUsecase(gh<_i142.SupportTabRepo>()));
  gh.lazySingleton<_i163.GetAllUsersUseCase>(
      () => _i163.GetAllUsersUseCase(gh<_i105.InvoicesSectionRepo>()));
  gh.lazySingleton<_i164.ClientsDebtsRepo>(
      () => _i165.ClientsDebtsRepoImpl(gh<_i31.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i166.PeriodicCommunicationRepo>(() =>
      _i167.PeriodicCommunicationRepoImpl(
          gh<_i26.PeriodicCommunicationDatasource>()));
  gh.lazySingleton<_i168.SupportClientsInvoicesRepo>(() =>
      _i169.SupportClientsInvoicesRepoImpl(
          gh<_i35.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i170.GetBranchesForUserUsecase>(
      () => _i170.GetBranchesForUserUsecase(gh<_i62.UsersRepository>()));
  gh.lazySingleton<_i171.GetLevelsForUserUsecase>(
      () => _i171.GetLevelsForUserUsecase(gh<_i62.UsersRepository>()));
  gh.lazySingleton<_i172.GetManagesForUserUsecase>(
      () => _i172.GetManagesForUserUsecase(gh<_i62.UsersRepository>()));
  gh.factory<_i173.GetUsersUsecase>(
      () => _i173.GetUsersUsecase(gh<_i62.UsersRepository>()));
  gh.factory<_i174.ActionLinkUsecase>(
      () => _i174.ActionLinkUsecase(gh<_i144.LinksImportantRepository>()));
  gh.factory<_i175.GetLinkUsecase>(
      () => _i175.GetLinkUsecase(gh<_i144.LinksImportantRepository>()));
  gh.lazySingleton<_i176.GetSupportClientsInvoicesUseCase>(() =>
      _i176.GetSupportClientsInvoicesUseCase(
          gh<_i168.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i177.ManageWithdrawalsRepository>(() =>
      _i178.ManageWithdrawalsRepositoryImpl(
          gh<_i28.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i179.AgentsDistributorsRepo>(() =>
      _i180.AgentsDistributorsRepoImpl(
          gh<_i78.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i181.GetProductsSalesReportsUsecase>(() =>
      _i181.GetProductsSalesReportsUsecase(
          gh<_i112.ProductsSalesReportsRepo>()));
  gh.singleton<_i182.CitiesCubit>(
      () => _i182.CitiesCubit(gh<_i89.GetCitiesUseCase>()));
  gh.lazySingleton<_i183.RegionsRepository>(
      () => _i184.RegionsRepositoryImpl(gh<_i120.RegionsDatasource>()));
  gh.factory<_i185.UsersTypeCubit>(
      () => _i185.UsersTypeCubit(gh<_i83.GetUsersUsecase>()));
  gh.factory<_i186.ClientsListRepository>(
      () => _i187.ClientsListRepositoryImpl(gh<_i42.ClientsListDatasource>()));
  gh.factory<_i188.AddParticipateCommentUsecase>(() =>
      _i188.AddParticipateCommentUsecase(
          gh<_i102.ParticipateListRepository>()));
  gh.factory<_i189.AddParticipateUserUsecase>(() =>
      _i189.AddParticipateUserUsecase(gh<_i102.ParticipateListRepository>()));
  gh.factory<_i190.EditParticipateUserUsecase>(() =>
      _i190.EditParticipateUserUsecase(gh<_i102.ParticipateListRepository>()));
  gh.factory<_i191.GetInvoiceByIdUsecase>(
      () => _i191.GetInvoiceByIdUsecase(gh<_i102.ParticipateListRepository>()));
  gh.factory<_i192.ParticipateClientListUsecase>(() =>
      _i192.ParticipateClientListUsecase(
          gh<_i102.ParticipateListRepository>()));
  gh.factory<_i193.ParticipateCommentListUsecase>(() =>
      _i193.ParticipateCommentListUsecase(
          gh<_i102.ParticipateListRepository>()));
  gh.factory<_i194.ParticipateInvoiceListUsecase>(() =>
      _i194.ParticipateInvoiceListUsecase(
          gh<_i102.ParticipateListRepository>()));
  gh.factory<_i195.ParticipateListUsecase>(() =>
      _i195.ParticipateListUsecase(gh<_i102.ParticipateListRepository>()));
  gh.lazySingleton<_i196.ChangeParticipateStatusUsecase>(() =>
      _i196.ChangeParticipateStatusUsecase(
          gh<_i102.ParticipateListRepository>()));
  gh.factory<_i197.PendingInvoicesCubit>(
      () => _i197.PendingInvoicesCubit(gh<_i84.GetPendingInvoicesUsecase>()));
  gh.lazySingleton<_i198.GetEmployeesSalesReportsUsecase>(() =>
      _i198.GetEmployeesSalesReportsUsecase(
          gh<_i98.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i199.GetGreetingCommunicationUseCase>(() =>
      _i199.GetGreetingCommunicationUseCase(
          gh<_i123.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i200.ClientsTransferApprovalsRepo>(() =>
      _i201.ClientsTransferApprovalsRepoImpl(
          gh<_i37.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i202.LinkCubit>(() => _i202.LinkCubit(
        gh<_i175.GetLinkUsecase>(),
        gh<_i174.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i203.GetClientsStatusReportsUsecase>(() =>
      _i203.GetClientsStatusReportsUsecase(
          gh<_i116.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i204.GetPreviousRatingsUsecase>(
      () => _i204.GetPreviousRatingsUsecase(gh<_i80.PreviousRatingsRepo>()));
  gh.lazySingleton<_i205.WaitingAgentsRepo>(
      () => _i206.WaitingAgentsRepoImpl(gh<_i108.WaitingAgentsDataSource>()));
  gh.factory<_i207.AddClientUserUsecase>(
      () => _i207.AddClientUserUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i208.ApproveRejectClientUsecase>(() =>
      _i208.ApproveRejectClientUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i209.ChangeTypeClientUsecase>(
      () => _i209.ChangeTypeClientUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i210.EditClientUserUsecase>(
      () => _i210.EditClientUserUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i211.GetClientsListByRegionUseCase>(() =>
      _i211.GetClientsListByRegionUseCase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i212.GetClientsListByUserUseCase>(() =>
      _i212.GetClientsListByUserUseCase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i213.GetClientsWithFilterUserUsecase>(() =>
      _i213.GetClientsWithFilterUserUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i214.GetClientMarketingReportUsecase>(() =>
      _i214.GetClientMarketingReportUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i215.GetRecommendedClientsUsecase>(() =>
      _i215.GetRecommendedClientsUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i216.GetSimilarClientsUsecase>(
      () => _i216.GetSimilarClientsUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i217.ReceiveClientUserUsecase>(
      () => _i217.ReceiveClientUserUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i218.TransferClientUserUsecase>(
      () => _i218.TransferClientUserUsecase(gh<_i186.ClientsListRepository>()));
  gh.lazySingleton<_i219.GetHighSimilarClientsUsecase>(() =>
      _i219.GetHighSimilarClientsUsecase(gh<_i186.ClientsListRepository>()));
  gh.factory<_i220.EmployeesSalesReportsCubit>(() =>
      _i220.EmployeesSalesReportsCubit(
          gh<_i198.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i221.ChangeStateAgentUseCase>(
      () => _i221.ChangeStateAgentUseCase(gh<_i179.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i222.GetAgentsAndDistributorsUseCase>(() =>
      _i222.GetAgentsAndDistributorsUseCase(
          gh<_i179.AgentsDistributorsRepo>()));
  gh.factory<_i223.ClientsAcceptCubit>(
      () => _i223.ClientsAcceptCubit(gh<_i148.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i224.CancelWithdrawalUsecase>(() =>
      _i224.CancelWithdrawalUsecase(gh<_i177.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i225.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i225.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i177.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i226.GetWithdrawalsInvoicesUsecase>(() =>
      _i226.GetWithdrawalsInvoicesUsecase(
          gh<_i177.ManageWithdrawalsRepository>()));
  gh.factory<_i227.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i227.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i177.ManageWithdrawalsRepository>()));
  gh.factory<_i228.AddTaskUsecase>(
      () => _i228.AddTaskUsecase(gh<_i76.TaskRepository>()));
  gh.factory<_i229.ChangeStatusTaskUsecase>(
      () => _i229.ChangeStatusTaskUsecase(gh<_i76.TaskRepository>()));
  gh.factory<_i230.FilterTaskUsecase>(
      () => _i230.FilterTaskUsecase(gh<_i76.TaskRepository>()));
  gh.factory<_i231.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i231.GetUsersByDepartmentAndRegionUsecase(gh<_i76.TaskRepository>()));
  gh.lazySingleton<_i232.ExceededClientsUseCase>(
      () => _i232.ExceededClientsUseCase(gh<_i71.ExceededClientsRepo>()));
  gh.lazySingleton<_i233.TransferExceededClientsUseCase>(() =>
      _i233.TransferExceededClientsUseCase(gh<_i71.ExceededClientsRepo>()));
  gh.lazySingleton<_i234.LoginLocalDataSource>(() =>
      _i234.LoginLocalDataSourceImpl(
          gh<_i125.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i235.EditAdvancedConfigsUsecase>(() =>
      _i235.EditAdvancedConfigsUsecase(gh<_i100.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i236.GetAdvancedConfigsUsecase>(() =>
      _i236.GetAdvancedConfigsUsecase(gh<_i100.AdvancedConfigsRepository>()));
  gh.factory<_i237.ClientsInstallReportsCubit>(() =>
      _i237.ClientsInstallReportsCubit(
          gh<_i79.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i238.DatesTableRepo>(
      () => _i239.DatesTableRepoImpl(gh<_i118.DatesTableDataSource>()));
  gh.factory<_i240.GetVersionUseCase>(
      () => _i240.GetVersionUseCase(gh<_i134.AppRepository>()));
  gh.factory<_i241.AddTicketCubit>(
      () => _i241.AddTicketCubit(gh<_i90.AddTicketUseCase>()));
  gh.lazySingleton<_i242.LatestClientsUpdatesRepository>(() =>
      _i243.LatestClientsUpdatesRepositoryImpl(
          gh<_i104.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i244.EditGeneralConfigsUsecase>(() =>
      _i244.EditGeneralConfigsUsecase(gh<_i149.GeneralConfigsRepository>()));
  gh.lazySingleton<_i245.GetGeneralConfigsUsecase>(() =>
      _i245.GetGeneralConfigsUsecase(gh<_i149.GeneralConfigsRepository>()));
  gh.factory<_i246.InstallQualityCubit>(
      () => _i246.InstallQualityCubit(gh<_i153.GetInstallUseCase>()));
  gh.lazySingleton<_i247.AddAgentUseCase>(
      () => _i247.AddAgentUseCase(gh<_i136.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i248.UpdateAgentUseCase>(() =>
      _i248.UpdateAgentUseCase(gh<_i136.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i249.GetDelayInstallReportsUseCase>(() =>
      _i249.GetDelayInstallReportsUseCase(gh<_i132.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i250.CrudAgentSupportFilesUsecase>(() =>
      _i250.CrudAgentSupportFilesUsecase(
          gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i251.GetClientsTransferApprovalsUsecase>(() =>
      _i251.GetClientsTransferApprovalsUsecase(
          gh<_i200.ClientsTransferApprovalsRepo>()));
  gh.factory<_i252.ClientsStatusReportsCubit>(() =>
      _i252.ClientsStatusReportsCubit(
          gh<_i203.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i253.TaskCubit>(() => _i253.TaskCubit(
        gh<_i228.AddTaskUsecase>(),
        gh<_i230.FilterTaskUsecase>(),
        gh<_i229.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i254.SupportTabCubit>(() => _i254.SupportTabCubit(
        gh<_i158.GetInvoiceByClientUsecase>(),
        gh<_i156.AddDateInstallUsecase>(),
        gh<_i161.SetDateDoneUsecase>(),
        gh<_i162.SetReadyInstallUsecase>(),
        gh<_i160.ReturnInvoiceApproveUsecase>(),
        gh<_i159.ReceiveDeviceUsecase>(),
        gh<_i157.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i255.ClientsDebtsReportsCubit>(() =>
      _i255.ClientsDebtsReportsCubit(
          gh<_i122.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i256.AddAgentDateUseCase>(() =>
      _i256.AddAgentDateUseCase(gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.factory<_i257.RegionsSalesReportsCubit>(() =>
      _i257.RegionsSalesReportsCubit(
          gh<_i140.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i258.AgentsDistributorsActionsCubit>(
      () => _i258.AgentsDistributorsActionsCubit(
            gh<_i89.GetCitiesUseCase>(),
            gh<_i247.AddAgentUseCase>(),
            gh<_i248.UpdateAgentUseCase>(),
          ));
  gh.factory<_i259.InvoicesSectionCubit>(() => _i259.InvoicesSectionCubit(
        gh<_i147.GetInvoicesByPrivilegesUsecase>(),
        gh<_i222.GetAgentsAndDistributorsUseCase>(),
        gh<_i195.ParticipateListUsecase>(),
        gh<_i163.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i260.LoginRepo>(() => _i261.LoginRepoImpl(
        gh<_i97.LoginRemoteDataSource>(),
        gh<_i234.LoginLocalDataSource>(),
      ));
  gh.factory<_i262.AddLevelUsecase>(
      () => _i262.AddLevelUsecase(gh<_i130.PrivilegeRepository>()));
  gh.factory<_i263.GetLevelsUsecase>(
      () => _i263.GetLevelsUsecase(gh<_i130.PrivilegeRepository>()));
  gh.factory<_i264.GetPrivilegesUsecase>(
      () => _i264.GetPrivilegesUsecase(gh<_i130.PrivilegeRepository>()));
  gh.factory<_i265.UpdatePrivilegeUsecase>(
      () => _i265.UpdatePrivilegeUsecase(gh<_i130.PrivilegeRepository>()));
  gh.factory<_i266.SpecialClientsBloc>(
      () => _i266.SpecialClientsBloc(gh<_i146.GetSpecialClientsUsecase>()));
  gh.factory<_i267.AddCommentUsecase>(
      () => _i267.AddCommentUsecase(gh<_i151.CompanyRepository>()));
  gh.factory<_i268.GetCommentUsecase>(
      () => _i268.GetCommentUsecase(gh<_i151.CompanyRepository>()));
  gh.factory<_i269.DelayInstallReportsCubit>(() =>
      _i269.DelayInstallReportsCubit(
          gh<_i249.GetDelayInstallReportsUseCase>()));
  gh.factory<_i270.GreetingCommunicationCubit>(() =>
      _i270.GreetingCommunicationCubit(
          gh<_i199.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i271.GetRegionsByIdCountryUseCase>(
      () => _i271.GetRegionsByIdCountryUseCase(gh<_i183.RegionsRepository>()));
  gh.lazySingleton<_i272.PrivilegeCubit>(() => _i272.PrivilegeCubit(
        gh<_i263.GetLevelsUsecase>(),
        gh<_i264.GetPrivilegesUsecase>(),
        gh<_i265.UpdatePrivilegeUsecase>(),
        gh<_i262.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i273.GetLatestClientsUseCase>(() =>
      _i273.GetLatestClientsUseCase(
          gh<_i242.LatestClientsUpdatesRepository>()));
  gh.factory<_i274.AdvancedCofigsCubit>(() => _i274.AdvancedCofigsCubit(
        gh<_i236.GetAdvancedConfigsUsecase>(),
        gh<_i235.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i275.SupportClientsInvoicesCubit>(() =>
      _i275.SupportClientsInvoicesCubit(
          gh<_i176.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i276.ParticipateListBloc>(() => _i276.ParticipateListBloc(
        gh<_i195.ParticipateListUsecase>(),
        gh<_i189.AddParticipateUserUsecase>(),
        gh<_i190.EditParticipateUserUsecase>(),
        gh<_i192.ParticipateClientListUsecase>(),
        gh<_i194.ParticipateInvoiceListUsecase>(),
        gh<_i191.GetInvoiceByIdUsecase>(),
        gh<_i193.ParticipateCommentListUsecase>(),
        gh<_i188.AddParticipateCommentUsecase>(),
        gh<_i196.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i277.CacheTokenUsecase>(
      () => _i277.CacheTokenUsecase(gh<_i260.LoginRepo>()));
  gh.lazySingleton<_i278.GetTokenUsecase>(
      () => _i278.GetTokenUsecase(gh<_i260.LoginRepo>()));
  gh.lazySingleton<_i279.LoginUsecase>(
      () => _i279.LoginUsecase(gh<_i260.LoginRepo>()));
  gh.lazySingleton<_i280.ValidateTokenUsecase>(
      () => _i280.ValidateTokenUsecase(gh<_i260.LoginRepo>()));
  gh.lazySingleton<_i281.VerifyOtpUsecase>(
      () => _i281.VerifyOtpUsecase(gh<_i260.LoginRepo>()));
  gh.factory<_i282.ClientsTransferApprovalsCubit>(() =>
      _i282.ClientsTransferApprovalsCubit(
          gh<_i251.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i283.GeneralCofigsCubit>(() => _i283.GeneralCofigsCubit(
        gh<_i245.GetGeneralConfigsUsecase>(),
        gh<_i244.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i284.GetPeriodicCommunicationUseCase>(() =>
      _i284.GetPeriodicCommunicationUseCase(
          gh<_i166.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i285.GetClientsDebtsUsecase>(
      () => _i285.GetClientsDebtsUsecase(gh<_i164.ClientsDebtsRepo>()));
  gh.lazySingleton<_i286.CrudClientSupportFilesUsecase>(() =>
      _i286.CrudClientSupportFilesUsecase(
          repository: gh<_i186.ClientsListRepository>()));
  gh.lazySingleton<_i287.GetClientSupportFilesUsecase>(() =>
      _i287.GetClientSupportFilesUsecase(
          repository: gh<_i186.ClientsListRepository>()));
  gh.lazySingleton<_i288.AddAgentCommentUsecase>(() =>
      _i288.AddAgentCommentUsecase(gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i289.DoneTrainingUsecase>(() =>
      _i289.DoneTrainingUsecase(gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i290.GetAgentUsecase>(
      () => _i290.GetAgentUsecase(gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i291.GetAgentClientListUsecase>(() =>
      _i291.GetAgentClientListUsecase(
          gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i292.GetAgentCommentsListUsecase>(() =>
      _i292.GetAgentCommentsListUsecase(
          gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i293.GetAgentDatesListUsecase>(() =>
      _i293.GetAgentDatesListUsecase(
          gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i294.GetAgentInvoiceListUsecase>(() =>
      _i294.GetAgentInvoiceListUsecase(
          gh<_i154.AgentsDistributorsProfileRepo>()));
  gh.factory<_i295.AddRejectReasonsUsecase>(() =>
      _i295.AddRejectReasonsUsecase(gh<_i177.ManageWithdrawalsRepository>()));
  gh.factory<_i296.EditRejectReasonsUsecase>(() =>
      _i296.EditRejectReasonsUsecase(gh<_i177.ManageWithdrawalsRepository>()));
  gh.factory<_i297.GetRejectReasonsUsecase>(() =>
      _i297.GetRejectReasonsUsecase(gh<_i177.ManageWithdrawalsRepository>()));
  gh.factory<_i298.GetUserSeriesUsecase>(() =>
      _i298.GetUserSeriesUsecase(gh<_i177.ManageWithdrawalsRepository>()));
  gh.factory<_i299.GetWithdrawnDetailsUsecase>(() =>
      _i299.GetWithdrawnDetailsUsecase(
          gh<_i177.ManageWithdrawalsRepository>()));
  gh.factory<_i300.SetApproveSeriesUsecase>(() =>
      _i300.SetApproveSeriesUsecase(gh<_i177.ManageWithdrawalsRepository>()));
  gh.factory<_i301.UpdateSeriesUsecase>(
      () => _i301.UpdateSeriesUsecase(gh<_i177.ManageWithdrawalsRepository>()));
  gh.singleton<_i302.AppManagerCubit>(
      () => _i302.AppManagerCubit(gh<_i240.GetVersionUseCase>()));
  gh.factory<_i303.RegionsCubit>(
      () => _i303.RegionsCubit(gh<_i271.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i304.GetWaitingAgentsUsecase>(
      () => _i304.GetWaitingAgentsUsecase(gh<_i205.WaitingAgentsRepo>()));
  gh.factory<_i305.ProductsSalesReportsCubit>(() =>
      _i305.ProductsSalesReportsCubit(
          gh<_i181.GetProductsSalesReportsUsecase>()));
  gh.factory<_i306.UsersCubit>(() => _i306.UsersCubit(
        gh<_i173.GetUsersUsecase>(),
        gh<_i73.ActionUserUsecase>(),
        gh<_i231.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i172.GetManagesForUserUsecase>(),
        gh<_i171.GetLevelsForUserUsecase>(),
        gh<_i170.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i307.PreviousRatingsCubit>(
      () => _i307.PreviousRatingsCubit(gh<_i204.GetPreviousRatingsUsecase>()));
  gh.factory<_i308.AgentsDistributorsCubit>(() => _i308.AgentsDistributorsCubit(
        gh<_i222.GetAgentsAndDistributorsUseCase>(),
        gh<_i221.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i309.ExceededClientsCubit>(() => _i309.ExceededClientsCubit(
        gh<_i232.ExceededClientsUseCase>(),
        gh<_i233.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i310.ManageWithdrawalsCubit>(() => _i310.ManageWithdrawalsCubit(
        gh<_i298.GetUserSeriesUsecase>(),
        gh<_i301.UpdateSeriesUsecase>(),
        gh<_i173.GetUsersUsecase>(),
        gh<_i226.GetWithdrawalsInvoicesUsecase>(),
        gh<_i227.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i300.SetApproveSeriesUsecase>(),
        gh<_i299.GetWithdrawnDetailsUsecase>(),
        gh<_i295.AddRejectReasonsUsecase>(),
        gh<_i297.GetRejectReasonsUsecase>(),
        gh<_i296.EditRejectReasonsUsecase>(),
        gh<_i225.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i224.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i311.LatestClientsUpdatesCubit>(() =>
      _i311.LatestClientsUpdatesCubit(gh<_i273.GetLatestClientsUseCase>()));
  gh.factory<_i312.AttachmentsRowCubit>(() => _i312.AttachmentsRowCubit(
        gh<_i287.GetClientSupportFilesUsecase>(),
        gh<_i286.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i313.CancelScheduleUsecase>(
      () => _i313.CancelScheduleUsecase(gh<_i238.DatesTableRepo>()));
  gh.lazySingleton<_i314.ChangeDateToDonUsecase>(
      () => _i314.ChangeDateToDonUsecase(gh<_i238.DatesTableRepo>()));
  gh.lazySingleton<_i315.GetCancelReasonsUsecase>(
      () => _i315.GetCancelReasonsUsecase(gh<_i238.DatesTableRepo>()));
  gh.lazySingleton<_i316.GetDateInstallationUsecase>(
      () => _i316.GetDateInstallationUsecase(gh<_i238.DatesTableRepo>()));
  gh.lazySingleton<_i317.GetInvoicesByClientForDateUsecase>(() =>
      _i317.GetInvoicesByClientForDateUsecase(gh<_i238.DatesTableRepo>()));
  gh.lazySingleton<_i318.GetSubscribedClientsUsecase>(
      () => _i318.GetSubscribedClientsUsecase(gh<_i238.DatesTableRepo>()));
  gh.lazySingleton<_i319.RescheduleDateUsecase>(
      () => _i319.RescheduleDateUsecase(gh<_i238.DatesTableRepo>()));
  gh.lazySingleton<_i320.ReturnScheduleVisitToOpenUsecase>(
      () => _i320.ReturnScheduleVisitToOpenUsecase(gh<_i238.DatesTableRepo>()));
  gh.factory<_i321.AgentsDistributorsProfileBloc>(
      () => _i321.AgentsDistributorsProfileBloc(
            gh<_i291.GetAgentClientListUsecase>(),
            gh<_i294.GetAgentInvoiceListUsecase>(),
            gh<_i191.GetInvoiceByIdUsecase>(),
            gh<_i292.GetAgentCommentsListUsecase>(),
            gh<_i288.AddAgentCommentUsecase>(),
            gh<_i289.DoneTrainingUsecase>(),
            gh<_i256.AddAgentDateUseCase>(),
            gh<_i293.GetAgentDatesListUsecase>(),
            gh<_i250.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i322.ClientsListBloc>(() => _i322.ClientsListBloc(
        gh<_i213.GetClientsWithFilterUserUsecase>(),
        gh<_i215.GetRecommendedClientsUsecase>(),
        gh<_i207.AddClientUserUsecase>(),
        gh<_i210.EditClientUserUsecase>(),
        gh<_i209.ChangeTypeClientUsecase>(),
        gh<_i216.GetSimilarClientsUsecase>(),
        gh<_i208.ApproveRejectClientUsecase>(),
        gh<_i286.CrudClientSupportFilesUsecase>(),
        gh<_i287.GetClientSupportFilesUsecase>(),
        gh<_i218.TransferClientUserUsecase>(),
        gh<_i217.ReceiveClientUserUsecase>(),
        gh<_i214.GetClientMarketingReportUsecase>(),
        gh<_i219.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i323.CompanyCubit>(() => _i323.CompanyCubit(
        gh<_i268.GetCommentUsecase>(),
        gh<_i267.AddCommentUsecase>(),
      ));
  gh.factory<_i324.ClientsDebtsCubit>(
      () => _i324.ClientsDebtsCubit(gh<_i285.GetClientsDebtsUsecase>()));
  gh.factory<_i325.PeriodicCommunicationCubit>(() =>
      _i325.PeriodicCommunicationCubit(
          gh<_i284.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i326.LoginCubit>(() => _i326.LoginCubit(
        gh<_i279.LoginUsecase>(),
        gh<_i281.VerifyOtpUsecase>(),
        gh<_i277.CacheTokenUsecase>(),
        gh<_i278.GetTokenUsecase>(),
        gh<_i280.ValidateTokenUsecase>(),
      ));
  gh.factory<_i327.DatesTableCubit>(() => _i327.DatesTableCubit(
        gh<_i316.GetDateInstallationUsecase>(),
        gh<_i319.RescheduleDateUsecase>(),
        gh<_i314.ChangeDateToDonUsecase>(),
        gh<_i313.CancelScheduleUsecase>(),
        gh<_i320.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i318.GetSubscribedClientsUsecase>(),
        gh<_i317.GetInvoicesByClientForDateUsecase>(),
        gh<_i156.AddDateInstallUsecase>(),
        gh<_i315.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i328.WaitingAgentsCubit>(
      () => _i328.WaitingAgentsCubit(gh<_i304.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i329.AppModule {}
