// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:location/location.dart' as _i645;
import 'package:logger/logger.dart' as _i974;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../../api/api.dart' as _i1065;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i293;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i86;
import '../../../features/app/domain/repositories/app_repository.dart' as _i191;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i631;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i480;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i1;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i525;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i897;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i325;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i220;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i882;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i772;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i518;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i959;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i953;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i406;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i993;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i551;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i26;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i406;
import '../../../features/clients_care/client_communications/data/data_sources/care_activities_datasource.dart'
    as _i809;
import '../../../features/clients_care/client_communications/data/repositories/care_activities_repo_impl.dart'
    as _i566;
import '../../../features/clients_care/client_communications/domain/repositories/care_activities_repo.dart'
    as _i552;
import '../../../features/clients_care/client_communications/domain/use_cases/get_all_care_activities_usecase.dart'
    as _i335;
import '../../../features/clients_care/client_communications/domain/use_cases/update_care_activity_usecase.dart'
    as _i70;
import '../../../features/clients_care/client_communications/presentation/manager/care_activities_bloc.dart'
    as _i485;
import '../../../features/clients_care/clients_attachments/data/data_sources/clients_attachments_datasource.dart'
    as _i987;
import '../../../features/clients_care/clients_attachments/data/repositories/clients_attachments_repo_impl.dart'
    as _i331;
import '../../../features/clients_care/clients_attachments/domain/repositories/clients_attachments_repo.dart'
    as _i760;
import '../../../features/clients_care/clients_attachments/domain/use_cases/get_all_client_usecase.dart'
    as _i797;
import '../../../features/clients_care/clients_attachments/domain/use_cases/get_attachments_usecase.dart'
    as _i12;
import '../../../features/clients_care/clients_attachments/presentation/manager/client_attachments_bloc.dart'
    as _i412;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i517;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i816;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i361;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i828;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i185;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i627;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i204;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i547;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i40;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i866;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i56;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i197;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i937;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i1036;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i364;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i417;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i324;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i869;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i1013;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i320;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i340;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i671;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i277;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i833;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i23;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i53;
import '../../../features/clients_care/crud_activites/data/data_sources/crud_activities_datasource.dart'
    as _i734;
import '../../../features/clients_care/crud_activites/data/repositories/crud_activities_repo_impl.dart'
    as _i44;
import '../../../features/clients_care/crud_activites/domain/repositories/crud_activities_repo.dart'
    as _i592;
import '../../../features/clients_care/crud_activites/domain/use_cases/add_activity_crud_usecase.dart'
    as _i865;
import '../../../features/clients_care/crud_activites/domain/use_cases/get_activity_types_usecase.dart'
    as _i327;
import '../../../features/clients_care/crud_activites/domain/use_cases/get_crud_activities_usecase.dart'
    as _i75;
import '../../../features/clients_care/crud_activites/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i947;
import '../../../features/clients_care/crud_activites/domain/use_cases/update_activity_crud_usecase.dart'
    as _i245;
import '../../../features/clients_care/crud_activites/presentation/manager/crud_activities_bloc.dart'
    as _i943;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i946;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i412;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i1035;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i418;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i156;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i52;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i778;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i768;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i478;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i692;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i943;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i159;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i454;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i257;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i437;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i821;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i838;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i931;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i313;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i412;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i181;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i711;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i966;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i566;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i705;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i265;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i389;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i412;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i710;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i999;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i11;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i371;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i652;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i70;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i222;
import '../../../features/clients_care/violations_clienta_care/data/data_sources/violations_clients_care_datasource.dart'
    as _i823;
import '../../../features/clients_care/violations_clienta_care/data/repositories/violations_repository_impl.dart'
    as _i245;
import '../../../features/clients_care/violations_clienta_care/domain/repositories/violations_repository.dart'
    as _i495;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_all_management_usecase.dart'
    as _i116;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_violation_types_usecase.dart'
    as _i797;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/get_violations_usecase.dart'
    as _i591;
import '../../../features/clients_care/violations_clienta_care/domain/use_cases/update_violadtion_usecase.dart'
    as _i97;
import '../../../features/clients_care/violations_clienta_care/presentation/manager/violations_cubit.dart'
    as _i54;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i47;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i820;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i87;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i732;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i648;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i453;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i450;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i13;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i153;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i1000;
import '../../../features/common/client_profile/client_activities_tab/data/data_sources/client_activities_datasource.dart'
    as _i55;
import '../../../features/common/client_profile/client_activities_tab/data/repositories/client_activities_repo_impl.dart'
    as _i623;
import '../../../features/common/client_profile/client_activities_tab/domain/repositories/client_activities_repo.dart'
    as _i307;
import '../../../features/common/client_profile/client_activities_tab/domain/use_cases/get_client_activities_usecase.dart'
    as _i618;
import '../../../features/common/client_profile/client_activities_tab/presentation/manager/client_activities_bloc.dart'
    as _i1003;
import '../../../features/common/client_profile/client_dates_tab/data/data_sources/client_dates_datasource.dart'
    as _i274;
import '../../../features/common/client_profile/client_dates_tab/data/repositories/clients_dates_repo_impl.dart'
    as _i7;
import '../../../features/common/client_profile/client_dates_tab/domain/repositories/clients_dates_repo.dart'
    as _i290;
import '../../../features/common/client_profile/client_dates_tab/domain/use_cases/get_all_clients_dates_usecase.dart'
    as _i555;
import '../../../features/common/client_profile/client_dates_tab/presentation/manager/clients_dates_cubit.dart'
    as _i225;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i40;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i313;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i566;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i80;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i697;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i532;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i527;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i843;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i888;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i417;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i801;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i376;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i123;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i1045;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i896;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i565;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i134;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i138;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i1041;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i867;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i767;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i330;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i997;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i620;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i976;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i144;
import '../../../features/home/presentation/manager/web_home_page_cubit.dart'
    as _i756;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i929;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i597;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i241;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i1049;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i884;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i927;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i576;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i188;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i5;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i608;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i4;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i765;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i425;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i180;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i1013;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i13;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i298;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i296;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i998;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i247;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i805;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i203;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i949;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i985;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i64;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i228;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i586;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i1001;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i62;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i1026;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i944;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i653;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i18;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i301;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i1031;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i665;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i745;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i233;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i344;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i95;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i179;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i500;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i134;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i493;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i883;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i289;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i646;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i898;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i618;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i530;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i119;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i841;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i620;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i625;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i250;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i0;
import '../../../features/sales/clients/add_client_contact/data/data_sources/add_client_contact_datasource.dart'
    as _i316;
import '../../../features/sales/clients/add_client_contact/data/repositories/add_client_contact_repo_impl.dart'
    as _i741;
import '../../../features/sales/clients/add_client_contact/domain/repositories/add_client_contact_repo.dart'
    as _i425;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/add_client_contact_usecase.dart'
    as _i943;
import '../../../features/sales/clients/add_client_contact/domain/use_cases/update_client_contact_usecase.dart'
    as _i738;
import '../../../features/sales/clients/add_client_contact/presentation/manager/add_client_contact_bloc.dart'
    as _i289;
import '../../../features/sales/clients/clients_contacts/data/data_sources/client_contact_datasource.dart'
    as _i743;
import '../../../features/sales/clients/clients_contacts/data/repositories/clients_contacts_repo_impl.dart'
    as _i1007;
import '../../../features/sales/clients/clients_contacts/domain/repositories/clients_contacts_repo.dart'
    as _i20;
import '../../../features/sales/clients/clients_contacts/domain/use_cases/get_all_clients_contacts_usecase.dart'
    as _i701;
import '../../../features/sales/clients/clients_contacts/presentation/manager/clients_contacts_bloc.dart'
    as _i82;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i785;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i652;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i228;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i699;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i566;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i186;
import '../../../features/sales/clients/clients_list/data/datasources/link_client_datasource.dart'
    as _i357;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i862;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i952;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i824;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i34;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_client_communication_usecase.dart'
    as _i688;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i137;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i588;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i190;
import '../../../features/sales/clients/clients_list/domain/use_cases/export_clients_to_excel_usecase.dart'
    as _i944;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_link_usecase.dart'
    as _i400;
import '../../../features/sales/clients/clients_list/domain/use_cases/fetch_paginated_clients_usecase.dart'
    as _i314;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i999;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i218;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i370;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i446;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i574;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i467;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i143;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i1047;
import '../../../features/sales/clients/clients_list/domain/use_cases/link_selected_client_usecase.dart'
    as _i987;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i679;
import '../../../features/sales/clients/clients_list/domain/use_cases/store_client_communication_usecase.dart'
    as _i592;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i912;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i631;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i923;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i913;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i1067;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i753;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i207;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i694;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i928;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i972;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i513;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i1046;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i649;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i608;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i88;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i189;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i767;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i1057;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i1040;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i932;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i330;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i21;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i139;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i53;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i398;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i520;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i521;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i815;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i1028;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i660;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i151;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i225;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i398;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i87;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i372;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i25;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i937;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i824;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i473;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i570;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i689;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i887;
