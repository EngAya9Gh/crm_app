// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i9;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i155;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../../api/api.dart' as _i3;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i59;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i168;
import '../../../features/app/domain/repositories/app_repository.dart' as _i167;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i285;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i351;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i88;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i126;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i150;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i149;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i184;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i185;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i186;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i187;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i188;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i315;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i31;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i46;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i45;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i189;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i273;
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
    as _i36;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i35;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i231;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i350;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i54;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i67;
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
    as _i286;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i146;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i124;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i27;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i38;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i37;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i183;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i326;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i13;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i50;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i49;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i97;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i245;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i20;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i158;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i157;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i247;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i321;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i51;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i162;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i161;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i200;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i294;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i40;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i214;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i213;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i331;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i379;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i33;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i43;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i42;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i195;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i293;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i26;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i104;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i103;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i254;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i355;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i60;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i141;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i140;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i181;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i317;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i89;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i96;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i95;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i196;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i335;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i65;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i116;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i115;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i117;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i230;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i71;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i106;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i105;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i217;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i312;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i110;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i180;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i179;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i203;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i204;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i205;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i206;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i207;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i208;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i209;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i302;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i153;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i311;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i310;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i322;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i329;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i64;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i80;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i79;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i111;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i232;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i66;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i130;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i129;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i280;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i281;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i324;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i83;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i191;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i190;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i291;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i292;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i330;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i53;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i52;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i108;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i109;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i125;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i164;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i163;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i170;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i169;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i199;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i56;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i82;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i81;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i94;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i220;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i221;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i222;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i223;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i383;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i44;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i226;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i225;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i343;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i274;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i344;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i275;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i345;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i346;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i277;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i276;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i347;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i348;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i349;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i358;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i17;
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
    as _i307;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i47;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i212;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i211;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i332;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i378;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i61;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i234;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i233;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i257;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i258;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i259;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i333;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i260;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i264;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i334;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i261;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i262;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i263;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i269;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i265;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i266;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i267;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i268;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i376;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i57;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i249;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i248;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i300;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i328;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i48;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i85;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i84;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i142;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i173;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i133;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i288;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i287;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i323;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i360;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i15;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i87;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i86;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i112;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i244;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i62;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i198;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i197;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i318;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i319;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i377;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i107;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i175;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i174;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i250;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i304;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i58;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i93;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i92;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i278;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i279;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i357;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i114;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i137;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i136;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i210;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i182;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i316;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i134;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i160;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i159;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i306;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i359;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i21;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i100;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i145;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i172;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i202;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i228;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i201;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i227;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i336;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i305;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i296;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i271;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i299;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i337;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i338;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i339;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i340;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i341;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i342;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i272;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i297;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i314;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i370;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i356;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i63;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i216;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i215;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i252;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i253;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i295;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i39;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i132;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i131;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i235;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i236;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i243;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i237;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i238;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i239;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i240;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i241;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i242;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i327;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i73;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i72;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i156;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i303;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i32;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i148;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i147;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i251;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i301;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i41;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i128;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i127;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i246;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i270;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i18;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i144;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i143;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i229;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i353;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i70;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i69;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i177;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i313;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i135;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i309;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i308;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i354;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i381;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i22;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i99;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i98;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i102;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i282;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i151;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i284;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i283;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i362;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i363;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i364;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i365;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i366;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i367;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i368;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i369;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i380;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i14;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i77;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i76;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i152;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i176;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i34;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i166;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i165;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i298;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i320;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i10;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i75;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i74;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i78;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i138;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i55;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i219;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i218;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i224;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i325;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i139;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i256;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i255;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i352;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i382;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i101;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i290;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i289;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i371;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i372;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i373;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i374;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i375;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i361;
