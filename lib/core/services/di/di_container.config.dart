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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i61;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i183;
import '../../../features/app/domain/repositories/app_repository.dart' as _i182;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i311;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i388;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i305;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i135;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i348;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i347;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i360;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i361;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i362;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i363;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i364;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i418;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i32;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i48;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i47;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i201;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i297;
import '../../../features/clients_care/activities_clients/data/data_sources/clients_activities_datasource.dart'
    as _i68;
import '../../../features/clients_care/activities_clients/data/repositories/clients_activities_repo_impl.dart'
    as _i145;
import '../../../features/clients_care/activities_clients/domain/repositories/clients_activities_repo.dart'
    as _i144;
import '../../../features/clients_care/activities_clients/domain/use_cases/get_all_clients_activities_usecase.dart'
    as _i151;
import '../../../features/clients_care/activities_clients/domain/use_cases/update_activity_usecase.dart'
    as _i152;
import '../../../features/clients_care/activities_clients/presentation/manager/clients_activities_bloc.dart'
    as _i211;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i28;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i98;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i97;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i122;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i193;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i25;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i38;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i37;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i248;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i387;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i56;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i73;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i72;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i127;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i128;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i129;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i131;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i130;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i132;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i312;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i159;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i133;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i27;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i40;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i39;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i200;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i359;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i11;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i52;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i51;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i104;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i264;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i18;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i168;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i167;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i266;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i354;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i53;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i177;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i176;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i213;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i321;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i42;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i229;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i228;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i368;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i417;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i34;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i45;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i44;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i207;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i319;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i26;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i111;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i110;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i276;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i393;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i62;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i154;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i153;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i196;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i349;
import '../../../features/clients_care/violations_clienta_care/data/data_sources/violations_clients_care_datasource.dart'
    as _i31;
import '../../../features/clients_care/violations_clienta_care/data/repositories/violations_repository_impl.dart'
    as _i95;
import '../../../features/clients_care/violations_clienta_care/domain/repositories/violations_repository.dart'
    as _i94;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_violations_usecase.dart'
    as _i214;
import '../../../features/clients_care/violations_clienta_care/presentation/manager/violations_cubit.dart'
    as _i269;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i96;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i103;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i102;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i208;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i372;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i70;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i125;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i124;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i126;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i247;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i76;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i113;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i112;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i233;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i340;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i117;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i195;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i194;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i218;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i219;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i220;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i221;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i222;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i223;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i224;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i330;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i164;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i339;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i338;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i355;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i366;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i69;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i86;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i85;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i118;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i249;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i3;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i71;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i139;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i138;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i306;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i307;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i357;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i89;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i203;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i202;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i317;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i318;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i367;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i17;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i55;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i54;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i115;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i116;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i134;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i14;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i179;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i178;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i185;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i184;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i212;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i58;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i88;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i87;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i101;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i236;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i237;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i238;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i240;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i239;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i414;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i46;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i243;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i242;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i380;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i298;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i381;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i299;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i382;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i383;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i301;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i300;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i384;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i385;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i386;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i397;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i30;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i29;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i204;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i205;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i206;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i335;
import '../../../features/sales/clients/add_client_contact/data/data_sources/add_client_contact_datasource.dart'
    as _i63;
import '../../../features/sales/clients/add_client_contact/data/repositories/add_client_contact_repo_impl.dart'
    as _i120;
import '../../../features/sales/clients/add_client_contact/domain/repositories/add_client_contact_repo.dart'
    as _i119;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/add_client_contact_usecase.dart'
    as _i252;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/update_client_contact_usecase.dart'
    as _i253;
import '../../../features/sales/clients/add_client_contact/presentation/manager/add_client_contact_bloc.dart'
    as _i342;
import '../../../features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart'
    as _i64;
import '../../../features/sales/clients/clients_contacts/data/repositories/clients_contacts_repo_impl.dart'
    as _i272;
import '../../../features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart'
    as _i271;
import '../../../features/sales/clients/clients_contacts/domain/use_cases/get_all_clients_contacts_usecase.dart'
    as _i320;
import '../../../features/sales/clients/clients_contacts/presentation/manager/clients_contacts_bloc.dart'
    as _i322;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i49;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i227;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i226;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i369;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i416;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i65;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i36;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i251;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i250;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i279;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i280;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_client_communication_usecase.dart'
    as _i281;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i282;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i370;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i283;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i232;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i345;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i344;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i287;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i371;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i284;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i285;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i286;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i293;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i288;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i289;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i346;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i290;
import '../../../features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart'
    as _i291;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i292;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i396;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i59;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i268;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i267;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i328;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i365;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i50;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i91;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i90;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i155;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i188;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i142;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i314;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i313;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i356;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i399;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i13;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i93;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i92;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i121;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i263;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i66;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i210;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i209;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i350;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i351;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i415;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i114;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i190;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i189;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i270;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i332;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i60;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i100;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i99;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i302;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i303;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i395;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i123;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i148;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i147;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i197;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i225;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i199;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i198;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i390;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i143;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i174;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i173;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i334;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i398;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i19;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i107;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i158;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i187;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i217;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i245;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i186;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i216;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i244;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i373;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i333;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i324;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i295;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i327;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i374;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i375;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i376;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i377;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i378;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i379;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i296;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i325;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i343;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i419;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i394;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i67;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i231;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i230;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i274;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i275;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i323;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i41;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i141;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i140;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i254;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i255;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i262;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i256;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i257;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i258;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i259;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i260;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i261;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i304;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i79;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i78;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i166;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i331;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i33;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i161;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i160;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i273;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i329;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i43;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i137;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i136;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i265;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i294;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i16;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i157;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i156;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i246;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i391;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i75;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i74;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i192;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i341;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i146;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i337;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i336;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i392;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i421;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i22;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i106;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i105;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i109;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i308;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i162;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i310;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i309;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i401;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i402;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i403;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i404;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i405;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i406;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i407;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i408;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i420;
import '../../../features/support/dates_timeline/data/data_sources/dates_timeline_datasource.dart'
    as _i77;
import '../../../features/support/dates_timeline/data/respositories_impl/dates_timeline_repo_impl.dart'
    as _i170;
import '../../../features/support/dates_timeline/domain/respositories/dates_timline_repo.dart'
    as _i169;
import '../../../features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart'
    as _i215;
import '../../../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart'
    as _i353;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i12;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i83;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i82;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i163;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i191;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i35;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i181;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i180;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i326;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i352;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i10;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i81;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i80;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i84;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i149;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i57;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i235;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i234;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i241;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i358;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i150;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i278;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i277;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i389;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i422;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i108;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i316;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i315;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i409;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i410;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i411;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i412;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i413;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i400;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i171;
