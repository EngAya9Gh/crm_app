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
    as _i172;
import '../../../features/app/domain/repositories/app_repository.dart' as _i171;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i295;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i371;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i289;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i128;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i331;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i330;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i343;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i344;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i345;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i346;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i347;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i401;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i31;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i47;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i46;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i190;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i281;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i28;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i93;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i92;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i115;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i182;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i25;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i37;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i36;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i235;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i370;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i55;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i70;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i69;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i120;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i121;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i122;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i124;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i123;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i125;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i296;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i148;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i126;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i27;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i39;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i38;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i189;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i342;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i11;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i51;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i50;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i99;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i249;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i18;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i157;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i156;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i251;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i337;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i52;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i166;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i165;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i201;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i305;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i41;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i216;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i215;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i351;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i400;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i33;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i44;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i43;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i196;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i303;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i26;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i106;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i105;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i260;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i376;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i61;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i143;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i142;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i185;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i332;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i91;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i98;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i97;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i197;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i355;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i67;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i118;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i117;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i119;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i234;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i73;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i108;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i107;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i220;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i324;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i112;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i184;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i183;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i205;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i206;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i207;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i208;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i209;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i210;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i211;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i314;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i153;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i323;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i322;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i338;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i349;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i66;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i83;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i82;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i113;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i236;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i3;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i68;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i132;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i131;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i290;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i291;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i340;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i86;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i192;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i191;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i301;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i302;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i350;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i17;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i54;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i53;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i110;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i111;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i127;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i14;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i168;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i167;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i174;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i173;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i200;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i57;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i85;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i84;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i96;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i223;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i224;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i225;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i227;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i226;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i397;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i45;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i230;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i229;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i363;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i282;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i364;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i283;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i365;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i366;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i285;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i284;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i367;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i368;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i369;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i380;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i30;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i29;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i193;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i194;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i195;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i319;
import '../../../features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart'
    as _i62;
import '../../../features/sales/clients/clients_contacts/data/repositories/clients_contacts_repo_impl.dart'
    as _i256;
import '../../../features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart'
    as _i255;
import '../../../features/sales/clients/clients_contacts/domain/use_cases/get_all_clients_contacts_usecase.dart'
    as _i304;
import '../../../features/sales/clients/clients_contacts/presentation/manager/clients_contacts_bloc.dart'
    as _i306;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i48;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i214;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i213;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i352;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i399;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i63;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i35;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i238;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i237;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i263;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i264;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_client_communication_usecase.dart'
    as _i265;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i266;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i353;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i267;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i219;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i328;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i327;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i271;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i354;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i268;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i269;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i270;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i277;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i272;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i273;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i329;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i274;
import '../../../features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart'
    as _i275;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i276;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i379;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i58;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i253;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i252;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i312;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i348;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i49;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i88;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i87;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i144;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i177;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i135;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i298;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i297;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i339;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i382;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i13;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i90;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i89;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i114;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i248;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i64;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i199;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i198;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i333;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i334;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i398;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i109;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i179;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i178;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i254;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i316;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i59;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i95;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i94;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i286;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i287;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i378;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i116;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i139;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i138;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i186;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i212;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i188;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i187;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i373;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i136;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i163;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i162;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i318;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i381;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i19;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i102;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i147;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i176;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i204;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i232;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i175;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i203;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i356;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i317;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i308;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i279;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i311;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i357;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i358;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i359;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i360;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i361;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i362;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i280;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i309;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i326;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i402;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i377;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i65;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i218;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i217;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i258;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i259;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i307;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i40;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i134;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i133;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i239;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i240;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i247;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i241;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i242;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i243;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i244;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i245;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i246;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i288;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i76;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i75;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i155;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i315;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i32;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i150;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i149;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i257;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i313;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i42;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i130;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i129;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i250;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i278;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i16;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i146;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i145;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i233;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i374;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i72;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i71;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i181;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i325;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i137;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i321;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i320;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i375;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i404;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i22;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i101;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i100;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i104;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i292;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i151;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i294;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i293;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i384;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i385;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i386;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i387;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i388;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i389;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i390;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i391;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i403;
import '../../../features/support/dates_timeline/data/data_sources/dates_timeline_datasource.dart'
    as _i74;
import '../../../features/support/dates_timeline/data/respositories_impl/dates_timeline_repo_impl.dart'
    as _i159;
import '../../../features/support/dates_timeline/domain/respositories/dates_timline_repo.dart'
    as _i158;
import '../../../features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart'
    as _i202;
import '../../../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart'
    as _i336;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i12;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i80;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i79;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i152;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i180;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i34;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i170;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i169;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i310;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i335;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i10;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i78;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i77;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i81;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i140;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i56;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i222;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i221;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i228;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i341;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i141;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i262;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i261;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i372;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i405;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i103;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i300;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i299;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i392;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i393;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i394;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i395;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i396;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i383;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i160;
