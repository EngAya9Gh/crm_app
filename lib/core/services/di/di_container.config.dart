// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i10;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../../../api/api.dart' as _i4;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i65;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i175;
import '../../../features/app/domain/repositories/app_repository.dart' as _i174;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i299;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i366;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i94;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i132;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i156;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i155;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i193;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i194;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i195;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i196;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i197;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i329;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i36;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i52;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i51;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i198;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i286;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i33;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i97;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i96;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i119;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i185;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i29;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i42;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i41;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i242;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i365;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i60;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i74;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i73;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i124;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i125;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i126;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i128;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i127;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i129;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i300;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i152;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i130;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i32;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i44;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i43;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i192;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i342;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i17;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i56;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i55;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i103;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i256;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i24;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i164;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i163;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i258;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i337;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i57;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i169;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i168;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i209;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i308;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i46;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i223;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i222;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i346;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i395;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i38;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i49;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i48;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i204;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i307;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i31;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i110;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i109;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i265;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i371;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i66;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i147;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i146;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i188;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i333;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i95;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i102;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i101;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i205;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i350;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i71;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i122;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i121;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i123;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i241;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i77;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i112;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i111;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i227;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i326;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i116;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i187;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i186;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i212;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i213;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i214;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i215;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i216;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i217;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i218;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i316;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i159;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i325;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i324;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i338;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i344;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i70;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i86;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i85;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i117;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i243;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i3;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i72;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i136;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i135;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i294;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i295;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i340;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i89;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i200;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i199;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i305;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i306;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i345;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i23;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i59;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i58;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i114;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i115;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i131;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i20;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i171;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i170;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i177;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i176;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i208;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i62;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i88;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i87;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i100;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i230;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i231;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i232;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i234;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i233;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i392;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i50;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i237;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i236;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i358;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i287;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i359;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i288;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i360;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i361;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i290;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i289;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i362;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i363;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i364;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i375;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i21;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i35;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i34;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i201;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i202;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i203;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i321;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i53;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i221;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i220;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i347;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i394;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i67;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i40;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i245;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i244;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i268;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i269;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_client_communication_usecase.dart'
    as _i270;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i271;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i348;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i272;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i226;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i331;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i330;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i276;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i349;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i273;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i274;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i275;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i282;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i277;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i278;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i332;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i279;
import '../../../features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart'
    as _i280;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i281;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i374;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i63;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i260;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i259;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i314;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i343;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i54;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i91;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i90;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i148;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i180;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i139;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i302;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i301;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i339;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i377;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i19;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i93;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i92;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i118;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i255;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i68;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i207;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i206;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i334;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i335;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i393;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i113;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i182;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i181;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i261;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i318;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i64;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i99;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i98;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i291;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i292;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i373;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i120;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i143;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i142;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i189;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i219;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i191;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i190;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i368;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i140;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i166;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i165;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i320;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i376;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i25;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i106;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i151;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i179;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i211;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i239;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i178;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i210;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i238;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i351;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i319;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i310;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i284;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i313;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i352;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i353;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i354;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i355;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i356;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i357;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i285;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i311;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i328;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i396;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i372;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i69;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i225;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i224;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i263;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i264;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i309;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i45;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i138;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i137;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i246;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i247;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i254;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i248;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i249;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i250;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i251;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i252;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i253;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i293;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i28;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i79;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i78;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i162;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i317;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i37;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i154;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i153;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i262;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i315;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i47;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i134;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i133;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i257;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i283;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i150;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i149;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i240;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i369;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i27;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i76;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i75;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i184;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i327;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i141;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i323;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i322;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i370;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i398;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i26;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i105;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i104;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i108;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i296;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i157;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i298;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i297;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i379;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i380;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i381;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i382;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i383;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i384;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i385;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i386;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i397;
import '../../../features/support/dates_timeline/data/data_sources/dates_timeline_datasource.dart'
    as _i7;
import '../../../features/support/dates_timeline/data/respositories_impl/dates_timeline_repo_impl.dart'
    as _i6;
import '../../../features/support/dates_timeline/domain/respositories/dates_timline_repo.dart'
    as _i5;
import '../../../features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart'
    as _i30;
