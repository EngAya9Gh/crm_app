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
    as _i175;
import '../../../features/app/domain/repositories/app_repository.dart' as _i174;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i299;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i376;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i293;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i131;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i336;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i335;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i348;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i349;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i350;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i351;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i352;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i406;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i31;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i47;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i46;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i193;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i285;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i28;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i94;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i93;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i118;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i185;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i25;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i37;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i36;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i238;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i375;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i55;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i71;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i70;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i123;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i124;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i125;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i127;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i126;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i128;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i300;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i151;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i129;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i27;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i39;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i38;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i192;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i347;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i11;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i51;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i50;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i100;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i253;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i18;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i160;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i159;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i255;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i342;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i52;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i169;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i168;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i204;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i309;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i41;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i219;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i218;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i356;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i405;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i33;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i44;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i43;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i199;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i307;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i26;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i107;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i106;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i264;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i381;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i61;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i146;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i145;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i188;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i337;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i92;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i99;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i98;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i200;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i360;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i68;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i121;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i120;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i122;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i237;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i74;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i109;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i108;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i223;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i329;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i113;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i187;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i186;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i208;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i209;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i210;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i211;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i212;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i213;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i214;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i319;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i156;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i328;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i327;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i343;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i354;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i67;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i84;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i83;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i114;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i239;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i3;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i69;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i135;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i134;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i294;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i295;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i345;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i87;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i195;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i194;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i305;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i306;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i355;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i17;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i54;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i53;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i111;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i112;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i130;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i14;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i171;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i170;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i177;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i176;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i203;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i57;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i86;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i85;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i97;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i226;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i227;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i228;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i230;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i229;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i402;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i45;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i233;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i232;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i368;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i286;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i369;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i287;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i370;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i371;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i289;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i288;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i372;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i373;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i374;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i385;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i30;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i29;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i196;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i197;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i198;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i324;
import '../../../features/sales/clients/add_client_contact/data/data_sources/add_client_contact_datasource.dart'
    as _i62;
import '../../../features/sales/clients/add_client_contact/data/repositories/add_client_contact_repo_impl.dart'
    as _i116;
import '../../../features/sales/clients/add_client_contact/domain/repositories/add_client_contact_repo.dart'
    as _i115;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/add_client_contact_usecase.dart'
    as _i242;
import '../../../features/sales/clients/add_client_contact/presentation/manager/add_client_contact_bloc.dart'
    as _i314;
import '../../../features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart'
    as _i63;
import '../../../features/sales/clients/clients_contacts/data/repositories/clients_contacts_repo_impl.dart'
    as _i260;
import '../../../features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart'
    as _i259;
import '../../../features/sales/clients/clients_contacts/domain/use_cases/get_all_clients_contacts_usecase.dart'
    as _i308;
import '../../../features/sales/clients/clients_contacts/presentation/manager/clients_contacts_bloc.dart'
    as _i310;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i48;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i217;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i216;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i357;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i404;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i64;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i35;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i241;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i240;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i267;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i268;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_client_communication_usecase.dart'
    as _i269;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i270;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i358;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i271;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i222;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i333;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i332;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i275;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i359;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i272;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i273;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i274;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i281;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i276;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i277;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i334;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i278;
import '../../../features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart'
    as _i279;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i280;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i384;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i58;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i257;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i256;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i317;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i353;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i49;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i89;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i88;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i147;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i180;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i138;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i302;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i301;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i344;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i387;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i13;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i91;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i90;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i117;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i252;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i65;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i202;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i201;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i338;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i339;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i403;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i110;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i182;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i181;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i258;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i321;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i59;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i96;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i95;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i290;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i291;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i383;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i119;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i142;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i141;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i189;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i215;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i191;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i190;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i378;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i139;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i166;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i165;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i323;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i386;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i19;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i103;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i150;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i179;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i207;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i235;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i178;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i206;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i234;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i361;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i322;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i312;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i283;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i316;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i362;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i363;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i364;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i365;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i366;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i367;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i284;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i313;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i331;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i407;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i382;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i66;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i221;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i220;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i262;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i263;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i311;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i40;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i137;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i136;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i243;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i244;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i251;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i245;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i246;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i247;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i248;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i249;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i250;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i292;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i77;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i76;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i158;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i320;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i32;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i153;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i152;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i261;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i318;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i42;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i133;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i132;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i254;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i282;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i16;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i149;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i148;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i236;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i379;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i73;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i72;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i184;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i330;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i140;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i326;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i325;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i380;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i409;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i22;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i102;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i101;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i105;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i296;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i154;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i298;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i297;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i389;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i390;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i391;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i392;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i393;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i394;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i395;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i396;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i408;
import '../../../features/support/dates_timeline/data/data_sources/dates_timeline_datasource.dart'
    as _i75;
import '../../../features/support/dates_timeline/data/respositories_impl/dates_timeline_repo_impl.dart'
    as _i162;
import '../../../features/support/dates_timeline/domain/respositories/dates_timline_repo.dart'
    as _i161;
import '../../../features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart'
    as _i205;
import '../../../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart'
    as _i341;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i12;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i81;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i80;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i155;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i183;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i34;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i173;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i172;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i315;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i340;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i10;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i79;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i78;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i82;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i143;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i56;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i225;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i224;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i231;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i346;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i144;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i266;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i265;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i377;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i410;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i104;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i304;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i303;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i397;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i398;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i399;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i400;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i401;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i388;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i163;
