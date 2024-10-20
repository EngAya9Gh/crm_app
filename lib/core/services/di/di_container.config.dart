// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i21;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i7;
import 'package:logger/logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i20;

import '../../../api/api.dart' as _i6;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i60;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i171;
import '../../../features/app/domain/repositories/app_repository.dart' as _i170;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i292;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i366;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i286;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i127;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i326;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i325;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i338;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i339;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i340;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i341;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i342;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i396;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i31;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i47;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i46;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i189;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i278;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i28;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i92;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i91;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i114;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i181;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i25;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i37;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i36;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i234;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i365;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i55;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i69;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i119;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i120;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i121;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i123;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i122;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i124;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i293;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i147;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i125;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i27;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i39;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i38;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i188;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i337;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i11;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i51;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i50;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i98;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i248;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i18;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i156;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i155;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i250;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i332;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i52;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i165;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i164;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i200;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i301;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i41;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i215;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i214;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i346;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i395;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i33;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i44;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i43;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i195;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i300;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i26;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i105;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i104;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i257;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i371;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i61;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i142;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i141;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i184;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i327;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i90;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i97;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i96;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i196;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i350;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i66;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i117;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i116;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i118;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i233;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i72;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i107;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i106;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i219;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i319;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i111;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i183;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i182;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i204;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i205;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i206;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i207;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i208;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i209;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i210;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i309;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i152;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i318;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i317;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i333;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i344;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i65;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i82;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i81;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i112;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i235;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i3;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i67;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i131;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i130;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i287;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i288;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i335;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i85;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i191;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i190;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i298;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i299;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i345;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i17;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i54;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i53;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i109;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i110;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i126;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i14;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i167;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i166;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i173;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i172;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i199;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i57;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i84;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i83;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i95;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i222;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i223;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i224;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i226;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i225;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i392;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i45;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i229;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i228;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i358;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i279;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i359;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i280;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i360;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i361;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i282;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i281;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i362;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i363;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i364;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i375;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i30;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i29;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i192;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i193;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i194;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i314;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i48;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i213;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i212;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i347;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i394;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i62;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i35;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i237;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i236;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i260;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i261;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_client_communication_usecase.dart'
    as _i262;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i263;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i348;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i264;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i218;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i323;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i322;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i268;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i349;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i265;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i266;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i267;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i274;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i269;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i270;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i324;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i271;
import '../../../features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart'
    as _i272;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i273;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i374;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i58;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i252;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i251;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i307;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i343;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i49;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i87;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i86;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i143;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i176;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i134;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i295;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i294;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i334;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i377;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i13;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i89;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i88;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i113;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i247;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i63;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i198;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i197;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i328;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i329;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i393;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i108;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i178;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i177;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i253;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i311;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i59;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i94;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i93;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i283;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i284;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i373;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i115;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i138;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i137;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i185;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i211;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i187;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i186;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i368;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i135;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i162;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i161;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i313;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i376;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i19;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i101;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i146;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i175;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i203;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i174;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i202;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i230;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i351;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i312;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i303;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i276;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i306;
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
    as _i277;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i304;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i321;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i397;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i372;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i64;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i217;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i216;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i255;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i256;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i302;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i40;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i133;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i132;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i238;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i239;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i246;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i240;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i241;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i242;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i243;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i244;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i245;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i285;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i75;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i74;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i154;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i310;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i32;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i149;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i148;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i254;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i308;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i42;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i129;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i128;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i249;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i275;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i16;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i145;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i144;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i232;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i369;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i71;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i70;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i180;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i320;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i136;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i316;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i315;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i370;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i399;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i22;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i100;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i99;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i103;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i289;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i150;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i291;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i290;
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
    as _i398;
import '../../../features/support/dates_timeline/data/data_sources/dates_timeline_datasource.dart'
    as _i73;
import '../../../features/support/dates_timeline/data/respositories_impl/dates_timeline_repo_impl.dart'
    as _i158;
import '../../../features/support/dates_timeline/domain/respositories/dates_timline_repo.dart'
    as _i157;
import '../../../features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart'
    as _i201;