import '../cache_services/prefs_consumer.dart' as _i164;
import '../cache_services/secure_storage_consumer.dart' as _i161;
import '../maps/location_services.dart' as _i154;
import 'di_container.dart' as _i406;

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
  gh.factory<_i62.ClientsContactsDatasource>(
      () => _i62.ClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i63.ClientsListDatasource>(
      () => _i63.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i64.CommentCompanyDatasource>(
      () => _i64.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i65.ImportantLinksDatasource>(
      () => _i65.ImportantLinksDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i66.UsersDatasource>(
      () => _i66.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i67.CitiesDatasource>(
      () => _i67.CitiesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i68.AdvancedConfigsDatasource>(
      () => _i68.AdvancedConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i69.TicketsRepo>(
      () => _i70.TicketsRepoImpl(gh<_i55.TicketsDataSource>()));
  gh.lazySingleton<_i71.RegionsSalesReportsRepo>(() =>
      _i72.RegionsSalesReportsRepoImpl(
          gh<_i23.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i73.ClientLogsTabDataSource>(
      () => _i73.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i74.DatesTimelineDatasource>(
      () => _i74.DatesTimelineDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i75.ClientsDebtsReportsRepo>(() =>
      _i76.ClientsDebtsReportsRepoImpl(
          gh<_i24.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i77.SupportClientsAcceptRepository>(() =>
      _i78.SupportClientsAcceptRepositoryImpl(
          gh<_i10.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i79.DelayAfterInstallRepo>(() =>
      _i80.DelayAfterInstallRepoImpl(gh<_i12.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i81.GetSupportClientsAcceptUseCase>(() =>
      _i81.GetSupportClientsAcceptUseCase(
          gh<_i77.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i82.UsersRepository>(
      () => _i83.UsersRepositoryImpl(gh<_i66.UsersDatasource>()));
  gh.lazySingleton<_i84.UsersRepository>(
      () => _i85.UsersRepositoryImpl(gh<_i57.UsersDatasource>()));
  gh.lazySingleton<_i86.GeneralConfigsDatasource>(
      () => _i86.GeneralConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i87.FinancePendingRepo>(
      () => _i88.FinancePendingRepoImpl(gh<_i49.FinancePendingDatasource>()));
  gh.lazySingleton<_i89.PendingInvoicesRepo>(
      () => _i90.PendingInvoicesRepoImpl(gh<_i13.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i91.BranchesDatasource>(
      () => _i91.BranchesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i92.ClientsCareReportsRepo>(() =>
      _i93.ClientsCareReportsRepoImpl(gh<_i28.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i94.ExceededClientsRepo>(
      () => _i95.ExceededClientsRepoImpl(gh<_i59.ExceededClientsDatasource>()));
  gh.factory<_i96.ActionUserUsecase>(
      () => _i96.ActionUserUsecase(gh<_i84.UsersRepository>()));
  gh.lazySingleton<_i97.BranchesRepository>(
      () => _i98.BranchesRepositoryImpl(gh<_i91.BranchesDatasource>()));
  gh.lazySingleton<_i99.GetEvaluationLevelReportUsecase>(() =>
      _i99.GetEvaluationLevelReportUsecase(
          gh<_i50.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i100.ClientsInstallReportsRepo>(() =>
      _i101.ClientsInstallReportsRepoImpl(
          gh<_i22.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i102.AgentsDistributorsDataSource>(
      () => _i102.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i103.TaskDatasource>(
      () => _i103.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i104.GetClientsInstallReportsUsecase>(() =>
      _i104.GetClientsInstallReportsUsecase(
          gh<_i100.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i105.PreviousRatingsRepo>(() =>
      _i106.PreviousRatingsRepoImpl(gh<_i26.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i107.ClientLogsTabRepo>(
      () => _i108.ClientLogsTabRepoImpl(gh<_i73.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i109.DeletedInvoicesDatasource>(
      () => _i109.DeletedInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i110.AddLevelUsecase>(
      () => _i110.AddLevelUsecase(gh<_i53.LevelsRepo>()));
  gh.lazySingleton<_i111.GetLevelsUsecase>(
      () => _i111.GetLevelsUsecase(gh<_i53.LevelsRepo>()));
  gh.lazySingleton<_i112.SupportTabDataSource>(
      () => _i112.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i113.GetUsersUsecase>(
      () => _i113.GetUsersUsecase(gh<_i82.UsersRepository>()));
  gh.lazySingleton<_i114.GetPendingInvoicesUsecase>(
      () => _i114.GetPendingInvoicesUsecase(gh<_i89.PendingInvoicesRepo>()));
  gh.lazySingleton<_i115.GetClientsCareReportsUsecase>(() =>
      _i115.GetClientsCareReportsUsecase(gh<_i92.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i116.InvoicesTabDataSource>(
      () => _i116.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i117.CitiesRepository>(
      () => _i118.CitiesRepositoryImpl(gh<_i67.CitiesDatasource>()));
  gh.lazySingleton<_i119.GetCitiesUseCase>(
      () => _i119.GetCitiesUseCase(gh<_i117.CitiesRepository>()));
  gh.lazySingleton<_i120.AddTicketUseCase>(
      () => _i120.AddTicketUseCase(gh<_i69.TicketsRepo>()));
  gh.lazySingleton<_i121.EditTicketTypeUseCase>(
      () => _i121.EditTicketTypeUseCase(gh<_i69.TicketsRepo>()));
  gh.lazySingleton<_i122.GetClientTicketsUseCase>(
      () => _i122.GetClientTicketsUseCase(gh<_i69.TicketsRepo>()));
  gh.lazySingleton<_i123.GetTicketsUseCase>(
      () => _i123.GetTicketsUseCase(gh<_i69.TicketsRepo>()));
  gh.lazySingleton<_i124.GetTicketByIdUseCase>(
      () => _i124.GetTicketByIdUseCase(gh<_i69.TicketsRepo>()));
  gh.lazySingleton<_i125.TransferTicketUseCase>(
      () => _i125.TransferTicketUseCase(gh<_i69.TicketsRepo>()));
  gh.factory<_i126.TicketsCubit>(() => _i126.TicketsCubit(
        gh<_i123.GetTicketsUseCase>(),
        gh<_i124.GetTicketByIdUseCase>(),
        gh<_i122.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i127.LevelsCubit>(() => _i127.LevelsCubit(
        gh<_i111.GetLevelsUsecase>(),
        gh<_i110.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i128.LoginRemoteDataSource>(
      () => _i128.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i129.EmployeesSalesReportsRepo>(() =>
      _i130.EmployeesSalesReportsRepoImpl(
          gh<_i42.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i131.AdvancedConfigsRepository>(() =>
      _i132.AdvancedConfigsRepositoryImpl(
          gh<_i68.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i133.ParticipateListRepository>(() =>
      _i134.ParticipateListRepositoryImpl(
          gh<_i40.ParticipatesListDatasource>()));
  gh.lazySingleton<_i135.LatestClientsUpdatesDatasource>(
      () => _i135.LatestClientsUpdatesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i136.ManageWithdrawnInvoicesDataSource>(
      () => _i136.ManageWithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i137.WithdrawnInvoicesDataSource>(
      () => _i137.WithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i138.InvoicesSectionRepo>(
      () => _i139.InvoicesTabRepoImpl(gh<_i116.InvoicesTabDataSource>()));
  gh.factory<_i140.SupportClientsAcceptCubit>(() =>
      _i140.SupportClientsAcceptCubit(
          gh<_i81.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i141.WaitingAgentsDataSource>(
      () => _i141.WaitingAgentsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i142.SpecialClientsRepository>(() =>
      _i143.SpecialClientsRepositoryImpl(gh<_i61.SpecialClientsDatasource>()));
  gh.lazySingleton<_i144.GetFinancePendingInvoicesUsecase>(() =>
      _i144.GetFinancePendingInvoicesUsecase(gh<_i87.FinancePendingRepo>()));
  gh.lazySingleton<_i145.ProductsSalesReportsRepo>(() =>
      _i146.ProductsSalesReportsRepoImpl(
          gh<_i16.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i147.AgentsDistributorsProfileDataSource>(() =>
      _i147.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i148.EditTicketCubit>(() => _i148.EditTicketCubit(
        gh<_i121.EditTicketTypeUseCase>(),
        gh<_i125.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i149.ClientsStatusReportsRepo>(() =>
      _i150.ClientsStatusReportsRepoImpl(
          gh<_i32.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i151.DatesTableDataSource>(
      () => _i151.DatesTableDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i152.GetDelayAfterInstallUseCase>(() =>
      _i152.GetDelayAfterInstallUseCase(gh<_i79.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i153.RegionsDatasource>(
      () => _i153.RegionsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i154.LocationServices>(
      () => _i154.LocationServices(gh<_i7.Location>()));
  gh.lazySingleton<_i155.GetClientsDebtsReportsUsecase>(() =>
      _i155.GetClientsDebtsReportsUsecase(gh<_i75.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i156.GreetingCommunicationRepo>(() =>
      _i157.GreetingCommunicationRepoImpl(
          gh<_i18.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i158.DatesTimeLinesRepo>(
      () => _i159.DatesTimelineRepoImpl(gh<_i74.DatesTimelineDatasource>()));
  gh.singleton<_i160.CacheServices>(
    () => _i161.SecureStorageConsumer(gh<_i21.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i162.ManageWithdrawnInvoicesRepo>(() =>
      _i163.ManageWithdrawnInvoicesRepoImpl(
          gh<_i136.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i160.CacheServices>(() async =>
      _i164.PrefsConsumer(await gh.getAsync<_i20.SharedPreferences>()));
  gh.lazySingleton<_i165.InstallQualityRepo>(
      () => _i166.InstallQualityRepoImpl(gh<_i52.InstallQualityDatasource>()));
  gh.lazySingleton<_i167.PrivilegesRepo>(
      () => _i168.PrivilegesRepoImpl(gh<_i14.PrivilegesDatasource>()));
  gh.lazySingleton<_i169.DelayInstallReportsRepo>(() =>
      _i170.DelayInstallReportsRepoImpl(
          gh<_i34.DelayInstallReportsDatasource>()));
  gh.factory<_i171.AppRepository>(
      () => _i172.AppRepositoryImpl(gh<_i60.AppDatasource>()));
  gh.factory<_i173.UpdatePrivilegesUsecase>(
      () => _i173.UpdatePrivilegesUsecase(gh<_i167.PrivilegesRepo>()));
  gh.lazySingleton<_i174.GetPrivilegesUsecase>(
      () => _i174.GetPrivilegesUsecase(gh<_i167.PrivilegesRepo>()));
  gh.lazySingleton<_i175.AgentsDistributorsActionsRepo>(() =>
      _i176.AgentsDistributorsActionsRepoImpl(
          gh<_i19.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i177.FinancePendingCubit>(() =>
      _i177.FinancePendingCubit(gh<_i144.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i178.DeletedInvoicesRepo>(() =>
      _i179.DeletedInvoicesRepoImpl(gh<_i109.DeletedInvoicesDatasource>()));
  gh.factory<_i180.DelayAfterInstallCubit>(() =>
      _i180.DelayAfterInstallCubit(gh<_i152.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i181.GetRegionsSalesReportsUsecase>(() =>
      _i181.GetRegionsSalesReportsUsecase(gh<_i71.RegionsSalesReportsRepo>()));
  gh.factory<_i182.ClientsCareReportsCubit>(() =>
      _i182.ClientsCareReportsCubit(gh<_i115.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i183.SupportTabRepo>(
      () => _i184.SupportTabRepoImpl(gh<_i112.SupportTabDataSource>()));
  gh.factory<_i185.GetSpecialClientsUsecase>(() =>
      _i185.GetSpecialClientsUsecase(gh<_i142.SpecialClientsRepository>()));
  gh.lazySingleton<_i186.ExportInvoicesToExcelUsecase>(() =>
      _i186.ExportInvoicesToExcelUsecase(gh<_i138.InvoicesSectionRepo>()));
  gh.lazySingleton<_i187.GetInvoicesByPrivilegesUsecase>(() =>
      _i187.GetInvoicesByPrivilegesUsecase(gh<_i138.InvoicesSectionRepo>()));
  gh.lazySingleton<_i188.GetInvoiceByIdUsecase>(
      () => _i188.GetInvoiceByIdUsecase(gh<_i138.InvoicesSectionRepo>()));
  gh.lazySingleton<_i189.GetWrongNumbersUsecase>(
      () => _i189.GetWrongNumbersUsecase(gh<_i38.WrongNumbersRepo>()));
  gh.lazySingleton<_i190.GetClientsAcceptUseCase>(
      () => _i190.GetClientsAcceptUseCase(gh<_i46.ClientsAcceptRepository>()));
  gh.lazySingleton<_i191.GeneralConfigsRepository>(() =>
      _i192.GeneralConfigsRepositoryImpl(gh<_i86.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i193.GetNotificationsUsecase>(
      () => _i193.GetNotificationsUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i194.GetUnreadNotificationsCountUsecase>(() =>
      _i194.GetUnreadNotificationsCountUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i195.MarkNotificationsAsReadUsecase>(
      () => _i195.MarkNotificationsAsReadUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i196.GetPeriodicCommunicationReportsUsecase>(() =>
      _i196.GetPeriodicCommunicationReportsUsecase(
          gh<_i43.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i197.GetBranchesByIdCountryUseCase>(
      () => _i197.GetBranchesByIdCountryUseCase(gh<_i97.BranchesRepository>()));
  gh.factory<_i198.CompanyRepository>(
      () => _i199.CompanyRepositoryImpl(gh<_i64.CommentCompanyDatasource>()));
  gh.singleton<_i200.PrivilegesCubit>(() => _i200.PrivilegesCubit(
        gh<_i174.GetPrivilegesUsecase>(),
        gh<_i173.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i201.GetInstallUseCase>(
      () => _i201.GetInstallUseCase(gh<_i165.InstallQualityRepo>()));
  gh.lazySingleton<_i202.GetTimelineByEmployeeUseCase>(
      () => _i202.GetTimelineByEmployeeUseCase(gh<_i158.DatesTimeLinesRepo>()));
  gh.lazySingleton<_i203.AgentsDistributorsProfileRepo>(() =>
      _i204.AgentsDistributorsProfileRepoImpl(
          gh<_i147.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i205.AddDateInstallUsecase>(
      () => _i205.AddDateInstallUsecase(gh<_i183.SupportTabRepo>()));
  gh.lazySingleton<_i206.CancelDateInstallUsecase>(
      () => _i206.CancelDateInstallUsecase(gh<_i183.SupportTabRepo>()));
  gh.lazySingleton<_i207.GetInvoiceByClientUsecase>(
      () => _i207.GetInvoiceByClientUsecase(gh<_i183.SupportTabRepo>()));
  gh.lazySingleton<_i208.ReceiveDeviceUsecase>(
      () => _i208.ReceiveDeviceUsecase(gh<_i183.SupportTabRepo>()));
  gh.lazySingleton<_i209.ReturnInvoiceApproveUsecase>(
      () => _i209.ReturnInvoiceApproveUsecase(gh<_i183.SupportTabRepo>()));
  gh.lazySingleton<_i210.SetDateDoneUsecase>(
      () => _i210.SetDateDoneUsecase(gh<_i183.SupportTabRepo>()));
  gh.lazySingleton<_i211.SetReadyInstallUsecase>(
      () => _i211.SetReadyInstallUsecase(gh<_i183.SupportTabRepo>()));
  gh.lazySingleton<_i212.GetAllUsersUseCase>(
      () => _i212.GetAllUsersUseCase(gh<_i138.InvoicesSectionRepo>()));
  gh.lazySingleton<_i213.ClientsDebtsRepo>(
      () => _i214.ClientsDebtsRepoImpl(gh<_i48.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i215.PeriodicCommunicationRepo>(() =>
      _i216.PeriodicCommunicationRepoImpl(
          gh<_i41.PeriodicCommunicationDatasource>()));
  gh.factory<_i217.ImportantLinksRepo>(
      () => _i218.ImportantLinksRepoImpl(gh<_i65.ImportantLinksDatasource>()));
  gh.factory<_i219.ExportClientsToExcelUseCase>(() =>
      _i219.ExportClientsToExcelUseCase(gh<_i63.ClientsListDatasource>()));
  gh.lazySingleton<_i220.GetClientLogsUsecase>(
      () => _i220.GetClientLogsUsecase(gh<_i107.ClientLogsTabRepo>()));
  gh.lazySingleton<_i221.SupportClientsInvoicesRepo>(() =>
      _i222.SupportClientsInvoicesRepoImpl(
          gh<_i56.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i223.GetBranchesForUserUsecase>(
      () => _i223.GetBranchesForUserUsecase(gh<_i84.UsersRepository>()));
  gh.lazySingleton<_i224.GetLevelsForUserUsecase>(
      () => _i224.GetLevelsForUserUsecase(gh<_i84.UsersRepository>()));
  gh.lazySingleton<_i225.GetManagesForUserUsecase>(
      () => _i225.GetManagesForUserUsecase(gh<_i84.UsersRepository>()));
  gh.factory<_i226.GetUsersUsecase>(
      () => _i226.GetUsersUsecase(gh<_i84.UsersRepository>()));
  gh.factory<_i227.GetUserByIdUsecase>(
      () => _i227.GetUserByIdUsecase(gh<_i84.UsersRepository>()));
  gh.lazySingleton<_i228.GetSupportClientsInvoicesUseCase>(() =>
      _i228.GetSupportClientsInvoicesUseCase(
          gh<_i221.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i229.ManageWithdrawalsRepository>(() =>
      _i230.ManageWithdrawalsRepositoryImpl(
          gh<_i45.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i231.AgentsDistributorsRepo>(() =>
      _i232.AgentsDistributorsRepoImpl(
          gh<_i102.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i233.GetProductsSalesReportsUsecase>(() =>
      _i233.GetProductsSalesReportsUsecase(
          gh<_i145.ProductsSalesReportsRepo>()));
  gh.singleton<_i234.CitiesCubit>(
      () => _i234.CitiesCubit(gh<_i119.GetCitiesUseCase>()));
  gh.lazySingleton<_i235.GetNotUsingSystemUsecase>(
      () => _i235.GetNotUsingSystemUsecase(gh<_i36.NotUsingSystemRepo>()));
  gh.factory<_i236.UsersTypeCubit>(
      () => _i236.UsersTypeCubit(gh<_i113.GetUsersUsecase>()));
  gh.factory<_i237.ClientsListRepository>(
      () => _i238.ClientsListRepositoryImpl(gh<_i63.ClientsListDatasource>()));
  gh.factory<_i239.AddParticipateCommentUsecase>(() =>
      _i239.AddParticipateCommentUsecase(
          gh<_i133.ParticipateListRepository>()));
  gh.factory<_i240.AddParticipateUserUsecase>(() =>
      _i240.AddParticipateUserUsecase(gh<_i133.ParticipateListRepository>()));
  gh.factory<_i241.EditParticipateUserUsecase>(() =>
      _i241.EditParticipateUserUsecase(gh<_i133.ParticipateListRepository>()));
  gh.factory<_i242.ParticipateClientListUsecase>(() =>
      _i242.ParticipateClientListUsecase(
          gh<_i133.ParticipateListRepository>()));
  gh.factory<_i243.ParticipateCommentListUsecase>(() =>
      _i243.ParticipateCommentListUsecase(
          gh<_i133.ParticipateListRepository>()));
  gh.factory<_i244.GetParticipateInvoiceByIdUsecase>(() =>
      _i244.GetParticipateInvoiceByIdUsecase(
          gh<_i133.ParticipateListRepository>()));
  gh.factory<_i245.ParticipateInvoiceListUsecase>(() =>
      _i245.ParticipateInvoiceListUsecase(
          gh<_i133.ParticipateListRepository>()));
  gh.factory<_i246.ParticipateListUsecase>(() =>
      _i246.ParticipateListUsecase(gh<_i133.ParticipateListRepository>()));
  gh.lazySingleton<_i247.ChangeParticipateStatusUsecase>(() =>
      _i247.ChangeParticipateStatusUsecase(
          gh<_i133.ParticipateListRepository>()));
  gh.factory<_i248.PendingInvoicesCubit>(
      () => _i248.PendingInvoicesCubit(gh<_i114.GetPendingInvoicesUsecase>()));
  gh.factory<_i249.EvaluationLevelReportCubit>(() =>
      _i249.EvaluationLevelReportCubit(
          gh<_i99.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i250.GetEmployeesSalesReportsUsecase>(() =>
      _i250.GetEmployeesSalesReportsUsecase(
          gh<_i129.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i251.GetGreetingCommunicationUseCase>(() =>
      _i251.GetGreetingCommunicationUseCase(
          gh<_i156.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i252.ClientsTransferApprovalsRepo>(() =>
      _i253.ClientsTransferApprovalsRepoImpl(
          gh<_i58.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i254.GetDeletedInvoicesUsecase>(
      () => _i254.GetDeletedInvoicesUsecase(gh<_i178.DeletedInvoicesRepo>()));
  gh.factory<_i255.ClientsContactsRepository>(() =>
      _i256.ClientsListRepositoryImpl(gh<_i62.ClientsContactsDatasource>()));
  gh.lazySingleton<_i257.GetClientsStatusReportsUsecase>(() =>
      _i257.GetClientsStatusReportsUsecase(
          gh<_i149.ClientsStatusReportsRepo>()));
  gh.factory<_i258.ActionLinkUsecase>(
      () => _i258.ActionLinkUsecase(gh<_i217.ImportantLinksRepo>()));
  gh.factory<_i259.GetImportantLinksUsecase>(
      () => _i259.GetImportantLinksUsecase(gh<_i217.ImportantLinksRepo>()));
  gh.lazySingleton<_i260.GetPreviousRatingsUsecase>(
      () => _i260.GetPreviousRatingsUsecase(gh<_i105.PreviousRatingsRepo>()));
  gh.lazySingleton<_i261.WaitingAgentsRepo>(
      () => _i262.WaitingAgentsRepoImpl(gh<_i141.WaitingAgentsDataSource>()));
  gh.factory<_i263.AddClientUserUsecase>(
      () => _i263.AddClientUserUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i264.ApproveRejectClientUsecase>(() =>
      _i264.ApproveRejectClientUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i265.ChangeClientCommunicationUseCase>(() =>
      _i265.ChangeClientCommunicationUseCase(
          gh<_i237.ClientsListRepository>()));
  gh.factory<_i266.ChangeTypeClientUsecase>(
      () => _i266.ChangeTypeClientUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i267.EditClientUserUsecase>(
      () => _i267.EditClientUserUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i268.GetClientsListByRegionUseCase>(() =>
      _i268.GetClientsListByRegionUseCase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i269.GetClientsListByUserUseCase>(() =>
      _i269.GetClientsListByUserUseCase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i270.GetClientsWithFilterUserUsecase>(() =>
      _i270.GetClientsWithFilterUserUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i271.GetClientMarketingReportUsecase>(() =>
      _i271.GetClientMarketingReportUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i272.GetRecommendedClientsUsecase>(() =>
      _i272.GetRecommendedClientsUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i273.GetSimilarClientsUsecase>(
      () => _i273.GetSimilarClientsUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i274.ReceiveClientUserUsecase>(
      () => _i274.ReceiveClientUserUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i275.StoreClientCommunicationUseCase>(() =>
      _i275.StoreClientCommunicationUseCase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i276.TransferClientUserUsecase>(
      () => _i276.TransferClientUserUsecase(gh<_i237.ClientsListRepository>()));
  gh.lazySingleton<_i277.GetHighSimilarClientsUsecase>(() =>
      _i277.GetHighSimilarClientsUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i278.EmployeesSalesReportsCubit>(() =>
      _i278.EmployeesSalesReportsCubit(
          gh<_i250.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i279.ChangeStateAgentUseCase>(
      () => _i279.ChangeStateAgentUseCase(gh<_i231.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i280.GetAgentsAndDistributorsUseCase>(() =>
      _i280.GetAgentsAndDistributorsUseCase(
          gh<_i231.AgentsDistributorsRepo>()));
  gh.factory<_i281.ClientsAcceptCubit>(
      () => _i281.ClientsAcceptCubit(gh<_i190.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i282.CancelWithdrawalUsecase>(() =>
      _i282.CancelWithdrawalUsecase(gh<_i229.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i283.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i283.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i229.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i284.GetWithdrawalsInvoicesUsecase>(() =>
      _i284.GetWithdrawalsInvoicesUsecase(
          gh<_i229.ManageWithdrawalsRepository>()));
  gh.factory<_i285.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i285.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i229.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i286.ExceededClientsUseCase>(
      () => _i286.ExceededClientsUseCase(gh<_i94.ExceededClientsRepo>()));
  gh.lazySingleton<_i287.TransferExceededClientsUseCase>(() =>
      _i287.TransferExceededClientsUseCase(gh<_i94.ExceededClientsRepo>()));
  gh.factory<_i288.ParticipateListBloc>(() => _i288.ParticipateListBloc(
        gh<_i246.ParticipateListUsecase>(),
        gh<_i240.AddParticipateUserUsecase>(),
        gh<_i241.EditParticipateUserUsecase>(),
        gh<_i242.ParticipateClientListUsecase>(),
        gh<_i245.ParticipateInvoiceListUsecase>(),
        gh<_i244.GetParticipateInvoiceByIdUsecase>(),
        gh<_i243.ParticipateCommentListUsecase>(),
        gh<_i239.AddParticipateCommentUsecase>(),
        gh<_i247.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i289.LoginLocalDataSource>(() =>
      _i289.LoginLocalDataSourceImpl(
          gh<_i160.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i290.EditAdvancedConfigsUsecase>(() =>
      _i290.EditAdvancedConfigsUsecase(gh<_i131.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i291.GetAdvancedConfigsUsecase>(() =>
      _i291.GetAdvancedConfigsUsecase(gh<_i131.AdvancedConfigsRepository>()));
  gh.factory<_i292.ClientsInstallReportsCubit>(() =>
      _i292.ClientsInstallReportsCubit(
          gh<_i104.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i293.DatesTableRepo>(
      () => _i294.DatesTableRepoImpl(gh<_i151.DatesTableDataSource>()));
  gh.factory<_i295.GetVersionUseCase>(
      () => _i295.GetVersionUseCase(gh<_i171.AppRepository>()));
  gh.factory<_i296.AddTicketCubit>(
      () => _i296.AddTicketCubit(gh<_i120.AddTicketUseCase>()));
  gh.lazySingleton<_i297.LatestClientsUpdatesRepository>(() =>
      _i298.LatestClientsUpdatesRepositoryImpl(
          gh<_i135.LatestClientsUpdatesDatasource>()));
  gh.factory<_i299.TaskRepository>(
      () => _i300.TaskRepositoryImpl(gh<_i103.TaskDatasource>()));
  gh.lazySingleton<_i301.EditGeneralConfigsUsecase>(() =>
      _i301.EditGeneralConfigsUsecase(gh<_i191.GeneralConfigsRepository>()));
  gh.lazySingleton<_i302.GetGeneralConfigsUsecase>(() =>
      _i302.GetGeneralConfigsUsecase(gh<_i191.GeneralConfigsRepository>()));
  gh.factory<_i303.PeriodicCommunicationReportsCubit>(() =>
      _i303.PeriodicCommunicationReportsCubit(
          gh<_i196.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i304.GetAllClientsContactsUseCase>(() =>
      _i304.GetAllClientsContactsUseCase(
          gh<_i255.ClientsContactsRepository>()));
  gh.factory<_i305.InstallQualityCubit>(
      () => _i305.InstallQualityCubit(gh<_i201.GetInstallUseCase>()));
  gh.factory<_i306.ClientsContactsBloc>(() =>
      _i306.ClientsContactsBloc(gh<_i304.GetAllClientsContactsUseCase>()));
  gh.factory<_i307.ImportantLinksCubit>(() => _i307.ImportantLinksCubit(
        gh<_i259.GetImportantLinksUsecase>(),
        gh<_i258.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i308.AddAgentUseCase>(
      () => _i308.AddAgentUseCase(gh<_i175.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i309.UpdateAgentUseCase>(() =>
      _i309.UpdateAgentUseCase(gh<_i175.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i310.GetDelayInstallReportsUseCase>(() =>
      _i310.GetDelayInstallReportsUseCase(gh<_i169.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i311.CrudAgentSupportFilesUsecase>(() =>
      _i311.CrudAgentSupportFilesUsecase(
          gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i312.GetClientsTransferApprovalsUsecase>(() =>
      _i312.GetClientsTransferApprovalsUsecase(
          gh<_i252.ClientsTransferApprovalsRepo>()));
  gh.factory<_i313.ClientsStatusReportsCubit>(() =>
      _i313.ClientsStatusReportsCubit(
          gh<_i257.GetClientsStatusReportsUsecase>()));
  gh.factory<_i314.SupportTabCubit>(() => _i314.SupportTabCubit(
        gh<_i207.GetInvoiceByClientUsecase>(),
        gh<_i205.AddDateInstallUsecase>(),
        gh<_i210.SetDateDoneUsecase>(),
        gh<_i211.SetReadyInstallUsecase>(),
        gh<_i209.ReturnInvoiceApproveUsecase>(),
        gh<_i208.ReceiveDeviceUsecase>(),
        gh<_i206.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i315.ClientsDebtsReportsCubit>(() =>
      _i315.ClientsDebtsReportsCubit(
          gh<_i155.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i316.DeletedInvoicesCubit>(
      () => _i316.DeletedInvoicesCubit(gh<_i254.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i317.AddAgentDateUseCase>(() =>
      _i317.AddAgentDateUseCase(gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i318.GetManageWithdrawnInvoicesUsecase>(() =>
      _i318.GetManageWithdrawnInvoicesUsecase(
          gh<_i162.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i319.NotificationsCubit>(() => _i319.NotificationsCubit(
        gh<_i193.GetNotificationsUsecase>(),
        gh<_i195.MarkNotificationsAsReadUsecase>(),
        gh<_i194.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i320.WithdrawnInvoicesRepo>(() =>
      _i321.WithdrawnInvoicesRepoImpl(gh<_i137.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i322.RegionsRepository>(
      () => _i323.RegionsRepositoryImpl(gh<_i153.RegionsDatasource>()));
  gh.factory<_i324.ClientLogsTabCubit>(
      () => _i324.ClientLogsTabCubit(gh<_i220.GetClientLogsUsecase>()));
  gh.factory<_i325.RegionsSalesReportsCubit>(() =>
      _i325.RegionsSalesReportsCubit(
          gh<_i181.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i326.AgentsDistributorsActionsCubit>(
      () => _i326.AgentsDistributorsActionsCubit(
            gh<_i119.GetCitiesUseCase>(),
            gh<_i308.AddAgentUseCase>(),
            gh<_i309.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i327.FetchPaginatedClientsUsecase>(() =>
      _i327.FetchPaginatedClientsUsecase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i328.FetchLinkClientsUseCase>(
      () => _i328.FetchLinkClientsUseCase(gh<_i237.ClientsListRepository>()));
  gh.factory<_i329.LinkSelectedClientsUseCase>(() =>
      _i329.LinkSelectedClientsUseCase(gh<_i237.ClientsListRepository>()));
  gh.lazySingleton<_i330.LoginRepo>(() => _i331.LoginRepoImpl(
        gh<_i128.LoginRemoteDataSource>(),
        gh<_i289.LoginLocalDataSource>(),
      ));
  gh.factory<_i332.SpecialClientsBloc>(
      () => _i332.SpecialClientsBloc(gh<_i185.GetSpecialClientsUsecase>()));
  gh.factory<_i333.AddCommentUsecase>(
      () => _i333.AddCommentUsecase(gh<_i198.CompanyRepository>()));
  gh.factory<_i334.GetCommentUsecase>(
      () => _i334.GetCommentUsecase(gh<_i198.CompanyRepository>()));
  gh.factory<_i335.DelayInstallReportsCubit>(() =>
      _i335.DelayInstallReportsCubit(
          gh<_i310.GetDelayInstallReportsUseCase>()));
  gh.factory<_i336.DatesTimelineBloc>(
      () => _i336.DatesTimelineBloc(gh<_i202.GetTimelineByEmployeeUseCase>()));
  gh.factory<_i337.GreetingCommunicationCubit>(() =>
      _i337.GreetingCommunicationCubit(
          gh<_i251.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i338.GetRegionsUseCase>(
      () => _i338.GetRegionsUseCase(gh<_i322.RegionsRepository>()));
  gh.lazySingleton<_i339.GetLatestClientsUseCase>(() =>
      _i339.GetLatestClientsUseCase(
          gh<_i297.LatestClientsUpdatesRepository>()));
  gh.factory<_i340.AdvancedCofigsCubit>(() => _i340.AdvancedCofigsCubit(
        gh<_i291.GetAdvancedConfigsUsecase>(),
        gh<_i290.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i341.SupportClientsInvoicesCubit>(() =>
      _i341.SupportClientsInvoicesCubit(
          gh<_i228.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i342.WrongNumbersCubit>(
      () => _i342.WrongNumbersCubit(gh<_i189.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i343.CacheTokenUsecase>(
      () => _i343.CacheTokenUsecase(gh<_i330.LoginRepo>()));
  gh.lazySingleton<_i344.GetTokenUsecase>(
      () => _i344.GetTokenUsecase(gh<_i330.LoginRepo>()));
  gh.lazySingleton<_i345.LoginUsecase>(
      () => _i345.LoginUsecase(gh<_i330.LoginRepo>()));
  gh.lazySingleton<_i346.ValidateTokenUsecase>(
      () => _i346.ValidateTokenUsecase(gh<_i330.LoginRepo>()));
  gh.lazySingleton<_i347.VerifyOtpUsecase>(
      () => _i347.VerifyOtpUsecase(gh<_i330.LoginRepo>()));
  gh.factory<_i348.ClientsTransferApprovalsCubit>(() =>
      _i348.ClientsTransferApprovalsCubit(
          gh<_i312.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i349.RegionsCubit>(
      () => _i349.RegionsCubit(gh<_i338.GetRegionsUseCase>()));
  gh.factory<_i350.GeneralCofigsCubit>(() => _i350.GeneralCofigsCubit(
        gh<_i302.GetGeneralConfigsUsecase>(),
        gh<_i301.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i351.GetPeriodicCommunicationUseCase>(() =>
      _i351.GetPeriodicCommunicationUseCase(
          gh<_i215.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i352.GetClientsDebtsUsecase>(
      () => _i352.GetClientsDebtsUsecase(gh<_i213.ClientsDebtsRepo>()));
  gh.lazySingleton<_i353.CrudClientSupportFilesUsecase>(() =>
      _i353.CrudClientSupportFilesUsecase(
          repository: gh<_i237.ClientsListRepository>()));
  gh.lazySingleton<_i354.GetClientSupportFilesUsecase>(() =>
      _i354.GetClientSupportFilesUsecase(
          repository: gh<_i237.ClientsListRepository>()));
  gh.factory<_i355.BranchesCubit>(
      () => _i355.BranchesCubit(gh<_i197.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i356.AddAgentCommentUsecase>(() =>
      _i356.AddAgentCommentUsecase(gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i357.DoneTrainingUsecase>(() =>
      _i357.DoneTrainingUsecase(gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i358.GetAgentByIdUsecase>(() =>
      _i358.GetAgentByIdUsecase(gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i359.GetAgentClientListUsecase>(() =>
      _i359.GetAgentClientListUsecase(
          gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i360.GetAgentCommentsListUsecase>(() =>
      _i360.GetAgentCommentsListUsecase(
          gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i361.GetAgentDatesListUsecase>(() =>
      _i361.GetAgentDatesListUsecase(
          gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i362.GetAgentInvoiceListUsecase>(() =>
      _i362.GetAgentInvoiceListUsecase(
          gh<_i203.AgentsDistributorsProfileRepo>()));
  gh.factory<_i363.AddRejectReasonsUsecase>(() =>
      _i363.AddRejectReasonsUsecase(gh<_i229.ManageWithdrawalsRepository>()));
  gh.factory<_i364.EditRejectReasonsUsecase>(() =>
      _i364.EditRejectReasonsUsecase(gh<_i229.ManageWithdrawalsRepository>()));
  gh.factory<_i365.GetRejectReasonsUsecase>(() =>
      _i365.GetRejectReasonsUsecase(gh<_i229.ManageWithdrawalsRepository>()));
  gh.factory<_i366.GetUserSeriesUsecase>(() =>
      _i366.GetUserSeriesUsecase(gh<_i229.ManageWithdrawalsRepository>()));
  gh.factory<_i367.GetWithdrawnDetailsUsecase>(() =>
      _i367.GetWithdrawnDetailsUsecase(
          gh<_i229.ManageWithdrawalsRepository>()));
  gh.factory<_i368.SetApproveSeriesUsecase>(() =>
      _i368.SetApproveSeriesUsecase(gh<_i229.ManageWithdrawalsRepository>()));
  gh.factory<_i369.UpdateSeriesUsecase>(
      () => _i369.UpdateSeriesUsecase(gh<_i229.ManageWithdrawalsRepository>()));
  gh.factory<_i370.NotUsingSystemCubit>(
      () => _i370.NotUsingSystemCubit(gh<_i235.GetNotUsingSystemUsecase>()));
  gh.singleton<_i371.AppManagerCubit>(
      () => _i371.AppManagerCubit(gh<_i295.GetVersionUseCase>()));
  gh.lazySingleton<_i372.GetWaitingAgentsUsecase>(
      () => _i372.GetWaitingAgentsUsecase(gh<_i261.WaitingAgentsRepo>()));
  gh.factory<_i373.InvoicesSectionCubit>(() => _i373.InvoicesSectionCubit(
        gh<_i187.GetInvoicesByPrivilegesUsecase>(),
        gh<_i280.GetAgentsAndDistributorsUseCase>(),
        gh<_i246.ParticipateListUsecase>(),
        gh<_i212.GetAllUsersUseCase>(),
        gh<_i188.GetInvoiceByIdUsecase>(),
        gh<_i186.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i374.ProductsSalesReportsCubit>(() =>
      _i374.ProductsSalesReportsCubit(
          gh<_i233.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i375.GetWithdrawnInvoicesUsecase>(() =>
      _i375.GetWithdrawnInvoicesUsecase(gh<_i320.WithdrawnInvoicesRepo>()));
  gh.factory<_i376.PreviousRatingsCubit>(
      () => _i376.PreviousRatingsCubit(gh<_i260.GetPreviousRatingsUsecase>()));
  gh.factory<_i377.AgentsDistributorsCubit>(() => _i377.AgentsDistributorsCubit(
        gh<_i280.GetAgentsAndDistributorsUseCase>(),
        gh<_i279.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i378.ExceededClientsCubit>(() => _i378.ExceededClientsCubit(
        gh<_i286.ExceededClientsUseCase>(),
        gh<_i287.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i379.ClientsListBloc>(() => _i379.ClientsListBloc(
        gh<_i270.GetClientsWithFilterUserUsecase>(),
        gh<_i272.GetRecommendedClientsUsecase>(),
        gh<_i273.GetSimilarClientsUsecase>(),
        gh<_i263.AddClientUserUsecase>(),
        gh<_i267.EditClientUserUsecase>(),
        gh<_i266.ChangeTypeClientUsecase>(),
        gh<_i265.ChangeClientCommunicationUseCase>(),
        gh<_i275.StoreClientCommunicationUseCase>(),
        gh<_i264.ApproveRejectClientUsecase>(),
        gh<_i353.CrudClientSupportFilesUsecase>(),
        gh<_i354.GetClientSupportFilesUsecase>(),
        gh<_i276.TransferClientUserUsecase>(),
        gh<_i274.ReceiveClientUserUsecase>(),
        gh<_i271.GetClientMarketingReportUsecase>(),
        gh<_i277.GetHighSimilarClientsUsecase>(),
        gh<_i328.FetchLinkClientsUseCase>(),
        gh<_i327.FetchPaginatedClientsUsecase>(),
        gh<_i329.LinkSelectedClientsUseCase>(),
        gh<_i219.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i380.ManageWithdrawalsCubit>(() => _i380.ManageWithdrawalsCubit(
        gh<_i366.GetUserSeriesUsecase>(),
        gh<_i369.UpdateSeriesUsecase>(),
        gh<_i226.GetUsersUsecase>(),
        gh<_i284.GetWithdrawalsInvoicesUsecase>(),
        gh<_i285.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i368.SetApproveSeriesUsecase>(),
        gh<_i367.GetWithdrawnDetailsUsecase>(),
        gh<_i363.AddRejectReasonsUsecase>(),
        gh<_i365.GetRejectReasonsUsecase>(),
        gh<_i364.EditRejectReasonsUsecase>(),
        gh<_i283.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i282.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i381.ManageWithdrawnInvoicesCubit>(() =>
      _i381.ManageWithdrawnInvoicesCubit(
          gh<_i318.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i382.LatestClientsUpdatesCubit>(() =>
      _i382.LatestClientsUpdatesCubit(gh<_i339.GetLatestClientsUseCase>()));
  gh.factory<_i383.AttachmentsRowCubit>(() => _i383.AttachmentsRowCubit(
        gh<_i354.GetClientSupportFilesUsecase>(),
        gh<_i353.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i384.CancelScheduleUsecase>(
      () => _i384.CancelScheduleUsecase(gh<_i293.DatesTableRepo>()));
  gh.lazySingleton<_i385.ChangeDateToDonUsecase>(
      () => _i385.ChangeDateToDonUsecase(gh<_i293.DatesTableRepo>()));
  gh.lazySingleton<_i386.GetCancelReasonsUsecase>(
      () => _i386.GetCancelReasonsUsecase(gh<_i293.DatesTableRepo>()));
  gh.lazySingleton<_i387.GetDateInstallationUsecase>(
      () => _i387.GetDateInstallationUsecase(gh<_i293.DatesTableRepo>()));
  gh.lazySingleton<_i388.GetInvoicesByClientForDateUsecase>(() =>
      _i388.GetInvoicesByClientForDateUsecase(gh<_i293.DatesTableRepo>()));
  gh.lazySingleton<_i389.GetSubscribedClientsUsecase>(
      () => _i389.GetSubscribedClientsUsecase(gh<_i293.DatesTableRepo>()));
  gh.lazySingleton<_i390.RescheduleDateUsecase>(
      () => _i390.RescheduleDateUsecase(gh<_i293.DatesTableRepo>()));
  gh.lazySingleton<_i391.ReturnScheduleVisitToOpenUsecase>(
      () => _i391.ReturnScheduleVisitToOpenUsecase(gh<_i293.DatesTableRepo>()));
  gh.factory<_i392.AddTaskUsecase>(
      () => _i392.AddTaskUsecase(gh<_i299.TaskRepository>()));
  gh.factory<_i393.ChangeStatusTaskUsecase>(
      () => _i393.ChangeStatusTaskUsecase(gh<_i299.TaskRepository>()));
  gh.factory<_i394.GetTasksUsecase>(
      () => _i394.GetTasksUsecase(gh<_i299.TaskRepository>()));
  gh.factory<_i395.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i395.GetUsersByDepartmentAndRegionUsecase(gh<_i299.TaskRepository>()));
  gh.lazySingleton<_i396.TaskCubit>(() => _i396.TaskCubit(
        gh<_i392.AddTaskUsecase>(),
        gh<_i394.GetTasksUsecase>(),
        gh<_i393.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i397.UsersCubit>(() => _i397.UsersCubit(
        gh<_i226.GetUsersUsecase>(),
        gh<_i227.GetUserByIdUsecase>(),
        gh<_i96.ActionUserUsecase>(),
        gh<_i395.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i225.GetManagesForUserUsecase>(),
        gh<_i224.GetLevelsForUserUsecase>(),
        gh<_i223.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i398.CompanyCubit>(() => _i398.CompanyCubit(
        gh<_i334.GetCommentUsecase>(),
        gh<_i333.AddCommentUsecase>(),
      ));
  gh.factory<_i399.ClientsDebtsCubit>(
      () => _i399.ClientsDebtsCubit(gh<_i352.GetClientsDebtsUsecase>()));
  gh.factory<_i400.PeriodicCommunicationCubit>(() =>
      _i400.PeriodicCommunicationCubit(
          gh<_i351.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i401.LoginCubit>(() => _i401.LoginCubit(
        gh<_i345.LoginUsecase>(),
        gh<_i347.VerifyOtpUsecase>(),
        gh<_i343.CacheTokenUsecase>(),
        gh<_i344.GetTokenUsecase>(),
        gh<_i346.ValidateTokenUsecase>(),
      ));
  gh.factory<_i402.AgentsDistributorsProfileBloc>(
      () => _i402.AgentsDistributorsProfileBloc(
            gh<_i358.GetAgentByIdUsecase>(),
            gh<_i359.GetAgentClientListUsecase>(),
            gh<_i362.GetAgentInvoiceListUsecase>(),
            gh<_i244.GetParticipateInvoiceByIdUsecase>(),
            gh<_i360.GetAgentCommentsListUsecase>(),
            gh<_i356.AddAgentCommentUsecase>(),
            gh<_i357.DoneTrainingUsecase>(),
            gh<_i317.AddAgentDateUseCase>(),
            gh<_i361.GetAgentDatesListUsecase>(),
            gh<_i311.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i403.DatesTableCubit>(() => _i403.DatesTableCubit(
        gh<_i387.GetDateInstallationUsecase>(),
        gh<_i390.RescheduleDateUsecase>(),
        gh<_i385.ChangeDateToDonUsecase>(),
        gh<_i384.CancelScheduleUsecase>(),
        gh<_i391.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i389.GetSubscribedClientsUsecase>(),
        gh<_i388.GetInvoicesByClientForDateUsecase>(),
        gh<_i205.AddDateInstallUsecase>(),
        gh<_i386.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i404.WithdrawnInvoicesCubit>(() =>
      _i404.WithdrawnInvoicesCubit(gh<_i375.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i405.WaitingAgentsCubit>(
      () => _i405.WaitingAgentsCubit(gh<_i372.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i406.AppModule {}