import '../../../features/sales/invoices_list/domain/use_cases/export_invoices_to_excel_usecase.dart'
    as _i568;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i780;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i825;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i351;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i401;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i701;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i38;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i264;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i707;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i938;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i113;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i180;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i378;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i368;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i226;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i280;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i866;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i834;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i400;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i989;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i1037;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i19;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i982;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i207;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i491;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i854;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i805;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i104;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i405;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i1010;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i1046;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i191;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i457;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i1049;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i825;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i674;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i654;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i1013;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i680;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i174;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i554;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i58;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i476;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i291;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i502;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i393;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i968;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i62;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i278;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i1055;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i905;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i387;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i501;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i1;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i778;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i297;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i401;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i729;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i653;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i830;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i587;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i456;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i897;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i123;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i758;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i935;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i282;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i286;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i813;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i810;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i550;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i821;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i681;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i959;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i769;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i910;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i851;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i235;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i238;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i746;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i209;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i819;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i45;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i867;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i1070;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i970;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i85;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i246;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i625;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i61;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i803;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i798;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i989;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i438;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i735;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i824;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i883;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i307;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i546;
import '../../../features/support/dates_timeline/data/data_sources/dates_timeline_datasource.dart'
    as _i1036;
import '../../../features/support/dates_timeline/data/respositories_impl/dates_timeline_repo_impl.dart'
    as _i102;
import '../../../features/support/dates_timeline/domain/respositories/dates_timline_repo.dart'
    as _i372;
import '../../../features/support/dates_timeline/domain/use_cases/get_timeline_by_employee_usecase.dart'
    as _i512;
import '../../../features/support/dates_timeline/presentation/manager/dates_timeline_bloc.dart'
    as _i593;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i79;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i14;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i618;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i1008;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i676;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i1068;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i545;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i503;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i767;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i583;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i1006;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i482;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i1038;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i453;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i99;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i880;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i635;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i794;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i992;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i951;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i218;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i507;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i887;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i941;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i349;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i483;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i385;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i956;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i111;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i831;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i439;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i526;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i855;
import '../../../features/versions/data/data_sources/versions_datasource.dart'
    as _i309;
import '../../../features/versions/data/repositories/versions_repo_impl.dart'
    as _i97;
import '../../../features/versions/domain/repositories/versions_repo.dart'
    as _i862;
import '../../../features/versions/domain/use_cases/add_version_usecase.dart'
    as _i148;
import '../../../features/versions/domain/use_cases/get_versions_usecase.dart'
    as _i551;
import '../../../features/versions/domain/use_cases/update_version_usecase.dart'
    as _i124;
import '../../../features/versions/presentation/manager/versions_bloc.dart'
    as _i377;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i970;
import '../api/api_services.dart' as _i124;
import '../api/dio/dio_services.dart' as _i96;
import '../cache_services/cache_services.dart' as _i74;
import '../cache_services/prefs_consumer.dart' as _i818;
import '../cache_services/secure_storage_consumer.dart' as _i178;
import '../maps/location_services.dart' as _i604;
import 'di_container.dart' as _i198;

