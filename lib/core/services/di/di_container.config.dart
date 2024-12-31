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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i62;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i187;
import '../../../features/app/domain/repositories/app_repository.dart' as _i186;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i326;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i410;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i320;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i141;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i370;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i369;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i382;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i383;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i384;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i385;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i386;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i446;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i32;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i49;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i48;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i205;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i312;
import '../../../features/clients_care/client_communications/data/data_sources/care_activities_datasource.dart'
    as _i63;
import '../../../features/clients_care/client_communications/data/repositories/care_activities_repo_impl.dart'
    as _i241;
import '../../../features/clients_care/client_communications/domain/repositories/care_activities_repo.dart'
    as _i240;
import '../../../features/clients_care/client_communications/domain/use_cases/get_all_care_activities_usecase.dart'
    as _i412;
import '../../../features/clients_care/client_communications/domain/use_cases/update_care_activity_usecase.dart'
    as _i413;
import '../../../features/clients_care/client_communications/presentation/manager/care_activities_bloc.dart'
    as _i420;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i29;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i100;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i99;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i126;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i197;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i26;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i39;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i38;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i259;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i409;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i57;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i77;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i76;
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
    as _i327;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i161;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i137;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i28;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i41;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i40;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i204;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i381;
import '../../../features/clients_care/crud_activites/data/data_sources/crud_activities_datasource.dart'
    as _i64;
import '../../../features/clients_care/crud_activites/data/repositories/crud_activities_repo_impl.dart'
    as _i261;
import '../../../features/clients_care/crud_activites/domain/repositories/crud_activities_repo.dart'
    as _i260;
import '../../../features/clients_care/crud_activites/domain/use_cases/add_activity_crud_usecase.dart'
    as _i352;
import '../../../features/clients_care/crud_activites/domain/use_cases/get_activity_types_usecase.dart'
    as _i353;
import '../../../features/clients_care/crud_activites/domain/use_cases/get_crud_activities_usecase.dart'
    as _i354;
import '../../../features/clients_care/crud_activites/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i355;
import '../../../features/clients_care/crud_activites/domain/use_cases/update_activity_crud_usecase.dart'
    as _i356;
import '../../../features/clients_care/crud_activites/presentation/manager/crud_activities_bloc.dart'
    as _i440;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i11;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i53;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i52;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i108;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i279;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i19;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i172;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i171;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i281;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i376;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i54;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i181;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i180;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i216;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i336;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i43;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i237;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i236;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i390;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i445;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i34;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i46;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i45;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i211;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i334;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i27;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i115;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i114;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i290;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i419;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i65;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i156;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i155;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i200;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i371;
import '../../../features/clients_care/violations_clienta_care/data/data_sources/violations_clients_care_datasource.dart'
    as _i17;
import '../../../features/clients_care/violations_clienta_care/data/repositories/violations_repository_impl.dart'
    as _i105;
import '../../../features/clients_care/violations_clienta_care/domain/repositories/violations_repository.dart'
    as _i104;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_all_management_usecase.dart'
    as _i217;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_violation_types_usecase.dart'
    as _i219;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_violations_usecase.dart'
    as _i218;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/update_violadtion_usecase.dart'
    as _i243;
import '../../../features/clients_care/violations_clienta_care/presentation/manager/violations_cubit.dart'
    as _i346;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i98;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i107;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i106;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i212;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i394;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i74;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i129;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i128;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i130;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i258;
import '../../../features/common/client_profile/client_activities_tab/data/data_sources/client_activities_datasource.dart'
    as _i66;
import '../../../features/common/client_profile/client_activities_tab/data/repositories/client_activities_repo_impl.dart'
    as _i140;
import '../../../features/common/client_profile/client_activities_tab/domain/repositories/client_activities_repo.dart'
    as _i139;
import '../../../features/common/client_profile/client_activities_tab/domain/use_cases/get_client_activities_usecase.dart'
    as _i311;
import '../../../features/common/client_profile/client_activities_tab/presentation/manager/client_activities_bloc.dart'
    as _i415;
import '../../../features/common/client_profile/client_dates_tab/data/data_sources/client_dates_datasource.dart'
    as _i67;
import '../../../features/common/client_profile/client_dates_tab/data/repositories/clients_dates_repo_impl.dart'
    as _i266;
import '../../../features/common/client_profile/client_dates_tab/domain/repositories/clients_dates_repo.dart'
    as _i265;
import '../../../features/common/client_profile/client_dates_tab/domain/use_cases/get_all_clients_dates_usecase.dart'
    as _i411;
import '../../../features/common/client_profile/client_dates_tab/presentation/manager/clients_dates_cubit.dart'
    as _i449;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i80;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i117;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i116;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i244;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i362;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i121;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i199;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i198;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i226;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i227;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i228;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i229;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i230;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i231;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i232;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i347;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i168;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i361;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i360;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i377;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i388;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i73;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i90;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i89;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i122;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i262;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i3;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i75;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i145;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i144;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i321;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i322;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i379;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i93;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i207;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i206;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i332;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i333;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i389;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i18;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i56;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i55;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i119;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i120;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i138;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i14;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i183;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i182;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i189;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i188;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i215;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i59;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i92;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i91;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i103;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i247;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i248;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i249;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i251;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i250;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i442;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i47;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i254;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i253;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i402;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i313;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i403;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i314;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i404;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i405;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i316;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i315;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i406;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i407;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i408;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i424;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i15;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i31;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i30;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i208;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i209;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i210;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i357;
import '../../../features/sales/clients/add_client_contact/data/data_sources/add_client_contact_datasource.dart'
    as _i68;
import '../../../features/sales/clients/add_client_contact/data/repositories/add_client_contact_repo_impl.dart'
    as _i124;
import '../../../features/sales/clients/add_client_contact/domain/repositories/add_client_contact_repo.dart'
    as _i123;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/add_client_contact_usecase.dart'
    as _i267;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/update_client_contact_usecase.dart'
    as _i268;
import '../../../features/sales/clients/add_client_contact/presentation/manager/add_client_contact_bloc.dart'
    as _i364;
import '../../../features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart'
    as _i69;
import '../../../features/sales/clients/clients_contacts/data/repositories/clients_contacts_repo_impl.dart'
    as _i286;
import '../../../features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart'
    as _i285;
import '../../../features/sales/clients/clients_contacts/domain/use_cases/get_all_clients_contacts_usecase.dart'
    as _i335;
import '../../../features/sales/clients/clients_contacts/presentation/manager/clients_contacts_bloc.dart'
    as _i337;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i50;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i235;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i234;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i391;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i444;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i70;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i36;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i264;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i263;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i293;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i294;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_client_communication_usecase.dart'
    as _i295;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i296;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i392;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i297;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i242;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i367;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i366;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i301;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i393;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i298;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i299;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i300;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i307;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i302;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i303;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i368;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i304;
import '../../../features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart'
    as _i305;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i306;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i423;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i60;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i283;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i282;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i344;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i387;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i51;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i95;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i94;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i157;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i192;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i148;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i329;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i328;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i378;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i426;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i13;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i97;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i96;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i125;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i278;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i71;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i214;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i213;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i372;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i373;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i443;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i118;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i194;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i193;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i284;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i349;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i61;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i102;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i101;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i317;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i318;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i422;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i127;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i152;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i151;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i201;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i233;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i203;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i202;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i416;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i149;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i178;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i177;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i351;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i425;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i20;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i111;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i160;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i191;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i222;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i256;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i190;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i221;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i255;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i395;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i350;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i339;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i309;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i343;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i396;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i397;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i398;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i399;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i400;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i401;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i310;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i340;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i365;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i447;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i421;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i72;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i239;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i238;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i288;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i289;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i338;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i42;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i147;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i146;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i269;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i270;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i277;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i271;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i272;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i273;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i274;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i275;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i276;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i319;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i25;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i83;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i82;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i170;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i348;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i33;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i163;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i162;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i287;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i345;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i44;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i143;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i142;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i280;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i308;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i16;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i159;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i158;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i257;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i417;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i79;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i78;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i196;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i363;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i150;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i359;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i358;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i418;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i450;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i23;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i110;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i109;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i113;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i323;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i166;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i325;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i324;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i428;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i429;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i430;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i431;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i432;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i433;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i434;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i435;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i448;