import '../cache_services/prefs_consumer.dart' as _i167;
import '../cache_services/secure_storage_consumer.dart' as _i164;
import '../maps/location_services.dart' as _i157;
import 'di_container.dart' as _i411;

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
  gh.factory<_i62.AddClientsContactsDatasource>(
      () => _i62.AddClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i63.ClientsContactsDatasource>(
      () => _i63.ClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i64.ClientsListDatasource>(
      () => _i64.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i65.CommentCompanyDatasource>(
      () => _i65.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i66.ImportantLinksDatasource>(
      () => _i66.ImportantLinksDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i67.UsersDatasource>(
      () => _i67.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i68.CitiesDatasource>(
      () => _i68.CitiesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i69.AdvancedConfigsDatasource>(
      () => _i69.AdvancedConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i70.TicketsRepo>(
      () => _i71.TicketsRepoImpl(gh<_i55.TicketsDataSource>()));
  gh.lazySingleton<_i72.RegionsSalesReportsRepo>(() =>
      _i73.RegionsSalesReportsRepoImpl(
          gh<_i23.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i74.ClientLogsTabDataSource>(
      () => _i74.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i75.DatesTimelineDatasource>(
      () => _i75.DatesTimelineDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i76.ClientsDebtsReportsRepo>(() =>
      _i77.ClientsDebtsReportsRepoImpl(
          gh<_i24.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i78.SupportClientsAcceptRepository>(() =>
      _i79.SupportClientsAcceptRepositoryImpl(
          gh<_i10.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i80.DelayAfterInstallRepo>(() =>
      _i81.DelayAfterInstallRepoImpl(gh<_i12.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i82.GetSupportClientsAcceptUseCase>(() =>
      _i82.GetSupportClientsAcceptUseCase(
          gh<_i78.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i83.UsersRepository>(
      () => _i84.UsersRepositoryImpl(gh<_i67.UsersDatasource>()));
  gh.lazySingleton<_i85.UsersRepository>(
      () => _i86.UsersRepositoryImpl(gh<_i57.UsersDatasource>()));
  gh.lazySingleton<_i87.GeneralConfigsDatasource>(
      () => _i87.GeneralConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i88.FinancePendingRepo>(
      () => _i89.FinancePendingRepoImpl(gh<_i49.FinancePendingDatasource>()));
  gh.lazySingleton<_i90.PendingInvoicesRepo>(
      () => _i91.PendingInvoicesRepoImpl(gh<_i13.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i92.BranchesDatasource>(
      () => _i92.BranchesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i93.ClientsCareReportsRepo>(() =>
      _i94.ClientsCareReportsRepoImpl(gh<_i28.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i95.ExceededClientsRepo>(
      () => _i96.ExceededClientsRepoImpl(gh<_i59.ExceededClientsDatasource>()));
  gh.factory<_i97.ActionUserUsecase>(
      () => _i97.ActionUserUsecase(gh<_i85.UsersRepository>()));
  gh.lazySingleton<_i98.BranchesRepository>(
      () => _i99.BranchesRepositoryImpl(gh<_i92.BranchesDatasource>()));
  gh.lazySingleton<_i100.GetEvaluationLevelReportUsecase>(() =>
      _i100.GetEvaluationLevelReportUsecase(
          gh<_i50.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i101.ClientsInstallReportsRepo>(() =>
      _i102.ClientsInstallReportsRepoImpl(
          gh<_i22.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i103.AgentsDistributorsDataSource>(
      () => _i103.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i104.TaskDatasource>(
      () => _i104.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i105.GetClientsInstallReportsUsecase>(() =>
      _i105.GetClientsInstallReportsUsecase(
          gh<_i101.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i106.PreviousRatingsRepo>(() =>
      _i107.PreviousRatingsRepoImpl(gh<_i26.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i108.ClientLogsTabRepo>(
      () => _i109.ClientLogsTabRepoImpl(gh<_i74.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i110.DeletedInvoicesDatasource>(
      () => _i110.DeletedInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i111.AddLevelUsecase>(
      () => _i111.AddLevelUsecase(gh<_i53.LevelsRepo>()));
  gh.lazySingleton<_i112.GetLevelsUsecase>(
      () => _i112.GetLevelsUsecase(gh<_i53.LevelsRepo>()));
  gh.lazySingleton<_i113.SupportTabDataSource>(
      () => _i113.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i114.GetUsersUsecase>(
      () => _i114.GetUsersUsecase(gh<_i83.UsersRepository>()));
  gh.factory<_i115.AddClientContactRepository>(() =>
      _i116.AddClientContactRepositoryImpl(
          gh<_i62.AddClientsContactsDatasource>()));
  gh.lazySingleton<_i117.GetPendingInvoicesUsecase>(
      () => _i117.GetPendingInvoicesUsecase(gh<_i90.PendingInvoicesRepo>()));
  gh.lazySingleton<_i118.GetClientsCareReportsUsecase>(() =>
      _i118.GetClientsCareReportsUsecase(gh<_i93.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i119.InvoicesTabDataSource>(
      () => _i119.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i120.CitiesRepository>(
      () => _i121.CitiesRepositoryImpl(gh<_i68.CitiesDatasource>()));
  gh.lazySingleton<_i122.GetCitiesUseCase>(
      () => _i122.GetCitiesUseCase(gh<_i120.CitiesRepository>()));
  gh.lazySingleton<_i123.AddTicketUseCase>(
      () => _i123.AddTicketUseCase(gh<_i70.TicketsRepo>()));
  gh.lazySingleton<_i124.EditTicketTypeUseCase>(
      () => _i124.EditTicketTypeUseCase(gh<_i70.TicketsRepo>()));
  gh.lazySingleton<_i125.GetClientTicketsUseCase>(
      () => _i125.GetClientTicketsUseCase(gh<_i70.TicketsRepo>()));
  gh.lazySingleton<_i126.GetTicketsUseCase>(
      () => _i126.GetTicketsUseCase(gh<_i70.TicketsRepo>()));
  gh.lazySingleton<_i127.GetTicketByIdUseCase>(
      () => _i127.GetTicketByIdUseCase(gh<_i70.TicketsRepo>()));
  gh.lazySingleton<_i128.TransferTicketUseCase>(
      () => _i128.TransferTicketUseCase(gh<_i70.TicketsRepo>()));
  gh.factory<_i129.TicketsCubit>(() => _i129.TicketsCubit(
        gh<_i126.GetTicketsUseCase>(),
        gh<_i127.GetTicketByIdUseCase>(),
        gh<_i125.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i130.LevelsCubit>(() => _i130.LevelsCubit(
        gh<_i112.GetLevelsUsecase>(),
        gh<_i111.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i131.LoginRemoteDataSource>(
      () => _i131.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i132.EmployeesSalesReportsRepo>(() =>
      _i133.EmployeesSalesReportsRepoImpl(
          gh<_i42.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i134.AdvancedConfigsRepository>(() =>
      _i135.AdvancedConfigsRepositoryImpl(
          gh<_i69.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i136.ParticipateListRepository>(() =>
      _i137.ParticipateListRepositoryImpl(
          gh<_i40.ParticipatesListDatasource>()));
  gh.lazySingleton<_i138.LatestClientsUpdatesDatasource>(
      () => _i138.LatestClientsUpdatesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i139.ManageWithdrawnInvoicesDataSource>(
      () => _i139.ManageWithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i140.WithdrawnInvoicesDataSource>(
      () => _i140.WithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i141.InvoicesSectionRepo>(
      () => _i142.InvoicesTabRepoImpl(gh<_i119.InvoicesTabDataSource>()));
  gh.factory<_i143.SupportClientsAcceptCubit>(() =>
      _i143.SupportClientsAcceptCubit(
          gh<_i82.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i144.WaitingAgentsDataSource>(
      () => _i144.WaitingAgentsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i145.SpecialClientsRepository>(() =>
      _i146.SpecialClientsRepositoryImpl(gh<_i61.SpecialClientsDatasource>()));
  gh.lazySingleton<_i147.GetFinancePendingInvoicesUsecase>(() =>
      _i147.GetFinancePendingInvoicesUsecase(gh<_i88.FinancePendingRepo>()));
  gh.lazySingleton<_i148.ProductsSalesReportsRepo>(() =>
      _i149.ProductsSalesReportsRepoImpl(
          gh<_i16.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i150.AgentsDistributorsProfileDataSource>(() =>
      _i150.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i151.EditTicketCubit>(() => _i151.EditTicketCubit(
        gh<_i124.EditTicketTypeUseCase>(),
        gh<_i128.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i152.ClientsStatusReportsRepo>(() =>
      _i153.ClientsStatusReportsRepoImpl(
          gh<_i32.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i154.DatesTableDataSource>(
      () => _i154.DatesTableDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i155.GetDelayAfterInstallUseCase>(() =>
      _i155.GetDelayAfterInstallUseCase(gh<_i80.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i156.RegionsDatasource>(
      () => _i156.RegionsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i157.LocationServices>(
      () => _i157.LocationServices(gh<_i7.Location>()));
  gh.lazySingleton<_i158.GetClientsDebtsReportsUsecase>(() =>
      _i158.GetClientsDebtsReportsUsecase(gh<_i76.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i159.GreetingCommunicationRepo>(() =>
      _i160.GreetingCommunicationRepoImpl(
          gh<_i18.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i161.DatesTimeLinesRepo>(
      () => _i162.DatesTimelineRepoImpl(gh<_i75.DatesTimelineDatasource>()));
  gh.singleton<_i163.CacheServices>(
    () => _i164.SecureStorageConsumer(gh<_i21.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i165.ManageWithdrawnInvoicesRepo>(() =>
      _i166.ManageWithdrawnInvoicesRepoImpl(
          gh<_i139.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i163.CacheServices>(() async =>
      _i167.PrefsConsumer(await gh.getAsync<_i20.SharedPreferences>()));
  gh.lazySingleton<_i168.InstallQualityRepo>(
      () => _i169.InstallQualityRepoImpl(gh<_i52.InstallQualityDatasource>()));
  gh.lazySingleton<_i170.PrivilegesRepo>(
      () => _i171.PrivilegesRepoImpl(gh<_i14.PrivilegesDatasource>()));
  gh.lazySingleton<_i172.DelayInstallReportsRepo>(() =>
      _i173.DelayInstallReportsRepoImpl(
          gh<_i34.DelayInstallReportsDatasource>()));
  gh.factory<_i174.AppRepository>(
      () => _i175.AppRepositoryImpl(gh<_i60.AppDatasource>()));
  gh.factory<_i176.UpdatePrivilegesUsecase>(
      () => _i176.UpdatePrivilegesUsecase(gh<_i170.PrivilegesRepo>()));
  gh.lazySingleton<_i177.GetPrivilegesUsecase>(
      () => _i177.GetPrivilegesUsecase(gh<_i170.PrivilegesRepo>()));
  gh.lazySingleton<_i178.AgentsDistributorsActionsRepo>(() =>
      _i179.AgentsDistributorsActionsRepoImpl(
          gh<_i19.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i180.FinancePendingCubit>(() =>
      _i180.FinancePendingCubit(gh<_i147.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i181.DeletedInvoicesRepo>(() =>
      _i182.DeletedInvoicesRepoImpl(gh<_i110.DeletedInvoicesDatasource>()));
  gh.factory<_i183.DelayAfterInstallCubit>(() =>
      _i183.DelayAfterInstallCubit(gh<_i155.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i184.GetRegionsSalesReportsUsecase>(() =>
      _i184.GetRegionsSalesReportsUsecase(gh<_i72.RegionsSalesReportsRepo>()));
  gh.factory<_i185.ClientsCareReportsCubit>(() =>
      _i185.ClientsCareReportsCubit(gh<_i118.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i186.SupportTabRepo>(
      () => _i187.SupportTabRepoImpl(gh<_i113.SupportTabDataSource>()));
  gh.factory<_i188.GetSpecialClientsUsecase>(() =>
      _i188.GetSpecialClientsUsecase(gh<_i145.SpecialClientsRepository>()));
  gh.lazySingleton<_i189.ExportInvoicesToExcelUsecase>(() =>
      _i189.ExportInvoicesToExcelUsecase(gh<_i141.InvoicesSectionRepo>()));
  gh.lazySingleton<_i190.GetInvoicesByPrivilegesUsecase>(() =>
      _i190.GetInvoicesByPrivilegesUsecase(gh<_i141.InvoicesSectionRepo>()));
  gh.lazySingleton<_i191.GetInvoiceByIdUsecase>(
      () => _i191.GetInvoiceByIdUsecase(gh<_i141.InvoicesSectionRepo>()));
  gh.lazySingleton<_i192.GetWrongNumbersUsecase>(
      () => _i192.GetWrongNumbersUsecase(gh<_i38.WrongNumbersRepo>()));
  gh.lazySingleton<_i193.GetClientsAcceptUseCase>(
      () => _i193.GetClientsAcceptUseCase(gh<_i46.ClientsAcceptRepository>()));
  gh.lazySingleton<_i194.GeneralConfigsRepository>(() =>
      _i195.GeneralConfigsRepositoryImpl(gh<_i87.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i196.GetNotificationsUsecase>(
      () => _i196.GetNotificationsUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i197.GetUnreadNotificationsCountUsecase>(() =>
      _i197.GetUnreadNotificationsCountUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i198.MarkNotificationsAsReadUsecase>(
      () => _i198.MarkNotificationsAsReadUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i199.GetPeriodicCommunicationReportsUsecase>(() =>
      _i199.GetPeriodicCommunicationReportsUsecase(
          gh<_i43.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i200.GetBranchesByIdCountryUseCase>(
      () => _i200.GetBranchesByIdCountryUseCase(gh<_i98.BranchesRepository>()));
  gh.factory<_i201.CompanyRepository>(
      () => _i202.CompanyRepositoryImpl(gh<_i65.CommentCompanyDatasource>()));
  gh.singleton<_i203.PrivilegesCubit>(() => _i203.PrivilegesCubit(
        gh<_i177.GetPrivilegesUsecase>(),
        gh<_i176.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i204.GetInstallUseCase>(
      () => _i204.GetInstallUseCase(gh<_i168.InstallQualityRepo>()));
  gh.lazySingleton<_i205.GetTimelineByEmployeeUseCase>(
      () => _i205.GetTimelineByEmployeeUseCase(gh<_i161.DatesTimeLinesRepo>()));
  gh.lazySingleton<_i206.AgentsDistributorsProfileRepo>(() =>
      _i207.AgentsDistributorsProfileRepoImpl(
          gh<_i150.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i208.AddDateInstallUsecase>(
      () => _i208.AddDateInstallUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i209.CancelDateInstallUsecase>(
      () => _i209.CancelDateInstallUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i210.GetInvoiceByClientUsecase>(
      () => _i210.GetInvoiceByClientUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i211.ReceiveDeviceUsecase>(
      () => _i211.ReceiveDeviceUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i212.ReturnInvoiceApproveUsecase>(
      () => _i212.ReturnInvoiceApproveUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i213.SetDateDoneUsecase>(
      () => _i213.SetDateDoneUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i214.SetReadyInstallUsecase>(
      () => _i214.SetReadyInstallUsecase(gh<_i186.SupportTabRepo>()));
  gh.lazySingleton<_i215.GetAllUsersUseCase>(
      () => _i215.GetAllUsersUseCase(gh<_i141.InvoicesSectionRepo>()));
  gh.lazySingleton<_i216.ClientsDebtsRepo>(
      () => _i217.ClientsDebtsRepoImpl(gh<_i48.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i218.PeriodicCommunicationRepo>(() =>
      _i219.PeriodicCommunicationRepoImpl(
          gh<_i41.PeriodicCommunicationDatasource>()));
  gh.factory<_i220.ImportantLinksRepo>(
      () => _i221.ImportantLinksRepoImpl(gh<_i66.ImportantLinksDatasource>()));
  gh.factory<_i222.ExportClientsToExcelUseCase>(() =>
      _i222.ExportClientsToExcelUseCase(gh<_i64.ClientsListDatasource>()));
  gh.lazySingleton<_i223.GetClientLogsUsecase>(
      () => _i223.GetClientLogsUsecase(gh<_i108.ClientLogsTabRepo>()));
  gh.lazySingleton<_i224.SupportClientsInvoicesRepo>(() =>
      _i225.SupportClientsInvoicesRepoImpl(
          gh<_i56.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i226.GetBranchesForUserUsecase>(
      () => _i226.GetBranchesForUserUsecase(gh<_i85.UsersRepository>()));
  gh.lazySingleton<_i227.GetLevelsForUserUsecase>(
      () => _i227.GetLevelsForUserUsecase(gh<_i85.UsersRepository>()));
  gh.lazySingleton<_i228.GetManagesForUserUsecase>(
      () => _i228.GetManagesForUserUsecase(gh<_i85.UsersRepository>()));
  gh.factory<_i229.GetUsersUsecase>(
      () => _i229.GetUsersUsecase(gh<_i85.UsersRepository>()));
  gh.factory<_i230.GetUserByIdUsecase>(
      () => _i230.GetUserByIdUsecase(gh<_i85.UsersRepository>()));
  gh.lazySingleton<_i231.GetSupportClientsInvoicesUseCase>(() =>
      _i231.GetSupportClientsInvoicesUseCase(
          gh<_i224.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i232.ManageWithdrawalsRepository>(() =>
      _i233.ManageWithdrawalsRepositoryImpl(
          gh<_i45.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i234.AgentsDistributorsRepo>(() =>
      _i235.AgentsDistributorsRepoImpl(
          gh<_i103.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i236.GetProductsSalesReportsUsecase>(() =>
      _i236.GetProductsSalesReportsUsecase(
          gh<_i148.ProductsSalesReportsRepo>()));
  gh.singleton<_i237.CitiesCubit>(
      () => _i237.CitiesCubit(gh<_i122.GetCitiesUseCase>()));
  gh.lazySingleton<_i238.GetNotUsingSystemUsecase>(
      () => _i238.GetNotUsingSystemUsecase(gh<_i36.NotUsingSystemRepo>()));
  gh.factory<_i239.UsersTypeCubit>(
      () => _i239.UsersTypeCubit(gh<_i114.GetUsersUsecase>()));
  gh.factory<_i240.ClientsListRepository>(
      () => _i241.ClientsListRepositoryImpl(gh<_i64.ClientsListDatasource>()));
  gh.factory<_i242.AddClientContactUseCase>(() =>
      _i242.AddClientContactUseCase(gh<_i115.AddClientContactRepository>()));
  gh.factory<_i243.AddParticipateCommentUsecase>(() =>
      _i243.AddParticipateCommentUsecase(
          gh<_i136.ParticipateListRepository>()));
  gh.factory<_i244.AddParticipateUserUsecase>(() =>
      _i244.AddParticipateUserUsecase(gh<_i136.ParticipateListRepository>()));
  gh.factory<_i245.EditParticipateUserUsecase>(() =>
      _i245.EditParticipateUserUsecase(gh<_i136.ParticipateListRepository>()));
  gh.factory<_i246.ParticipateClientListUsecase>(() =>
      _i246.ParticipateClientListUsecase(
          gh<_i136.ParticipateListRepository>()));
  gh.factory<_i247.ParticipateCommentListUsecase>(() =>
      _i247.ParticipateCommentListUsecase(
          gh<_i136.ParticipateListRepository>()));
  gh.factory<_i248.GetParticipateInvoiceByIdUsecase>(() =>
      _i248.GetParticipateInvoiceByIdUsecase(
          gh<_i136.ParticipateListRepository>()));
  gh.factory<_i249.ParticipateInvoiceListUsecase>(() =>
      _i249.ParticipateInvoiceListUsecase(
          gh<_i136.ParticipateListRepository>()));
  gh.factory<_i250.ParticipateListUsecase>(() =>
      _i250.ParticipateListUsecase(gh<_i136.ParticipateListRepository>()));
  gh.lazySingleton<_i251.ChangeParticipateStatusUsecase>(() =>
      _i251.ChangeParticipateStatusUsecase(
          gh<_i136.ParticipateListRepository>()));
  gh.factory<_i252.PendingInvoicesCubit>(
      () => _i252.PendingInvoicesCubit(gh<_i117.GetPendingInvoicesUsecase>()));
  gh.factory<_i253.EvaluationLevelReportCubit>(() =>
      _i253.EvaluationLevelReportCubit(
          gh<_i100.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i254.GetEmployeesSalesReportsUsecase>(() =>
      _i254.GetEmployeesSalesReportsUsecase(
          gh<_i132.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i255.GetGreetingCommunicationUseCase>(() =>
      _i255.GetGreetingCommunicationUseCase(
          gh<_i159.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i256.ClientsTransferApprovalsRepo>(() =>
      _i257.ClientsTransferApprovalsRepoImpl(
          gh<_i58.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i258.GetDeletedInvoicesUsecase>(
      () => _i258.GetDeletedInvoicesUsecase(gh<_i181.DeletedInvoicesRepo>()));
  gh.factory<_i259.ClientsContactsRepository>(() =>
      _i260.ClientsListRepositoryImpl(gh<_i63.ClientsContactsDatasource>()));
  gh.lazySingleton<_i261.GetClientsStatusReportsUsecase>(() =>
      _i261.GetClientsStatusReportsUsecase(
          gh<_i152.ClientsStatusReportsRepo>()));
  gh.factory<_i262.ActionLinkUsecase>(
      () => _i262.ActionLinkUsecase(gh<_i220.ImportantLinksRepo>()));
  gh.factory<_i263.GetImportantLinksUsecase>(
      () => _i263.GetImportantLinksUsecase(gh<_i220.ImportantLinksRepo>()));
  gh.lazySingleton<_i264.GetPreviousRatingsUsecase>(
      () => _i264.GetPreviousRatingsUsecase(gh<_i106.PreviousRatingsRepo>()));
  gh.lazySingleton<_i265.WaitingAgentsRepo>(
      () => _i266.WaitingAgentsRepoImpl(gh<_i144.WaitingAgentsDataSource>()));
  gh.factory<_i267.AddClientUserUsecase>(
      () => _i267.AddClientUserUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i268.ApproveRejectClientUsecase>(() =>
      _i268.ApproveRejectClientUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i269.ChangeClientCommunicationUseCase>(() =>
      _i269.ChangeClientCommunicationUseCase(
          gh<_i240.ClientsListRepository>()));
  gh.factory<_i270.ChangeTypeClientUsecase>(
      () => _i270.ChangeTypeClientUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i271.EditClientUserUsecase>(
      () => _i271.EditClientUserUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i272.GetClientsListByRegionUseCase>(() =>
      _i272.GetClientsListByRegionUseCase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i273.GetClientsListByUserUseCase>(() =>
      _i273.GetClientsListByUserUseCase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i274.GetClientsWithFilterUserUsecase>(() =>
      _i274.GetClientsWithFilterUserUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i275.GetClientMarketingReportUsecase>(() =>
      _i275.GetClientMarketingReportUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i276.GetRecommendedClientsUsecase>(() =>
      _i276.GetRecommendedClientsUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i277.GetSimilarClientsUsecase>(
      () => _i277.GetSimilarClientsUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i278.ReceiveClientUserUsecase>(
      () => _i278.ReceiveClientUserUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i279.StoreClientCommunicationUseCase>(() =>
      _i279.StoreClientCommunicationUseCase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i280.TransferClientUserUsecase>(
      () => _i280.TransferClientUserUsecase(gh<_i240.ClientsListRepository>()));
  gh.lazySingleton<_i281.GetHighSimilarClientsUsecase>(() =>
      _i281.GetHighSimilarClientsUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i282.EmployeesSalesReportsCubit>(() =>
      _i282.EmployeesSalesReportsCubit(
          gh<_i254.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i283.ChangeStateAgentUseCase>(
      () => _i283.ChangeStateAgentUseCase(gh<_i234.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i284.GetAgentsAndDistributorsUseCase>(() =>
      _i284.GetAgentsAndDistributorsUseCase(
          gh<_i234.AgentsDistributorsRepo>()));
  gh.factory<_i285.ClientsAcceptCubit>(
      () => _i285.ClientsAcceptCubit(gh<_i193.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i286.CancelWithdrawalUsecase>(() =>
      _i286.CancelWithdrawalUsecase(gh<_i232.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i287.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i287.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i232.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i288.GetWithdrawalsInvoicesUsecase>(() =>
      _i288.GetWithdrawalsInvoicesUsecase(
          gh<_i232.ManageWithdrawalsRepository>()));
  gh.factory<_i289.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i289.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i232.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i290.ExceededClientsUseCase>(
      () => _i290.ExceededClientsUseCase(gh<_i95.ExceededClientsRepo>()));
  gh.lazySingleton<_i291.TransferExceededClientsUseCase>(() =>
      _i291.TransferExceededClientsUseCase(gh<_i95.ExceededClientsRepo>()));
  gh.factory<_i292.ParticipateListBloc>(() => _i292.ParticipateListBloc(
        gh<_i250.ParticipateListUsecase>(),
        gh<_i244.AddParticipateUserUsecase>(),
        gh<_i245.EditParticipateUserUsecase>(),
        gh<_i246.ParticipateClientListUsecase>(),
        gh<_i249.ParticipateInvoiceListUsecase>(),
        gh<_i248.GetParticipateInvoiceByIdUsecase>(),
        gh<_i247.ParticipateCommentListUsecase>(),
        gh<_i243.AddParticipateCommentUsecase>(),
        gh<_i251.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i293.LoginLocalDataSource>(() =>
      _i293.LoginLocalDataSourceImpl(
          gh<_i163.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i294.EditAdvancedConfigsUsecase>(() =>
      _i294.EditAdvancedConfigsUsecase(gh<_i134.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i295.GetAdvancedConfigsUsecase>(() =>
      _i295.GetAdvancedConfigsUsecase(gh<_i134.AdvancedConfigsRepository>()));
  gh.factory<_i296.ClientsInstallReportsCubit>(() =>
      _i296.ClientsInstallReportsCubit(
          gh<_i105.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i297.DatesTableRepo>(
      () => _i298.DatesTableRepoImpl(gh<_i154.DatesTableDataSource>()));
  gh.factory<_i299.GetVersionUseCase>(
      () => _i299.GetVersionUseCase(gh<_i174.AppRepository>()));
  gh.factory<_i300.AddTicketCubit>(
      () => _i300.AddTicketCubit(gh<_i123.AddTicketUseCase>()));
  gh.lazySingleton<_i301.LatestClientsUpdatesRepository>(() =>
      _i302.LatestClientsUpdatesRepositoryImpl(
          gh<_i138.LatestClientsUpdatesDatasource>()));
  gh.factory<_i303.TaskRepository>(
      () => _i304.TaskRepositoryImpl(gh<_i104.TaskDatasource>()));
  gh.lazySingleton<_i305.EditGeneralConfigsUsecase>(() =>
      _i305.EditGeneralConfigsUsecase(gh<_i194.GeneralConfigsRepository>()));
  gh.lazySingleton<_i306.GetGeneralConfigsUsecase>(() =>
      _i306.GetGeneralConfigsUsecase(gh<_i194.GeneralConfigsRepository>()));
  gh.factory<_i307.PeriodicCommunicationReportsCubit>(() =>
      _i307.PeriodicCommunicationReportsCubit(
          gh<_i199.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i308.GetAllClientsContactsUseCase>(() =>
      _i308.GetAllClientsContactsUseCase(
          gh<_i259.ClientsContactsRepository>()));
  gh.factory<_i309.InstallQualityCubit>(
      () => _i309.InstallQualityCubit(gh<_i204.GetInstallUseCase>()));
  gh.factory<_i310.ClientsContactsBloc>(() =>
      _i310.ClientsContactsBloc(gh<_i308.GetAllClientsContactsUseCase>()));
  gh.factory<_i311.ImportantLinksCubit>(() => _i311.ImportantLinksCubit(
        gh<_i263.GetImportantLinksUsecase>(),
        gh<_i262.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i312.AddAgentUseCase>(
      () => _i312.AddAgentUseCase(gh<_i178.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i313.UpdateAgentUseCase>(() =>
      _i313.UpdateAgentUseCase(gh<_i178.AgentsDistributorsActionsRepo>()));
  gh.factory<_i314.AddClientContactBloc>(
      () => _i314.AddClientContactBloc(gh<_i242.AddClientContactUseCase>()));
  gh.lazySingleton<_i315.GetDelayInstallReportsUseCase>(() =>
      _i315.GetDelayInstallReportsUseCase(gh<_i172.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i316.CrudAgentSupportFilesUsecase>(() =>
      _i316.CrudAgentSupportFilesUsecase(
          gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i317.GetClientsTransferApprovalsUsecase>(() =>
      _i317.GetClientsTransferApprovalsUsecase(
          gh<_i256.ClientsTransferApprovalsRepo>()));
  gh.factory<_i318.ClientsStatusReportsCubit>(() =>
      _i318.ClientsStatusReportsCubit(
          gh<_i261.GetClientsStatusReportsUsecase>()));
  gh.factory<_i319.SupportTabCubit>(() => _i319.SupportTabCubit(
        gh<_i210.GetInvoiceByClientUsecase>(),
        gh<_i208.AddDateInstallUsecase>(),
        gh<_i213.SetDateDoneUsecase>(),
        gh<_i214.SetReadyInstallUsecase>(),
        gh<_i212.ReturnInvoiceApproveUsecase>(),
        gh<_i211.ReceiveDeviceUsecase>(),
        gh<_i209.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i320.ClientsDebtsReportsCubit>(() =>
      _i320.ClientsDebtsReportsCubit(
          gh<_i158.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i321.DeletedInvoicesCubit>(
      () => _i321.DeletedInvoicesCubit(gh<_i258.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i322.AddAgentDateUseCase>(() =>
      _i322.AddAgentDateUseCase(gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i323.GetManageWithdrawnInvoicesUsecase>(() =>
      _i323.GetManageWithdrawnInvoicesUsecase(
          gh<_i165.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i324.NotificationsCubit>(() => _i324.NotificationsCubit(
        gh<_i196.GetNotificationsUsecase>(),
        gh<_i198.MarkNotificationsAsReadUsecase>(),
        gh<_i197.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i325.WithdrawnInvoicesRepo>(() =>
      _i326.WithdrawnInvoicesRepoImpl(gh<_i140.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i327.RegionsRepository>(
      () => _i328.RegionsRepositoryImpl(gh<_i156.RegionsDatasource>()));
  gh.factory<_i329.ClientLogsTabCubit>(
      () => _i329.ClientLogsTabCubit(gh<_i223.GetClientLogsUsecase>()));
  gh.factory<_i330.RegionsSalesReportsCubit>(() =>
      _i330.RegionsSalesReportsCubit(
          gh<_i184.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i331.AgentsDistributorsActionsCubit>(
      () => _i331.AgentsDistributorsActionsCubit(
            gh<_i122.GetCitiesUseCase>(),
            gh<_i312.AddAgentUseCase>(),
            gh<_i313.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i332.FetchPaginatedClientsUsecase>(() =>
      _i332.FetchPaginatedClientsUsecase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i333.FetchLinkClientsUseCase>(
      () => _i333.FetchLinkClientsUseCase(gh<_i240.ClientsListRepository>()));
  gh.factory<_i334.LinkSelectedClientsUseCase>(() =>
      _i334.LinkSelectedClientsUseCase(gh<_i240.ClientsListRepository>()));
  gh.lazySingleton<_i335.LoginRepo>(() => _i336.LoginRepoImpl(
        gh<_i131.LoginRemoteDataSource>(),
        gh<_i293.LoginLocalDataSource>(),
      ));
  gh.factory<_i337.SpecialClientsBloc>(
      () => _i337.SpecialClientsBloc(gh<_i188.GetSpecialClientsUsecase>()));
  gh.factory<_i338.AddCommentUsecase>(
      () => _i338.AddCommentUsecase(gh<_i201.CompanyRepository>()));
  gh.factory<_i339.GetCommentUsecase>(
      () => _i339.GetCommentUsecase(gh<_i201.CompanyRepository>()));
  gh.factory<_i340.DelayInstallReportsCubit>(() =>
      _i340.DelayInstallReportsCubit(
          gh<_i315.GetDelayInstallReportsUseCase>()));
  gh.factory<_i341.DatesTimelineBloc>(
      () => _i341.DatesTimelineBloc(gh<_i205.GetTimelineByEmployeeUseCase>()));
  gh.factory<_i342.GreetingCommunicationCubit>(() =>
      _i342.GreetingCommunicationCubit(
          gh<_i255.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i343.GetRegionsUseCase>(
      () => _i343.GetRegionsUseCase(gh<_i327.RegionsRepository>()));
  gh.lazySingleton<_i344.GetLatestClientsUseCase>(() =>
      _i344.GetLatestClientsUseCase(
          gh<_i301.LatestClientsUpdatesRepository>()));
  gh.factory<_i345.AdvancedCofigsCubit>(() => _i345.AdvancedCofigsCubit(
        gh<_i295.GetAdvancedConfigsUsecase>(),
        gh<_i294.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i346.SupportClientsInvoicesCubit>(() =>
      _i346.SupportClientsInvoicesCubit(
          gh<_i231.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i347.WrongNumbersCubit>(
      () => _i347.WrongNumbersCubit(gh<_i192.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i348.CacheTokenUsecase>(
      () => _i348.CacheTokenUsecase(gh<_i335.LoginRepo>()));
  gh.lazySingleton<_i349.GetTokenUsecase>(
      () => _i349.GetTokenUsecase(gh<_i335.LoginRepo>()));
  gh.lazySingleton<_i350.LoginUsecase>(
      () => _i350.LoginUsecase(gh<_i335.LoginRepo>()));
  gh.lazySingleton<_i351.ValidateTokenUsecase>(
      () => _i351.ValidateTokenUsecase(gh<_i335.LoginRepo>()));
  gh.lazySingleton<_i352.VerifyOtpUsecase>(
      () => _i352.VerifyOtpUsecase(gh<_i335.LoginRepo>()));
  gh.factory<_i353.ClientsTransferApprovalsCubit>(() =>
      _i353.ClientsTransferApprovalsCubit(
          gh<_i317.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i354.RegionsCubit>(
      () => _i354.RegionsCubit(gh<_i343.GetRegionsUseCase>()));
  gh.factory<_i355.GeneralCofigsCubit>(() => _i355.GeneralCofigsCubit(
        gh<_i306.GetGeneralConfigsUsecase>(),
        gh<_i305.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i356.GetPeriodicCommunicationUseCase>(() =>
      _i356.GetPeriodicCommunicationUseCase(
          gh<_i218.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i357.GetClientsDebtsUsecase>(
      () => _i357.GetClientsDebtsUsecase(gh<_i216.ClientsDebtsRepo>()));
  gh.lazySingleton<_i358.CrudClientSupportFilesUsecase>(() =>
      _i358.CrudClientSupportFilesUsecase(
          repository: gh<_i240.ClientsListRepository>()));
  gh.lazySingleton<_i359.GetClientSupportFilesUsecase>(() =>
      _i359.GetClientSupportFilesUsecase(
          repository: gh<_i240.ClientsListRepository>()));
  gh.factory<_i360.BranchesCubit>(
      () => _i360.BranchesCubit(gh<_i200.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i361.AddAgentCommentUsecase>(() =>
      _i361.AddAgentCommentUsecase(gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i362.DoneTrainingUsecase>(() =>
      _i362.DoneTrainingUsecase(gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i363.GetAgentByIdUsecase>(() =>
      _i363.GetAgentByIdUsecase(gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i364.GetAgentClientListUsecase>(() =>
      _i364.GetAgentClientListUsecase(
          gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i365.GetAgentCommentsListUsecase>(() =>
      _i365.GetAgentCommentsListUsecase(
          gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i366.GetAgentDatesListUsecase>(() =>
      _i366.GetAgentDatesListUsecase(
          gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i367.GetAgentInvoiceListUsecase>(() =>
      _i367.GetAgentInvoiceListUsecase(
          gh<_i206.AgentsDistributorsProfileRepo>()));
  gh.factory<_i368.AddRejectReasonsUsecase>(() =>
      _i368.AddRejectReasonsUsecase(gh<_i232.ManageWithdrawalsRepository>()));
  gh.factory<_i369.EditRejectReasonsUsecase>(() =>
      _i369.EditRejectReasonsUsecase(gh<_i232.ManageWithdrawalsRepository>()));
  gh.factory<_i370.GetRejectReasonsUsecase>(() =>
      _i370.GetRejectReasonsUsecase(gh<_i232.ManageWithdrawalsRepository>()));
  gh.factory<_i371.GetUserSeriesUsecase>(() =>
      _i371.GetUserSeriesUsecase(gh<_i232.ManageWithdrawalsRepository>()));
  gh.factory<_i372.GetWithdrawnDetailsUsecase>(() =>
      _i372.GetWithdrawnDetailsUsecase(
          gh<_i232.ManageWithdrawalsRepository>()));
  gh.factory<_i373.SetApproveSeriesUsecase>(() =>
      _i373.SetApproveSeriesUsecase(gh<_i232.ManageWithdrawalsRepository>()));
  gh.factory<_i374.UpdateSeriesUsecase>(
      () => _i374.UpdateSeriesUsecase(gh<_i232.ManageWithdrawalsRepository>()));
  gh.factory<_i375.NotUsingSystemCubit>(
      () => _i375.NotUsingSystemCubit(gh<_i238.GetNotUsingSystemUsecase>()));
  gh.singleton<_i376.AppManagerCubit>(
      () => _i376.AppManagerCubit(gh<_i299.GetVersionUseCase>()));
  gh.lazySingleton<_i377.GetWaitingAgentsUsecase>(
      () => _i377.GetWaitingAgentsUsecase(gh<_i265.WaitingAgentsRepo>()));
  gh.factory<_i378.InvoicesSectionCubit>(() => _i378.InvoicesSectionCubit(
        gh<_i190.GetInvoicesByPrivilegesUsecase>(),
        gh<_i284.GetAgentsAndDistributorsUseCase>(),
        gh<_i250.ParticipateListUsecase>(),
        gh<_i215.GetAllUsersUseCase>(),
        gh<_i191.GetInvoiceByIdUsecase>(),
        gh<_i189.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i379.ProductsSalesReportsCubit>(() =>
      _i379.ProductsSalesReportsCubit(
          gh<_i236.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i380.GetWithdrawnInvoicesUsecase>(() =>
      _i380.GetWithdrawnInvoicesUsecase(gh<_i325.WithdrawnInvoicesRepo>()));
  gh.factory<_i381.PreviousRatingsCubit>(
      () => _i381.PreviousRatingsCubit(gh<_i264.GetPreviousRatingsUsecase>()));
  gh.factory<_i382.AgentsDistributorsCubit>(() => _i382.AgentsDistributorsCubit(
        gh<_i284.GetAgentsAndDistributorsUseCase>(),
        gh<_i283.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i383.ExceededClientsCubit>(() => _i383.ExceededClientsCubit(
        gh<_i290.ExceededClientsUseCase>(),
        gh<_i291.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i384.ClientsListBloc>(() => _i384.ClientsListBloc(
        gh<_i274.GetClientsWithFilterUserUsecase>(),
        gh<_i276.GetRecommendedClientsUsecase>(),
        gh<_i277.GetSimilarClientsUsecase>(),
        gh<_i267.AddClientUserUsecase>(),
        gh<_i271.EditClientUserUsecase>(),
        gh<_i270.ChangeTypeClientUsecase>(),
        gh<_i269.ChangeClientCommunicationUseCase>(),
        gh<_i279.StoreClientCommunicationUseCase>(),
        gh<_i268.ApproveRejectClientUsecase>(),
        gh<_i358.CrudClientSupportFilesUsecase>(),
        gh<_i359.GetClientSupportFilesUsecase>(),
        gh<_i280.TransferClientUserUsecase>(),
        gh<_i278.ReceiveClientUserUsecase>(),
        gh<_i275.GetClientMarketingReportUsecase>(),
        gh<_i281.GetHighSimilarClientsUsecase>(),
        gh<_i333.FetchLinkClientsUseCase>(),
        gh<_i332.FetchPaginatedClientsUsecase>(),
        gh<_i334.LinkSelectedClientsUseCase>(),
        gh<_i222.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i385.ManageWithdrawalsCubit>(() => _i385.ManageWithdrawalsCubit(
        gh<_i371.GetUserSeriesUsecase>(),
        gh<_i374.UpdateSeriesUsecase>(),
        gh<_i229.GetUsersUsecase>(),
        gh<_i288.GetWithdrawalsInvoicesUsecase>(),
        gh<_i289.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i373.SetApproveSeriesUsecase>(),
        gh<_i372.GetWithdrawnDetailsUsecase>(),
        gh<_i368.AddRejectReasonsUsecase>(),
        gh<_i370.GetRejectReasonsUsecase>(),
        gh<_i369.EditRejectReasonsUsecase>(),
        gh<_i287.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i286.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i386.ManageWithdrawnInvoicesCubit>(() =>
      _i386.ManageWithdrawnInvoicesCubit(
          gh<_i323.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i387.LatestClientsUpdatesCubit>(() =>
      _i387.LatestClientsUpdatesCubit(gh<_i344.GetLatestClientsUseCase>()));
  gh.factory<_i388.AttachmentsRowCubit>(() => _i388.AttachmentsRowCubit(
        gh<_i359.GetClientSupportFilesUsecase>(),
        gh<_i358.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i389.CancelScheduleUsecase>(
      () => _i389.CancelScheduleUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i390.ChangeDateToDonUsecase>(
      () => _i390.ChangeDateToDonUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i391.GetCancelReasonsUsecase>(
      () => _i391.GetCancelReasonsUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i392.GetDateInstallationUsecase>(
      () => _i392.GetDateInstallationUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i393.GetInvoicesByClientForDateUsecase>(() =>
      _i393.GetInvoicesByClientForDateUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i394.GetSubscribedClientsUsecase>(
      () => _i394.GetSubscribedClientsUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i395.RescheduleDateUsecase>(
      () => _i395.RescheduleDateUsecase(gh<_i297.DatesTableRepo>()));
  gh.lazySingleton<_i396.ReturnScheduleVisitToOpenUsecase>(
      () => _i396.ReturnScheduleVisitToOpenUsecase(gh<_i297.DatesTableRepo>()));
  gh.factory<_i397.AddTaskUsecase>(
      () => _i397.AddTaskUsecase(gh<_i303.TaskRepository>()));
  gh.factory<_i398.ChangeStatusTaskUsecase>(
      () => _i398.ChangeStatusTaskUsecase(gh<_i303.TaskRepository>()));
  gh.factory<_i399.GetTasksUsecase>(
      () => _i399.GetTasksUsecase(gh<_i303.TaskRepository>()));
  gh.factory<_i400.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i400.GetUsersByDepartmentAndRegionUsecase(gh<_i303.TaskRepository>()));
  gh.lazySingleton<_i401.TaskCubit>(() => _i401.TaskCubit(
        gh<_i397.AddTaskUsecase>(),
        gh<_i399.GetTasksUsecase>(),
        gh<_i398.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i402.UsersCubit>(() => _i402.UsersCubit(
        gh<_i229.GetUsersUsecase>(),
        gh<_i230.GetUserByIdUsecase>(),
        gh<_i97.ActionUserUsecase>(),
        gh<_i400.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i228.GetManagesForUserUsecase>(),
        gh<_i227.GetLevelsForUserUsecase>(),
        gh<_i226.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i403.CompanyCubit>(() => _i403.CompanyCubit(
        gh<_i339.GetCommentUsecase>(),
        gh<_i338.AddCommentUsecase>(),
      ));
  gh.factory<_i404.ClientsDebtsCubit>(
      () => _i404.ClientsDebtsCubit(gh<_i357.GetClientsDebtsUsecase>()));
  gh.factory<_i405.PeriodicCommunicationCubit>(() =>
      _i405.PeriodicCommunicationCubit(
          gh<_i356.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i406.LoginCubit>(() => _i406.LoginCubit(
        gh<_i350.LoginUsecase>(),
        gh<_i352.VerifyOtpUsecase>(),
        gh<_i348.CacheTokenUsecase>(),
        gh<_i349.GetTokenUsecase>(),
        gh<_i351.ValidateTokenUsecase>(),
      ));
  gh.factory<_i407.AgentsDistributorsProfileBloc>(
      () => _i407.AgentsDistributorsProfileBloc(
            gh<_i363.GetAgentByIdUsecase>(),
            gh<_i364.GetAgentClientListUsecase>(),
            gh<_i367.GetAgentInvoiceListUsecase>(),
            gh<_i248.GetParticipateInvoiceByIdUsecase>(),
            gh<_i365.GetAgentCommentsListUsecase>(),
            gh<_i361.AddAgentCommentUsecase>(),
            gh<_i362.DoneTrainingUsecase>(),
            gh<_i322.AddAgentDateUseCase>(),
            gh<_i366.GetAgentDatesListUsecase>(),
            gh<_i316.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i408.DatesTableCubit>(() => _i408.DatesTableCubit(
        gh<_i392.GetDateInstallationUsecase>(),
        gh<_i395.RescheduleDateUsecase>(),
        gh<_i390.ChangeDateToDonUsecase>(),
        gh<_i389.CancelScheduleUsecase>(),
        gh<_i396.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i394.GetSubscribedClientsUsecase>(),
        gh<_i393.GetInvoicesByClientForDateUsecase>(),
        gh<_i208.AddDateInstallUsecase>(),
        gh<_i391.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i409.WithdrawnInvoicesCubit>(() =>
      _i409.WithdrawnInvoicesCubit(gh<_i380.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i410.WaitingAgentsCubit>(
      () => _i410.WaitingAgentsCubit(gh<_i377.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i411.AppModule {}