const String _dev = 'dev';
const String _test = 'test';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  gh.factory<_i756.WebHomePageCubit>(() => _i756.WebHomePageCubit());
  gh.singleton<_i974.Logger>(() => appModule.logger);
  gh.singleton<_i361.Dio>(() => appModule.dio);
  gh.lazySingleton<_i1065.Api>(() => _i1065.Api());
  gh.lazySingleton<_i645.Location>(() => appModule.location);
  gh.singleton<_i124.ApiServices>(() => _i96.DioServices(gh<_i361.Dio>()));
  gh.lazySingleton<_i1006.SupportClientsAcceptDatasource>(
      () => _i1006.SupportClientsAcceptDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i946.EvaluationLevelReportDatasource>(
      () => _i946.EvaluationLevelReportDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i79.DelayAfterInstallDatasource>(
      () => _i79.DelayAfterInstallDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i1057.PendingInvoicesDatasource>(
      () => _i1057.PendingInvoicesDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i998.PrivilegesDatasource>(
      () => _i998.PrivilegesDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i530.NotificationsDatasource>(
      () => _i530.NotificationsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i286.ProductsSalesReportsDatasource>(
      () => _i286.ProductsSalesReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i823.ViolationsClientsCareDatasource>(
      () => _i823.ViolationsClientsCareDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i425.LevelsDatasource>(
      () => _i425.LevelsDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i52.GreetingCommunicationDatasource>(
      () => _i52.GreetingCommunicationDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i113.AgentsDistributorsActionsDataSource>(() =>
      _i113.AgentsDistributorsActionsDataSourceImpl(gh<_i124.ApiServices>()));
  gh.singletonAsync<_i460.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i558.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i45.ClientsInstallReportsDatasource>(
      () => _i45.ClientsInstallReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i681.RegionsSalesReportsDatasource>(
      () => _i681.RegionsSalesReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i501.ClientsDebtsReportsDatasource>(
      () => _i501.ClientsDebtsReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i627.NotUsingSystemDatasource>(
      () => _i627.NotUsingSystemDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i265.PreviousRatingsDatasource>(
      () => _i265.PreviousRatingsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i671.WrongNumbersDatasource>(
      () => _i671.WrongNumbersDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i517.ClientsCareReportsDatasource>(
      () => _i517.ClientsCareReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i841.NotificationsRepo>(
      () => _i119.NotificationsRepoImpl(gh<_i530.NotificationsDatasource>()));
  gh.lazySingleton<_i406.ClientsAcceptDatasource>(
      () => _i406.ClientsAcceptDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i729.ClientsStatusReportsDatasource>(
      () => _i729.ClientsStatusReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i181.PeriodicCommunicationReportsDatasource>(() =>
      _i181.PeriodicCommunicationReportsDatasourceImpl(
          gh<_i124.ApiServices>()));
  gh.lazySingleton<_i1068.DelayInstallReportsDatasource>(
      () => _i1068.DelayInstallReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.factory<_i357.LinkClientApiService>(
      () => _i357.LinkClientApiService(gh<_i361.Dio>()));
  gh.lazySingleton<_i309.NotificationsDatasource>(
      () => _i309.NotificationsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i547.NotUsingSystemRepo>(
      () => _i204.NotUsingSystemRepoImpl(gh<_i627.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i833.WrongNumbersRepo>(
      () => _i277.WrongNumbersRepoImpl(gh<_i671.WrongNumbersDatasource>()));
  gh.lazySingleton<_i58.ParticipatesListDatasource>(
      () => _i58.ParticipatesListDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i821.PeriodicCommunicationDatasource>(
      () => _i821.PeriodicCommunicationDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i897.EmployeesSalesReportsDatasource>(
      () => _i897.EmployeesSalesReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i966.PeriodicCommunicationReportsRepo>(() =>
      _i711.PeriodicCommunicationReportsRepoImpl(
          gh<_i181.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i1031.ManageWithdrawalsDatasource>(
      () => _i1031.ManageWithdrawalsDatasource(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i551.ClientsAcceptRepository>(() =>
      _i993.ClientsAcceptRepositoryImpl(gh<_i406.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i785.ClientsDebtsDatasource>(
      () => _i785.ClientsDebtsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i694.FinancePendingDatasource>(
      () => _i694.FinancePendingDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i1035.EvaluationLevelReportRepo>(() =>
      _i412.EvaluationLevelReportRepoImpl(
          gh<_i946.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i943.InstallQualityDatasource>(
      () => _i943.InstallQualityDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i1013.LevelsRepo>(
      () => _i180.LevelsRepoImpl(gh<_i425.LevelsDatasource>()));
  gh.lazySingleton<_i56.TicketsDataSource>(
      () => _i56.TicketsDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i880.SupportClientsInvoicesDatasource>(
      () => _i880.DelayInstallReportsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i64.UsersDatasource>(
      () => _i64.UsersDatasourceImpl(gh<_i124.ApiServices>()));
  gh.singletonAsync<_i460.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i558.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i923.ClientsTransferApprovalsDatasource>(() =>
      _i923.ClientsTransferApprovalsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i87.ExceededClientsDatasource>(
      () => _i87.ExceededClientsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.factory<_i293.AppDatasource>(
      () => _i293.AppDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i987.ClientAttachmentsDatasource>(
      () => _i987.ClientAttachmentsDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i809.CareActivitiesDatasource>(
      () => _i809.CareActivitiesDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i734.CrudActivitiesDatasource>(
      () => _i734.CrudActivitiesDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i11.SpecialClientsDatasource>(
      () => _i11.SpecialClientsDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i55.ClientActivitiesDatasource>(
      () => _i55.ClientActivitiesDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i274.ClientsDatesDatasource>(
      () => _i274.ClientsDatesDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i316.AddClientsContactsDatasource>(
      () => _i316.AddClientsContactsDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i743.ClientsContactsDatasource>(
      () => _i743.ClientsContactsDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i186.ClientsListDatasource>(
      () => _i186.ClientsListDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i139.CommentCompanyDatasource>(
      () => _i139.CommentCompanyDatasource(gh<_i124.ApiServices>()));
  gh.factory<_i674.ImportantLinksDatasource>(
      () => _i674.ImportantLinksDatasource(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i330.UsersDatasource>(
      () => _i330.UsersDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i453.CitiesDatasource>(
      () => _i453.CitiesDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i929.AdvancedConfigsDatasource>(
      () => _i929.AdvancedConfigsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i937.TicketsRepo>(
      () => _i197.TicketsRepoImpl(gh<_i56.TicketsDataSource>()));
  gh.lazySingleton<_i769.RegionsSalesReportsRepo>(() =>
      _i959.RegionsSalesReportsRepoImpl(
          gh<_i681.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i40.ClientLogsTabDataSource>(
      () => _i40.SupportTabDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i1036.DatesTimelineDatasource>(
      () => _i1036.DatesTimelineDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i778.ClientsDebtsReportsRepo>(() =>
      _i1.ClientsDebtsReportsRepoImpl(
          gh<_i501.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i1038.SupportClientsAcceptRepository>(() =>
      _i482.SupportClientsAcceptRepositoryImpl(
          gh<_i1006.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i618.DelayAfterInstallRepo>(() =>
      _i14.DelayAfterInstallRepoImpl(gh<_i79.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i453.GetSupportClientsAcceptUseCase>(() =>
      _i453.GetSupportClientsAcceptUseCase(
          gh<_i1038.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i620.UsersRepository>(
      () => _i997.UsersRepositoryImpl(gh<_i330.UsersDatasource>()));
  gh.lazySingleton<_i586.UsersRepository>(
      () => _i228.UsersRepositoryImpl(gh<_i64.UsersDatasource>()));
  gh.lazySingleton<_i576.GeneralConfigsDatasource>(
      () => _i576.GeneralConfigsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i972.FinancePendingRepo>(
      () => _i928.FinancePendingRepoImpl(gh<_i694.FinancePendingDatasource>()));
  gh.lazySingleton<_i932.PendingInvoicesRepo>(() =>
      _i1040.PendingInvoicesRepoImpl(gh<_i1057.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i47.BranchesDatasource>(
      () => _i47.BranchesDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i361.ClientsCareReportsRepo>(() =>
      _i816.ClientsCareReportsRepoImpl(
          gh<_i517.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i25.ExceededClientsRepo>(() =>
      _i372.ExceededClientsRepoImpl(gh<_i87.ExceededClientsDatasource>()));
  gh.factory<_i1001.ActionUserUsecase>(
      () => _i1001.ActionUserUsecase(gh<_i586.UsersRepository>()));
  gh.lazySingleton<_i495.ViolationsRepository>(() =>
      _i245.ViolationsRepositoryImpl(
          gh<_i823.ViolationsClientsCareDatasource>()));
  gh.lazySingleton<_i87.BranchesRepository>(
      () => _i820.BranchesRepositoryImpl(gh<_i47.BranchesDatasource>()));
  gh.lazySingleton<_i418.GetEvaluationLevelReportUsecase>(() =>
      _i418.GetEvaluationLevelReportUsecase(
          gh<_i1035.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i1070.ClientsInstallReportsRepo>(() =>
      _i867.ClientsInstallReportsRepoImpl(
          gh<_i45.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i180.AgentsDistributorsDataSource>(
      () => _i180.AgentsDistributorsDataSourceImpl(gh<_i124.ApiServices>()));
  gh.factory<_i483.TaskDatasource>(
      () => _i483.TaskDatasource(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i970.GetClientsInstallReportsUsecase>(() =>
      _i970.GetClientsInstallReportsUsecase(
          gh<_i1070.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i412.PreviousRatingsRepo>(() =>
      _i389.PreviousRatingsRepoImpl(gh<_i265.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i566.ClientLogsTabRepo>(
      () => _i313.ClientLogsTabRepoImpl(gh<_i40.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i1028.DeletedInvoicesDatasource>(
      () => _i1028.DeletedInvoicesDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i13.AddLevelUsecase>(
      () => _i13.AddLevelUsecase(gh<_i1013.LevelsRepo>()));
  gh.lazySingleton<_i298.GetLevelsUsecase>(
      () => _i298.GetLevelsUsecase(gh<_i1013.LevelsRepo>()));
  gh.lazySingleton<_i532.SupportTabDataSource>(
      () => _i532.SupportTabDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i976.GetUsersUsecase>(
      () => _i976.GetUsersUsecase(gh<_i620.UsersRepository>()));
  gh.factory<_i425.AddClientContactRepository>(() =>
      _i741.AddClientContactRepositoryImpl(
          gh<_i316.AddClientsContactsDatasource>()));
  gh.lazySingleton<_i330.GetPendingInvoicesUsecase>(
      () => _i330.GetPendingInvoicesUsecase(gh<_i932.PendingInvoicesRepo>()));
  gh.lazySingleton<_i828.GetClientsCareReportsUsecase>(() =>
      _i828.GetClientsCareReportsUsecase(gh<_i361.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i570.InvoicesTabDataSource>(
      () => _i570.InvoicesTabDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i13.CitiesRepository>(
      () => _i450.CitiesRepositoryImpl(gh<_i453.CitiesDatasource>()));
  gh.lazySingleton<_i153.GetCitiesUseCase>(
      () => _i153.GetCitiesUseCase(gh<_i13.CitiesRepository>()));
  gh.lazySingleton<_i1036.AddTicketUseCase>(
      () => _i1036.AddTicketUseCase(gh<_i937.TicketsRepo>()));
  gh.lazySingleton<_i364.EditTicketTypeUseCase>(
      () => _i364.EditTicketTypeUseCase(gh<_i937.TicketsRepo>()));
  gh.lazySingleton<_i417.GetClientTicketsUseCase>(
      () => _i417.GetClientTicketsUseCase(gh<_i937.TicketsRepo>()));
  gh.lazySingleton<_i869.GetTicketsUseCase>(
      () => _i869.GetTicketsUseCase(gh<_i937.TicketsRepo>()));
  gh.lazySingleton<_i324.GetTicketByIdUseCase>(
      () => _i324.GetTicketByIdUseCase(gh<_i937.TicketsRepo>()));
  gh.lazySingleton<_i1013.TransferTicketUseCase>(
      () => _i1013.TransferTicketUseCase(gh<_i937.TicketsRepo>()));
  gh.factory<_i340.TicketsCubit>(() => _i340.TicketsCubit(
        gh<_i869.GetTicketsUseCase>(),
        gh<_i324.GetTicketByIdUseCase>(),
        gh<_i417.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i296.LevelsCubit>(() => _i296.LevelsCubit(
        gh<_i298.GetLevelsUsecase>(),
        gh<_i13.AddLevelUsecase>(),
      ));
  gh.factory<_i307.ClientActivitiesRepository>(() =>
      _i623.ClientListRepositoryImpl(gh<_i55.ClientActivitiesDatasource>()));
  gh.lazySingleton<_i525.LoginRemoteDataSource>(
      () => _i525.LoginRemoteDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i758.EmployeesSalesReportsRepo>(() =>
      _i123.EmployeesSalesReportsRepoImpl(
          gh<_i897.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i241.AdvancedConfigsRepository>(() =>
      _i597.AdvancedConfigsRepositoryImpl(
          gh<_i929.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i291.ParticipateListRepository>(() =>
      _i476.ParticipateListRepositoryImpl(
          gh<_i58.ParticipatesListDatasource>()));
  gh.lazySingleton<_i649.LatestClientsUpdatesDatasource>(
      () => _i649.LatestClientsUpdatesDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i701.ManageWithdrawnInvoicesDataSource>(() =>
      _i701.ManageWithdrawnInvoicesDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i235.WithdrawnInvoicesDataSource>(
      () => _i235.WithdrawnInvoicesDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i887.InvoicesSectionRepo>(
      () => _i689.InvoicesTabRepoImpl(gh<_i570.InvoicesTabDataSource>()));
  gh.factory<_i99.SupportClientsAcceptCubit>(() =>
      _i99.SupportClientsAcceptCubit(
          gh<_i453.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i218.WaitingAgentsDataSource>(
      () => _i218.WaitingAgentsDataSourceImpl(gh<_i124.ApiServices>()));
  gh.factory<_i652.SpecialClientsRepository>(() =>
      _i371.SpecialClientsRepositoryImpl(gh<_i11.SpecialClientsDatasource>()));
  gh.lazySingleton<_i513.GetFinancePendingInvoicesUsecase>(() =>
      _i513.GetFinancePendingInvoicesUsecase(gh<_i972.FinancePendingRepo>()));
  gh.lazySingleton<_i810.ProductsSalesReportsRepo>(() =>
      _i813.ProductsSalesReportsRepoImpl(
          gh<_i286.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i378.AgentsDistributorsProfileDataSource>(() =>
      _i378.AgentsDistributorsProfileDataSourceImpl(gh<_i124.ApiServices>()));
  gh.factory<_i320.EditTicketCubit>(() => _i320.EditTicketCubit(
        gh<_i364.EditTicketTypeUseCase>(),
        gh<_i1013.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i830.ClientsStatusReportsRepo>(() =>
      _i653.ClientsStatusReportsRepoImpl(
          gh<_i729.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i862.versionsRepo>(
      () => _i97.NotificationsRepoImpl(gh<_i309.NotificationsDatasource>()));
  gh.lazySingleton<_i246.DatesTableDataSource>(
      () => _i246.DatesTableDataSourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i1008.GetDelayAfterInstallUseCase>(() =>
      _i1008.GetDelayAfterInstallUseCase(gh<_i618.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i134.RegionsDatasource>(
      () => _i134.RegionsDatasourceImpl(gh<_i124.ApiServices>()));
  gh.lazySingleton<_i604.LocationServices>(
      () => _i604.LocationServices(gh<_i645.Location>()));
  gh.lazySingleton<_i297.GetClientsDebtsReportsUsecase>(() =>
      _i297.GetClientsDebtsReportsUsecase(gh<_i778.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i768.GreetingCommunicationRepo>(() =>
      _i778.GreetingCommunicationRepoImpl(
          gh<_i52.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i372.DatesTimeLinesRepo>(
      () => _i102.DatesTimelineRepoImpl(gh<_i1036.DatesTimelineDatasource>()));
  gh.singleton<_i74.CacheServices>(
    () => _i178.SecureStorageConsumer(gh<_i558.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i264.ManageWithdrawnInvoicesRepo>(() =>
      _i38.ManageWithdrawnInvoicesRepoImpl(
          gh<_i701.ManageWithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i454.InstallQualityRepo>(
      () => _i159.InstallQualityRepoImpl(gh<_i943.InstallQualityDatasource>()));
  gh.lazySingleton<_i805.PrivilegesRepo>(
      () => _i247.PrivilegesRepoImpl(gh<_i998.PrivilegesDatasource>()));
  gh.lazySingleton<_i503.DelayInstallReportsRepo>(() =>
      _i545.DelayInstallReportsRepoImpl(
          gh<_i1068.DelayInstallReportsDatasource>()));
  gh.factory<_i191.AppRepository>(
      () => _i86.AppRepositoryImpl(gh<_i293.AppDatasource>()));
  gh.factory<_i949.UpdatePrivilegesUsecase>(
      () => _i949.UpdatePrivilegesUsecase(gh<_i805.PrivilegesRepo>()));
  gh.lazySingleton<_i203.GetPrivilegesUsecase>(
      () => _i203.GetPrivilegesUsecase(gh<_i805.PrivilegesRepo>()));
  gh.singletonAsync<_i74.CacheServices>(() async =>
      _i818.PrefsConsumer(await gh.getAsync<_i460.SharedPreferences>()));
  gh.lazySingleton<_i866.AgentsDistributorsActionsRepo>(() =>
      _i368.AgentsDistributorsActionsRepoImpl(
          gh<_i113.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i1046.FinancePendingCubit>(() =>
      _i1046.FinancePendingCubit(gh<_i513.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i151.DeletedInvoicesRepo>(() =>
      _i660.DeletedInvoicesRepoImpl(gh<_i1028.DeletedInvoicesDatasource>()));
  gh.factory<_i676.DelayAfterInstallCubit>(() =>
      _i676.DelayAfterInstallCubit(gh<_i1008.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i910.GetRegionsSalesReportsUsecase>(() =>
      _i910.GetRegionsSalesReportsUsecase(gh<_i769.RegionsSalesReportsRepo>()));
  gh.factory<_i185.ClientsCareReportsCubit>(() =>
      _i185.ClientsCareReportsCubit(gh<_i828.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i843.SupportTabRepo>(
      () => _i527.SupportTabRepoImpl(gh<_i532.SupportTabDataSource>()));
  gh.factory<_i70.GetSpecialClientsUsecase>(() =>
      _i70.GetSpecialClientsUsecase(gh<_i652.SpecialClientsRepository>()));
  gh.lazySingleton<_i568.ExportInvoicesToExcelUsecase>(() =>
      _i568.ExportInvoicesToExcelUsecase(gh<_i887.InvoicesSectionRepo>()));
  gh.lazySingleton<_i351.GetInvoicesByPrivilegesUsecase>(() =>
      _i351.GetInvoicesByPrivilegesUsecase(gh<_i887.InvoicesSectionRepo>()));
  gh.lazySingleton<_i825.GetInvoiceByIdUsecase>(
      () => _i825.GetInvoiceByIdUsecase(gh<_i887.InvoicesSectionRepo>()));
  gh.lazySingleton<_i23.GetWrongNumbersUsecase>(
      () => _i23.GetWrongNumbersUsecase(gh<_i833.WrongNumbersRepo>()));
  gh.lazySingleton<_i26.GetClientsAcceptUseCase>(
      () => _i26.GetClientsAcceptUseCase(gh<_i551.ClientsAcceptRepository>()));
  gh.lazySingleton<_i5.GeneralConfigsRepository>(() =>
      _i188.GeneralConfigsRepositoryImpl(gh<_i576.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i620.GetNotificationsUsecase>(
      () => _i620.GetNotificationsUsecase(gh<_i841.NotificationsRepo>()));
  gh.lazySingleton<_i625.GetUnreadNotificationsCountUsecase>(() =>
      _i625.GetUnreadNotificationsCountUsecase(gh<_i841.NotificationsRepo>()));
  gh.lazySingleton<_i250.MarkNotificationsAsReadUsecase>(() =>
      _i250.MarkNotificationsAsReadUsecase(gh<_i841.NotificationsRepo>()));
  gh.lazySingleton<_i566.GetPeriodicCommunicationReportsUsecase>(() =>
      _i566.GetPeriodicCommunicationReportsUsecase(
          gh<_i966.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i732.GetBranchesByIdCountryUseCase>(
      () => _i732.GetBranchesByIdCountryUseCase(gh<_i87.BranchesRepository>()));
  gh.factory<_i398.CompanyRepository>(
      () => _i53.CompanyRepositoryImpl(gh<_i139.CommentCompanyDatasource>()));
  gh.singleton<_i985.PrivilegesCubit>(() => _i985.PrivilegesCubit(
        gh<_i203.GetPrivilegesUsecase>(),
        gh<_i949.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i257.GetInstallUseCase>(
      () => _i257.GetInstallUseCase(gh<_i454.InstallQualityRepo>()));
  gh.lazySingleton<_i116.GetManagementsUsecase>(
      () => _i116.GetManagementsUsecase(gh<_i495.ViolationsRepository>()));
  gh.lazySingleton<_i591.GetViolationsUsecase>(
      () => _i591.GetViolationsUsecase(gh<_i495.ViolationsRepository>()));
  gh.lazySingleton<_i797.GetViolationsTypesUseCase>(
      () => _i797.GetViolationsTypesUseCase(gh<_i495.ViolationsRepository>()));
  gh.lazySingleton<_i512.GetTimelineByEmployeeUseCase>(
      () => _i512.GetTimelineByEmployeeUseCase(gh<_i372.DatesTimeLinesRepo>()));
  gh.lazySingleton<_i834.AgentsDistributorsProfileRepo>(() =>
      _i226.AgentsDistributorsProfileRepoImpl(
          gh<_i378.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i148.AddVersionsUsecase>(
      () => _i148.AddVersionsUsecase(gh<_i862.versionsRepo>()));
  gh.lazySingleton<_i551.GetVersionsUsecase>(
      () => _i551.GetVersionsUsecase(gh<_i862.versionsRepo>()));
  gh.lazySingleton<_i124.UpdateVersionsUsecase>(
      () => _i124.UpdateVersionsUsecase(gh<_i862.versionsRepo>()));
  gh.lazySingleton<_i888.AddDateInstallUsecase>(
      () => _i888.AddDateInstallUsecase(gh<_i843.SupportTabRepo>()));
  gh.lazySingleton<_i417.CancelDateInstallUsecase>(
      () => _i417.CancelDateInstallUsecase(gh<_i843.SupportTabRepo>()));
  gh.lazySingleton<_i801.GetInvoiceByClientUsecase>(
      () => _i801.GetInvoiceByClientUsecase(gh<_i843.SupportTabRepo>()));
  gh.lazySingleton<_i376.ReceiveDeviceUsecase>(
      () => _i376.ReceiveDeviceUsecase(gh<_i843.SupportTabRepo>()));
  gh.lazySingleton<_i123.ReturnInvoiceApproveUsecase>(
      () => _i123.ReturnInvoiceApproveUsecase(gh<_i843.SupportTabRepo>()));
  gh.lazySingleton<_i1045.SetDateDoneUsecase>(
      () => _i1045.SetDateDoneUsecase(gh<_i843.SupportTabRepo>()));
  gh.lazySingleton<_i896.SetReadyInstallUsecase>(
      () => _i896.SetReadyInstallUsecase(gh<_i843.SupportTabRepo>()));
  gh.lazySingleton<_i780.GetAllUsersUseCase>(
      () => _i780.GetAllUsersUseCase(gh<_i887.InvoicesSectionRepo>()));
  gh.lazySingleton<_i228.ClientsDebtsRepo>(
      () => _i652.ClientsDebtsRepoImpl(gh<_i785.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i931.PeriodicCommunicationRepo>(() =>
      _i838.PeriodicCommunicationRepoImpl(
          gh<_i821.PeriodicCommunicationDatasource>()));
  gh.factory<_i1013.ImportantLinksRepo>(
      () => _i654.ImportantLinksRepoImpl(gh<_i674.ImportantLinksDatasource>()));
  gh.factory<_i552.CareActivitiesRepository>(
      () => _i566.CareListRepositoryImpl(gh<_i809.CareActivitiesDatasource>()));
  gh.factory<_i944.ExportClientsToExcelUseCase>(() =>
      _i944.ExportClientsToExcelUseCase(gh<_i186.ClientsListDatasource>()));
  gh.factory<_i97.UpdateViolationUseCase>(
      () => _i97.UpdateViolationUseCase(gh<_i495.ViolationsRepository>()));
  gh.lazySingleton<_i80.GetClientLogsUsecase>(
      () => _i80.GetClientLogsUsecase(gh<_i566.ClientLogsTabRepo>()));
  gh.lazySingleton<_i794.SupportClientsInvoicesRepo>(() =>
      _i635.SupportClientsInvoicesRepoImpl(
          gh<_i880.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i62.GetBranchesForUserUsecase>(
      () => _i62.GetBranchesForUserUsecase(gh<_i586.UsersRepository>()));
  gh.lazySingleton<_i1026.GetLevelsForUserUsecase>(
      () => _i1026.GetLevelsForUserUsecase(gh<_i586.UsersRepository>()));
  gh.lazySingleton<_i944.GetManagesForUserUsecase>(
      () => _i944.GetManagesForUserUsecase(gh<_i586.UsersRepository>()));
  gh.factory<_i18.GetUsersUsecase>(
      () => _i18.GetUsersUsecase(gh<_i586.UsersRepository>()));
  gh.factory<_i653.GetUserByIdUsecase>(
      () => _i653.GetUserByIdUsecase(gh<_i586.UsersRepository>()));
  gh.lazySingleton<_i992.GetSupportClientsInvoicesUseCase>(() =>
      _i992.GetSupportClientsInvoicesUseCase(
          gh<_i794.SupportClientsInvoicesRepo>()));
  gh.factory<_i760.ClientsAttachmentsRepository>(() =>
      _i331.ClientsAttachmentsRepoImpl(
          gh<_i987.ClientAttachmentsDatasource>()));
  gh.lazySingleton<_i745.ManageWithdrawalsRepository>(() =>
      _i665.ManageWithdrawalsRepositoryImpl(
          gh<_i1031.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i400.AgentsDistributorsRepo>(() =>
      _i280.AgentsDistributorsRepoImpl(
          gh<_i180.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i550.GetProductsSalesReportsUsecase>(() =>
      _i550.GetProductsSalesReportsUsecase(
          gh<_i810.ProductsSalesReportsRepo>()));
  gh.singleton<_i1000.CitiesCubit>(
      () => _i1000.CitiesCubit(gh<_i153.GetCitiesUseCase>()));
  gh.lazySingleton<_i40.GetNotUsingSystemUsecase>(
      () => _i40.GetNotUsingSystemUsecase(gh<_i547.NotUsingSystemRepo>()));
  gh.factory<_i592.CrudActivitiesRepository>(
      () => _i44.CrudActivitiesRepoImpl(gh<_i734.CrudActivitiesDatasource>()));
  gh.factory<_i144.UsersTypeCubit>(
      () => _i144.UsersTypeCubit(gh<_i976.GetUsersUsecase>()));
  gh.factory<_i952.ClientsListRepository>(
      () => _i862.ClientsListRepositoryImpl(gh<_i186.ClientsListDatasource>()));
  gh.factory<_i290.ClientsDatesRepository>(
      () => _i7.ClientsListRepositoryImpl(gh<_i274.ClientsDatesDatasource>()));
  gh.factory<_i943.AddClientContactUseCase>(() =>
      _i943.AddClientContactUseCase(gh<_i425.AddClientContactRepository>()));
  gh.factory<_i738.UpdateClientContactUseCase>(() =>
      _i738.UpdateClientContactUseCase(gh<_i425.AddClientContactRepository>()));
  gh.factory<_i502.AddParticipateCommentUsecase>(() =>
      _i502.AddParticipateCommentUsecase(
          gh<_i291.ParticipateListRepository>()));
  gh.factory<_i393.AddParticipateUserUsecase>(() =>
      _i393.AddParticipateUserUsecase(gh<_i291.ParticipateListRepository>()));
  gh.factory<_i62.EditParticipateUserUsecase>(() =>
      _i62.EditParticipateUserUsecase(gh<_i291.ParticipateListRepository>()));
  gh.factory<_i278.ParticipateClientListUsecase>(() =>
      _i278.ParticipateClientListUsecase(
          gh<_i291.ParticipateListRepository>()));
  gh.factory<_i1055.ParticipateCommentListUsecase>(() =>
      _i1055.ParticipateCommentListUsecase(
          gh<_i291.ParticipateListRepository>()));
  gh.factory<_i154.GetParticipateInvoiceByIdUsecase>(() =>
      _i154.GetParticipateInvoiceByIdUsecase(
          gh<_i291.ParticipateListRepository>()));
  gh.factory<_i150.ParticipateInvoiceListUsecase>(() =>
      _i150.ParticipateInvoiceListUsecase(
          gh<_i291.ParticipateListRepository>()));
  gh.factory<_i905.ParticipateListUsecase>(() =>
      _i905.ParticipateListUsecase(gh<_i291.ParticipateListRepository>()));
  gh.lazySingleton<_i968.ChangeParticipateStatusUsecase>(() =>
      _i968.ChangeParticipateStatusUsecase(
          gh<_i291.ParticipateListRepository>()));
  gh.factory<_i21.PendingInvoicesCubit>(
      () => _i21.PendingInvoicesCubit(gh<_i330.GetPendingInvoicesUsecase>()));
  gh.factory<_i156.EvaluationLevelReportCubit>(() =>
      _i156.EvaluationLevelReportCubit(
          gh<_i418.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i935.GetEmployeesSalesReportsUsecase>(() =>
      _i935.GetEmployeesSalesReportsUsecase(
          gh<_i758.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i478.GetGreetingCommunicationUseCase>(() =>
      _i478.GetGreetingCommunicationUseCase(
          gh<_i768.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i1067.ClientsTransferApprovalsRepo>(() =>
      _i913.ClientsTransferApprovalsRepoImpl(
          gh<_i923.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i225.GetDeletedInvoicesUsecase>(
      () => _i225.GetDeletedInvoicesUsecase(gh<_i151.DeletedInvoicesRepo>()));
  gh.factory<_i20.ClientsContactsRepository>(() =>
      _i1007.ClientsListRepositoryImpl(gh<_i743.ClientsContactsDatasource>()));
  gh.lazySingleton<_i587.GetClientsStatusReportsUsecase>(() =>
      _i587.GetClientsStatusReportsUsecase(
          gh<_i830.ClientsStatusReportsRepo>()));
  gh.factory<_i680.ActionLinkUsecase>(
      () => _i680.ActionLinkUsecase(gh<_i1013.ImportantLinksRepo>()));
  gh.factory<_i174.GetImportantLinksUsecase>(
      () => _i174.GetImportantLinksUsecase(gh<_i1013.ImportantLinksRepo>()));
  gh.lazySingleton<_i710.GetPreviousRatingsUsecase>(
      () => _i710.GetPreviousRatingsUsecase(gh<_i412.PreviousRatingsRepo>()));
  gh.lazySingleton<_i887.WaitingAgentsRepo>(
      () => _i507.WaitingAgentsRepoImpl(gh<_i218.WaitingAgentsDataSource>()));
  gh.factory<_i824.AddClientUserUsecase>(
      () => _i824.AddClientUserUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i34.ApproveRejectClientUsecase>(
      () => _i34.ApproveRejectClientUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i688.ChangeClientCommunicationUseCase>(() =>
      _i688.ChangeClientCommunicationUseCase(
          gh<_i952.ClientsListRepository>()));
  gh.factory<_i137.ChangeTypeClientUsecase>(
      () => _i137.ChangeTypeClientUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i190.EditClientUserUsecase>(
      () => _i190.EditClientUserUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i370.GetClientsListByRegionUseCase>(() =>
      _i370.GetClientsListByRegionUseCase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i446.GetClientsListByUserUseCase>(() =>
      _i446.GetClientsListByUserUseCase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i574.GetClientsWithFilterUserUsecase>(() =>
      _i574.GetClientsWithFilterUserUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i999.GetClientMarketingReportUsecase>(() =>
      _i999.GetClientMarketingReportUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i143.GetRecommendedClientsUsecase>(() =>
      _i143.GetRecommendedClientsUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i1047.GetSimilarClientsUsecase>(
      () => _i1047.GetSimilarClientsUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i679.ReceiveClientUserUsecase>(
      () => _i679.ReceiveClientUserUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i592.StoreClientCommunicationUseCase>(() =>
      _i592.StoreClientCommunicationUseCase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i912.TransferClientUserUsecase>(
      () => _i912.TransferClientUserUsecase(gh<_i952.ClientsListRepository>()));
  gh.lazySingleton<_i467.GetHighSimilarClientsUsecase>(() =>
      _i467.GetHighSimilarClientsUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i282.EmployeesSalesReportsCubit>(() =>
      _i282.EmployeesSalesReportsCubit(
          gh<_i935.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i982.ChangeStateAgentUseCase>(
      () => _i982.ChangeStateAgentUseCase(gh<_i400.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i1046.GetAgentsAndDistributorsUseCase>(() =>
      _i1046.GetAgentsAndDistributorsUseCase(
          gh<_i400.AgentsDistributorsRepo>()));
  gh.factory<_i618.GetClientActivitiesUseCase>(() =>
      _i618.GetClientActivitiesUseCase(gh<_i307.ClientActivitiesRepository>()));
  gh.factory<_i406.ClientsAcceptCubit>(
      () => _i406.ClientsAcceptCubit(gh<_i26.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i344.CancelWithdrawalUsecase>(() =>
      _i344.CancelWithdrawalUsecase(gh<_i745.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i179.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i179.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i745.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i883.GetWithdrawalsInvoicesUsecase>(() =>
      _i883.GetWithdrawalsInvoicesUsecase(
          gh<_i745.ManageWithdrawalsRepository>()));
  gh.factory<_i493.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i493.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i745.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i937.ExceededClientsUseCase>(
      () => _i937.ExceededClientsUseCase(gh<_i25.ExceededClientsRepo>()));
  gh.lazySingleton<_i824.TransferExceededClientsUseCase>(() =>
      _i824.TransferExceededClientsUseCase(gh<_i25.ExceededClientsRepo>()));
  gh.factory<_i387.ParticipateListBloc>(() => _i387.ParticipateListBloc(
        gh<_i905.ParticipateListUsecase>(),
        gh<_i393.AddParticipateUserUsecase>(),
        gh<_i62.EditParticipateUserUsecase>(),
        gh<_i278.ParticipateClientListUsecase>(),
        gh<_i150.ParticipateInvoiceListUsecase>(),
        gh<_i154.GetParticipateInvoiceByIdUsecase>(),
        gh<_i1055.ParticipateCommentListUsecase>(),
        gh<_i502.AddParticipateCommentUsecase>(),
        gh<_i968.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i1.LoginLocalDataSource>(() => _i1.LoginLocalDataSourceImpl(
      gh<_i74.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i1049.EditAdvancedConfigsUsecase>(() =>
      _i1049.EditAdvancedConfigsUsecase(gh<_i241.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i884.GetAdvancedConfigsUsecase>(() =>
      _i884.GetAdvancedConfigsUsecase(gh<_i241.AdvancedConfigsRepository>()));
  gh.factory<_i85.ClientsInstallReportsCubit>(() =>
      _i85.ClientsInstallReportsCubit(
          gh<_i970.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i61.DatesTableRepo>(
      () => _i625.DatesTableRepoImpl(gh<_i246.DatesTableDataSource>()));
  gh.factory<_i631.GetVersionUseCase>(
      () => _i631.GetVersionUseCase(gh<_i191.AppRepository>()));
  gh.factory<_i68.AddTicketCubit>(
      () => _i68.AddTicketCubit(gh<_i1036.AddTicketUseCase>()));
  gh.lazySingleton<_i88.LatestClientsUpdatesRepository>(() =>
      _i608.LatestClientsUpdatesRepositoryImpl(
          gh<_i649.LatestClientsUpdatesDatasource>()));
  gh.factory<_i956.TaskRepository>(
      () => _i385.TaskRepositoryImpl(gh<_i483.TaskDatasource>()));
  gh.lazySingleton<_i608.EditGeneralConfigsUsecase>(() =>
      _i608.EditGeneralConfigsUsecase(gh<_i5.GeneralConfigsRepository>()));
  gh.lazySingleton<_i4.GetGeneralConfigsUsecase>(
      () => _i4.GetGeneralConfigsUsecase(gh<_i5.GeneralConfigsRepository>()));
  gh.factory<_i705.PeriodicCommunicationReportsCubit>(() =>
      _i705.PeriodicCommunicationReportsCubit(
          gh<_i566.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i701.GetAllClientsContactsUseCase>(() =>
      _i701.GetAllClientsContactsUseCase(gh<_i20.ClientsContactsRepository>()));
  gh.factory<_i437.InstallQualityCubit>(
      () => _i437.InstallQualityCubit(gh<_i257.GetInstallUseCase>()));
  gh.factory<_i82.ClientsContactsBloc>(
      () => _i82.ClientsContactsBloc(gh<_i701.GetAllClientsContactsUseCase>()));
  gh.factory<_i554.ImportantLinksCubit>(() => _i554.ImportantLinksCubit(
        gh<_i174.GetImportantLinksUsecase>(),
        gh<_i680.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i19.AddAgentUseCase>(
      () => _i19.AddAgentUseCase(gh<_i866.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i191.UpdateAgentUseCase>(() =>
      _i191.UpdateAgentUseCase(gh<_i866.AgentsDistributorsActionsRepo>()));
  gh.factory<_i377.VersionsBloc>(() => _i377.VersionsBloc(
        gh<_i551.GetVersionsUsecase>(),
        gh<_i148.AddVersionsUsecase>(),
        gh<_i124.UpdateVersionsUsecase>(),
      ));
  gh.lazySingleton<_i767.GetDelayInstallReportsUseCase>(() =>
      _i767.GetDelayInstallReportsUseCase(gh<_i503.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i207.CrudAgentSupportFilesUsecase>(() =>
      _i207.CrudAgentSupportFilesUsecase(
          gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i753.GetClientsTransferApprovalsUsecase>(() =>
      _i753.GetClientsTransferApprovalsUsecase(
          gh<_i1067.ClientsTransferApprovalsRepo>()));
  gh.factory<_i456.ClientsStatusReportsCubit>(() =>
      _i456.ClientsStatusReportsCubit(
          gh<_i587.GetClientsStatusReportsUsecase>()));
  gh.factory<_i54.ViolationsCubit>(() => _i54.ViolationsCubit(
        gh<_i591.GetViolationsUsecase>(),
        gh<_i97.UpdateViolationUseCase>(),
        gh<_i116.GetManagementsUsecase>(),
        gh<_i797.GetViolationsTypesUseCase>(),
      ));
  gh.factory<_i565.SupportTabCubit>(() => _i565.SupportTabCubit(
        gh<_i801.GetInvoiceByClientUsecase>(),
        gh<_i888.AddDateInstallUsecase>(),
        gh<_i1045.SetDateDoneUsecase>(),
        gh<_i896.SetReadyInstallUsecase>(),
        gh<_i123.ReturnInvoiceApproveUsecase>(),
        gh<_i376.ReceiveDeviceUsecase>(),
        gh<_i417.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i401.ClientsDebtsReportsCubit>(() =>
      _i401.ClientsDebtsReportsCubit(
          gh<_i297.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i398.DeletedInvoicesCubit>(
      () => _i398.DeletedInvoicesCubit(gh<_i225.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i1037.AddAgentDateUseCase>(() =>
      _i1037.AddAgentDateUseCase(gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i707.GetManageWithdrawnInvoicesUsecase>(() =>
      _i707.GetManageWithdrawnInvoicesUsecase(
          gh<_i264.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i865.AddActivityCrudUseCase>(
      () => _i865.AddActivityCrudUseCase(gh<_i592.CrudActivitiesRepository>()));
  gh.factory<_i327.GetActivityTypesUseCase>(() =>
      _i327.GetActivityTypesUseCase(gh<_i592.CrudActivitiesRepository>()));
  gh.factory<_i75.GetCrudActivitiesUseCase>(() =>
      _i75.GetCrudActivitiesUseCase(gh<_i592.CrudActivitiesRepository>()));
  gh.factory<_i947.GetSubscribedClientsUseCase>(() =>
      _i947.GetSubscribedClientsUseCase(gh<_i592.CrudActivitiesRepository>()));
  gh.factory<_i245.UpdateActivityCrudUseCase>(() =>
      _i245.UpdateActivityCrudUseCase(gh<_i592.CrudActivitiesRepository>()));
  gh.factory<_i0.NotificationsCubit>(() => _i0.NotificationsCubit(
        gh<_i620.GetNotificationsUsecase>(),
        gh<_i250.MarkNotificationsAsReadUsecase>(),
        gh<_i625.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i746.WithdrawnInvoicesRepo>(() =>
      _i238.WithdrawnInvoicesRepoImpl(gh<_i235.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i1041.RegionsRepository>(
      () => _i138.RegionsRepositoryImpl(gh<_i134.RegionsDatasource>()));
  gh.factory<_i697.ClientLogsTabCubit>(
      () => _i697.ClientLogsTabCubit(gh<_i80.GetClientLogsUsecase>()));
  gh.factory<_i851.RegionsSalesReportsCubit>(() =>
      _i851.RegionsSalesReportsCubit(
          gh<_i910.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i289.AddClientContactBloc>(() => _i289.AddClientContactBloc(
        gh<_i943.AddClientContactUseCase>(),
        gh<_i738.UpdateClientContactUseCase>(),
      ));
  gh.factory<_i457.AgentsDistributorsActionsCubit>(
      () => _i457.AgentsDistributorsActionsCubit(
            gh<_i153.GetCitiesUseCase>(),
            gh<_i19.AddAgentUseCase>(),
            gh<_i191.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i314.FetchPaginatedClientsUsecase>(() =>
      _i314.FetchPaginatedClientsUsecase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i400.FetchLinkClientsUseCase>(
      () => _i400.FetchLinkClientsUseCase(gh<_i952.ClientsListRepository>()));
  gh.factory<_i987.LinkSelectedClientsUseCase>(() =>
      _i987.LinkSelectedClientsUseCase(gh<_i952.ClientsListRepository>()));
  gh.lazySingleton<_i325.LoginRepo>(() => _i897.LoginRepoImpl(
        gh<_i525.LoginRemoteDataSource>(),
        gh<_i1.LoginLocalDataSource>(),
      ));
  gh.factory<_i222.SpecialClientsBloc>(
      () => _i222.SpecialClientsBloc(gh<_i70.GetSpecialClientsUsecase>()));
  gh.factory<_i520.AddCommentUsecase>(
      () => _i520.AddCommentUsecase(gh<_i398.CompanyRepository>()));
  gh.factory<_i521.GetCommentUsecase>(
      () => _i521.GetCommentUsecase(gh<_i398.CompanyRepository>()));
  gh.factory<_i583.DelayInstallReportsCubit>(() =>
      _i583.DelayInstallReportsCubit(
          gh<_i767.GetDelayInstallReportsUseCase>()));
  gh.factory<_i593.DatesTimelineBloc>(
      () => _i593.DatesTimelineBloc(gh<_i512.GetTimelineByEmployeeUseCase>()));
  gh.factory<_i692.GreetingCommunicationCubit>(() =>
      _i692.GreetingCommunicationCubit(
          gh<_i478.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i867.GetRegionsUseCase>(
      () => _i867.GetRegionsUseCase(gh<_i1041.RegionsRepository>()));
  gh.lazySingleton<_i189.GetLatestClientsUseCase>(() =>
      _i189.GetLatestClientsUseCase(gh<_i88.LatestClientsUpdatesRepository>()));
  gh.factory<_i927.AdvancedCofigsCubit>(() => _i927.AdvancedCofigsCubit(
        gh<_i884.GetAdvancedConfigsUsecase>(),
        gh<_i1049.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i951.SupportClientsInvoicesCubit>(() =>
      _i951.SupportClientsInvoicesCubit(
          gh<_i992.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i53.WrongNumbersCubit>(
      () => _i53.WrongNumbersCubit(gh<_i23.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i220.CacheTokenUsecase>(
      () => _i220.CacheTokenUsecase(gh<_i325.LoginRepo>()));
  gh.lazySingleton<_i882.GetTokenUsecase>(
      () => _i882.GetTokenUsecase(gh<_i325.LoginRepo>()));
  gh.lazySingleton<_i772.LoginUsecase>(
      () => _i772.LoginUsecase(gh<_i325.LoginRepo>()));
  gh.lazySingleton<_i518.ValidateTokenUsecase>(
      () => _i518.ValidateTokenUsecase(gh<_i325.LoginRepo>()));
  gh.lazySingleton<_i959.VerifyOtpUsecase>(
      () => _i959.VerifyOtpUsecase(gh<_i325.LoginRepo>()));
  gh.factory<_i207.ClientsTransferApprovalsCubit>(() =>
      _i207.ClientsTransferApprovalsCubit(
          gh<_i753.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i767.RegionsCubit>(
      () => _i767.RegionsCubit(gh<_i867.GetRegionsUseCase>()));
  gh.factory<_i765.GeneralCofigsCubit>(() => _i765.GeneralCofigsCubit(
        gh<_i4.GetGeneralConfigsUsecase>(),
        gh<_i608.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i313.GetPeriodicCommunicationUseCase>(() =>
      _i313.GetPeriodicCommunicationUseCase(
          gh<_i931.PeriodicCommunicationRepo>()));
  gh.factory<_i12.GetAttachmentsUseCase>(() =>
      _i12.GetAttachmentsUseCase(gh<_i760.ClientsAttachmentsRepository>()));
  gh.factory<_i797.GetAllClientUseCase>(() =>
      _i797.GetAllClientUseCase(gh<_i760.ClientsAttachmentsRepository>()));
  gh.lazySingleton<_i699.GetClientsDebtsUsecase>(
      () => _i699.GetClientsDebtsUsecase(gh<_i228.ClientsDebtsRepo>()));
  gh.lazySingleton<_i588.CrudClientSupportFilesUsecase>(() =>
      _i588.CrudClientSupportFilesUsecase(
          repository: gh<_i952.ClientsListRepository>()));
  gh.lazySingleton<_i218.GetClientSupportFilesUsecase>(() =>
      _i218.GetClientSupportFilesUsecase(
          repository: gh<_i952.ClientsListRepository>()));
  gh.factory<_i648.BranchesCubit>(
      () => _i648.BranchesCubit(gh<_i732.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i989.AddAgentCommentUsecase>(() =>
      _i989.AddAgentCommentUsecase(gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i491.DoneTrainingUsecase>(() =>
      _i491.DoneTrainingUsecase(gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i854.GetAgentByIdUsecase>(() =>
      _i854.GetAgentByIdUsecase(gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i805.GetAgentClientListUsecase>(() =>
      _i805.GetAgentClientListUsecase(
          gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i104.GetAgentCommentsListUsecase>(() =>
      _i104.GetAgentCommentsListUsecase(
          gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i405.GetAgentDatesListUsecase>(() =>
      _i405.GetAgentDatesListUsecase(
          gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i1010.GetAgentInvoiceListUsecase>(() =>
      _i1010.GetAgentInvoiceListUsecase(
          gh<_i834.AgentsDistributorsProfileRepo>()));
  gh.factory<_i233.AddRejectReasonsUsecase>(() =>
      _i233.AddRejectReasonsUsecase(gh<_i745.ManageWithdrawalsRepository>()));
  gh.factory<_i95.EditRejectReasonsUsecase>(() =>
      _i95.EditRejectReasonsUsecase(gh<_i745.ManageWithdrawalsRepository>()));
  gh.factory<_i500.GetRejectReasonsUsecase>(() =>
      _i500.GetRejectReasonsUsecase(gh<_i745.ManageWithdrawalsRepository>()));
  gh.factory<_i134.GetUserSeriesUsecase>(() =>
      _i134.GetUserSeriesUsecase(gh<_i745.ManageWithdrawalsRepository>()));
  gh.factory<_i289.GetWithdrawnDetailsUsecase>(() =>
      _i289.GetWithdrawnDetailsUsecase(
          gh<_i745.ManageWithdrawalsRepository>()));
  gh.factory<_i646.SetApproveSeriesUsecase>(() =>
      _i646.SetApproveSeriesUsecase(gh<_i745.ManageWithdrawalsRepository>()));
  gh.factory<_i898.UpdateSeriesUsecase>(
      () => _i898.UpdateSeriesUsecase(gh<_i745.ManageWithdrawalsRepository>()));
  gh.factory<_i866.NotUsingSystemCubit>(
      () => _i866.NotUsingSystemCubit(gh<_i40.GetNotUsingSystemUsecase>()));
  gh.singleton<_i480.AppManagerCubit>(
      () => _i480.AppManagerCubit(gh<_i631.GetVersionUseCase>()));
  gh.factory<_i555.GetAllClientsDatesUseCase>(() =>
      _i555.GetAllClientsDatesUseCase(gh<_i290.ClientsDatesRepository>()));
  gh.factory<_i335.GetAllCareActivitiesUseCase>(() =>
      _i335.GetAllCareActivitiesUseCase(gh<_i552.CareActivitiesRepository>()));
  gh.factory<_i70.UpdateCareActivityUseCase>(() =>
      _i70.UpdateCareActivityUseCase(gh<_i552.CareActivitiesRepository>()));
  gh.lazySingleton<_i941.GetWaitingAgentsUsecase>(
      () => _i941.GetWaitingAgentsUsecase(gh<_i887.WaitingAgentsRepo>()));
  gh.factory<_i1003.ClientActivitiesBloc>(() =>
      _i1003.ClientActivitiesBloc(gh<_i618.GetClientActivitiesUseCase>()));
  gh.factory<_i401.InvoicesSectionCubit>(() => _i401.InvoicesSectionCubit(
        gh<_i351.GetInvoicesByPrivilegesUsecase>(),
        gh<_i1046.GetAgentsAndDistributorsUseCase>(),
        gh<_i905.ParticipateListUsecase>(),
        gh<_i780.GetAllUsersUseCase>(),
        gh<_i825.GetInvoiceByIdUsecase>(),
        gh<_i568.ExportInvoicesToExcelUsecase>(),
      ));
  gh.factory<_i412.ClientAttachmentsBloc>(() => _i412.ClientAttachmentsBloc(
        gh<_i12.GetAttachmentsUseCase>(),
        gh<_i797.GetAllClientUseCase>(),
      ));
  gh.factory<_i821.ProductsSalesReportsCubit>(() =>
      _i821.ProductsSalesReportsCubit(
          gh<_i550.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i209.GetWithdrawnInvoicesUsecase>(() =>
      _i209.GetWithdrawnInvoicesUsecase(gh<_i746.WithdrawnInvoicesRepo>()));
  gh.factory<_i999.PreviousRatingsCubit>(
      () => _i999.PreviousRatingsCubit(gh<_i710.GetPreviousRatingsUsecase>()));
  gh.factory<_i485.CareActivitiesBloc>(() => _i485.CareActivitiesBloc(
        gh<_i335.GetAllCareActivitiesUseCase>(),
        gh<_i70.UpdateCareActivityUseCase>(),
      ));
  gh.factory<_i825.AgentsDistributorsCubit>(() => _i825.AgentsDistributorsCubit(
        gh<_i1046.GetAgentsAndDistributorsUseCase>(),
        gh<_i982.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i473.ExceededClientsCubit>(() => _i473.ExceededClientsCubit(
        gh<_i937.ExceededClientsUseCase>(),
        gh<_i824.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i631.ClientsListBloc>(() => _i631.ClientsListBloc(
        gh<_i574.GetClientsWithFilterUserUsecase>(),
        gh<_i143.GetRecommendedClientsUsecase>(),
        gh<_i1047.GetSimilarClientsUsecase>(),
        gh<_i824.AddClientUserUsecase>(),
        gh<_i190.EditClientUserUsecase>(),
        gh<_i137.ChangeTypeClientUsecase>(),
        gh<_i688.ChangeClientCommunicationUseCase>(),
        gh<_i592.StoreClientCommunicationUseCase>(),
        gh<_i34.ApproveRejectClientUsecase>(),
        gh<_i588.CrudClientSupportFilesUsecase>(),
        gh<_i218.GetClientSupportFilesUsecase>(),
        gh<_i912.TransferClientUserUsecase>(),
        gh<_i679.ReceiveClientUserUsecase>(),
        gh<_i999.GetClientMarketingReportUsecase>(),
        gh<_i467.GetHighSimilarClientsUsecase>(),
        gh<_i400.FetchLinkClientsUseCase>(),
        gh<_i314.FetchPaginatedClientsUsecase>(),
        gh<_i987.LinkSelectedClientsUseCase>(),
        gh<_i944.ExportClientsToExcelUseCase>(),
      ));
  gh.factory<_i618.ManageWithdrawalsCubit>(() => _i618.ManageWithdrawalsCubit(
        gh<_i134.GetUserSeriesUsecase>(),
        gh<_i898.UpdateSeriesUsecase>(),
        gh<_i18.GetUsersUsecase>(),
        gh<_i883.GetWithdrawalsInvoicesUsecase>(),
        gh<_i493.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i646.SetApproveSeriesUsecase>(),
        gh<_i289.GetWithdrawnDetailsUsecase>(),
        gh<_i233.AddRejectReasonsUsecase>(),
        gh<_i500.GetRejectReasonsUsecase>(),
        gh<_i95.EditRejectReasonsUsecase>(),
        gh<_i179.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i344.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i938.ManageWithdrawnInvoicesCubit>(() =>
      _i938.ManageWithdrawnInvoicesCubit(
          gh<_i707.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i767.LatestClientsUpdatesCubit>(() =>
      _i767.LatestClientsUpdatesCubit(gh<_i189.GetLatestClientsUseCase>()));
  gh.factory<_i970.AttachmentsRowCubit>(() => _i970.AttachmentsRowCubit(
        gh<_i218.GetClientSupportFilesUsecase>(),
        gh<_i588.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i803.CancelScheduleUsecase>(
      () => _i803.CancelScheduleUsecase(gh<_i61.DatesTableRepo>()));
  gh.lazySingleton<_i798.ChangeDateToDonUsecase>(
      () => _i798.ChangeDateToDonUsecase(gh<_i61.DatesTableRepo>()));
  gh.lazySingleton<_i989.GetCancelReasonsUsecase>(
      () => _i989.GetCancelReasonsUsecase(gh<_i61.DatesTableRepo>()));
  gh.lazySingleton<_i438.GetDateInstallationUsecase>(
      () => _i438.GetDateInstallationUsecase(gh<_i61.DatesTableRepo>()));
  gh.lazySingleton<_i735.GetInvoicesByClientForDateUsecase>(
      () => _i735.GetInvoicesByClientForDateUsecase(gh<_i61.DatesTableRepo>()));
  gh.lazySingleton<_i824.GetSubscribedClientsUsecase>(
      () => _i824.GetSubscribedClientsUsecase(gh<_i61.DatesTableRepo>()));
  gh.lazySingleton<_i883.RescheduleDateUsecase>(
      () => _i883.RescheduleDateUsecase(gh<_i61.DatesTableRepo>()));
  gh.lazySingleton<_i307.ReturnScheduleVisitToOpenUsecase>(
      () => _i307.ReturnScheduleVisitToOpenUsecase(gh<_i61.DatesTableRepo>()));
  gh.factory<_i111.AddTaskUsecase>(
      () => _i111.AddTaskUsecase(gh<_i956.TaskRepository>()));
  gh.factory<_i831.ChangeStatusTaskUsecase>(
      () => _i831.ChangeStatusTaskUsecase(gh<_i956.TaskRepository>()));
  gh.factory<_i439.GetTasksUsecase>(
      () => _i439.GetTasksUsecase(gh<_i956.TaskRepository>()));
  gh.factory<_i526.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i526.GetUsersByDepartmentAndRegionUsecase(gh<_i956.TaskRepository>()));
  gh.factory<_i943.CrudActivitiesBloc>(() => _i943.CrudActivitiesBloc(
        gh<_i75.GetCrudActivitiesUseCase>(),
        gh<_i245.UpdateActivityCrudUseCase>(),
        gh<_i865.AddActivityCrudUseCase>(),
        gh<_i327.GetActivityTypesUseCase>(),
        gh<_i947.GetSubscribedClientsUseCase>(),
      ));
  gh.lazySingleton<_i855.TaskCubit>(() => _i855.TaskCubit(
        gh<_i111.AddTaskUsecase>(),
        gh<_i439.GetTasksUsecase>(),
        gh<_i831.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i301.UsersCubit>(() => _i301.UsersCubit(
        gh<_i18.GetUsersUsecase>(),
        gh<_i653.GetUserByIdUsecase>(),
        gh<_i1001.ActionUserUsecase>(),
        gh<_i526.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i944.GetManagesForUserUsecase>(),
        gh<_i1026.GetLevelsForUserUsecase>(),
        gh<_i62.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i815.CompanyCubit>(() => _i815.CompanyCubit(
        gh<_i521.GetCommentUsecase>(),
        gh<_i520.AddCommentUsecase>(),
      ));
  gh.factory<_i566.ClientsDebtsCubit>(
      () => _i566.ClientsDebtsCubit(gh<_i699.GetClientsDebtsUsecase>()));
  gh.factory<_i412.PeriodicCommunicationCubit>(() =>
      _i412.PeriodicCommunicationCubit(
          gh<_i313.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i953.LoginCubit>(() => _i953.LoginCubit(
        gh<_i772.LoginUsecase>(),
        gh<_i959.VerifyOtpUsecase>(),
        gh<_i220.CacheTokenUsecase>(),
        gh<_i882.GetTokenUsecase>(),
        gh<_i518.ValidateTokenUsecase>(),
      ));
  gh.factory<_i1049.AgentsDistributorsProfileBloc>(
      () => _i1049.AgentsDistributorsProfileBloc(
            gh<_i854.GetAgentByIdUsecase>(),
            gh<_i805.GetAgentClientListUsecase>(),
            gh<_i1010.GetAgentInvoiceListUsecase>(),
            gh<_i154.GetParticipateInvoiceByIdUsecase>(),
            gh<_i104.GetAgentCommentsListUsecase>(),
            gh<_i989.AddAgentCommentUsecase>(),
            gh<_i491.DoneTrainingUsecase>(),
            gh<_i1037.AddAgentDateUseCase>(),
            gh<_i405.GetAgentDatesListUsecase>(),
            gh<_i207.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i546.DatesTableCubit>(() => _i546.DatesTableCubit(
        gh<_i438.GetDateInstallationUsecase>(),
        gh<_i883.RescheduleDateUsecase>(),
        gh<_i798.ChangeDateToDonUsecase>(),
        gh<_i803.CancelScheduleUsecase>(),
        gh<_i307.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i824.GetSubscribedClientsUsecase>(),
        gh<_i735.GetInvoicesByClientForDateUsecase>(),
        gh<_i888.AddDateInstallUsecase>(),
        gh<_i989.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i225.ClientsDatesCubit>(
      () => _i225.ClientsDatesCubit(gh<_i555.GetAllClientsDatesUseCase>()));
  gh.factory<_i819.WithdrawnInvoicesCubit>(() =>
      _i819.WithdrawnInvoicesCubit(gh<_i209.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i349.WaitingAgentsCubit>(
      () => _i349.WaitingAgentsCubit(gh<_i941.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i198.AppModule {}
