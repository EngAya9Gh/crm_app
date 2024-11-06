// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i22;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i7;
import 'package:logger/logger.dart' as _i4;
import 'package:shared_preferences/shared_preferences.dart' as _i21;

import '../../../api/api.dart' as _i6;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i61;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i183;
import '../../../features/app/domain/repositories/app_repository.dart' as _i182;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i318;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i397;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i312;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i139;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i356;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i355;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i368;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i369;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i370;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i371;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i372;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i434;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i32;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i48;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i47;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i201;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i304;
import '../../../features/clients_care/client_activites/data/data_sources/crud_activities_datasource.dart'
    as _i62;
import '../../../features/clients_care/client_activites/data/repositories/crud_activities_repo_impl.dart'
    as _i270;
import '../../../features/clients_care/client_activites/domain/repositories/crud_activities_repo.dart'
    as _i269;
import '../../../features/clients_care/client_activites/domain/use_cases/add_activity_crud_usecase.dart'
    as _i402;
import '../../../features/clients_care/client_activites/domain/use_cases/get_activity_types_usecase.dart'
    as _i403;
import '../../../features/clients_care/client_activites/domain/use_cases/get_crud_activities_usecase.dart'
    as _i400;
import '../../../features/clients_care/client_activites/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i404;
import '../../../features/clients_care/client_activites/domain/use_cases/update_activity_crud_usecase.dart'
    as _i401;
import '../../../features/clients_care/client_activites/presentation/manager/crud_activities_bloc.dart'
    as _i405;
import '../../../features/clients_care/client_communications/data/data_sources/clients_activities_datasource.dart'
    as _i63;
import '../../../features/clients_care/client_communications/data/repositories/clients_activities_repo_impl.dart'
    as _i111;
import '../../../features/clients_care/client_communications/domain/repositories/clients_activities_repo.dart'
    as _i110;
import '../../../features/clients_care/client_communications/domain/use_cases/get_all_clients_activities_usecase.dart'
    as _i281;
import '../../../features/clients_care/client_communications/domain/use_cases/update_activity_usecase.dart'
    as _i282;
import '../../../features/clients_care/client_communications/presentation/manager/clients_activities_bloc.dart'
    as _i377;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i29;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i98;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i97;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i126;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i193;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i26;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i38;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i37;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i250;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i396;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i56;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i75;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i74;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i131;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i132;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i133;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i135;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i134;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i136;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i319;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i159;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i137;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i28;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i40;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i39;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i200;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i367;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i11;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i52;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i51;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i106;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i268;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i19;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i168;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i167;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i272;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i362;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i53;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i177;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i176;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i212;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i328;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i42;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i230;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i229;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i376;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i433;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i34;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i45;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i44;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i207;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i326;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i27;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i115;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i114;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i283;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i409;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i64;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i154;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i153;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i196;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i357;
import '../../../features/clients_care/violations_clienta_care/data/data_sources/violations_clients_care_datasource.dart'
    as _i17;
import '../../../features/clients_care/violations_clienta_care/data/repositories/violations_repository_impl.dart'
    as _i103;
import '../../../features/clients_care/violations_clienta_care/domain/repositories/violations_repository.dart'
    as _i102;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_all_management_usecase.dart'
    as _i213;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_violation_types_usecase.dart'
    as _i215;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_violations_usecase.dart'
    as _i214;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/update_violadtion_usecase.dart'
    as _i234;
import '../../../features/clients_care/violations_clienta_care/presentation/manager/violations_cubit.dart'
    as _i337;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i96;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i105;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i104;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i208;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i381;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i72;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i129;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i128;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i130;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i249;
import '../../../features/common/client_profile/client_dates_tab/data/data_sources/client_dates_datasource.dart'
    as _i65;
import '../../../features/common/client_profile/client_dates_tab/data/repositories/clients_dates_repo_impl.dart'
    as _i255;
import '../../../features/common/client_profile/client_dates_tab/domain/repositories/clients_dates_repo.dart'
    as _i254;
import '../../../features/common/client_profile/client_dates_tab/domain/use_cases/get_all_clients_dates_usecase.dart'
    as _i398;
import '../../../features/common/client_profile/client_dates_tab/presentation/manager/clients_dates_cubit.dart'
    as _i437;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i78;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i117;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i116;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i235;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i348;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i121;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i195;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i194;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i219;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i220;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i221;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i222;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i223;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i224;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i225;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i338;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i164;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i347;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i346;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i363;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i374;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i71;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i88;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i87;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i122;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i251;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i3;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i73;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i143;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i142;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i313;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i314;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i365;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i91;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i203;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i202;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i324;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i325;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i375;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i18;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i55;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i54;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i119;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i120;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i138;
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
    as _i211;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i58;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i90;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i89;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i101;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i238;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i239;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i240;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i242;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i241;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i430;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i46;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i245;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i244;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i389;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i305;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i390;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i306;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i391;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i392;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i308;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i307;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i393;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i394;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i395;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i413;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i31;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i30;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i204;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i205;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i206;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i343;
import '../../../features/sales/clients/add_client_contact/data/data_sources/add_client_contact_datasource.dart'
    as _i66;
import '../../../features/sales/clients/add_client_contact/data/repositories/add_client_contact_repo_impl.dart'
    as _i124;
import '../../../features/sales/clients/add_client_contact/domain/repositories/add_client_contact_repo.dart'
    as _i123;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/add_client_contact_usecase.dart'
    as _i256;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/update_client_contact_usecase.dart'
    as _i257;
import '../../../features/sales/clients/add_client_contact/presentation/manager/add_client_contact_bloc.dart'
    as _i350;
import '../../../features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart'
    as _i67;
import '../../../features/sales/clients/clients_contacts/data/repositories/clients_contacts_repo_impl.dart'
    as _i277;
import '../../../features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart'
    as _i276;
import '../../../features/sales/clients/clients_contacts/domain/use_cases/get_all_clients_contacts_usecase.dart'
    as _i327;
import '../../../features/sales/clients/clients_contacts/presentation/manager/clients_contacts_bloc.dart'
    as _i329;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i49;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i228;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i227;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i378;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i432;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i68;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i36;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i253;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i252;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i286;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i287;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_client_communication_usecase.dart'
    as _i288;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i289;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i379;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i290;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i233;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i353;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i352;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i294;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i380;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i291;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i292;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i293;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i300;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i295;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i296;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i354;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i297;
import '../../../features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart'
    as _i298;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i299;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i412;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i59;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i274;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i273;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i335;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i373;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i50;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i93;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i92;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i155;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i188;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i146;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i321;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i320;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i364;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i415;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i13;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i95;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i94;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i125;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i267;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i69;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i210;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i209;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i358;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i359;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i431;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i118;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i190;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i189;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i275;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i340;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i60;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i100;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i99;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i309;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i310;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i411;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i127;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i150;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i149;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i197;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i226;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i199;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i198;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i406;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i147;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i174;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i173;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i342;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i414;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i20;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i109;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i158;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i187;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i218;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i247;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i186;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i217;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i246;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i382;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i341;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i331;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i302;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i334;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i383;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i384;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i385;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i386;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i387;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i388;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i303;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i332;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i351;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i435;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i410;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i70;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i232;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i231;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i279;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i280;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i330;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i41;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i145;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i144;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i258;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i259;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i266;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i260;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i261;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i262;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i263;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i264;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i265;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i311;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i25;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i81;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i80;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i166;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i339;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i33;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i161;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i160;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i278;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i336;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i43;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i141;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i140;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i271;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i301;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i16;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i157;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i156;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i248;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i407;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i77;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i76;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i192;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i349;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i148;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i345;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i344;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i408;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i438;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i23;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i108;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i107;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i113;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i315;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i162;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i317;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i316;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i417;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i418;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i419;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i420;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i421;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i422;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i423;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i424;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i436;