import '../../../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart'
    as _i167;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i18;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i83;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i82;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i158;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i183;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i39;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i173;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i172;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i312;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i336;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i14;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i81;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i80;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i84;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i144;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i61;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i229;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i228;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i235;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i341;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i145;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i267;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i266;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i367;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i399;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i107;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i304;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i303;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i387;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i388;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i389;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i390;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i391;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i378;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i15;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i160;

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
  gh.factory<_i3.WebHomePageCubit>(() => _i3.WebHomePageCubit());
  gh.lazySingleton<_i4.Api>(() => _i4.Api());
  gh.lazySingleton<_i5.DatesTimeLinesRepo>(
      () => _i6.DatesTimelineRepoImpl(gh<_i7.DatesTimelineDatasource>()));
  gh.singleton<_i8.ApiServices>(() => _i9.DioServices(gh<_i10.Dio>()));
  gh.singleton<_i11.CacheServices>(
    () => _i12.SecureStorageConsumer(gh<_i13.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i14.SupportClientsAcceptDatasource>(
      () => _i14.SupportClientsAcceptDatasourceImpl(gh<_i8.ApiServices>()));
  gh.singleton<_i11.CacheServices>(
      () => _i15.PrefsConsumer(gh<_i16.SharedPreferences>()));
  gh.lazySingleton<_i17.EvaluationLevelReportDatasource>(
      () => _i17.EvaluationLevelReportDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i18.DelayAfterInstallDatasource>(
      () => _i18.DelayAfterInstallDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i19.PendingInvoicesDatasource>(
      () => _i19.PendingInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i20.PrivilegesDatasource>(
      () => _i20.PrivilegesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i21.NotificationsDatasource>(
      () => _i21.NotificationsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i22.ProductsSalesReportsDatasource>(
      () => _i22.ProductsSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i23.LevelsDatasource>(
      () => _i23.LevelsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i24.GreetingCommunicationDatasource>(
      () => _i24.GreetingCommunicationDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i25.AgentsDistributorsActionsDataSource>(() =>
      _i25.AgentsDistributorsActionsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i26.ClientsInstallReportsDatasource>(
      () => _i26.ClientsInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i27.RegionsSalesReportsDatasource>(
      () => _i27.RegionsSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i28.ClientsDebtsReportsDatasource>(
      () => _i28.ClientsDebtsReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i29.NotUsingSystemDatasource>(
      () => _i29.NotUsingSystemDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i30.GetTimelineByEmployeeUseCase>(
      () => _i30.GetTimelineByEmployeeUseCase(gh<_i5.DatesTimeLinesRepo>()));
  gh.lazySingleton<_i31.PreviousRatingsDatasource>(
      () => _i31.PreviousRatingsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i32.WrongNumbersDatasource>(
      () => _i32.WrongNumbersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i33.ClientsCareReportsDatasource>(
      () => _i33.ClientsCareReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i34.NotificationsRepo>(
      () => _i35.NotificationsRepoImpl(gh<_i21.NotificationsDatasource>()));
  gh.lazySingleton<_i36.ClientsAcceptDatasource>(
      () => _i36.ClientsAcceptDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i37.ClientsStatusReportsDatasource>(
      () => _i37.ClientsStatusReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i38.PeriodicCommunicationReportsDatasource>(() =>
      _i38.PeriodicCommunicationReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i39.DelayInstallReportsDatasource>(
      () => _i39.DelayInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i40.LinkClientApiService>(
      () => _i40.LinkClientApiService(gh<_i10.Dio>()));
  gh.lazySingleton<_i41.NotUsingSystemRepo>(
      () => _i42.NotUsingSystemRepoImpl(gh<_i29.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i43.WrongNumbersRepo>(
      () => _i44.WrongNumbersRepoImpl(gh<_i32.WrongNumbersDatasource>()));
  gh.lazySingleton<_i45.ParticipatesListDatasource>(
      () => _i45.ParticipatesListDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i46.PeriodicCommunicationDatasource>(
      () => _i46.PeriodicCommunicationDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i47.EmployeesSalesReportsDatasource>(
      () => _i47.EmployeesSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i48.PeriodicCommunicationReportsRepo>(() =>
      _i49.PeriodicCommunicationReportsRepoImpl(
          gh<_i38.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i50.ManageWithdrawalsDatasource>(
      () => _i50.ManageWithdrawalsDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i51.ClientsAcceptRepository>(() =>
      _i52.ClientsAcceptRepositoryImpl(gh<_i36.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i53.ClientsDebtsDatasource>(
      () => _i53.ClientsDebtsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i54.FinancePendingDatasource>(
      () => _i54.FinancePendingDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i55.EvaluationLevelReportRepo>(() =>
      _i56.EvaluationLevelReportRepoImpl(
          gh<_i17.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i57.InstallQualityDatasource>(
      () => _i57.InstallQualityDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i58.LevelsRepo>(
      () => _i59.LevelsRepoImpl(gh<_i23.LevelsDatasource>()));
  gh.lazySingleton<_i60.TicketsDataSource>(
      () => _i60.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i61.SupportClientsInvoicesDatasource>(
      () => _i61.DelayInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i62.UsersDatasource>(
      () => _i62.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i63.ClientsTransferApprovalsDatasource>(
      () => _i63.ClientsTransferApprovalsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i64.ExceededClientsDatasource>(
      () => _i64.ExceededClientsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i65.AppDatasource>(
      () => _i65.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i66.SpecialClientsDatasource>(
      () => _i66.SpecialClientsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i67.ClientsListDatasource>(
      () => _i67.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i68.CommentCompanyDatasource>(
      () => _i68.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i69.ImportantLinksDatasource>(
      () => _i69.ImportantLinksDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i70.UsersDatasource>(
      () => _i70.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i71.CitiesDatasource>(
      () => _i71.CitiesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i72.AdvancedConfigsDatasource>(
      () => _i72.AdvancedConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i73.TicketsRepo>(
      () => _i74.TicketsRepoImpl(gh<_i60.TicketsDataSource>()));
  gh.lazySingleton<_i75.RegionsSalesReportsRepo>(() =>
      _i76.RegionsSalesReportsRepoImpl(
          gh<_i27.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i77.ClientLogsTabDataSource>(
      () => _i77.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i78.ClientsDebtsReportsRepo>(() =>
      _i79.ClientsDebtsReportsRepoImpl(
          gh<_i28.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i80.SupportClientsAcceptRepository>(() =>
      _i81.SupportClientsAcceptRepositoryImpl(
          gh<_i14.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i82.DelayAfterInstallRepo>(() =>
      _i83.DelayAfterInstallRepoImpl(gh<_i18.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i84.GetSupportClientsAcceptUseCase>(() =>
      _i84.GetSupportClientsAcceptUseCase(
          gh<_i80.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i85.UsersRepository>(
      () => _i86.UsersRepositoryImpl(gh<_i70.UsersDatasource>()));
  gh.lazySingleton<_i87.UsersRepository>(
      () => _i88.UsersRepositoryImpl(gh<_i62.UsersDatasource>()));
  gh.lazySingleton<_i89.GeneralConfigsDatasource>(
      () => _i89.GeneralConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i90.FinancePendingRepo>(
      () => _i91.FinancePendingRepoImpl(gh<_i54.FinancePendingDatasource>()));
  gh.lazySingleton<_i92.PendingInvoicesRepo>(
      () => _i93.PendingInvoicesRepoImpl(gh<_i19.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i94.LoginLocalDataSource>(() =>
      _i94.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i95.BranchesDatasource>(
      () => _i95.BranchesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i96.ClientsCareReportsRepo>(() =>
      _i97.ClientsCareReportsRepoImpl(gh<_i33.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i98.ExceededClientsRepo>(
      () => _i99.ExceededClientsRepoImpl(gh<_i64.ExceededClientsDatasource>()));
  gh.factory<_i100.ActionUserUsecase>(
      () => _i100.ActionUserUsecase(gh<_i87.UsersRepository>()));
  gh.lazySingleton<_i101.BranchesRepository>(
      () => _i102.BranchesRepositoryImpl(gh<_i95.BranchesDatasource>()));
  gh.lazySingleton<_i103.GetEvaluationLevelReportUsecase>(() =>
      _i103.GetEvaluationLevelReportUsecase(
          gh<_i55.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i104.ClientsInstallReportsRepo>(() =>
      _i105.ClientsInstallReportsRepoImpl(
          gh<_i26.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i106.AgentsDistributorsDataSource>(
      () => _i106.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i107.TaskDatasource>(
      () => _i107.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i108.GetClientsInstallReportsUsecase>(() =>
      _i108.GetClientsInstallReportsUsecase(
          gh<_i104.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i109.PreviousRatingsRepo>(() =>
      _i110.PreviousRatingsRepoImpl(gh<_i31.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i111.ClientLogsTabRepo>(
      () => _i112.ClientLogsTabRepoImpl(gh<_i77.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i113.DeletedInvoicesDatasource>(
      () => _i113.DeletedInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i114.AddLevelUsecase>(
      () => _i114.AddLevelUsecase(gh<_i58.LevelsRepo>()));
  gh.lazySingleton<_i115.GetLevelsUsecase>(
      () => _i115.GetLevelsUsecase(gh<_i58.LevelsRepo>()));
  gh.lazySingleton<_i116.SupportTabDataSource>(
      () => _i116.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i117.GetUsersUsecase>(
      () => _i117.GetUsersUsecase(gh<_i85.UsersRepository>()));
  gh.lazySingleton<_i118.GetPendingInvoicesUsecase>(
      () => _i118.GetPendingInvoicesUsecase(gh<_i92.PendingInvoicesRepo>()));
  gh.lazySingleton<_i119.GetClientsCareReportsUsecase>(() =>
      _i119.GetClientsCareReportsUsecase(gh<_i96.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i120.InvoicesTabDataSource>(
      () => _i120.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i121.CitiesRepository>(
      () => _i122.CitiesRepositoryImpl(gh<_i71.CitiesDatasource>()));
  gh.lazySingleton<_i123.GetCitiesUseCase>(
      () => _i123.GetCitiesUseCase(gh<_i121.CitiesRepository>()));
  gh.lazySingleton<_i124.AddTicketUseCase>(
      () => _i124.AddTicketUseCase(gh<_i73.TicketsRepo>()));
  gh.lazySingleton<_i125.EditTicketTypeUseCase>(
      () => _i125.EditTicketTypeUseCase(gh<_i73.TicketsRepo>()));
  gh.lazySingleton<_i126.GetClientTicketsUseCase>(
      () => _i126.GetClientTicketsUseCase(gh<_i73.TicketsRepo>()));
  gh.lazySingleton<_i127.GetTicketsUseCase>(
      () => _i127.GetTicketsUseCase(gh<_i73.TicketsRepo>()));
  gh.lazySingleton<_i128.GetTicketByIdUseCase>(
      () => _i128.GetTicketByIdUseCase(gh<_i73.TicketsRepo>()));
  gh.lazySingleton<_i129.TransferTicketUseCase>(
      () => _i129.TransferTicketUseCase(gh<_i73.TicketsRepo>()));
  gh.factory<_i130.TicketsCubit>(() => _i130.TicketsCubit(
        gh<_i127.GetTicketsUseCase>(),
        gh<_i128.GetTicketByIdUseCase>(),
        gh<_i126.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i131.LevelsCubit>(() => _i131.LevelsCubit(
        gh<_i115.GetLevelsUsecase>(),
        gh<_i114.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i132.LoginRemoteDataSource>(
      () => _i132.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i133.EmployeesSalesReportsRepo>(() =>
      _i134.EmployeesSalesReportsRepoImpl(
          gh<_i47.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i135.AdvancedConfigsRepository>(() =>
      _i136.AdvancedConfigsRepositoryImpl(
          gh<_i72.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i137.ParticipateListRepository>(() =>
      _i138.ParticipateListRepositoryImpl(
          gh<_i45.ParticipatesListDatasource>()));
  gh.lazySingleton<_i139.LatestClientsUpdatesDatasource>(
      () => _i139.LatestClientsUpdatesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i140.ManageWithdrawnInvoicesDataSource>(
      () => _i140.ManageWithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i141.WithdrawnInvoicesDataSource>(
      () => _i141.WithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i142.InvoicesSectionRepo>(
      () => _i143.InvoicesTabRepoImpl(gh<_i120.InvoicesTabDataSource>()));
  gh.factory<_i144.SupportClientsAcceptCubit>(() =>
      _i144.SupportClientsAcceptCubit(
          gh<_i84.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i145.WaitingAgentsDataSource>(
      () => _i145.WaitingAgentsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i146.SpecialClientsRepository>(() =>
      _i147.SpecialClientsRepositoryImpl(gh<_i66.SpecialClientsDatasource>()));
  gh.lazySingleton<_i148.GetFinancePendingInvoicesUsecase>(() =>
      _i148.GetFinancePendingInvoicesUsecase(gh<_i90.FinancePendingRepo>()));
  gh.lazySingleton<_i149.ProductsSalesReportsRepo>(() =>
      _i150.ProductsSalesReportsRepoImpl(
          gh<_i22.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i151.AgentsDistributorsProfileDataSource>(() =>
      _i151.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i152.EditTicketCubit>(() => _i152.EditTicketCubit(
        gh<_i125.EditTicketTypeUseCase>(),
        gh<_i129.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i153.ClientsStatusReportsRepo>(() =>
      _i154.ClientsStatusReportsRepoImpl(
          gh<_i37.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i155.LoginRepo>(() => _i156.LoginRepoImpl(
        gh<_i132.LoginRemoteDataSource>(),
        gh<_i94.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i157.DatesTableDataSource>(
      () => _i157.DatesTableDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i158.GetDelayAfterInstallUseCase>(() =>
      _i158.GetDelayAfterInstallUseCase(gh<_i82.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i159.RegionsDatasource>(
      () => _i159.RegionsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i160.LocationServices>(
      () => _i160.LocationServices(gh<_i161.Location>()));
  gh.lazySingleton<_i162.GetClientsDebtsReportsUsecase>(() =>
      _i162.GetClientsDebtsReportsUsecase(gh<_i78.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i163.GreetingCommunicationRepo>(() =>
      _i164.GreetingCommunicationRepoImpl(
          gh<_i24.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i165.ManageWithdrawnInvoicesRepo>(() =>
      _i166.ManageWithdrawnInvoicesRepoImpl(
          gh<_i140.ManageWithdrawnInvoicesDataSource>()));
  gh.factory<_i167.DatesTimelineBloc>(
      () => _i167.DatesTimelineBloc(gh<_i30.GetTimelineByEmployeeUseCase>()));
  gh.lazySingleton<_i168.InstallQualityRepo>(
      () => _i169.InstallQualityRepoImpl(gh<_i57.InstallQualityDatasource>()));
  gh.lazySingleton<_i170.PrivilegesRepo>(
      () => _i171.PrivilegesRepoImpl(gh<_i20.PrivilegesDatasource>()));
  gh.lazySingleton<_i172.DelayInstallReportsRepo>(() =>
      _i173.DelayInstallReportsRepoImpl(
          gh<_i39.DelayInstallReportsDatasource>()));
  gh.factory<_i174.AppRepository>(
      () => _i175.AppRepositoryImpl(gh<_i65.AppDatasource>()));
  gh.factory<_i176.UpdatePrivilegesUsecase>(
      () => _i176.UpdatePrivilegesUsecase(gh<_i170.PrivilegesRepo>()));
  gh.lazySingleton<_i177.GetPrivilegesUsecase>(
      () => _i177.GetPrivilegesUsecase(gh<_i170.PrivilegesRepo>()));
  gh.lazySingleton<_i178.AgentsDistributorsActionsRepo>(() =>
      _i179.AgentsDistributorsActionsRepoImpl(
          gh<_i25.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i180.FinancePendingCubit>(() =>
      _i180.FinancePendingCubit(gh<_i148.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i181.DeletedInvoicesRepo>(() =>
      _i182.DeletedInvoicesRepoImpl(gh<_i113.DeletedInvoicesDatasource>()));
  gh.factory<_i183.DelayAfterInstallCubit>(() =>
      _i183.DelayAfterInstallCubit(gh<_i158.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i184.GetRegionsSalesReportsUsecase>(() =>
      _i184.GetRegionsSalesReportsUsecase(gh<_i75.RegionsSalesReportsRepo>()));
  gh.factory<_i185.ClientsCareReportsCubit>(() =>
      _i185.ClientsCareReportsCubit(gh<_i119.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i186.SupportTabRepo>(
      () => _i187.SupportTabRepoImpl(gh<_i116.SupportTabDataSource>()));
  gh.factory<_i188.GetSpecialClientsUsecase>(() =>
      _i188.GetSpecialClientsUsecase(gh<_i146.SpecialClientsRepository>()));
  gh.lazySingleton<_i189.ExportInvoicesToExcelUsecase>(() =>
      _i189.ExportInvoicesToExcelUsecase(gh<_i142.InvoicesSectionRepo>()));
  gh.lazySingleton<_i190.GetInvoicesByPrivilegesUsecase>(() =>
      _i190.GetInvoicesByPrivilegesUsecase(gh<_i142.InvoicesSectionRepo>()));
  gh.lazySingleton<_i191.GetInvoiceByIdUsecase>(
      () => _i191.GetInvoiceByIdUsecase(gh<_i142.InvoicesSectionRepo>()));
  gh.lazySingleton<_i192.GetWrongNumbersUsecase>(
      () => _i192.GetWrongNumbersUsecase(gh<_i43.WrongNumbersRepo>()));
  gh.lazySingleton<_i193.CacheTokenUsecase>(
      () => _i193.CacheTokenUsecase(gh<_i155.LoginRepo>()));
  gh.lazySingleton<_i194.GetTokenUsecase>(
      () => _i194.GetTokenUsecase(gh<_i155.LoginRepo>()));
  gh.lazySingleton<_i195.LoginUsecase>(
      () => _i195.LoginUsecase(gh<_i155.LoginRepo>()));
  gh.lazySingleton<_i196.ValidateTokenUsecase>(
      () => _i196.ValidateTokenUsecase(gh<_i155.LoginRepo>()));
  gh.lazySingleton<_i197.VerifyOtpUsecase>(
      () => _i197.VerifyOtpUsecase(gh<_i155.LoginRepo>()));
  gh.lazySingleton<_i198.GetClientsAcceptUseCase>(
      () => _i198.GetClientsAcceptUseCase(gh<_i51.ClientsAcceptRepository>()));
  gh.lazySingleton<_i199.GeneralConfigsRepository>(() =>
      _i200.GeneralConfigsRepositoryImpl(gh<_i89.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i201.GetNotificationsUsecase>(
      () => _i201.GetNotificationsUsecase(gh<_i34.NotificationsRepo>()));
  gh.lazySingleton<_i202.GetUnreadNotificationsCountUsecase>(() =>
      _i202.GetUnreadNotificationsCountUsecase(gh<_i34.NotificationsRepo>()));
  gh.lazySingleton<_i203.MarkNotificationsAsReadUsecase>(
      () => _i203.MarkNotificationsAsReadUsecase(gh<_i34.NotificationsRepo>()));
  gh.lazySingleton<_i204.GetPeriodicCommunicationReportsUsecase>(() =>
      _i204.GetPeriodicCommunicationReportsUsecase(
          gh<_i48.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i205.GetBranchesByIdCountryUseCase>(() =>
      _i205.GetBranchesByIdCountryUseCase(gh<_i101.BranchesRepository>()));
  gh.factory<_i206.CompanyRepository>(
      () => _i207.CompanyRepositoryImpl(gh<_i68.CommentCompanyDatasource>()));
  gh.singleton<_i208.PrivilegesCubit>(() => _i208.PrivilegesCubit(
        gh<_i177.GetPrivilegesUsecase>(),
        gh<_i176.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i209.GetInstallUseCase>(
      () => _i209.GetInstallUseCase(gh<_i168.InstallQualityRepo>()));
  gh.lazySingleton<_i210.AgentsDistributorsProfileRepo>(() =>
      _i211.AgentsDistributorsProfileRepoImpl(
          gh<_i151.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i212.AddDateInstallUsecase>(
      () => _i212.AddDateInstallUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i213.CancelDateInstallUsecase>(
      () => _i213.CancelDateInstallUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i214.GetInvoiceByClientUsecase>(
      () => _i214.GetInvoiceByClientUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i215.ReceiveDeviceUsecase>(
      () => _i215.ReceiveDeviceUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i216.ReturnInvoiceApproveUsecase>(
      () => _i216.ReturnInvoiceApproveUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i217.SetDateDoneUsecase>(
      () => _i217.SetDateDoneUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i218.SetReadyInstallUsecase>(
      () => _i218.SetReadyInstallUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i219.GetAllUsersUseCase>(
      () => _i219.GetAllUsersUseCase(gh<_i142.InvoicesSectionRepo>()));
  gh.lazySingleton<_i220.ClientsDebtsRepo>(
      () => _i221.ClientsDebtsRepoImpl(gh<_i53.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i222.PeriodicCommunicationRepo>(() =>
      _i223.PeriodicCommunicationRepoImpl(
          gh<_i46.PeriodicCommunicationDatasource>()));
  gh.factory<_i224.ImportantLinksRepo>(
      () => _i225.ImportantLinksRepoImpl(gh<_i69.ImportantLinksDatasource>()));
  gh.factory<_i226.ExportClientsToExcelUseCase>(() =>
      _i226.ExportClientsToExcelUseCase(gh<_i67.ClientsListDatasource>()));
  gh.lazySingleton<_i227.GetClientLogsUsecase>(
      () => _i227.GetClientLogsUsecase(gh<_i111.ClientLogsTabRepo>()));
  gh.lazySingleton<_i228.SupportClientsInvoicesRepo>(() =>
      _i229.SupportClientsInvoicesRepoImpl(
          gh<_i61.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i230.GetBranchesForUserUsecase>(
      () => _i230.GetBranchesForUserUsecase(gh<_i87.UsersRepository>()));
  gh.lazySingleton<_i231.GetLevelsForUserUsecase>(
      () => _i231.GetLevelsForUserUsecase(gh<_i87.UsersRepository>()));
  gh.lazySingleton<_i232.GetManagesForUserUsecase>(
      () => _i232.GetManagesForUserUsecase(gh<_i87.UsersRepository>()));
  gh.factory<_i233.GetUsersUsecase>(
      () => _i233.GetUsersUsecase(gh<_i87.UsersRepository>()));
  gh.factory<_i234.GetUserByIdUsecase>(
      () => _i234.GetUserByIdUsecase(gh<_i87.UsersRepository>()));
  gh.lazySingleton<_i235.GetSupportClientsInvoicesUseCase>(() =>
      _i235.GetSupportClientsInvoicesUseCase(
          gh<_i228.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i236.ManageWithdrawalsRepository>(() =>
      _i237.ManageWithdrawalsRepositoryImpl(
          gh<_i50.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i238.AgentsDistributorsRepo>(() =>
      _i239.AgentsDistributorsRepoImpl(
          gh<_i106.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i240.GetProductsSalesReportsUsecase>(() =>
      _i240.GetProductsSalesReportsUsecase(
          gh<_i149.ProductsSalesReportsRepo>()));
  gh.singleton<_i241.CitiesCubit>(
      () => _i241.CitiesCubit(gh<_i123.GetCitiesUseCase>()));
  gh.lazySingleton<_i242.GetNotUsingSystemUsecase>(
      () => _i242.GetNotUsingSystemUsecase(gh<_i41.NotUsingSystemRepo>()));
  gh.factory<_i243.UsersTypeCubit>(
      () => _i243.UsersTypeCubit(gh<_i117.GetUsersUsecase>()));
  gh.factory<_i244.ClientsListRepository>(
      () => _i245.ClientsListRepositoryImpl(gh<_i67.ClientsListDatasource>()));
  gh.factory<_i246.AddParticipateCommentUsecase>(() =>
      _i246.AddParticipateCommentUsecase(
          gh<_i137.ParticipateListRepository>()));
  gh.factory<_i247.AddParticipateUserUsecase>(() =>
      _i247.AddParticipateUserUsecase(gh<_i137.ParticipateListRepository>()));
  gh.factory<_i248.EditParticipateUserUsecase>(() =>
      _i248.EditParticipateUserUsecase(gh<_i137.ParticipateListRepository>()));
  gh.factory<_i249.ParticipateClientListUsecase>(() =>
      _i249.ParticipateClientListUsecase(
          gh<_i137.ParticipateListRepository>()));
  gh.factory<_i250.ParticipateCommentListUsecase>(() =>
      _i250.ParticipateCommentListUsecase(
          gh<_i137.ParticipateListRepository>()));
  gh.factory<_i251.GetParticipateInvoiceByIdUsecase>(() =>
      _i251.GetParticipateInvoiceByIdUsecase(
          gh<_i137.ParticipateListRepository>()));
  gh.factory<_i252.ParticipateInvoiceListUsecase>(() =>
      _i252.ParticipateInvoiceListUsecase(
          gh<_i137.ParticipateListRepository>()));
  gh.factory<_i253.ParticipateListUsecase>(() =>
      _i253.ParticipateListUsecase(gh<_i137.ParticipateListRepository>()));
  gh.lazySingleton<_i254.ChangeParticipateStatusUsecase>(() =>
      _i254.ChangeParticipateStatusUsecase(
          gh<_i137.ParticipateListRepository>()));
  gh.factory<_i255.PendingInvoicesCubit>(
      () => _i255.PendingInvoicesCubit(gh<_i118.GetPendingInvoicesUsecase>()));
  gh.factory<_i256.EvaluationLevelReportCubit>(() =>
      _i256.EvaluationLevelReportCubit(
          gh<_i103.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i257.GetEmployeesSalesReportsUsecase>(() =>
      _i257.GetEmployeesSalesReportsUsecase(
          gh<_i133.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i258.GetGreetingCommunicationUseCase>(() =>
      _i258.GetGreetingCommunicationUseCase(
          gh<_i163.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i259.ClientsTransferApprovalsRepo>(() =>
      _i260.ClientsTransferApprovalsRepoImpl(
          gh<_i63.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i261.GetDeletedInvoicesUsecase>(
      () => _i261.GetDeletedInvoicesUsecase(gh<_i181.DeletedInvoicesRepo>()));
  gh.lazySingleton<_i262.GetClientsStatusReportsUsecase>(() =>
      _i262.GetClientsStatusReportsUsecase(
          gh<_i153.ClientsStatusReportsRepo>()));
  gh.factory<_i263.ActionLinkUsecase>(
      () => _i263.ActionLinkUsecase(gh<_i224.ImportantLinksRepo>()));
  gh.factory<_i264.GetImportantLinksUsecase>(
      () => _i264.GetImportantLinksUsecase(gh<_i224.ImportantLinksRepo>()));
  gh.lazySingleton<_i265.GetPreviousRatingsUsecase>(
      () => _i265.GetPreviousRatingsUsecase(gh<_i109.PreviousRatingsRepo>()));
  gh.lazySingleton<_i266.WaitingAgentsRepo>(
      () => _i267.WaitingAgentsRepoImpl(gh<_i145.WaitingAgentsDataSource>()));
  gh.factory<_i268.AddClientUserUsecase>(
      () => _i268.AddClientUserUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i269.ApproveRejectClientUsecase>(() =>
      _i269.ApproveRejectClientUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i270.ChangeClientCommunicationUseCase>(() =>
      _i270.ChangeClientCommunicationUseCase(
          gh<_i244.ClientsListRepository>()));
  gh.factory<_i271.ChangeTypeClientUsecase>(
      () => _i271.ChangeTypeClientUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i272.EditClientUserUsecase>(
      () => _i272.EditClientUserUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i273.GetClientsListByRegionUseCase>(() =>
      _i273.GetClientsListByRegionUseCase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i274.GetClientsListByUserUseCase>(() =>
      _i274.GetClientsListByUserUseCase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i275.GetClientsWithFilterUserUsecase>(() =>
      _i275.GetClientsWithFilterUserUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i276.GetClientMarketingReportUsecase>(() =>
      _i276.GetClientMarketingReportUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i277.GetRecommendedClientsUsecase>(() =>
      _i277.GetRecommendedClientsUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i278.GetSimilarClientsUsecase>(
      () => _i278.GetSimilarClientsUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i279.ReceiveClientUserUsecase>(
      () => _i279.ReceiveClientUserUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i280.StoreClientCommunicationUseCase>(() =>
      _i280.StoreClientCommunicationUseCase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i281.TransferClientUserUsecase>(
      () => _i281.TransferClientUserUsecase(gh<_i244.ClientsListRepository>()));
  gh.lazySingleton<_i282.GetHighSimilarClientsUsecase>(() =>
      _i282.GetHighSimilarClientsUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i283.EmployeesSalesReportsCubit>(() =>
      _i283.EmployeesSalesReportsCubit(
          gh<_i257.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i284.ChangeStateAgentUseCase>(
      () => _i284.ChangeStateAgentUseCase(gh<_i238.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i285.GetAgentsAndDistributorsUseCase>(() =>
      _i285.GetAgentsAndDistributorsUseCase(
          gh<_i238.AgentsDistributorsRepo>()));
  gh.factory<_i286.ClientsAcceptCubit>(
      () => _i286.ClientsAcceptCubit(gh<_i198.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i287.CancelWithdrawalUsecase>(() =>
      _i287.CancelWithdrawalUsecase(gh<_i236.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i288.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i288.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i236.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i289.GetWithdrawalsInvoicesUsecase>(() =>
      _i289.GetWithdrawalsInvoicesUsecase(
          gh<_i236.ManageWithdrawalsRepository>()));
  gh.factory<_i290.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i290.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i236.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i291.ExceededClientsUseCase>(
      () => _i291.ExceededClientsUseCase(gh<_i98.ExceededClientsRepo>()));
  gh.lazySingleton<_i292.TransferExceededClientsUseCase>(() =>
      _i292.TransferExceededClientsUseCase(gh<_i98.ExceededClientsRepo>()));
  gh.factory<_i293.ParticipateListBloc>(() => _i293.ParticipateListBloc(
        gh<_i253.ParticipateListUsecase>(),
        gh<_i247.AddParticipateUserUsecase>(),
        gh<_i248.EditParticipateUserUsecase>(),
        gh<_i249.ParticipateClientListUsecase>(),
        gh<_i252.ParticipateInvoiceListUsecase>(),
        gh<_i251.GetParticipateInvoiceByIdUsecase>(),
        gh<_i250.ParticipateCommentListUsecase>(),
        gh<_i246.AddParticipateCommentUsecase>(),
        gh<_i254.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i294.EditAdvancedConfigsUsecase>(() =>
      _i294.EditAdvancedConfigsUsecase(gh<_i135.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i295.GetAdvancedConfigsUsecase>(() =>
      _i295.GetAdvancedConfigsUsecase(gh<_i135.AdvancedConfigsRepository>()));
  gh.factory<_i296.ClientsInstallReportsCubit>(() =>
      _i296.ClientsInstallReportsCubit(
          gh<_i108.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i297.DatesTableRepo>(
      () => _i298.DatesTableRepoImpl(gh<_i157.DatesTableDataSource>()));
  gh.factory<_i299.GetVersionUseCase>(
      () => _i299.GetVersionUseCase(gh<_i174.AppRepository>()));
  gh.factory<_i300.AddTicketCubit>(
      () => _i300.AddTicketCubit(gh<_i124.AddTicketUseCase>()));
  gh.lazySingleton<_i301.LatestClientsUpdatesRepository>(() =>
      _i302.LatestClientsUpdatesRepositoryImpl(
          gh<_i139.LatestClientsUpdatesDatasource>()));
  gh.factory<_i303.TaskRepository>(
      () => _i304.TaskRepositoryImpl(gh<_i107.TaskDatasource>()));
  gh.lazySingleton<_i305.EditGeneralConfigsUsecase>(() =>
      _i305.EditGeneralConfigsUsecase(gh<_i199.GeneralConfigsRepository>()));
  gh.lazySingleton<_i306.GetGeneralConfigsUsecase>(() =>
      _i306.GetGeneralConfigsUsecase(gh<_i199.GeneralConfigsRepository>()));
  gh.factory<_i307.PeriodicCommunicationReportsCubit>(() =>
      _i307.PeriodicCommunicationReportsCubit(
          gh<_i204.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i308.InstallQualityCubit>(
      () => _i308.InstallQualityCubit(gh<_i209.GetInstallUseCase>()));
  gh.factory<_i309.ImportantLinksCubit>(() => _i309.ImportantLinksCubit(
        gh<_i264.GetImportantLinksUsecase>(),
        gh<_i263.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i310.AddAgentUseCase>(
      () => _i310.AddAgentUseCase(gh<_i178.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i311.UpdateAgentUseCase>(() =>
      _i311.UpdateAgentUseCase(gh<_i178.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i312.GetDelayInstallReportsUseCase>(() =>
      _i312.GetDelayInstallReportsUseCase(gh<_i172.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i313.CrudAgentSupportFilesUsecase>(() =>
      _i313.CrudAgentSupportFilesUsecase(
          gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i314.GetClientsTransferApprovalsUsecase>(() =>
      _i314.GetClientsTransferApprovalsUsecase(
          gh<_i259.ClientsTransferApprovalsRepo>()));
  gh.factory<_i315.ClientsStatusReportsCubit>(() =>
      _i315.ClientsStatusReportsCubit(
          gh<_i262.GetClientsStatusReportsUsecase>()));
  gh.factory<_i316.SupportTabCubit>(() => _i316.SupportTabCubit(
        gh<_i214.GetInvoiceByClientUsecase>(),
        gh<_i212.AddDateInstallUsecase>(),
        gh<_i217.SetDateDoneUsecase>(),
        gh<_i218.SetReadyInstallUsecase>(),
        gh<_i216.ReturnInvoiceApproveUsecase>(),
        gh<_i215.ReceiveDeviceUsecase>(),
        gh<_i213.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i317.ClientsDebtsReportsCubit>(() =>
      _i317.ClientsDebtsReportsCubit(
          gh<_i162.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i318.DeletedInvoicesCubit>(
      () => _i318.DeletedInvoicesCubit(gh<_i261.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i319.AddAgentDateUseCase>(() =>
      _i319.AddAgentDateUseCase(gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i320.GetManageWithdrawnInvoicesUsecase>(() =>
      _i320.GetManageWithdrawnInvoicesUsecase(
          gh<_i165.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i321.NotificationsCubit>(() => _i321.NotificationsCubit(
        gh<_i201.GetNotificationsUsecase>(),
        gh<_i203.MarkNotificationsAsReadUsecase>(),
        gh<_i202.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i322.WithdrawnInvoicesRepo>(() =>
      _i323.WithdrawnInvoicesRepoImpl(gh<_i141.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i324.RegionsRepository>(
      () => _i325.RegionsRepositoryImpl(gh<_i159.RegionsDatasource>()));
  gh.factory<_i326.ClientLogsTabCubit>(
      () => _i326.ClientLogsTabCubit(gh<_i227.GetClientLogsUsecase>()));
  gh.factory<_i327.RegionsSalesReportsCubit>(() =>
      _i327.RegionsSalesReportsCubit(
          gh<_i184.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i328.AgentsDistributorsActionsCubit>(
      () => _i328.AgentsDistributorsActionsCubit(
            gh<_i123.GetCitiesUseCase>(),
            gh<_i310.AddAgentUseCase>(),
            gh<_i311.UpdateAgentUseCase>(),
          ));
  gh.factory<_i329.LoginCubit>(() => _i329.LoginCubit(
        gh<_i195.LoginUsecase>(),
        gh<_i197.VerifyOtpUsecase>(),
        gh<_i193.CacheTokenUsecase>(),
        gh<_i194.GetTokenUsecase>(),
        gh<_i196.ValidateTokenUsecase>(),
      ));
  gh.lazySingleton<_i330.FetchPaginatedClientsUsecase>(() =>
      _i330.FetchPaginatedClientsUsecase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i331.FetchLinkClientsUseCase>(
      () => _i331.FetchLinkClientsUseCase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i332.LinkSelectedClientsUseCase>(() =>
      _i332.LinkSelectedClientsUseCase(gh<_i244.ClientsListRepository>()));
  gh.factory<_i333.SpecialClientsBloc>(
      () => _i333.SpecialClientsBloc(gh<_i188.GetSpecialClientsUsecase>()));
  gh.factory<_i334.AddCommentUsecase>(
      () => _i334.AddCommentUsecase(gh<_i206.CompanyRepository>()));
  gh.factory<_i335.GetCommentUsecase>(
      () => _i335.GetCommentUsecase(gh<_i206.CompanyRepository>()));
  gh.factory<_i336.DelayInstallReportsCubit>(() =>
      _i336.DelayInstallReportsCubit(
          gh<_i312.GetDelayInstallReportsUseCase>()));
  gh.factory<_i337.GreetingCommunicationCubit>(() =>
      _i337.GreetingCommunicationCubit(
          gh<_i258.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i338.GetRegionsUseCase>(
      () => _i338.GetRegionsUseCase(gh<_i324.RegionsRepository>()));
  gh.lazySingleton<_i339.GetLatestClientsUseCase>(() =>
      _i339.GetLatestClientsUseCase(
          gh<_i301.LatestClientsUpdatesRepository>()));
  gh.factory<_i340.AdvancedCofigsCubit>(() => _i340.AdvancedCofigsCubit(
        gh<_i295.GetAdvancedConfigsUsecase>(),
        gh<_i294.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i341.SupportClientsInvoicesCubit>(() =>
      _i341.SupportClientsInvoicesCubit(
          gh<_i235.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i342.WrongNumbersCubit>(
      () => _i342.WrongNumbersCubit(gh<_i192.GetWrongNumbersUsecase>()));
  gh.factory<_i343.ClientsTransferApprovalsCubit>(() =>
      _i343.ClientsTransferApprovalsCubit(
          gh<_i314.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i344.RegionsCubit>(
      () => _i344.RegionsCubit(gh<_i338.GetRegionsUseCase>()));
  gh.factory<_i345.GeneralCofigsCubit>(() => _i345.GeneralCofigsCubit(
        gh<_i306.GetGeneralConfigsUsecase>(),
        gh<_i305.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i346.GetPeriodicCommunicationUseCase>(() =>
      _i346.GetPeriodicCommunicationUseCase(
          gh<_i222.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i347.GetClientsDebtsUsecase>(
      () => _i347.GetClientsDebtsUsecase(gh<_i220.ClientsDebtsRepo>()));
  gh.lazySingleton<_i348.CrudClientSupportFilesUsecase>(() =>
      _i348.CrudClientSupportFilesUsecase(
          repository: gh<_i244.ClientsListRepository>()));
  gh.lazySingleton<_i349.GetClientSupportFilesUsecase>(() =>
      _i349.GetClientSupportFilesUsecase(
          repository: gh<_i244.ClientsListRepository>()));
  gh.factory<_i350.BranchesCubit>(
      () => _i350.BranchesCubit(gh<_i205.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i351.AddAgentCommentUsecase>(() =>
      _i351.AddAgentCommentUsecase(gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i352.DoneTrainingUsecase>(() =>
      _i352.DoneTrainingUsecase(gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i353.GetAgentByIdUsecase>(() =>
      _i353.GetAgentByIdUsecase(gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i354.GetAgentClientListUsecase>(() =>
      _i354.GetAgentClientListUsecase(
          gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i355.GetAgentCommentsListUsecase>(() =>
      _i355.GetAgentCommentsListUsecase(
          gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i356.GetAgentDatesListUsecase>(() =>
      _i356.GetAgentDatesListUsecase(
          gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i357.GetAgentInvoiceListUsecase>(() =>
      _i357.GetAgentInvoiceListUsecase(
          gh<_i210.AgentsDistributorsProfileRepo>()));
  gh.factory<_i358.AddRejectReasonsUsecase>(() =>
      _i358.AddRejectReasonsUsecase(gh<_i236.ManageWithdrawalsRepository>()));
  gh.factory<_i359.EditRejectReasonsUsecase>(() =>
      _i359.EditRejectReasonsUsecase(gh<_i236.ManageWithdrawalsRepository>()));
  gh.factory<_i360.GetRejectReasonsUsecase>(() =>
      _i360.GetRejectReasonsUsecase(gh<_i236.ManageWithdrawalsRepository>()));
  gh.factory<_i361.GetUserSeriesUsecase>(() =>
      _i361.GetUserSeriesUsecase(gh<_i236.ManageWithdrawalsRepository>()));
  gh.factory<_i362.GetWithdrawnDetailsUsecase>(() =>
      _i362.GetWithdrawnDetailsUsecase(
          gh<_i236.ManageWithdrawalsRepository>()));
  gh.factory<_i363.SetApproveSeriesUsecase>(() =>
      _i363.SetApproveSeriesUsecase(gh<_i236.ManageWithdrawalsRepository>()));
  gh.factory<_i364.UpdateSeriesUsecase>(
      () => _i364.UpdateSeriesUsecase(gh<_i236.ManageWithdrawalsRepository>()));
  gh.factory<_i365.NotUsingSystemCubit>(
      () => _i365.NotUsingSystemCubit(gh<_i242.GetNotUsingSystemUsecase>()));
  gh.singleton<_i366.AppManagerCubit>(
      () => _i366.AppManagerCubit(gh<_i299.GetVersionUseCase>()));
  gh.lazySingleton<_i367.GetWaitingAgentsUsecase>(
      () => _i367.GetWaitingAgentsUsecase(gh<_i266.WaitingAgentsRepo>()));
  gh.factory<_i368.InvoicesSectionCubit>(() => _i368.InvoicesSectionCubit(
        gh<_i190.GetInvoicesByPrivilegesUsecase>(),
        gh<_i285.GetAgentsAndDistributorsUseCase>(),
        gh<_i253.ParticipateListUsecase>(),
        gh<_i219.GetAllUsersUseCase>(),
        gh<_i191.GetInvoiceByIdUsecase>(),
        gh<_i189.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i369.ProductsSalesReportsCubit>(() =>
      _i369.ProductsSalesReportsCubit(
          gh<_i240.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i370.GetWithdrawnInvoicesUsecase>(() =>
      _i370.GetWithdrawnInvoicesUsecase(gh<_i322.WithdrawnInvoicesRepo>()));
  gh.factory<_i371.PreviousRatingsCubit>(
      () => _i371.PreviousRatingsCubit(gh<_i265.GetPreviousRatingsUsecase>()));
  gh.factory<_i372.AgentsDistributorsCubit>(() => _i372.AgentsDistributorsCubit(
        gh<_i285.GetAgentsAndDistributorsUseCase>(),
        gh<_i284.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i373.ExceededClientsCubit>(() => _i373.ExceededClientsCubit(
        gh<_i291.ExceededClientsUseCase>(),
        gh<_i292.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i374.ClientsListBloc>(() => _i374.ClientsListBloc(
        gh<_i275.GetClientsWithFilterUserUsecase>(),
        gh<_i277.GetRecommendedClientsUsecase>(),
        gh<_i278.GetSimilarClientsUsecase>(),
        gh<_i268.AddClientUserUsecase>(),
        gh<_i272.EditClientUserUsecase>(),
        gh<_i271.ChangeTypeClientUsecase>(),
        gh<_i270.ChangeClientCommunicationUseCase>(),
        gh<_i280.StoreClientCommunicationUseCase>(),
        gh<_i269.ApproveRejectClientUsecase>(),
        gh<_i348.CrudClientSupportFilesUsecase>(),
        gh<_i349.GetClientSupportFilesUsecase>(),
        gh<_i281.TransferClientUserUsecase>(),
        gh<_i279.ReceiveClientUserUsecase>(),
        gh<_i276.GetClientMarketingReportUsecase>(),
        gh<_i282.GetHighSimilarClientsUsecase>(),
        gh<_i331.FetchLinkClientsUseCase>(),
        gh<_i330.FetchPaginatedClientsUsecase>(),
        gh<_i332.LinkSelectedClientsUseCase>(),
        gh<_i226.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i375.ManageWithdrawalsCubit>(() => _i375.ManageWithdrawalsCubit(
        gh<_i361.GetUserSeriesUsecase>(),
        gh<_i364.UpdateSeriesUsecase>(),
        gh<_i233.GetUsersUsecase>(),
        gh<_i289.GetWithdrawalsInvoicesUsecase>(),
        gh<_i290.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i363.SetApproveSeriesUsecase>(),
        gh<_i362.GetWithdrawnDetailsUsecase>(),
        gh<_i358.AddRejectReasonsUsecase>(),
        gh<_i360.GetRejectReasonsUsecase>(),
        gh<_i359.EditRejectReasonsUsecase>(),
        gh<_i288.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i287.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i376.ManageWithdrawnInvoicesCubit>(() =>
      _i376.ManageWithdrawnInvoicesCubit(
          gh<_i320.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i377.LatestClientsUpdatesCubit>(() =>
      _i377.LatestClientsUpdatesCubit(gh<_i339.GetLatestClientsUseCase>()));
  gh.factory<_i378.AttachmentsRowCubit>(() => _i378.AttachmentsRowCubit(
        gh<_i349.GetClientSupportFilesUsecase>(),
        gh<_i348.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i379.CancelScheduleUsecase>(
      () => _i379.CancelScheduleUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i380.ChangeDateToDonUsecase>(
      () => _i380.ChangeDateToDonUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i381.GetCancelReasonsUsecase>(
      () => _i381.GetCancelReasonsUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i382.GetDateInstallationUsecase>(
      () => _i382.GetDateInstallationUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i383.GetInvoicesByClientForDateUsecase>(() =>
      _i383.GetInvoicesByClientForDateUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i384.GetSubscribedClientsUsecase>(
      () => _i384.GetSubscribedClientsUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i385.RescheduleDateUsecase>(
      () => _i385.RescheduleDateUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i386.ReturnScheduleVisitToOpenUsecase>(
      () => _i386.ReturnScheduleVisitToOpenUsecase(gh<_i297.DatesTableRepo>()));
  gh.factory<_i387.AddTaskUsecase>(
      () => _i387.AddTaskUsecase(gh<_i303.TaskRepository>()));
  gh.factory<_i388.ChangeStatusTaskUsecase>(
      () => _i388.ChangeStatusTaskUsecase(gh<_i303.TaskRepository>()));
  gh.factory<_i389.GetTasksUsecase>(
      () => _i389.GetTasksUsecase(gh<_i303.TaskRepository>()));
  gh.factory<_i390.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i390.GetUsersByDepartmentAndRegionUsecase(gh<_i303.TaskRepository>()));
  gh.lazySingleton<_i391.TaskCubit>(() => _i391.TaskCubit(
        gh<_i387.AddTaskUsecase>(),
        gh<_i389.GetTasksUsecase>(),
        gh<_i388.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i392.UsersCubit>(() => _i392.UsersCubit(
        gh<_i233.GetUsersUsecase>(),
        gh<_i234.GetUserByIdUsecase>(),
        gh<_i100.ActionUserUsecase>(),
        gh<_i390.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i232.GetManagesForUserUsecase>(),
        gh<_i231.GetLevelsForUserUsecase>(),
        gh<_i230.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i393.CompanyCubit>(() => _i393.CompanyCubit(
        gh<_i335.GetCommentUsecase>(),
        gh<_i334.AddCommentUsecase>(),
      ));
  gh.factory<_i394.ClientsDebtsCubit>(
      () => _i394.ClientsDebtsCubit(gh<_i347.GetClientsDebtsUsecase>()));
  gh.factory<_i395.PeriodicCommunicationCubit>(() =>
      _i395.PeriodicCommunicationCubit(
          gh<_i346.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i396.AgentsDistributorsProfileBloc>(
      () => _i396.AgentsDistributorsProfileBloc(
            gh<_i353.GetAgentByIdUsecase>(),
            gh<_i354.GetAgentClientListUsecase>(),
            gh<_i357.GetAgentInvoiceListUsecase>(),
            gh<_i251.GetParticipateInvoiceByIdUsecase>(),
            gh<_i355.GetAgentCommentsListUsecase>(),
            gh<_i351.AddAgentCommentUsecase>(),
            gh<_i352.DoneTrainingUsecase>(),
            gh<_i319.AddAgentDateUseCase>(),
            gh<_i356.GetAgentDatesListUsecase>(),
            gh<_i313.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i397.DatesTableCubit>(() => _i397.DatesTableCubit(
        gh<_i382.GetDateInstallationUsecase>(),
        gh<_i385.RescheduleDateUsecase>(),
        gh<_i380.ChangeDateToDonUsecase>(),
        gh<_i379.CancelScheduleUsecase>(),
        gh<_i386.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i384.GetSubscribedClientsUsecase>(),
        gh<_i383.GetInvoicesByClientForDateUsecase>(),
        gh<_i212.AddDateInstallUsecase>(),
        gh<_i381.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i398.WithdrawnInvoicesCubit>(() =>
      _i398.WithdrawnInvoicesCubit(gh<_i370.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i399.WaitingAgentsCubit>(
      () => _i399.WaitingAgentsCubit(gh<_i367.GetWaitingAgentsUsecase>()));
  return getIt;
}