import '../api/api_services.dart' as _i4;
import '../api/dio/dio_services.dart' as _i5;
import '../cache_services/cache_services.dart' as _i7;
import '../cache_services/prefs_consumer.dart' as _i11;
import '../cache_services/secure_storage_consumer.dart' as _i8;
import '../maps/location_services.dart' as _i154;

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
  gh.lazySingleton<_i3.Api>(() => _i3.Api());
  gh.singleton<_i4.ApiServices>(() => _i5.DioServices(gh<_i6.Dio>()));
  gh.singleton<_i7.CacheServices>(
    () => _i8.SecureStorageConsumer(gh<_i9.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i10.SupportClientsAcceptDatasource>(
      () => _i10.SupportClientsAcceptDatasourceImpl(gh<_i4.ApiServices>()));
  gh.singleton<_i7.CacheServices>(
      () => _i11.PrefsConsumer(gh<_i12.SharedPreferences>()));
  gh.lazySingleton<_i13.EvaluationLevelReportDatasource>(
      () => _i13.EvaluationLevelReportDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i14.DelayAfterInstallDatasource>(
      () => _i14.DelayAfterInstallDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i15.PendingInvoicesDatasource>(
      () => _i15.PendingInvoicesDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i16.PrivilegesDatasource>(
      () => _i16.PrivilegesDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i17.NotificationsDatasource>(
      () => _i17.NotificationsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i18.ProductsSalesReportsDatasource>(
      () => _i18.ProductsSalesReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i19.LevelsDatasource>(
      () => _i19.LevelsDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i20.GreetingCommunicationDatasource>(
      () => _i20.GreetingCommunicationDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i21.AgentsDistributorsActionsDataSource>(() =>
      _i21.AgentsDistributorsActionsDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i22.ClientsInstallReportsDatasource>(
      () => _i22.ClientsInstallReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i23.RegionsSalesReportsDatasource>(
      () => _i23.RegionsSalesReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i24.ClientsDebtsReportsDatasource>(
      () => _i24.ClientsDebtsReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i25.NotUsingSystemDatasource>(
      () => _i25.NotUsingSystemDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i26.PreviousRatingsDatasource>(
      () => _i26.PreviousRatingsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i27.WrongNumbersDatasource>(
      () => _i27.WrongNumbersDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i28.ClientsCareReportsDatasource>(
      () => _i28.ClientsCareReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i29.NotificationsRepo>(
      () => _i30.NotificationsRepoImpl(gh<_i17.NotificationsDatasource>()));
  gh.lazySingleton<_i31.ClientsAcceptDatasource>(
      () => _i31.ClientsAcceptDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i32.ClientsStatusReportsDatasource>(
      () => _i32.ClientsStatusReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i33.PeriodicCommunicationReportsDatasource>(() =>
      _i33.PeriodicCommunicationReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i34.DelayInstallReportsDatasource>(
      () => _i34.DelayInstallReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i35.NotUsingSystemRepo>(
      () => _i36.NotUsingSystemRepoImpl(gh<_i25.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i37.WrongNumbersRepo>(
      () => _i38.WrongNumbersRepoImpl(gh<_i27.WrongNumbersDatasource>()));
  gh.lazySingleton<_i39.ParticipatesListDatasource>(
      () => _i39.ParticipatesListDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i40.PeriodicCommunicationDatasource>(
      () => _i40.PeriodicCommunicationDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i41.EmployeesSalesReportsDatasource>(
      () => _i41.EmployeesSalesReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i42.PeriodicCommunicationReportsRepo>(() =>
      _i43.PeriodicCommunicationReportsRepoImpl(
          gh<_i33.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i44.ManageWithdrawalsDatasource>(
      () => _i44.ManageWithdrawalsDatasource(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i45.ClientsAcceptRepository>(() =>
      _i46.ClientsAcceptRepositoryImpl(gh<_i31.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i47.ClientsDebtsDatasource>(
      () => _i47.ClientsDebtsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i48.FinancePendingDatasource>(
      () => _i48.FinancePendingDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i49.EvaluationLevelReportRepo>(() =>
      _i50.EvaluationLevelReportRepoImpl(
          gh<_i13.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i51.InstallQualityDatasource>(
      () => _i51.InstallQualityDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i52.LevelsRepo>(
      () => _i53.LevelsRepoImpl(gh<_i19.LevelsDatasource>()));
  gh.lazySingleton<_i54.TicketsDataSource>(
      () => _i54.TicketsDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i55.SupportClientsInvoicesDatasource>(
      () => _i55.DelayInstallReportsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i56.UsersDatasource>(
      () => _i56.UsersDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i57.ClientsTransferApprovalsDatasource>(
      () => _i57.ClientsTransferApprovalsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i58.ExceededClientsDatasource>(
      () => _i58.ExceededClientsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.factory<_i59.AppDatasource>(
      () => _i59.AppDatasource(gh<_i4.ApiServices>()));
  gh.factory<_i60.SpecialClientsDatasource>(
      () => _i60.SpecialClientsDatasource(gh<_i4.ApiServices>()));
  gh.factory<_i61.ClientsListDatasource>(
      () => _i61.ClientsListDatasource(gh<_i4.ApiServices>()));
  gh.factory<_i62.CommentCompanyDatasource>(
      () => _i62.CommentCompanyDatasource(gh<_i4.ApiServices>()));
  gh.factory<_i63.ImportantLinksDatasource>(
      () => _i63.ImportantLinksDatasource(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i64.UsersDatasource>(
      () => _i64.UsersDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i65.CitiesDatasource>(
      () => _i65.CitiesDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i66.AdvancedConfigsDatasource>(
      () => _i66.AdvancedConfigsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i67.TicketsRepo>(
      () => _i68.TicketsRepoImpl(gh<_i54.TicketsDataSource>()));
  gh.lazySingleton<_i69.RegionsSalesReportsRepo>(() =>
      _i70.RegionsSalesReportsRepoImpl(
          gh<_i23.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i71.ClientLogsTabDataSource>(
      () => _i71.SupportTabDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i72.ClientsDebtsReportsRepo>(() =>
      _i73.ClientsDebtsReportsRepoImpl(
          gh<_i24.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i74.SupportClientsAcceptRepository>(() =>
      _i75.SupportClientsAcceptRepositoryImpl(
          gh<_i10.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i76.DelayAfterInstallRepo>(() =>
      _i77.DelayAfterInstallRepoImpl(gh<_i14.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i78.GetSupportClientsAcceptUseCase>(() =>
      _i78.GetSupportClientsAcceptUseCase(
          gh<_i74.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i79.UsersRepository>(
      () => _i80.UsersRepositoryImpl(gh<_i64.UsersDatasource>()));
  gh.lazySingleton<_i81.UsersRepository>(
      () => _i82.UsersRepositoryImpl(gh<_i56.UsersDatasource>()));
  gh.lazySingleton<_i83.GeneralConfigsDatasource>(
      () => _i83.GeneralConfigsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i84.FinancePendingRepo>(
      () => _i85.FinancePendingRepoImpl(gh<_i48.FinancePendingDatasource>()));
  gh.lazySingleton<_i86.PendingInvoicesRepo>(
      () => _i87.PendingInvoicesRepoImpl(gh<_i15.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i88.LoginLocalDataSource>(() =>
      _i88.LoginLocalDataSourceImpl(
          gh<_i7.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i89.BranchesDatasource>(
      () => _i89.BranchesDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i90.ClientsCareReportsRepo>(() =>
      _i91.ClientsCareReportsRepoImpl(gh<_i28.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i92.ExceededClientsRepo>(
      () => _i93.ExceededClientsRepoImpl(gh<_i58.ExceededClientsDatasource>()));
  gh.factory<_i94.ActionUserUsecase>(
      () => _i94.ActionUserUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i95.BranchesRepository>(
      () => _i96.BranchesRepositoryImpl(gh<_i89.BranchesDatasource>()));
  gh.lazySingleton<_i97.GetEvaluationLevelReportUsecase>(() =>
      _i97.GetEvaluationLevelReportUsecase(
          gh<_i49.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i98.ClientsInstallReportsRepo>(() =>
      _i99.ClientsInstallReportsRepoImpl(
          gh<_i22.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i100.AgentsDistributorsDataSource>(
      () => _i100.AgentsDistributorsDataSourceImpl(gh<_i4.ApiServices>()));
  gh.factory<_i101.TaskDatasource>(
      () => _i101.TaskDatasource(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i102.GetClientsInstallReportsUsecase>(() =>
      _i102.GetClientsInstallReportsUsecase(
          gh<_i98.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i103.PreviousRatingsRepo>(() =>
      _i104.PreviousRatingsRepoImpl(gh<_i26.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i105.ClientLogsTabRepo>(
      () => _i106.ClientLogsTabRepoImpl(gh<_i71.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i107.DeletedInvoicesDatasource>(
      () => _i107.DeletedInvoicesDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i108.AddLevelUsecase>(
      () => _i108.AddLevelUsecase(gh<_i52.LevelsRepo>()));
  gh.lazySingleton<_i109.GetLevelsUsecase>(
      () => _i109.GetLevelsUsecase(gh<_i52.LevelsRepo>()));
  gh.lazySingleton<_i110.SupportTabDataSource>(
      () => _i110.SupportTabDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i111.GetUsersUsecase>(
      () => _i111.GetUsersUsecase(gh<_i79.UsersRepository>()));
  gh.lazySingleton<_i112.GetPendingInvoicesUsecase>(
      () => _i112.GetPendingInvoicesUsecase(gh<_i86.PendingInvoicesRepo>()));
  gh.lazySingleton<_i113.GetClientsCareReportsUsecase>(() =>
      _i113.GetClientsCareReportsUsecase(gh<_i90.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i114.InvoicesTabDataSource>(
      () => _i114.InvoicesTabDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i115.CitiesRepository>(
      () => _i116.CitiesRepositoryImpl(gh<_i65.CitiesDatasource>()));
  gh.lazySingleton<_i117.GetCitiesUseCase>(
      () => _i117.GetCitiesUseCase(gh<_i115.CitiesRepository>()));
  gh.lazySingleton<_i118.AddTicketUseCase>(
      () => _i118.AddTicketUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i119.EditTicketTypeUseCase>(
      () => _i119.EditTicketTypeUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i120.GetClientTicketsUseCase>(
      () => _i120.GetClientTicketsUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i121.GetTicketsUseCase>(
      () => _i121.GetTicketsUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i122.GetTicketByIdUseCase>(
      () => _i122.GetTicketByIdUseCase(gh<_i67.TicketsRepo>()));
  gh.lazySingleton<_i123.TransferTicketUseCase>(
      () => _i123.TransferTicketUseCase(gh<_i67.TicketsRepo>()));
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
      () => _i126.LoginRemoteDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i127.EmployeesSalesReportsRepo>(() =>
      _i128.EmployeesSalesReportsRepoImpl(
          gh<_i41.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i129.AdvancedConfigsRepository>(() =>
      _i130.AdvancedConfigsRepositoryImpl(
          gh<_i66.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i131.ParticipateListRepository>(() =>
      _i132.ParticipateListRepositoryImpl(
          gh<_i39.ParticipatesListDatasource>()));
  gh.lazySingleton<_i133.LatestClientsUpdatesDatasource>(
      () => _i133.LatestClientsUpdatesDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i134.ManageWithdrawnInvoicesDataSource>(
      () => _i134.ManageWithdrawnInvoicesDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i135.WithdrawnInvoicesDataSource>(
      () => _i135.WithdrawnInvoicesDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i136.InvoicesSectionRepo>(
      () => _i137.InvoicesTabRepoImpl(gh<_i114.InvoicesTabDataSource>()));
  gh.factory<_i138.SupportClientsAcceptCubit>(() =>
      _i138.SupportClientsAcceptCubit(
          gh<_i78.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i139.WaitingAgentsDataSource>(
      () => _i139.WaitingAgentsDataSourceImpl(gh<_i4.ApiServices>()));
  gh.factory<_i140.SpecialClientsRepository>(() =>
      _i141.SpecialClientsRepositoryImpl(gh<_i60.SpecialClientsDatasource>()));
  gh.lazySingleton<_i142.GetFinancePendingInvoicesUsecase>(() =>
      _i142.GetFinancePendingInvoicesUsecase(gh<_i84.FinancePendingRepo>()));
  gh.lazySingleton<_i143.ProductsSalesReportsRepo>(() =>
      _i144.ProductsSalesReportsRepoImpl(
          gh<_i18.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i145.AgentsDistributorsProfileDataSource>(() =>
      _i145.AgentsDistributorsProfileDataSourceImpl(gh<_i4.ApiServices>()));
  gh.factory<_i146.EditTicketCubit>(() => _i146.EditTicketCubit(
        gh<_i119.EditTicketTypeUseCase>(),
        gh<_i123.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i147.ClientsStatusReportsRepo>(() =>
      _i148.ClientsStatusReportsRepoImpl(
          gh<_i32.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i149.LoginRepo>(() => _i150.LoginRepoImpl(
        gh<_i126.LoginRemoteDataSource>(),
        gh<_i88.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i151.DatesTableDataSource>(
      () => _i151.DatesTableDataSourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i152.GetDelayAfterInstallUseCase>(() =>
      _i152.GetDelayAfterInstallUseCase(gh<_i76.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i153.RegionsDatasource>(
      () => _i153.RegionsDatasourceImpl(gh<_i4.ApiServices>()));
  gh.lazySingleton<_i154.LocationServices>(
      () => _i154.LocationServices(gh<_i155.Location>()));
  gh.lazySingleton<_i156.GetClientsDebtsReportsUsecase>(() =>
      _i156.GetClientsDebtsReportsUsecase(gh<_i72.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i157.GreetingCommunicationRepo>(() =>
      _i158.GreetingCommunicationRepoImpl(
          gh<_i20.GreetingCommunicationDatasource>()));
  gh.lazySingleton<_i159.ManageWithdrawnInvoicesRepo>(() =>
      _i160.ManageWithdrawnInvoicesRepoImpl(
          gh<_i134.ManageWithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i161.InstallQualityRepo>(
      () => _i162.InstallQualityRepoImpl(gh<_i51.InstallQualityDatasource>()));
  gh.lazySingleton<_i163.PrivilegesRepo>(
      () => _i164.PrivilegesRepoImpl(gh<_i16.PrivilegesDatasource>()));
  gh.lazySingleton<_i165.DelayInstallReportsRepo>(() =>
      _i166.DelayInstallReportsRepoImpl(
          gh<_i34.DelayInstallReportsDatasource>()));
  gh.factory<_i167.AppRepository>(
      () => _i168.AppRepositoryImpl(gh<_i59.AppDatasource>()));
  gh.factory<_i169.UpdatePrivilegesUsecase>(
      () => _i169.UpdatePrivilegesUsecase(gh<_i163.PrivilegesRepo>()));
  gh.lazySingleton<_i170.GetPrivilegesUsecase>(
      () => _i170.GetPrivilegesUsecase(gh<_i163.PrivilegesRepo>()));
  gh.lazySingleton<_i171.AgentsDistributorsActionsRepo>(() =>
      _i172.AgentsDistributorsActionsRepoImpl(
          gh<_i21.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i173.FinancePendingCubit>(() =>
      _i173.FinancePendingCubit(gh<_i142.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i174.DeletedInvoicesRepo>(() =>
      _i175.DeletedInvoicesRepoImpl(gh<_i107.DeletedInvoicesDatasource>()));
  gh.factory<_i176.DelayAfterInstallCubit>(() =>
      _i176.DelayAfterInstallCubit(gh<_i152.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i177.GetRegionsSalesReportsUsecase>(() =>
      _i177.GetRegionsSalesReportsUsecase(gh<_i69.RegionsSalesReportsRepo>()));
  gh.factory<_i178.ClientsCareReportsCubit>(() =>
      _i178.ClientsCareReportsCubit(gh<_i113.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i179.SupportTabRepo>(
      () => _i180.SupportTabRepoImpl(gh<_i110.SupportTabDataSource>()));
  gh.factory<_i181.GetSpecialClientsUsecase>(() =>
      _i181.GetSpecialClientsUsecase(gh<_i140.SpecialClientsRepository>()));
  gh.lazySingleton<_i182.GetInvoicesByPrivilegesUsecase>(() =>
      _i182.GetInvoicesByPrivilegesUsecase(gh<_i136.InvoicesSectionRepo>()));
  gh.lazySingleton<_i183.GetWrongNumbersUsecase>(
      () => _i183.GetWrongNumbersUsecase(gh<_i37.WrongNumbersRepo>()));
  gh.lazySingleton<_i184.CacheTokenUsecase>(
      () => _i184.CacheTokenUsecase(gh<_i149.LoginRepo>()));
  gh.lazySingleton<_i185.GetTokenUsecase>(
      () => _i185.GetTokenUsecase(gh<_i149.LoginRepo>()));
  gh.lazySingleton<_i186.LoginUsecase>(
      () => _i186.LoginUsecase(gh<_i149.LoginRepo>()));
  gh.lazySingleton<_i187.ValidateTokenUsecase>(
      () => _i187.ValidateTokenUsecase(gh<_i149.LoginRepo>()));
  gh.lazySingleton<_i188.VerifyOtpUsecase>(
      () => _i188.VerifyOtpUsecase(gh<_i149.LoginRepo>()));
  gh.lazySingleton<_i189.GetClientsAcceptUseCase>(
      () => _i189.GetClientsAcceptUseCase(gh<_i45.ClientsAcceptRepository>()));
  gh.lazySingleton<_i190.GeneralConfigsRepository>(() =>
      _i191.GeneralConfigsRepositoryImpl(gh<_i83.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i192.GetNotificationsUsecase>(
      () => _i192.GetNotificationsUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i193.GetUnreadNotificationsCountUsecase>(() =>
      _i193.GetUnreadNotificationsCountUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i194.MarkNotificationsAsReadUsecase>(
      () => _i194.MarkNotificationsAsReadUsecase(gh<_i29.NotificationsRepo>()));
  gh.lazySingleton<_i195.GetPeriodicCommunicationReportsUsecase>(() =>
      _i195.GetPeriodicCommunicationReportsUsecase(
          gh<_i42.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i196.GetBranchesByIdCountryUseCase>(
      () => _i196.GetBranchesByIdCountryUseCase(gh<_i95.BranchesRepository>()));
  gh.factory<_i197.CompanyRepository>(
      () => _i198.CompanyRepositoryImpl(gh<_i62.CommentCompanyDatasource>()));
  gh.singleton<_i199.PrivilegesCubit>(() => _i199.PrivilegesCubit(
        gh<_i170.GetPrivilegesUsecase>(),
        gh<_i169.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i200.GetInstallUseCase>(
      () => _i200.GetInstallUseCase(gh<_i161.InstallQualityRepo>()));
  gh.lazySingleton<_i201.AgentsDistributorsProfileRepo>(() =>
      _i202.AgentsDistributorsProfileRepoImpl(
          gh<_i145.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i203.AddDateInstallUsecase>(
      () => _i203.AddDateInstallUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i204.CancelDateInstallUsecase>(
      () => _i204.CancelDateInstallUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i205.GetInvoiceByClientUsecase>(
      () => _i205.GetInvoiceByClientUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i206.ReceiveDeviceUsecase>(
      () => _i206.ReceiveDeviceUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i207.ReturnInvoiceApproveUsecase>(
      () => _i207.ReturnInvoiceApproveUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i208.SetDateDoneUsecase>(
      () => _i208.SetDateDoneUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i209.SetReadyInstallUsecase>(
      () => _i209.SetReadyInstallUsecase(gh<_i179.SupportTabRepo>()));
  gh.lazySingleton<_i210.GetAllUsersUseCase>(
      () => _i210.GetAllUsersUseCase(gh<_i136.InvoicesSectionRepo>()));
  gh.lazySingleton<_i211.ClientsDebtsRepo>(
      () => _i212.ClientsDebtsRepoImpl(gh<_i47.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i213.PeriodicCommunicationRepo>(() =>
      _i214.PeriodicCommunicationRepoImpl(
          gh<_i40.PeriodicCommunicationDatasource>()));
  gh.factory<_i215.ImportantLinksRepo>(
      () => _i216.ImportantLinksRepoImpl(gh<_i63.ImportantLinksDatasource>()));
  gh.lazySingleton<_i217.GetClientLogsUsecase>(
      () => _i217.GetClientLogsUsecase(gh<_i105.ClientLogsTabRepo>()));
  gh.lazySingleton<_i218.SupportClientsInvoicesRepo>(() =>
      _i219.SupportClientsInvoicesRepoImpl(
          gh<_i55.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i220.GetBranchesForUserUsecase>(
      () => _i220.GetBranchesForUserUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i221.GetLevelsForUserUsecase>(
      () => _i221.GetLevelsForUserUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i222.GetManagesForUserUsecase>(
      () => _i222.GetManagesForUserUsecase(gh<_i81.UsersRepository>()));
  gh.factory<_i223.GetUsersUsecase>(
      () => _i223.GetUsersUsecase(gh<_i81.UsersRepository>()));
  gh.lazySingleton<_i224.GetSupportClientsInvoicesUseCase>(() =>
      _i224.GetSupportClientsInvoicesUseCase(
          gh<_i218.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i225.ManageWithdrawalsRepository>(() =>
      _i226.ManageWithdrawalsRepositoryImpl(
          gh<_i44.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i227.AgentsDistributorsRepo>(() =>
      _i228.AgentsDistributorsRepoImpl(
          gh<_i100.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i229.GetProductsSalesReportsUsecase>(() =>
      _i229.GetProductsSalesReportsUsecase(
          gh<_i143.ProductsSalesReportsRepo>()));
  gh.singleton<_i230.CitiesCubit>(
      () => _i230.CitiesCubit(gh<_i117.GetCitiesUseCase>()));
  gh.lazySingleton<_i231.GetNotUsingSystemUsecase>(
      () => _i231.GetNotUsingSystemUsecase(gh<_i35.NotUsingSystemRepo>()));
  gh.factory<_i232.UsersTypeCubit>(
      () => _i232.UsersTypeCubit(gh<_i111.GetUsersUsecase>()));
  gh.factory<_i233.ClientsListRepository>(
      () => _i234.ClientsListRepositoryImpl(gh<_i61.ClientsListDatasource>()));
  gh.factory<_i235.AddParticipateCommentUsecase>(() =>
      _i235.AddParticipateCommentUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i236.AddParticipateUserUsecase>(() =>
      _i236.AddParticipateUserUsecase(gh<_i131.ParticipateListRepository>()));
  gh.factory<_i237.EditParticipateUserUsecase>(() =>
      _i237.EditParticipateUserUsecase(gh<_i131.ParticipateListRepository>()));
  gh.factory<_i238.GetInvoiceByIdUsecase>(
      () => _i238.GetInvoiceByIdUsecase(gh<_i131.ParticipateListRepository>()));
  gh.factory<_i239.ParticipateClientListUsecase>(() =>
      _i239.ParticipateClientListUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i240.ParticipateCommentListUsecase>(() =>
      _i240.ParticipateCommentListUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i241.ParticipateInvoiceListUsecase>(() =>
      _i241.ParticipateInvoiceListUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i242.ParticipateListUsecase>(() =>
      _i242.ParticipateListUsecase(gh<_i131.ParticipateListRepository>()));
  gh.lazySingleton<_i243.ChangeParticipateStatusUsecase>(() =>
      _i243.ChangeParticipateStatusUsecase(
          gh<_i131.ParticipateListRepository>()));
  gh.factory<_i244.PendingInvoicesCubit>(
      () => _i244.PendingInvoicesCubit(gh<_i112.GetPendingInvoicesUsecase>()));
  gh.factory<_i245.EvaluationLevelReportCubit>(() =>
      _i245.EvaluationLevelReportCubit(
          gh<_i97.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i246.GetEmployeesSalesReportsUsecase>(() =>
      _i246.GetEmployeesSalesReportsUsecase(
          gh<_i127.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i247.GetGreetingCommunicationUseCase>(() =>
      _i247.GetGreetingCommunicationUseCase(
          gh<_i157.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i248.ClientsTransferApprovalsRepo>(() =>
      _i249.ClientsTransferApprovalsRepoImpl(
          gh<_i57.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i250.GetDeletedInvoicesUsecase>(
      () => _i250.GetDeletedInvoicesUsecase(gh<_i174.DeletedInvoicesRepo>()));
  gh.lazySingleton<_i251.GetClientsStatusReportsUsecase>(() =>
      _i251.GetClientsStatusReportsUsecase(
          gh<_i147.ClientsStatusReportsRepo>()));
  gh.factory<_i252.ActionLinkUsecase>(
      () => _i252.ActionLinkUsecase(gh<_i215.ImportantLinksRepo>()));
  gh.factory<_i253.GetImportantLinksUsecase>(
      () => _i253.GetImportantLinksUsecase(gh<_i215.ImportantLinksRepo>()));
  gh.lazySingleton<_i254.GetPreviousRatingsUsecase>(
      () => _i254.GetPreviousRatingsUsecase(gh<_i103.PreviousRatingsRepo>()));
  gh.lazySingleton<_i255.WaitingAgentsRepo>(
      () => _i256.WaitingAgentsRepoImpl(gh<_i139.WaitingAgentsDataSource>()));
  gh.factory<_i257.AddClientUserUsecase>(
      () => _i257.AddClientUserUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i258.ApproveRejectClientUsecase>(() =>
      _i258.ApproveRejectClientUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i259.ChangeTypeClientUsecase>(
      () => _i259.ChangeTypeClientUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i260.EditClientUserUsecase>(
      () => _i260.EditClientUserUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i261.GetClientsListByRegionUseCase>(() =>
      _i261.GetClientsListByRegionUseCase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i262.GetClientsListByUserUseCase>(() =>
      _i262.GetClientsListByUserUseCase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i263.GetClientsWithFilterUserUsecase>(() =>
      _i263.GetClientsWithFilterUserUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i264.GetClientMarketingReportUsecase>(() =>
      _i264.GetClientMarketingReportUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i265.GetRecommendedClientsUsecase>(() =>
      _i265.GetRecommendedClientsUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i266.GetSimilarClientsUsecase>(
      () => _i266.GetSimilarClientsUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i267.ReceiveClientUserUsecase>(
      () => _i267.ReceiveClientUserUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i268.TransferClientUserUsecase>(
      () => _i268.TransferClientUserUsecase(gh<_i233.ClientsListRepository>()));
  gh.lazySingleton<_i269.GetHighSimilarClientsUsecase>(() =>
      _i269.GetHighSimilarClientsUsecase(gh<_i233.ClientsListRepository>()));
  gh.factory<_i270.EmployeesSalesReportsCubit>(() =>
      _i270.EmployeesSalesReportsCubit(
          gh<_i246.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i271.ChangeStateAgentUseCase>(
      () => _i271.ChangeStateAgentUseCase(gh<_i227.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i272.GetAgentsAndDistributorsUseCase>(() =>
      _i272.GetAgentsAndDistributorsUseCase(
          gh<_i227.AgentsDistributorsRepo>()));
  gh.factory<_i273.ClientsAcceptCubit>(
      () => _i273.ClientsAcceptCubit(gh<_i189.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i274.CancelWithdrawalUsecase>(() =>
      _i274.CancelWithdrawalUsecase(gh<_i225.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i275.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i275.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i225.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i276.GetWithdrawalsInvoicesUsecase>(() =>
      _i276.GetWithdrawalsInvoicesUsecase(
          gh<_i225.ManageWithdrawalsRepository>()));
  gh.factory<_i277.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i277.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i225.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i278.ExceededClientsUseCase>(
      () => _i278.ExceededClientsUseCase(gh<_i92.ExceededClientsRepo>()));
  gh.lazySingleton<_i279.TransferExceededClientsUseCase>(() =>
      _i279.TransferExceededClientsUseCase(gh<_i92.ExceededClientsRepo>()));
  gh.lazySingleton<_i280.EditAdvancedConfigsUsecase>(() =>
      _i280.EditAdvancedConfigsUsecase(gh<_i129.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i281.GetAdvancedConfigsUsecase>(() =>
      _i281.GetAdvancedConfigsUsecase(gh<_i129.AdvancedConfigsRepository>()));
  gh.factory<_i282.ClientsInstallReportsCubit>(() =>
      _i282.ClientsInstallReportsCubit(
          gh<_i102.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i283.DatesTableRepo>(
      () => _i284.DatesTableRepoImpl(gh<_i151.DatesTableDataSource>()));
  gh.factory<_i285.GetVersionUseCase>(
      () => _i285.GetVersionUseCase(gh<_i167.AppRepository>()));
  gh.factory<_i286.AddTicketCubit>(
      () => _i286.AddTicketCubit(gh<_i118.AddTicketUseCase>()));
  gh.lazySingleton<_i287.LatestClientsUpdatesRepository>(() =>
      _i288.LatestClientsUpdatesRepositoryImpl(
          gh<_i133.LatestClientsUpdatesDatasource>()));
  gh.factory<_i289.TaskRepository>(
      () => _i290.TaskRepositoryImpl(gh<_i101.TaskDatasource>()));
  gh.lazySingleton<_i291.EditGeneralConfigsUsecase>(() =>
      _i291.EditGeneralConfigsUsecase(gh<_i190.GeneralConfigsRepository>()));
  gh.lazySingleton<_i292.GetGeneralConfigsUsecase>(() =>
      _i292.GetGeneralConfigsUsecase(gh<_i190.GeneralConfigsRepository>()));
  gh.factory<_i293.PeriodicCommunicationReportsCubit>(() =>
      _i293.PeriodicCommunicationReportsCubit(
          gh<_i195.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i294.InstallQualityCubit>(
      () => _i294.InstallQualityCubit(gh<_i200.GetInstallUseCase>()));
  gh.factory<_i295.ImportantLinksCubit>(() => _i295.ImportantLinksCubit(
        gh<_i253.GetImportantLinksUsecase>(),
        gh<_i252.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i296.AddAgentUseCase>(
      () => _i296.AddAgentUseCase(gh<_i171.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i297.UpdateAgentUseCase>(() =>
      _i297.UpdateAgentUseCase(gh<_i171.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i298.GetDelayInstallReportsUseCase>(() =>
      _i298.GetDelayInstallReportsUseCase(gh<_i165.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i299.CrudAgentSupportFilesUsecase>(() =>
      _i299.CrudAgentSupportFilesUsecase(
          gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i300.GetClientsTransferApprovalsUsecase>(() =>
      _i300.GetClientsTransferApprovalsUsecase(
          gh<_i248.ClientsTransferApprovalsRepo>()));
  gh.factory<_i301.ClientsStatusReportsCubit>(() =>
      _i301.ClientsStatusReportsCubit(
          gh<_i251.GetClientsStatusReportsUsecase>()));
  gh.factory<_i302.SupportTabCubit>(() => _i302.SupportTabCubit(
        gh<_i205.GetInvoiceByClientUsecase>(),
        gh<_i203.AddDateInstallUsecase>(),
        gh<_i208.SetDateDoneUsecase>(),
        gh<_i209.SetReadyInstallUsecase>(),
        gh<_i207.ReturnInvoiceApproveUsecase>(),
        gh<_i206.ReceiveDeviceUsecase>(),
        gh<_i204.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i303.ClientsDebtsReportsCubit>(() =>
      _i303.ClientsDebtsReportsCubit(
          gh<_i156.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i304.DeletedInvoicesCubit>(
      () => _i304.DeletedInvoicesCubit(gh<_i250.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i305.AddAgentDateUseCase>(() =>
      _i305.AddAgentDateUseCase(gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i306.GetManageWithdrawnInvoicesUsecase>(() =>
      _i306.GetManageWithdrawnInvoicesUsecase(
          gh<_i159.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i307.NotificationsCubit>(() => _i307.NotificationsCubit(
        gh<_i192.GetNotificationsUsecase>(),
        gh<_i194.MarkNotificationsAsReadUsecase>(),
        gh<_i193.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i308.WithdrawnInvoicesRepo>(() =>
      _i309.WithdrawnInvoicesRepoImpl(gh<_i135.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i310.RegionsRepository>(
      () => _i311.RegionsRepositoryImpl(gh<_i153.RegionsDatasource>()));
  gh.factory<_i312.ClientLogsTabCubit>(
      () => _i312.ClientLogsTabCubit(gh<_i217.GetClientLogsUsecase>()));
  gh.factory<_i313.RegionsSalesReportsCubit>(() =>
      _i313.RegionsSalesReportsCubit(
          gh<_i177.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i314.AgentsDistributorsActionsCubit>(
      () => _i314.AgentsDistributorsActionsCubit(
            gh<_i117.GetCitiesUseCase>(),
            gh<_i296.AddAgentUseCase>(),
            gh<_i297.UpdateAgentUseCase>(),
          ));
  gh.factory<_i315.LoginCubit>(() => _i315.LoginCubit(
        gh<_i186.LoginUsecase>(),
        gh<_i188.VerifyOtpUsecase>(),
        gh<_i184.CacheTokenUsecase>(),
        gh<_i185.GetTokenUsecase>(),
        gh<_i187.ValidateTokenUsecase>(),
      ));
  gh.factory<_i316.InvoicesSectionCubit>(() => _i316.InvoicesSectionCubit(
        gh<_i182.GetInvoicesByPrivilegesUsecase>(),
        gh<_i272.GetAgentsAndDistributorsUseCase>(),
        gh<_i242.ParticipateListUsecase>(),
        gh<_i210.GetAllUsersUseCase>(),
      ));
  gh.factory<_i317.SpecialClientsBloc>(
      () => _i317.SpecialClientsBloc(gh<_i181.GetSpecialClientsUsecase>()));
  gh.factory<_i318.AddCommentUsecase>(
      () => _i318.AddCommentUsecase(gh<_i197.CompanyRepository>()));
  gh.factory<_i319.GetCommentUsecase>(
      () => _i319.GetCommentUsecase(gh<_i197.CompanyRepository>()));
  gh.factory<_i320.DelayInstallReportsCubit>(() =>
      _i320.DelayInstallReportsCubit(
          gh<_i298.GetDelayInstallReportsUseCase>()));
  gh.factory<_i321.GreetingCommunicationCubit>(() =>
      _i321.GreetingCommunicationCubit(
          gh<_i247.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i322.GetRegionsUseCase>(
      () => _i322.GetRegionsUseCase(gh<_i310.RegionsRepository>()));
  gh.lazySingleton<_i323.GetLatestClientsUseCase>(() =>
      _i323.GetLatestClientsUseCase(
          gh<_i287.LatestClientsUpdatesRepository>()));
  gh.factory<_i324.AdvancedCofigsCubit>(() => _i324.AdvancedCofigsCubit(
        gh<_i281.GetAdvancedConfigsUsecase>(),
        gh<_i280.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i325.SupportClientsInvoicesCubit>(() =>
      _i325.SupportClientsInvoicesCubit(
          gh<_i224.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i326.WrongNumbersCubit>(
      () => _i326.WrongNumbersCubit(gh<_i183.GetWrongNumbersUsecase>()));
  gh.factory<_i327.ParticipateListBloc>(() => _i327.ParticipateListBloc(
        gh<_i242.ParticipateListUsecase>(),
        gh<_i236.AddParticipateUserUsecase>(),
        gh<_i237.EditParticipateUserUsecase>(),
        gh<_i239.ParticipateClientListUsecase>(),
        gh<_i241.ParticipateInvoiceListUsecase>(),
        gh<_i238.GetInvoiceByIdUsecase>(),
        gh<_i240.ParticipateCommentListUsecase>(),
        gh<_i235.AddParticipateCommentUsecase>(),
        gh<_i243.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i328.ClientsTransferApprovalsCubit>(() =>
      _i328.ClientsTransferApprovalsCubit(
          gh<_i300.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i329.RegionsCubit>(
      () => _i329.RegionsCubit(gh<_i322.GetRegionsUseCase>()));
  gh.factory<_i330.GeneralCofigsCubit>(() => _i330.GeneralCofigsCubit(
        gh<_i292.GetGeneralConfigsUsecase>(),
        gh<_i291.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i331.GetPeriodicCommunicationUseCase>(() =>
      _i331.GetPeriodicCommunicationUseCase(
          gh<_i213.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i332.GetClientsDebtsUsecase>(
      () => _i332.GetClientsDebtsUsecase(gh<_i211.ClientsDebtsRepo>()));
  gh.lazySingleton<_i333.CrudClientSupportFilesUsecase>(() =>
      _i333.CrudClientSupportFilesUsecase(
          repository: gh<_i233.ClientsListRepository>()));
  gh.lazySingleton<_i334.GetClientSupportFilesUsecase>(() =>
      _i334.GetClientSupportFilesUsecase(
          repository: gh<_i233.ClientsListRepository>()));
  gh.factory<_i335.BranchesCubit>(
      () => _i335.BranchesCubit(gh<_i196.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i336.AddAgentCommentUsecase>(() =>
      _i336.AddAgentCommentUsecase(gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i337.DoneTrainingUsecase>(() =>
      _i337.DoneTrainingUsecase(gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i338.GetAgentUsecase>(
      () => _i338.GetAgentUsecase(gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i339.GetAgentClientListUsecase>(() =>
      _i339.GetAgentClientListUsecase(
          gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i340.GetAgentCommentsListUsecase>(() =>
      _i340.GetAgentCommentsListUsecase(
          gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i341.GetAgentDatesListUsecase>(() =>
      _i341.GetAgentDatesListUsecase(
          gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i342.GetAgentInvoiceListUsecase>(() =>
      _i342.GetAgentInvoiceListUsecase(
          gh<_i201.AgentsDistributorsProfileRepo>()));
  gh.factory<_i343.AddRejectReasonsUsecase>(() =>
      _i343.AddRejectReasonsUsecase(gh<_i225.ManageWithdrawalsRepository>()));
  gh.factory<_i344.EditRejectReasonsUsecase>(() =>
      _i344.EditRejectReasonsUsecase(gh<_i225.ManageWithdrawalsRepository>()));
  gh.factory<_i345.GetRejectReasonsUsecase>(() =>
      _i345.GetRejectReasonsUsecase(gh<_i225.ManageWithdrawalsRepository>()));
  gh.factory<_i346.GetUserSeriesUsecase>(() =>
      _i346.GetUserSeriesUsecase(gh<_i225.ManageWithdrawalsRepository>()));
  gh.factory<_i347.GetWithdrawnDetailsUsecase>(() =>
      _i347.GetWithdrawnDetailsUsecase(
          gh<_i225.ManageWithdrawalsRepository>()));
  gh.factory<_i348.SetApproveSeriesUsecase>(() =>
      _i348.SetApproveSeriesUsecase(gh<_i225.ManageWithdrawalsRepository>()));
  gh.factory<_i349.UpdateSeriesUsecase>(
      () => _i349.UpdateSeriesUsecase(gh<_i225.ManageWithdrawalsRepository>()));
  gh.factory<_i350.NotUsingSystemCubit>(
      () => _i350.NotUsingSystemCubit(gh<_i231.GetNotUsingSystemUsecase>()));
  gh.singleton<_i351.AppManagerCubit>(
      () => _i351.AppManagerCubit(gh<_i285.GetVersionUseCase>()));
  gh.lazySingleton<_i352.GetWaitingAgentsUsecase>(
      () => _i352.GetWaitingAgentsUsecase(gh<_i255.WaitingAgentsRepo>()));
  gh.factory<_i353.ProductsSalesReportsCubit>(() =>
      _i353.ProductsSalesReportsCubit(
          gh<_i229.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i354.GetWithdrawnInvoicesUsecase>(() =>
      _i354.GetWithdrawnInvoicesUsecase(gh<_i308.WithdrawnInvoicesRepo>()));
  gh.factory<_i355.PreviousRatingsCubit>(
      () => _i355.PreviousRatingsCubit(gh<_i254.GetPreviousRatingsUsecase>()));
  gh.factory<_i356.AgentsDistributorsCubit>(() => _i356.AgentsDistributorsCubit(
        gh<_i272.GetAgentsAndDistributorsUseCase>(),
        gh<_i271.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i357.ExceededClientsCubit>(() => _i357.ExceededClientsCubit(
        gh<_i278.ExceededClientsUseCase>(),
        gh<_i279.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i358.ManageWithdrawalsCubit>(() => _i358.ManageWithdrawalsCubit(
        gh<_i346.GetUserSeriesUsecase>(),
        gh<_i349.UpdateSeriesUsecase>(),
        gh<_i223.GetUsersUsecase>(),
        gh<_i276.GetWithdrawalsInvoicesUsecase>(),
        gh<_i277.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i348.SetApproveSeriesUsecase>(),
        gh<_i347.GetWithdrawnDetailsUsecase>(),
        gh<_i343.AddRejectReasonsUsecase>(),
        gh<_i345.GetRejectReasonsUsecase>(),
        gh<_i344.EditRejectReasonsUsecase>(),
        gh<_i275.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i274.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i359.ManageWithdrawnInvoicesCubit>(() =>
      _i359.ManageWithdrawnInvoicesCubit(
          gh<_i306.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i360.LatestClientsUpdatesCubit>(() =>
      _i360.LatestClientsUpdatesCubit(gh<_i323.GetLatestClientsUseCase>()));
  gh.factory<_i361.AttachmentsRowCubit>(() => _i361.AttachmentsRowCubit(
        gh<_i334.GetClientSupportFilesUsecase>(),
        gh<_i333.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i362.CancelScheduleUsecase>(
      () => _i362.CancelScheduleUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i363.ChangeDateToDonUsecase>(
      () => _i363.ChangeDateToDonUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i364.GetCancelReasonsUsecase>(
      () => _i364.GetCancelReasonsUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i365.GetDateInstallationUsecase>(
      () => _i365.GetDateInstallationUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i366.GetInvoicesByClientForDateUsecase>(() =>
      _i366.GetInvoicesByClientForDateUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i367.GetSubscribedClientsUsecase>(
      () => _i367.GetSubscribedClientsUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i368.RescheduleDateUsecase>(
      () => _i368.RescheduleDateUsecase(gh<_i283.DatesTableRepo>()));
  gh.lazySingleton<_i369.ReturnScheduleVisitToOpenUsecase>(
      () => _i369.ReturnScheduleVisitToOpenUsecase(gh<_i283.DatesTableRepo>()));
  gh.factory<_i370.AgentsDistributorsProfileBloc>(
      () => _i370.AgentsDistributorsProfileBloc(
            gh<_i339.GetAgentClientListUsecase>(),
            gh<_i342.GetAgentInvoiceListUsecase>(),
            gh<_i238.GetInvoiceByIdUsecase>(),
            gh<_i340.GetAgentCommentsListUsecase>(),
            gh<_i336.AddAgentCommentUsecase>(),
            gh<_i337.DoneTrainingUsecase>(),
            gh<_i305.AddAgentDateUseCase>(),
            gh<_i341.GetAgentDatesListUsecase>(),
            gh<_i299.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i371.AddTaskUsecase>(
      () => _i371.AddTaskUsecase(gh<_i289.TaskRepository>()));
  gh.factory<_i372.ChangeStatusTaskUsecase>(
      () => _i372.ChangeStatusTaskUsecase(gh<_i289.TaskRepository>()));
  gh.factory<_i373.GetTasksUsecase>(
      () => _i373.GetTasksUsecase(gh<_i289.TaskRepository>()));
  gh.factory<_i374.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i374.GetUsersByDepartmentAndRegionUsecase(gh<_i289.TaskRepository>()));
  gh.lazySingleton<_i375.TaskCubit>(() => _i375.TaskCubit(
        gh<_i371.AddTaskUsecase>(),
        gh<_i373.GetTasksUsecase>(),
        gh<_i372.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i376.ClientsListBloc>(() => _i376.ClientsListBloc(
        gh<_i263.GetClientsWithFilterUserUsecase>(),
        gh<_i265.GetRecommendedClientsUsecase>(),
        gh<_i257.AddClientUserUsecase>(),
        gh<_i260.EditClientUserUsecase>(),
        gh<_i259.ChangeTypeClientUsecase>(),
        gh<_i266.GetSimilarClientsUsecase>(),
        gh<_i258.ApproveRejectClientUsecase>(),
        gh<_i333.CrudClientSupportFilesUsecase>(),
        gh<_i334.GetClientSupportFilesUsecase>(),
        gh<_i268.TransferClientUserUsecase>(),
        gh<_i267.ReceiveClientUserUsecase>(),
        gh<_i264.GetClientMarketingReportUsecase>(),
        gh<_i269.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i377.CompanyCubit>(() => _i377.CompanyCubit(
        gh<_i319.GetCommentUsecase>(),
        gh<_i318.AddCommentUsecase>(),
      ));
  gh.factory<_i378.ClientsDebtsCubit>(
      () => _i378.ClientsDebtsCubit(gh<_i332.GetClientsDebtsUsecase>()));
  gh.factory<_i379.PeriodicCommunicationCubit>(() =>
      _i379.PeriodicCommunicationCubit(
          gh<_i331.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i380.DatesTableCubit>(() => _i380.DatesTableCubit(
        gh<_i365.GetDateInstallationUsecase>(),
        gh<_i368.RescheduleDateUsecase>(),
        gh<_i363.ChangeDateToDonUsecase>(),
        gh<_i362.CancelScheduleUsecase>(),
        gh<_i369.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i367.GetSubscribedClientsUsecase>(),
        gh<_i366.GetInvoicesByClientForDateUsecase>(),
        gh<_i203.AddDateInstallUsecase>(),
        gh<_i364.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i381.WithdrawnInvoicesCubit>(() =>
      _i381.WithdrawnInvoicesCubit(gh<_i354.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i382.WaitingAgentsCubit>(
      () => _i382.WaitingAgentsCubit(gh<_i352.GetWaitingAgentsUsecase>()));
  gh.factory<_i383.UsersCubit>(() => _i383.UsersCubit(
        gh<_i223.GetUsersUsecase>(),
        gh<_i94.ActionUserUsecase>(),
        gh<_i374.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i222.GetManagesForUserUsecase>(),
        gh<_i221.GetLevelsForUserUsecase>(),
        gh<_i220.GetBranchesForUserUsecase>(),
      ));
  return getIt;
}