import '../../../features/support/dates_timeline/data/data_sources/dates_timeline_datasource.dart'
    as _i79;
import '../../../features/support/dates_timeline/data/respositories_impl/dates_timeline_repo_impl.dart'
    as _i170;
import '../../../features/support/dates_timeline/domain/respositories/dates_timline_repo.dart'
    as _i169;
import '../../../features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart'
    as _i216;
import '../../../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart'
    as _i361;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i12;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i85;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i84;
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
    as _i333;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i360;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i10;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i83;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i82;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i86;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i151;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i57;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i237;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i236;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i243;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i366;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i152;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i285;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i284;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i399;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i439;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i112;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i323;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i322;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i425;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i426;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i427;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i428;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i429;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i416;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i171;
import '../cache_services/prefs_consumer.dart' as _i175;
import '../cache_services/secure_storage_consumer.dart' as _i172;
import '../maps/location_services.dart' as _i165;
import 'di_container.dart' as _i440;

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
  gh.lazySingleton<_i17.ViolationsClientsCareDatasource>(
      () => _i17.ViolationsClientsCareDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i18.LevelsDatasource>(
      () => _i18.LevelsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i19.GreetingCommunicationDatasource>(
      () => _i19.GreetingCommunicationDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i20.AgentsDistributorsActionsDataSource>(() =>
      _i20.AgentsDistributorsActionsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.singletonAsync<_i21.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i22.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i23.ClientsInstallReportsDatasource>(
      () => _i23.ClientsInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i24.RegionsSalesReportsDatasource>(
      () => _i24.RegionsSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i25.ClientsDebtsReportsDatasource>(
      () => _i25.ClientsDebtsReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i26.NotUsingSystemDatasource>(
      () => _i26.NotUsingSystemDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i27.PreviousRatingsDatasource>(
      () => _i27.PreviousRatingsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i28.WrongNumbersDatasource>(
      () => _i28.WrongNumbersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i29.ClientsCareReportsDatasource>(
      () => _i29.ClientsCareReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i30.NotificationsRepo>(
      () => _i31.NotificationsRepoImpl(gh<_i15.NotificationsDatasource>()));
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
      () => _i38.NotUsingSystemRepoImpl(gh<_i26.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i39.WrongNumbersRepo>(
      () => _i40.WrongNumbersRepoImpl(gh<_i28.WrongNumbersDatasource>()));
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
      () => _i55.LevelsRepoImpl(gh<_i18.LevelsDatasource>()));
  gh.lazySingleton<_i56.TicketsDataSource>(
      () => _i56.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i57.SupportClientsInvoicesDatasource>(
      () => _i57.DelayInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i58.UsersDatasource>(
      () => _i58.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.singletonAsync<_i21.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i22.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i59.ClientsTransferApprovalsDatasource>(
      () => _i59.ClientsTransferApprovalsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i60.ExceededClientsDatasource>(
      () => _i60.ExceededClientsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i61.AppDatasource>(
      () => _i61.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i62.CrudActivitiesDatasource>(
      () => _i62.CrudActivitiesDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i63.ClientsActivitiesDatasource>(
      () => _i63.ClientsActivitiesDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i64.SpecialClientsDatasource>(
      () => _i64.SpecialClientsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i65.ClientsDatesDatasource>(
      () => _i65.ClientsDatesDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i66.AddClientsContactsDatasource>(
      () => _i66.AddClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i67.ClientsContactsDatasource>(
      () => _i67.ClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i68.ClientsListDatasource>(
      () => _i68.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i69.CommentCompanyDatasource>(
      () => _i69.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i70.ImportantLinksDatasource>(
      () => _i70.ImportantLinksDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i71.UsersDatasource>(
      () => _i71.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i72.CitiesDatasource>(
      () => _i72.CitiesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i73.AdvancedConfigsDatasource>(
      () => _i73.AdvancedConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i74.TicketsRepo>(
      () => _i75.TicketsRepoImpl(gh<_i56.TicketsDataSource>()));
  gh.lazySingleton<_i76.RegionsSalesReportsRepo>(() =>
      _i77.RegionsSalesReportsRepoImpl(
          gh<_i24.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i78.ClientLogsTabDataSource>(
      () => _i78.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i79.DatesTimelineDatasource>(
      () => _i79.DatesTimelineDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i80.ClientsDebtsReportsRepo>(() =>
      _i81.ClientsDebtsReportsRepoImpl(
          gh<_i25.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i82.SupportClientsAcceptRepository>(() =>
      _i83.SupportClientsAcceptRepositoryImpl(
          gh<_i10.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i84.DelayAfterInstallRepo>(() =>
      _i85.DelayAfterInstallRepoImpl(gh<_i12.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i86.GetSupportClientsAcceptUseCase>(() =>
      _i86.GetSupportClientsAcceptUseCase(
          gh<_i82.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i87.UsersRepository>(
      () => _i88.UsersRepositoryImpl(gh<_i71.UsersDatasource>()));
  gh.lazySingleton<_i89.UsersRepository>(
      () => _i90.UsersRepositoryImpl(gh<_i58.UsersDatasource>()));
  gh.lazySingleton<_i91.GeneralConfigsDatasource>(
      () => _i91.GeneralConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i92.FinancePendingRepo>(
      () => _i93.FinancePendingRepoImpl(gh<_i50.FinancePendingDatasource>()));
  gh.lazySingleton<_i94.PendingInvoicesRepo>(
      () => _i95.PendingInvoicesRepoImpl(gh<_i13.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i96.BranchesDatasource>(
      () => _i96.BranchesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i97.ClientsCareReportsRepo>(() =>
      _i98.ClientsCareReportsRepoImpl(gh<_i29.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i99.ExceededClientsRepo>(() =>
      _i100.ExceededClientsRepoImpl(gh<_i60.ExceededClientsDatasource>()));
  gh.factory<_i101.ActionUserUsecase>(
      () => _i101.ActionUserUsecase(gh<_i89.UsersRepository>()));
  gh.lazySingleton<_i102.ViolationsRepository>(() =>
      _i103.ViolationsRepositoryImpl(
          gh<_i17.ViolationsClientsCareDatasource>()));
  gh.lazySingleton<_i104.BranchesRepository>(
      () => _i105.BranchesRepositoryImpl(gh<_i96.BranchesDatasource>()));
  gh.lazySingleton<_i106.GetEvaluationLevelReportUsecase>(() =>
      _i106.GetEvaluationLevelReportUsecase(
          gh<_i51.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i107.ClientsInstallReportsRepo>(() =>
      _i108.ClientsInstallReportsRepoImpl(
          gh<_i23.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i109.AgentsDistributorsDataSource>(
      () => _i109.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i110.ClientsActivitiesRepository>(() =>
      _i111.ClientsListRepositoryImpl(gh<_i63.ClientsActivitiesDatasource>()));
  gh.factory<_i112.TaskDatasource>(
      () => _i112.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i113.GetClientsInstallReportsUsecase>(() =>
      _i113.GetClientsInstallReportsUsecase(
          gh<_i107.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i114.PreviousRatingsRepo>(() =>
      _i115.PreviousRatingsRepoImpl(gh<_i27.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i116.ClientLogsTabRepo>(
      () => _i117.ClientLogsTabRepoImpl(gh<_i78.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i118.DeletedInvoicesDatasource>(
      () => _i118.DeletedInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i119.AddLevelUsecase>(
      () => _i119.AddLevelUsecase(gh<_i54.LevelsRepo>()));
  gh.lazySingleton<_i120.GetLevelsUsecase>(
      () => _i120.GetLevelsUsecase(gh<_i54.LevelsRepo>()));
  gh.lazySingleton<_i121.SupportTabDataSource>(
      () => _i121.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i122.GetUsersUsecase>(
      () => _i122.GetUsersUsecase(gh<_i87.UsersRepository>()));
  gh.factory<_i123.AddClientContactRepository>(() =>
      _i124.AddClientContactRepositoryImpl(
          gh<_i66.AddClientsContactsDatasource>()));
  gh.lazySingleton<_i125.GetPendingInvoicesUsecase>(
      () => _i125.GetPendingInvoicesUsecase(gh<_i94.PendingInvoicesRepo>()));
  gh.lazySingleton<_i126.GetClientsCareReportsUsecase>(() =>
      _i126.GetClientsCareReportsUsecase(gh<_i97.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i127.InvoicesTabDataSource>(
      () => _i127.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i128.CitiesRepository>(
      () => _i129.CitiesRepositoryImpl(gh<_i72.CitiesDatasource>()));
  gh.lazySingleton<_i130.GetCitiesUseCase>(
      () => _i130.GetCitiesUseCase(gh<_i128.CitiesRepository>()));
  gh.lazySingleton<_i131.AddTicketUseCase>(
      () => _i131.AddTicketUseCase(gh<_i74.TicketsRepo>()));
  gh.lazySingleton<_i132.EditTicketTypeUseCase>(
      () => _i132.EditTicketTypeUseCase(gh<_i74.TicketsRepo>()));
  gh.lazySingleton<_i133.GetClientTicketsUseCase>(
      () => _i133.GetClientTicketsUseCase(gh<_i74.TicketsRepo>()));
  gh.lazySingleton<_i134.GetTicketsUseCase>(
      () => _i134.GetTicketsUseCase(gh<_i74.TicketsRepo>()));
  gh.lazySingleton<_i135.GetTicketByIdUseCase>(
      () => _i135.GetTicketByIdUseCase(gh<_i74.TicketsRepo>()));
  gh.lazySingleton<_i136.TransferTicketUseCase>(
      () => _i136.TransferTicketUseCase(gh<_i74.TicketsRepo>()));
  gh.factory<_i137.TicketsCubit>(() => _i137.TicketsCubit(
        gh<_i134.GetTicketsUseCase>(),
        gh<_i135.GetTicketByIdUseCase>(),
        gh<_i133.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i138.LevelsCubit>(() => _i138.LevelsCubit(
        gh<_i120.GetLevelsUsecase>(),
        gh<_i119.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i139.LoginRemoteDataSource>(
      () => _i139.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i140.EmployeesSalesReportsRepo>(() =>
      _i141.EmployeesSalesReportsRepoImpl(
          gh<_i43.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i142.AdvancedConfigsRepository>(() =>
      _i143.AdvancedConfigsRepositoryImpl(
          gh<_i73.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i144.ParticipateListRepository>(() =>
      _i145.ParticipateListRepositoryImpl(
          gh<_i41.ParticipatesListDatasource>()));
  gh.lazySingleton<_i146.LatestClientsUpdatesDatasource>(
      () => _i146.LatestClientsUpdatesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i147.ManageWithdrawnInvoicesDataSource>(
      () => _i147.ManageWithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i148.WithdrawnInvoicesDataSource>(
      () => _i148.WithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i149.InvoicesSectionRepo>(
      () => _i150.InvoicesTabRepoImpl(gh<_i127.InvoicesTabDataSource>()));
  gh.factory<_i151.SupportClientsAcceptCubit>(() =>
      _i151.SupportClientsAcceptCubit(
          gh<_i86.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i152.WaitingAgentsDataSource>(
      () => _i152.WaitingAgentsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i153.SpecialClientsRepository>(() =>
      _i154.SpecialClientsRepositoryImpl(gh<_i64.SpecialClientsDatasource>()));
  gh.lazySingleton<_i155.GetFinancePendingInvoicesUsecase>(() =>
      _i155.GetFinancePendingInvoicesUsecase(gh<_i92.FinancePendingRepo>()));
  gh.lazySingleton<_i156.ProductsSalesReportsRepo>(() =>
      _i157.ProductsSalesReportsRepoImpl(
          gh<_i16.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i158.AgentsDistributorsProfileDataSource>(() =>
      _i158.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i159.EditTicketCubit>(() => _i159.EditTicketCubit(
        gh<_i132.EditTicketTypeUseCase>(),
        gh<_i136.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i160.ClientsStatusReportsRepo>(() =>
      _i161.ClientsStatusReportsRepoImpl(
          gh<_i33.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i162.DatesTableDataSource>(
      () => _i162.DatesTableDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i163.GetDelayAfterInstallUseCase>(() =>
      _i163.GetDelayAfterInstallUseCase(gh<_i84.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i164.RegionsDatasource>(
      () => _i164.RegionsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i165.LocationServices>(
      () => _i165.LocationServices(gh<_i7.Location>()));
  gh.lazySingleton<_i166.GetClientsDebtsReportsUsecase>(() =>
      _i166.GetClientsDebtsReportsUsecase(gh<_i80.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i167.GreetingCommunicationRepo>(() =>
      _i168.GreetingCommunicationRepoImpl(
          gh<_i19.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i169.DatesTimeLinesRepo>(
      () => _i170.DatesTimelineRepoImpl(gh<_i79.DatesTimelineDatasource>()));
  gh.singleton<_i171.CacheServices>(
    () => _i172.SecureStorageConsumer(gh<_i22.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i173.ManageWithdrawnInvoicesRepo>(() =>
      _i174.ManageWithdrawnInvoicesRepoImpl(
          gh<_i147.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i171.CacheServices>(() async =>
      _i175.PrefsConsumer(await gh.getAsync<_i21.SharedPreferences>()));
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
          gh<_i20.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i188.FinancePendingCubit>(() =>
      _i188.FinancePendingCubit(gh<_i155.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i189.DeletedInvoicesRepo>(() =>
      _i190.DeletedInvoicesRepoImpl(gh<_i118.DeletedInvoicesDatasource>()));
  gh.factory<_i191.DelayAfterInstallCubit>(() =>
      _i191.DelayAfterInstallCubit(gh<_i163.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i192.GetRegionsSalesReportsUsecase>(() =>
      _i192.GetRegionsSalesReportsUsecase(gh<_i76.RegionsSalesReportsRepo>()));
  gh.factory<_i193.ClientsCareReportsCubit>(() =>
      _i193.ClientsCareReportsCubit(gh<_i126.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i194.SupportTabRepo>(
      () => _i195.SupportTabRepoImpl(gh<_i121.SupportTabDataSource>()));
  gh.factory<_i196.GetSpecialClientsUsecase>(() =>
      _i196.GetSpecialClientsUsecase(gh<_i153.SpecialClientsRepository>()));
  gh.lazySingleton<_i197.ExportInvoicesToExcelUsecase>(() =>
      _i197.ExportInvoicesToExcelUsecase(gh<_i149.InvoicesSectionRepo>()));
  gh.lazySingleton<_i198.GetInvoicesByPrivilegesUsecase>(() =>
      _i198.GetInvoicesByPrivilegesUsecase(gh<_i149.InvoicesSectionRepo>()));
  gh.lazySingleton<_i199.GetInvoiceByIdUsecase>(
      () => _i199.GetInvoiceByIdUsecase(gh<_i149.InvoicesSectionRepo>()));
  gh.lazySingleton<_i200.GetWrongNumbersUsecase>(
      () => _i200.GetWrongNumbersUsecase(gh<_i39.WrongNumbersRepo>()));
  gh.lazySingleton<_i201.GetClientsAcceptUseCase>(
      () => _i201.GetClientsAcceptUseCase(gh<_i47.ClientsAcceptRepository>()));
  gh.lazySingleton<_i202.GeneralConfigsRepository>(() =>
      _i203.GeneralConfigsRepositoryImpl(gh<_i91.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i204.GetNotificationsUsecase>(
      () => _i204.GetNotificationsUsecase(gh<_i30.NotificationsRepo>()));
  gh.lazySingleton<_i205.GetUnreadNotificationsCountUsecase>(() =>
      _i205.GetUnreadNotificationsCountUsecase(gh<_i30.NotificationsRepo>()));
  gh.lazySingleton<_i206.MarkNotificationsAsReadUsecase>(
      () => _i206.MarkNotificationsAsReadUsecase(gh<_i30.NotificationsRepo>()));
  gh.lazySingleton<_i207.GetPeriodicCommunicationReportsUsecase>(() =>
      _i207.GetPeriodicCommunicationReportsUsecase(
          gh<_i44.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i208.GetBranchesByIdCountryUseCase>(() =>
      _i208.GetBranchesByIdCountryUseCase(gh<_i104.BranchesRepository>()));
  gh.factory<_i209.CompanyRepository>(
      () => _i210.CompanyRepositoryImpl(gh<_i69.CommentCompanyDatasource>()));
  gh.singleton<_i211.PrivilegesCubit>(() => _i211.PrivilegesCubit(
        gh<_i185.GetPrivilegesUsecase>(),
        gh<_i184.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i212.GetInstallUseCase>(
      () => _i212.GetInstallUseCase(gh<_i176.InstallQualityRepo>()));
  gh.lazySingleton<_i213.GetManagementsUsecase>(
      () => _i213.GetManagementsUsecase(gh<_i102.ViolationsRepository>()));
  gh.lazySingleton<_i214.GetViolationsUsecase>(
      () => _i214.GetViolationsUsecase(gh<_i102.ViolationsRepository>()));
  gh.lazySingleton<_i215.GetViolationsTypesUseCase>(
      () => _i215.GetViolationsTypesUseCase(gh<_i102.ViolationsRepository>()));
  gh.lazySingleton<_i216.GetTimelineByEmployeeUseCase>(
      () => _i216.GetTimelineByEmployeeUseCase(gh<_i169.DatesTimeLinesRepo>()));
  gh.lazySingleton<_i217.AgentsDistributorsProfileRepo>(() =>
      _i218.AgentsDistributorsProfileRepoImpl(
          gh<_i158.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i219.AddDateInstallUsecase>(
      () => _i219.AddDateInstallUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i220.CancelDateInstallUsecase>(
      () => _i220.CancelDateInstallUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i221.GetInvoiceByClientUsecase>(
      () => _i221.GetInvoiceByClientUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i222.ReceiveDeviceUsecase>(
      () => _i222.ReceiveDeviceUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i223.ReturnInvoiceApproveUsecase>(
      () => _i223.ReturnInvoiceApproveUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i224.SetDateDoneUsecase>(
      () => _i224.SetDateDoneUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i225.SetReadyInstallUsecase>(
      () => _i225.SetReadyInstallUsecase(gh<_i194.SupportTabRepo>()));
  gh.lazySingleton<_i226.GetAllUsersUseCase>(
      () => _i226.GetAllUsersUseCase(gh<_i149.InvoicesSectionRepo>()));
  gh.lazySingleton<_i227.ClientsDebtsRepo>(
      () => _i228.ClientsDebtsRepoImpl(gh<_i49.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i229.PeriodicCommunicationRepo>(() =>
      _i230.PeriodicCommunicationRepoImpl(
          gh<_i42.PeriodicCommunicationDatasource>()));
  gh.factory<_i231.ImportantLinksRepo>(
      () => _i232.ImportantLinksRepoImpl(gh<_i70.ImportantLinksDatasource>()));
  gh.factory<_i233.ExportClientsToExcelUseCase>(() =>
      _i233.ExportClientsToExcelUseCase(gh<_i68.ClientsListDatasource>()));
  gh.factory<_i234.UpdateViolationUseCase>(
      () => _i234.UpdateViolationUseCase(gh<_i102.ViolationsRepository>()));
  gh.lazySingleton<_i235.GetClientLogsUsecase>(
      () => _i235.GetClientLogsUsecase(gh<_i116.ClientLogsTabRepo>()));
  gh.lazySingleton<_i236.SupportClientsInvoicesRepo>(() =>
      _i237.SupportClientsInvoicesRepoImpl(
          gh<_i57.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i238.GetBranchesForUserUsecase>(
      () => _i238.GetBranchesForUserUsecase(gh<_i89.UsersRepository>()));
  gh.lazySingleton<_i239.GetLevelsForUserUsecase>(
      () => _i239.GetLevelsForUserUsecase(gh<_i89.UsersRepository>()));
  gh.lazySingleton<_i240.GetManagesForUserUsecase>(
      () => _i240.GetManagesForUserUsecase(gh<_i89.UsersRepository>()));
  gh.factory<_i241.GetUsersUsecase>(
      () => _i241.GetUsersUsecase(gh<_i89.UsersRepository>()));
  gh.factory<_i242.GetUserByIdUsecase>(
      () => _i242.GetUserByIdUsecase(gh<_i89.UsersRepository>()));
  gh.lazySingleton<_i243.GetSupportClientsInvoicesUseCase>(() =>
      _i243.GetSupportClientsInvoicesUseCase(
          gh<_i236.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i244.ManageWithdrawalsRepository>(() =>
      _i245.ManageWithdrawalsRepositoryImpl(
          gh<_i46.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i246.AgentsDistributorsRepo>(() =>
      _i247.AgentsDistributorsRepoImpl(
          gh<_i109.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i248.GetProductsSalesReportsUsecase>(() =>
      _i248.GetProductsSalesReportsUsecase(
          gh<_i156.ProductsSalesReportsRepo>()));
  gh.singleton<_i249.CitiesCubit>(
      () => _i249.CitiesCubit(gh<_i130.GetCitiesUseCase>()));
  gh.lazySingleton<_i250.GetNotUsingSystemUsecase>(
      () => _i250.GetNotUsingSystemUsecase(gh<_i37.NotUsingSystemRepo>()));
  gh.factory<_i251.UsersTypeCubit>(
      () => _i251.UsersTypeCubit(gh<_i122.GetUsersUsecase>()));
  gh.factory<_i252.ClientsListRepository>(
      () => _i253.ClientsListRepositoryImpl(gh<_i68.ClientsListDatasource>()));
  gh.factory<_i254.ClientsDatesRepository>(
      () => _i255.ClientsListRepositoryImpl(gh<_i65.ClientsDatesDatasource>()));
  gh.factory<_i256.AddClientContactUseCase>(() =>
      _i256.AddClientContactUseCase(gh<_i123.AddClientContactRepository>()));
  gh.factory<_i257.UpdateClientContactUseCase>(() =>
      _i257.UpdateClientContactUseCase(gh<_i123.AddClientContactRepository>()));
  gh.factory<_i258.AddParticipateCommentUsecase>(() =>
      _i258.AddParticipateCommentUsecase(
          gh<_i144.ParticipateListRepository>()));
  gh.factory<_i259.AddParticipateUserUsecase>(() =>
      _i259.AddParticipateUserUsecase(gh<_i144.ParticipateListRepository>()));
  gh.factory<_i260.EditParticipateUserUsecase>(() =>
      _i260.EditParticipateUserUsecase(gh<_i144.ParticipateListRepository>()));
  gh.factory<_i261.ParticipateClientListUsecase>(() =>
      _i261.ParticipateClientListUsecase(
          gh<_i144.ParticipateListRepository>()));
  gh.factory<_i262.ParticipateCommentListUsecase>(() =>
      _i262.ParticipateCommentListUsecase(
          gh<_i144.ParticipateListRepository>()));
  gh.factory<_i263.GetParticipateInvoiceByIdUsecase>(() =>
      _i263.GetParticipateInvoiceByIdUsecase(
          gh<_i144.ParticipateListRepository>()));
  gh.factory<_i264.ParticipateInvoiceListUsecase>(() =>
      _i264.ParticipateInvoiceListUsecase(
          gh<_i144.ParticipateListRepository>()));
  gh.factory<_i265.ParticipateListUsecase>(() =>
      _i265.ParticipateListUsecase(gh<_i144.ParticipateListRepository>()));
  gh.lazySingleton<_i266.ChangeParticipateStatusUsecase>(() =>
      _i266.ChangeParticipateStatusUsecase(
          gh<_i144.ParticipateListRepository>()));
  gh.factory<_i267.PendingInvoicesCubit>(
      () => _i267.PendingInvoicesCubit(gh<_i125.GetPendingInvoicesUsecase>()));
  gh.factory<_i268.EvaluationLevelReportCubit>(() =>
      _i268.EvaluationLevelReportCubit(
          gh<_i106.GetEvaluationLevelReportUsecase>()));
  gh.factory<_i269.CrudActivitiesRepository>(
      () => _i270.CrudActivitiesRepoImpl(gh<_i62.CrudActivitiesDatasource>()));
  gh.lazySingleton<_i271.GetEmployeesSalesReportsUsecase>(() =>
      _i271.GetEmployeesSalesReportsUsecase(
          gh<_i140.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i272.GetGreetingCommunicationUseCase>(() =>
      _i272.GetGreetingCommunicationUseCase(
          gh<_i167.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i273.ClientsTransferApprovalsRepo>(() =>
      _i274.ClientsTransferApprovalsRepoImpl(
          gh<_i59.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i275.GetDeletedInvoicesUsecase>(
      () => _i275.GetDeletedInvoicesUsecase(gh<_i189.DeletedInvoicesRepo>()));
  gh.factory<_i276.ClientsContactsRepository>(() =>
      _i277.ClientsListRepositoryImpl(gh<_i67.ClientsContactsDatasource>()));
  gh.lazySingleton<_i278.GetClientsStatusReportsUsecase>(() =>
      _i278.GetClientsStatusReportsUsecase(
          gh<_i160.ClientsStatusReportsRepo>()));
  gh.factory<_i279.ActionLinkUsecase>(
      () => _i279.ActionLinkUsecase(gh<_i231.ImportantLinksRepo>()));
  gh.factory<_i280.GetImportantLinksUsecase>(
      () => _i280.GetImportantLinksUsecase(gh<_i231.ImportantLinksRepo>()));
  gh.factory<_i281.GetAllClientsActivitiesUseCase>(() =>
      _i281.GetAllClientsActivitiesUseCase(
          gh<_i110.ClientsActivitiesRepository>()));
  gh.factory<_i282.UpdateActivityUseCase>(() =>
      _i282.UpdateActivityUseCase(gh<_i110.ClientsActivitiesRepository>()));
  gh.lazySingleton<_i283.GetPreviousRatingsUsecase>(
      () => _i283.GetPreviousRatingsUsecase(gh<_i114.PreviousRatingsRepo>()));
  gh.lazySingleton<_i284.WaitingAgentsRepo>(
      () => _i285.WaitingAgentsRepoImpl(gh<_i152.WaitingAgentsDataSource>()));
  gh.factory<_i286.AddClientUserUsecase>(
      () => _i286.AddClientUserUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i287.ApproveRejectClientUsecase>(() =>
      _i287.ApproveRejectClientUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i288.ChangeClientCommunicationUseCase>(() =>
      _i288.ChangeClientCommunicationUseCase(
          gh<_i252.ClientsListRepository>()));
  gh.factory<_i289.ChangeTypeClientUsecase>(
      () => _i289.ChangeTypeClientUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i290.EditClientUserUsecase>(
      () => _i290.EditClientUserUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i291.GetClientsListByRegionUseCase>(() =>
      _i291.GetClientsListByRegionUseCase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i292.GetClientsListByUserUseCase>(() =>
      _i292.GetClientsListByUserUseCase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i293.GetClientsWithFilterUserUsecase>(() =>
      _i293.GetClientsWithFilterUserUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i294.GetClientMarketingReportUsecase>(() =>
      _i294.GetClientMarketingReportUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i295.GetRecommendedClientsUsecase>(() =>
      _i295.GetRecommendedClientsUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i296.GetSimilarClientsUsecase>(
      () => _i296.GetSimilarClientsUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i297.ReceiveClientUserUsecase>(
      () => _i297.ReceiveClientUserUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i298.StoreClientCommunicationUseCase>(() =>
      _i298.StoreClientCommunicationUseCase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i299.TransferClientUserUsecase>(
      () => _i299.TransferClientUserUsecase(gh<_i252.ClientsListRepository>()));
  gh.lazySingleton<_i300.GetHighSimilarClientsUsecase>(() =>
      _i300.GetHighSimilarClientsUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i301.EmployeesSalesReportsCubit>(() =>
      _i301.EmployeesSalesReportsCubit(
          gh<_i271.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i302.ChangeStateAgentUseCase>(
      () => _i302.ChangeStateAgentUseCase(gh<_i246.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i303.GetAgentsAndDistributorsUseCase>(() =>
      _i303.GetAgentsAndDistributorsUseCase(
          gh<_i246.AgentsDistributorsRepo>()));
  gh.factory<_i304.ClientsAcceptCubit>(
      () => _i304.ClientsAcceptCubit(gh<_i201.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i305.CancelWithdrawalUsecase>(() =>
      _i305.CancelWithdrawalUsecase(gh<_i244.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i306.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i306.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i244.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i307.GetWithdrawalsInvoicesUsecase>(() =>
      _i307.GetWithdrawalsInvoicesUsecase(
          gh<_i244.ManageWithdrawalsRepository>()));
  gh.factory<_i308.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i308.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i244.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i309.ExceededClientsUseCase>(
      () => _i309.ExceededClientsUseCase(gh<_i99.ExceededClientsRepo>()));
  gh.lazySingleton<_i310.TransferExceededClientsUseCase>(() =>
      _i310.TransferExceededClientsUseCase(gh<_i99.ExceededClientsRepo>()));
  gh.factory<_i311.ParticipateListBloc>(() => _i311.ParticipateListBloc(
        gh<_i265.ParticipateListUsecase>(),
        gh<_i259.AddParticipateUserUsecase>(),
        gh<_i260.EditParticipateUserUsecase>(),
        gh<_i261.ParticipateClientListUsecase>(),
        gh<_i264.ParticipateInvoiceListUsecase>(),
        gh<_i263.GetParticipateInvoiceByIdUsecase>(),
        gh<_i262.ParticipateCommentListUsecase>(),
        gh<_i258.AddParticipateCommentUsecase>(),
        gh<_i266.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i312.LoginLocalDataSource>(() =>
      _i312.LoginLocalDataSourceImpl(
          gh<_i171.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i313.EditAdvancedConfigsUsecase>(() =>
      _i313.EditAdvancedConfigsUsecase(gh<_i142.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i314.GetAdvancedConfigsUsecase>(() =>
      _i314.GetAdvancedConfigsUsecase(gh<_i142.AdvancedConfigsRepository>()));
  gh.factory<_i315.ClientsInstallReportsCubit>(() =>
      _i315.ClientsInstallReportsCubit(
          gh<_i113.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i316.DatesTableRepo>(
      () => _i317.DatesTableRepoImpl(gh<_i162.DatesTableDataSource>()));
  gh.factory<_i318.GetVersionUseCase>(
      () => _i318.GetVersionUseCase(gh<_i182.AppRepository>()));
  gh.factory<_i319.AddTicketCubit>(
      () => _i319.AddTicketCubit(gh<_i131.AddTicketUseCase>()));
  gh.lazySingleton<_i320.LatestClientsUpdatesRepository>(() =>
      _i321.LatestClientsUpdatesRepositoryImpl(
          gh<_i146.LatestClientsUpdatesDatasource>()));
  gh.factory<_i322.TaskRepository>(
      () => _i323.TaskRepositoryImpl(gh<_i112.TaskDatasource>()));
  gh.lazySingleton<_i324.EditGeneralConfigsUsecase>(() =>
      _i324.EditGeneralConfigsUsecase(gh<_i202.GeneralConfigsRepository>()));
  gh.lazySingleton<_i325.GetGeneralConfigsUsecase>(() =>
      _i325.GetGeneralConfigsUsecase(gh<_i202.GeneralConfigsRepository>()));
  gh.factory<_i326.PeriodicCommunicationReportsCubit>(() =>
      _i326.PeriodicCommunicationReportsCubit(
          gh<_i207.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i327.GetAllClientsContactsUseCase>(() =>
      _i327.GetAllClientsContactsUseCase(
          gh<_i276.ClientsContactsRepository>()));
  gh.factory<_i328.InstallQualityCubit>(
      () => _i328.InstallQualityCubit(gh<_i212.GetInstallUseCase>()));
  gh.factory<_i329.ClientsContactsBloc>(() =>
      _i329.ClientsContactsBloc(gh<_i327.GetAllClientsContactsUseCase>()));
  gh.factory<_i330.ImportantLinksCubit>(() => _i330.ImportantLinksCubit(
        gh<_i280.GetImportantLinksUsecase>(),
        gh<_i279.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i331.AddAgentUseCase>(
      () => _i331.AddAgentUseCase(gh<_i186.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i332.UpdateAgentUseCase>(() =>
      _i332.UpdateAgentUseCase(gh<_i186.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i333.GetDelayInstallReportsUseCase>(() =>
      _i333.GetDelayInstallReportsUseCase(gh<_i180.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i334.CrudAgentSupportFilesUsecase>(() =>
      _i334.CrudAgentSupportFilesUsecase(
          gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i335.GetClientsTransferApprovalsUsecase>(() =>
      _i335.GetClientsTransferApprovalsUsecase(
          gh<_i273.ClientsTransferApprovalsRepo>()));
  gh.factory<_i336.ClientsStatusReportsCubit>(() =>
      _i336.ClientsStatusReportsCubit(
          gh<_i278.GetClientsStatusReportsUsecase>()));
  gh.factory<_i337.ViolationsCubit>(() => _i337.ViolationsCubit(
        gh<_i214.GetViolationsUsecase>(),
        gh<_i234.UpdateViolationUseCase>(),
        gh<_i213.GetManagementsUsecase>(),
        gh<_i215.GetViolationsTypesUseCase>(),
      ));
  gh.factory<_i338.SupportTabCubit>(() => _i338.SupportTabCubit(
        gh<_i221.GetInvoiceByClientUsecase>(),
        gh<_i219.AddDateInstallUsecase>(),
        gh<_i224.SetDateDoneUsecase>(),
        gh<_i225.SetReadyInstallUsecase>(),
        gh<_i223.ReturnInvoiceApproveUsecase>(),
        gh<_i222.ReceiveDeviceUsecase>(),
        gh<_i220.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i339.ClientsDebtsReportsCubit>(() =>
      _i339.ClientsDebtsReportsCubit(
          gh<_i166.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i340.DeletedInvoicesCubit>(
      () => _i340.DeletedInvoicesCubit(gh<_i275.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i341.AddAgentDateUseCase>(() =>
      _i341.AddAgentDateUseCase(gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i342.GetManageWithdrawnInvoicesUsecase>(() =>
      _i342.GetManageWithdrawnInvoicesUsecase(
          gh<_i173.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i343.NotificationsCubit>(() => _i343.NotificationsCubit(
        gh<_i204.GetNotificationsUsecase>(),
        gh<_i206.MarkNotificationsAsReadUsecase>(),
        gh<_i205.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i344.WithdrawnInvoicesRepo>(() =>
      _i345.WithdrawnInvoicesRepoImpl(gh<_i148.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i346.RegionsRepository>(
      () => _i347.RegionsRepositoryImpl(gh<_i164.RegionsDatasource>()));
  gh.factory<_i348.ClientLogsTabCubit>(
      () => _i348.ClientLogsTabCubit(gh<_i235.GetClientLogsUsecase>()));
  gh.factory<_i349.RegionsSalesReportsCubit>(() =>
      _i349.RegionsSalesReportsCubit(
          gh<_i192.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i350.AddClientContactBloc>(() => _i350.AddClientContactBloc(
        gh<_i256.AddClientContactUseCase>(),
        gh<_i257.UpdateClientContactUseCase>(),
      ));
  gh.factory<_i351.AgentsDistributorsActionsCubit>(
      () => _i351.AgentsDistributorsActionsCubit(
            gh<_i130.GetCitiesUseCase>(),
            gh<_i331.AddAgentUseCase>(),
            gh<_i332.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i352.FetchPaginatedClientsUsecase>(() =>
      _i352.FetchPaginatedClientsUsecase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i353.FetchLinkClientsUseCase>(
      () => _i353.FetchLinkClientsUseCase(gh<_i252.ClientsListRepository>()));
  gh.factory<_i354.LinkSelectedClientsUseCase>(() =>
      _i354.LinkSelectedClientsUseCase(gh<_i252.ClientsListRepository>()));
  gh.lazySingleton<_i355.LoginRepo>(() => _i356.LoginRepoImpl(
        gh<_i139.LoginRemoteDataSource>(),
        gh<_i312.LoginLocalDataSource>(),
      ));
  gh.factory<_i357.SpecialClientsBloc>(
      () => _i357.SpecialClientsBloc(gh<_i196.GetSpecialClientsUsecase>()));
  gh.factory<_i358.AddCommentUsecase>(
      () => _i358.AddCommentUsecase(gh<_i209.CompanyRepository>()));
  gh.factory<_i359.GetCommentUsecase>(
      () => _i359.GetCommentUsecase(gh<_i209.CompanyRepository>()));
  gh.factory<_i360.DelayInstallReportsCubit>(() =>
      _i360.DelayInstallReportsCubit(
          gh<_i333.GetDelayInstallReportsUseCase>()));
  gh.factory<_i361.DatesTimelineBloc>(
      () => _i361.DatesTimelineBloc(gh<_i216.GetTimelineByEmployeeUseCase>()));
  gh.factory<_i362.GreetingCommunicationCubit>(() =>
      _i362.GreetingCommunicationCubit(
          gh<_i272.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i363.GetRegionsUseCase>(
      () => _i363.GetRegionsUseCase(gh<_i346.RegionsRepository>()));
  gh.lazySingleton<_i364.GetLatestClientsUseCase>(() =>
      _i364.GetLatestClientsUseCase(
          gh<_i320.LatestClientsUpdatesRepository>()));
  gh.factory<_i365.AdvancedCofigsCubit>(() => _i365.AdvancedCofigsCubit(
        gh<_i314.GetAdvancedConfigsUsecase>(),
        gh<_i313.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i366.SupportClientsInvoicesCubit>(() =>
      _i366.SupportClientsInvoicesCubit(
          gh<_i243.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i367.WrongNumbersCubit>(
      () => _i367.WrongNumbersCubit(gh<_i200.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i368.CacheTokenUsecase>(
      () => _i368.CacheTokenUsecase(gh<_i355.LoginRepo>()));
  gh.lazySingleton<_i369.GetTokenUsecase>(
      () => _i369.GetTokenUsecase(gh<_i355.LoginRepo>()));
  gh.lazySingleton<_i370.LoginUsecase>(
      () => _i370.LoginUsecase(gh<_i355.LoginRepo>()));
  gh.lazySingleton<_i371.ValidateTokenUsecase>(
      () => _i371.ValidateTokenUsecase(gh<_i355.LoginRepo>()));
  gh.lazySingleton<_i372.VerifyOtpUsecase>(
      () => _i372.VerifyOtpUsecase(gh<_i355.LoginRepo>()));
  gh.factory<_i373.ClientsTransferApprovalsCubit>(() =>
      _i373.ClientsTransferApprovalsCubit(
          gh<_i335.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i374.RegionsCubit>(
      () => _i374.RegionsCubit(gh<_i363.GetRegionsUseCase>()));
  gh.factory<_i375.GeneralCofigsCubit>(() => _i375.GeneralCofigsCubit(
        gh<_i325.GetGeneralConfigsUsecase>(),
        gh<_i324.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i376.GetPeriodicCommunicationUseCase>(() =>
      _i376.GetPeriodicCommunicationUseCase(
          gh<_i229.PeriodicCommunicationRepo>()));
  gh.factory<_i377.ClientsActivitiesBloc>(() => _i377.ClientsActivitiesBloc(
        gh<_i281.GetAllClientsActivitiesUseCase>(),
        gh<_i282.UpdateActivityUseCase>(),
      ));
  gh.lazySingleton<_i378.GetClientsDebtsUsecase>(
      () => _i378.GetClientsDebtsUsecase(gh<_i227.ClientsDebtsRepo>()));
  gh.lazySingleton<_i379.CrudClientSupportFilesUsecase>(() =>
      _i379.CrudClientSupportFilesUsecase(
          repository: gh<_i252.ClientsListRepository>()));
  gh.lazySingleton<_i380.GetClientSupportFilesUsecase>(() =>
      _i380.GetClientSupportFilesUsecase(
          repository: gh<_i252.ClientsListRepository>()));
  gh.factory<_i381.BranchesCubit>(
      () => _i381.BranchesCubit(gh<_i208.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i382.AddAgentCommentUsecase>(() =>
      _i382.AddAgentCommentUsecase(gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i383.DoneTrainingUsecase>(() =>
      _i383.DoneTrainingUsecase(gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i384.GetAgentByIdUsecase>(() =>
      _i384.GetAgentByIdUsecase(gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i385.GetAgentClientListUsecase>(() =>
      _i385.GetAgentClientListUsecase(
          gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i386.GetAgentCommentsListUsecase>(() =>
      _i386.GetAgentCommentsListUsecase(
          gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i387.GetAgentDatesListUsecase>(() =>
      _i387.GetAgentDatesListUsecase(
          gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i388.GetAgentInvoiceListUsecase>(() =>
      _i388.GetAgentInvoiceListUsecase(
          gh<_i217.AgentsDistributorsProfileRepo>()));
  gh.factory<_i389.AddRejectReasonsUsecase>(() =>
      _i389.AddRejectReasonsUsecase(gh<_i244.ManageWithdrawalsRepository>()));
  gh.factory<_i390.EditRejectReasonsUsecase>(() =>
      _i390.EditRejectReasonsUsecase(gh<_i244.ManageWithdrawalsRepository>()));
  gh.factory<_i391.GetRejectReasonsUsecase>(() =>
      _i391.GetRejectReasonsUsecase(gh<_i244.ManageWithdrawalsRepository>()));
  gh.factory<_i392.GetUserSeriesUsecase>(() =>
      _i392.GetUserSeriesUsecase(gh<_i244.ManageWithdrawalsRepository>()));
  gh.factory<_i393.GetWithdrawnDetailsUsecase>(() =>
      _i393.GetWithdrawnDetailsUsecase(
          gh<_i244.ManageWithdrawalsRepository>()));
  gh.factory<_i394.SetApproveSeriesUsecase>(() =>
      _i394.SetApproveSeriesUsecase(gh<_i244.ManageWithdrawalsRepository>()));
  gh.factory<_i395.UpdateSeriesUsecase>(
      () => _i395.UpdateSeriesUsecase(gh<_i244.ManageWithdrawalsRepository>()));
  gh.factory<_i396.NotUsingSystemCubit>(
      () => _i396.NotUsingSystemCubit(gh<_i250.GetNotUsingSystemUsecase>()));
  gh.singleton<_i397.AppManagerCubit>(
      () => _i397.AppManagerCubit(gh<_i318.GetVersionUseCase>()));
  gh.factory<_i398.GetAllClientsDatesUseCase>(() =>
      _i398.GetAllClientsDatesUseCase(gh<_i254.ClientsDatesRepository>()));
  gh.lazySingleton<_i399.GetWaitingAgentsUsecase>(
      () => _i399.GetWaitingAgentsUsecase(gh<_i284.WaitingAgentsRepo>()));
  gh.factory<_i400.GetCrudActivitiesUseCase>(() =>
      _i400.GetCrudActivitiesUseCase(gh<_i269.CrudActivitiesRepository>()));
  gh.factory<_i401.UpdateActivityCrudUseCase>(() =>
      _i401.UpdateActivityCrudUseCase(gh<_i269.CrudActivitiesRepository>()));
  gh.factory<_i402.AddActivityCrudUseCase>(
      () => _i402.AddActivityCrudUseCase(gh<_i269.CrudActivitiesRepository>()));
  gh.factory<_i403.GetActivityTypesUseCase>(() =>
      _i403.GetActivityTypesUseCase(gh<_i269.CrudActivitiesRepository>()));
  gh.factory<_i404.GetSubscribedClientsUseCase>(() =>
      _i404.GetSubscribedClientsUseCase(gh<_i269.CrudActivitiesRepository>()));
  gh.factory<_i405.CrudActivitiesBloc>(() => _i405.CrudActivitiesBloc(
        gh<_i400.GetCrudActivitiesUseCase>(),
        gh<_i401.UpdateActivityCrudUseCase>(),
        gh<_i402.AddActivityCrudUseCase>(),
        gh<_i403.GetActivityTypesUseCase>(),
        gh<_i404.GetSubscribedClientsUseCase>(),
      ));
  gh.factory<_i406.InvoicesSectionCubit>(() => _i406.InvoicesSectionCubit(
        gh<_i198.GetInvoicesByPrivilegesUsecase>(),
        gh<_i303.GetAgentsAndDistributorsUseCase>(),
        gh<_i265.ParticipateListUsecase>(),
        gh<_i226.GetAllUsersUseCase>(),
        gh<_i199.GetInvoiceByIdUsecase>(),
        gh<_i197.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i407.ProductsSalesReportsCubit>(() =>
      _i407.ProductsSalesReportsCubit(
          gh<_i248.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i408.GetWithdrawnInvoicesUsecase>(() =>
      _i408.GetWithdrawnInvoicesUsecase(gh<_i344.WithdrawnInvoicesRepo>()));
  gh.factory<_i409.PreviousRatingsCubit>(
      () => _i409.PreviousRatingsCubit(gh<_i283.GetPreviousRatingsUsecase>()));
  gh.factory<_i410.AgentsDistributorsCubit>(() => _i410.AgentsDistributorsCubit(
        gh<_i303.GetAgentsAndDistributorsUseCase>(),
        gh<_i302.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i411.ExceededClientsCubit>(() => _i411.ExceededClientsCubit(
        gh<_i309.ExceededClientsUseCase>(),
        gh<_i310.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i412.ClientsListBloc>(() => _i412.ClientsListBloc(
        gh<_i293.GetClientsWithFilterUserUsecase>(),
        gh<_i295.GetRecommendedClientsUsecase>(),
        gh<_i296.GetSimilarClientsUsecase>(),
        gh<_i286.AddClientUserUsecase>(),
        gh<_i290.EditClientUserUsecase>(),
        gh<_i289.ChangeTypeClientUsecase>(),
        gh<_i288.ChangeClientCommunicationUseCase>(),
        gh<_i298.StoreClientCommunicationUseCase>(),
        gh<_i287.ApproveRejectClientUsecase>(),
        gh<_i379.CrudClientSupportFilesUsecase>(),
        gh<_i380.GetClientSupportFilesUsecase>(),
        gh<_i299.TransferClientUserUsecase>(),
        gh<_i297.ReceiveClientUserUsecase>(),
        gh<_i294.GetClientMarketingReportUsecase>(),
        gh<_i300.GetHighSimilarClientsUsecase>(),
        gh<_i353.FetchLinkClientsUseCase>(),
        gh<_i352.FetchPaginatedClientsUsecase>(),
        gh<_i354.LinkSelectedClientsUseCase>(),
        gh<_i233.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i413.ManageWithdrawalsCubit>(() => _i413.ManageWithdrawalsCubit(
        gh<_i392.GetUserSeriesUsecase>(),
        gh<_i395.UpdateSeriesUsecase>(),
        gh<_i241.GetUsersUsecase>(),
        gh<_i307.GetWithdrawalsInvoicesUsecase>(),
        gh<_i308.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i394.SetApproveSeriesUsecase>(),
        gh<_i393.GetWithdrawnDetailsUsecase>(),
        gh<_i389.AddRejectReasonsUsecase>(),
        gh<_i391.GetRejectReasonsUsecase>(),
        gh<_i390.EditRejectReasonsUsecase>(),
        gh<_i306.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i305.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i414.ManageWithdrawnInvoicesCubit>(() =>
      _i414.ManageWithdrawnInvoicesCubit(
          gh<_i342.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i415.LatestClientsUpdatesCubit>(() =>
      _i415.LatestClientsUpdatesCubit(gh<_i364.GetLatestClientsUseCase>()));
  gh.factory<_i416.AttachmentsRowCubit>(() => _i416.AttachmentsRowCubit(
        gh<_i380.GetClientSupportFilesUsecase>(),
        gh<_i379.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i417.CancelScheduleUsecase>(
      () => _i417.CancelScheduleUsecase(gh<_i316.DatesTableRepo>()));
  gh.lazySingleton<_i418.ChangeDateToDonUsecase>(
      () => _i418.ChangeDateToDonUsecase(gh<_i316.DatesTableRepo>()));
  gh.lazySingleton<_i419.GetCancelReasonsUsecase>(
      () => _i419.GetCancelReasonsUsecase(gh<_i316.DatesTableRepo>()));
  gh.lazySingleton<_i420.GetDateInstallationUsecase>(
      () => _i420.GetDateInstallationUsecase(gh<_i316.DatesTableRepo>()));
  gh.lazySingleton<_i421.GetInvoicesByClientForDateUsecase>(() =>
      _i421.GetInvoicesByClientForDateUsecase(gh<_i316.DatesTableRepo>()));
  gh.lazySingleton<_i422.GetSubscribedClientsUsecase>(
      () => _i422.GetSubscribedClientsUsecase(gh<_i316.DatesTableRepo>()));
  gh.lazySingleton<_i423.RescheduleDateUsecase>(
      () => _i423.RescheduleDateUsecase(gh<_i316.DatesTableRepo>()));
  gh.lazySingleton<_i424.ReturnScheduleVisitToOpenUsecase>(
      () => _i424.ReturnScheduleVisitToOpenUsecase(gh<_i316.DatesTableRepo>()));
  gh.factory<_i425.AddTaskUsecase>(
      () => _i425.AddTaskUsecase(gh<_i322.TaskRepository>()));
  gh.factory<_i426.ChangeStatusTaskUsecase>(
      () => _i426.ChangeStatusTaskUsecase(gh<_i322.TaskRepository>()));
  gh.factory<_i427.GetTasksUsecase>(
      () => _i427.GetTasksUsecase(gh<_i322.TaskRepository>()));
  gh.factory<_i428.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i428.GetUsersByDepartmentAndRegionUsecase(gh<_i322.TaskRepository>()));
  gh.lazySingleton<_i429.TaskCubit>(() => _i429.TaskCubit(
        gh<_i425.AddTaskUsecase>(),
        gh<_i427.GetTasksUsecase>(),
        gh<_i426.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i430.UsersCubit>(() => _i430.UsersCubit(
        gh<_i241.GetUsersUsecase>(),
        gh<_i242.GetUserByIdUsecase>(),
        gh<_i101.ActionUserUsecase>(),
        gh<_i428.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i240.GetManagesForUserUsecase>(),
        gh<_i239.GetLevelsForUserUsecase>(),
        gh<_i238.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i431.CompanyCubit>(() => _i431.CompanyCubit(
        gh<_i359.GetCommentUsecase>(),
        gh<_i358.AddCommentUsecase>(),
      ));
  gh.factory<_i432.ClientsDebtsCubit>(
      () => _i432.ClientsDebtsCubit(gh<_i378.GetClientsDebtsUsecase>()));
  gh.factory<_i433.PeriodicCommunicationCubit>(() =>
      _i433.PeriodicCommunicationCubit(
          gh<_i376.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i434.LoginCubit>(() => _i434.LoginCubit(
        gh<_i370.LoginUsecase>(),
        gh<_i372.VerifyOtpUsecase>(),
        gh<_i368.CacheTokenUsecase>(),
        gh<_i369.GetTokenUsecase>(),
        gh<_i371.ValidateTokenUsecase>(),
      ));
  gh.factory<_i435.AgentsDistributorsProfileBloc>(
      () => _i435.AgentsDistributorsProfileBloc(
            gh<_i384.GetAgentByIdUsecase>(),
            gh<_i385.GetAgentClientListUsecase>(),
            gh<_i388.GetAgentInvoiceListUsecase>(),
            gh<_i263.GetParticipateInvoiceByIdUsecase>(),
            gh<_i386.GetAgentCommentsListUsecase>(),
            gh<_i382.AddAgentCommentUsecase>(),
            gh<_i383.DoneTrainingUsecase>(),
            gh<_i341.AddAgentDateUseCase>(),
            gh<_i387.GetAgentDatesListUsecase>(),
            gh<_i334.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i436.DatesTableCubit>(() => _i436.DatesTableCubit(
        gh<_i420.GetDateInstallationUsecase>(),
        gh<_i423.RescheduleDateUsecase>(),
        gh<_i418.ChangeDateToDonUsecase>(),
        gh<_i417.CancelScheduleUsecase>(),
        gh<_i424.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i422.GetSubscribedClientsUsecase>(),
        gh<_i421.GetInvoicesByClientForDateUsecase>(),
        gh<_i219.AddDateInstallUsecase>(),
        gh<_i419.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i437.ClientsDatesCubit>(
      () => _i437.ClientsDatesCubit(gh<_i398.GetAllClientsDatesUseCase>()));
  gh.factory<_i438.WithdrawnInvoicesCubit>(() =>
      _i438.WithdrawnInvoicesCubit(gh<_i408.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i439.WaitingAgentsCubit>(
      () => _i439.WaitingAgentsCubit(gh<_i399.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i440.AppModule {}