import '../../../features/support/dates_timeline/data/data_sources/dates_timeline_datasource.dart'
    as _i81;
import '../../../features/support/dates_timeline/data/respositories_impl/dates_timeline_repo_impl.dart'
    as _i174;
import '../../../features/support/dates_timeline/domain/respositories/dates_timline_repo.dart'
    as _i173;
import '../../../features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart'
    as _i220;
import '../../../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart'
    as _i375;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i12;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i87;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i86;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i167;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i195;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i35;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i185;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i184;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i342;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i374;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i10;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i85;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i84;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i88;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i153;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i58;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i246;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i245;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i252;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i380;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i154;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i292;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i291;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i414;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i451;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i112;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i331;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i330;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i436;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i437;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i438;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i439;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i441;
import '../../../features/versions/data/data_sources/versions_datasource.dart'
    as _i37;
import '../../../features/versions/data/repositories/versions_repo_impl.dart'
    as _i165;
import '../../../features/versions/domain/repositories/versions_repo.dart'
    as _i164;
import '../../../features/versions/domain/use_cases/add_version_usecase.dart'
    as _i223;
import '../../../features/versions/domain/use_cases/get_versions_usecase.dart'
    as _i224;
import '../../../features/versions/domain/use_cases/update_version_usecase.dart'
    as _i225;
import '../../../features/versions/presentation/manager/versions_bloc.dart'
    as _i341;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i427;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i175;
