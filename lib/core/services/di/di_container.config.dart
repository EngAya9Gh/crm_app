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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i58;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i166;
import '../../../features/app/domain/repositories/app_repository.dart' as _i165;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i282;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i353;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i276;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i124;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i313;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i312;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i325;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i326;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i327;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i328;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i329;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i382;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i30;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i45;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i44;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i183;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i268;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i27;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i89;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i88;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i111;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i176;
import '../../../features/clients_care/clients_not_using_system/data/data_sources/not_using_system_datasource.dart'
    as _i24;
import '../../../features/clients_care/clients_not_using_system/data/repositories/not_using_system_repo_impl.dart'
    as _i35;
import '../../../features/clients_care/clients_not_using_system/domain/repositories/not_using_system_repo.dart'
    as _i34;
import '../../../features/clients_care/clients_not_using_system/domain/use_cases/get_not_using_system_usecase.dart'
    as _i226;
import '../../../features/clients_care/clients_not_using_system/presentation/manager/not_using_system_cubit.dart'
    as _i352;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i53;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i67;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i66;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i116;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i117;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i118;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i120;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i119;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i121;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i283;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i144;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i122;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i26;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i37;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i36;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i182;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i324;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i49;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i48;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i95;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i240;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i17;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i153;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i152;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i242;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i319;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i50;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i160;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i159;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i194;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i291;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i39;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i208;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i207;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i333;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i381;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i32;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i42;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i41;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i189;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i290;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i25;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i102;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i101;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i249;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i357;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i59;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i139;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i138;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i179;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i314;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i87;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i94;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i93;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i190;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i337;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i64;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i114;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i113;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i115;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i225;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i70;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i104;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i103;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i211;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i309;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i108;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i178;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i177;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i197;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i198;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i199;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i200;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i201;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i202;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i203;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i299;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i149;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i308;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i307;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i320;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i331;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i63;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i79;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i78;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i109;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i227;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i65;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i128;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i127;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i277;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i278;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i322;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i82;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i185;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i184;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i288;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i289;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i332;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i52;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i51;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i106;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i107;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i123;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i13;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i162;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i161;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i168;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i167;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i193;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i55;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i81;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i80;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i92;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i214;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i215;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i216;
import '../../../features/mangement/manage_users/domain/use_cases/get_user_by_id_usecase.dart'
    as _i218;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i217;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i378;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i43;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i221;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i220;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i345;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i269;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i346;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i270;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i347;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i348;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i272;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i271;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i349;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i350;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i351;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i360;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i14;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i29;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i28;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i186;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i187;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i188;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i304;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i46;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i206;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i205;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i334;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i380;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i60;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i229;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i228;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i252;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i253;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i254;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i335;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i255;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i259;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i336;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i256;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i257;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i258;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i264;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i260;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i261;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i262;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i263;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i377;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i56;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i244;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i243;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i297;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i330;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i47;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i84;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i83;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i140;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i171;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i131;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i285;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i284;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i321;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i362;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i86;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i85;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i110;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i239;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i61;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i192;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i191;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i315;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i316;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i379;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i105;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i173;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i172;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i245;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i301;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i57;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i91;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i90;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i273;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i274;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i359;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i112;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i135;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i134;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i204;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i181;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i180;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i318;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i132;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i157;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i156;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i303;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i361;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i18;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i98;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i143;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i170;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i196;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i223;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i169;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i195;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i222;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i338;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i302;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i293;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i266;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i296;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i339;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_by_id_usecase.dart'
    as _i340;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i341;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i342;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i343;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i344;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i267;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i294;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i311;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i383;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i358;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i62;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i210;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i209;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i247;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i248;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i292;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i38;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i130;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i129;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i230;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i231;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i238;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i232;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i233;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i234;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_invoice_by_id_usecase.dart'
    as _i235;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i236;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i237;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i275;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i72;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i71;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i151;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i300;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i31;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i146;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i145;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i246;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i298;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i40;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i126;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i125;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i241;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i265;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i15;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i142;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i141;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i224;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i355;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i69;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i68;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i175;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i310;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i133;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i306;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i305;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i356;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i385;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i21;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i97;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i96;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i100;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i279;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i147;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i281;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i280;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i364;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i365;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i366;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i367;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i368;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i369;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i370;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i371;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i384;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i76;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i75;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i148;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i174;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i33;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i164;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i163;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i295;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i317;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i74;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i73;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i77;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i136;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i54;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i213;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i212;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i219;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i323;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i137;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i251;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i250;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i354;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i386;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i99;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i287;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i286;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i372;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i373;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i374;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i375;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i376;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i363;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i154;