import '../cache_services/prefs_consumer.dart' as _i175;
import '../cache_services/secure_storage_consumer.dart' as _i172;
import '../maps/location_services.dart' as _i165;
import 'di_container.dart' as _i423;

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
  gh.lazySingleton<_i31.VioltionsClientsCareDatasource>(
      () => _i31.VioltionsClientsCareDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i32.ClientsAcceptDatasource>(
      () => _i32.ClientsAcceptDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i33.ClientsStatusReportsDatasource>(
      () => _i33.ClientsStatusReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i34.PeriodicCommunicationReportsDatasource>(() =>
      _i34.PeriodicCommunicationReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i35.DelayInstallReportsDatasource>(
      () => _i35.DelayInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i36.LinkClientApiService>(
      () => _i36.LinkClientApiService(gh<_i5.Dio>()));
  gh.lazySingleton<_i37.NotUsingSystemRepo>(
      () => _i38.NotUsingSystemRepoImpl(gh<_i25.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i39.WrongNumbersRepo>(
      () => _i40.WrongNumbersRepoImpl(gh<_i27.WrongNumbersDatasource>()));
  gh.lazySingleton<_i41.ParticipatesListDatasource>(
      () => _i41.ParticipatesListDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i42.PeriodicCommunicationDatasource>(
      () => _i42.PeriodicCommunicationDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i43.EmployeesSalesReportsDatasource>(
      () => _i43.EmployeesSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i44.PeriodicCommunicationReportsRepo>(() =>
      _i45.PeriodicCommunicationReportsRepoImpl(
          gh<_i34.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i46.ManageWithdrawalsDatasource>(
      () => _i46.ManageWithdrawalsDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i47.ClientsAcceptRepository>(() =>
      _i48.ClientsAcceptRepositoryImpl(gh<_i32.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i49.ClientsDebtsDatasource>(
      () => _i49.ClientsDebtsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i50.FinancePendingDatasource>(
      () => _i50.FinancePendingDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i51.EvaluationLevelReportRepo>(() =>
      _i52.EvaluationLevelReportRepoImpl(
          gh<_i11.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i53.InstallQualityDatasource>(
      () => _i53.InstallQualityDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i54.LevelsRepo>(
      () => _i55.LevelsRepoImpl(gh<_i17.LevelsDatasource>()));
  gh.lazySingleton<_i56.TicketsDataSource>(
      () => _i56.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i57.SupportClientsInvoicesDatasource>(
      () => _i57.DelayInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i58.UsersDatasource>(
      () => _i58.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.singletonAsync<_i20.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i21.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i59.ClientsTransferApprovalsDatasource>(
      () => _i59.ClientsTransferApprovalsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i60.ExceededClientsDatasource>(
      () => _i60.ExceededClientsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i61.AppDatasource>(
      () => _i61.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i62.SpecialClientsDatasource>(
      () => _i62.SpecialClientsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i63.AddClientsContactsDatasource>(
      () => _i63.AddClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i64.ClientsContactsDatasource>(
      () => _i64.ClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i65.ClientsListDatasource>(
      () => _i65.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i66.CommentCompanyDatasource>(
      () => _i66.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i67.ImportantLinksDatasource>(
      () => _i67.ImportantLinksDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i68.ClientsActivitiesDatasource>(
      () => _i68.ClientsActivitiesDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i69.UsersDatasource>(
      () => _i69.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i70.CitiesDatasource>(
      () => _i70.CitiesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i71.AdvancedConfigsDatasource>(
      () => _i71.AdvancedConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i72.TicketsRepo>(
      () => _i73.TicketsRepoImpl(gh<_i56.TicketsDataSource>()));
  gh.lazySingleton<_i74.RegionsSalesReportsRepo>(() =>
      _i75.RegionsSalesReportsRepoImpl(
          gh<_i23.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i76.ClientLogsTabDataSource>(
      () => _i76.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i77.DatesTimelineDatasource>(
      () => _i77.DatesTimelineDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i78.ClientsDebtsReportsRepo>(() =>
      _i79.ClientsDebtsReportsRepoImpl(
          gh<_i24.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i80.SupportClientsAcceptRepository>(() =>
      _i81.SupportClientsAcceptRepositoryImpl(
          gh<_i10.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i82.DelayAfterInstallRepo>(() =>
      _i83.DelayAfterInstallRepoImpl(gh<_i12.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i84.GetSupportClientsAcceptUseCase>(() =>
      _i84.GetSupportClientsAcceptUseCase(
          gh<_i80.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i85.UsersRepository>(
      () => _i86.UsersRepositoryImpl(gh<_i69.UsersDatasource>()));
  gh.lazySingleton<_i87.UsersRepository>(
      () => _i88.UsersRepositoryImpl(gh<_i58.UsersDatasource>()));
  gh.lazySingleton<_i89.GeneralConfigsDatasource>(
      () => _i89.GeneralConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i90.FinancePendingRepo>(
      () => _i91.FinancePendingRepoImpl(gh<_i50.FinancePendingDatasource>()));
  gh.lazySingleton<_i92.PendingInvoicesRepo>(
      () => _i93.PendingInvoicesRepoImpl(gh<_i13.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i94.ViolationsRepository>(() =>
      _i95.ViolationsRepositoryImpl(gh<_i31.VioltionsClientsCareDatasource>()));
  gh.lazySingleton<_i96.BranchesDatasource>(
      () => _i96.BranchesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i97.ClientsCareReportsRepo>(() =>
      _i98.ClientsCareReportsRepoImpl(gh<_i28.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i99.ExceededClientsRepo>(() =>
      _i100.ExceededClientsRepoImpl(gh<_i60.ExceededClientsDatasource>()));
  gh.factory<_i101.ActionUserUsecase>(
      () => _i101.ActionUserUsecase(gh<_i87.UsersRepository>()));
  gh.lazySingleton<_i102.BranchesRepository>(
      () => _i103.BranchesRepositoryImpl(gh<_i96.BranchesDatasource>()));
  gh.lazySingleton<_i104.GetEvaluationLevelReportUsecase>(() =>
      _i104.GetEvaluationLevelReportUsecase(
          gh<_i51.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i105.ClientsInstallReportsRepo>(() =>
      _i106.ClientsInstallReportsRepoImpl(
          gh<_i22.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i107.AgentsDistributorsDataSource>(
      () => _i107.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i108.TaskDatasource>(
      () => _i108.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i109.GetClientsInstallReportsUsecase>(() =>
      _i109.GetClientsInstallReportsUsecase(
          gh<_i105.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i110.PreviousRatingsRepo>(() =>
      _i111.PreviousRatingsRepoImpl(gh<_i26.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i112.ClientLogsTabRepo>(
      () => _i113.ClientLogsTabRepoImpl(gh<_i76.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i114.DeletedInvoicesDatasource>(
      () => _i114.DeletedInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i115.AddLevelUsecase>(
      () => _i115.AddLevelUsecase(gh<_i54.LevelsRepo>()));
  gh.lazySingleton<_i116.GetLevelsUsecase>(
      () => _i116.GetLevelsUsecase(gh<_i54.LevelsRepo>()));
  gh.lazySingleton<_i117.SupportTabDataSource>(
      () => _i117.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i118.GetUsersUsecase>(
      () => _i118.GetUsersUsecase(gh<_i85.UsersRepository>()));
  gh.factory<_i119.AddClientContactRepository>(() =>
      _i120.AddClientContactRepositoryImpl(
          gh<_i63.AddClientsContactsDatasource>()));
  gh.lazySingleton<_i121.GetPendingInvoicesUsecase>(
      () => _i121.GetPendingInvoicesUsecase(gh<_i92.PendingInvoicesRepo>()));
  gh.lazySingleton<_i122.GetClientsCareReportsUsecase>(() =>
      _i122.GetClientsCareReportsUsecase(gh<_i97.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i123.InvoicesTabDataSource>(
      () => _i123.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i124.CitiesRepository>(
      () => _i125.CitiesRepositoryImpl(gh<_i70.CitiesDatasource>()));
  gh.lazySingleton<_i126.GetCitiesUseCase>(
      () => _i126.GetCitiesUseCase(gh<_i124.CitiesRepository>()));
  gh.lazySingleton<_i127.AddTicketUseCase>(
      () => _i127.AddTicketUseCase(gh<_i72.TicketsRepo>()));
  gh.lazySingleton<_i128.EditTicketTypeUseCase>(
      () => _i128.EditTicketTypeUseCase(gh<_i72.TicketsRepo>()));
  gh.lazySingleton<_i129.GetClientTicketsUseCase>(
      () => _i129.GetClientTicketsUseCase(gh<_i72.TicketsRepo>()));
  gh.lazySingleton<_i130.GetTicketsUseCase>(
      () => _i130.GetTicketsUseCase(gh<_i72.TicketsRepo>()));
  gh.lazySingleton<_i131.GetTicketByIdUseCase>(
      () => _i131.GetTicketByIdUseCase(gh<_i72.TicketsRepo>()));
  gh.lazySingleton<_i132.TransferTicketUseCase>(
      () => _i132.TransferTicketUseCase(gh<_i72.TicketsRepo>()));
  gh.factory<_i133.TicketsCubit>(() => _i133.TicketsCubit(
        gh<_i130.GetTicketsUseCase>(),
        gh<_i131.GetTicketByIdUseCase>(),
        gh<_i129.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i134.LevelsCubit>(() => _i134.LevelsCubit(
        gh<_i116.GetLevelsUsecase>(),
        gh<_i115.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i135.LoginRemoteDataSource>(
      () => _i135.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i136.EmployeesSalesReportsRepo>(() =>
      _i137.EmployeesSalesReportsRepoImpl(
          gh<_i43.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i138.AdvancedConfigsRepository>(() =>
      _i139.AdvancedConfigsRepositoryImpl(
          gh<_i71.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i140.ParticipateListRepository>(() =>
      _i141.ParticipateListRepositoryImpl(
          gh<_i41.ParticipatesListDatasource>()));
  gh.lazySingleton<_i142.LatestClientsUpdatesDatasource>(
      () => _i142.LatestClientsUpdatesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i143.ManageWithdrawnInvoicesDataSource>(
      () => _i143.ManageWithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i144.ClientsActivitiesRepository>(() =>
      _i145.ClientsListRepositoryImpl(gh<_i68.ClientsActivitiesDatasource>()));
  gh.lazySingleton<_i146.WithdrawnInvoicesDataSource>(
      () => _i146.WithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i147.InvoicesSectionRepo>(
      () => _i148.InvoicesTabRepoImpl(gh<_i123.InvoicesTabDataSource>()));
  gh.factory<_i149.SupportClientsAcceptCubit>(() =>
      _i149.SupportClientsAcceptCubit(
          gh<_i84.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i150.WaitingAgentsDataSource>(
      () => _i150.WaitingAgentsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i151.GetAllClientsActivitiesUseCase>(() =>
      _i151.GetAllClientsActivitiesUseCase(
          gh<_i144.ClientsActivitiesRepository>()));
  gh.factory<_i152.UpdateActivityUseCase>(() =>
      _i152.UpdateActivityUseCase(gh<_i144.ClientsActivitiesRepository>()));
  gh.factory<_i153.SpecialClientsRepository>(() =>
      _i154.SpecialClientsRepositoryImpl(gh<_i62.SpecialClientsDatasource>()));
  gh.lazySingleton<_i155.GetFinancePendingInvoicesUsecase>(() =>
      _i155.GetFinancePendingInvoicesUsecase(gh<_i90.FinancePendingRepo>()));
  gh.lazySingleton<_i156.ProductsSalesReportsRepo>(() =>
      _i157.ProductsSalesReportsRepoImpl(
          gh<_i16.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i158.AgentsDistributorsProfileDataSource>(() =>
      _i158.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i159.EditTicketCubit>(() => _i159.EditTicketCubit(
        gh<_i128.EditTicketTypeUseCase>(),
        gh<_i132.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i160.ClientsStatusReportsRepo>(() =>
      _i161.ClientsStatusReportsRepoImpl(
          gh<_i33.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i162.DatesTableDataSource>(
      () => _i162.DatesTableDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i163.GetDelayAfterInstallUseCase>(() =>
      _i163.GetDelayAfterInstallUseCase(gh<_i82.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i164.RegionsDatasource>(
      () => _i164.RegionsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i165.LocationServices>(
      () => _i165.LocationServices(gh<_i7.Location>()));
  gh.lazySingleton<_i166.GetClientsDebtsReportsUsecase>(() =>
      _i166.GetClientsDebtsReportsUsecase(gh<_i78.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i167.GreetingCommunicationRepo>(() =>
      _i168.GreetingCommunicationRepoImpl(
          gh<_i18.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i169.DatesTimeLinesRepo>(
      () => _i170.DatesTimelineRepoImpl(gh<_i77.DatesTimelineDatasource>()));
  gh.singleton<_i171.CacheServices>(
    () => _i172.SecureStorageConsumer(gh<_i21.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i173.ManageWithdrawnInvoicesRepo>(() =>
      _i174.ManageWithdrawnInvoicesRepoImpl(
          gh<_i143.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i171.CacheServices>(() async =>
      _i175.PrefsConsumer(await gh.getAsync<_i20.SharedPreferences>()));
  gh.lazySingleton<_i176.InstallQualityRepo>(
      () => _i177.InstallQualityRepoImpl(gh<_i53.InstallQualityDatasource>()));
  gh.lazySingleton<_i178.PrivilegesRepo>(
      () => _i179.PrivilegesRepoImpl(gh<_i14.PrivilegesDatasource>()));
  gh.lazySingleton<_i180.DelayInstallReportsRepo>(() =>
      _i181.DelayInstallReportsRepoImpl(
          gh<_i35.DelayInstallReportsDatasource>()));
  gh.factory<_i182.AppRepository>(
      () => _i183.AppRepositoryImpl(gh<_i61.AppDatasource>()));
  gh.factory<_i184.UpdatePrivilegesUsecase>(
      () => _i184.UpdatePrivilegesUsecase(gh<_i178.PrivilegesRepo>()));
  gh.lazySingleton<_i185.GetPrivilegesUsecase>(
      () => _i185.GetPrivilegesUsecase(gh<_i178.PrivilegesRepo>()));
  gh.lazySingleton<_i186.AgentsDistributorsActionsRepo>(() =>
      _i187.AgentsDistributorsActionsRepoImpl(
          gh<_i19.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i188.FinancePendingCubit>(() =>
      _i188.FinancePendingCubit(gh<_i155.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i189.DeletedInvoicesRepo>(() =>
      _i190.DeletedInvoicesRepoImpl(gh<_i114.DeletedInvoicesDatasource>()));
  gh.factory<_i191.DelayAfterInstallCubit>(() =>
      _i191.DelayAfterInstallCubit(gh<_i163.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i192.GetRegionsSalesReportsUsecase>(() =>
      _i192.GetRegionsSalesReportsUsecase(gh<_i74.RegionsSalesReportsRepo>()));
  gh.factory<_i193.ClientsCareReportsCubit>(() =>
      _i193.ClientsCareReportsCubit(gh<_i122.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i194.SupportTabRepo>(
      () => _i195.SupportTabRepoImpl(gh<_i117.SupportTabDataSource>()));
  gh.factory<_i196.GetSpecialClientsUsecase>(() =>
      _i196.GetSpecialClientsUsecase(gh<_i153.SpecialClientsRepository>()));
  gh.lazySingleton<_i197.ExportInvoicesToExcelUsecase>(() =>
      _i197.ExportInvoicesToExcelUsecase(gh<_i147.InvoicesSectionRepo>()));
  gh.lazySingleton<_i198.GetInvoicesByPrivilegesUsecase>(() =>
      _i198.GetInvoicesByPrivilegesUsecase(gh<_i147.InvoicesSectionRepo>()));
  gh.lazySingleton<_i199.GetInvoiceByIdUsecase>(
      () => _i199.GetInvoiceByIdUsecase(gh<_i147.InvoicesSectionRepo>()));
  gh.lazySingleton<_i200.GetWrongNumbersUsecase>(
      () => _i200.GetWrongNumbersUsecase(gh<_i39.WrongNumbersRepo>()));
  gh.lazySingleton<_i201.GetClientsAcceptUseCase>(
      () => _i201.GetClientsAcceptUseCase(gh<_i47.ClientsAcceptRepository>()));
  gh.lazySingleton<_i202.GeneralConfigsRepository>(() =>
      _i203.GeneralConfigsRepositoryImpl(gh<_i89.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i204.GetNotificationsUsecase>(
      () => _i204.GetNotificationsUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i205.GetUnreadNotificationsCountUsecase>(() =>
      _i205.GetUnreadNotificationsCountUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i206.MarkNotificationsAsReadUsecase>(
      () => _i206.MarkNotificationsAsReadUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i207.GetPeriodicCommunicationReportsUsecase>(() =>
      _i207.GetPeriodicCommunicationReportsUsecase(
          gh<_i44.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i208.GetBranchesByIdCountryUseCase>(() =>
      _i208.GetBranchesByIdCountryUseCase(gh<_i102.BranchesRepository>()));
  gh.factory<_i209.CompanyRepository>(
      () => _i210.CompanyRepositoryImpl(gh<_i66.CommentCompanyDatasource>()));
  gh.factory<_i211.ClientsActivitiesBloc>(() => _i211.ClientsActivitiesBloc(
        gh<_i151.GetAllClientsActivitiesUseCase>(),
        gh<_i152.UpdateActivityUseCase>(),
      ));
  gh.singleton<_i212.PrivilegesCubit>(() => _i212.PrivilegesCubit(
        gh<_i185.GetPrivilegesUsecase>(),
        gh<_i184.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i213.GetInstallUseCase>(
      () => _i213.GetInstallUseCase(gh<_i176.InstallQualityRepo>()));
  gh.lazySingleton<_i214.GetViolationsUsecase>(
      () => _i214.GetViolationsUsecase(gh<_i94.ViolationsRepository>()));
  gh.lazySingleton<_i215.GetTimelineByEmployeeUseCase>(
      () => _i215.GetTimelineByEmployeeUseCase(gh<_i169.DatesTimeLinesRepo>()));
  gh.lazySingleton<_i216.AgentsDistributorsProfileRepo>(() =>
      _i217.AgentsDistributorsProfileRepoImpl(
          gh<_i158.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i218.AddDateInstallUsecase>(
      () => _i218.AddDateInstallUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i219.CancelDateInstallUsecase>(
      () => _i219.CancelDateInstallUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i220.GetInvoiceByClientUsecase>(
      () => _i220.GetInvoiceByClientUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i221.ReceiveDeviceUsecase>(
      () => _i221.ReceiveDeviceUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i222.ReturnInvoiceApproveUsecase>(
      () => _i222.ReturnInvoiceApproveUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i223.SetDateDoneUsecase>(
      () => _i223.SetDateDoneUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i224.SetReadyInstallUsecase>(
      () => _i224.SetReadyInstallUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i225.GetAllUsersUseCase>(
      () => _i225.GetAllUsersUseCase(gh<_i147.InvoicesSectionRepo>()));
  gh.lazySingleton<_i226.ClientsDebtsRepo>(
      () => _i227.ClientsDebtsRepoImpl(gh<_i49.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i228.PeriodicCommunicationRepo>(() =>
      _i229.PeriodicCommunicationRepoImpl(
          gh<_i42.PeriodicCommunicationDatasource>()));
  gh.factory<_i230.ImportantLinksRepo>(
      () => _i231.ImportantLinksRepoImpl(gh<_i67.ImportantLinksDatasource>()));
  gh.factory<_i232.ExportClientsToExcelUseCase>(() =>
      _i232.ExportClientsToExcelUseCase(gh<_i65.ClientsListDatasource>()));
  gh.lazySingleton<_i233.GetClientLogsUsecase>(
      () => _i233.GetClientLogsUsecase(gh<_i112.ClientLogsTabRepo>()));
  gh.lazySingleton<_i234.SupportClientsInvoicesRepo>(() =>
      _i235.SupportClientsInvoicesRepoImpl(
          gh<_i57.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i236.GetBranchesForUserUsecase>(
      () => _i236.GetBranchesForUserUsecase(gh<_i87.UsersRepository>()));
  gh.lazySingleton<_i237.GetLevelsForUserUsecase>(
      () => _i237.GetLevelsForUserUsecase(gh<_i87.UsersRepository>()));
  gh.lazySingleton<_i238.GetManagesForUserUsecase>(
      () => _i238.GetManagesForUserUsecase(gh<_i87.UsersRepository>()));
  gh.factory<_i239.GetUsersUsecase>(
      () => _i239.GetUsersUsecase(gh<_i87.UsersRepository>()));
  gh.factory<_i240.GetUserByIdUsecase>(
      () => _i240.GetUserByIdUsecase(gh<_i87.UsersRepository>()));
  gh.lazySingleton<_i241.GetSupportClientsInvoicesUseCase>(() =>
      _i241.GetSupportClientsInvoicesUseCase(
          gh<_i234.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i242.ManageWithdrawalsRepository>(() =>
      _i243.ManageWithdrawalsRepositoryImpl(
          gh<_i46.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i244.AgentsDistributorsRepo>(() =>
      _i245.AgentsDistributorsRepoImpl(
          gh<_i107.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i246.GetProductsSalesReportsUsecase>(() =>
      _i246.GetProductsSalesReportsUsecase(
          gh<_i156.ProductsSalesReportsRepo>()));
  gh.singleton<_i247.CitiesCubit>(
      () => _i247.CitiesCubit(gh<_i126.GetCitiesUseCase>()));
  gh.lazySingleton<_i248.GetNotUsingSystemUsecase>(
      () => _i248.GetNotUsingSystemUsecase(gh<_i37.NotUsingSystemRepo>()));
  gh.factory<_i249.UsersTypeCubit>(
      () => _i249.UsersTypeCubit(gh<_i118.GetUsersUsecase>()));
  gh.factory<_i250.ClientsListRepository>(
      () => _i251.ClientsListRepositoryImpl(gh<_i65.ClientsListDatasource>()));
  gh.factory<_i252.AddClientContactUseCase>(() =>
      _i252.AddClientContactUseCase(gh<_i119.AddClientContactRepository>()));
  gh.factory<_i253.UpdateClientContactUseCase>(() =>
      _i253.UpdateClientContactUseCase(gh<_i119.AddClientContactRepository>()));
  gh.factory<_i254.AddParticipateCommentUsecase>(() =>
      _i254.AddParticipateCommentUsecase(
          gh<_i140.ParticipateListRepository>()));
  gh.factory<_i255.AddParticipateUserUsecase>(() =>
      _i255.AddParticipateUserUsecase(gh<_i140.ParticipateListRepository>()));
  gh.factory<_i256.EditParticipateUserUsecase>(() =>
      _i256.EditParticipateUserUsecase(gh<_i140.ParticipateListRepository>()));
  gh.factory<_i257.ParticipateClientListUsecase>(() =>
      _i257.ParticipateClientListUsecase(
          gh<_i140.ParticipateListRepository>()));
  gh.factory<_i258.ParticipateCommentListUsecase>(() =>
      _i258.ParticipateCommentListUsecase(
          gh<_i140.ParticipateListRepository>()));
  gh.factory<_i259.GetParticipateInvoiceByIdUsecase>(() =>
      _i259.GetParticipateInvoiceByIdUsecase(
          gh<_i140.ParticipateListRepository>()));
  gh.factory<_i260.ParticipateInvoiceListUsecase>(() =>
      _i260.ParticipateInvoiceListUsecase(
          gh<_i140.ParticipateListRepository>()));
  gh.factory<_i261.ParticipateListUsecase>(() =>
      _i261.ParticipateListUsecase(gh<_i140.ParticipateListRepository>()));
  gh.lazySingleton<_i262.ChangeParticipateStatusUsecase>(() =>
      _i262.ChangeParticipateStatusUsecase(
          gh<_i140.ParticipateListRepository>()));
  gh.factory<_i263.PendingInvoicesCubit>(
      () => _i263.PendingInvoicesCubit(gh<_i121.GetPendingInvoicesUsecase>()));
  gh.factory<_i264.EvaluationLevelReportCubit>(() =>
      _i264.EvaluationLevelReportCubit(
          gh<_i104.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i265.GetEmployeesSalesReportsUsecase>(() =>
      _i265.GetEmployeesSalesReportsUsecase(
          gh<_i136.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i266.GetGreetingCommunicationUseCase>(() =>
      _i266.GetGreetingCommunicationUseCase(
          gh<_i167.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i267.ClientsTransferApprovalsRepo>(() =>
      _i268.ClientsTransferApprovalsRepoImpl(
          gh<_i59.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i269.ViolationsCubit>(
      () => _i269.ViolationsCubit(gh<_i214.GetViolationsUsecase>()));
  gh.lazySingleton<_i270.GetDeletedInvoicesUsecase>(
      () => _i270.GetDeletedInvoicesUsecase(gh<_i189.DeletedInvoicesRepo>()));
  gh.factory<_i271.ClientsContactsRepository>(() =>
      _i272.ClientsListRepositoryImpl(gh<_i64.ClientsContactsDatasource>()));
  gh.lazySingleton<_i273.GetClientsStatusReportsUsecase>(() =>
      _i273.GetClientsStatusReportsUsecase(
          gh<_i160.ClientsStatusReportsRepo>()));
  gh.factory<_i274.ActionLinkUsecase>(
      () => _i274.ActionLinkUsecase(gh<_i230.ImportantLinksRepo>()));
  gh.factory<_i275.GetImportantLinksUsecase>(
      () => _i275.GetImportantLinksUsecase(gh<_i230.ImportantLinksRepo>()));
  gh.lazySingleton<_i276.GetPreviousRatingsUsecase>(
      () => _i276.GetPreviousRatingsUsecase(gh<_i110.PreviousRatingsRepo>()));
  gh.lazySingleton<_i277.WaitingAgentsRepo>(
      () => _i278.WaitingAgentsRepoImpl(gh<_i150.WaitingAgentsDataSource>()));
  gh.factory<_i279.AddClientUserUsecase>(
      () => _i279.AddClientUserUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i280.ApproveRejectClientUsecase>(() =>
      _i280.ApproveRejectClientUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i281.ChangeClientCommunicationUseCase>(() =>
      _i281.ChangeClientCommunicationUseCase(
          gh<_i250.ClientsListRepository>()));
  gh.factory<_i282.ChangeTypeClientUsecase>(
      () => _i282.ChangeTypeClientUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i283.EditClientUserUsecase>(
      () => _i283.EditClientUserUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i284.GetClientsListByRegionUseCase>(() =>
      _i284.GetClientsListByRegionUseCase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i285.GetClientsListByUserUseCase>(() =>
      _i285.GetClientsListByUserUseCase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i286.GetClientsWithFilterUserUsecase>(() =>
      _i286.GetClientsWithFilterUserUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i287.GetClientMarketingReportUsecase>(() =>
      _i287.GetClientMarketingReportUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i288.GetRecommendedClientsUsecase>(() =>
      _i288.GetRecommendedClientsUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i289.GetSimilarClientsUsecase>(
      () => _i289.GetSimilarClientsUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i290.ReceiveClientUserUsecase>(
      () => _i290.ReceiveClientUserUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i291.StoreClientCommunicationUseCase>(() =>
      _i291.StoreClientCommunicationUseCase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i292.TransferClientUserUsecase>(
      () => _i292.TransferClientUserUsecase(gh<_i250.ClientsListRepository>()));
  gh.lazySingleton<_i293.GetHighSimilarClientsUsecase>(() =>
      _i293.GetHighSimilarClientsUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i294.EmployeesSalesReportsCubit>(() =>
      _i294.EmployeesSalesReportsCubit(
          gh<_i265.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i295.ChangeStateAgentUseCase>(
      () => _i295.ChangeStateAgentUseCase(gh<_i244.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i296.GetAgentsAndDistributorsUseCase>(() =>
      _i296.GetAgentsAndDistributorsUseCase(
          gh<_i244.AgentsDistributorsRepo>()));
  gh.factory<_i297.ClientsAcceptCubit>(
      () => _i297.ClientsAcceptCubit(gh<_i201.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i298.CancelWithdrawalUsecase>(() =>
      _i298.CancelWithdrawalUsecase(gh<_i242.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i299.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i299.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i242.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i300.GetWithdrawalsInvoicesUsecase>(() =>
      _i300.GetWithdrawalsInvoicesUsecase(
          gh<_i242.ManageWithdrawalsRepository>()));
  gh.factory<_i301.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i301.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i242.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i302.ExceededClientsUseCase>(
      () => _i302.ExceededClientsUseCase(gh<_i99.ExceededClientsRepo>()));
  gh.lazySingleton<_i303.TransferExceededClientsUseCase>(() =>
      _i303.TransferExceededClientsUseCase(gh<_i99.ExceededClientsRepo>()));
  gh.factory<_i304.ParticipateListBloc>(() => _i304.ParticipateListBloc(
        gh<_i261.ParticipateListUsecase>(),
        gh<_i255.AddParticipateUserUsecase>(),
        gh<_i256.EditParticipateUserUsecase>(),
        gh<_i257.ParticipateClientListUsecase>(),
        gh<_i260.ParticipateInvoiceListUsecase>(),
        gh<_i259.GetParticipateInvoiceByIdUsecase>(),
        gh<_i258.ParticipateCommentListUsecase>(),
        gh<_i254.AddParticipateCommentUsecase>(),
        gh<_i262.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i305.LoginLocalDataSource>(() =>
      _i305.LoginLocalDataSourceImpl(
          gh<_i171.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i306.EditAdvancedConfigsUsecase>(() =>
      _i306.EditAdvancedConfigsUsecase(gh<_i138.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i307.GetAdvancedConfigsUsecase>(() =>
      _i307.GetAdvancedConfigsUsecase(gh<_i138.AdvancedConfigsRepository>()));
  gh.factory<_i308.ClientsInstallReportsCubit>(() =>
      _i308.ClientsInstallReportsCubit(
          gh<_i109.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i309.DatesTableRepo>(
      () => _i310.DatesTableRepoImpl(gh<_i162.DatesTableDataSource>()));
  gh.factory<_i311.GetVersionUseCase>(
      () => _i311.GetVersionUseCase(gh<_i182.AppRepository>()));
  gh.factory<_i312.AddTicketCubit>(
      () => _i312.AddTicketCubit(gh<_i127.AddTicketUseCase>()));
  gh.lazySingleton<_i313.LatestClientsUpdatesRepository>(() =>
      _i314.LatestClientsUpdatesRepositoryImpl(
          gh<_i142.LatestClientsUpdatesDatasource>()));
  gh.factory<_i315.TaskRepository>(
      () => _i316.TaskRepositoryImpl(gh<_i108.TaskDatasource>()));
  gh.lazySingleton<_i317.EditGeneralConfigsUsecase>(() =>
      _i317.EditGeneralConfigsUsecase(gh<_i202.GeneralConfigsRepository>()));
  gh.lazySingleton<_i318.GetGeneralConfigsUsecase>(() =>
      _i318.GetGeneralConfigsUsecase(gh<_i202.GeneralConfigsRepository>()));
  gh.factory<_i319.PeriodicCommunicationReportsCubit>(() =>
      _i319.PeriodicCommunicationReportsCubit(
          gh<_i207.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i320.GetAllClientsContactsUseCase>(() =>
      _i320.GetAllClientsContactsUseCase(
          gh<_i271.ClientsContactsRepository>()));
  gh.factory<_i321.InstallQualityCubit>(
      () => _i321.InstallQualityCubit(gh<_i213.GetInstallUseCase>()));
  gh.factory<_i322.ClientsContactsBloc>(() =>
      _i322.ClientsContactsBloc(gh<_i320.GetAllClientsContactsUseCase>()));
  gh.factory<_i323.ImportantLinksCubit>(() => _i323.ImportantLinksCubit(
        gh<_i275.GetImportantLinksUsecase>(),
        gh<_i274.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i324.AddAgentUseCase>(
      () => _i324.AddAgentUseCase(gh<_i186.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i325.UpdateAgentUseCase>(() =>
      _i325.UpdateAgentUseCase(gh<_i186.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i326.GetDelayInstallReportsUseCase>(() =>
      _i326.GetDelayInstallReportsUseCase(gh<_i180.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i327.CrudAgentSupportFilesUsecase>(() =>
      _i327.CrudAgentSupportFilesUsecase(
          gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i328.GetClientsTransferApprovalsUsecase>(() =>
      _i328.GetClientsTransferApprovalsUsecase(
          gh<_i267.ClientsTransferApprovalsRepo>()));
  gh.factory<_i329.ClientsStatusReportsCubit>(() =>
      _i329.ClientsStatusReportsCubit(
          gh<_i273.GetClientsStatusReportsUsecase>()));
  gh.factory<_i330.SupportTabCubit>(() => _i330.SupportTabCubit(
        gh<_i220.GetInvoiceByClientUsecase>(),
        gh<_i218.AddDateInstallUsecase>(),
        gh<_i223.SetDateDoneUsecase>(),
        gh<_i224.SetReadyInstallUsecase>(),
        gh<_i222.ReturnInvoiceApproveUsecase>(),
        gh<_i221.ReceiveDeviceUsecase>(),
        gh<_i219.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i331.ClientsDebtsReportsCubit>(() =>
      _i331.ClientsDebtsReportsCubit(
          gh<_i166.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i332.DeletedInvoicesCubit>(
      () => _i332.DeletedInvoicesCubit(gh<_i270.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i333.AddAgentDateUseCase>(() =>
      _i333.AddAgentDateUseCase(gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i334.GetManageWithdrawnInvoicesUsecase>(() =>
      _i334.GetManageWithdrawnInvoicesUsecase(
          gh<_i173.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i335.NotificationsCubit>(() => _i335.NotificationsCubit(
        gh<_i204.GetNotificationsUsecase>(),
        gh<_i206.MarkNotificationsAsReadUsecase>(),
        gh<_i205.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i336.WithdrawnInvoicesRepo>(() =>
      _i337.WithdrawnInvoicesRepoImpl(gh<_i146.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i338.RegionsRepository>(
      () => _i339.RegionsRepositoryImpl(gh<_i164.RegionsDatasource>()));
  gh.factory<_i340.ClientLogsTabCubit>(
      () => _i340.ClientLogsTabCubit(gh<_i233.GetClientLogsUsecase>()));
  gh.factory<_i341.RegionsSalesReportsCubit>(() =>
      _i341.RegionsSalesReportsCubit(
          gh<_i192.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i342.AddClientContactBloc>(() => _i342.AddClientContactBloc(
        gh<_i252.AddClientContactUseCase>(),
        gh<_i253.UpdateClientContactUseCase>(),
      ));
  gh.factory<_i343.AgentsDistributorsActionsCubit>(
      () => _i343.AgentsDistributorsActionsCubit(
            gh<_i126.GetCitiesUseCase>(),
            gh<_i324.AddAgentUseCase>(),
            gh<_i325.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i344.FetchPaginatedClientsUsecase>(() =>
      _i344.FetchPaginatedClientsUsecase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i345.FetchLinkClientsUseCase>(
      () => _i345.FetchLinkClientsUseCase(gh<_i250.ClientsListRepository>()));
  gh.factory<_i346.LinkSelectedClientsUseCase>(() =>
      _i346.LinkSelectedClientsUseCase(gh<_i250.ClientsListRepository>()));
  gh.lazySingleton<_i347.LoginRepo>(() => _i348.LoginRepoImpl(
        gh<_i135.LoginRemoteDataSource>(),
        gh<_i305.LoginLocalDataSource>(),
      ));
  gh.factory<_i349.SpecialClientsBloc>(
      () => _i349.SpecialClientsBloc(gh<_i196.GetSpecialClientsUsecase>()));
  gh.factory<_i350.AddCommentUsecase>(
      () => _i350.AddCommentUsecase(gh<_i209.CompanyRepository>()));
  gh.factory<_i351.GetCommentUsecase>(
      () => _i351.GetCommentUsecase(gh<_i209.CompanyRepository>()));
  gh.factory<_i352.DelayInstallReportsCubit>(() =>
      _i352.DelayInstallReportsCubit(
          gh<_i326.GetDelayInstallReportsUseCase>()));
  gh.factory<_i353.DatesTimelineBloc>(
      () => _i353.DatesTimelineBloc(gh<_i215.GetTimelineByEmployeeUseCase>()));
  gh.factory<_i354.GreetingCommunicationCubit>(() =>
      _i354.GreetingCommunicationCubit(
          gh<_i266.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i355.GetRegionsUseCase>(
      () => _i355.GetRegionsUseCase(gh<_i338.RegionsRepository>()));
  gh.lazySingleton<_i356.GetLatestClientsUseCase>(() =>
      _i356.GetLatestClientsUseCase(
          gh<_i313.LatestClientsUpdatesRepository>()));
  gh.factory<_i357.AdvancedCofigsCubit>(() => _i357.AdvancedCofigsCubit(
        gh<_i307.GetAdvancedConfigsUsecase>(),
        gh<_i306.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i358.SupportClientsInvoicesCubit>(() =>
      _i358.SupportClientsInvoicesCubit(
          gh<_i241.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i359.WrongNumbersCubit>(
      () => _i359.WrongNumbersCubit(gh<_i200.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i360.CacheTokenUsecase>(
      () => _i360.CacheTokenUsecase(gh<_i347.LoginRepo>()));
  gh.lazySingleton<_i361.GetTokenUsecase>(
      () => _i361.GetTokenUsecase(gh<_i347.LoginRepo>()));
  gh.lazySingleton<_i362.LoginUsecase>(
      () => _i362.LoginUsecase(gh<_i347.LoginRepo>()));
  gh.lazySingleton<_i363.ValidateTokenUsecase>(
      () => _i363.ValidateTokenUsecase(gh<_i347.LoginRepo>()));
  gh.lazySingleton<_i364.VerifyOtpUsecase>(
      () => _i364.VerifyOtpUsecase(gh<_i347.LoginRepo>()));
  gh.factory<_i365.ClientsTransferApprovalsCubit>(() =>
      _i365.ClientsTransferApprovalsCubit(
          gh<_i328.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i366.RegionsCubit>(
      () => _i366.RegionsCubit(gh<_i355.GetRegionsUseCase>()));
  gh.factory<_i367.GeneralCofigsCubit>(() => _i367.GeneralCofigsCubit(
        gh<_i318.GetGeneralConfigsUsecase>(),
        gh<_i317.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i368.GetPeriodicCommunicationUseCase>(() =>
      _i368.GetPeriodicCommunicationUseCase(
          gh<_i228.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i369.GetClientsDebtsUsecase>(
      () => _i369.GetClientsDebtsUsecase(gh<_i226.ClientsDebtsRepo>()));
  gh.lazySingleton<_i370.CrudClientSupportFilesUsecase>(() =>
      _i370.CrudClientSupportFilesUsecase(
          repository: gh<_i250.ClientsListRepository>()));
  gh.lazySingleton<_i371.GetClientSupportFilesUsecase>(() =>
      _i371.GetClientSupportFilesUsecase(
          repository: gh<_i250.ClientsListRepository>()));
  gh.factory<_i372.BranchesCubit>(
      () => _i372.BranchesCubit(gh<_i208.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i373.AddAgentCommentUsecase>(() =>
      _i373.AddAgentCommentUsecase(gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i374.DoneTrainingUsecase>(() =>
      _i374.DoneTrainingUsecase(gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i375.GetAgentByIdUsecase>(() =>
      _i375.GetAgentByIdUsecase(gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i376.GetAgentClientListUsecase>(() =>
      _i376.GetAgentClientListUsecase(
          gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i377.GetAgentCommentsListUsecase>(() =>
      _i377.GetAgentCommentsListUsecase(
          gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i378.GetAgentDatesListUsecase>(() =>
      _i378.GetAgentDatesListUsecase(
          gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i379.GetAgentInvoiceListUsecase>(() =>
      _i379.GetAgentInvoiceListUsecase(
          gh<_i216.AgentsDistributorsProfileRepo>()));
  gh.factory<_i380.AddRejectReasonsUsecase>(() =>
      _i380.AddRejectReasonsUsecase(gh<_i242.ManageWithdrawalsRepository>()));
  gh.factory<_i381.EditRejectReasonsUsecase>(() =>
      _i381.EditRejectReasonsUsecase(gh<_i242.ManageWithdrawalsRepository>()));
  gh.factory<_i382.GetRejectReasonsUsecase>(() =>
      _i382.GetRejectReasonsUsecase(gh<_i242.ManageWithdrawalsRepository>()));
  gh.factory<_i383.GetUserSeriesUsecase>(() =>
      _i383.GetUserSeriesUsecase(gh<_i242.ManageWithdrawalsRepository>()));
  gh.factory<_i384.GetWithdrawnDetailsUsecase>(() =>
      _i384.GetWithdrawnDetailsUsecase(
          gh<_i242.ManageWithdrawalsRepository>()));
  gh.factory<_i385.SetApproveSeriesUsecase>(() =>
      _i385.SetApproveSeriesUsecase(gh<_i242.ManageWithdrawalsRepository>()));
  gh.factory<_i386.UpdateSeriesUsecase>(
      () => _i386.UpdateSeriesUsecase(gh<_i242.ManageWithdrawalsRepository>()));
  gh.factory<_i387.NotUsingSystemCubit>(
      () => _i387.NotUsingSystemCubit(gh<_i248.GetNotUsingSystemUsecase>()));
  gh.singleton<_i388.AppManagerCubit>(
      () => _i388.AppManagerCubit(gh<_i311.GetVersionUseCase>()));
  gh.lazySingleton<_i389.GetWaitingAgentsUsecase>(
      () => _i389.GetWaitingAgentsUsecase(gh<_i277.WaitingAgentsRepo>()));
  gh.factory<_i390.InvoicesSectionCubit>(() => _i390.InvoicesSectionCubit(
        gh<_i198.GetInvoicesByPrivilegesUsecase>(),
        gh<_i296.GetAgentsAndDistributorsUseCase>(),
        gh<_i261.ParticipateListUsecase>(),
        gh<_i225.GetAllUsersUseCase>(),
        gh<_i199.GetInvoiceByIdUsecase>(),
        gh<_i197.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i391.ProductsSalesReportsCubit>(() =>
      _i391.ProductsSalesReportsCubit(
          gh<_i246.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i392.GetWithdrawnInvoicesUsecase>(() =>
      _i392.GetWithdrawnInvoicesUsecase(gh<_i336.WithdrawnInvoicesRepo>()));
  gh.factory<_i393.PreviousRatingsCubit>(
      () => _i393.PreviousRatingsCubit(gh<_i276.GetPreviousRatingsUsecase>()));
  gh.factory<_i394.AgentsDistributorsCubit>(() => _i394.AgentsDistributorsCubit(
        gh<_i296.GetAgentsAndDistributorsUseCase>(),
        gh<_i295.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i395.ExceededClientsCubit>(() => _i395.ExceededClientsCubit(
        gh<_i302.ExceededClientsUseCase>(),
        gh<_i303.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i396.ClientsListBloc>(() => _i396.ClientsListBloc(
        gh<_i286.GetClientsWithFilterUserUsecase>(),
        gh<_i288.GetRecommendedClientsUsecase>(),
        gh<_i289.GetSimilarClientsUsecase>(),
        gh<_i279.AddClientUserUsecase>(),
        gh<_i283.EditClientUserUsecase>(),
        gh<_i282.ChangeTypeClientUsecase>(),
        gh<_i281.ChangeClientCommunicationUseCase>(),
        gh<_i291.StoreClientCommunicationUseCase>(),
        gh<_i280.ApproveRejectClientUsecase>(),
        gh<_i370.CrudClientSupportFilesUsecase>(),
        gh<_i371.GetClientSupportFilesUsecase>(),
        gh<_i292.TransferClientUserUsecase>(),
        gh<_i290.ReceiveClientUserUsecase>(),
        gh<_i287.GetClientMarketingReportUsecase>(),
        gh<_i293.GetHighSimilarClientsUsecase>(),
        gh<_i345.FetchLinkClientsUseCase>(),
        gh<_i344.FetchPaginatedClientsUsecase>(),
        gh<_i346.LinkSelectedClientsUseCase>(),
        gh<_i232.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i397.ManageWithdrawalsCubit>(() => _i397.ManageWithdrawalsCubit(
        gh<_i383.GetUserSeriesUsecase>(),
        gh<_i386.UpdateSeriesUsecase>(),
        gh<_i239.GetUsersUsecase>(),
        gh<_i300.GetWithdrawalsInvoicesUsecase>(),
        gh<_i301.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i385.SetApproveSeriesUsecase>(),
        gh<_i384.GetWithdrawnDetailsUsecase>(),
        gh<_i380.AddRejectReasonsUsecase>(),
        gh<_i382.GetRejectReasonsUsecase>(),
        gh<_i381.EditRejectReasonsUsecase>(),
        gh<_i299.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i298.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i398.ManageWithdrawnInvoicesCubit>(() =>
      _i398.ManageWithdrawnInvoicesCubit(
          gh<_i334.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i399.LatestClientsUpdatesCubit>(() =>
      _i399.LatestClientsUpdatesCubit(gh<_i356.GetLatestClientsUseCase>()));
  gh.factory<_i400.AttachmentsRowCubit>(() => _i400.AttachmentsRowCubit(
        gh<_i371.GetClientSupportFilesUsecase>(),
        gh<_i370.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i401.CancelScheduleUsecase>(
      () => _i401.CancelScheduleUsecase(gh<_i309.DatesTableRepo>()));
  gh.lazySingleton<_i402.ChangeDateToDonUsecase>(
      () => _i402.ChangeDateToDonUsecase(gh<_i309.DatesTableRepo>()));
  gh.lazySingleton<_i403.GetCancelReasonsUsecase>(
      () => _i403.GetCancelReasonsUsecase(gh<_i309.DatesTableRepo>()));
  gh.lazySingleton<_i404.GetDateInstallationUsecase>(
      () => _i404.GetDateInstallationUsecase(gh<_i309.DatesTableRepo>()));
  gh.lazySingleton<_i405.GetInvoicesByClientForDateUsecase>(() =>
      _i405.GetInvoicesByClientForDateUsecase(gh<_i309.DatesTableRepo>()));
  gh.lazySingleton<_i406.GetSubscribedClientsUsecase>(
      () => _i406.GetSubscribedClientsUsecase(gh<_i309.DatesTableRepo>()));
  gh.lazySingleton<_i407.RescheduleDateUsecase>(
      () => _i407.RescheduleDateUsecase(gh<_i309.DatesTableRepo>()));
  gh.lazySingleton<_i408.ReturnScheduleVisitToOpenUsecase>(
      () => _i408.ReturnScheduleVisitToOpenUsecase(gh<_i309.DatesTableRepo>()));
  gh.factory<_i409.AddTaskUsecase>(
      () => _i409.AddTaskUsecase(gh<_i315.TaskRepository>()));
  gh.factory<_i410.ChangeStatusTaskUsecase>(
      () => _i410.ChangeStatusTaskUsecase(gh<_i315.TaskRepository>()));
  gh.factory<_i411.GetTasksUsecase>(
      () => _i411.GetTasksUsecase(gh<_i315.TaskRepository>()));
  gh.factory<_i412.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i412.GetUsersByDepartmentAndRegionUsecase(gh<_i315.TaskRepository>()));
  gh.lazySingleton<_i413.TaskCubit>(() => _i413.TaskCubit(
        gh<_i409.AddTaskUsecase>(),
        gh<_i411.GetTasksUsecase>(),
        gh<_i410.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i414.UsersCubit>(() => _i414.UsersCubit(
        gh<_i239.GetUsersUsecase>(),
        gh<_i240.GetUserByIdUsecase>(),
        gh<_i101.ActionUserUsecase>(),
        gh<_i412.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i238.GetManagesForUserUsecase>(),
        gh<_i237.GetLevelsForUserUsecase>(),
        gh<_i236.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i415.CompanyCubit>(() => _i415.CompanyCubit(
        gh<_i351.GetCommentUsecase>(),
        gh<_i350.AddCommentUsecase>(),
      ));
  gh.factory<_i416.ClientsDebtsCubit>(
      () => _i416.ClientsDebtsCubit(gh<_i369.GetClientsDebtsUsecase>()));
  gh.factory<_i417.PeriodicCommunicationCubit>(() =>
      _i417.PeriodicCommunicationCubit(
          gh<_i368.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i418.LoginCubit>(() => _i418.LoginCubit(
        gh<_i362.LoginUsecase>(),
        gh<_i364.VerifyOtpUsecase>(),
        gh<_i360.CacheTokenUsecase>(),
        gh<_i361.GetTokenUsecase>(),
        gh<_i363.ValidateTokenUsecase>(),
      ));
  gh.factory<_i419.AgentsDistributorsProfileBloc>(
      () => _i419.AgentsDistributorsProfileBloc(
            gh<_i375.GetAgentByIdUsecase>(),
            gh<_i376.GetAgentClientListUsecase>(),
            gh<_i379.GetAgentInvoiceListUsecase>(),
            gh<_i259.GetParticipateInvoiceByIdUsecase>(),
            gh<_i377.GetAgentCommentsListUsecase>(),
            gh<_i373.AddAgentCommentUsecase>(),
            gh<_i374.DoneTrainingUsecase>(),
            gh<_i333.AddAgentDateUseCase>(),
            gh<_i378.GetAgentDatesListUsecase>(),
            gh<_i327.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i420.DatesTableCubit>(() => _i420.DatesTableCubit(
        gh<_i404.GetDateInstallationUsecase>(),
        gh<_i407.RescheduleDateUsecase>(),
        gh<_i402.ChangeDateToDonUsecase>(),
        gh<_i401.CancelScheduleUsecase>(),
        gh<_i408.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i406.GetSubscribedClientsUsecase>(),
        gh<_i405.GetInvoicesByClientForDateUsecase>(),
        gh<_i218.AddDateInstallUsecase>(),
        gh<_i403.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i421.WithdrawnInvoicesCubit>(() =>
      _i421.WithdrawnInvoicesCubit(gh<_i392.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i422.WaitingAgentsCubit>(
      () => _i422.WaitingAgentsCubit(gh<_i389.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i423.AppModule {}