import '../../../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart'
    as _i331;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i12;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i79;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i78;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i151;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i179;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i34;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i169;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i168;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i305;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i330;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i10;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i77;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i76;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i80;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i139;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i56;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i221;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i220;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i227;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i336;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i140;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i259;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i258;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i367;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i400;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i102;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i297;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i296;
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
import '../cache_services/cache_services.dart' as _i159;
import '../cache_services/prefs_consumer.dart' as _i163;
import '../cache_services/secure_storage_consumer.dart' as _i160;
import '../maps/location_services.dart' as _i153;
import 'di_container.dart' as _i401;

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
  gh.factory<_i3.WebHomePageCubit>(() => _i3.WebHomePageCubit());
  gh.singleton<_i4.Logger>(() => appModule.logger);
  gh.singleton<_i5.Dio>(() => appModule.dio);
  gh.lazySingleton<_i6.Api>(() => _i6.Api());
  gh.lazySingleton<_i7.Location>(() => appModule.location);
  gh.singleton<_i8.ApiServices>(() => _i9.DioServices(gh<_i5.Dio>()));
  gh.lazySingleton<_i10.SupportClientsAcceptDatasource>(
      () => _i10.SupportClientsAcceptDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i11.EvaluationLevelReportDatasource>(
      () => _i11.EvaluationLevelReportDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i12.DelayAfterInstallDatasource>(
      () => _i12.DelayAfterInstallDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i13.PendingInvoicesDatasource>(
      () => _i13.PendingInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i14.PrivilegesDatasource>(
      () => _i14.PrivilegesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i15.NotificationsDatasource>(
      () => _i15.NotificationsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i16.ProductsSalesReportsDatasource>(
      () => _i16.ProductsSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i17.LevelsDatasource>(
      () => _i17.LevelsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i18.GreetingCommunicationDatasource>(
      () => _i18.GreetingCommunicationDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i19.AgentsDistributorsActionsDataSource>(() =>
      _i19.AgentsDistributorsActionsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.singletonAsync<_i20.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i21.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i22.ClientsInstallReportsDatasource>(
      () => _i22.ClientsInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i23.RegionsSalesReportsDatasource>(
      () => _i23.RegionsSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i24.ClientsDebtsReportsDatasource>(
      () => _i24.ClientsDebtsReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i25.NotUsingSystemDatasource>(
      () => _i25.NotUsingSystemDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i26.PreviousRatingsDatasource>(
      () => _i26.PreviousRatingsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i27.WrongNumbersDatasource>(
      () => _i27.WrongNumbersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i28.ClientsCareReportsDatasource>(
      () => _i28.ClientsCareReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i29.NotificationsRepo>(
      () => _i30.NotificationsRepoImpl(gh<_i15.NotificationsDatasource>()));
  gh.lazySingleton<_i31.ClientsAcceptDatasource>(
      () => _i31.ClientsAcceptDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i32.ClientsStatusReportsDatasource>(
      () => _i32.ClientsStatusReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i33.PeriodicCommunicationReportsDatasource>(() =>
      _i33.PeriodicCommunicationReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i34.DelayInstallReportsDatasource>(
      () => _i34.DelayInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i35.LinkClientApiService>(
      () => _i35.LinkClientApiService(gh<_i5.Dio>()));
  gh.lazySingleton<_i36.NotUsingSystemRepo>(
      () => _i37.NotUsingSystemRepoImpl(gh<_i25.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i38.WrongNumbersRepo>(
      () => _i39.WrongNumbersRepoImpl(gh<_i27.WrongNumbersDatasource>()));
  gh.lazySingleton<_i40.ParticipatesListDatasource>(
      () => _i40.ParticipatesListDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i41.PeriodicCommunicationDatasource>(
      () => _i41.PeriodicCommunicationDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i42.EmployeesSalesReportsDatasource>(
      () => _i42.EmployeesSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i43.PeriodicCommunicationReportsRepo>(() =>
      _i44.PeriodicCommunicationReportsRepoImpl(
          gh<_i33.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i45.ManageWithdrawalsDatasource>(
      () => _i45.ManageWithdrawalsDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i46.ClientsAcceptRepository>(() =>
      _i47.ClientsAcceptRepositoryImpl(gh<_i31.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i48.ClientsDebtsDatasource>(
      () => _i48.ClientsDebtsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i49.FinancePendingDatasource>(
      () => _i49.FinancePendingDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i50.EvaluationLevelReportRepo>(() =>
      _i51.EvaluationLevelReportRepoImpl(
          gh<_i11.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i52.InstallQualityDatasource>(
      () => _i52.InstallQualityDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i53.LevelsRepo>(
      () => _i54.LevelsRepoImpl(gh<_i17.LevelsDatasource>()));
  gh.lazySingleton<_i55.TicketsDataSource>(
      () => _i55.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i56.SupportClientsInvoicesDatasource>(
      () => _i56.DelayInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i57.UsersDatasource>(
      () => _i57.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.singletonAsync<_i20.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i21.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i58.ClientsTransferApprovalsDatasource>(
      () => _i58.ClientsTransferApprovalsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i59.ExceededClientsDatasource>(
      () => _i59.ExceededClientsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i60.AppDatasource>(
      () => _i60.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i61.SpecialClientsDatasource>(
      () => _i61.SpecialClientsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i62.ClientsListDatasource>(
      () => _i62.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i63.CommentCompanyDatasource>(
      () => _i63.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i64.ImportantLinksDatasource>(
      () => _i64.ImportantLinksDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i65.UsersDatasource>(
      () => _i65.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i66.CitiesDatasource>(
      () => _i66.CitiesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i67.AdvancedConfigsDatasource>(
      () => _i67.AdvancedConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i68.TicketsRepo>(
      () => _i69.TicketsRepoImpl(gh<_i55.TicketsDataSource>()));
  gh.lazySingleton<_i70.RegionsSalesReportsRepo>(() =>
      _i71.RegionsSalesReportsRepoImpl(
          gh<_i23.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i72.ClientLogsTabDataSource>(
      () => _i72.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i73.DatesTimelineDatasource>(
      () => _i73.DatesTimelineDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i74.ClientsDebtsReportsRepo>(() =>
      _i75.ClientsDebtsReportsRepoImpl(
          gh<_i24.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i76.SupportClientsAcceptRepository>(() =>
      _i77.SupportClientsAcceptRepositoryImpl(
          gh<_i10.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i78.DelayAfterInstallRepo>(() =>
      _i79.DelayAfterInstallRepoImpl(gh<_i12.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i80.GetSupportClientsAcceptUseCase>(() =>
      _i80.GetSupportClientsAcceptUseCase(
          gh<_i76.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i81.UsersRepository>(
      () => _i82.UsersRepositoryImpl(gh<_i65.UsersDatasource>()));
  gh.lazySingleton<_i83.UsersRepository>(
      () => _i84.UsersRepositoryImpl(gh<_i57.UsersDatasource>()));
  gh.lazySingleton<_i85.GeneralConfigsDatasource>(
      () => _i85.GeneralConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i86.FinancePendingRepo>(
      () => _i87.FinancePendingRepoImpl(gh<_i49.FinancePendingDatasource>()));
  gh.lazySingleton<_i88.PendingInvoicesRepo>(
      () => _i89.PendingInvoicesRepoImpl(gh<_i13.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i90.BranchesDatasource>(
      () => _i90.BranchesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i91.ClientsCareReportsRepo>(() =>
      _i92.ClientsCareReportsRepoImpl(gh<_i28.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i93.ExceededClientsRepo>(
      () => _i94.ExceededClientsRepoImpl(gh<_i59.ExceededClientsDatasource>()));
  gh.factory<_i95.ActionUserUsecase>(
      () => _i95.ActionUserUsecase(gh<_i83.UsersRepository>()));
  gh.lazySingleton<_i96.BranchesRepository>(
      () => _i97.BranchesRepositoryImpl(gh<_i90.BranchesDatasource>()));
  gh.lazySingleton<_i98.GetEvaluationLevelReportUsecase>(() =>
      _i98.GetEvaluationLevelReportUsecase(
          gh<_i50.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i99.ClientsInstallReportsRepo>(() =>
      _i100.ClientsInstallReportsRepoImpl(
          gh<_i22.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i101.AgentsDistributorsDataSource>(
      () => _i101.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i102.TaskDatasource>(
      () => _i102.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i103.GetClientsInstallReportsUsecase>(() =>
      _i103.GetClientsInstallReportsUsecase(
          gh<_i99.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i104.PreviousRatingsRepo>(() =>
      _i105.PreviousRatingsRepoImpl(gh<_i26.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i106.ClientLogsTabRepo>(
      () => _i107.ClientLogsTabRepoImpl(gh<_i72.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i108.DeletedInvoicesDatasource>(
      () => _i108.DeletedInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i109.AddLevelUsecase>(
      () => _i109.AddLevelUsecase(gh<_i53.LevelsRepo>()));
  gh.lazySingleton<_i110.GetLevelsUsecase>(
      () => _i110.GetLevelsUsecase(gh<_i53.LevelsRepo>()));
  gh.lazySingleton<_i111.SupportTabDataSource>(
      () => _i111.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i112.GetUsersUsecase>(
      () => _i112.GetUsersUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i113.GetPendingInvoicesUsecase>(
      () => _i113.GetPendingInvoicesUsecase(gh<_i88.PendingInvoicesRepo>()));
  gh.lazySingleton<_i114.GetClientsCareReportsUsecase>(() =>
      _i114.GetClientsCareReportsUsecase(gh<_i91.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i115.InvoicesTabDataSource>(
      () => _i115.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i116.CitiesRepository>(
      () => _i117.CitiesRepositoryImpl(gh<_i66.CitiesDatasource>()));
  gh.lazySingleton<_i118.GetCitiesUseCase>(
      () => _i118.GetCitiesUseCase(gh<_i116.CitiesRepository>()));
  gh.lazySingleton<_i119.AddTicketUseCase>(
      () => _i119.AddTicketUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i120.EditTicketTypeUseCase>(
      () => _i120.EditTicketTypeUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i121.GetClientTicketsUseCase>(
      () => _i121.GetClientTicketsUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i122.GetTicketsUseCase>(
      () => _i122.GetTicketsUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i123.GetTicketByIdUseCase>(
      () => _i123.GetTicketByIdUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i124.TransferTicketUseCase>(
      () => _i124.TransferTicketUseCase(gh<_i68.TicketsRepo>()));
  gh.factory<_i125.TicketsCubit>(() => _i125.TicketsCubit(
        gh<_i122.GetTicketsUseCase>(),
        gh<_i123.GetTicketByIdUseCase>(),
        gh<_i121.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i126.LevelsCubit>(() => _i126.LevelsCubit(
        gh<_i110.GetLevelsUsecase>(),
        gh<_i109.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i127.LoginRemoteDataSource>(
      () => _i127.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i128.EmployeesSalesReportsRepo>(() =>
      _i129.EmployeesSalesReportsRepoImpl(
          gh<_i42.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i130.AdvancedConfigsRepository>(() =>
      _i131.AdvancedConfigsRepositoryImpl(
          gh<_i67.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i132.ParticipateListRepository>(() =>
      _i133.ParticipateListRepositoryImpl(
          gh<_i40.ParticipatesListDatasource>()));
  gh.lazySingleton<_i134.LatestClientsUpdatesDatasource>(
      () => _i134.LatestClientsUpdatesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i135.ManageWithdrawnInvoicesDataSource>(
      () => _i135.ManageWithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i136.WithdrawnInvoicesDataSource>(
      () => _i136.WithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i137.InvoicesSectionRepo>(
      () => _i138.InvoicesTabRepoImpl(gh<_i115.InvoicesTabDataSource>()));
  gh.factory<_i139.SupportClientsAcceptCubit>(() =>
      _i139.SupportClientsAcceptCubit(
          gh<_i80.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i140.WaitingAgentsDataSource>(
      () => _i140.WaitingAgentsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i141.SpecialClientsRepository>(() =>
      _i142.SpecialClientsRepositoryImpl(gh<_i61.SpecialClientsDatasource>()));
  gh.lazySingleton<_i143.GetFinancePendingInvoicesUsecase>(() =>
      _i143.GetFinancePendingInvoicesUsecase(gh<_i86.FinancePendingRepo>()));
  gh.lazySingleton<_i144.ProductsSalesReportsRepo>(() =>
      _i145.ProductsSalesReportsRepoImpl(
          gh<_i16.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i146.AgentsDistributorsProfileDataSource>(() =>
      _i146.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i147.EditTicketCubit>(() => _i147.EditTicketCubit(
        gh<_i120.EditTicketTypeUseCase>(),
        gh<_i124.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i148.ClientsStatusReportsRepo>(() =>
      _i149.ClientsStatusReportsRepoImpl(
          gh<_i32.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i150.DatesTableDataSource>(
      () => _i150.DatesTableDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i151.GetDelayAfterInstallUseCase>(() =>
      _i151.GetDelayAfterInstallUseCase(gh<_i78.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i152.RegionsDatasource>(
      () => _i152.RegionsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i153.LocationServices>(
      () => _i153.LocationServices(gh<_i7.Location>()));
  gh.lazySingleton<_i154.GetClientsDebtsReportsUsecase>(() =>
      _i154.GetClientsDebtsReportsUsecase(gh<_i74.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i155.GreetingCommunicationRepo>(() =>
      _i156.GreetingCommunicationRepoImpl(
          gh<_i18.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i157.DatesTimeLinesRepo>(
      () => _i158.DatesTimelineRepoImpl(gh<_i73.DatesTimelineDatasource>()));
  gh.singleton<_i159.CacheServices>(
    () => _i160.SecureStorageConsumer(gh<_i21.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i161.ManageWithdrawnInvoicesRepo>(() =>
      _i162.ManageWithdrawnInvoicesRepoImpl(
          gh<_i135.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i159.CacheServices>(() async =>
      _i163.PrefsConsumer(await gh.getAsync<_i20.SharedPreferences>()));
  gh.lazySingleton<_i164.InstallQualityRepo>(
      () => _i165.InstallQualityRepoImpl(gh<_i52.InstallQualityDatasource>()));
  gh.lazySingleton<_i166.PrivilegesRepo>(
      () => _i167.PrivilegesRepoImpl(gh<_i14.PrivilegesDatasource>()));
  gh.lazySingleton<_i168.DelayInstallReportsRepo>(() =>
      _i169.DelayInstallReportsRepoImpl(
          gh<_i34.DelayInstallReportsDatasource>()));
  gh.factory<_i170.AppRepository>(
      () => _i171.AppRepositoryImpl(gh<_i60.AppDatasource>()));
  gh.factory<_i172.UpdatePrivilegesUsecase>(
      () => _i172.UpdatePrivilegesUsecase(gh<_i166.PrivilegesRepo>()));
  gh.lazySingleton<_i173.GetPrivilegesUsecase>(
      () => _i173.GetPrivilegesUsecase(gh<_i166.PrivilegesRepo>()));
  gh.lazySingleton<_i174.AgentsDistributorsActionsRepo>(() =>
      _i175.AgentsDistributorsActionsRepoImpl(
          gh<_i19.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i176.FinancePendingCubit>(() =>
      _i176.FinancePendingCubit(gh<_i143.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i177.DeletedInvoicesRepo>(() =>
      _i178.DeletedInvoicesRepoImpl(gh<_i108.DeletedInvoicesDatasource>()));
  gh.factory<_i179.DelayAfterInstallCubit>(() =>
      _i179.DelayAfterInstallCubit(gh<_i151.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i180.GetRegionsSalesReportsUsecase>(() =>
      _i180.GetRegionsSalesReportsUsecase(gh<_i70.RegionsSalesReportsRepo>()));
  gh.factory<_i181.ClientsCareReportsCubit>(() =>
      _i181.ClientsCareReportsCubit(gh<_i114.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i182.SupportTabRepo>(
      () => _i183.SupportTabRepoImpl(gh<_i111.SupportTabDataSource>()));
  gh.factory<_i184.GetSpecialClientsUsecase>(() =>
      _i184.GetSpecialClientsUsecase(gh<_i141.SpecialClientsRepository>()));
  gh.lazySingleton<_i185.ExportInvoicesToExcelUsecase>(() =>
      _i185.ExportInvoicesToExcelUsecase(gh<_i137.InvoicesSectionRepo>()));
  gh.lazySingleton<_i186.GetInvoicesByPrivilegesUsecase>(() =>
      _i186.GetInvoicesByPrivilegesUsecase(gh<_i137.InvoicesSectionRepo>()));
  gh.lazySingleton<_i187.GetInvoiceByIdUsecase>(
      () => _i187.GetInvoiceByIdUsecase(gh<_i137.InvoicesSectionRepo>()));
  gh.lazySingleton<_i188.GetWrongNumbersUsecase>(
      () => _i188.GetWrongNumbersUsecase(gh<_i38.WrongNumbersRepo>()));
  gh.lazySingleton<_i189.GetClientsAcceptUseCase>(
      () => _i189.GetClientsAcceptUseCase(gh<_i46.ClientsAcceptRepository>()));
  gh.lazySingleton<_i190.GeneralConfigsRepository>(() =>
      _i191.GeneralConfigsRepositoryImpl(gh<_i85.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i192.GetNotificationsUsecase>(
      () => _i192.GetNotificationsUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i193.GetUnreadNotificationsCountUsecase>(() =>
      _i193.GetUnreadNotificationsCountUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i194.MarkNotificationsAsReadUsecase>(
      () => _i194.MarkNotificationsAsReadUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i195.GetPeriodicCommunicationReportsUsecase>(() =>
      _i195.GetPeriodicCommunicationReportsUsecase(
          gh<_i43.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i196.GetBranchesByIdCountryUseCase>(
      () => _i196.GetBranchesByIdCountryUseCase(gh<_i96.BranchesRepository>()));
  gh.factory<_i197.CompanyRepository>(
      () => _i198.CompanyRepositoryImpl(gh<_i63.CommentCompanyDatasource>()));
  gh.singleton<_i199.PrivilegesCubit>(() => _i199.PrivilegesCubit(
        gh<_i173.GetPrivilegesUsecase>(),
        gh<_i172.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i200.GetInstallUseCase>(
      () => _i200.GetInstallUseCase(gh<_i164.InstallQualityRepo>()));
  gh.lazySingleton<_i201.GetTimelineByEmployeeUseCase>(
      () => _i201.GetTimelineByEmployeeUseCase(gh<_i157.DatesTimeLinesRepo>()));
  gh.lazySingleton<_i202.AgentsDistributorsProfileRepo>(() =>
      _i203.AgentsDistributorsProfileRepoImpl(
          gh<_i146.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i204.AddDateInstallUsecase>(
      () => _i204.AddDateInstallUsecase(gh<_i182.SupportTabRepo>()));
  gh.lazySingleton<_i205.CancelDateInstallUsecase>(
      () => _i205.CancelDateInstallUsecase(gh<_i182.SupportTabRepo>()));
  gh.lazySingleton<_i206.GetInvoiceByClientUsecase>(
      () => _i206.GetInvoiceByClientUsecase(gh<_i182.SupportTabRepo>()));
  gh.lazySingleton<_i207.ReceiveDeviceUsecase>(
      () => _i207.ReceiveDeviceUsecase(gh<_i182.SupportTabRepo>()));
  gh.lazySingleton<_i208.ReturnInvoiceApproveUsecase>(
      () => _i208.ReturnInvoiceApproveUsecase(gh<_i182.SupportTabRepo>()));
  gh.lazySingleton<_i209.SetDateDoneUsecase>(
      () => _i209.SetDateDoneUsecase(gh<_i182.SupportTabRepo>()));
  gh.lazySingleton<_i210.SetReadyInstallUsecase>(
      () => _i210.SetReadyInstallUsecase(gh<_i182.SupportTabRepo>()));
  gh.lazySingleton<_i211.GetAllUsersUseCase>(
      () => _i211.GetAllUsersUseCase(gh<_i137.InvoicesSectionRepo>()));
  gh.lazySingleton<_i212.ClientsDebtsRepo>(
      () => _i213.ClientsDebtsRepoImpl(gh<_i48.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i214.PeriodicCommunicationRepo>(() =>
      _i215.PeriodicCommunicationRepoImpl(
          gh<_i41.PeriodicCommunicationDatasource>()));
  gh.factory<_i216.ImportantLinksRepo>(
      () => _i217.ImportantLinksRepoImpl(gh<_i64.ImportantLinksDatasource>()));
  gh.factory<_i218.ExportClientsToExcelUseCase>(() =>
      _i218.ExportClientsToExcelUseCase(gh<_i62.ClientsListDatasource>()));
  gh.lazySingleton<_i219.GetClientLogsUsecase>(
      () => _i219.GetClientLogsUsecase(gh<_i106.ClientLogsTabRepo>()));
  gh.lazySingleton<_i220.SupportClientsInvoicesRepo>(() =>
      _i221.SupportClientsInvoicesRepoImpl(
          gh<_i56.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i222.GetBranchesForUserUsecase>(
      () => _i222.GetBranchesForUserUsecase(gh<_i83.UsersRepository>()));
  gh.lazySingleton<_i223.GetLevelsForUserUsecase>(
      () => _i223.GetLevelsForUserUsecase(gh<_i83.UsersRepository>()));
  gh.lazySingleton<_i224.GetManagesForUserUsecase>(
      () => _i224.GetManagesForUserUsecase(gh<_i83.UsersRepository>()));
  gh.factory<_i225.GetUsersUsecase>(
      () => _i225.GetUsersUsecase(gh<_i83.UsersRepository>()));
  gh.factory<_i226.GetUserByIdUsecase>(
      () => _i226.GetUserByIdUsecase(gh<_i83.UsersRepository>()));
  gh.lazySingleton<_i227.GetSupportClientsInvoicesUseCase>(() =>
      _i227.GetSupportClientsInvoicesUseCase(
          gh<_i220.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i228.ManageWithdrawalsRepository>(() =>
      _i229.ManageWithdrawalsRepositoryImpl(
          gh<_i45.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i230.AgentsDistributorsRepo>(() =>
      _i231.AgentsDistributorsRepoImpl(
          gh<_i101.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i232.GetProductsSalesReportsUsecase>(() =>
      _i232.GetProductsSalesReportsUsecase(
          gh<_i144.ProductsSalesReportsRepo>()));
  gh.singleton<_i233.CitiesCubit>(
      () => _i233.CitiesCubit(gh<_i118.GetCitiesUseCase>()));
  gh.lazySingleton<_i234.GetNotUsingSystemUsecase>(
      () => _i234.GetNotUsingSystemUsecase(gh<_i36.NotUsingSystemRepo>()));
  gh.factory<_i235.UsersTypeCubit>(
      () => _i235.UsersTypeCubit(gh<_i112.GetUsersUsecase>()));
  gh.factory<_i236.ClientsListRepository>(
      () => _i237.ClientsListRepositoryImpl(gh<_i62.ClientsListDatasource>()));
  gh.factory<_i238.AddParticipateCommentUsecase>(() =>
      _i238.AddParticipateCommentUsecase(
          gh<_i132.ParticipateListRepository>()));
  gh.factory<_i239.AddParticipateUserUsecase>(() =>
      _i239.AddParticipateUserUsecase(gh<_i132.ParticipateListRepository>()));
  gh.factory<_i240.EditParticipateUserUsecase>(() =>
      _i240.EditParticipateUserUsecase(gh<_i132.ParticipateListRepository>()));
  gh.factory<_i241.ParticipateClientListUsecase>(() =>
      _i241.ParticipateClientListUsecase(
          gh<_i132.ParticipateListRepository>()));
  gh.factory<_i242.ParticipateCommentListUsecase>(() =>
      _i242.ParticipateCommentListUsecase(
          gh<_i132.ParticipateListRepository>()));
  gh.factory<_i243.GetParticipateInvoiceByIdUsecase>(() =>
      _i243.GetParticipateInvoiceByIdUsecase(
          gh<_i132.ParticipateListRepository>()));
  gh.factory<_i244.ParticipateInvoiceListUsecase>(() =>
      _i244.ParticipateInvoiceListUsecase(
          gh<_i132.ParticipateListRepository>()));
  gh.factory<_i245.ParticipateListUsecase>(() =>
      _i245.ParticipateListUsecase(gh<_i132.ParticipateListRepository>()));
  gh.lazySingleton<_i246.ChangeParticipateStatusUsecase>(() =>
      _i246.ChangeParticipateStatusUsecase(
          gh<_i132.ParticipateListRepository>()));
  gh.factory<_i247.PendingInvoicesCubit>(
      () => _i247.PendingInvoicesCubit(gh<_i113.GetPendingInvoicesUsecase>()));
  gh.factory<_i248.EvaluationLevelReportCubit>(() =>
      _i248.EvaluationLevelReportCubit(
          gh<_i98.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i249.GetEmployeesSalesReportsUsecase>(() =>
      _i249.GetEmployeesSalesReportsUsecase(
          gh<_i128.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i250.GetGreetingCommunicationUseCase>(() =>
      _i250.GetGreetingCommunicationUseCase(
          gh<_i155.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i251.ClientsTransferApprovalsRepo>(() =>
      _i252.ClientsTransferApprovalsRepoImpl(
          gh<_i58.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i253.GetDeletedInvoicesUsecase>(
      () => _i253.GetDeletedInvoicesUsecase(gh<_i177.DeletedInvoicesRepo>()));
  gh.lazySingleton<_i254.GetClientsStatusReportsUsecase>(() =>
      _i254.GetClientsStatusReportsUsecase(
          gh<_i148.ClientsStatusReportsRepo>()));
  gh.factory<_i255.ActionLinkUsecase>(
      () => _i255.ActionLinkUsecase(gh<_i216.ImportantLinksRepo>()));
  gh.factory<_i256.GetImportantLinksUsecase>(
      () => _i256.GetImportantLinksUsecase(gh<_i216.ImportantLinksRepo>()));
  gh.lazySingleton<_i257.GetPreviousRatingsUsecase>(
      () => _i257.GetPreviousRatingsUsecase(gh<_i104.PreviousRatingsRepo>()));
  gh.lazySingleton<_i258.WaitingAgentsRepo>(
      () => _i259.WaitingAgentsRepoImpl(gh<_i140.WaitingAgentsDataSource>()));
  gh.factory<_i260.AddClientUserUsecase>(
      () => _i260.AddClientUserUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i261.ApproveRejectClientUsecase>(() =>
      _i261.ApproveRejectClientUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i262.ChangeClientCommunicationUseCase>(() =>
      _i262.ChangeClientCommunicationUseCase(
          gh<_i236.ClientsListRepository>()));
  gh.factory<_i263.ChangeTypeClientUsecase>(
      () => _i263.ChangeTypeClientUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i264.EditClientUserUsecase>(
      () => _i264.EditClientUserUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i265.GetClientsListByRegionUseCase>(() =>
      _i265.GetClientsListByRegionUseCase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i266.GetClientsListByUserUseCase>(() =>
      _i266.GetClientsListByUserUseCase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i267.GetClientsWithFilterUserUsecase>(() =>
      _i267.GetClientsWithFilterUserUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i268.GetClientMarketingReportUsecase>(() =>
      _i268.GetClientMarketingReportUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i269.GetRecommendedClientsUsecase>(() =>
      _i269.GetRecommendedClientsUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i270.GetSimilarClientsUsecase>(
      () => _i270.GetSimilarClientsUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i271.ReceiveClientUserUsecase>(
      () => _i271.ReceiveClientUserUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i272.StoreClientCommunicationUseCase>(() =>
      _i272.StoreClientCommunicationUseCase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i273.TransferClientUserUsecase>(
      () => _i273.TransferClientUserUsecase(gh<_i236.ClientsListRepository>()));
  gh.lazySingleton<_i274.GetHighSimilarClientsUsecase>(() =>
      _i274.GetHighSimilarClientsUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i275.EmployeesSalesReportsCubit>(() =>
      _i275.EmployeesSalesReportsCubit(
          gh<_i249.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i276.ChangeStateAgentUseCase>(
      () => _i276.ChangeStateAgentUseCase(gh<_i230.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i277.GetAgentsAndDistributorsUseCase>(() =>
      _i277.GetAgentsAndDistributorsUseCase(
          gh<_i230.AgentsDistributorsRepo>()));
  gh.factory<_i278.ClientsAcceptCubit>(
      () => _i278.ClientsAcceptCubit(gh<_i189.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i279.CancelWithdrawalUsecase>(() =>
      _i279.CancelWithdrawalUsecase(gh<_i228.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i280.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i280.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i228.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i281.GetWithdrawalsInvoicesUsecase>(() =>
      _i281.GetWithdrawalsInvoicesUsecase(
          gh<_i228.ManageWithdrawalsRepository>()));
  gh.factory<_i282.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i282.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i228.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i283.ExceededClientsUseCase>(
      () => _i283.ExceededClientsUseCase(gh<_i93.ExceededClientsRepo>()));
  gh.lazySingleton<_i284.TransferExceededClientsUseCase>(() =>
      _i284.TransferExceededClientsUseCase(gh<_i93.ExceededClientsRepo>()));
  gh.factory<_i285.ParticipateListBloc>(() => _i285.ParticipateListBloc(
        gh<_i245.ParticipateListUsecase>(),
        gh<_i239.AddParticipateUserUsecase>(),
        gh<_i240.EditParticipateUserUsecase>(),
        gh<_i241.ParticipateClientListUsecase>(),
        gh<_i244.ParticipateInvoiceListUsecase>(),
        gh<_i243.GetParticipateInvoiceByIdUsecase>(),
        gh<_i242.ParticipateCommentListUsecase>(),
        gh<_i238.AddParticipateCommentUsecase>(),
        gh<_i246.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i286.LoginLocalDataSource>(() =>
      _i286.LoginLocalDataSourceImpl(
          gh<_i159.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i287.EditAdvancedConfigsUsecase>(() =>
      _i287.EditAdvancedConfigsUsecase(gh<_i130.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i288.GetAdvancedConfigsUsecase>(() =>
      _i288.GetAdvancedConfigsUsecase(gh<_i130.AdvancedConfigsRepository>()));
  gh.factory<_i289.ClientsInstallReportsCubit>(() =>
      _i289.ClientsInstallReportsCubit(
          gh<_i103.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i290.DatesTableRepo>(
      () => _i291.DatesTableRepoImpl(gh<_i150.DatesTableDataSource>()));
  gh.factory<_i292.GetVersionUseCase>(
      () => _i292.GetVersionUseCase(gh<_i170.AppRepository>()));
  gh.factory<_i293.AddTicketCubit>(
      () => _i293.AddTicketCubit(gh<_i119.AddTicketUseCase>()));
  gh.lazySingleton<_i294.LatestClientsUpdatesRepository>(() =>
      _i295.LatestClientsUpdatesRepositoryImpl(
          gh<_i134.LatestClientsUpdatesDatasource>()));
  gh.factory<_i296.TaskRepository>(
      () => _i297.TaskRepositoryImpl(gh<_i102.TaskDatasource>()));
  gh.lazySingleton<_i298.EditGeneralConfigsUsecase>(() =>
      _i298.EditGeneralConfigsUsecase(gh<_i190.GeneralConfigsRepository>()));
  gh.lazySingleton<_i299.GetGeneralConfigsUsecase>(() =>
      _i299.GetGeneralConfigsUsecase(gh<_i190.GeneralConfigsRepository>()));
  gh.factory<_i300.PeriodicCommunicationReportsCubit>(() =>
      _i300.PeriodicCommunicationReportsCubit(
          gh<_i195.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i301.InstallQualityCubit>(
      () => _i301.InstallQualityCubit(gh<_i200.GetInstallUseCase>()));
  gh.factory<_i302.ImportantLinksCubit>(() => _i302.ImportantLinksCubit(
        gh<_i256.GetImportantLinksUsecase>(),
        gh<_i255.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i303.AddAgentUseCase>(
      () => _i303.AddAgentUseCase(gh<_i174.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i304.UpdateAgentUseCase>(() =>
      _i304.UpdateAgentUseCase(gh<_i174.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i305.GetDelayInstallReportsUseCase>(() =>
      _i305.GetDelayInstallReportsUseCase(gh<_i168.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i306.CrudAgentSupportFilesUsecase>(() =>
      _i306.CrudAgentSupportFilesUsecase(
          gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i307.GetClientsTransferApprovalsUsecase>(() =>
      _i307.GetClientsTransferApprovalsUsecase(
          gh<_i251.ClientsTransferApprovalsRepo>()));
  gh.factory<_i308.ClientsStatusReportsCubit>(() =>
      _i308.ClientsStatusReportsCubit(
          gh<_i254.GetClientsStatusReportsUsecase>()));
  gh.factory<_i309.SupportTabCubit>(() => _i309.SupportTabCubit(
        gh<_i206.GetInvoiceByClientUsecase>(),
        gh<_i204.AddDateInstallUsecase>(),
        gh<_i209.SetDateDoneUsecase>(),
        gh<_i210.SetReadyInstallUsecase>(),
        gh<_i208.ReturnInvoiceApproveUsecase>(),
        gh<_i207.ReceiveDeviceUsecase>(),
        gh<_i205.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i310.ClientsDebtsReportsCubit>(() =>
      _i310.ClientsDebtsReportsCubit(
          gh<_i154.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i311.DeletedInvoicesCubit>(
      () => _i311.DeletedInvoicesCubit(gh<_i253.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i312.AddAgentDateUseCase>(() =>
      _i312.AddAgentDateUseCase(gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i313.GetManageWithdrawnInvoicesUsecase>(() =>
      _i313.GetManageWithdrawnInvoicesUsecase(
          gh<_i161.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i314.NotificationsCubit>(() => _i314.NotificationsCubit(
        gh<_i192.GetNotificationsUsecase>(),
        gh<_i194.MarkNotificationsAsReadUsecase>(),
        gh<_i193.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i315.WithdrawnInvoicesRepo>(() =>
      _i316.WithdrawnInvoicesRepoImpl(gh<_i136.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i317.RegionsRepository>(
      () => _i318.RegionsRepositoryImpl(gh<_i152.RegionsDatasource>()));
  gh.factory<_i319.ClientLogsTabCubit>(
      () => _i319.ClientLogsTabCubit(gh<_i219.GetClientLogsUsecase>()));
  gh.factory<_i320.RegionsSalesReportsCubit>(() =>
      _i320.RegionsSalesReportsCubit(
          gh<_i180.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i321.AgentsDistributorsActionsCubit>(
      () => _i321.AgentsDistributorsActionsCubit(
            gh<_i118.GetCitiesUseCase>(),
            gh<_i303.AddAgentUseCase>(),
            gh<_i304.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i322.FetchPaginatedClientsUsecase>(() =>
      _i322.FetchPaginatedClientsUsecase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i323.FetchLinkClientsUseCase>(
      () => _i323.FetchLinkClientsUseCase(gh<_i236.ClientsListRepository>()));
  gh.factory<_i324.LinkSelectedClientsUseCase>(() =>
      _i324.LinkSelectedClientsUseCase(gh<_i236.ClientsListRepository>()));
  gh.lazySingleton<_i325.LoginRepo>(() => _i326.LoginRepoImpl(
        gh<_i127.LoginRemoteDataSource>(),
        gh<_i286.LoginLocalDataSource>(),
      ));
  gh.factory<_i327.SpecialClientsBloc>(
      () => _i327.SpecialClientsBloc(gh<_i184.GetSpecialClientsUsecase>()));
  gh.factory<_i328.AddCommentUsecase>(
      () => _i328.AddCommentUsecase(gh<_i197.CompanyRepository>()));
  gh.factory<_i329.GetCommentUsecase>(
      () => _i329.GetCommentUsecase(gh<_i197.CompanyRepository>()));
  gh.factory<_i330.DelayInstallReportsCubit>(() =>
      _i330.DelayInstallReportsCubit(
          gh<_i305.GetDelayInstallReportsUseCase>()));
  gh.factory<_i331.DatesTimelineBloc>(
      () => _i331.DatesTimelineBloc(gh<_i201.GetTimelineByEmployeeUseCase>()));
  gh.factory<_i332.GreetingCommunicationCubit>(() =>
      _i332.GreetingCommunicationCubit(
          gh<_i250.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i333.GetRegionsUseCase>(
      () => _i333.GetRegionsUseCase(gh<_i317.RegionsRepository>()));
  gh.lazySingleton<_i334.GetLatestClientsUseCase>(() =>
      _i334.GetLatestClientsUseCase(
          gh<_i294.LatestClientsUpdatesRepository>()));
  gh.factory<_i335.AdvancedCofigsCubit>(() => _i335.AdvancedCofigsCubit(
        gh<_i288.GetAdvancedConfigsUsecase>(),
        gh<_i287.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i336.SupportClientsInvoicesCubit>(() =>
      _i336.SupportClientsInvoicesCubit(
          gh<_i227.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i337.WrongNumbersCubit>(
      () => _i337.WrongNumbersCubit(gh<_i188.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i338.CacheTokenUsecase>(
      () => _i338.CacheTokenUsecase(gh<_i325.LoginRepo>()));
  gh.lazySingleton<_i339.GetTokenUsecase>(
      () => _i339.GetTokenUsecase(gh<_i325.LoginRepo>()));
  gh.lazySingleton<_i340.LoginUsecase>(
      () => _i340.LoginUsecase(gh<_i325.LoginRepo>()));
  gh.lazySingleton<_i341.ValidateTokenUsecase>(
      () => _i341.ValidateTokenUsecase(gh<_i325.LoginRepo>()));
  gh.lazySingleton<_i342.VerifyOtpUsecase>(
      () => _i342.VerifyOtpUsecase(gh<_i325.LoginRepo>()));
  gh.factory<_i343.ClientsTransferApprovalsCubit>(() =>
      _i343.ClientsTransferApprovalsCubit(
          gh<_i307.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i344.RegionsCubit>(
      () => _i344.RegionsCubit(gh<_i333.GetRegionsUseCase>()));
  gh.factory<_i345.GeneralCofigsCubit>(() => _i345.GeneralCofigsCubit(
        gh<_i299.GetGeneralConfigsUsecase>(),
        gh<_i298.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i346.GetPeriodicCommunicationUseCase>(() =>
      _i346.GetPeriodicCommunicationUseCase(
          gh<_i214.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i347.GetClientsDebtsUsecase>(
      () => _i347.GetClientsDebtsUsecase(gh<_i212.ClientsDebtsRepo>()));
  gh.lazySingleton<_i348.CrudClientSupportFilesUsecase>(() =>
      _i348.CrudClientSupportFilesUsecase(
          repository: gh<_i236.ClientsListRepository>()));
  gh.lazySingleton<_i349.GetClientSupportFilesUsecase>(() =>
      _i349.GetClientSupportFilesUsecase(
          repository: gh<_i236.ClientsListRepository>()));
  gh.factory<_i350.BranchesCubit>(
      () => _i350.BranchesCubit(gh<_i196.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i351.AddAgentCommentUsecase>(() =>
      _i351.AddAgentCommentUsecase(gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i352.DoneTrainingUsecase>(() =>
      _i352.DoneTrainingUsecase(gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i353.GetAgentByIdUsecase>(() =>
      _i353.GetAgentByIdUsecase(gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i354.GetAgentClientListUsecase>(() =>
      _i354.GetAgentClientListUsecase(
          gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i355.GetAgentCommentsListUsecase>(() =>
      _i355.GetAgentCommentsListUsecase(
          gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i356.GetAgentDatesListUsecase>(() =>
      _i356.GetAgentDatesListUsecase(
          gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i357.GetAgentInvoiceListUsecase>(() =>
      _i357.GetAgentInvoiceListUsecase(
          gh<_i202.AgentsDistributorsProfileRepo>()));
  gh.factory<_i358.AddRejectReasonsUsecase>(() =>
      _i358.AddRejectReasonsUsecase(gh<_i228.ManageWithdrawalsRepository>()));
  gh.factory<_i359.EditRejectReasonsUsecase>(() =>
      _i359.EditRejectReasonsUsecase(gh<_i228.ManageWithdrawalsRepository>()));
  gh.factory<_i360.GetRejectReasonsUsecase>(() =>
      _i360.GetRejectReasonsUsecase(gh<_i228.ManageWithdrawalsRepository>()));
  gh.factory<_i361.GetUserSeriesUsecase>(() =>
      _i361.GetUserSeriesUsecase(gh<_i228.ManageWithdrawalsRepository>()));
  gh.factory<_i362.GetWithdrawnDetailsUsecase>(() =>
      _i362.GetWithdrawnDetailsUsecase(
          gh<_i228.ManageWithdrawalsRepository>()));
  gh.factory<_i363.SetApproveSeriesUsecase>(() =>
      _i363.SetApproveSeriesUsecase(gh<_i228.ManageWithdrawalsRepository>()));
  gh.factory<_i364.UpdateSeriesUsecase>(
      () => _i364.UpdateSeriesUsecase(gh<_i228.ManageWithdrawalsRepository>()));
  gh.factory<_i365.NotUsingSystemCubit>(
      () => _i365.NotUsingSystemCubit(gh<_i234.GetNotUsingSystemUsecase>()));
  gh.singleton<_i366.AppManagerCubit>(
      () => _i366.AppManagerCubit(gh<_i292.GetVersionUseCase>()));
  gh.lazySingleton<_i367.GetWaitingAgentsUsecase>(
      () => _i367.GetWaitingAgentsUsecase(gh<_i258.WaitingAgentsRepo>()));
  gh.factory<_i368.InvoicesSectionCubit>(() => _i368.InvoicesSectionCubit(
        gh<_i186.GetInvoicesByPrivilegesUsecase>(),
        gh<_i277.GetAgentsAndDistributorsUseCase>(),
        gh<_i245.ParticipateListUsecase>(),
        gh<_i211.GetAllUsersUseCase>(),
        gh<_i187.GetInvoiceByIdUsecase>(),
        gh<_i185.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i369.ProductsSalesReportsCubit>(() =>
      _i369.ProductsSalesReportsCubit(
          gh<_i232.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i370.GetWithdrawnInvoicesUsecase>(() =>
      _i370.GetWithdrawnInvoicesUsecase(gh<_i315.WithdrawnInvoicesRepo>()));
  gh.factory<_i371.PreviousRatingsCubit>(
      () => _i371.PreviousRatingsCubit(gh<_i257.GetPreviousRatingsUsecase>()));
  gh.factory<_i372.AgentsDistributorsCubit>(() => _i372.AgentsDistributorsCubit(
        gh<_i277.GetAgentsAndDistributorsUseCase>(),
        gh<_i276.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i373.ExceededClientsCubit>(() => _i373.ExceededClientsCubit(
        gh<_i283.ExceededClientsUseCase>(),
        gh<_i284.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i374.ClientsListBloc>(() => _i374.ClientsListBloc(
        gh<_i267.GetClientsWithFilterUserUsecase>(),
        gh<_i269.GetRecommendedClientsUsecase>(),
        gh<_i270.GetSimilarClientsUsecase>(),
        gh<_i260.AddClientUserUsecase>(),
        gh<_i264.EditClientUserUsecase>(),
        gh<_i263.ChangeTypeClientUsecase>(),
        gh<_i262.ChangeClientCommunicationUseCase>(),
        gh<_i272.StoreClientCommunicationUseCase>(),
        gh<_i261.ApproveRejectClientUsecase>(),
        gh<_i348.CrudClientSupportFilesUsecase>(),
        gh<_i349.GetClientSupportFilesUsecase>(),
        gh<_i273.TransferClientUserUsecase>(),
        gh<_i271.ReceiveClientUserUsecase>(),
        gh<_i268.GetClientMarketingReportUsecase>(),
        gh<_i274.GetHighSimilarClientsUsecase>(),
        gh<_i323.FetchLinkClientsUseCase>(),
        gh<_i322.FetchPaginatedClientsUsecase>(),
        gh<_i324.LinkSelectedClientsUseCase>(),
        gh<_i218.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i375.ManageWithdrawalsCubit>(() => _i375.ManageWithdrawalsCubit(
        gh<_i361.GetUserSeriesUsecase>(),
        gh<_i364.UpdateSeriesUsecase>(),
        gh<_i225.GetUsersUsecase>(),
        gh<_i281.GetWithdrawalsInvoicesUsecase>(),
        gh<_i282.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i363.SetApproveSeriesUsecase>(),
        gh<_i362.GetWithdrawnDetailsUsecase>(),
        gh<_i358.AddRejectReasonsUsecase>(),
        gh<_i360.GetRejectReasonsUsecase>(),
        gh<_i359.EditRejectReasonsUsecase>(),
        gh<_i280.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i279.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i376.ManageWithdrawnInvoicesCubit>(() =>
      _i376.ManageWithdrawnInvoicesCubit(
          gh<_i313.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i377.LatestClientsUpdatesCubit>(() =>
      _i377.LatestClientsUpdatesCubit(gh<_i334.GetLatestClientsUseCase>()));
  gh.factory<_i378.AttachmentsRowCubit>(() => _i378.AttachmentsRowCubit(
        gh<_i349.GetClientSupportFilesUsecase>(),
        gh<_i348.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i379.CancelScheduleUsecase>(
      () => _i379.CancelScheduleUsecase(gh<_i290.DatesTableRepo>()));
  gh.lazySingleton<_i380.ChangeDateToDonUsecase>(
      () => _i380.ChangeDateToDonUsecase(gh<_i290.DatesTableRepo>()));
  gh.lazySingleton<_i381.GetCancelReasonsUsecase>(
      () => _i381.GetCancelReasonsUsecase(gh<_i290.DatesTableRepo>()));
  gh.lazySingleton<_i382.GetDateInstallationUsecase>(
      () => _i382.GetDateInstallationUsecase(gh<_i290.DatesTableRepo>()));
  gh.lazySingleton<_i383.GetInvoicesByClientForDateUsecase>(() =>
      _i383.GetInvoicesByClientForDateUsecase(gh<_i290.DatesTableRepo>()));
  gh.lazySingleton<_i384.GetSubscribedClientsUsecase>(
      () => _i384.GetSubscribedClientsUsecase(gh<_i290.DatesTableRepo>()));
  gh.lazySingleton<_i385.RescheduleDateUsecase>(
      () => _i385.RescheduleDateUsecase(gh<_i290.DatesTableRepo>()));
  gh.lazySingleton<_i386.ReturnScheduleVisitToOpenUsecase>(
      () => _i386.ReturnScheduleVisitToOpenUsecase(gh<_i290.DatesTableRepo>()));
  gh.factory<_i387.AddTaskUsecase>(
      () => _i387.AddTaskUsecase(gh<_i296.TaskRepository>()));
  gh.factory<_i388.ChangeStatusTaskUsecase>(
      () => _i388.ChangeStatusTaskUsecase(gh<_i296.TaskRepository>()));
  gh.factory<_i389.GetTasksUsecase>(
      () => _i389.GetTasksUsecase(gh<_i296.TaskRepository>()));
  gh.factory<_i390.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i390.GetUsersByDepartmentAndRegionUsecase(gh<_i296.TaskRepository>()));
  gh.lazySingleton<_i391.TaskCubit>(() => _i391.TaskCubit(
        gh<_i387.AddTaskUsecase>(),
        gh<_i389.GetTasksUsecase>(),
        gh<_i388.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i392.UsersCubit>(() => _i392.UsersCubit(
        gh<_i225.GetUsersUsecase>(),
        gh<_i226.GetUserByIdUsecase>(),
        gh<_i95.ActionUserUsecase>(),
        gh<_i390.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i224.GetManagesForUserUsecase>(),
        gh<_i223.GetLevelsForUserUsecase>(),
        gh<_i222.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i393.CompanyCubit>(() => _i393.CompanyCubit(
        gh<_i329.GetCommentUsecase>(),
        gh<_i328.AddCommentUsecase>(),
      ));
  gh.factory<_i394.ClientsDebtsCubit>(
      () => _i394.ClientsDebtsCubit(gh<_i347.GetClientsDebtsUsecase>()));
  gh.factory<_i395.PeriodicCommunicationCubit>(() =>
      _i395.PeriodicCommunicationCubit(
          gh<_i346.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i396.LoginCubit>(() => _i396.LoginCubit(
        gh<_i340.LoginUsecase>(),
        gh<_i342.VerifyOtpUsecase>(),
        gh<_i338.CacheTokenUsecase>(),
        gh<_i339.GetTokenUsecase>(),
        gh<_i341.ValidateTokenUsecase>(),
      ));
  gh.factory<_i397.AgentsDistributorsProfileBloc>(
      () => _i397.AgentsDistributorsProfileBloc(
            gh<_i353.GetAgentByIdUsecase>(),
            gh<_i354.GetAgentClientListUsecase>(),
            gh<_i357.GetAgentInvoiceListUsecase>(),
            gh<_i243.GetParticipateInvoiceByIdUsecase>(),
            gh<_i355.GetAgentCommentsListUsecase>(),
            gh<_i351.AddAgentCommentUsecase>(),
            gh<_i352.DoneTrainingUsecase>(),
            gh<_i312.AddAgentDateUseCase>(),
            gh<_i356.GetAgentDatesListUsecase>(),
            gh<_i306.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i398.DatesTableCubit>(() => _i398.DatesTableCubit(
        gh<_i382.GetDateInstallationUsecase>(),
        gh<_i385.RescheduleDateUsecase>(),
        gh<_i380.ChangeDateToDonUsecase>(),
        gh<_i379.CancelScheduleUsecase>(),
        gh<_i386.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i384.GetSubscribedClientsUsecase>(),
        gh<_i383.GetInvoicesByClientForDateUsecase>(),
        gh<_i204.AddDateInstallUsecase>(),
        gh<_i381.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i399.WithdrawnInvoicesCubit>(() =>
      _i399.WithdrawnInvoicesCubit(gh<_i370.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i400.WaitingAgentsCubit>(
      () => _i400.WaitingAgentsCubit(gh<_i367.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i401.AppModule {}
