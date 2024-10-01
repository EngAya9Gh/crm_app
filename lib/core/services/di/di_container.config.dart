// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i20;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i19;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i59;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i167;
import '../../../features/app/domain/repositories/app_repository.dart' as _i166;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i285;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i358;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i279;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i125;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i319;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i318;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i330;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i331;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i332;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i333;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i334;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i387;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i30;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i46;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i45;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i185;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i271;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i27;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i90;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i89;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i112;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i177;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i24;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i36;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i35;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i229;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i357;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i54;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i67;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i117;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i118;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i119;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i121;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i120;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i122;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i286;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i145;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i123;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i26;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i38;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i37;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i184;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i329;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i50;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i49;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i96;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i243;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i17;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i154;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i153;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i245;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i324;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i51;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i161;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i160;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i196;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i294;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i40;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i210;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i209;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i338;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i386;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i32;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i43;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i42;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i191;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i293;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i25;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i103;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i102;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i252;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i363;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i60;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i140;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i139;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i180;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i320;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i88;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i95;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i94;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i192;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i342;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i65;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i115;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i114;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i116;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i228;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i71;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i105;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i104;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i214;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i312;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i109;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i179;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i178;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i199;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i200;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i201;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i202;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i203;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i204;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i205;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i302;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i150;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i311;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i310;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i325;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i336;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i64;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i80;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i79;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i110;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i230;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i66;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i129;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i128;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i280;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i281;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i327;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i83;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i187;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i186;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i291;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i292;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i337;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i53;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i52;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i107;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i108;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i124;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i13;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i163;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i162;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i169;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i168;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i195;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i56;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i82;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i81;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i93;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i217;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i218;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i219;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i221;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i220;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i383;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i44;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i224;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i223;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i350;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i272;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i351;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i273;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i352;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i353;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i275;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i274;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i354;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i355;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i356;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i366;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i14;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i29;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i28;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i188;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i189;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i190;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i307;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i47;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i208;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i207;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i339;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i385;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i61;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i34;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i232;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i231;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i255;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i256;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i257;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i340;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i258;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i213;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i316;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i315;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i262;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i341;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i259;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i260;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i261;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i267;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i263;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i264;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i317;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i265;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i266;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i391;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i57;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i247;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i246;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i300;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i335;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i48;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i85;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i84;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i141;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i172;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i132;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i288;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i287;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i326;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i368;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i87;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i86;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i111;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i242;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i62;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i194;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i193;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i321;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i322;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i384;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i106;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i174;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i173;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i248;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i304;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i58;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i92;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i91;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i276;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i277;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i365;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i113;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i136;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i135;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i181;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i206;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i183;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i182;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i360;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i133;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i158;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i157;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i306;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i367;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i18;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i99;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i144;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i198;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i226;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i170;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i197;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i225;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i343;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i305;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i296;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i269;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i299;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i344;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i345;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i346;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i347;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i348;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i349;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i270;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i297;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i314;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i388;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i364;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i63;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i212;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i211;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i250;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i251;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i295;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i39;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i131;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i130;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i233;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i234;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i241;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i235;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i236;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i237;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i238;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i239;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i240;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i278;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i73;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i72;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i152;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i303;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i31;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i147;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i146;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i249;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i301;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i41;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i127;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i126;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i244;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i268;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i15;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i143;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i142;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i227;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i361;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i70;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i69;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i176;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i313;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i134;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i309;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i308;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i362;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i390;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i21;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i98;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i97;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i101;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i282;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i148;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i284;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i283;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i370;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i371;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i372;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i373;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i374;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i375;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i376;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i377;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i389;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i77;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i76;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i149;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i175;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i33;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i165;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i164;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i298;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i323;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i75;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i74;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i78;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i137;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i55;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i216;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i215;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i222;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i328;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i138;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i254;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i253;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i359;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i392;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i100;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i290;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i289;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i378;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i379;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i380;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i381;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i382;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i369;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i155;
import '../cache_services/prefs_consumer.dart' as _i159;
import '../cache_services/secure_storage_consumer.dart' as _i156;
import '../maps/location_services.dart' as _i151;
import 'di_container.dart' as _i393;

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
  gh.lazySingleton<_i10.EvaluationLevelReportDatasource>(
      () => _i10.EvaluationLevelReportDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i11.DelayAfterInstallDatasource>(
      () => _i11.DelayAfterInstallDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i12.PendingInvoicesDatasource>(
      () => _i12.PendingInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i13.PrivilegesDatasource>(
      () => _i13.PrivilegesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i14.NotificationsDatasource>(
      () => _i14.NotificationsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i15.ProductsSalesReportsDatasource>(
      () => _i15.ProductsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i16.LevelsDatasource>(
      () => _i16.LevelsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i17.GreetingCommunicationDatasource>(
      () => _i17.GreetingCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i18.AgentsDistributorsActionsDataSource>(() =>
      _i18.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i19.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i20.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i21.ClientsInstallReportsDatasource>(
      () => _i21.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.RegionsSalesReportsDatasource>(
      () => _i22.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.ClientsDebtsReportsDatasource>(
      () => _i23.ClientsDebtsReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.NotUsingSystemDatasource>(
      () => _i24.NotUsingSystemDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.PreviousRatingsDatasource>(
      () => _i25.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.WrongNumbersDatasource>(
      () => _i26.WrongNumbersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.ClientsCareReportsDatasource>(
      () => _i27.ClientsCareReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.NotificationsRepo>(
      () => _i29.NotificationsRepoImpl(gh<_i14.NotificationsDatasource>()));
  gh.lazySingleton<_i30.ClientsAcceptDatasource>(
      () => _i30.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.ClientsStatusReportsDatasource>(
      () => _i31.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.PeriodicCommunicationReportsDatasource>(() =>
      _i32.PeriodicCommunicationReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.DelayInstallReportsDatasource>(
      () => _i33.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i34.LinkClientApiService>(
      () => _i34.LinkClientApiService(gh<_i4.Dio>()));
  gh.lazySingleton<_i35.NotUsingSystemRepo>(
      () => _i36.NotUsingSystemRepoImpl(gh<_i24.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i37.WrongNumbersRepo>(
      () => _i38.WrongNumbersRepoImpl(gh<_i26.WrongNumbersDatasource>()));
  gh.lazySingleton<_i39.ParticipatesListDatasource>(
      () => _i39.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i40.PeriodicCommunicationDatasource>(
      () => _i40.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.EmployeesSalesReportsDatasource>(
      () => _i41.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i42.PeriodicCommunicationReportsRepo>(() =>
      _i43.PeriodicCommunicationReportsRepoImpl(
          gh<_i32.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i44.ManageWithdrawalsDatasource>(
      () => _i44.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.ClientsAcceptRepository>(() =>
      _i46.ClientsAcceptRepositoryImpl(gh<_i30.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i47.ClientsDebtsDatasource>(
      () => _i47.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i48.FinancePendingDatasource>(
      () => _i48.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i49.EvaluationLevelReportRepo>(() =>
      _i50.EvaluationLevelReportRepoImpl(
          gh<_i10.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i51.InstallQualityDatasource>(
      () => _i51.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i52.LevelsRepo>(
      () => _i53.LevelsRepoImpl(gh<_i16.LevelsDatasource>()));
  gh.lazySingleton<_i54.TicketsDataSource>(
      () => _i54.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i55.SupportClientsInvoicesDatasource>(
      () => _i55.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i56.UsersDatasource>(
      () => _i56.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i19.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i20.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i57.ClientsTransferApprovalsDatasource>(
      () => _i57.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i58.ExceededClientsDatasource>(
      () => _i58.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i59.AppDatasource>(
      () => _i59.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i60.SpecialClientsDatasource>(
      () => _i60.SpecialClientsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i61.ClientsListDatasource>(
      () => _i61.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i62.CommentCompanyDatasource>(
      () => _i62.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i63.ImportantLinksDatasource>(
      () => _i63.ImportantLinksDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i64.UsersDatasource>(
      () => _i64.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i65.CitiesDatasource>(
      () => _i65.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i66.AdvancedConfigsDatasource>(
      () => _i66.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i67.TicketsRepo>(
      () => _i68.TicketsRepoImpl(gh<_i54.TicketsDataSource>()));
  gh.lazySingleton<_i69.RegionsSalesReportsRepo>(() =>
      _i70.RegionsSalesReportsRepoImpl(
          gh<_i22.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i71.ClientLogsTabDataSource>(
      () => _i71.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i72.ClientsDebtsReportsRepo>(() =>
      _i73.ClientsDebtsReportsRepoImpl(
          gh<_i23.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i74.SupportClientsAcceptRepository>(() =>
      _i75.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i76.DelayAfterInstallRepo>(() =>
      _i77.DelayAfterInstallRepoImpl(gh<_i11.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i78.GetSupportClientsAcceptUseCase>(() =>
      _i78.GetSupportClientsAcceptUseCase(
          gh<_i74.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i79.UsersRepository>(
      () => _i80.UsersRepositoryImpl(gh<_i64.UsersDatasource>()));
  gh.lazySingleton<_i81.UsersRepository>(
      () => _i82.UsersRepositoryImpl(gh<_i56.UsersDatasource>()));
  gh.lazySingleton<_i83.GeneralConfigsDatasource>(
      () => _i83.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i84.FinancePendingRepo>(
      () => _i85.FinancePendingRepoImpl(gh<_i48.FinancePendingDatasource>()));
  gh.lazySingleton<_i86.PendingInvoicesRepo>(
      () => _i87.PendingInvoicesRepoImpl(gh<_i12.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i88.BranchesDatasource>(
      () => _i88.BranchesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i89.ClientsCareReportsRepo>(() =>
      _i90.ClientsCareReportsRepoImpl(gh<_i27.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i91.ExceededClientsRepo>(
      () => _i92.ExceededClientsRepoImpl(gh<_i58.ExceededClientsDatasource>()));
  gh.factory<_i93.ActionUserUsecase>(
      () => _i93.ActionUserUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i94.BranchesRepository>(
      () => _i95.BranchesRepositoryImpl(gh<_i88.BranchesDatasource>()));
  gh.lazySingleton<_i96.GetEvaluationLevelReportUsecase>(() =>
      _i96.GetEvaluationLevelReportUsecase(
          gh<_i49.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i97.ClientsInstallReportsRepo>(() =>
      _i98.ClientsInstallReportsRepoImpl(
          gh<_i21.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i99.AgentsDistributorsDataSource>(
      () => _i99.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i100.TaskDatasource>(
      () => _i100.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i101.GetClientsInstallReportsUsecase>(() =>
      _i101.GetClientsInstallReportsUsecase(
          gh<_i97.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i102.PreviousRatingsRepo>(() =>
      _i103.PreviousRatingsRepoImpl(gh<_i25.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i104.ClientLogsTabRepo>(
      () => _i105.ClientLogsTabRepoImpl(gh<_i71.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i106.DeletedInvoicesDatasource>(
      () => _i106.DeletedInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i107.AddLevelUsecase>(
      () => _i107.AddLevelUsecase(gh<_i52.LevelsRepo>()));
  gh.lazySingleton<_i108.GetLevelsUsecase>(
      () => _i108.GetLevelsUsecase(gh<_i52.LevelsRepo>()));
  gh.lazySingleton<_i109.SupportTabDataSource>(
      () => _i109.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i110.GetUsersUsecase>(
      () => _i110.GetUsersUsecase(gh<_i79.UsersRepository>()));
  gh.lazySingleton<_i111.GetPendingInvoicesUsecase>(
      () => _i111.GetPendingInvoicesUsecase(gh<_i86.PendingInvoicesRepo>()));
  gh.lazySingleton<_i112.GetClientsCareReportsUsecase>(() =>
      _i112.GetClientsCareReportsUsecase(gh<_i89.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i113.InvoicesTabDataSource>(
      () => _i113.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i114.CitiesRepository>(
      () => _i115.CitiesRepositoryImpl(gh<_i65.CitiesDatasource>()));
  gh.lazySingleton<_i116.GetCitiesUseCase>(
      () => _i116.GetCitiesUseCase(gh<_i114.CitiesRepository>()));
  gh.lazySingleton<_i117.AddTicketUseCase>(
      () => _i117.AddTicketUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i118.EditTicketTypeUseCase>(
      () => _i118.EditTicketTypeUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i119.GetClientTicketsUseCase>(
      () => _i119.GetClientTicketsUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i120.GetTicketsUseCase>(
      () => _i120.GetTicketsUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i121.GetTicketByIdUseCase>(
      () => _i121.GetTicketByIdUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i122.TransferTicketUseCase>(
      () => _i122.TransferTicketUseCase(gh<_i67.TicketsRepo>()));
  gh.factory<_i123.TicketsCubit>(() => _i123.TicketsCubit(
        gh<_i120.GetTicketsUseCase>(),
        gh<_i121.GetTicketByIdUseCase>(),
        gh<_i119.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i124.LevelsCubit>(() => _i124.LevelsCubit(
        gh<_i108.GetLevelsUsecase>(),
        gh<_i107.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i125.LoginRemoteDataSource>(
      () => _i125.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i126.EmployeesSalesReportsRepo>(() =>
      _i127.EmployeesSalesReportsRepoImpl(
          gh<_i41.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i128.AdvancedConfigsRepository>(() =>
      _i129.AdvancedConfigsRepositoryImpl(
          gh<_i66.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i130.ParticipateListRepository>(() =>
      _i131.ParticipateListRepositoryImpl(
          gh<_i39.ParticipatesListDatasource>()));
  gh.lazySingleton<_i132.LatestClientsUpdatesDatasource>(
      () => _i132.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i133.ManageWithdrawnInvoicesDataSource>(
      () => _i133.ManageWithdrawnInvoicesDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i134.WithdrawnInvoicesDataSource>(
      () => _i134.WithdrawnInvoicesDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i135.InvoicesSectionRepo>(
      () => _i136.InvoicesTabRepoImpl(gh<_i113.InvoicesTabDataSource>()));
  gh.factory<_i137.SupportClientsAcceptCubit>(() =>
      _i137.SupportClientsAcceptCubit(
          gh<_i78.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i138.WaitingAgentsDataSource>(
      () => _i138.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i139.SpecialClientsRepository>(() =>
      _i140.SpecialClientsRepositoryImpl(gh<_i60.SpecialClientsDatasource>()));
  gh.lazySingleton<_i141.GetFinancePendingInvoicesUsecase>(() =>
      _i141.GetFinancePendingInvoicesUsecase(gh<_i84.FinancePendingRepo>()));
  gh.lazySingleton<_i142.ProductsSalesReportsRepo>(() =>
      _i143.ProductsSalesReportsRepoImpl(
          gh<_i15.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i144.AgentsDistributorsProfileDataSource>(() =>
      _i144.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i145.EditTicketCubit>(() => _i145.EditTicketCubit(
        gh<_i118.EditTicketTypeUseCase>(),
        gh<_i122.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i146.ClientsStatusReportsRepo>(() =>
      _i147.ClientsStatusReportsRepoImpl(
          gh<_i31.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i148.DatesTableDataSource>(
      () => _i148.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i149.GetDelayAfterInstallUseCase>(() =>
      _i149.GetDelayAfterInstallUseCase(gh<_i76.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i150.RegionsDatasource>(
      () => _i150.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i151.LocationServices>(
      () => _i151.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i152.GetClientsDebtsReportsUsecase>(() =>
      _i152.GetClientsDebtsReportsUsecase(gh<_i72.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i153.GreetingCommunicationRepo>(() =>
      _i154.GreetingCommunicationRepoImpl(
          gh<_i17.GreetingCommunicationDatasource>()));
  gh.singleton<_i155.CacheServices>(
    () => _i156.SecureStorageConsumer(gh<_i20.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i157.ManageWithdrawnInvoicesRepo>(() =>
      _i158.ManageWithdrawnInvoicesRepoImpl(
          gh<_i133.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i155.CacheServices>(() async =>
      _i159.PrefsConsumer(await gh.getAsync<_i19.SharedPreferences>()));
  gh.lazySingleton<_i160.InstallQualityRepo>(
      () => _i161.InstallQualityRepoImpl(gh<_i51.InstallQualityDatasource>()));
  gh.lazySingleton<_i162.PrivilegesRepo>(
      () => _i163.PrivilegesRepoImpl(gh<_i13.PrivilegesDatasource>()));
  gh.lazySingleton<_i164.DelayInstallReportsRepo>(() =>
      _i165.DelayInstallReportsRepoImpl(
          gh<_i33.DelayInstallReportsDatasource>()));
  gh.factory<_i166.AppRepository>(
      () => _i167.AppRepositoryImpl(gh<_i59.AppDatasource>()));
  gh.factory<_i168.UpdatePrivilegesUsecase>(
      () => _i168.UpdatePrivilegesUsecase(gh<_i162.PrivilegesRepo>()));
  gh.lazySingleton<_i169.GetPrivilegesUsecase>(
      () => _i169.GetPrivilegesUsecase(gh<_i162.PrivilegesRepo>()));
  gh.lazySingleton<_i170.AgentsDistributorsActionsRepo>(() =>
      _i171.AgentsDistributorsActionsRepoImpl(
          gh<_i18.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i172.FinancePendingCubit>(() =>
      _i172.FinancePendingCubit(gh<_i141.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i173.DeletedInvoicesRepo>(() =>
      _i174.DeletedInvoicesRepoImpl(gh<_i106.DeletedInvoicesDatasource>()));
  gh.factory<_i175.DelayAfterInstallCubit>(() =>
      _i175.DelayAfterInstallCubit(gh<_i149.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i176.GetRegionsSalesReportsUsecase>(() =>
      _i176.GetRegionsSalesReportsUsecase(gh<_i69.RegionsSalesReportsRepo>()));
  gh.factory<_i177.ClientsCareReportsCubit>(() =>
      _i177.ClientsCareReportsCubit(gh<_i112.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i178.SupportTabRepo>(
      () => _i179.SupportTabRepoImpl(gh<_i109.SupportTabDataSource>()));
  gh.factory<_i180.GetSpecialClientsUsecase>(() =>
      _i180.GetSpecialClientsUsecase(gh<_i139.SpecialClientsRepository>()));
  gh.lazySingleton<_i181.ExportInvoicesToExcelUsecase>(() =>
      _i181.ExportInvoicesToExcelUsecase(gh<_i135.InvoicesSectionRepo>()));
  gh.lazySingleton<_i182.GetInvoicesByPrivilegesUsecase>(() =>
      _i182.GetInvoicesByPrivilegesUsecase(gh<_i135.InvoicesSectionRepo>()));
  gh.lazySingleton<_i183.GetInvoiceByIdUsecase>(
      () => _i183.GetInvoiceByIdUsecase(gh<_i135.InvoicesSectionRepo>()));
  gh.lazySingleton<_i184.GetWrongNumbersUsecase>(
      () => _i184.GetWrongNumbersUsecase(gh<_i37.WrongNumbersRepo>()));
  gh.lazySingleton<_i185.GetClientsAcceptUseCase>(
      () => _i185.GetClientsAcceptUseCase(gh<_i45.ClientsAcceptRepository>()));
  gh.lazySingleton<_i186.GeneralConfigsRepository>(() =>
      _i187.GeneralConfigsRepositoryImpl(gh<_i83.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i188.GetNotificationsUsecase>(
      () => _i188.GetNotificationsUsecase(gh<_i28.NotificationsRepo>()));
  gh.lazySingleton<_i189.GetUnreadNotificationsCountUsecase>(() =>
      _i189.GetUnreadNotificationsCountUsecase(gh<_i28.NotificationsRepo>()));
  gh.lazySingleton<_i190.MarkNotificationsAsReadUsecase>(
      () => _i190.MarkNotificationsAsReadUsecase(gh<_i28.NotificationsRepo>()));
  gh.lazySingleton<_i191.GetPeriodicCommunicationReportsUsecase>(() =>
      _i191.GetPeriodicCommunicationReportsUsecase(
          gh<_i42.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i192.GetBranchesByIdCountryUseCase>(
      () => _i192.GetBranchesByIdCountryUseCase(gh<_i94.BranchesRepository>()));
  gh.factory<_i193.CompanyRepository>(
      () => _i194.CompanyRepositoryImpl(gh<_i62.CommentCompanyDatasource>()));
  gh.singleton<_i195.PrivilegesCubit>(() => _i195.PrivilegesCubit(
        gh<_i169.GetPrivilegesUsecase>(),
        gh<_i168.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i196.GetInstallUseCase>(
      () => _i196.GetInstallUseCase(gh<_i160.InstallQualityRepo>()));
  gh.lazySingleton<_i197.AgentsDistributorsProfileRepo>(() =>
      _i198.AgentsDistributorsProfileRepoImpl(
          gh<_i144.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i199.AddDateInstallUsecase>(
      () => _i199.AddDateInstallUsecase(gh<_i178.SupportTabRepo>()));
  gh.lazySingleton<_i200.CancelDateInstallUsecase>(
      () => _i200.CancelDateInstallUsecase(gh<_i178.SupportTabRepo>()));
  gh.lazySingleton<_i201.GetInvoiceByClientUsecase>(
      () => _i201.GetInvoiceByClientUsecase(gh<_i178.SupportTabRepo>()));
  gh.lazySingleton<_i202.ReceiveDeviceUsecase>(
      () => _i202.ReceiveDeviceUsecase(gh<_i178.SupportTabRepo>()));
  gh.lazySingleton<_i203.ReturnInvoiceApproveUsecase>(
      () => _i203.ReturnInvoiceApproveUsecase(gh<_i178.SupportTabRepo>()));
  gh.lazySingleton<_i204.SetDateDoneUsecase>(
      () => _i204.SetDateDoneUsecase(gh<_i178.SupportTabRepo>()));
  gh.lazySingleton<_i205.SetReadyInstallUsecase>(
      () => _i205.SetReadyInstallUsecase(gh<_i178.SupportTabRepo>()));
  gh.lazySingleton<_i206.GetAllUsersUseCase>(
      () => _i206.GetAllUsersUseCase(gh<_i135.InvoicesSectionRepo>()));
  gh.lazySingleton<_i207.ClientsDebtsRepo>(
      () => _i208.ClientsDebtsRepoImpl(gh<_i47.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i209.PeriodicCommunicationRepo>(() =>
      _i210.PeriodicCommunicationRepoImpl(
          gh<_i40.PeriodicCommunicationDatasource>()));
  gh.factory<_i211.ImportantLinksRepo>(
      () => _i212.ImportantLinksRepoImpl(gh<_i63.ImportantLinksDatasource>()));
  gh.factory<_i213.ExportClientsToExcelUseCase>(() =>
      _i213.ExportClientsToExcelUseCase(gh<_i61.ClientsListDatasource>()));
  gh.lazySingleton<_i214.GetClientLogsUsecase>(
      () => _i214.GetClientLogsUsecase(gh<_i104.ClientLogsTabRepo>()));
  gh.lazySingleton<_i215.SupportClientsInvoicesRepo>(() =>
      _i216.SupportClientsInvoicesRepoImpl(
          gh<_i55.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i217.GetBranchesForUserUsecase>(
      () => _i217.GetBranchesForUserUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i218.GetLevelsForUserUsecase>(
      () => _i218.GetLevelsForUserUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i219.GetManagesForUserUsecase>(
      () => _i219.GetManagesForUserUsecase(gh<_i81.UsersRepository>()));
  gh.factory<_i220.GetUsersUsecase>(
      () => _i220.GetUsersUsecase(gh<_i81.UsersRepository>()));
  gh.factory<_i221.GetUserByIdUsecase>(
      () => _i221.GetUserByIdUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i222.GetSupportClientsInvoicesUseCase>(() =>
      _i222.GetSupportClientsInvoicesUseCase(
          gh<_i215.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i223.ManageWithdrawalsRepository>(() =>
      _i224.ManageWithdrawalsRepositoryImpl(
          gh<_i44.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i225.AgentsDistributorsRepo>(() =>
      _i226.AgentsDistributorsRepoImpl(
          gh<_i99.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i227.GetProductsSalesReportsUsecase>(() =>
      _i227.GetProductsSalesReportsUsecase(
          gh<_i142.ProductsSalesReportsRepo>()));
  gh.singleton<_i228.CitiesCubit>(
      () => _i228.CitiesCubit(gh<_i116.GetCitiesUseCase>()));
  gh.lazySingleton<_i229.GetNotUsingSystemUsecase>(
      () => _i229.GetNotUsingSystemUsecase(gh<_i35.NotUsingSystemRepo>()));
  gh.factory<_i230.UsersTypeCubit>(
      () => _i230.UsersTypeCubit(gh<_i110.GetUsersUsecase>()));
  gh.factory<_i231.ClientsListRepository>(
      () => _i232.ClientsListRepositoryImpl(gh<_i61.ClientsListDatasource>()));
  gh.factory<_i233.AddParticipateCommentUsecase>(() =>
      _i233.AddParticipateCommentUsecase(
          gh<_i130.ParticipateListRepository>()));
  gh.factory<_i234.AddParticipateUserUsecase>(() =>
      _i234.AddParticipateUserUsecase(gh<_i130.ParticipateListRepository>()));
  gh.factory<_i235.EditParticipateUserUsecase>(() =>
      _i235.EditParticipateUserUsecase(gh<_i130.ParticipateListRepository>()));
  gh.factory<_i236.ParticipateClientListUsecase>(() =>
      _i236.ParticipateClientListUsecase(
          gh<_i130.ParticipateListRepository>()));
  gh.factory<_i237.ParticipateCommentListUsecase>(() =>
      _i237.ParticipateCommentListUsecase(
          gh<_i130.ParticipateListRepository>()));
  gh.factory<_i238.GetParticipateInvoiceByIdUsecase>(() =>
      _i238.GetParticipateInvoiceByIdUsecase(
          gh<_i130.ParticipateListRepository>()));
  gh.factory<_i239.ParticipateInvoiceListUsecase>(() =>
      _i239.ParticipateInvoiceListUsecase(
          gh<_i130.ParticipateListRepository>()));
  gh.factory<_i240.ParticipateListUsecase>(() =>
      _i240.ParticipateListUsecase(gh<_i130.ParticipateListRepository>()));
  gh.lazySingleton<_i241.ChangeParticipateStatusUsecase>(() =>
      _i241.ChangeParticipateStatusUsecase(
          gh<_i130.ParticipateListRepository>()));
  gh.factory<_i242.PendingInvoicesCubit>(
      () => _i242.PendingInvoicesCubit(gh<_i111.GetPendingInvoicesUsecase>()));
  gh.factory<_i243.EvaluationLevelReportCubit>(() =>
      _i243.EvaluationLevelReportCubit(
          gh<_i96.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i244.GetEmployeesSalesReportsUsecase>(() =>
      _i244.GetEmployeesSalesReportsUsecase(
          gh<_i126.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i245.GetGreetingCommunicationUseCase>(() =>
      _i245.GetGreetingCommunicationUseCase(
          gh<_i153.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i246.ClientsTransferApprovalsRepo>(() =>
      _i247.ClientsTransferApprovalsRepoImpl(
          gh<_i57.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i248.GetDeletedInvoicesUsecase>(
      () => _i248.GetDeletedInvoicesUsecase(gh<_i173.DeletedInvoicesRepo>()));
  gh.lazySingleton<_i249.GetClientsStatusReportsUsecase>(() =>
      _i249.GetClientsStatusReportsUsecase(
          gh<_i146.ClientsStatusReportsRepo>()));
  gh.factory<_i250.ActionLinkUsecase>(
      () => _i250.ActionLinkUsecase(gh<_i211.ImportantLinksRepo>()));
  gh.factory<_i251.GetImportantLinksUsecase>(
      () => _i251.GetImportantLinksUsecase(gh<_i211.ImportantLinksRepo>()));
  gh.lazySingleton<_i252.GetPreviousRatingsUsecase>(
      () => _i252.GetPreviousRatingsUsecase(gh<_i102.PreviousRatingsRepo>()));
  gh.lazySingleton<_i253.WaitingAgentsRepo>(
      () => _i254.WaitingAgentsRepoImpl(gh<_i138.WaitingAgentsDataSource>()));
  gh.factory<_i255.AddClientUserUsecase>(
      () => _i255.AddClientUserUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i256.ApproveRejectClientUsecase>(() =>
      _i256.ApproveRejectClientUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i257.ChangeTypeClientUsecase>(
      () => _i257.ChangeTypeClientUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i258.EditClientUserUsecase>(
      () => _i258.EditClientUserUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i259.GetClientsListByRegionUseCase>(() =>
      _i259.GetClientsListByRegionUseCase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i260.GetClientsListByUserUseCase>(() =>
      _i260.GetClientsListByUserUseCase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i261.GetClientsWithFilterUserUsecase>(() =>
      _i261.GetClientsWithFilterUserUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i262.GetClientMarketingReportUsecase>(() =>
      _i262.GetClientMarketingReportUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i263.GetRecommendedClientsUsecase>(() =>
      _i263.GetRecommendedClientsUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i264.GetSimilarClientsUsecase>(
      () => _i264.GetSimilarClientsUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i265.ReceiveClientUserUsecase>(
      () => _i265.ReceiveClientUserUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i266.TransferClientUserUsecase>(
      () => _i266.TransferClientUserUsecase(gh<_i231.ClientsListRepository>()));
  gh.lazySingleton<_i267.GetHighSimilarClientsUsecase>(() =>
      _i267.GetHighSimilarClientsUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i268.EmployeesSalesReportsCubit>(() =>
      _i268.EmployeesSalesReportsCubit(
          gh<_i244.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i269.ChangeStateAgentUseCase>(
      () => _i269.ChangeStateAgentUseCase(gh<_i225.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i270.GetAgentsAndDistributorsUseCase>(() =>
      _i270.GetAgentsAndDistributorsUseCase(
          gh<_i225.AgentsDistributorsRepo>()));
  gh.factory<_i271.ClientsAcceptCubit>(
      () => _i271.ClientsAcceptCubit(gh<_i185.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i272.CancelWithdrawalUsecase>(() =>
      _i272.CancelWithdrawalUsecase(gh<_i223.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i273.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i273.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i223.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i274.GetWithdrawalsInvoicesUsecase>(() =>
      _i274.GetWithdrawalsInvoicesUsecase(
          gh<_i223.ManageWithdrawalsRepository>()));
  gh.factory<_i275.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i275.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i223.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i276.ExceededClientsUseCase>(
      () => _i276.ExceededClientsUseCase(gh<_i91.ExceededClientsRepo>()));
  gh.lazySingleton<_i277.TransferExceededClientsUseCase>(() =>
      _i277.TransferExceededClientsUseCase(gh<_i91.ExceededClientsRepo>()));
  gh.factory<_i278.ParticipateListBloc>(() => _i278.ParticipateListBloc(
        gh<_i240.ParticipateListUsecase>(),
        gh<_i234.AddParticipateUserUsecase>(),
        gh<_i235.EditParticipateUserUsecase>(),
        gh<_i236.ParticipateClientListUsecase>(),
        gh<_i239.ParticipateInvoiceListUsecase>(),
        gh<_i238.GetParticipateInvoiceByIdUsecase>(),
        gh<_i237.ParticipateCommentListUsecase>(),
        gh<_i233.AddParticipateCommentUsecase>(),
        gh<_i241.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i279.LoginLocalDataSource>(() =>
      _i279.LoginLocalDataSourceImpl(
          gh<_i155.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i280.EditAdvancedConfigsUsecase>(() =>
      _i280.EditAdvancedConfigsUsecase(gh<_i128.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i281.GetAdvancedConfigsUsecase>(() =>
      _i281.GetAdvancedConfigsUsecase(gh<_i128.AdvancedConfigsRepository>()));
  gh.factory<_i282.ClientsInstallReportsCubit>(() =>
      _i282.ClientsInstallReportsCubit(
          gh<_i101.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i283.DatesTableRepo>(
      () => _i284.DatesTableRepoImpl(gh<_i148.DatesTableDataSource>()));
  gh.factory<_i285.GetVersionUseCase>(
      () => _i285.GetVersionUseCase(gh<_i166.AppRepository>()));
  gh.factory<_i286.AddTicketCubit>(
      () => _i286.AddTicketCubit(gh<_i117.AddTicketUseCase>()));
  gh.lazySingleton<_i287.LatestClientsUpdatesRepository>(() =>
      _i288.LatestClientsUpdatesRepositoryImpl(
          gh<_i132.LatestClientsUpdatesDatasource>()));
  gh.factory<_i289.TaskRepository>(
      () => _i290.TaskRepositoryImpl(gh<_i100.TaskDatasource>()));
  gh.lazySingleton<_i291.EditGeneralConfigsUsecase>(() =>
      _i291.EditGeneralConfigsUsecase(gh<_i186.GeneralConfigsRepository>()));
  gh.lazySingleton<_i292.GetGeneralConfigsUsecase>(() =>
      _i292.GetGeneralConfigsUsecase(gh<_i186.GeneralConfigsRepository>()));
  gh.factory<_i293.PeriodicCommunicationReportsCubit>(() =>
      _i293.PeriodicCommunicationReportsCubit(
          gh<_i191.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i294.InstallQualityCubit>(
      () => _i294.InstallQualityCubit(gh<_i196.GetInstallUseCase>()));
  gh.factory<_i295.ImportantLinksCubit>(() => _i295.ImportantLinksCubit(
        gh<_i251.GetImportantLinksUsecase>(),
        gh<_i250.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i296.AddAgentUseCase>(
      () => _i296.AddAgentUseCase(gh<_i170.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i297.UpdateAgentUseCase>(() =>
      _i297.UpdateAgentUseCase(gh<_i170.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i298.GetDelayInstallReportsUseCase>(() =>
      _i298.GetDelayInstallReportsUseCase(gh<_i164.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i299.CrudAgentSupportFilesUsecase>(() =>
      _i299.CrudAgentSupportFilesUsecase(
          gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i300.GetClientsTransferApprovalsUsecase>(() =>
      _i300.GetClientsTransferApprovalsUsecase(
          gh<_i246.ClientsTransferApprovalsRepo>()));
  gh.factory<_i301.ClientsStatusReportsCubit>(() =>
      _i301.ClientsStatusReportsCubit(
          gh<_i249.GetClientsStatusReportsUsecase>()));
  gh.factory<_i302.SupportTabCubit>(() => _i302.SupportTabCubit(
        gh<_i201.GetInvoiceByClientUsecase>(),
        gh<_i199.AddDateInstallUsecase>(),
        gh<_i204.SetDateDoneUsecase>(),
        gh<_i205.SetReadyInstallUsecase>(),
        gh<_i203.ReturnInvoiceApproveUsecase>(),
        gh<_i202.ReceiveDeviceUsecase>(),
        gh<_i200.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i303.ClientsDebtsReportsCubit>(() =>
      _i303.ClientsDebtsReportsCubit(
          gh<_i152.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i304.DeletedInvoicesCubit>(
      () => _i304.DeletedInvoicesCubit(gh<_i248.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i305.AddAgentDateUseCase>(() =>
      _i305.AddAgentDateUseCase(gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i306.GetManageWithdrawnInvoicesUsecase>(() =>
      _i306.GetManageWithdrawnInvoicesUsecase(
          gh<_i157.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i307.NotificationsCubit>(() => _i307.NotificationsCubit(
        gh<_i188.GetNotificationsUsecase>(),
        gh<_i190.MarkNotificationsAsReadUsecase>(),
        gh<_i189.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i308.WithdrawnInvoicesRepo>(() =>
      _i309.WithdrawnInvoicesRepoImpl(gh<_i134.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i310.RegionsRepository>(
      () => _i311.RegionsRepositoryImpl(gh<_i150.RegionsDatasource>()));
  gh.factory<_i312.ClientLogsTabCubit>(
      () => _i312.ClientLogsTabCubit(gh<_i214.GetClientLogsUsecase>()));
  gh.factory<_i313.RegionsSalesReportsCubit>(() =>
      _i313.RegionsSalesReportsCubit(
          gh<_i176.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i314.AgentsDistributorsActionsCubit>(
      () => _i314.AgentsDistributorsActionsCubit(
            gh<_i116.GetCitiesUseCase>(),
            gh<_i296.AddAgentUseCase>(),
            gh<_i297.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i315.FetchPaginatedClientsUsecase>(() =>
      _i315.FetchPaginatedClientsUsecase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i316.FetchLinkClientsUseCase>(
      () => _i316.FetchLinkClientsUseCase(gh<_i231.ClientsListRepository>()));
  gh.factory<_i317.LinkSelectedClientsUseCase>(() =>
      _i317.LinkSelectedClientsUseCase(gh<_i231.ClientsListRepository>()));
  gh.lazySingleton<_i318.LoginRepo>(() => _i319.LoginRepoImpl(
        gh<_i125.LoginRemoteDataSource>(),
        gh<_i279.LoginLocalDataSource>(),
      ));
  gh.factory<_i320.SpecialClientsBloc>(
      () => _i320.SpecialClientsBloc(gh<_i180.GetSpecialClientsUsecase>()));
  gh.factory<_i321.AddCommentUsecase>(
      () => _i321.AddCommentUsecase(gh<_i193.CompanyRepository>()));
  gh.factory<_i322.GetCommentUsecase>(
      () => _i322.GetCommentUsecase(gh<_i193.CompanyRepository>()));
  gh.factory<_i323.DelayInstallReportsCubit>(() =>
      _i323.DelayInstallReportsCubit(
          gh<_i298.GetDelayInstallReportsUseCase>()));
  gh.factory<_i324.GreetingCommunicationCubit>(() =>
      _i324.GreetingCommunicationCubit(
          gh<_i245.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i325.GetRegionsUseCase>(
      () => _i325.GetRegionsUseCase(gh<_i310.RegionsRepository>()));
  gh.lazySingleton<_i326.GetLatestClientsUseCase>(() =>
      _i326.GetLatestClientsUseCase(
          gh<_i287.LatestClientsUpdatesRepository>()));
  gh.factory<_i327.AdvancedCofigsCubit>(() => _i327.AdvancedCofigsCubit(
        gh<_i281.GetAdvancedConfigsUsecase>(),
        gh<_i280.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i328.SupportClientsInvoicesCubit>(() =>
      _i328.SupportClientsInvoicesCubit(
          gh<_i222.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i329.WrongNumbersCubit>(
      () => _i329.WrongNumbersCubit(gh<_i184.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i330.CacheTokenUsecase>(
      () => _i330.CacheTokenUsecase(gh<_i318.LoginRepo>()));
  gh.lazySingleton<_i331.GetTokenUsecase>(
      () => _i331.GetTokenUsecase(gh<_i318.LoginRepo>()));
  gh.lazySingleton<_i332.LoginUsecase>(
      () => _i332.LoginUsecase(gh<_i318.LoginRepo>()));
  gh.lazySingleton<_i333.ValidateTokenUsecase>(
      () => _i333.ValidateTokenUsecase(gh<_i318.LoginRepo>()));
  gh.lazySingleton<_i334.VerifyOtpUsecase>(
      () => _i334.VerifyOtpUsecase(gh<_i318.LoginRepo>()));
  gh.factory<_i335.ClientsTransferApprovalsCubit>(() =>
      _i335.ClientsTransferApprovalsCubit(
          gh<_i300.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i336.RegionsCubit>(
      () => _i336.RegionsCubit(gh<_i325.GetRegionsUseCase>()));
  gh.factory<_i337.GeneralCofigsCubit>(() => _i337.GeneralCofigsCubit(
        gh<_i292.GetGeneralConfigsUsecase>(),
        gh<_i291.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i338.GetPeriodicCommunicationUseCase>(() =>
      _i338.GetPeriodicCommunicationUseCase(
          gh<_i209.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i339.GetClientsDebtsUsecase>(
      () => _i339.GetClientsDebtsUsecase(gh<_i207.ClientsDebtsRepo>()));
  gh.lazySingleton<_i340.CrudClientSupportFilesUsecase>(() =>
      _i340.CrudClientSupportFilesUsecase(
          repository: gh<_i231.ClientsListRepository>()));
  gh.lazySingleton<_i341.GetClientSupportFilesUsecase>(() =>
      _i341.GetClientSupportFilesUsecase(
          repository: gh<_i231.ClientsListRepository>()));
  gh.factory<_i342.BranchesCubit>(
      () => _i342.BranchesCubit(gh<_i192.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i343.AddAgentCommentUsecase>(() =>
      _i343.AddAgentCommentUsecase(gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i344.DoneTrainingUsecase>(() =>
      _i344.DoneTrainingUsecase(gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i345.GetAgentByIdUsecase>(() =>
      _i345.GetAgentByIdUsecase(gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i346.GetAgentClientListUsecase>(() =>
      _i346.GetAgentClientListUsecase(
          gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i347.GetAgentCommentsListUsecase>(() =>
      _i347.GetAgentCommentsListUsecase(
          gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i348.GetAgentDatesListUsecase>(() =>
      _i348.GetAgentDatesListUsecase(
          gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i349.GetAgentInvoiceListUsecase>(() =>
      _i349.GetAgentInvoiceListUsecase(
          gh<_i197.AgentsDistributorsProfileRepo>()));
  gh.factory<_i350.AddRejectReasonsUsecase>(() =>
      _i350.AddRejectReasonsUsecase(gh<_i223.ManageWithdrawalsRepository>()));
  gh.factory<_i351.EditRejectReasonsUsecase>(() =>
      _i351.EditRejectReasonsUsecase(gh<_i223.ManageWithdrawalsRepository>()));
  gh.factory<_i352.GetRejectReasonsUsecase>(() =>
      _i352.GetRejectReasonsUsecase(gh<_i223.ManageWithdrawalsRepository>()));
  gh.factory<_i353.GetUserSeriesUsecase>(() =>
      _i353.GetUserSeriesUsecase(gh<_i223.ManageWithdrawalsRepository>()));
  gh.factory<_i354.GetWithdrawnDetailsUsecase>(() =>
      _i354.GetWithdrawnDetailsUsecase(
          gh<_i223.ManageWithdrawalsRepository>()));
  gh.factory<_i355.SetApproveSeriesUsecase>(() =>
      _i355.SetApproveSeriesUsecase(gh<_i223.ManageWithdrawalsRepository>()));
  gh.factory<_i356.UpdateSeriesUsecase>(
      () => _i356.UpdateSeriesUsecase(gh<_i223.ManageWithdrawalsRepository>()));
  gh.factory<_i357.NotUsingSystemCubit>(
      () => _i357.NotUsingSystemCubit(gh<_i229.GetNotUsingSystemUsecase>()));
  gh.singleton<_i358.AppManagerCubit>(
      () => _i358.AppManagerCubit(gh<_i285.GetVersionUseCase>()));
  gh.lazySingleton<_i359.GetWaitingAgentsUsecase>(
      () => _i359.GetWaitingAgentsUsecase(gh<_i253.WaitingAgentsRepo>()));
  gh.factory<_i360.InvoicesSectionCubit>(() => _i360.InvoicesSectionCubit(
        gh<_i182.GetInvoicesByPrivilegesUsecase>(),
        gh<_i270.GetAgentsAndDistributorsUseCase>(),
        gh<_i240.ParticipateListUsecase>(),
        gh<_i206.GetAllUsersUseCase>(),
        gh<_i183.GetInvoiceByIdUsecase>(),
        gh<_i181.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i361.ProductsSalesReportsCubit>(() =>
      _i361.ProductsSalesReportsCubit(
          gh<_i227.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i362.GetWithdrawnInvoicesUsecase>(() =>
      _i362.GetWithdrawnInvoicesUsecase(gh<_i308.WithdrawnInvoicesRepo>()));
  gh.factory<_i363.PreviousRatingsCubit>(
      () => _i363.PreviousRatingsCubit(gh<_i252.GetPreviousRatingsUsecase>()));
  gh.factory<_i364.AgentsDistributorsCubit>(() => _i364.AgentsDistributorsCubit(
        gh<_i270.GetAgentsAndDistributorsUseCase>(),
        gh<_i269.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i365.ExceededClientsCubit>(() => _i365.ExceededClientsCubit(
        gh<_i276.ExceededClientsUseCase>(),
        gh<_i277.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i366.ManageWithdrawalsCubit>(() => _i366.ManageWithdrawalsCubit(
        gh<_i353.GetUserSeriesUsecase>(),
        gh<_i356.UpdateSeriesUsecase>(),
        gh<_i220.GetUsersUsecase>(),
        gh<_i274.GetWithdrawalsInvoicesUsecase>(),
        gh<_i275.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i355.SetApproveSeriesUsecase>(),
        gh<_i354.GetWithdrawnDetailsUsecase>(),
        gh<_i350.AddRejectReasonsUsecase>(),
        gh<_i352.GetRejectReasonsUsecase>(),
        gh<_i351.EditRejectReasonsUsecase>(),
        gh<_i273.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i272.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i367.ManageWithdrawnInvoicesCubit>(() =>
      _i367.ManageWithdrawnInvoicesCubit(
          gh<_i306.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i368.LatestClientsUpdatesCubit>(() =>
      _i368.LatestClientsUpdatesCubit(gh<_i326.GetLatestClientsUseCase>()));
  gh.factory<_i369.AttachmentsRowCubit>(() => _i369.AttachmentsRowCubit(
        gh<_i341.GetClientSupportFilesUsecase>(),
        gh<_i340.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i370.CancelScheduleUsecase>(
      () => _i370.CancelScheduleUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i371.ChangeDateToDonUsecase>(
      () => _i371.ChangeDateToDonUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i372.GetCancelReasonsUsecase>(
      () => _i372.GetCancelReasonsUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i373.GetDateInstallationUsecase>(
      () => _i373.GetDateInstallationUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i374.GetInvoicesByClientForDateUsecase>(() =>
      _i374.GetInvoicesByClientForDateUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i375.GetSubscribedClientsUsecase>(
      () => _i375.GetSubscribedClientsUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i376.RescheduleDateUsecase>(
      () => _i376.RescheduleDateUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i377.ReturnScheduleVisitToOpenUsecase>(
      () => _i377.ReturnScheduleVisitToOpenUsecase(gh<_i283.DatesTableRepo>()));
  gh.factory<_i378.AddTaskUsecase>(
      () => _i378.AddTaskUsecase(gh<_i289.TaskRepository>()));
  gh.factory<_i379.ChangeStatusTaskUsecase>(
      () => _i379.ChangeStatusTaskUsecase(gh<_i289.TaskRepository>()));
  gh.factory<_i380.GetTasksUsecase>(
      () => _i380.GetTasksUsecase(gh<_i289.TaskRepository>()));
  gh.factory<_i381.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i381.GetUsersByDepartmentAndRegionUsecase(gh<_i289.TaskRepository>()));
  gh.lazySingleton<_i382.TaskCubit>(() => _i382.TaskCubit(
        gh<_i378.AddTaskUsecase>(),
        gh<_i380.GetTasksUsecase>(),
        gh<_i379.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i383.UsersCubit>(() => _i383.UsersCubit(
        gh<_i220.GetUsersUsecase>(),
        gh<_i221.GetUserByIdUsecase>(),
        gh<_i93.ActionUserUsecase>(),
        gh<_i381.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i219.GetManagesForUserUsecase>(),
        gh<_i218.GetLevelsForUserUsecase>(),
        gh<_i217.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i384.CompanyCubit>(() => _i384.CompanyCubit(
        gh<_i322.GetCommentUsecase>(),
        gh<_i321.AddCommentUsecase>(),
      ));
  gh.factory<_i385.ClientsDebtsCubit>(
      () => _i385.ClientsDebtsCubit(gh<_i339.GetClientsDebtsUsecase>()));
  gh.factory<_i386.PeriodicCommunicationCubit>(() =>
      _i386.PeriodicCommunicationCubit(
          gh<_i338.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i387.LoginCubit>(() => _i387.LoginCubit(
        gh<_i332.LoginUsecase>(),
        gh<_i334.VerifyOtpUsecase>(),
        gh<_i330.CacheTokenUsecase>(),
        gh<_i331.GetTokenUsecase>(),
        gh<_i333.ValidateTokenUsecase>(),
      ));
  gh.factory<_i388.AgentsDistributorsProfileBloc>(
      () => _i388.AgentsDistributorsProfileBloc(
            gh<_i345.GetAgentByIdUsecase>(),
            gh<_i346.GetAgentClientListUsecase>(),
            gh<_i349.GetAgentInvoiceListUsecase>(),
            gh<_i238.GetParticipateInvoiceByIdUsecase>(),
            gh<_i347.GetAgentCommentsListUsecase>(),
            gh<_i343.AddAgentCommentUsecase>(),
            gh<_i344.DoneTrainingUsecase>(),
            gh<_i305.AddAgentDateUseCase>(),
            gh<_i348.GetAgentDatesListUsecase>(),
            gh<_i299.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i389.DatesTableCubit>(() => _i389.DatesTableCubit(
        gh<_i373.GetDateInstallationUsecase>(),
        gh<_i376.RescheduleDateUsecase>(),
        gh<_i371.ChangeDateToDonUsecase>(),
        gh<_i370.CancelScheduleUsecase>(),
        gh<_i377.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i375.GetSubscribedClientsUsecase>(),
        gh<_i374.GetInvoicesByClientForDateUsecase>(),
        gh<_i199.AddDateInstallUsecase>(),
        gh<_i372.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i390.WithdrawnInvoicesCubit>(() =>
      _i390.WithdrawnInvoicesCubit(gh<_i362.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i391.ClientsListBloc>(() => _i391.ClientsListBloc(
        gh<_i261.GetClientsWithFilterUserUsecase>(),
        gh<_i263.GetRecommendedClientsUsecase>(),
        gh<_i264.GetSimilarClientsUsecase>(),
        gh<_i255.AddClientUserUsecase>(),
        gh<_i258.EditClientUserUsecase>(),
        gh<_i257.ChangeTypeClientUsecase>(),
        gh<_i256.ApproveRejectClientUsecase>(),
        gh<_i340.CrudClientSupportFilesUsecase>(),
        gh<_i341.GetClientSupportFilesUsecase>(),
        gh<_i266.TransferClientUserUsecase>(),
        gh<_i265.ReceiveClientUserUsecase>(),
        gh<_i262.GetClientMarketingReportUsecase>(),
        gh<_i267.GetHighSimilarClientsUsecase>(),
        gh<_i316.FetchLinkClientsUseCase>(),
        gh<_i315.FetchPaginatedClientsUsecase>(),
        gh<_i317.LinkSelectedClientsUseCase>(),
        gh<_i213.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i392.WaitingAgentsCubit>(
      () => _i392.WaitingAgentsCubit(gh<_i359.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i393.AppModule {}