import '../cache_services/prefs_consumer.dart' as _i179;
import '../cache_services/secure_storage_consumer.dart' as _i176;
import '../maps/location_services.dart' as _i169;
import 'di_container.dart' as _i452;

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
  gh.lazySingleton<_i37.NotificationsDatasource>(
      () => _i37.NotificationsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i38.NotUsingSystemRepo>(
      () => _i39.NotUsingSystemRepoImpl(gh<_i26.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i40.WrongNumbersRepo>(
      () => _i41.WrongNumbersRepoImpl(gh<_i28.WrongNumbersDatasource>()));
  gh.lazySingleton<_i42.ParticipatesListDatasource>(
      () => _i42.ParticipatesListDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i43.PeriodicCommunicationDatasource>(
      () => _i43.PeriodicCommunicationDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i44.EmployeesSalesReportsDatasource>(
      () => _i44.EmployeesSalesReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i45.PeriodicCommunicationReportsRepo>(() =>
      _i46.PeriodicCommunicationReportsRepoImpl(
          gh<_i34.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i47.ManageWithdrawalsDatasource>(
      () => _i47.ManageWithdrawalsDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i48.ClientsAcceptRepository>(() =>
      _i49.ClientsAcceptRepositoryImpl(gh<_i32.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i50.ClientsDebtsDatasource>(
      () => _i50.ClientsDebtsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i51.FinancePendingDatasource>(
      () => _i51.FinancePendingDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i52.EvaluationLevelReportRepo>(() =>
      _i53.EvaluationLevelReportRepoImpl(
          gh<_i11.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i54.InstallQualityDatasource>(
      () => _i54.InstallQualityDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i55.LevelsRepo>(
      () => _i56.LevelsRepoImpl(gh<_i18.LevelsDatasource>()));
  gh.lazySingleton<_i57.TicketsDataSource>(
      () => _i57.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i58.SupportClientsInvoicesDatasource>(
      () => _i58.DelayInstallReportsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i59.UsersDatasource>(
      () => _i59.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.singletonAsync<_i21.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i22.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i60.ClientsTransferApprovalsDatasource>(
      () => _i60.ClientsTransferApprovalsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i61.ExceededClientsDatasource>(
      () => _i61.ExceededClientsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i62.AppDatasource>(
      () => _i62.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i63.CareActivitiesDatasource>(
      () => _i63.CareActivitiesDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i64.CrudActivitiesDatasource>(
      () => _i64.CrudActivitiesDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i65.SpecialClientsDatasource>(
      () => _i65.SpecialClientsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i66.ClientActivitiesDatasource>(
      () => _i66.ClientActivitiesDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i67.ClientsDatesDatasource>(
      () => _i67.ClientsDatesDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i68.AddClientsContactsDatasource>(
      () => _i68.AddClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i69.ClientsContactsDatasource>(
      () => _i69.ClientsContactsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i70.ClientsListDatasource>(
      () => _i70.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i71.CommentCompanyDatasource>(
      () => _i71.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i72.ImportantLinksDatasource>(
      () => _i72.ImportantLinksDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i73.UsersDatasource>(
      () => _i73.UsersDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i74.CitiesDatasource>(
      () => _i74.CitiesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i75.AdvancedConfigsDatasource>(
      () => _i75.AdvancedConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i76.TicketsRepo>(
      () => _i77.TicketsRepoImpl(gh<_i57.TicketsDataSource>()));
  gh.lazySingleton<_i78.RegionsSalesReportsRepo>(() =>
      _i79.RegionsSalesReportsRepoImpl(
          gh<_i24.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i80.ClientLogsTabDataSource>(
      () => _i80.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i81.DatesTimelineDatasource>(
      () => _i81.DatesTimelineDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i82.ClientsDebtsReportsRepo>(() =>
      _i83.ClientsDebtsReportsRepoImpl(
          gh<_i25.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i84.SupportClientsAcceptRepository>(() =>
      _i85.SupportClientsAcceptRepositoryImpl(
          gh<_i10.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i86.DelayAfterInstallRepo>(() =>
      _i87.DelayAfterInstallRepoImpl(gh<_i12.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i88.GetSupportClientsAcceptUseCase>(() =>
      _i88.GetSupportClientsAcceptUseCase(
          gh<_i84.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i89.UsersRepository>(
      () => _i90.UsersRepositoryImpl(gh<_i73.UsersDatasource>()));
  gh.lazySingleton<_i91.UsersRepository>(
      () => _i92.UsersRepositoryImpl(gh<_i59.UsersDatasource>()));
  gh.lazySingleton<_i93.GeneralConfigsDatasource>(
      () => _i93.GeneralConfigsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i94.FinancePendingRepo>(
      () => _i95.FinancePendingRepoImpl(gh<_i51.FinancePendingDatasource>()));
  gh.lazySingleton<_i96.PendingInvoicesRepo>(
      () => _i97.PendingInvoicesRepoImpl(gh<_i13.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i98.BranchesDatasource>(
      () => _i98.BranchesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i99.ClientsCareReportsRepo>(() =>
      _i100.ClientsCareReportsRepoImpl(
          gh<_i29.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i101.ExceededClientsRepo>(() =>
      _i102.ExceededClientsRepoImpl(gh<_i61.ExceededClientsDatasource>()));
  gh.factory<_i103.ActionUserUsecase>(
      () => _i103.ActionUserUsecase(gh<_i91.UsersRepository>()));
  gh.lazySingleton<_i104.ViolationsRepository>(() =>
      _i105.ViolationsRepositoryImpl(
          gh<_i17.ViolationsClientsCareDatasource>()));
  gh.lazySingleton<_i106.BranchesRepository>(
      () => _i107.BranchesRepositoryImpl(gh<_i98.BranchesDatasource>()));
  gh.lazySingleton<_i108.GetEvaluationLevelReportUsecase>(() =>
      _i108.GetEvaluationLevelReportUsecase(
          gh<_i52.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i109.ClientsInstallReportsRepo>(() =>
      _i110.ClientsInstallReportsRepoImpl(
          gh<_i23.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i111.AgentsDistributorsDataSource>(
      () => _i111.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i112.TaskDatasource>(
      () => _i112.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i113.GetClientsInstallReportsUsecase>(() =>
      _i113.GetClientsInstallReportsUsecase(
          gh<_i109.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i114.PreviousRatingsRepo>(() =>
      _i115.PreviousRatingsRepoImpl(gh<_i27.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i116.ClientLogsTabRepo>(
      () => _i117.ClientLogsTabRepoImpl(gh<_i80.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i118.DeletedInvoicesDatasource>(
      () => _i118.DeletedInvoicesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i119.AddLevelUsecase>(
      () => _i119.AddLevelUsecase(gh<_i55.LevelsRepo>()));
  gh.lazySingleton<_i120.GetLevelsUsecase>(
      () => _i120.GetLevelsUsecase(gh<_i55.LevelsRepo>()));
  gh.lazySingleton<_i121.SupportTabDataSource>(
      () => _i121.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i122.GetUsersUsecase>(
      () => _i122.GetUsersUsecase(gh<_i89.UsersRepository>()));
  gh.factory<_i123.AddClientContactRepository>(() =>
      _i124.AddClientContactRepositoryImpl(
          gh<_i68.AddClientsContactsDatasource>()));
  gh.lazySingleton<_i125.GetPendingInvoicesUsecase>(
      () => _i125.GetPendingInvoicesUsecase(gh<_i96.PendingInvoicesRepo>()));
  gh.lazySingleton<_i126.GetClientsCareReportsUsecase>(() =>
      _i126.GetClientsCareReportsUsecase(gh<_i99.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i127.InvoicesTabDataSource>(
      () => _i127.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i128.CitiesRepository>(
      () => _i129.CitiesRepositoryImpl(gh<_i74.CitiesDatasource>()));
  gh.lazySingleton<_i130.GetCitiesUseCase>(
      () => _i130.GetCitiesUseCase(gh<_i128.CitiesRepository>()));
  gh.lazySingleton<_i131.AddTicketUseCase>(
      () => _i131.AddTicketUseCase(gh<_i76.TicketsRepo>()));
  gh.lazySingleton<_i132.EditTicketTypeUseCase>(
      () => _i132.EditTicketTypeUseCase(gh<_i76.TicketsRepo>()));
  gh.lazySingleton<_i133.GetClientTicketsUseCase>(
      () => _i133.GetClientTicketsUseCase(gh<_i76.TicketsRepo>()));
  gh.lazySingleton<_i134.GetTicketsUseCase>(
      () => _i134.GetTicketsUseCase(gh<_i76.TicketsRepo>()));
  gh.lazySingleton<_i135.GetTicketByIdUseCase>(
      () => _i135.GetTicketByIdUseCase(gh<_i76.TicketsRepo>()));
  gh.lazySingleton<_i136.TransferTicketUseCase>(
      () => _i136.TransferTicketUseCase(gh<_i76.TicketsRepo>()));
  gh.factory<_i137.TicketsCubit>(() => _i137.TicketsCubit(
        gh<_i134.GetTicketsUseCase>(),
        gh<_i135.GetTicketByIdUseCase>(),
        gh<_i133.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i138.LevelsCubit>(() => _i138.LevelsCubit(
        gh<_i120.GetLevelsUsecase>(),
        gh<_i119.AddLevelUsecase>(),
      ));
  gh.factory<_i139.ClientActivitiesRepository>(() =>
      _i140.ClientListRepositoryImpl(gh<_i66.ClientActivitiesDatasource>()));
  gh.lazySingleton<_i141.LoginRemoteDataSource>(
      () => _i141.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i142.EmployeesSalesReportsRepo>(() =>
      _i143.EmployeesSalesReportsRepoImpl(
          gh<_i44.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i144.AdvancedConfigsRepository>(() =>
      _i145.AdvancedConfigsRepositoryImpl(
          gh<_i75.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i146.ParticipateListRepository>(() =>
      _i147.ParticipateListRepositoryImpl(
          gh<_i42.ParticipatesListDatasource>()));
  gh.lazySingleton<_i148.LatestClientsUpdatesDatasource>(
      () => _i148.LatestClientsUpdatesDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i149.ManageWithdrawnInvoicesDataSource>(
      () => _i149.ManageWithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i150.WithdrawnInvoicesDataSource>(
      () => _i150.WithdrawnInvoicesDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i151.InvoicesSectionRepo>(
      () => _i152.InvoicesTabRepoImpl(gh<_i127.InvoicesTabDataSource>()));
  gh.factory<_i153.SupportClientsAcceptCubit>(() =>
      _i153.SupportClientsAcceptCubit(
          gh<_i88.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i154.WaitingAgentsDataSource>(
      () => _i154.WaitingAgentsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i155.SpecialClientsRepository>(() =>
      _i156.SpecialClientsRepositoryImpl(gh<_i65.SpecialClientsDatasource>()));
  gh.lazySingleton<_i157.GetFinancePendingInvoicesUsecase>(() =>
      _i157.GetFinancePendingInvoicesUsecase(gh<_i94.FinancePendingRepo>()));
  gh.lazySingleton<_i158.ProductsSalesReportsRepo>(() =>
      _i159.ProductsSalesReportsRepoImpl(
          gh<_i16.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i160.AgentsDistributorsProfileDataSource>(() =>
      _i160.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i161.EditTicketCubit>(() => _i161.EditTicketCubit(
        gh<_i132.EditTicketTypeUseCase>(),
        gh<_i136.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i162.ClientsStatusReportsRepo>(() =>
      _i163.ClientsStatusReportsRepoImpl(
          gh<_i33.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i164.versionsRepo>(
      () => _i165.NotificationsRepoImpl(gh<_i37.NotificationsDatasource>()));
  gh.lazySingleton<_i166.DatesTableDataSource>(
      () => _i166.DatesTableDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i167.GetDelayAfterInstallUseCase>(() =>
      _i167.GetDelayAfterInstallUseCase(gh<_i86.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i168.RegionsDatasource>(
      () => _i168.RegionsDatasourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i169.LocationServices>(
      () => _i169.LocationServices(gh<_i7.Location>()));
  gh.lazySingleton<_i170.GetClientsDebtsReportsUsecase>(() =>
      _i170.GetClientsDebtsReportsUsecase(gh<_i82.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i171.GreetingCommunicationRepo>(() =>
      _i172.GreetingCommunicationRepoImpl(
          gh<_i19.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i173.DatesTimeLinesRepo>(
      () => _i174.DatesTimelineRepoImpl(gh<_i81.DatesTimelineDatasource>()));
  gh.singleton<_i175.CacheServices>(
    () => _i176.SecureStorageConsumer(gh<_i22.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i177.ManageWithdrawnInvoicesRepo>(() =>
      _i178.ManageWithdrawnInvoicesRepoImpl(
          gh<_i149.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i175.CacheServices>(() async =>
      _i179.PrefsConsumer(await gh.getAsync<_i21.SharedPreferences>()));
  gh.lazySingleton<_i180.InstallQualityRepo>(
      () => _i181.InstallQualityRepoImpl(gh<_i54.InstallQualityDatasource>()));
  gh.lazySingleton<_i182.PrivilegesRepo>(
      () => _i183.PrivilegesRepoImpl(gh<_i14.PrivilegesDatasource>()));
  gh.lazySingleton<_i184.DelayInstallReportsRepo>(() =>
      _i185.DelayInstallReportsRepoImpl(
          gh<_i35.DelayInstallReportsDatasource>()));
  gh.factory<_i186.AppRepository>(
      () => _i187.AppRepositoryImpl(gh<_i62.AppDatasource>()));
  gh.factory<_i188.UpdatePrivilegesUsecase>(
      () => _i188.UpdatePrivilegesUsecase(gh<_i182.PrivilegesRepo>()));
  gh.lazySingleton<_i189.GetPrivilegesUsecase>(
      () => _i189.GetPrivilegesUsecase(gh<_i182.PrivilegesRepo>()));
  gh.lazySingleton<_i190.AgentsDistributorsActionsRepo>(() =>
      _i191.AgentsDistributorsActionsRepoImpl(
          gh<_i20.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i192.FinancePendingCubit>(() =>
      _i192.FinancePendingCubit(gh<_i157.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i193.DeletedInvoicesRepo>(() =>
      _i194.DeletedInvoicesRepoImpl(gh<_i118.DeletedInvoicesDatasource>()));
  gh.factory<_i195.DelayAfterInstallCubit>(() =>
      _i195.DelayAfterInstallCubit(gh<_i167.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i196.GetRegionsSalesReportsUsecase>(() =>
      _i196.GetRegionsSalesReportsUsecase(gh<_i78.RegionsSalesReportsRepo>()));
  gh.factory<_i197.ClientsCareReportsCubit>(() =>
      _i197.ClientsCareReportsCubit(gh<_i126.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i198.SupportTabRepo>(
      () => _i199.SupportTabRepoImpl(gh<_i121.SupportTabDataSource>()));
  gh.factory<_i200.GetSpecialClientsUsecase>(() =>
      _i200.GetSpecialClientsUsecase(gh<_i155.SpecialClientsRepository>()));
  gh.lazySingleton<_i201.ExportInvoicesToExcelUsecase>(() =>
      _i201.ExportInvoicesToExcelUsecase(gh<_i151.InvoicesSectionRepo>()));
  gh.lazySingleton<_i202.GetInvoicesByPrivilegesUsecase>(() =>
      _i202.GetInvoicesByPrivilegesUsecase(gh<_i151.InvoicesSectionRepo>()));
  gh.lazySingleton<_i203.GetInvoiceByIdUsecase>(
      () => _i203.GetInvoiceByIdUsecase(gh<_i151.InvoicesSectionRepo>()));
  gh.lazySingleton<_i204.GetWrongNumbersUsecase>(
      () => _i204.GetWrongNumbersUsecase(gh<_i40.WrongNumbersRepo>()));
  gh.lazySingleton<_i205.GetClientsAcceptUseCase>(
      () => _i205.GetClientsAcceptUseCase(gh<_i48.ClientsAcceptRepository>()));
  gh.lazySingleton<_i206.GeneralConfigsRepository>(() =>
      _i207.GeneralConfigsRepositoryImpl(gh<_i93.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i208.GetNotificationsUsecase>(
      () => _i208.GetNotificationsUsecase(gh<_i30.NotificationsRepo>()));
  gh.lazySingleton<_i209.GetUnreadNotificationsCountUsecase>(() =>
      _i209.GetUnreadNotificationsCountUsecase(gh<_i30.NotificationsRepo>()));
  gh.lazySingleton<_i210.MarkNotificationsAsReadUsecase>(
      () => _i210.MarkNotificationsAsReadUsecase(gh<_i30.NotificationsRepo>()));
  gh.lazySingleton<_i211.GetPeriodicCommunicationReportsUsecase>(() =>
      _i211.GetPeriodicCommunicationReportsUsecase(
          gh<_i45.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i212.GetBranchesByIdCountryUseCase>(() =>
      _i212.GetBranchesByIdCountryUseCase(gh<_i106.BranchesRepository>()));
  gh.factory<_i213.CompanyRepository>(
      () => _i214.CompanyRepositoryImpl(gh<_i71.CommentCompanyDatasource>()));
  gh.singleton<_i215.PrivilegesCubit>(() => _i215.PrivilegesCubit(
        gh<_i189.GetPrivilegesUsecase>(),
        gh<_i188.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i216.GetInstallUseCase>(
      () => _i216.GetInstallUseCase(gh<_i180.InstallQualityRepo>()));
  gh.lazySingleton<_i217.GetManagementsUsecase>(
      () => _i217.GetManagementsUsecase(gh<_i104.ViolationsRepository>()));
  gh.lazySingleton<_i218.GetViolationsUsecase>(
      () => _i218.GetViolationsUsecase(gh<_i104.ViolationsRepository>()));
  gh.lazySingleton<_i219.GetViolationsTypesUseCase>(
      () => _i219.GetViolationsTypesUseCase(gh<_i104.ViolationsRepository>()));
  gh.lazySingleton<_i220.GetTimelineByEmployeeUseCase>(
      () => _i220.GetTimelineByEmployeeUseCase(gh<_i173.DatesTimeLinesRepo>()));
  gh.lazySingleton<_i221.AgentsDistributorsProfileRepo>(() =>
      _i222.AgentsDistributorsProfileRepoImpl(
          gh<_i160.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i223.AddVersionsUsecase>(
      () => _i223.AddVersionsUsecase(gh<_i164.versionsRepo>()));
  gh.lazySingleton<_i224.GetVersionsUsecase>(
      () => _i224.GetVersionsUsecase(gh<_i164.versionsRepo>()));
  gh.lazySingleton<_i225.UpdateVersionsUsecase>(
      () => _i225.UpdateVersionsUsecase(gh<_i164.versionsRepo>()));
  gh.lazySingleton<_i226.AddDateInstallUsecase>(
      () => _i226.AddDateInstallUsecase(gh<_i198.SupportTabRepo>()));
  gh.lazySingleton<_i227.CancelDateInstallUsecase>(
      () => _i227.CancelDateInstallUsecase(gh<_i198.SupportTabRepo>()));
  gh.lazySingleton<_i228.GetInvoiceByClientUsecase>(
      () => _i228.GetInvoiceByClientUsecase(gh<_i198.SupportTabRepo>()));
  gh.lazySingleton<_i229.ReceiveDeviceUsecase>(
      () => _i229.ReceiveDeviceUsecase(gh<_i198.SupportTabRepo>()));
  gh.lazySingleton<_i230.ReturnInvoiceApproveUsecase>(
      () => _i230.ReturnInvoiceApproveUsecase(gh<_i198.SupportTabRepo>()));
  gh.lazySingleton<_i231.SetDateDoneUsecase>(
      () => _i231.SetDateDoneUsecase(gh<_i198.SupportTabRepo>()));
  gh.lazySingleton<_i232.SetReadyInstallUsecase>(
      () => _i232.SetReadyInstallUsecase(gh<_i198.SupportTabRepo>()));
  gh.lazySingleton<_i233.GetAllUsersUseCase>(
      () => _i233.GetAllUsersUseCase(gh<_i151.InvoicesSectionRepo>()));
  gh.lazySingleton<_i234.ClientsDebtsRepo>(
      () => _i235.ClientsDebtsRepoImpl(gh<_i50.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i236.PeriodicCommunicationRepo>(() =>
      _i237.PeriodicCommunicationRepoImpl(
          gh<_i43.PeriodicCommunicationDatasource>()));
  gh.factory<_i238.ImportantLinksRepo>(
      () => _i239.ImportantLinksRepoImpl(gh<_i72.ImportantLinksDatasource>()));
  gh.factory<_i240.CareActivitiesRepository>(
      () => _i241.CareListRepositoryImpl(gh<_i63.CareActivitiesDatasource>()));
  gh.factory<_i242.ExportClientsToExcelUseCase>(() =>
      _i242.ExportClientsToExcelUseCase(gh<_i70.ClientsListDatasource>()));
  gh.factory<_i243.UpdateViolationUseCase>(
      () => _i243.UpdateViolationUseCase(gh<_i104.ViolationsRepository>()));
  gh.lazySingleton<_i244.GetClientLogsUsecase>(
      () => _i244.GetClientLogsUsecase(gh<_i116.ClientLogsTabRepo>()));
  gh.lazySingleton<_i245.SupportClientsInvoicesRepo>(() =>
      _i246.SupportClientsInvoicesRepoImpl(
          gh<_i58.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i247.GetBranchesForUserUsecase>(
      () => _i247.GetBranchesForUserUsecase(gh<_i91.UsersRepository>()));
  gh.lazySingleton<_i248.GetLevelsForUserUsecase>(
      () => _i248.GetLevelsForUserUsecase(gh<_i91.UsersRepository>()));
  gh.lazySingleton<_i249.GetManagesForUserUsecase>(
      () => _i249.GetManagesForUserUsecase(gh<_i91.UsersRepository>()));
  gh.factory<_i250.GetUsersUsecase>(
      () => _i250.GetUsersUsecase(gh<_i91.UsersRepository>()));
  gh.factory<_i251.GetUserByIdUsecase>(
      () => _i251.GetUserByIdUsecase(gh<_i91.UsersRepository>()));
  gh.lazySingleton<_i252.GetSupportClientsInvoicesUseCase>(() =>
      _i252.GetSupportClientsInvoicesUseCase(
          gh<_i245.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i253.ManageWithdrawalsRepository>(() =>
      _i254.ManageWithdrawalsRepositoryImpl(
          gh<_i47.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i255.AgentsDistributorsRepo>(() =>
      _i256.AgentsDistributorsRepoImpl(
          gh<_i111.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i257.GetProductsSalesReportsUsecase>(() =>
      _i257.GetProductsSalesReportsUsecase(
          gh<_i158.ProductsSalesReportsRepo>()));
  gh.singleton<_i258.CitiesCubit>(
      () => _i258.CitiesCubit(gh<_i130.GetCitiesUseCase>()));
  gh.lazySingleton<_i259.GetNotUsingSystemUsecase>(
      () => _i259.GetNotUsingSystemUsecase(gh<_i38.NotUsingSystemRepo>()));
  gh.factory<_i260.CrudActivitiesRepository>(
      () => _i261.CrudActivitiesRepoImpl(gh<_i64.CrudActivitiesDatasource>()));
  gh.factory<_i262.UsersTypeCubit>(
      () => _i262.UsersTypeCubit(gh<_i122.GetUsersUsecase>()));
  gh.factory<_i263.ClientsListRepository>(
      () => _i264.ClientsListRepositoryImpl(gh<_i70.ClientsListDatasource>()));
  gh.factory<_i265.ClientsDatesRepository>(
      () => _i266.ClientsListRepositoryImpl(gh<_i67.ClientsDatesDatasource>()));
  gh.factory<_i267.AddClientContactUseCase>(() =>
      _i267.AddClientContactUseCase(gh<_i123.AddClientContactRepository>()));
  gh.factory<_i268.UpdateClientContactUseCase>(() =>
      _i268.UpdateClientContactUseCase(gh<_i123.AddClientContactRepository>()));
  gh.factory<_i269.AddParticipateCommentUsecase>(() =>
      _i269.AddParticipateCommentUsecase(
          gh<_i146.ParticipateListRepository>()));
  gh.factory<_i270.AddParticipateUserUsecase>(() =>
      _i270.AddParticipateUserUsecase(gh<_i146.ParticipateListRepository>()));
  gh.factory<_i271.EditParticipateUserUsecase>(() =>
      _i271.EditParticipateUserUsecase(gh<_i146.ParticipateListRepository>()));
  gh.factory<_i272.ParticipateClientListUsecase>(() =>
      _i272.ParticipateClientListUsecase(
          gh<_i146.ParticipateListRepository>()));
  gh.factory<_i273.ParticipateCommentListUsecase>(() =>
      _i273.ParticipateCommentListUsecase(
          gh<_i146.ParticipateListRepository>()));
  gh.factory<_i274.GetParticipateInvoiceByIdUsecase>(() =>
      _i274.GetParticipateInvoiceByIdUsecase(
          gh<_i146.ParticipateListRepository>()));
  gh.factory<_i275.ParticipateInvoiceListUsecase>(() =>
      _i275.ParticipateInvoiceListUsecase(
          gh<_i146.ParticipateListRepository>()));
  gh.factory<_i276.ParticipateListUsecase>(() =>
      _i276.ParticipateListUsecase(gh<_i146.ParticipateListRepository>()));
  gh.lazySingleton<_i277.ChangeParticipateStatusUsecase>(() =>
      _i277.ChangeParticipateStatusUsecase(
          gh<_i146.ParticipateListRepository>()));
  gh.factory<_i278.PendingInvoicesCubit>(
      () => _i278.PendingInvoicesCubit(gh<_i125.GetPendingInvoicesUsecase>()));
  gh.factory<_i279.EvaluationLevelReportCubit>(() =>
      _i279.EvaluationLevelReportCubit(
          gh<_i108.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i280.GetEmployeesSalesReportsUsecase>(() =>
      _i280.GetEmployeesSalesReportsUsecase(
          gh<_i142.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i281.GetGreetingCommunicationUseCase>(() =>
      _i281.GetGreetingCommunicationUseCase(
          gh<_i171.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i282.ClientsTransferApprovalsRepo>(() =>
      _i283.ClientsTransferApprovalsRepoImpl(
          gh<_i60.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i284.GetDeletedInvoicesUsecase>(
      () => _i284.GetDeletedInvoicesUsecase(gh<_i193.DeletedInvoicesRepo>()));
  gh.factory<_i285.ClientsContactsRepository>(() =>
      _i286.ClientsListRepositoryImpl(gh<_i69.ClientsContactsDatasource>()));
  gh.lazySingleton<_i287.GetClientsStatusReportsUsecase>(() =>
      _i287.GetClientsStatusReportsUsecase(
          gh<_i162.ClientsStatusReportsRepo>()));
  gh.factory<_i288.ActionLinkUsecase>(
      () => _i288.ActionLinkUsecase(gh<_i238.ImportantLinksRepo>()));
  gh.factory<_i289.GetImportantLinksUsecase>(
      () => _i289.GetImportantLinksUsecase(gh<_i238.ImportantLinksRepo>()));
  gh.lazySingleton<_i290.GetPreviousRatingsUsecase>(
      () => _i290.GetPreviousRatingsUsecase(gh<_i114.PreviousRatingsRepo>()));
  gh.lazySingleton<_i291.WaitingAgentsRepo>(
      () => _i292.WaitingAgentsRepoImpl(gh<_i154.WaitingAgentsDataSource>()));
  gh.factory<_i293.AddClientUserUsecase>(
      () => _i293.AddClientUserUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i294.ApproveRejectClientUsecase>(() =>
      _i294.ApproveRejectClientUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i295.ChangeClientCommunicationUseCase>(() =>
      _i295.ChangeClientCommunicationUseCase(
          gh<_i263.ClientsListRepository>()));
  gh.factory<_i296.ChangeTypeClientUsecase>(
      () => _i296.ChangeTypeClientUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i297.EditClientUserUsecase>(
      () => _i297.EditClientUserUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i298.GetClientsListByRegionUseCase>(() =>
      _i298.GetClientsListByRegionUseCase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i299.GetClientsListByUserUseCase>(() =>
      _i299.GetClientsListByUserUseCase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i300.GetClientsWithFilterUserUsecase>(() =>
      _i300.GetClientsWithFilterUserUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i301.GetClientMarketingReportUsecase>(() =>
      _i301.GetClientMarketingReportUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i302.GetRecommendedClientsUsecase>(() =>
      _i302.GetRecommendedClientsUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i303.GetSimilarClientsUsecase>(
      () => _i303.GetSimilarClientsUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i304.ReceiveClientUserUsecase>(
      () => _i304.ReceiveClientUserUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i305.StoreClientCommunicationUseCase>(() =>
      _i305.StoreClientCommunicationUseCase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i306.TransferClientUserUsecase>(
      () => _i306.TransferClientUserUsecase(gh<_i263.ClientsListRepository>()));
  gh.lazySingleton<_i307.GetHighSimilarClientsUsecase>(() =>
      _i307.GetHighSimilarClientsUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i308.EmployeesSalesReportsCubit>(() =>
      _i308.EmployeesSalesReportsCubit(
          gh<_i280.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i309.ChangeStateAgentUseCase>(
      () => _i309.ChangeStateAgentUseCase(gh<_i255.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i310.GetAgentsAndDistributorsUseCase>(() =>
      _i310.GetAgentsAndDistributorsUseCase(
          gh<_i255.AgentsDistributorsRepo>()));
  gh.factory<_i311.GetClientActivitiesUseCase>(() =>
      _i311.GetClientActivitiesUseCase(gh<_i139.ClientActivitiesRepository>()));
  gh.factory<_i312.ClientsAcceptCubit>(
      () => _i312.ClientsAcceptCubit(gh<_i205.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i313.CancelWithdrawalUsecase>(() =>
      _i313.CancelWithdrawalUsecase(gh<_i253.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i314.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i314.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i253.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i315.GetWithdrawalsInvoicesUsecase>(() =>
      _i315.GetWithdrawalsInvoicesUsecase(
          gh<_i253.ManageWithdrawalsRepository>()));
  gh.factory<_i316.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i316.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i253.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i317.ExceededClientsUseCase>(
      () => _i317.ExceededClientsUseCase(gh<_i101.ExceededClientsRepo>()));
  gh.lazySingleton<_i318.TransferExceededClientsUseCase>(() =>
      _i318.TransferExceededClientsUseCase(gh<_i101.ExceededClientsRepo>()));
  gh.factory<_i319.ParticipateListBloc>(() => _i319.ParticipateListBloc(
        gh<_i276.ParticipateListUsecase>(),
        gh<_i270.AddParticipateUserUsecase>(),
        gh<_i271.EditParticipateUserUsecase>(),
        gh<_i272.ParticipateClientListUsecase>(),
        gh<_i275.ParticipateInvoiceListUsecase>(),
        gh<_i274.GetParticipateInvoiceByIdUsecase>(),
        gh<_i273.ParticipateCommentListUsecase>(),
        gh<_i269.AddParticipateCommentUsecase>(),
        gh<_i277.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i320.LoginLocalDataSource>(() =>
      _i320.LoginLocalDataSourceImpl(
          gh<_i175.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i321.EditAdvancedConfigsUsecase>(() =>
      _i321.EditAdvancedConfigsUsecase(gh<_i144.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i322.GetAdvancedConfigsUsecase>(() =>
      _i322.GetAdvancedConfigsUsecase(gh<_i144.AdvancedConfigsRepository>()));
  gh.factory<_i323.ClientsInstallReportsCubit>(() =>
      _i323.ClientsInstallReportsCubit(
          gh<_i113.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i324.DatesTableRepo>(
      () => _i325.DatesTableRepoImpl(gh<_i166.DatesTableDataSource>()));
  gh.factory<_i326.GetVersionUseCase>(
      () => _i326.GetVersionUseCase(gh<_i186.AppRepository>()));
  gh.factory<_i327.AddTicketCubit>(
      () => _i327.AddTicketCubit(gh<_i131.AddTicketUseCase>()));
  gh.lazySingleton<_i328.LatestClientsUpdatesRepository>(() =>
      _i329.LatestClientsUpdatesRepositoryImpl(
          gh<_i148.LatestClientsUpdatesDatasource>()));
  gh.factory<_i330.TaskRepository>(
      () => _i331.TaskRepositoryImpl(gh<_i112.TaskDatasource>()));
  gh.lazySingleton<_i332.EditGeneralConfigsUsecase>(() =>
      _i332.EditGeneralConfigsUsecase(gh<_i206.GeneralConfigsRepository>()));
  gh.lazySingleton<_i333.GetGeneralConfigsUsecase>(() =>
      _i333.GetGeneralConfigsUsecase(gh<_i206.GeneralConfigsRepository>()));
  gh.factory<_i334.PeriodicCommunicationReportsCubit>(() =>
      _i334.PeriodicCommunicationReportsCubit(
          gh<_i211.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i335.GetAllClientsContactsUseCase>(() =>
      _i335.GetAllClientsContactsUseCase(
          gh<_i285.ClientsContactsRepository>()));
  gh.factory<_i336.InstallQualityCubit>(
      () => _i336.InstallQualityCubit(gh<_i216.GetInstallUseCase>()));
  gh.factory<_i337.ClientsContactsBloc>(() =>
      _i337.ClientsContactsBloc(gh<_i335.GetAllClientsContactsUseCase>()));
  gh.factory<_i338.ImportantLinksCubit>(() => _i338.ImportantLinksCubit(
        gh<_i289.GetImportantLinksUsecase>(),
        gh<_i288.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i339.AddAgentUseCase>(
      () => _i339.AddAgentUseCase(gh<_i190.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i340.UpdateAgentUseCase>(() =>
      _i340.UpdateAgentUseCase(gh<_i190.AgentsDistributorsActionsRepo>()));
  gh.factory<_i341.VersionsBloc>(() => _i341.VersionsBloc(
        gh<_i224.GetVersionsUsecase>(),
        gh<_i223.AddVersionsUsecase>(),
        gh<_i225.UpdateVersionsUsecase>(),
      ));
  gh.lazySingleton<_i342.GetDelayInstallReportsUseCase>(() =>
      _i342.GetDelayInstallReportsUseCase(gh<_i184.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i343.CrudAgentSupportFilesUsecase>(() =>
      _i343.CrudAgentSupportFilesUsecase(
          gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i344.GetClientsTransferApprovalsUsecase>(() =>
      _i344.GetClientsTransferApprovalsUsecase(
          gh<_i282.ClientsTransferApprovalsRepo>()));
  gh.factory<_i345.ClientsStatusReportsCubit>(() =>
      _i345.ClientsStatusReportsCubit(
          gh<_i287.GetClientsStatusReportsUsecase>()));
  gh.factory<_i346.ViolationsCubit>(() => _i346.ViolationsCubit(
        gh<_i218.GetViolationsUsecase>(),
        gh<_i243.UpdateViolationUseCase>(),
        gh<_i217.GetManagementsUsecase>(),
        gh<_i219.GetViolationsTypesUseCase>(),
      ));
  gh.factory<_i347.SupportTabCubit>(() => _i347.SupportTabCubit(
        gh<_i228.GetInvoiceByClientUsecase>(),
        gh<_i226.AddDateInstallUsecase>(),
        gh<_i231.SetDateDoneUsecase>(),
        gh<_i232.SetReadyInstallUsecase>(),
        gh<_i230.ReturnInvoiceApproveUsecase>(),
        gh<_i229.ReceiveDeviceUsecase>(),
        gh<_i227.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i348.ClientsDebtsReportsCubit>(() =>
      _i348.ClientsDebtsReportsCubit(
          gh<_i170.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i349.DeletedInvoicesCubit>(
      () => _i349.DeletedInvoicesCubit(gh<_i284.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i350.AddAgentDateUseCase>(() =>
      _i350.AddAgentDateUseCase(gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i351.GetManageWithdrawnInvoicesUsecase>(() =>
      _i351.GetManageWithdrawnInvoicesUsecase(
          gh<_i177.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i352.AddActivityCrudUseCase>(
      () => _i352.AddActivityCrudUseCase(gh<_i260.CrudActivitiesRepository>()));
  gh.factory<_i353.GetActivityTypesUseCase>(() =>
      _i353.GetActivityTypesUseCase(gh<_i260.CrudActivitiesRepository>()));
  gh.factory<_i354.GetCrudActivitiesUseCase>(() =>
      _i354.GetCrudActivitiesUseCase(gh<_i260.CrudActivitiesRepository>()));
  gh.factory<_i355.GetSubscribedClientsUseCase>(() =>
      _i355.GetSubscribedClientsUseCase(gh<_i260.CrudActivitiesRepository>()));
  gh.factory<_i356.UpdateActivityCrudUseCase>(() =>
      _i356.UpdateActivityCrudUseCase(gh<_i260.CrudActivitiesRepository>()));
  gh.factory<_i357.NotificationsCubit>(() => _i357.NotificationsCubit(
        gh<_i208.GetNotificationsUsecase>(),
        gh<_i210.MarkNotificationsAsReadUsecase>(),
        gh<_i209.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i358.WithdrawnInvoicesRepo>(() =>
      _i359.WithdrawnInvoicesRepoImpl(gh<_i150.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i360.RegionsRepository>(
      () => _i361.RegionsRepositoryImpl(gh<_i168.RegionsDatasource>()));
  gh.factory<_i362.ClientLogsTabCubit>(
      () => _i362.ClientLogsTabCubit(gh<_i244.GetClientLogsUsecase>()));
  gh.factory<_i363.RegionsSalesReportsCubit>(() =>
      _i363.RegionsSalesReportsCubit(
          gh<_i196.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i364.AddClientContactBloc>(() => _i364.AddClientContactBloc(
        gh<_i267.AddClientContactUseCase>(),
        gh<_i268.UpdateClientContactUseCase>(),
      ));
  gh.factory<_i365.AgentsDistributorsActionsCubit>(
      () => _i365.AgentsDistributorsActionsCubit(
            gh<_i130.GetCitiesUseCase>(),
            gh<_i339.AddAgentUseCase>(),
            gh<_i340.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i366.FetchPaginatedClientsUsecase>(() =>
      _i366.FetchPaginatedClientsUsecase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i367.FetchLinkClientsUseCase>(
      () => _i367.FetchLinkClientsUseCase(gh<_i263.ClientsListRepository>()));
  gh.factory<_i368.LinkSelectedClientsUseCase>(() =>
      _i368.LinkSelectedClientsUseCase(gh<_i263.ClientsListRepository>()));
  gh.lazySingleton<_i369.LoginRepo>(() => _i370.LoginRepoImpl(
        gh<_i141.LoginRemoteDataSource>(),
        gh<_i320.LoginLocalDataSource>(),
      ));
  gh.factory<_i371.SpecialClientsBloc>(
      () => _i371.SpecialClientsBloc(gh<_i200.GetSpecialClientsUsecase>()));
  gh.factory<_i372.AddCommentUsecase>(
      () => _i372.AddCommentUsecase(gh<_i213.CompanyRepository>()));
  gh.factory<_i373.GetCommentUsecase>(
      () => _i373.GetCommentUsecase(gh<_i213.CompanyRepository>()));
  gh.factory<_i374.DelayInstallReportsCubit>(() =>
      _i374.DelayInstallReportsCubit(
          gh<_i342.GetDelayInstallReportsUseCase>()));
  gh.factory<_i375.DatesTimelineBloc>(
      () => _i375.DatesTimelineBloc(gh<_i220.GetTimelineByEmployeeUseCase>()));
  gh.factory<_i376.GreetingCommunicationCubit>(() =>
      _i376.GreetingCommunicationCubit(
          gh<_i281.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i377.GetRegionsUseCase>(
      () => _i377.GetRegionsUseCase(gh<_i360.RegionsRepository>()));
  gh.lazySingleton<_i378.GetLatestClientsUseCase>(() =>
      _i378.GetLatestClientsUseCase(
          gh<_i328.LatestClientsUpdatesRepository>()));
  gh.factory<_i379.AdvancedCofigsCubit>(() => _i379.AdvancedCofigsCubit(
        gh<_i322.GetAdvancedConfigsUsecase>(),
        gh<_i321.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i380.SupportClientsInvoicesCubit>(() =>
      _i380.SupportClientsInvoicesCubit(
          gh<_i252.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i381.WrongNumbersCubit>(
      () => _i381.WrongNumbersCubit(gh<_i204.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i382.CacheTokenUsecase>(
      () => _i382.CacheTokenUsecase(gh<_i369.LoginRepo>()));
  gh.lazySingleton<_i383.GetTokenUsecase>(
      () => _i383.GetTokenUsecase(gh<_i369.LoginRepo>()));
  gh.lazySingleton<_i384.LoginUsecase>(
      () => _i384.LoginUsecase(gh<_i369.LoginRepo>()));
  gh.lazySingleton<_i385.ValidateTokenUsecase>(
      () => _i385.ValidateTokenUsecase(gh<_i369.LoginRepo>()));
  gh.lazySingleton<_i386.VerifyOtpUsecase>(
      () => _i386.VerifyOtpUsecase(gh<_i369.LoginRepo>()));
  gh.factory<_i387.ClientsTransferApprovalsCubit>(() =>
      _i387.ClientsTransferApprovalsCubit(
          gh<_i344.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i388.RegionsCubit>(
      () => _i388.RegionsCubit(gh<_i377.GetRegionsUseCase>()));
  gh.factory<_i389.GeneralCofigsCubit>(() => _i389.GeneralCofigsCubit(
        gh<_i333.GetGeneralConfigsUsecase>(),
        gh<_i332.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i390.GetPeriodicCommunicationUseCase>(() =>
      _i390.GetPeriodicCommunicationUseCase(
          gh<_i236.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i391.GetClientsDebtsUsecase>(
      () => _i391.GetClientsDebtsUsecase(gh<_i234.ClientsDebtsRepo>()));
  gh.lazySingleton<_i392.CrudClientSupportFilesUsecase>(() =>
      _i392.CrudClientSupportFilesUsecase(
          repository: gh<_i263.ClientsListRepository>()));
  gh.lazySingleton<_i393.GetClientSupportFilesUsecase>(() =>
      _i393.GetClientSupportFilesUsecase(
          repository: gh<_i263.ClientsListRepository>()));
  gh.factory<_i394.BranchesCubit>(
      () => _i394.BranchesCubit(gh<_i212.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i395.AddAgentCommentUsecase>(() =>
      _i395.AddAgentCommentUsecase(gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i396.DoneTrainingUsecase>(() =>
      _i396.DoneTrainingUsecase(gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i397.GetAgentByIdUsecase>(() =>
      _i397.GetAgentByIdUsecase(gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i398.GetAgentClientListUsecase>(() =>
      _i398.GetAgentClientListUsecase(
          gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i399.GetAgentCommentsListUsecase>(() =>
      _i399.GetAgentCommentsListUsecase(
          gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i400.GetAgentDatesListUsecase>(() =>
      _i400.GetAgentDatesListUsecase(
          gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i401.GetAgentInvoiceListUsecase>(() =>
      _i401.GetAgentInvoiceListUsecase(
          gh<_i221.AgentsDistributorsProfileRepo>()));
  gh.factory<_i402.AddRejectReasonsUsecase>(() =>
      _i402.AddRejectReasonsUsecase(gh<_i253.ManageWithdrawalsRepository>()));
  gh.factory<_i403.EditRejectReasonsUsecase>(() =>
      _i403.EditRejectReasonsUsecase(gh<_i253.ManageWithdrawalsRepository>()));
  gh.factory<_i404.GetRejectReasonsUsecase>(() =>
      _i404.GetRejectReasonsUsecase(gh<_i253.ManageWithdrawalsRepository>()));
  gh.factory<_i405.GetUserSeriesUsecase>(() =>
      _i405.GetUserSeriesUsecase(gh<_i253.ManageWithdrawalsRepository>()));
  gh.factory<_i406.GetWithdrawnDetailsUsecase>(() =>
      _i406.GetWithdrawnDetailsUsecase(
          gh<_i253.ManageWithdrawalsRepository>()));
  gh.factory<_i407.SetApproveSeriesUsecase>(() =>
      _i407.SetApproveSeriesUsecase(gh<_i253.ManageWithdrawalsRepository>()));
  gh.factory<_i408.UpdateSeriesUsecase>(
      () => _i408.UpdateSeriesUsecase(gh<_i253.ManageWithdrawalsRepository>()));
  gh.factory<_i409.NotUsingSystemCubit>(
      () => _i409.NotUsingSystemCubit(gh<_i259.GetNotUsingSystemUsecase>()));
  gh.singleton<_i410.AppManagerCubit>(
      () => _i410.AppManagerCubit(gh<_i326.GetVersionUseCase>()));
  gh.factory<_i411.GetAllClientsDatesUseCase>(() =>
      _i411.GetAllClientsDatesUseCase(gh<_i265.ClientsDatesRepository>()));
  gh.factory<_i412.GetAllCareActivitiesUseCase>(() =>
      _i412.GetAllCareActivitiesUseCase(gh<_i240.CareActivitiesRepository>()));
  gh.factory<_i413.UpdateCareActivityUseCase>(() =>
      _i413.UpdateCareActivityUseCase(gh<_i240.CareActivitiesRepository>()));
  gh.lazySingleton<_i414.GetWaitingAgentsUsecase>(
      () => _i414.GetWaitingAgentsUsecase(gh<_i291.WaitingAgentsRepo>()));
  gh.factory<_i415.ClientActivitiesBloc>(
      () => _i415.ClientActivitiesBloc(gh<_i311.GetClientActivitiesUseCase>()));
  gh.factory<_i416.InvoicesSectionCubit>(() => _i416.InvoicesSectionCubit(
        gh<_i202.GetInvoicesByPrivilegesUsecase>(),
        gh<_i310.GetAgentsAndDistributorsUseCase>(),
        gh<_i276.ParticipateListUsecase>(),
        gh<_i233.GetAllUsersUseCase>(),
        gh<_i203.GetInvoiceByIdUsecase>(),
        gh<_i201.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i417.ProductsSalesReportsCubit>(() =>
      _i417.ProductsSalesReportsCubit(
          gh<_i257.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i418.GetWithdrawnInvoicesUsecase>(() =>
      _i418.GetWithdrawnInvoicesUsecase(gh<_i358.WithdrawnInvoicesRepo>()));
  gh.factory<_i419.PreviousRatingsCubit>(
      () => _i419.PreviousRatingsCubit(gh<_i290.GetPreviousRatingsUsecase>()));
  gh.factory<_i420.CareActivitiesBloc>(() => _i420.CareActivitiesBloc(
        gh<_i412.GetAllCareActivitiesUseCase>(),
        gh<_i413.UpdateCareActivityUseCase>(),
      ));
  gh.factory<_i421.AgentsDistributorsCubit>(() => _i421.AgentsDistributorsCubit(
        gh<_i310.GetAgentsAndDistributorsUseCase>(),
        gh<_i309.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i422.ExceededClientsCubit>(() => _i422.ExceededClientsCubit(
        gh<_i317.ExceededClientsUseCase>(),
        gh<_i318.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i423.ClientsListBloc>(() => _i423.ClientsListBloc(
        gh<_i300.GetClientsWithFilterUserUsecase>(),
        gh<_i302.GetRecommendedClientsUsecase>(),
        gh<_i303.GetSimilarClientsUsecase>(),
        gh<_i293.AddClientUserUsecase>(),
        gh<_i297.EditClientUserUsecase>(),
        gh<_i296.ChangeTypeClientUsecase>(),
        gh<_i295.ChangeClientCommunicationUseCase>(),
        gh<_i305.StoreClientCommunicationUseCase>(),
        gh<_i294.ApproveRejectClientUsecase>(),
        gh<_i392.CrudClientSupportFilesUsecase>(),
        gh<_i393.GetClientSupportFilesUsecase>(),
        gh<_i306.TransferClientUserUsecase>(),
        gh<_i304.ReceiveClientUserUsecase>(),
        gh<_i301.GetClientMarketingReportUsecase>(),
        gh<_i307.GetHighSimilarClientsUsecase>(),
        gh<_i367.FetchLinkClientsUseCase>(),
        gh<_i366.FetchPaginatedClientsUsecase>(),
        gh<_i368.LinkSelectedClientsUseCase>(),
        gh<_i242.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i424.ManageWithdrawalsCubit>(() => _i424.ManageWithdrawalsCubit(
        gh<_i405.GetUserSeriesUsecase>(),
        gh<_i408.UpdateSeriesUsecase>(),
        gh<_i250.GetUsersUsecase>(),
        gh<_i315.GetWithdrawalsInvoicesUsecase>(),
        gh<_i316.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i407.SetApproveSeriesUsecase>(),
        gh<_i406.GetWithdrawnDetailsUsecase>(),
        gh<_i402.AddRejectReasonsUsecase>(),
        gh<_i404.GetRejectReasonsUsecase>(),
        gh<_i403.EditRejectReasonsUsecase>(),
        gh<_i314.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i313.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i425.ManageWithdrawnInvoicesCubit>(() =>
      _i425.ManageWithdrawnInvoicesCubit(
          gh<_i351.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i426.LatestClientsUpdatesCubit>(() =>
      _i426.LatestClientsUpdatesCubit(gh<_i378.GetLatestClientsUseCase>()));
  gh.factory<_i427.AttachmentsRowCubit>(() => _i427.AttachmentsRowCubit(
        gh<_i393.GetClientSupportFilesUsecase>(),
        gh<_i392.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i428.CancelScheduleUsecase>(
      () => _i428.CancelScheduleUsecase(gh<_i324.DatesTableRepo>()));
  gh.lazySingleton<_i429.ChangeDateToDonUsecase>(
      () => _i429.ChangeDateToDonUsecase(gh<_i324.DatesTableRepo>()));
  gh.lazySingleton<_i430.GetCancelReasonsUsecase>(
      () => _i430.GetCancelReasonsUsecase(gh<_i324.DatesTableRepo>()));
  gh.lazySingleton<_i431.GetDateInstallationUsecase>(
      () => _i431.GetDateInstallationUsecase(gh<_i324.DatesTableRepo>()));
  gh.lazySingleton<_i432.GetInvoicesByClientForDateUsecase>(() =>
      _i432.GetInvoicesByClientForDateUsecase(gh<_i324.DatesTableRepo>()));
  gh.lazySingleton<_i433.GetSubscribedClientsUsecase>(
      () => _i433.GetSubscribedClientsUsecase(gh<_i324.DatesTableRepo>()));
  gh.lazySingleton<_i434.RescheduleDateUsecase>(
      () => _i434.RescheduleDateUsecase(gh<_i324.DatesTableRepo>()));
  gh.lazySingleton<_i435.ReturnScheduleVisitToOpenUsecase>(
      () => _i435.ReturnScheduleVisitToOpenUsecase(gh<_i324.DatesTableRepo>()));
  gh.factory<_i436.AddTaskUsecase>(
      () => _i436.AddTaskUsecase(gh<_i330.TaskRepository>()));
  gh.factory<_i437.ChangeStatusTaskUsecase>(
      () => _i437.ChangeStatusTaskUsecase(gh<_i330.TaskRepository>()));
  gh.factory<_i438.GetTasksUsecase>(
      () => _i438.GetTasksUsecase(gh<_i330.TaskRepository>()));
  gh.factory<_i439.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i439.GetUsersByDepartmentAndRegionUsecase(gh<_i330.TaskRepository>()));
  gh.factory<_i440.CrudActivitiesBloc>(() => _i440.CrudActivitiesBloc(
        gh<_i354.GetCrudActivitiesUseCase>(),
        gh<_i356.UpdateActivityCrudUseCase>(),
        gh<_i352.AddActivityCrudUseCase>(),
        gh<_i353.GetActivityTypesUseCase>(),
        gh<_i355.GetSubscribedClientsUseCase>(),
      ));
  gh.lazySingleton<_i441.TaskCubit>(() => _i441.TaskCubit(
        gh<_i436.AddTaskUsecase>(),
        gh<_i438.GetTasksUsecase>(),
        gh<_i437.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i442.UsersCubit>(() => _i442.UsersCubit(
        gh<_i250.GetUsersUsecase>(),
        gh<_i251.GetUserByIdUsecase>(),
        gh<_i103.ActionUserUsecase>(),
        gh<_i439.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i249.GetManagesForUserUsecase>(),
        gh<_i248.GetLevelsForUserUsecase>(),
        gh<_i247.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i443.CompanyCubit>(() => _i443.CompanyCubit(
        gh<_i373.GetCommentUsecase>(),
        gh<_i372.AddCommentUsecase>(),
      ));
  gh.factory<_i444.ClientsDebtsCubit>(
      () => _i444.ClientsDebtsCubit(gh<_i391.GetClientsDebtsUsecase>()));
  gh.factory<_i445.PeriodicCommunicationCubit>(() =>
      _i445.PeriodicCommunicationCubit(
          gh<_i390.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i446.LoginCubit>(() => _i446.LoginCubit(
        gh<_i384.LoginUsecase>(),
        gh<_i386.VerifyOtpUsecase>(),
        gh<_i382.CacheTokenUsecase>(),
        gh<_i383.GetTokenUsecase>(),
        gh<_i385.ValidateTokenUsecase>(),
      ));
  gh.factory<_i447.AgentsDistributorsProfileBloc>(
      () => _i447.AgentsDistributorsProfileBloc(
            gh<_i397.GetAgentByIdUsecase>(),
            gh<_i398.GetAgentClientListUsecase>(),
            gh<_i401.GetAgentInvoiceListUsecase>(),
            gh<_i274.GetParticipateInvoiceByIdUsecase>(),
            gh<_i399.GetAgentCommentsListUsecase>(),
            gh<_i395.AddAgentCommentUsecase>(),
            gh<_i396.DoneTrainingUsecase>(),
            gh<_i350.AddAgentDateUseCase>(),
            gh<_i400.GetAgentDatesListUsecase>(),
            gh<_i343.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i448.DatesTableCubit>(() => _i448.DatesTableCubit(
        gh<_i431.GetDateInstallationUsecase>(),
        gh<_i434.RescheduleDateUsecase>(),
        gh<_i429.ChangeDateToDonUsecase>(),
        gh<_i428.CancelScheduleUsecase>(),
        gh<_i435.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i433.GetSubscribedClientsUsecase>(),
        gh<_i432.GetInvoicesByClientForDateUsecase>(),
        gh<_i226.AddDateInstallUsecase>(),
        gh<_i430.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i449.ClientsDatesCubit>(
      () => _i449.ClientsDatesCubit(gh<_i411.GetAllClientsDatesUseCase>()));
  gh.factory<_i450.WithdrawnInvoicesCubit>(() =>
      _i450.WithdrawnInvoicesCubit(gh<_i418.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i451.WaitingAgentsCubit>(
      () => _i451.WaitingAgentsCubit(gh<_i414.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i452.AppModule {}