import '../cache_services/prefs_consumer.dart' as _i158;
import '../cache_services/secure_storage_consumer.dart' as _i155;
import '../maps/location_services.dart' as _i150;
import 'di_container.dart' as _i387;

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
  gh.lazySingleton<_i34.NotUsingSystemRepo>(
      () => _i35.NotUsingSystemRepoImpl(gh<_i24.NotUsingSystemDatasource>()));
  gh.lazySingleton<_i36.WrongNumbersRepo>(
      () => _i37.WrongNumbersRepoImpl(gh<_i26.WrongNumbersDatasource>()));
  gh.lazySingleton<_i38.ParticipatesListDatasource>(
      () => _i38.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i39.PeriodicCommunicationDatasource>(
      () => _i39.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i40.EmployeesSalesReportsDatasource>(
      () => _i40.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.PeriodicCommunicationReportsRepo>(() =>
      _i42.PeriodicCommunicationReportsRepoImpl(
          gh<_i32.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i43.ManageWithdrawalsDatasource>(
      () => _i43.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.ClientsAcceptRepository>(() =>
      _i45.ClientsAcceptRepositoryImpl(gh<_i30.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i46.ClientsDebtsDatasource>(
      () => _i46.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i47.FinancePendingDatasource>(
      () => _i47.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i48.EvaluationLevelReportRepo>(() =>
      _i49.EvaluationLevelReportRepoImpl(
          gh<_i10.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i50.InstallQualityDatasource>(
      () => _i50.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i51.LevelsRepo>(
      () => _i52.LevelsRepoImpl(gh<_i16.LevelsDatasource>()));
  gh.lazySingleton<_i53.TicketsDataSource>(
      () => _i53.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i54.SupportClientsInvoicesDatasource>(
      () => _i54.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i55.UsersDatasource>(
      () => _i55.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i19.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i20.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i56.ClientsTransferApprovalsDatasource>(
      () => _i56.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i57.ExceededClientsDatasource>(
      () => _i57.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i58.AppDatasource>(
      () => _i58.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i59.SpecialClientsDatasource>(
      () => _i59.SpecialClientsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i60.ClientsListDatasource>(
      () => _i60.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i61.CommentCompanyDatasource>(
      () => _i61.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i62.ImportantLinksDatasource>(
      () => _i62.ImportantLinksDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i63.UsersDatasource>(
      () => _i63.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i64.CitiesDatasource>(
      () => _i64.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i65.AdvancedConfigsDatasource>(
      () => _i65.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i66.TicketsRepo>(
      () => _i67.TicketsRepoImpl(gh<_i53.TicketsDataSource>()));
  gh.lazySingleton<_i68.RegionsSalesReportsRepo>(() =>
      _i69.RegionsSalesReportsRepoImpl(
          gh<_i22.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i70.ClientLogsTabDataSource>(
      () => _i70.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i71.ClientsDebtsReportsRepo>(() =>
      _i72.ClientsDebtsReportsRepoImpl(
          gh<_i23.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i73.SupportClientsAcceptRepository>(() =>
      _i74.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i75.DelayAfterInstallRepo>(() =>
      _i76.DelayAfterInstallRepoImpl(gh<_i11.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i77.GetSupportClientsAcceptUseCase>(() =>
      _i77.GetSupportClientsAcceptUseCase(
          gh<_i73.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i78.UsersRepository>(
      () => _i79.UsersRepositoryImpl(gh<_i63.UsersDatasource>()));
  gh.lazySingleton<_i80.UsersRepository>(
      () => _i81.UsersRepositoryImpl(gh<_i55.UsersDatasource>()));
  gh.lazySingleton<_i82.GeneralConfigsDatasource>(
      () => _i82.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i83.FinancePendingRepo>(
      () => _i84.FinancePendingRepoImpl(gh<_i47.FinancePendingDatasource>()));
  gh.lazySingleton<_i85.PendingInvoicesRepo>(
      () => _i86.PendingInvoicesRepoImpl(gh<_i12.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i87.BranchesDatasource>(
      () => _i87.BranchesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i88.ClientsCareReportsRepo>(() =>
      _i89.ClientsCareReportsRepoImpl(gh<_i27.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i90.ExceededClientsRepo>(
      () => _i91.ExceededClientsRepoImpl(gh<_i57.ExceededClientsDatasource>()));
  gh.factory<_i92.ActionUserUsecase>(
      () => _i92.ActionUserUsecase(gh<_i80.UsersRepository>()));
  gh.lazySingleton<_i93.BranchesRepository>(
      () => _i94.BranchesRepositoryImpl(gh<_i87.BranchesDatasource>()));
  gh.lazySingleton<_i95.GetEvaluationLevelReportUsecase>(() =>
      _i95.GetEvaluationLevelReportUsecase(
          gh<_i48.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i96.ClientsInstallReportsRepo>(() =>
      _i97.ClientsInstallReportsRepoImpl(
          gh<_i21.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i98.AgentsDistributorsDataSource>(
      () => _i98.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i99.TaskDatasource>(
      () => _i99.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i100.GetClientsInstallReportsUsecase>(() =>
      _i100.GetClientsInstallReportsUsecase(
          gh<_i96.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i101.PreviousRatingsRepo>(() =>
      _i102.PreviousRatingsRepoImpl(gh<_i25.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i103.ClientLogsTabRepo>(
      () => _i104.ClientLogsTabRepoImpl(gh<_i70.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i105.DeletedInvoicesDatasource>(
      () => _i105.DeletedInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i106.AddLevelUsecase>(
      () => _i106.AddLevelUsecase(gh<_i51.LevelsRepo>()));
  gh.lazySingleton<_i107.GetLevelsUsecase>(
      () => _i107.GetLevelsUsecase(gh<_i51.LevelsRepo>()));
  gh.lazySingleton<_i108.SupportTabDataSource>(
      () => _i108.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i109.GetUsersUsecase>(
      () => _i109.GetUsersUsecase(gh<_i78.UsersRepository>()));
  gh.lazySingleton<_i110.GetPendingInvoicesUsecase>(
      () => _i110.GetPendingInvoicesUsecase(gh<_i85.PendingInvoicesRepo>()));
  gh.lazySingleton<_i111.GetClientsCareReportsUsecase>(() =>
      _i111.GetClientsCareReportsUsecase(gh<_i88.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i112.InvoicesTabDataSource>(
      () => _i112.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i113.CitiesRepository>(
      () => _i114.CitiesRepositoryImpl(gh<_i64.CitiesDatasource>()));
  gh.lazySingleton<_i115.GetCitiesUseCase>(
      () => _i115.GetCitiesUseCase(gh<_i113.CitiesRepository>()));
  gh.lazySingleton<_i116.AddTicketUseCase>(
      () => _i116.AddTicketUseCase(gh<_i66.TicketsRepo>()));
  gh.lazySingleton<_i117.EditTicketTypeUseCase>(
      () => _i117.EditTicketTypeUseCase(gh<_i66.TicketsRepo>()));
  gh.lazySingleton<_i118.GetClientTicketsUseCase>(
      () => _i118.GetClientTicketsUseCase(gh<_i66.TicketsRepo>()));
  gh.lazySingleton<_i119.GetTicketsUseCase>(
      () => _i119.GetTicketsUseCase(gh<_i66.TicketsRepo>()));
  gh.lazySingleton<_i120.GetTicketByIdUseCase>(
      () => _i120.GetTicketByIdUseCase(gh<_i66.TicketsRepo>()));
  gh.lazySingleton<_i121.TransferTicketUseCase>(
      () => _i121.TransferTicketUseCase(gh<_i66.TicketsRepo>()));
  gh.factory<_i122.TicketsCubit>(() => _i122.TicketsCubit(
        gh<_i119.GetTicketsUseCase>(),
        gh<_i120.GetTicketByIdUseCase>(),
        gh<_i118.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i123.LevelsCubit>(() => _i123.LevelsCubit(
        gh<_i107.GetLevelsUsecase>(),
        gh<_i106.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i124.LoginRemoteDataSource>(
      () => _i124.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i125.EmployeesSalesReportsRepo>(() =>
      _i126.EmployeesSalesReportsRepoImpl(
          gh<_i40.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i127.AdvancedConfigsRepository>(() =>
      _i128.AdvancedConfigsRepositoryImpl(
          gh<_i65.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i129.ParticipateListRepository>(() =>
      _i130.ParticipateListRepositoryImpl(
          gh<_i38.ParticipatesListDatasource>()));
  gh.lazySingleton<_i131.LatestClientsUpdatesDatasource>(
      () => _i131.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i132.ManageWithdrawnInvoicesDataSource>(
      () => _i132.ManageWithdrawnInvoicesDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i133.WithdrawnInvoicesDataSource>(
      () => _i133.WithdrawnInvoicesDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i134.InvoicesSectionRepo>(
      () => _i135.InvoicesTabRepoImpl(gh<_i112.InvoicesTabDataSource>()));
  gh.factory<_i136.SupportClientsAcceptCubit>(() =>
      _i136.SupportClientsAcceptCubit(
          gh<_i77.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i137.WaitingAgentsDataSource>(
      () => _i137.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i138.SpecialClientsRepository>(() =>
      _i139.SpecialClientsRepositoryImpl(gh<_i59.SpecialClientsDatasource>()));
  gh.lazySingleton<_i140.GetFinancePendingInvoicesUsecase>(() =>
      _i140.GetFinancePendingInvoicesUsecase(gh<_i83.FinancePendingRepo>()));
  gh.lazySingleton<_i141.ProductsSalesReportsRepo>(() =>
      _i142.ProductsSalesReportsRepoImpl(
          gh<_i15.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i143.AgentsDistributorsProfileDataSource>(() =>
      _i143.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i144.EditTicketCubit>(() => _i144.EditTicketCubit(
        gh<_i117.EditTicketTypeUseCase>(),
        gh<_i121.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i145.ClientsStatusReportsRepo>(() =>
      _i146.ClientsStatusReportsRepoImpl(
          gh<_i31.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i147.DatesTableDataSource>(
      () => _i147.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i148.GetDelayAfterInstallUseCase>(() =>
      _i148.GetDelayAfterInstallUseCase(gh<_i75.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i149.RegionsDatasource>(
      () => _i149.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i150.LocationServices>(
      () => _i150.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i151.GetClientsDebtsReportsUsecase>(() =>
      _i151.GetClientsDebtsReportsUsecase(gh<_i71.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i152.GreetingCommunicationRepo>(() =>
      _i153.GreetingCommunicationRepoImpl(
          gh<_i17.GreetingCommunicationDatasource>()));
  gh.singleton<_i154.CacheServices>(
    () => _i155.SecureStorageConsumer(gh<_i20.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i156.ManageWithdrawnInvoicesRepo>(() =>
      _i157.ManageWithdrawnInvoicesRepoImpl(
          gh<_i132.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i154.CacheServices>(() async =>
      _i158.PrefsConsumer(await gh.getAsync<_i19.SharedPreferences>()));
  gh.lazySingleton<_i159.InstallQualityRepo>(
      () => _i160.InstallQualityRepoImpl(gh<_i50.InstallQualityDatasource>()));
  gh.lazySingleton<_i161.PrivilegesRepo>(
      () => _i162.PrivilegesRepoImpl(gh<_i13.PrivilegesDatasource>()));
  gh.lazySingleton<_i163.DelayInstallReportsRepo>(() =>
      _i164.DelayInstallReportsRepoImpl(
          gh<_i33.DelayInstallReportsDatasource>()));
  gh.factory<_i165.AppRepository>(
      () => _i166.AppRepositoryImpl(gh<_i58.AppDatasource>()));
  gh.factory<_i167.UpdatePrivilegesUsecase>(
      () => _i167.UpdatePrivilegesUsecase(gh<_i161.PrivilegesRepo>()));
  gh.lazySingleton<_i168.GetPrivilegesUsecase>(
      () => _i168.GetPrivilegesUsecase(gh<_i161.PrivilegesRepo>()));
  gh.lazySingleton<_i169.AgentsDistributorsActionsRepo>(() =>
      _i170.AgentsDistributorsActionsRepoImpl(
          gh<_i18.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i171.FinancePendingCubit>(() =>
      _i171.FinancePendingCubit(gh<_i140.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i172.DeletedInvoicesRepo>(() =>
      _i173.DeletedInvoicesRepoImpl(gh<_i105.DeletedInvoicesDatasource>()));
  gh.factory<_i174.DelayAfterInstallCubit>(() =>
      _i174.DelayAfterInstallCubit(gh<_i148.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i175.GetRegionsSalesReportsUsecase>(() =>
      _i175.GetRegionsSalesReportsUsecase(gh<_i68.RegionsSalesReportsRepo>()));
  gh.factory<_i176.ClientsCareReportsCubit>(() =>
      _i176.ClientsCareReportsCubit(gh<_i111.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i177.SupportTabRepo>(
      () => _i178.SupportTabRepoImpl(gh<_i108.SupportTabDataSource>()));
  gh.factory<_i179.GetSpecialClientsUsecase>(() =>
      _i179.GetSpecialClientsUsecase(gh<_i138.SpecialClientsRepository>()));
  gh.lazySingleton<_i180.GetInvoicesByPrivilegesUsecase>(() =>
      _i180.GetInvoicesByPrivilegesUsecase(gh<_i134.InvoicesSectionRepo>()));
  gh.lazySingleton<_i181.GetInvoiceByIdUsecase>(
      () => _i181.GetInvoiceByIdUsecase(gh<_i134.InvoicesSectionRepo>()));
  gh.lazySingleton<_i182.GetWrongNumbersUsecase>(
      () => _i182.GetWrongNumbersUsecase(gh<_i36.WrongNumbersRepo>()));
  gh.lazySingleton<_i183.GetClientsAcceptUseCase>(
      () => _i183.GetClientsAcceptUseCase(gh<_i44.ClientsAcceptRepository>()));
  gh.lazySingleton<_i184.GeneralConfigsRepository>(() =>
      _i185.GeneralConfigsRepositoryImpl(gh<_i82.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i186.GetNotificationsUsecase>(
      () => _i186.GetNotificationsUsecase(gh<_i28.NotificationsRepo>()));
  gh.lazySingleton<_i187.GetUnreadNotificationsCountUsecase>(() =>
      _i187.GetUnreadNotificationsCountUsecase(gh<_i28.NotificationsRepo>()));
  gh.lazySingleton<_i188.MarkNotificationsAsReadUsecase>(
      () => _i188.MarkNotificationsAsReadUsecase(gh<_i28.NotificationsRepo>()));
  gh.lazySingleton<_i189.GetPeriodicCommunicationReportsUsecase>(() =>
      _i189.GetPeriodicCommunicationReportsUsecase(
          gh<_i41.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i190.GetBranchesByIdCountryUseCase>(
      () => _i190.GetBranchesByIdCountryUseCase(gh<_i93.BranchesRepository>()));
  gh.factory<_i191.CompanyRepository>(
      () => _i192.CompanyRepositoryImpl(gh<_i61.CommentCompanyDatasource>()));
  gh.singleton<_i193.PrivilegesCubit>(() => _i193.PrivilegesCubit(
        gh<_i168.GetPrivilegesUsecase>(),
        gh<_i167.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i194.GetInstallUseCase>(
      () => _i194.GetInstallUseCase(gh<_i159.InstallQualityRepo>()));
  gh.lazySingleton<_i195.AgentsDistributorsProfileRepo>(() =>
      _i196.AgentsDistributorsProfileRepoImpl(
          gh<_i143.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i197.AddDateInstallUsecase>(
      () => _i197.AddDateInstallUsecase(gh<_i177.SupportTabRepo>()));
  gh.lazySingleton<_i198.CancelDateInstallUsecase>(
      () => _i198.CancelDateInstallUsecase(gh<_i177.SupportTabRepo>()));
  gh.lazySingleton<_i199.GetInvoiceByClientUsecase>(
      () => _i199.GetInvoiceByClientUsecase(gh<_i177.SupportTabRepo>()));
  gh.lazySingleton<_i200.ReceiveDeviceUsecase>(
      () => _i200.ReceiveDeviceUsecase(gh<_i177.SupportTabRepo>()));
  gh.lazySingleton<_i201.ReturnInvoiceApproveUsecase>(
      () => _i201.ReturnInvoiceApproveUsecase(gh<_i177.SupportTabRepo>()));
  gh.lazySingleton<_i202.SetDateDoneUsecase>(
      () => _i202.SetDateDoneUsecase(gh<_i177.SupportTabRepo>()));
  gh.lazySingleton<_i203.SetReadyInstallUsecase>(
      () => _i203.SetReadyInstallUsecase(gh<_i177.SupportTabRepo>()));
  gh.lazySingleton<_i204.GetAllUsersUseCase>(
      () => _i204.GetAllUsersUseCase(gh<_i134.InvoicesSectionRepo>()));
  gh.lazySingleton<_i205.ClientsDebtsRepo>(
      () => _i206.ClientsDebtsRepoImpl(gh<_i46.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i207.PeriodicCommunicationRepo>(() =>
      _i208.PeriodicCommunicationRepoImpl(
          gh<_i39.PeriodicCommunicationDatasource>()));
  gh.factory<_i209.ImportantLinksRepo>(
      () => _i210.ImportantLinksRepoImpl(gh<_i62.ImportantLinksDatasource>()));
  gh.lazySingleton<_i211.GetClientLogsUsecase>(
      () => _i211.GetClientLogsUsecase(gh<_i103.ClientLogsTabRepo>()));
  gh.lazySingleton<_i212.SupportClientsInvoicesRepo>(() =>
      _i213.SupportClientsInvoicesRepoImpl(
          gh<_i54.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i214.GetBranchesForUserUsecase>(
      () => _i214.GetBranchesForUserUsecase(gh<_i80.UsersRepository>()));
  gh.lazySingleton<_i215.GetLevelsForUserUsecase>(
      () => _i215.GetLevelsForUserUsecase(gh<_i80.UsersRepository>()));
  gh.lazySingleton<_i216.GetManagesForUserUsecase>(
      () => _i216.GetManagesForUserUsecase(gh<_i80.UsersRepository>()));
  gh.factory<_i217.GetUsersUsecase>(
      () => _i217.GetUsersUsecase(gh<_i80.UsersRepository>()));
  gh.factory<_i218.GetUserByIdUsecase>(
      () => _i218.GetUserByIdUsecase(gh<_i80.UsersRepository>()));
  gh.lazySingleton<_i219.GetSupportClientsInvoicesUseCase>(() =>
      _i219.GetSupportClientsInvoicesUseCase(
          gh<_i212.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i220.ManageWithdrawalsRepository>(() =>
      _i221.ManageWithdrawalsRepositoryImpl(
          gh<_i43.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i222.AgentsDistributorsRepo>(() =>
      _i223.AgentsDistributorsRepoImpl(
          gh<_i98.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i224.GetProductsSalesReportsUsecase>(() =>
      _i224.GetProductsSalesReportsUsecase(
          gh<_i141.ProductsSalesReportsRepo>()));
  gh.singleton<_i225.CitiesCubit>(
      () => _i225.CitiesCubit(gh<_i115.GetCitiesUseCase>()));
  gh.lazySingleton<_i226.GetNotUsingSystemUsecase>(
      () => _i226.GetNotUsingSystemUsecase(gh<_i34.NotUsingSystemRepo>()));
  gh.factory<_i227.UsersTypeCubit>(
      () => _i227.UsersTypeCubit(gh<_i109.GetUsersUsecase>()));
  gh.factory<_i228.ClientsListRepository>(
      () => _i229.ClientsListRepositoryImpl(gh<_i60.ClientsListDatasource>()));
  gh.factory<_i230.AddParticipateCommentUsecase>(() =>
      _i230.AddParticipateCommentUsecase(
          gh<_i129.ParticipateListRepository>()));
  gh.factory<_i231.AddParticipateUserUsecase>(() =>
      _i231.AddParticipateUserUsecase(gh<_i129.ParticipateListRepository>()));
  gh.factory<_i232.EditParticipateUserUsecase>(() =>
      _i232.EditParticipateUserUsecase(gh<_i129.ParticipateListRepository>()));
  gh.factory<_i233.ParticipateClientListUsecase>(() =>
      _i233.ParticipateClientListUsecase(
          gh<_i129.ParticipateListRepository>()));
  gh.factory<_i234.ParticipateCommentListUsecase>(() =>
      _i234.ParticipateCommentListUsecase(
          gh<_i129.ParticipateListRepository>()));
  gh.factory<_i235.GetParticipateInvoiceByIdUsecase>(() =>
      _i235.GetParticipateInvoiceByIdUsecase(
          gh<_i129.ParticipateListRepository>()));
  gh.factory<_i236.ParticipateInvoiceListUsecase>(() =>
      _i236.ParticipateInvoiceListUsecase(
          gh<_i129.ParticipateListRepository>()));
  gh.factory<_i237.ParticipateListUsecase>(() =>
      _i237.ParticipateListUsecase(gh<_i129.ParticipateListRepository>()));
  gh.lazySingleton<_i238.ChangeParticipateStatusUsecase>(() =>
      _i238.ChangeParticipateStatusUsecase(
          gh<_i129.ParticipateListRepository>()));
  gh.factory<_i239.PendingInvoicesCubit>(
      () => _i239.PendingInvoicesCubit(gh<_i110.GetPendingInvoicesUsecase>()));
  gh.factory<_i240.EvaluationLevelReportCubit>(() =>
      _i240.EvaluationLevelReportCubit(
          gh<_i95.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i241.GetEmployeesSalesReportsUsecase>(() =>
      _i241.GetEmployeesSalesReportsUsecase(
          gh<_i125.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i242.GetGreetingCommunicationUseCase>(() =>
      _i242.GetGreetingCommunicationUseCase(
          gh<_i152.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i243.ClientsTransferApprovalsRepo>(() =>
      _i244.ClientsTransferApprovalsRepoImpl(
          gh<_i56.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i245.GetDeletedInvoicesUsecase>(
      () => _i245.GetDeletedInvoicesUsecase(gh<_i172.DeletedInvoicesRepo>()));
  gh.lazySingleton<_i246.GetClientsStatusReportsUsecase>(() =>
      _i246.GetClientsStatusReportsUsecase(
          gh<_i145.ClientsStatusReportsRepo>()));
  gh.factory<_i247.ActionLinkUsecase>(
      () => _i247.ActionLinkUsecase(gh<_i209.ImportantLinksRepo>()));
  gh.factory<_i248.GetImportantLinksUsecase>(
      () => _i248.GetImportantLinksUsecase(gh<_i209.ImportantLinksRepo>()));
  gh.lazySingleton<_i249.GetPreviousRatingsUsecase>(
      () => _i249.GetPreviousRatingsUsecase(gh<_i101.PreviousRatingsRepo>()));
  gh.lazySingleton<_i250.WaitingAgentsRepo>(
      () => _i251.WaitingAgentsRepoImpl(gh<_i137.WaitingAgentsDataSource>()));
  gh.factory<_i252.AddClientUserUsecase>(
      () => _i252.AddClientUserUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i253.ApproveRejectClientUsecase>(() =>
      _i253.ApproveRejectClientUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i254.ChangeTypeClientUsecase>(
      () => _i254.ChangeTypeClientUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i255.EditClientUserUsecase>(
      () => _i255.EditClientUserUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i256.GetClientsListByRegionUseCase>(() =>
      _i256.GetClientsListByRegionUseCase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i257.GetClientsListByUserUseCase>(() =>
      _i257.GetClientsListByUserUseCase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i258.GetClientsWithFilterUserUsecase>(() =>
      _i258.GetClientsWithFilterUserUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i259.GetClientMarketingReportUsecase>(() =>
      _i259.GetClientMarketingReportUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i260.GetRecommendedClientsUsecase>(() =>
      _i260.GetRecommendedClientsUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i261.GetSimilarClientsUsecase>(
      () => _i261.GetSimilarClientsUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i262.ReceiveClientUserUsecase>(
      () => _i262.ReceiveClientUserUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i263.TransferClientUserUsecase>(
      () => _i263.TransferClientUserUsecase(gh<_i228.ClientsListRepository>()));
  gh.lazySingleton<_i264.GetHighSimilarClientsUsecase>(() =>
      _i264.GetHighSimilarClientsUsecase(gh<_i228.ClientsListRepository>()));
  gh.factory<_i265.EmployeesSalesReportsCubit>(() =>
      _i265.EmployeesSalesReportsCubit(
          gh<_i241.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i266.ChangeStateAgentUseCase>(
      () => _i266.ChangeStateAgentUseCase(gh<_i222.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i267.GetAgentsAndDistributorsUseCase>(() =>
      _i267.GetAgentsAndDistributorsUseCase(
          gh<_i222.AgentsDistributorsRepo>()));
  gh.factory<_i268.ClientsAcceptCubit>(
      () => _i268.ClientsAcceptCubit(gh<_i183.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i269.CancelWithdrawalUsecase>(() =>
      _i269.CancelWithdrawalUsecase(gh<_i220.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i270.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i270.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i220.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i271.GetWithdrawalsInvoicesUsecase>(() =>
      _i271.GetWithdrawalsInvoicesUsecase(
          gh<_i220.ManageWithdrawalsRepository>()));
  gh.factory<_i272.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i272.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i220.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i273.ExceededClientsUseCase>(
      () => _i273.ExceededClientsUseCase(gh<_i90.ExceededClientsRepo>()));
  gh.lazySingleton<_i274.TransferExceededClientsUseCase>(() =>
      _i274.TransferExceededClientsUseCase(gh<_i90.ExceededClientsRepo>()));
  gh.factory<_i275.ParticipateListBloc>(() => _i275.ParticipateListBloc(
        gh<_i237.ParticipateListUsecase>(),
        gh<_i231.AddParticipateUserUsecase>(),
        gh<_i232.EditParticipateUserUsecase>(),
        gh<_i233.ParticipateClientListUsecase>(),
        gh<_i236.ParticipateInvoiceListUsecase>(),
        gh<_i235.GetParticipateInvoiceByIdUsecase>(),
        gh<_i234.ParticipateCommentListUsecase>(),
        gh<_i230.AddParticipateCommentUsecase>(),
        gh<_i238.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i276.LoginLocalDataSource>(() =>
      _i276.LoginLocalDataSourceImpl(
          gh<_i154.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i277.EditAdvancedConfigsUsecase>(() =>
      _i277.EditAdvancedConfigsUsecase(gh<_i127.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i278.GetAdvancedConfigsUsecase>(() =>
      _i278.GetAdvancedConfigsUsecase(gh<_i127.AdvancedConfigsRepository>()));
  gh.factory<_i279.ClientsInstallReportsCubit>(() =>
      _i279.ClientsInstallReportsCubit(
          gh<_i100.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i280.DatesTableRepo>(
      () => _i281.DatesTableRepoImpl(gh<_i147.DatesTableDataSource>()));
  gh.factory<_i282.GetVersionUseCase>(
      () => _i282.GetVersionUseCase(gh<_i165.AppRepository>()));
  gh.factory<_i283.AddTicketCubit>(
      () => _i283.AddTicketCubit(gh<_i116.AddTicketUseCase>()));
  gh.lazySingleton<_i284.LatestClientsUpdatesRepository>(() =>
      _i285.LatestClientsUpdatesRepositoryImpl(
          gh<_i131.LatestClientsUpdatesDatasource>()));
  gh.factory<_i286.TaskRepository>(
      () => _i287.TaskRepositoryImpl(gh<_i99.TaskDatasource>()));
  gh.lazySingleton<_i288.EditGeneralConfigsUsecase>(() =>
      _i288.EditGeneralConfigsUsecase(gh<_i184.GeneralConfigsRepository>()));
  gh.lazySingleton<_i289.GetGeneralConfigsUsecase>(() =>
      _i289.GetGeneralConfigsUsecase(gh<_i184.GeneralConfigsRepository>()));
  gh.factory<_i290.PeriodicCommunicationReportsCubit>(() =>
      _i290.PeriodicCommunicationReportsCubit(
          gh<_i189.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i291.InstallQualityCubit>(
      () => _i291.InstallQualityCubit(gh<_i194.GetInstallUseCase>()));
  gh.factory<_i292.ImportantLinksCubit>(() => _i292.ImportantLinksCubit(
        gh<_i248.GetImportantLinksUsecase>(),
        gh<_i247.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i293.AddAgentUseCase>(
      () => _i293.AddAgentUseCase(gh<_i169.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i294.UpdateAgentUseCase>(() =>
      _i294.UpdateAgentUseCase(gh<_i169.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i295.GetDelayInstallReportsUseCase>(() =>
      _i295.GetDelayInstallReportsUseCase(gh<_i163.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i296.CrudAgentSupportFilesUsecase>(() =>
      _i296.CrudAgentSupportFilesUsecase(
          gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i297.GetClientsTransferApprovalsUsecase>(() =>
      _i297.GetClientsTransferApprovalsUsecase(
          gh<_i243.ClientsTransferApprovalsRepo>()));
  gh.factory<_i298.ClientsStatusReportsCubit>(() =>
      _i298.ClientsStatusReportsCubit(
          gh<_i246.GetClientsStatusReportsUsecase>()));
  gh.factory<_i299.SupportTabCubit>(() => _i299.SupportTabCubit(
        gh<_i199.GetInvoiceByClientUsecase>(),
        gh<_i197.AddDateInstallUsecase>(),
        gh<_i202.SetDateDoneUsecase>(),
        gh<_i203.SetReadyInstallUsecase>(),
        gh<_i201.ReturnInvoiceApproveUsecase>(),
        gh<_i200.ReceiveDeviceUsecase>(),
        gh<_i198.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i300.ClientsDebtsReportsCubit>(() =>
      _i300.ClientsDebtsReportsCubit(
          gh<_i151.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i301.DeletedInvoicesCubit>(
      () => _i301.DeletedInvoicesCubit(gh<_i245.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i302.AddAgentDateUseCase>(() =>
      _i302.AddAgentDateUseCase(gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i303.GetManageWithdrawnInvoicesUsecase>(() =>
      _i303.GetManageWithdrawnInvoicesUsecase(
          gh<_i156.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i304.NotificationsCubit>(() => _i304.NotificationsCubit(
        gh<_i186.GetNotificationsUsecase>(),
        gh<_i188.MarkNotificationsAsReadUsecase>(),
        gh<_i187.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i305.WithdrawnInvoicesRepo>(() =>
      _i306.WithdrawnInvoicesRepoImpl(gh<_i133.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i307.RegionsRepository>(
      () => _i308.RegionsRepositoryImpl(gh<_i149.RegionsDatasource>()));
  gh.factory<_i309.ClientLogsTabCubit>(
      () => _i309.ClientLogsTabCubit(gh<_i211.GetClientLogsUsecase>()));
  gh.factory<_i310.RegionsSalesReportsCubit>(() =>
      _i310.RegionsSalesReportsCubit(
          gh<_i175.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i311.AgentsDistributorsActionsCubit>(
      () => _i311.AgentsDistributorsActionsCubit(
            gh<_i115.GetCitiesUseCase>(),
            gh<_i293.AddAgentUseCase>(),
            gh<_i294.UpdateAgentUseCase>(),
          ));
  gh.lazySingleton<_i312.LoginRepo>(() => _i313.LoginRepoImpl(
        gh<_i124.LoginRemoteDataSource>(),
        gh<_i276.LoginLocalDataSource>(),
      ));
  gh.factory<_i314.SpecialClientsBloc>(
      () => _i314.SpecialClientsBloc(gh<_i179.GetSpecialClientsUsecase>()));
  gh.factory<_i315.AddCommentUsecase>(
      () => _i315.AddCommentUsecase(gh<_i191.CompanyRepository>()));
  gh.factory<_i316.GetCommentUsecase>(
      () => _i316.GetCommentUsecase(gh<_i191.CompanyRepository>()));
  gh.factory<_i317.DelayInstallReportsCubit>(() =>
      _i317.DelayInstallReportsCubit(
          gh<_i295.GetDelayInstallReportsUseCase>()));
  gh.factory<_i318.InvoicesSectionCubit>(() => _i318.InvoicesSectionCubit(
        gh<_i180.GetInvoicesByPrivilegesUsecase>(),
        gh<_i267.GetAgentsAndDistributorsUseCase>(),
        gh<_i237.ParticipateListUsecase>(),
        gh<_i204.GetAllUsersUseCase>(),
        gh<_i181.GetInvoiceByIdUsecase>(),
      ));
  gh.factory<_i319.GreetingCommunicationCubit>(() =>
      _i319.GreetingCommunicationCubit(
          gh<_i242.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i320.GetRegionsUseCase>(
      () => _i320.GetRegionsUseCase(gh<_i307.RegionsRepository>()));
  gh.lazySingleton<_i321.GetLatestClientsUseCase>(() =>
      _i321.GetLatestClientsUseCase(
          gh<_i284.LatestClientsUpdatesRepository>()));
  gh.factory<_i322.AdvancedCofigsCubit>(() => _i322.AdvancedCofigsCubit(
        gh<_i278.GetAdvancedConfigsUsecase>(),
        gh<_i277.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i323.SupportClientsInvoicesCubit>(() =>
      _i323.SupportClientsInvoicesCubit(
          gh<_i219.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i324.WrongNumbersCubit>(
      () => _i324.WrongNumbersCubit(gh<_i182.GetWrongNumbersUsecase>()));
  gh.lazySingleton<_i325.CacheTokenUsecase>(
      () => _i325.CacheTokenUsecase(gh<_i312.LoginRepo>()));
  gh.lazySingleton<_i326.GetTokenUsecase>(
      () => _i326.GetTokenUsecase(gh<_i312.LoginRepo>()));
  gh.lazySingleton<_i327.LoginUsecase>(
      () => _i327.LoginUsecase(gh<_i312.LoginRepo>()));
  gh.lazySingleton<_i328.ValidateTokenUsecase>(
      () => _i328.ValidateTokenUsecase(gh<_i312.LoginRepo>()));
  gh.lazySingleton<_i329.VerifyOtpUsecase>(
      () => _i329.VerifyOtpUsecase(gh<_i312.LoginRepo>()));
  gh.factory<_i330.ClientsTransferApprovalsCubit>(() =>
      _i330.ClientsTransferApprovalsCubit(
          gh<_i297.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i331.RegionsCubit>(
      () => _i331.RegionsCubit(gh<_i320.GetRegionsUseCase>()));
  gh.factory<_i332.GeneralCofigsCubit>(() => _i332.GeneralCofigsCubit(
        gh<_i289.GetGeneralConfigsUsecase>(),
        gh<_i288.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i333.GetPeriodicCommunicationUseCase>(() =>
      _i333.GetPeriodicCommunicationUseCase(
          gh<_i207.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i334.GetClientsDebtsUsecase>(
      () => _i334.GetClientsDebtsUsecase(gh<_i205.ClientsDebtsRepo>()));
  gh.lazySingleton<_i335.CrudClientSupportFilesUsecase>(() =>
      _i335.CrudClientSupportFilesUsecase(
          repository: gh<_i228.ClientsListRepository>()));
  gh.lazySingleton<_i336.GetClientSupportFilesUsecase>(() =>
      _i336.GetClientSupportFilesUsecase(
          repository: gh<_i228.ClientsListRepository>()));
  gh.factory<_i337.BranchesCubit>(
      () => _i337.BranchesCubit(gh<_i190.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i338.AddAgentCommentUsecase>(() =>
      _i338.AddAgentCommentUsecase(gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i339.DoneTrainingUsecase>(() =>
      _i339.DoneTrainingUsecase(gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i340.GetAgentByIdUsecase>(() =>
      _i340.GetAgentByIdUsecase(gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i341.GetAgentClientListUsecase>(() =>
      _i341.GetAgentClientListUsecase(
          gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i342.GetAgentCommentsListUsecase>(() =>
      _i342.GetAgentCommentsListUsecase(
          gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i343.GetAgentDatesListUsecase>(() =>
      _i343.GetAgentDatesListUsecase(
          gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i344.GetAgentInvoiceListUsecase>(() =>
      _i344.GetAgentInvoiceListUsecase(
          gh<_i195.AgentsDistributorsProfileRepo>()));
  gh.factory<_i345.AddRejectReasonsUsecase>(() =>
      _i345.AddRejectReasonsUsecase(gh<_i220.ManageWithdrawalsRepository>()));
  gh.factory<_i346.EditRejectReasonsUsecase>(() =>
      _i346.EditRejectReasonsUsecase(gh<_i220.ManageWithdrawalsRepository>()));
  gh.factory<_i347.GetRejectReasonsUsecase>(() =>
      _i347.GetRejectReasonsUsecase(gh<_i220.ManageWithdrawalsRepository>()));
  gh.factory<_i348.GetUserSeriesUsecase>(() =>
      _i348.GetUserSeriesUsecase(gh<_i220.ManageWithdrawalsRepository>()));
  gh.factory<_i349.GetWithdrawnDetailsUsecase>(() =>
      _i349.GetWithdrawnDetailsUsecase(
          gh<_i220.ManageWithdrawalsRepository>()));
  gh.factory<_i350.SetApproveSeriesUsecase>(() =>
      _i350.SetApproveSeriesUsecase(gh<_i220.ManageWithdrawalsRepository>()));
  gh.factory<_i351.UpdateSeriesUsecase>(
      () => _i351.UpdateSeriesUsecase(gh<_i220.ManageWithdrawalsRepository>()));
  gh.factory<_i352.NotUsingSystemCubit>(
      () => _i352.NotUsingSystemCubit(gh<_i226.GetNotUsingSystemUsecase>()));
  gh.singleton<_i353.AppManagerCubit>(
      () => _i353.AppManagerCubit(gh<_i282.GetVersionUseCase>()));
  gh.lazySingleton<_i354.GetWaitingAgentsUsecase>(
      () => _i354.GetWaitingAgentsUsecase(gh<_i250.WaitingAgentsRepo>()));
  gh.factory<_i355.ProductsSalesReportsCubit>(() =>
      _i355.ProductsSalesReportsCubit(
          gh<_i224.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i356.GetWithdrawnInvoicesUsecase>(() =>
      _i356.GetWithdrawnInvoicesUsecase(gh<_i305.WithdrawnInvoicesRepo>()));
  gh.factory<_i357.PreviousRatingsCubit>(
      () => _i357.PreviousRatingsCubit(gh<_i249.GetPreviousRatingsUsecase>()));
  gh.factory<_i358.AgentsDistributorsCubit>(() => _i358.AgentsDistributorsCubit(
        gh<_i267.GetAgentsAndDistributorsUseCase>(),
        gh<_i266.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i359.ExceededClientsCubit>(() => _i359.ExceededClientsCubit(
        gh<_i273.ExceededClientsUseCase>(),
        gh<_i274.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i360.ManageWithdrawalsCubit>(() => _i360.ManageWithdrawalsCubit(
        gh<_i348.GetUserSeriesUsecase>(),
        gh<_i351.UpdateSeriesUsecase>(),
        gh<_i217.GetUsersUsecase>(),
        gh<_i271.GetWithdrawalsInvoicesUsecase>(),
        gh<_i272.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i350.SetApproveSeriesUsecase>(),
        gh<_i349.GetWithdrawnDetailsUsecase>(),
        gh<_i345.AddRejectReasonsUsecase>(),
        gh<_i347.GetRejectReasonsUsecase>(),
        gh<_i346.EditRejectReasonsUsecase>(),
        gh<_i270.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i269.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i361.ManageWithdrawnInvoicesCubit>(() =>
      _i361.ManageWithdrawnInvoicesCubit(
          gh<_i303.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i362.LatestClientsUpdatesCubit>(() =>
      _i362.LatestClientsUpdatesCubit(gh<_i321.GetLatestClientsUseCase>()));
  gh.factory<_i363.AttachmentsRowCubit>(() => _i363.AttachmentsRowCubit(
        gh<_i336.GetClientSupportFilesUsecase>(),
        gh<_i335.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i364.CancelScheduleUsecase>(
      () => _i364.CancelScheduleUsecase(gh<_i280.DatesTableRepo>()));
  gh.lazySingleton<_i365.ChangeDateToDonUsecase>(
      () => _i365.ChangeDateToDonUsecase(gh<_i280.DatesTableRepo>()));
  gh.lazySingleton<_i366.GetCancelReasonsUsecase>(
      () => _i366.GetCancelReasonsUsecase(gh<_i280.DatesTableRepo>()));
  gh.lazySingleton<_i367.GetDateInstallationUsecase>(
      () => _i367.GetDateInstallationUsecase(gh<_i280.DatesTableRepo>()));
  gh.lazySingleton<_i368.GetInvoicesByClientForDateUsecase>(() =>
      _i368.GetInvoicesByClientForDateUsecase(gh<_i280.DatesTableRepo>()));
  gh.lazySingleton<_i369.GetSubscribedClientsUsecase>(
      () => _i369.GetSubscribedClientsUsecase(gh<_i280.DatesTableRepo>()));
  gh.lazySingleton<_i370.RescheduleDateUsecase>(
      () => _i370.RescheduleDateUsecase(gh<_i280.DatesTableRepo>()));
  gh.lazySingleton<_i371.ReturnScheduleVisitToOpenUsecase>(
      () => _i371.ReturnScheduleVisitToOpenUsecase(gh<_i280.DatesTableRepo>()));
  gh.factory<_i372.AddTaskUsecase>(
      () => _i372.AddTaskUsecase(gh<_i286.TaskRepository>()));
  gh.factory<_i373.ChangeStatusTaskUsecase>(
      () => _i373.ChangeStatusTaskUsecase(gh<_i286.TaskRepository>()));
  gh.factory<_i374.GetTasksUsecase>(
      () => _i374.GetTasksUsecase(gh<_i286.TaskRepository>()));
  gh.factory<_i375.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i375.GetUsersByDepartmentAndRegionUsecase(gh<_i286.TaskRepository>()));
  gh.lazySingleton<_i376.TaskCubit>(() => _i376.TaskCubit(
        gh<_i372.AddTaskUsecase>(),
        gh<_i374.GetTasksUsecase>(),
        gh<_i373.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i377.ClientsListBloc>(() => _i377.ClientsListBloc(
        gh<_i258.GetClientsWithFilterUserUsecase>(),
        gh<_i260.GetRecommendedClientsUsecase>(),
        gh<_i252.AddClientUserUsecase>(),
        gh<_i255.EditClientUserUsecase>(),
        gh<_i254.ChangeTypeClientUsecase>(),
        gh<_i261.GetSimilarClientsUsecase>(),
        gh<_i253.ApproveRejectClientUsecase>(),
        gh<_i335.CrudClientSupportFilesUsecase>(),
        gh<_i336.GetClientSupportFilesUsecase>(),
        gh<_i263.TransferClientUserUsecase>(),
        gh<_i262.ReceiveClientUserUsecase>(),
        gh<_i259.GetClientMarketingReportUsecase>(),
        gh<_i264.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i378.UsersCubit>(() => _i378.UsersCubit(
        gh<_i217.GetUsersUsecase>(),
        gh<_i218.GetUserByIdUsecase>(),
        gh<_i92.ActionUserUsecase>(),
        gh<_i375.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i216.GetManagesForUserUsecase>(),
        gh<_i215.GetLevelsForUserUsecase>(),
        gh<_i214.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i379.CompanyCubit>(() => _i379.CompanyCubit(
        gh<_i316.GetCommentUsecase>(),
        gh<_i315.AddCommentUsecase>(),
      ));
  gh.factory<_i380.ClientsDebtsCubit>(
      () => _i380.ClientsDebtsCubit(gh<_i334.GetClientsDebtsUsecase>()));
  gh.factory<_i381.PeriodicCommunicationCubit>(() =>
      _i381.PeriodicCommunicationCubit(
          gh<_i333.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i382.LoginCubit>(() => _i382.LoginCubit(
        gh<_i327.LoginUsecase>(),
        gh<_i329.VerifyOtpUsecase>(),
        gh<_i325.CacheTokenUsecase>(),
        gh<_i326.GetTokenUsecase>(),
        gh<_i328.ValidateTokenUsecase>(),
      ));
  gh.factory<_i383.AgentsDistributorsProfileBloc>(
      () => _i383.AgentsDistributorsProfileBloc(
            gh<_i340.GetAgentByIdUsecase>(),
            gh<_i341.GetAgentClientListUsecase>(),
            gh<_i344.GetAgentInvoiceListUsecase>(),
            gh<_i235.GetParticipateInvoiceByIdUsecase>(),
            gh<_i342.GetAgentCommentsListUsecase>(),
            gh<_i338.AddAgentCommentUsecase>(),
            gh<_i339.DoneTrainingUsecase>(),
            gh<_i302.AddAgentDateUseCase>(),
            gh<_i343.GetAgentDatesListUsecase>(),
            gh<_i296.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i384.DatesTableCubit>(() => _i384.DatesTableCubit(
        gh<_i367.GetDateInstallationUsecase>(),
        gh<_i370.RescheduleDateUsecase>(),
        gh<_i365.ChangeDateToDonUsecase>(),
        gh<_i364.CancelScheduleUsecase>(),
        gh<_i371.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i369.GetSubscribedClientsUsecase>(),
        gh<_i368.GetInvoicesByClientForDateUsecase>(),
        gh<_i197.AddDateInstallUsecase>(),
        gh<_i366.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i385.WithdrawnInvoicesCubit>(() =>
      _i385.WithdrawnInvoicesCubit(gh<_i356.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i386.WaitingAgentsCubit>(
      () => _i386.WaitingAgentsCubit(gh<_i354.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i387.AppModule {}
