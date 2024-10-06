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
    as _i168;
import '../../../features/app/domain/repositories/app_repository.dart' as _i167;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i286;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i359;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i280;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i126;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i320;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i319;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i331;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i332;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i333;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i334;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i335;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i388;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i31;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i47;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i46;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i186;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i272;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i28;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i91;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i90;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i113;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i178;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i25;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i37;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i36;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i230;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i358;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i55;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i69;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i118;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i119;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i120;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i122;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i121;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i123;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i287;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i146;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i124;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i27;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i39;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i38;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i185;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i330;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i11;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i51;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i50;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i97;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i244;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i18;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i155;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i154;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i246;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i325;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i52;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i162;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i161;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i197;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i295;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i41;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i211;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i210;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i339;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i387;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i33;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i44;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i43;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i192;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i294;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i26;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i104;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i103;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i253;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i364;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i61;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i141;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i140;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i181;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i321;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i89;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i96;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i95;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i193;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i343;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i66;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i116;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i115;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i117;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i229;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i72;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i106;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i105;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i215;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i313;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i110;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i180;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i179;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i200;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i201;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i202;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i203;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i204;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i205;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i206;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i303;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i151;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i312;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i311;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i326;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i337;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i65;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i81;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i80;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i111;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i231;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i3;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i67;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i130;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i129;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i281;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i282;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i328;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i84;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i188;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i187;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i292;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i293;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i338;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i17;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i54;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i53;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i108;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i109;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i125;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i14;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i164;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i163;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i170;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i169;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i196;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i57;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i83;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i82;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i94;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i218;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i219;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i220;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i222;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i221;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i384;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i45;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i225;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i224;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i351;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i273;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i352;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i274;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i353;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i354;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i276;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i275;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i355;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i356;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i357;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i367;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i30;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i29;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i189;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i190;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i191;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i308;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i48;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i209;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i208;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i340;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i386;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i62;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i35;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i233;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i232;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i256;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i257;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i258;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i341;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i259;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i214;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i317;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i316;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i263;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i342;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i260;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i261;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i262;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i268;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i264;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i265;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i318;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i266;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i267;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i392;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i58;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i248;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i247;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i301;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i336;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i49;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i86;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i85;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i142;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i173;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i133;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i289;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i288;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i327;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i369;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i13;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i88;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i87;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i112;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i243;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i63;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i195;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i194;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i322;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i323;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i385;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i107;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i175;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i174;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i249;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i305;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i59;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i93;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i92;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i277;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i278;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i366;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i114;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i137;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i136;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i182;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i207;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i184;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i183;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i361;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i134;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i159;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i158;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i307;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i368;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i19;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i100;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i145;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i172;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i199;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i227;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i198;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i226;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i344;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i306;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i297;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i270;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i300;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i345;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i346;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i347;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i348;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i349;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i350;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i271;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i298;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i315;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i389;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i365;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i64;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i213;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i212;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i251;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i252;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i296;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i40;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i132;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i131;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i234;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i235;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i242;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i236;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i237;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i238;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i239;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i240;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i241;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i279;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i74;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i73;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i153;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i304;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i32;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i148;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i147;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i250;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i302;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i42;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i128;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i127;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i245;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i269;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i16;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i144;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i143;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i228;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i362;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i71;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i70;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i177;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i314;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i135;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i310;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i309;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i363;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i391;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i22;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i99;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i98;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i102;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i283;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i149;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i285;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i284;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i371;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i372;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i373;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i374;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i375;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i376;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i377;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i378;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i390;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i12;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i78;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i77;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i150;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i176;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i34;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i166;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i165;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i299;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i324;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i10;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i76;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i75;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i79;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i138;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i56;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i217;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i216;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i223;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i329;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i139;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i255;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i254;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i360;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i393;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i101;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i291;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i290;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i379;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i380;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i381;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i382;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i383;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i370;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i156;
import '../cache_services/prefs_consumer.dart' as _i160;
import '../cache_services/secure_storage_consumer.dart' as _i157;
import '../maps/location_services.dart' as _i152;
import 'di_container.dart' as _i394;

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
  gh.lazySingleton<_i73.ClientsDebtsReportsRepo>(() =>
      _i74.ClientsDebtsReportsRepoImpl(
          gh<_i24.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i75.SupportClientsAcceptRepository>(() =>
      _i76.SupportClientsAcceptRepositoryImpl(
          gh<_i10.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i77.DelayAfterInstallRepo>(() =>
      _i78.DelayAfterInstallRepoImpl(gh<_i12.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i79.GetSupportClientsAcceptUseCase>(() =>
      _i79.GetSupportClientsAcceptUseCase(
          gh<_i75.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i80.UsersRepository>(
      () => _i81.UsersRepositoryImpl(gh<_i65.UsersDatasource>()));
  gh.lazySingleton<_i82.UsersRepository>(
      () => _i83.UsersRepositoryImpl(gh<_i57.UsersDatasource>()));
  gh.lazySingleton<_i84.GeneralConfigsDatasource>(
      () => _i84.GeneralConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i85.FinancePendingRepo>(
      () => _i86.FinancePendingRepoImpl(gh<_i49.FinancePendingDatasource>()));
  gh.lazySingleton<_i87.PendingInvoicesRepo>(
      () => _i88.PendingInvoicesRepoImpl(gh<_i13.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i89.BranchesDatasource>(
      () => _i89.BranchesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i90.ClientsCareReportsRepo>(() =>
      _i91.ClientsCareReportsRepoImpl(gh<_i28.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i92.ExceededClientsRepo>(
      () => _i93.ExceededClientsRepoImpl(gh<_i59.ExceededClientsDatasource>()));
  gh.factory<_i94.ActionUserUsecase>(
      () => _i94.ActionUserUsecase(gh<_i82.UsersRepository>()));
  gh.lazySingleton<_i95.BranchesRepository>(
      () => _i96.BranchesRepositoryImpl(gh<_i89.BranchesDatasource>()));
  gh.lazySingleton<_i97.GetEvaluationLevelReportUsecase>(() =>
      _i97.GetEvaluationLevelReportUsecase(
          gh<_i50.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i98.ClientsInstallReportsRepo>(() =>
      _i99.ClientsInstallReportsRepoImpl(
          gh<_i22.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i100.AgentsDistributorsDataSource>(
      () => _i100.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i101.TaskDatasource>(
      () => _i101.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i102.GetClientsInstallReportsUsecase>(() =>
      _i102.GetClientsInstallReportsUsecase(
          gh<_i98.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i103.PreviousRatingsRepo>(() =>
      _i104.PreviousRatingsRepoImpl(gh<_i26.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i105.ClientLogsTabRepo>(
      () => _i106.ClientLogsTabRepoImpl(gh<_i72.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i107.DeletedInvoicesDatasource>(
      () => _i107.DeletedInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i108.AddLevelUsecase>(
      () => _i108.AddLevelUsecase(gh<_i53.LevelsRepo>()));
  gh.lazySingleton<_i109.GetLevelsUsecase>(
      () => _i109.GetLevelsUsecase(gh<_i53.LevelsRepo>()));
  gh.lazySingleton<_i110.SupportTabDataSource>(
      () => _i110.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i111.GetUsersUsecase>(
      () => _i111.GetUsersUsecase(gh<_i80.UsersRepository>()));
  gh.lazySingleton<_i112.GetPendingInvoicesUsecase>(
      () => _i112.GetPendingInvoicesUsecase(gh<_i87.PendingInvoicesRepo>()));
  gh.lazySingleton<_i113.GetClientsCareReportsUsecase>(() =>
      _i113.GetClientsCareReportsUsecase(gh<_i90.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i114.InvoicesTabDataSource>(
      () => _i114.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i115.CitiesRepository>(
      () => _i116.CitiesRepositoryImpl(gh<_i66.CitiesDatasource>()));
  gh.lazySingleton<_i117.GetCitiesUseCase>(
      () => _i117.GetCitiesUseCase(gh<_i115.CitiesRepository>()));
  gh.lazySingleton<_i118.AddTicketUseCase>(
      () => _i118.AddTicketUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i119.EditTicketTypeUseCase>(
      () => _i119.EditTicketTypeUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i120.GetClientTicketsUseCase>(
      () => _i120.GetClientTicketsUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i121.GetTicketsUseCase>(
      () => _i121.GetTicketsUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i122.GetTicketByIdUseCase>(
      () => _i122.GetTicketByIdUseCase(gh<_i68.TicketsRepo>()));
  gh.lazySingleton<_i123.TransferTicketUseCase>(
      () => _i123.TransferTicketUseCase(gh<_i68.TicketsRepo>()));
  gh.factory<_i124.TicketsCubit>(() => _i124.TicketsCubit(
        gh<_i121.GetTicketsUseCase>(),
        gh<_i122.GetTicketByIdUseCase>(),
        gh<_i120.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i125.LevelsCubit>(() => _i125.LevelsCubit(
        gh<_i109.GetLevelsUsecase>(),
        gh<_i108.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i126.LoginRemoteDataSource>(
      () => _i126.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i127.EmployeesSalesReportsRepo>(() =>
      _i128.EmployeesSalesReportsRepoImpl(
          gh<_i42.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i129.AdvancedConfigsRepository>(() =>
      _i130.AdvancedConfigsRepositoryImpl(
          gh<_i67.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i131.ParticipateListRepository>(() =>
      _i132.ParticipateListRepositoryImpl(
          gh<_i40.ParticipatesListDatasource>()));
  gh.lazySingleton<_i133.LatestClientsUpdatesDatasource>(
      () => _i133.LatestClientsUpdatesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i134.ManageWithdrawnInvoicesDataSource>(
      () => _i134.ManageWithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i135.WithdrawnInvoicesDataSource>(
      () => _i135.WithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i136.InvoicesSectionRepo>(
      () => _i137.InvoicesTabRepoImpl(gh<_i114.InvoicesTabDataSource>()));
  gh.factory<_i138.SupportClientsAcceptCubit>(() =>
      _i138.SupportClientsAcceptCubit(
          gh<_i79.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i139.WaitingAgentsDataSource>(
      () => _i139.WaitingAgentsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i140.SpecialClientsRepository>(() =>
      _i141.SpecialClientsRepositoryImpl(gh<_i61.SpecialClientsDatasource>()));
  gh.lazySingleton<_i142.GetFinancePendingInvoicesUsecase>(() =>
      _i142.GetFinancePendingInvoicesUsecase(gh<_i85.FinancePendingRepo>()));
  gh.lazySingleton<_i143.ProductsSalesReportsRepo>(() =>
      _i144.ProductsSalesReportsRepoImpl(
          gh<_i16.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i145.AgentsDistributorsProfileDataSource>(() =>
      _i145.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i146.EditTicketCubit>(() => _i146.EditTicketCubit(
        gh<_i119.EditTicketTypeUseCase>(),
        gh<_i123.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i147.ClientsStatusReportsRepo>(() =>
      _i148.ClientsStatusReportsRepoImpl(
          gh<_i32.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i149.DatesTableDataSource>(
      () => _i149.DatesTableDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i150.GetDelayAfterInstallUseCase>(() =>
      _i150.GetDelayAfterInstallUseCase(gh<_i77.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i151.RegionsDatasource>(
      () => _i151.RegionsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i152.LocationServices>(
      () => _i152.LocationServices(gh<_i7.Location>()));
  gh.lazySingleton<_i153.GetClientsDebtsReportsUsecase>(() =>
      _i153.GetClientsDebtsReportsUsecase(gh<_i73.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i154.GreetingCommunicationRepo>(() =>
      _i155.GreetingCommunicationRepoImpl(
          gh<_i18.GreetingCommunicationDatasource>()));
  gh.singleton<_i156.CacheServices>(
    () => _i157.SecureStorageConsumer(gh<_i21.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i158.ManageWithdrawnInvoicesRepo>(() =>
      _i159.ManageWithdrawnInvoicesRepoImpl(
          gh<_i134.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i156.CacheServices>(() async =>
      _i160.PrefsConsumer(await gh.getAsync<_i20.SharedPreferences>()));
  gh.lazySingleton<_i161.InstallQualityRepo>(
      () => _i162.InstallQualityRepoImpl(gh<_i52.InstallQualityDatasource>()));
  gh.lazySingleton<_i163.PrivilegesRepo>(
      () => _i164.PrivilegesRepoImpl(gh<_i14.PrivilegesDatasource>()));
  gh.lazySingleton<_i165.DelayInstallReportsRepo>(() =>
      _i166.DelayInstallReportsRepoImpl(
          gh<_i34.DelayInstallReportsDatasource>()));
  gh.factory<_i167.AppRepository>(
      () => _i168.AppRepositoryImpl(gh<_i60.AppDatasource>()));
  gh.factory<_i169.UpdatePrivilegesUsecase>(
      () => _i169.UpdatePrivilegesUsecase(gh<_i163.PrivilegesRepo>()));
  gh.lazySingleton<_i170.GetPrivilegesUsecase>(
      () => _i170.GetPrivilegesUsecase(gh<_i163.PrivilegesRepo>()));
  gh.lazySingleton<_i171.AgentsDistributorsActionsRepo>(() =>
      _i172.AgentsDistributorsActionsRepoImpl(
          gh<_i19.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i173.FinancePendingCubit>(() =>
      _i173.FinancePendingCubit(gh<_i142.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i174.DeletedInvoicesRepo>(() =>
      _i175.DeletedInvoicesRepoImpl(gh<_i107.DeletedInvoicesDatasource>()));
  gh.factory<_i176.DelayAfterInstallCubit>(() =>
      _i176.DelayAfterInstallCubit(gh<_i150.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i177.GetRegionsSalesReportsUsecase>(() =>
      _i177.GetRegionsSalesReportsUsecase(gh<_i70.RegionsSalesReportsRepo>()));
  gh.factory<_i178.ClientsCareReportsCubit>(() =>
      _i178.ClientsCareReportsCubit(gh<_i113.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i179.SupportTabRepo>(
      () => _i180.SupportTabRepoImpl(gh<_i110.SupportTabDataSource>()));
  gh.factory<_i181.GetSpecialClientsUsecase>(() =>
      _i181.GetSpecialClientsUsecase(gh<_i140.SpecialClientsRepository>()));
  gh.lazySingleton<_i182.ExportInvoicesToExcelUsecase>(() =>
      _i182.ExportInvoicesToExcelUsecase(gh<_i136.InvoicesSectionRepo>()));
  gh.lazySingleton<_i183.GetInvoicesByPrivilegesUsecase>(() =>
      _i183.GetInvoicesByPrivilegesUsecase(gh<_i136.InvoicesSectionRepo>()));
  gh.lazySingleton<_i184.GetInvoiceByIdUsecase>(
      () => _i184.GetInvoiceByIdUsecase(gh<_i136.InvoicesSectionRepo>()));
  gh.lazySingleton<_i185.GetWrongNumbersUsecase>(
      () => _i185.GetWrongNumbersUsecase(gh<_i38.WrongNumbersRepo>()));
  gh.lazySingleton<_i186.GetClientsAcceptUseCase>(
      () => _i186.GetClientsAcceptUseCase(gh<_i46.ClientsAcceptRepository>()));
  gh.lazySingleton<_i187.GeneralConfigsRepository>(() =>
      _i188.GeneralConfigsRepositoryImpl(gh<_i84.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i189.GetNotificationsUsecase>(
      () => _i189.GetNotificationsUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i190.GetUnreadNotificationsCountUsecase>(() =>
      _i190.GetUnreadNotificationsCountUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i191.MarkNotificationsAsReadUsecase>(
      () => _i191.MarkNotificationsAsReadUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i192.GetPeriodicCommunicationReportsUsecase>(() =>
      _i192.GetPeriodicCommunicationReportsUsecase(
          gh<_i43.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i193.GetBranchesByIdCountryUseCase>(
      () => _i193.GetBranchesByIdCountryUseCase(gh<_i95.BranchesRepository>()));
  gh.factory<_i194.CompanyRepository>(
      () => _i195.CompanyRepositoryImpl(gh<_i63.CommentCompanyDatasource>()));
  gh.singleton<_i196.PrivilegesCubit>(() => _i196.PrivilegesCubit(
        gh<_i170.GetPrivilegesUsecase>(),
        gh<_i169.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i197.GetInstallUseCase>(
      () => _i197.GetInstallUseCase(gh<_i161.InstallQualityRepo>()));
  gh.lazySingleton<_i198.AgentsDistributorsProfileRepo>(() =>
      _i199.AgentsDistributorsProfileRepoImpl(
          gh<_i145.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i200.AddDateInstallUsecase>(
      () => _i200.AddDateInstallUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i201.CancelDateInstallUsecase>(
      () => _i201.CancelDateInstallUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i202.GetInvoiceByClientUsecase>(
      () => _i202.GetInvoiceByClientUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i203.ReceiveDeviceUsecase>(
      () => _i203.ReceiveDeviceUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i204.ReturnInvoiceApproveUsecase>(
      () => _i204.ReturnInvoiceApproveUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i205.SetDateDoneUsecase>(
      () => _i205.SetDateDoneUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i206.SetReadyInstallUsecase>(
      () => _i206.SetReadyInstallUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i207.GetAllUsersUseCase>(
      () => _i207.GetAllUsersUseCase(gh<_i136.InvoicesSectionRepo>()));
  gh.lazySingleton<_i208.ClientsDebtsRepo>(
      () => _i209.ClientsDebtsRepoImpl(gh<_i48.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i210.PeriodicCommunicationRepo>(() =>
      _i211.PeriodicCommunicationRepoImpl(
          gh<_i41.PeriodicCommunicationDatasource>()));
  gh.factory<_i212.ImportantLinksRepo>(
      () => _i213.ImportantLinksRepoImpl(gh<_i64.ImportantLinksDatasource>()));
  gh.factory<_i214.ExportClientsToExcelUseCase>(() =>
      _i214.ExportClientsToExcelUseCase(gh<_i62.ClientsListDatasource>()));
  gh.lazySingleton<_i215.GetClientLogsUsecase>(
      () => _i215.GetClientLogsUsecase(gh<_i105.ClientLogsTabRepo>()));
  gh.lazySingleton<_i216.SupportClientsInvoicesRepo>(() =>
      _i217.SupportClientsInvoicesRepoImpl(
          gh<_i56.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i218.GetBranchesForUserUsecase>(
      () => _i218.GetBranchesForUserUsecase(gh<_i82.UsersRepository>()));
  gh.lazySingleton<_i219.GetLevelsForUserUsecase>(
      () => _i219.GetLevelsForUserUsecase(gh<_i82.UsersRepository>()));
  gh.lazySingleton<_i220.GetManagesForUserUsecase>(
      () => _i220.GetManagesForUserUsecase(gh<_i82.UsersRepository>()));
  gh.factory<_i221.GetUsersUsecase>(
      () => _i221.GetUsersUsecase(gh<_i82.UsersRepository>()));
  gh.factory<_i222.GetUserByIdUsecase>(
      () => _i222.GetUserByIdUsecase(gh<_i82.UsersRepository>()));
  gh.lazySingleton<_i223.GetSupportClientsInvoicesUseCase>(() =>
      _i223.GetSupportClientsInvoicesUseCase(
          gh<_i216.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i224.ManageWithdrawalsRepository>(() =>
      _i225.ManageWithdrawalsRepositoryImpl(
          gh<_i45.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i226.AgentsDistributorsRepo>(() =>
      _i227.AgentsDistributorsRepoImpl(
          gh<_i100.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i228.GetProductsSalesReportsUsecase>(() =>
      _i228.GetProductsSalesReportsUsecase(
          gh<_i143.ProductsSalesReportsRepo>()));
  gh.singleton<_i229.CitiesCubit>(
      () => _i229.CitiesCubit(gh<_i117.GetCitiesUseCase>()));
  gh.lazySingleton<_i230.GetNotUsingSystemUsecase>(
      () => _i230.GetNotUsingSystemUsecase(gh<_i36.NotUsingSystemRepo>()));
  gh.factory<_i231.UsersTypeCubit>(
      () => _i231.UsersTypeCubit(gh<_i111.GetUsersUsecase>()));
  gh.factory<_i232.ClientsListRepository>(
      () => _i233.ClientsListRepositoryImpl(gh<_i62.ClientsListDatasource>()));
  gh.factory<_i234.AddParticipateCommentUsecase>(() =>
      _i234.AddParticipateCommentUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i235.AddParticipateUserUsecase>(() =>
      _i235.AddParticipateUserUsecase(gh<_i131.ParticipateListRepository>()));
  gh.factory<_i236.EditParticipateUserUsecase>(() =>
      _i236.EditParticipateUserUsecase(gh<_i131.ParticipateListRepository>()));
  gh.factory<_i237.ParticipateClientListUsecase>(() =>
      _i237.ParticipateClientListUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i238.ParticipateCommentListUsecase>(() =>
      _i238.ParticipateCommentListUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i239.GetParticipateInvoiceByIdUsecase>(() =>
      _i239.GetParticipateInvoiceByIdUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i240.ParticipateInvoiceListUsecase>(() =>
      _i240.ParticipateInvoiceListUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i241.ParticipateListUsecase>(() =>
      _i241.ParticipateListUsecase(gh<_i131.ParticipateListRepository>()));
  gh.lazySingleton<_i242.ChangeParticipateStatusUsecase>(() =>
      _i242.ChangeParticipateStatusUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i243.PendingInvoicesCubit>(
      () => _i243.PendingInvoicesCubit(gh<_i112.GetPendingInvoicesUsecase>()));
  gh.factory<_i244.EvaluationLevelReportCubit>(() =>
      _i244.EvaluationLevelReportCubit(
          gh<_i97.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i245.GetEmployeesSalesReportsUsecase>(() =>
      _i245.GetEmployeesSalesReportsUsecase(
          gh<_i127.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i246.GetGreetingCommunicationUseCase>(() =>
      _i246.GetGreetingCommunicationUseCase(
          gh<_i154.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i247.ClientsTransferApprovalsRepo>(() =>
      _i248.ClientsTransferApprovalsRepoImpl(
          gh<_i58.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i249.GetDeletedInvoicesUsecase>(
      () => _i249.GetDeletedInvoicesUsecase(gh<_i174.DeletedInvoicesRepo>()));
  gh.lazySingleton<_i250.GetClientsStatusReportsUsecase>(() =>
      _i250.GetClientsStatusReportsUsecase(
          gh<_i147.ClientsStatusReportsRepo>()));
  gh.factory<_i251.ActionLinkUsecase>(
      () => _i251.ActionLinkUsecase(gh<_i212.ImportantLinksRepo>()));
  gh.factory<_i252.GetImportantLinksUsecase>(
      () => _i252.GetImportantLinksUsecase(gh<_i212.ImportantLinksRepo>()));
  gh.lazySingleton<_i253.GetPreviousRatingsUsecase>(
      () => _i253.GetPreviousRatingsUsecase(gh<_i103.PreviousRatingsRepo>()));
  gh.lazySingleton<_i254.WaitingAgentsRepo>(
      () => _i255.WaitingAgentsRepoImpl(gh<_i139.WaitingAgentsDataSource>()));
  gh.factory<_i256.AddClientUserUsecase>(
      () => _i256.AddClientUserUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i257.ApproveRejectClientUsecase>(() =>
      _i257.ApproveRejectClientUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i258.ChangeTypeClientUsecase>(
      () => _i258.ChangeTypeClientUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i259.EditClientUserUsecase>(
      () => _i259.EditClientUserUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i260.GetClientsListByRegionUseCase>(() =>
      _i260.GetClientsListByRegionUseCase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i261.GetClientsListByUserUseCase>(() =>
      _i261.GetClientsListByUserUseCase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i262.GetClientsWithFilterUserUsecase>(() =>
      _i262.GetClientsWithFilterUserUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i263.GetClientMarketingReportUsecase>(() =>
      _i263.GetClientMarketingReportUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i264.GetRecommendedClientsUsecase>(() =>
      _i264.GetRecommendedClientsUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i265.GetSimilarClientsUsecase>(
      () => _i265.GetSimilarClientsUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i266.ReceiveClientUserUsecase>(
      () => _i266.ReceiveClientUserUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i267.TransferClientUserUsecase>(
      () => _i267.TransferClientUserUsecase(gh<_i232.ClientsListRepository>()));
  gh.lazySingleton<_i268.GetHighSimilarClientsUsecase>(() =>
      _i268.GetHighSimilarClientsUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i269.EmployeesSalesReportsCubit>(() =>
      _i269.EmployeesSalesReportsCubit(
          gh<_i245.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i270.ChangeStateAgentUseCase>(
      () => _i270.ChangeStateAgentUseCase(gh<_i226.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i271.GetAgentsAndDistributorsUseCase>(() =>
      _i271.GetAgentsAndDistributorsUseCase(
          gh<_i226.AgentsDistributorsRepo>()));
  gh.factory<_i272.ClientsAcceptCubit>(
      () => _i272.ClientsAcceptCubit(gh<_i186.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i273.CancelWithdrawalUsecase>(() =>
      _i273.CancelWithdrawalUsecase(gh<_i224.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i274.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i274.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i224.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i275.GetWithdrawalsInvoicesUsecase>(() =>
      _i275.GetWithdrawalsInvoicesUsecase(
          gh<_i224.ManageWithdrawalsRepository>()));
  gh.factory<_i276.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i276.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i224.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i277.ExceededClientsUseCase>(
      () => _i277.ExceededClientsUseCase(gh<_i92.ExceededClientsRepo>()));
  gh.lazySingleton<_i278.TransferExceededClientsUseCase>(() =>
      _i278.TransferExceededClientsUseCase(gh<_i92.ExceededClientsRepo>()));
  gh.factory<_i279.ParticipateListBloc>(() => _i279.ParticipateListBloc(
        gh<_i241.ParticipateListUsecase>(),
        gh<_i235.AddParticipateUserUsecase>(),
        gh<_i236.EditParticipateUserUsecase>(),
        gh<_i237.ParticipateClientListUsecase>(),
        gh<_i240.ParticipateInvoiceListUsecase>(),
        gh<_i239.GetParticipateInvoiceByIdUsecase>(),
        gh<_i238.ParticipateCommentListUsecase>(),
        gh<_i234.AddParticipateCommentUsecase>(),
        gh<_i242.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i280.LoginLocalDataSource>(() =>
      _i280.LoginLocalDataSourceImpl(
          gh<_i156.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i281.EditAdvancedConfigsUsecase>(() =>
      _i281.EditAdvancedConfigsUsecase(gh<_i129.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i282.GetAdvancedConfigsUsecase>(() =>
      _i282.GetAdvancedConfigsUsecase(gh<_i129.AdvancedConfigsRepository>()));
  gh.factory<_i283.ClientsInstallReportsCubit>(() =>
      _i283.ClientsInstallReportsCubit(
          gh<_i102.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i284.DatesTableRepo>(
      () => _i285.DatesTableRepoImpl(gh<_i149.DatesTableDataSource>()));
  gh.factory<_i286.GetVersionUseCase>(
      () => _i286.GetVersionUseCase(gh<_i167.AppRepository>()));
  gh.factory<_i287.AddTicketCubit>(
      () => _i287.AddTicketCubit(gh<_i118.AddTicketUseCase>()));
  gh.lazySingleton<_i288.LatestClientsUpdatesRepository>(() =>
      _i289.LatestClientsUpdatesRepositoryImpl(
          gh<_i133.LatestClientsUpdatesDatasource>()));
  gh.factory<_i290.TaskRepository>(
      () => _i291.TaskRepositoryImpl(gh<_i101.TaskDatasource>()));
  gh.lazySingleton<_i292.EditGeneralConfigsUsecase>(() =>
      _i292.EditGeneralConfigsUsecase(gh<_i187.GeneralConfigsRepository>()));
  gh.lazySingleton<_i293.GetGeneralConfigsUsecase>(() =>
      _i293.GetGeneralConfigsUsecase(gh<_i187.GeneralConfigsRepository>()));
  gh.factory<_i294.PeriodicCommunicationReportsCubit>(() =>
      _i294.PeriodicCommunicationReportsCubit(
          gh<_i192.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i295.InstallQualityCubit>(
      () => _i295.InstallQualityCubit(gh<_i197.GetInstallUseCase>()));
  gh.factory<_i296.ImportantLinksCubit>(() => _i296.ImportantLinksCubit(
        gh<_i252.GetImportantLinksUsecase>(),
        gh<_i251.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i297.AddAgentUseCase>(
      () => _i297.AddAgentUseCase(gh<_i171.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i298.UpdateAgentUseCase>(() =>
      _i298.UpdateAgentUseCase(gh<_i171.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i299.GetDelayInstallReportsUseCase>(() =>
      _i299.GetDelayInstallReportsUseCase(gh<_i165.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i300.CrudAgentSupportFilesUsecase>(() =>
      _i300.CrudAgentSupportFilesUsecase(
          gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i301.GetClientsTransferApprovalsUsecase>(() =>
      _i301.GetClientsTransferApprovalsUsecase(
          gh<_i247.ClientsTransferApprovalsRepo>()));
  gh.factory<_i302.ClientsStatusReportsCubit>(() =>
      _i302.ClientsStatusReportsCubit(
          gh<_i250.GetClientsStatusReportsUsecase>()));
  gh.factory<_i303.SupportTabCubit>(() => _i303.SupportTabCubit(
        gh<_i202.GetInvoiceByClientUsecase>(),
        gh<_i200.AddDateInstallUsecase>(),
        gh<_i205.SetDateDoneUsecase>(),
        gh<_i206.SetReadyInstallUsecase>(),
        gh<_i204.ReturnInvoiceApproveUsecase>(),
        gh<_i203.ReceiveDeviceUsecase>(),
        gh<_i201.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i304.ClientsDebtsReportsCubit>(() =>
      _i304.ClientsDebtsReportsCubit(
          gh<_i153.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i305.DeletedInvoicesCubit>(
      () => _i305.DeletedInvoicesCubit(gh<_i249.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i306.AddAgentDateUseCase>(() =>
      _i306.AddAgentDateUseCase(gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i307.GetManageWithdrawnInvoicesUsecase>(() =>
      _i307.GetManageWithdrawnInvoicesUsecase(
          gh<_i158.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i308.NotificationsCubit>(() => _i308.NotificationsCubit(
        gh<_i189.GetNotificationsUsecase>(),
        gh<_i191.MarkNotificationsAsReadUsecase>(),
        gh<_i190.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i309.WithdrawnInvoicesRepo>(() =>
      _i310.WithdrawnInvoicesRepoImpl(gh<_i135.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i311.RegionsRepository>(
      () => _i312.RegionsRepositoryImpl(gh<_i151.RegionsDatasource>()));
  gh.factory<_i313.ClientLogsTabCubit>(
      () => _i313.ClientLogsTabCubit(gh<_i215.GetClientLogsUsecase>()));
  gh.factory<_i314.RegionsSalesReportsCubit>(() =>
      _i314.RegionsSalesReportsCubit(
          gh<_i177.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i315.AgentsDistributorsActionsCubit>(
      () => _i315.AgentsDistributorsActionsCubit(
            gh<_i117.GetCitiesUseCase>(),
            gh<_i297.AddAgentUseCase>(),
            gh<_i298.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i316.FetchPaginatedClientsUsecase>(() =>
      _i316.FetchPaginatedClientsUsecase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i317.FetchLinkClientsUseCase>(
      () => _i317.FetchLinkClientsUseCase(gh<_i232.ClientsListRepository>()));
  gh.factory<_i318.LinkSelectedClientsUseCase>(() =>
      _i318.LinkSelectedClientsUseCase(gh<_i232.ClientsListRepository>()));
  gh.lazySingleton<_i319.LoginRepo>(() => _i320.LoginRepoImpl(
        gh<_i126.LoginRemoteDataSource>(),
        gh<_i280.LoginLocalDataSource>(),
      ));
  gh.factory<_i321.SpecialClientsBloc>(
      () => _i321.SpecialClientsBloc(gh<_i181.GetSpecialClientsUsecase>()));
  gh.factory<_i322.AddCommentUsecase>(
      () => _i322.AddCommentUsecase(gh<_i194.CompanyRepository>()));
  gh.factory<_i323.GetCommentUsecase>(
      () => _i323.GetCommentUsecase(gh<_i194.CompanyRepository>()));
  gh.factory<_i324.DelayInstallReportsCubit>(() =>
      _i324.DelayInstallReportsCubit(
          gh<_i299.GetDelayInstallReportsUseCase>()));
  gh.factory<_i325.GreetingCommunicationCubit>(() =>
      _i325.GreetingCommunicationCubit(
          gh<_i246.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i326.GetRegionsUseCase>(
      () => _i326.GetRegionsUseCase(gh<_i311.RegionsRepository>()));
  gh.lazySingleton<_i327.GetLatestClientsUseCase>(() =>
      _i327.GetLatestClientsUseCase(
          gh<_i288.LatestClientsUpdatesRepository>()));
  gh.factory<_i328.AdvancedCofigsCubit>(() => _i328.AdvancedCofigsCubit(
        gh<_i282.GetAdvancedConfigsUsecase>(),
        gh<_i281.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i329.SupportClientsInvoicesCubit>(() =>
      _i329.SupportClientsInvoicesCubit(
          gh<_i223.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i330.WrongNumbersCubit>(
      () => _i330.WrongNumbersCubit(gh<_i185.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i331.CacheTokenUsecase>(
      () => _i331.CacheTokenUsecase(gh<_i319.LoginRepo>()));
  gh.lazySingleton<_i332.GetTokenUsecase>(
      () => _i332.GetTokenUsecase(gh<_i319.LoginRepo>()));
  gh.lazySingleton<_i333.LoginUsecase>(
      () => _i333.LoginUsecase(gh<_i319.LoginRepo>()));
  gh.lazySingleton<_i334.ValidateTokenUsecase>(
      () => _i334.ValidateTokenUsecase(gh<_i319.LoginRepo>()));
  gh.lazySingleton<_i335.VerifyOtpUsecase>(
      () => _i335.VerifyOtpUsecase(gh<_i319.LoginRepo>()));
  gh.factory<_i336.ClientsTransferApprovalsCubit>(() =>
      _i336.ClientsTransferApprovalsCubit(
          gh<_i301.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i337.RegionsCubit>(
      () => _i337.RegionsCubit(gh<_i326.GetRegionsUseCase>()));
  gh.factory<_i338.GeneralCofigsCubit>(() => _i338.GeneralCofigsCubit(
        gh<_i293.GetGeneralConfigsUsecase>(),
        gh<_i292.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i339.GetPeriodicCommunicationUseCase>(() =>
      _i339.GetPeriodicCommunicationUseCase(
          gh<_i210.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i340.GetClientsDebtsUsecase>(
      () => _i340.GetClientsDebtsUsecase(gh<_i208.ClientsDebtsRepo>()));
  gh.lazySingleton<_i341.CrudClientSupportFilesUsecase>(() =>
      _i341.CrudClientSupportFilesUsecase(
          repository: gh<_i232.ClientsListRepository>()));
  gh.lazySingleton<_i342.GetClientSupportFilesUsecase>(() =>
      _i342.GetClientSupportFilesUsecase(
          repository: gh<_i232.ClientsListRepository>()));
  gh.factory<_i343.BranchesCubit>(
      () => _i343.BranchesCubit(gh<_i193.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i344.AddAgentCommentUsecase>(() =>
      _i344.AddAgentCommentUsecase(gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i345.DoneTrainingUsecase>(() =>
      _i345.DoneTrainingUsecase(gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i346.GetAgentByIdUsecase>(() =>
      _i346.GetAgentByIdUsecase(gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i347.GetAgentClientListUsecase>(() =>
      _i347.GetAgentClientListUsecase(
          gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i348.GetAgentCommentsListUsecase>(() =>
      _i348.GetAgentCommentsListUsecase(
          gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i349.GetAgentDatesListUsecase>(() =>
      _i349.GetAgentDatesListUsecase(
          gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i350.GetAgentInvoiceListUsecase>(() =>
      _i350.GetAgentInvoiceListUsecase(
          gh<_i198.AgentsDistributorsProfileRepo>()));
  gh.factory<_i351.AddRejectReasonsUsecase>(() =>
      _i351.AddRejectReasonsUsecase(gh<_i224.ManageWithdrawalsRepository>()));
  gh.factory<_i352.EditRejectReasonsUsecase>(() =>
      _i352.EditRejectReasonsUsecase(gh<_i224.ManageWithdrawalsRepository>()));
  gh.factory<_i353.GetRejectReasonsUsecase>(() =>
      _i353.GetRejectReasonsUsecase(gh<_i224.ManageWithdrawalsRepository>()));
  gh.factory<_i354.GetUserSeriesUsecase>(() =>
      _i354.GetUserSeriesUsecase(gh<_i224.ManageWithdrawalsRepository>()));
  gh.factory<_i355.GetWithdrawnDetailsUsecase>(() =>
      _i355.GetWithdrawnDetailsUsecase(
          gh<_i224.ManageWithdrawalsRepository>()));
  gh.factory<_i356.SetApproveSeriesUsecase>(() =>
      _i356.SetApproveSeriesUsecase(gh<_i224.ManageWithdrawalsRepository>()));
  gh.factory<_i357.UpdateSeriesUsecase>(
      () => _i357.UpdateSeriesUsecase(gh<_i224.ManageWithdrawalsRepository>()));
  gh.factory<_i358.NotUsingSystemCubit>(
      () => _i358.NotUsingSystemCubit(gh<_i230.GetNotUsingSystemUsecase>()));
  gh.singleton<_i359.AppManagerCubit>(
      () => _i359.AppManagerCubit(gh<_i286.GetVersionUseCase>()));
  gh.lazySingleton<_i360.GetWaitingAgentsUsecase>(
      () => _i360.GetWaitingAgentsUsecase(gh<_i254.WaitingAgentsRepo>()));
  gh.factory<_i361.InvoicesSectionCubit>(() => _i361.InvoicesSectionCubit(
        gh<_i183.GetInvoicesByPrivilegesUsecase>(),
        gh<_i271.GetAgentsAndDistributorsUseCase>(),
        gh<_i241.ParticipateListUsecase>(),
        gh<_i207.GetAllUsersUseCase>(),
        gh<_i184.GetInvoiceByIdUsecase>(),
        gh<_i182.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i362.ProductsSalesReportsCubit>(() =>
      _i362.ProductsSalesReportsCubit(
          gh<_i228.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i363.GetWithdrawnInvoicesUsecase>(() =>
      _i363.GetWithdrawnInvoicesUsecase(gh<_i309.WithdrawnInvoicesRepo>()));
  gh.factory<_i364.PreviousRatingsCubit>(
      () => _i364.PreviousRatingsCubit(gh<_i253.GetPreviousRatingsUsecase>()));
  gh.factory<_i365.AgentsDistributorsCubit>(() => _i365.AgentsDistributorsCubit(
        gh<_i271.GetAgentsAndDistributorsUseCase>(),
        gh<_i270.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i366.ExceededClientsCubit>(() => _i366.ExceededClientsCubit(
        gh<_i277.ExceededClientsUseCase>(),
        gh<_i278.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i367.ManageWithdrawalsCubit>(() => _i367.ManageWithdrawalsCubit(
        gh<_i354.GetUserSeriesUsecase>(),
        gh<_i357.UpdateSeriesUsecase>(),
        gh<_i221.GetUsersUsecase>(),
        gh<_i275.GetWithdrawalsInvoicesUsecase>(),
        gh<_i276.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i356.SetApproveSeriesUsecase>(),
        gh<_i355.GetWithdrawnDetailsUsecase>(),
        gh<_i351.AddRejectReasonsUsecase>(),
        gh<_i353.GetRejectReasonsUsecase>(),
        gh<_i352.EditRejectReasonsUsecase>(),
        gh<_i274.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i273.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i368.ManageWithdrawnInvoicesCubit>(() =>
      _i368.ManageWithdrawnInvoicesCubit(
          gh<_i307.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i369.LatestClientsUpdatesCubit>(() =>
      _i369.LatestClientsUpdatesCubit(gh<_i327.GetLatestClientsUseCase>()));
  gh.factory<_i370.AttachmentsRowCubit>(() => _i370.AttachmentsRowCubit(
        gh<_i342.GetClientSupportFilesUsecase>(),
        gh<_i341.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i371.CancelScheduleUsecase>(
      () => _i371.CancelScheduleUsecase(gh<_i284.DatesTableRepo>()));
  gh.lazySingleton<_i372.ChangeDateToDonUsecase>(
      () => _i372.ChangeDateToDonUsecase(gh<_i284.DatesTableRepo>()));
  gh.lazySingleton<_i373.GetCancelReasonsUsecase>(
      () => _i373.GetCancelReasonsUsecase(gh<_i284.DatesTableRepo>()));
  gh.lazySingleton<_i374.GetDateInstallationUsecase>(
      () => _i374.GetDateInstallationUsecase(gh<_i284.DatesTableRepo>()));
  gh.lazySingleton<_i375.GetInvoicesByClientForDateUsecase>(() =>
      _i375.GetInvoicesByClientForDateUsecase(gh<_i284.DatesTableRepo>()));
  gh.lazySingleton<_i376.GetSubscribedClientsUsecase>(
      () => _i376.GetSubscribedClientsUsecase(gh<_i284.DatesTableRepo>()));
  gh.lazySingleton<_i377.RescheduleDateUsecase>(
      () => _i377.RescheduleDateUsecase(gh<_i284.DatesTableRepo>()));
  gh.lazySingleton<_i378.ReturnScheduleVisitToOpenUsecase>(
      () => _i378.ReturnScheduleVisitToOpenUsecase(gh<_i284.DatesTableRepo>()));
  gh.factory<_i379.AddTaskUsecase>(
      () => _i379.AddTaskUsecase(gh<_i290.TaskRepository>()));
  gh.factory<_i380.ChangeStatusTaskUsecase>(
      () => _i380.ChangeStatusTaskUsecase(gh<_i290.TaskRepository>()));
  gh.factory<_i381.GetTasksUsecase>(
      () => _i381.GetTasksUsecase(gh<_i290.TaskRepository>()));
  gh.factory<_i382.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i382.GetUsersByDepartmentAndRegionUsecase(gh<_i290.TaskRepository>()));
  gh.lazySingleton<_i383.TaskCubit>(() => _i383.TaskCubit(
        gh<_i379.AddTaskUsecase>(),
        gh<_i381.GetTasksUsecase>(),
        gh<_i380.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i384.UsersCubit>(() => _i384.UsersCubit(
        gh<_i221.GetUsersUsecase>(),
        gh<_i222.GetUserByIdUsecase>(),
        gh<_i94.ActionUserUsecase>(),
        gh<_i382.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i220.GetManagesForUserUsecase>(),
        gh<_i219.GetLevelsForUserUsecase>(),
        gh<_i218.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i385.CompanyCubit>(() => _i385.CompanyCubit(
        gh<_i323.GetCommentUsecase>(),
        gh<_i322.AddCommentUsecase>(),
      ));
  gh.factory<_i386.ClientsDebtsCubit>(
      () => _i386.ClientsDebtsCubit(gh<_i340.GetClientsDebtsUsecase>()));
  gh.factory<_i387.PeriodicCommunicationCubit>(() =>
      _i387.PeriodicCommunicationCubit(
          gh<_i339.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i388.LoginCubit>(() => _i388.LoginCubit(
        gh<_i333.LoginUsecase>(),
        gh<_i335.VerifyOtpUsecase>(),
        gh<_i331.CacheTokenUsecase>(),
        gh<_i332.GetTokenUsecase>(),
        gh<_i334.ValidateTokenUsecase>(),
      ));
  gh.factory<_i389.AgentsDistributorsProfileBloc>(
      () => _i389.AgentsDistributorsProfileBloc(
            gh<_i346.GetAgentByIdUsecase>(),
            gh<_i347.GetAgentClientListUsecase>(),
            gh<_i350.GetAgentInvoiceListUsecase>(),
            gh<_i239.GetParticipateInvoiceByIdUsecase>(),
            gh<_i348.GetAgentCommentsListUsecase>(),
            gh<_i344.AddAgentCommentUsecase>(),
            gh<_i345.DoneTrainingUsecase>(),
            gh<_i306.AddAgentDateUseCase>(),
            gh<_i349.GetAgentDatesListUsecase>(),
            gh<_i300.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i390.DatesTableCubit>(() => _i390.DatesTableCubit(
        gh<_i374.GetDateInstallationUsecase>(),
        gh<_i377.RescheduleDateUsecase>(),
        gh<_i372.ChangeDateToDonUsecase>(),
        gh<_i371.CancelScheduleUsecase>(),
        gh<_i378.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i376.GetSubscribedClientsUsecase>(),
        gh<_i375.GetInvoicesByClientForDateUsecase>(),
        gh<_i200.AddDateInstallUsecase>(),
        gh<_i373.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i391.WithdrawnInvoicesCubit>(() =>
      _i391.WithdrawnInvoicesCubit(gh<_i363.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i392.ClientsListBloc>(() => _i392.ClientsListBloc(
        gh<_i262.GetClientsWithFilterUserUsecase>(),
        gh<_i264.GetRecommendedClientsUsecase>(),
        gh<_i265.GetSimilarClientsUsecase>(),
        gh<_i256.AddClientUserUsecase>(),
        gh<_i259.EditClientUserUsecase>(),
        gh<_i258.ChangeTypeClientUsecase>(),
        gh<_i257.ApproveRejectClientUsecase>(),
        gh<_i341.CrudClientSupportFilesUsecase>(),
        gh<_i342.GetClientSupportFilesUsecase>(),
        gh<_i267.TransferClientUserUsecase>(),
        gh<_i266.ReceiveClientUserUsecase>(),
        gh<_i263.GetClientMarketingReportUsecase>(),
        gh<_i268.GetHighSimilarClientsUsecase>(),
        gh<_i317.FetchLinkClientsUseCase>(),
        gh<_i316.FetchPaginatedClientsUsecase>(),
        gh<_i318.LinkSelectedClientsUseCase>(),
        gh<_i214.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i393.WaitingAgentsCubit>(
      () => _i393.WaitingAgentsCubit(gh<_i360.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i394.AppModule {}
