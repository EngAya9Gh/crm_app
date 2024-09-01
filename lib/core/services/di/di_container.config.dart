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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i52;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i160;
import '../../../features/app/domain/repositories/app_repository.dart' as _i159;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i271;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i341;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i265;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i118;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i303;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i302;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i314;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i315;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i316;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i317;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i318;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i370;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i28;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i39;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i38;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i175;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i258;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i25;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i83;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i82;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i105;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i170;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i47;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i61;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i60;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i110;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i111;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i112;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i114;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i113;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i115;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i272;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i138;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i116;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i43;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i42;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i89;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i230;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i17;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i147;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i146;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i232;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i308;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i44;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i154;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i153;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i186;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i280;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i33;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i200;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i199;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i322;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i369;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i30;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i36;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i35;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i181;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i279;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i24;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i96;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i95;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i239;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i345;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i53;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i133;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i132;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i173;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i304;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i81;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i88;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i87;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i182;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i326;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i58;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i108;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i107;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i109;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i216;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i64;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i98;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i97;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i203;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i298;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i102;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i172;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i171;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i189;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i190;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i191;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i192;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i193;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i194;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i195;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i288;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i143;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i297;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i296;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i309;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i320;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i57;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i73;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i72;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i103;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i217;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i59;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i122;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i121;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i266;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i267;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i311;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i76;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i177;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i176;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i277;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i278;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i321;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i46;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i45;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i100;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i101;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i117;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i13;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i156;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i155;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i162;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i161;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i185;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i49;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i75;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i74;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i86;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i206;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i207;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i208;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i209;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i374;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i37;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i212;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i211;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i334;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i259;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i335;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i260;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i336;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i337;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i262;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i261;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i338;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i339;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i340;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i348;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i14;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i27;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i26;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i178;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i179;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i180;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i293;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i40;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i198;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i197;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i323;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i368;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i54;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i219;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i218;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i242;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i243;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i244;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i324;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i245;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i249;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i325;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i246;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i247;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i248;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i254;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i250;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i251;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i252;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i253;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i366;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i50;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i234;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i233;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i286;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i319;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i41;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i78;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i77;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i134;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i165;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i125;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i274;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i273;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i310;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i350;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i80;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i79;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i104;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i229;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i55;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i184;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i183;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i305;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i306;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i367;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i99;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i167;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i166;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i235;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i290;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i51;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i85;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i84;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i263;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i264;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i347;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i106;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i129;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i128;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i196;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i174;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i301;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i126;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i151;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i150;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i292;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i349;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i18;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i92;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i164;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i188;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i214;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i163;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i187;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i213;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i327;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i291;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i282;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i256;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i285;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i328;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i329;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i330;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i331;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i332;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i333;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i257;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i283;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i300;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i360;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i346;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i56;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i202;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i201;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i237;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i238;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i281;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i32;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i124;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i123;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i220;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i221;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i228;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i222;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i223;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i224;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i225;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i226;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i227;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i313;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i66;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i65;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i145;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i289;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i29;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i140;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i139;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i236;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i287;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i34;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i120;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i119;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i231;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i255;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i15;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i136;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i135;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i215;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i343;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i63;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i62;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i169;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i299;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i127;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i295;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i294;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i344;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i372;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i21;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i91;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i90;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i94;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i268;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i141;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i270;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i269;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i352;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i353;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i354;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i355;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i356;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i357;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i358;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i359;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i371;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i70;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i69;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i142;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i168;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i31;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i158;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i157;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i284;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i307;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i68;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i67;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i71;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i130;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i48;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i205;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i204;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i210;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i312;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i131;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i241;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i240;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i342;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i373;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i93;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i276;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i275;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i361;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i362;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i363;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i364;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i365;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i351;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i148;
import '../cache_services/prefs_consumer.dart' as _i152;
import '../cache_services/secure_storage_consumer.dart' as _i149;
import '../maps/location_services.dart' as _i144;
import 'di_container.dart' as _i375;

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
  gh.lazySingleton<_i24.PreviousRatingsDatasource>(
      () => _i24.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.ClientsCareReportsDatasource>(
      () => _i25.ClientsCareReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.NotificationsRepo>(
      () => _i27.NotificationsRepoImpl(gh<_i14.NotificationsDatasource>()));
  gh.lazySingleton<_i28.ClientsAcceptDatasource>(
      () => _i28.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.ClientsStatusReportsDatasource>(
      () => _i29.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.PeriodicCommunicationReportsDatasource>(() =>
      _i30.PeriodicCommunicationReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.DelayInstallReportsDatasource>(
      () => _i31.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.ParticipatesListDatasource>(
      () => _i32.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.PeriodicCommunicationDatasource>(
      () => _i33.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i34.EmployeesSalesReportsDatasource>(
      () => _i34.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i35.PeriodicCommunicationReportsRepo>(() =>
      _i36.PeriodicCommunicationReportsRepoImpl(
          gh<_i30.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i37.ManageWithdrawalsDatasource>(
      () => _i37.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i38.ClientsAcceptRepository>(() =>
      _i39.ClientsAcceptRepositoryImpl(gh<_i28.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i40.ClientsDebtsDatasource>(
      () => _i40.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.FinancePendingDatasource>(
      () => _i41.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i42.EvaluationLevelReportRepo>(() =>
      _i43.EvaluationLevelReportRepoImpl(
          gh<_i10.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i44.InstallQualityDatasource>(
      () => _i44.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.LevelsRepo>(
      () => _i46.LevelsRepoImpl(gh<_i16.LevelsDatasource>()));
  gh.lazySingleton<_i47.TicketsDataSource>(
      () => _i47.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i48.SupportClientsInvoicesDatasource>(
      () => _i48.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i49.UsersDatasource>(
      () => _i49.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i19.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i20.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i50.ClientsTransferApprovalsDatasource>(
      () => _i50.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i51.ExceededClientsDatasource>(
      () => _i51.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i52.AppDatasource>(
      () => _i52.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i53.SpecialClientsDatasource>(
      () => _i53.SpecialClientsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i54.ClientsListDatasource>(
      () => _i54.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i55.CommentCompanyDatasource>(
      () => _i55.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i56.ImportantLinksDatasource>(
      () => _i56.ImportantLinksDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i57.UsersDatasource>(
      () => _i57.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i58.CitiesDatasource>(
      () => _i58.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i59.AdvancedConfigsDatasource>(
      () => _i59.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i60.TicketsRepo>(
      () => _i61.TicketsRepoImpl(gh<_i47.TicketsDataSource>()));
  gh.lazySingleton<_i62.RegionsSalesReportsRepo>(() =>
      _i63.RegionsSalesReportsRepoImpl(
          gh<_i22.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i64.ClientLogsTabDataSource>(
      () => _i64.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i65.ClientsDebtsReportsRepo>(() =>
      _i66.ClientsDebtsReportsRepoImpl(
          gh<_i23.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i67.SupportClientsAcceptRepository>(() =>
      _i68.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i69.DelayAfterInstallRepo>(() =>
      _i70.DelayAfterInstallRepoImpl(gh<_i11.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i71.GetSupportClientsAcceptUseCase>(() =>
      _i71.GetSupportClientsAcceptUseCase(
          gh<_i67.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i72.UsersRepository>(
      () => _i73.UsersRepositoryImpl(gh<_i57.UsersDatasource>()));
  gh.lazySingleton<_i74.UsersRepository>(
      () => _i75.UsersRepositoryImpl(gh<_i49.UsersDatasource>()));
  gh.lazySingleton<_i76.GeneralConfigsDatasource>(
      () => _i76.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i77.FinancePendingRepo>(
      () => _i78.FinancePendingRepoImpl(gh<_i41.FinancePendingDatasource>()));
  gh.lazySingleton<_i79.PendingInvoicesRepo>(
      () => _i80.PendingInvoicesRepoImpl(gh<_i12.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i81.BranchesDatasource>(
      () => _i81.BranchesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i82.ClientsCareReportsRepo>(() =>
      _i83.ClientsCareReportsRepoImpl(gh<_i25.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i84.ExceededClientsRepo>(
      () => _i85.ExceededClientsRepoImpl(gh<_i51.ExceededClientsDatasource>()));
  gh.factory<_i86.ActionUserUsecase>(
      () => _i86.ActionUserUsecase(gh<_i74.UsersRepository>()));
  gh.lazySingleton<_i87.BranchesRepository>(
      () => _i88.BranchesRepositoryImpl(gh<_i81.BranchesDatasource>()));
  gh.lazySingleton<_i89.GetEvaluationLevelReportUsecase>(() =>
      _i89.GetEvaluationLevelReportUsecase(
          gh<_i42.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i90.ClientsInstallReportsRepo>(() =>
      _i91.ClientsInstallReportsRepoImpl(
          gh<_i21.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i92.AgentsDistributorsDataSource>(
      () => _i92.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i93.TaskDatasource>(
      () => _i93.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i94.GetClientsInstallReportsUsecase>(() =>
      _i94.GetClientsInstallReportsUsecase(
          gh<_i90.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i95.PreviousRatingsRepo>(
      () => _i96.PreviousRatingsRepoImpl(gh<_i24.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i97.ClientLogsTabRepo>(
      () => _i98.ClientLogsTabRepoImpl(gh<_i64.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i99.DeletedInvoicesDatasource>(
      () => _i99.DeletedInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i100.AddLevelUsecase>(
      () => _i100.AddLevelUsecase(gh<_i45.LevelsRepo>()));
  gh.lazySingleton<_i101.GetLevelsUsecase>(
      () => _i101.GetLevelsUsecase(gh<_i45.LevelsRepo>()));
  gh.lazySingleton<_i102.SupportTabDataSource>(
      () => _i102.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i103.GetUsersUsecase>(
      () => _i103.GetUsersUsecase(gh<_i72.UsersRepository>()));
  gh.lazySingleton<_i104.GetPendingInvoicesUsecase>(
      () => _i104.GetPendingInvoicesUsecase(gh<_i79.PendingInvoicesRepo>()));
  gh.lazySingleton<_i105.GetClientsCareReportsUsecase>(() =>
      _i105.GetClientsCareReportsUsecase(gh<_i82.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i106.InvoicesTabDataSource>(
      () => _i106.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i107.CitiesRepository>(
      () => _i108.CitiesRepositoryImpl(gh<_i58.CitiesDatasource>()));
  gh.lazySingleton<_i109.GetCitiesUseCase>(
      () => _i109.GetCitiesUseCase(gh<_i107.CitiesRepository>()));
  gh.lazySingleton<_i110.AddTicketUseCase>(
      () => _i110.AddTicketUseCase(gh<_i60.TicketsRepo>()));
  gh.lazySingleton<_i111.EditTicketTypeUseCase>(
      () => _i111.EditTicketTypeUseCase(gh<_i60.TicketsRepo>()));
  gh.lazySingleton<_i112.GetClientTicketsUseCase>(
      () => _i112.GetClientTicketsUseCase(gh<_i60.TicketsRepo>()));
  gh.lazySingleton<_i113.GetTicketsUseCase>(
      () => _i113.GetTicketsUseCase(gh<_i60.TicketsRepo>()));
  gh.lazySingleton<_i114.GetTicketByIdUseCase>(
      () => _i114.GetTicketByIdUseCase(gh<_i60.TicketsRepo>()));
  gh.lazySingleton<_i115.TransferTicketUseCase>(
      () => _i115.TransferTicketUseCase(gh<_i60.TicketsRepo>()));
  gh.factory<_i116.TicketsCubit>(() => _i116.TicketsCubit(
        gh<_i113.GetTicketsUseCase>(),
        gh<_i114.GetTicketByIdUseCase>(),
        gh<_i112.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i117.LevelsCubit>(() => _i117.LevelsCubit(
        gh<_i101.GetLevelsUsecase>(),
        gh<_i100.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i118.LoginRemoteDataSource>(
      () => _i118.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i119.EmployeesSalesReportsRepo>(() =>
      _i120.EmployeesSalesReportsRepoImpl(
          gh<_i34.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i121.AdvancedConfigsRepository>(() =>
      _i122.AdvancedConfigsRepositoryImpl(
          gh<_i59.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i123.ParticipateListRepository>(() =>
      _i124.ParticipateListRepositoryImpl(
          gh<_i32.ParticipatesListDatasource>()));
  gh.lazySingleton<_i125.LatestClientsUpdatesDatasource>(
      () => _i125.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i126.ManageWithdrawnInvoicesDataSource>(
      () => _i126.ManageWithdrawnInvoicesDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i127.WithdrawnInvoicesDataSource>(
      () => _i127.WithdrawnInvoicesDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i128.InvoicesSectionRepo>(
      () => _i129.InvoicesTabRepoImpl(gh<_i106.InvoicesTabDataSource>()));
  gh.factory<_i130.SupportClientsAcceptCubit>(() =>
      _i130.SupportClientsAcceptCubit(
          gh<_i71.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i131.WaitingAgentsDataSource>(
      () => _i131.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i132.SpecialClientsRepository>(() =>
      _i133.SpecialClientsRepositoryImpl(gh<_i53.SpecialClientsDatasource>()));
  gh.lazySingleton<_i134.GetFinancePendingInvoicesUsecase>(() =>
      _i134.GetFinancePendingInvoicesUsecase(gh<_i77.FinancePendingRepo>()));
  gh.lazySingleton<_i135.ProductsSalesReportsRepo>(() =>
      _i136.ProductsSalesReportsRepoImpl(
          gh<_i15.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i137.AgentsDistributorsProfileDataSource>(() =>
      _i137.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i138.EditTicketCubit>(() => _i138.EditTicketCubit(
        gh<_i111.EditTicketTypeUseCase>(),
        gh<_i115.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i139.ClientsStatusReportsRepo>(() =>
      _i140.ClientsStatusReportsRepoImpl(
          gh<_i29.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i141.DatesTableDataSource>(
      () => _i141.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i142.GetDelayAfterInstallUseCase>(() =>
      _i142.GetDelayAfterInstallUseCase(gh<_i69.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i143.RegionsDatasource>(
      () => _i143.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i144.LocationServices>(
      () => _i144.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i145.GetClientsDebtsReportsUsecase>(() =>
      _i145.GetClientsDebtsReportsUsecase(gh<_i65.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i146.GreetingCommunicationRepo>(() =>
      _i147.GreetingCommunicationRepoImpl(
          gh<_i17.GreetingCommunicationDatasource>()));
  gh.singleton<_i148.CacheServices>(
    () => _i149.SecureStorageConsumer(gh<_i20.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i150.ManageWithdrawnInvoicesRepo>(() =>
      _i151.ManageWithdrawnInvoicesRepoImpl(
          gh<_i126.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i148.CacheServices>(() async =>
      _i152.PrefsConsumer(await gh.getAsync<_i19.SharedPreferences>()));
  gh.lazySingleton<_i153.InstallQualityRepo>(
      () => _i154.InstallQualityRepoImpl(gh<_i44.InstallQualityDatasource>()));
  gh.lazySingleton<_i155.PrivilegesRepo>(
      () => _i156.PrivilegesRepoImpl(gh<_i13.PrivilegesDatasource>()));
  gh.lazySingleton<_i157.DelayInstallReportsRepo>(() =>
      _i158.DelayInstallReportsRepoImpl(
          gh<_i31.DelayInstallReportsDatasource>()));
  gh.factory<_i159.AppRepository>(
      () => _i160.AppRepositoryImpl(gh<_i52.AppDatasource>()));
  gh.factory<_i161.UpdatePrivilegesUsecase>(
      () => _i161.UpdatePrivilegesUsecase(gh<_i155.PrivilegesRepo>()));
  gh.lazySingleton<_i162.GetPrivilegesUsecase>(
      () => _i162.GetPrivilegesUsecase(gh<_i155.PrivilegesRepo>()));
  gh.lazySingleton<_i163.AgentsDistributorsActionsRepo>(() =>
      _i164.AgentsDistributorsActionsRepoImpl(
          gh<_i18.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i165.FinancePendingCubit>(() =>
      _i165.FinancePendingCubit(gh<_i134.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i166.DeletedInvoicesRepo>(() =>
      _i167.DeletedInvoicesRepoImpl(gh<_i99.DeletedInvoicesDatasource>()));
  gh.factory<_i168.DelayAfterInstallCubit>(() =>
      _i168.DelayAfterInstallCubit(gh<_i142.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i169.GetRegionsSalesReportsUsecase>(() =>
      _i169.GetRegionsSalesReportsUsecase(gh<_i62.RegionsSalesReportsRepo>()));
  gh.factory<_i170.ClientsCareReportsCubit>(() =>
      _i170.ClientsCareReportsCubit(gh<_i105.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i171.SupportTabRepo>(
      () => _i172.SupportTabRepoImpl(gh<_i102.SupportTabDataSource>()));
  gh.factory<_i173.GetSpecialClientsUsecase>(() =>
      _i173.GetSpecialClientsUsecase(gh<_i132.SpecialClientsRepository>()));
  gh.lazySingleton<_i174.GetInvoicesByPrivilegesUsecase>(() =>
      _i174.GetInvoicesByPrivilegesUsecase(gh<_i128.InvoicesSectionRepo>()));
  gh.lazySingleton<_i175.GetClientsAcceptUseCase>(
      () => _i175.GetClientsAcceptUseCase(gh<_i38.ClientsAcceptRepository>()));
  gh.lazySingleton<_i176.GeneralConfigsRepository>(() =>
      _i177.GeneralConfigsRepositoryImpl(gh<_i76.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i178.GetNotificationsUsecase>(
      () => _i178.GetNotificationsUsecase(gh<_i26.NotificationsRepo>()));
  gh.lazySingleton<_i179.GetUnreadNotificationsCountUsecase>(() =>
      _i179.GetUnreadNotificationsCountUsecase(gh<_i26.NotificationsRepo>()));
  gh.lazySingleton<_i180.MarkNotificationsAsReadUsecase>(
      () => _i180.MarkNotificationsAsReadUsecase(gh<_i26.NotificationsRepo>()));
  gh.lazySingleton<_i181.GetPeriodicCommunicationReportsUsecase>(() =>
      _i181.GetPeriodicCommunicationReportsUsecase(
          gh<_i35.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i182.GetBranchesByIdCountryUseCase>(
      () => _i182.GetBranchesByIdCountryUseCase(gh<_i87.BranchesRepository>()));
  gh.factory<_i183.CompanyRepository>(
      () => _i184.CompanyRepositoryImpl(gh<_i55.CommentCompanyDatasource>()));
  gh.singleton<_i185.PrivilegesCubit>(() => _i185.PrivilegesCubit(
        gh<_i162.GetPrivilegesUsecase>(),
        gh<_i161.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i186.GetInstallUseCase>(
      () => _i186.GetInstallUseCase(gh<_i153.InstallQualityRepo>()));
  gh.lazySingleton<_i187.AgentsDistributorsProfileRepo>(() =>
      _i188.AgentsDistributorsProfileRepoImpl(
          gh<_i137.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i189.AddDateInstallUsecase>(
      () => _i189.AddDateInstallUsecase(gh<_i171.SupportTabRepo>()));
  gh.lazySingleton<_i190.CancelDateInstallUsecase>(
      () => _i190.CancelDateInstallUsecase(gh<_i171.SupportTabRepo>()));
  gh.lazySingleton<_i191.GetInvoiceByClientUsecase>(
      () => _i191.GetInvoiceByClientUsecase(gh<_i171.SupportTabRepo>()));
  gh.lazySingleton<_i192.ReceiveDeviceUsecase>(
      () => _i192.ReceiveDeviceUsecase(gh<_i171.SupportTabRepo>()));
  gh.lazySingleton<_i193.ReturnInvoiceApproveUsecase>(
      () => _i193.ReturnInvoiceApproveUsecase(gh<_i171.SupportTabRepo>()));
  gh.lazySingleton<_i194.SetDateDoneUsecase>(
      () => _i194.SetDateDoneUsecase(gh<_i171.SupportTabRepo>()));
  gh.lazySingleton<_i195.SetReadyInstallUsecase>(
      () => _i195.SetReadyInstallUsecase(gh<_i171.SupportTabRepo>()));
  gh.lazySingleton<_i196.GetAllUsersUseCase>(
      () => _i196.GetAllUsersUseCase(gh<_i128.InvoicesSectionRepo>()));
  gh.lazySingleton<_i197.ClientsDebtsRepo>(
      () => _i198.ClientsDebtsRepoImpl(gh<_i40.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i199.PeriodicCommunicationRepo>(() =>
      _i200.PeriodicCommunicationRepoImpl(
          gh<_i33.PeriodicCommunicationDatasource>()));
  gh.factory<_i201.ImportantLinksRepo>(
      () => _i202.ImportantLinksRepoImpl(gh<_i56.ImportantLinksDatasource>()));
  gh.lazySingleton<_i203.GetClientLogsUsecase>(
      () => _i203.GetClientLogsUsecase(gh<_i97.ClientLogsTabRepo>()));
  gh.lazySingleton<_i204.SupportClientsInvoicesRepo>(() =>
      _i205.SupportClientsInvoicesRepoImpl(
          gh<_i48.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i206.GetBranchesForUserUsecase>(
      () => _i206.GetBranchesForUserUsecase(gh<_i74.UsersRepository>()));
  gh.lazySingleton<_i207.GetLevelsForUserUsecase>(
      () => _i207.GetLevelsForUserUsecase(gh<_i74.UsersRepository>()));
  gh.lazySingleton<_i208.GetManagesForUserUsecase>(
      () => _i208.GetManagesForUserUsecase(gh<_i74.UsersRepository>()));
  gh.factory<_i209.GetUsersUsecase>(
      () => _i209.GetUsersUsecase(gh<_i74.UsersRepository>()));
  gh.lazySingleton<_i210.GetSupportClientsInvoicesUseCase>(() =>
      _i210.GetSupportClientsInvoicesUseCase(
          gh<_i204.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i211.ManageWithdrawalsRepository>(() =>
      _i212.ManageWithdrawalsRepositoryImpl(
          gh<_i37.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i213.AgentsDistributorsRepo>(() =>
      _i214.AgentsDistributorsRepoImpl(
          gh<_i92.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i215.GetProductsSalesReportsUsecase>(() =>
      _i215.GetProductsSalesReportsUsecase(
          gh<_i135.ProductsSalesReportsRepo>()));
  gh.singleton<_i216.CitiesCubit>(
      () => _i216.CitiesCubit(gh<_i109.GetCitiesUseCase>()));
  gh.factory<_i217.UsersTypeCubit>(
      () => _i217.UsersTypeCubit(gh<_i103.GetUsersUsecase>()));
  gh.factory<_i218.ClientsListRepository>(
      () => _i219.ClientsListRepositoryImpl(gh<_i54.ClientsListDatasource>()));
  gh.factory<_i220.AddParticipateCommentUsecase>(() =>
      _i220.AddParticipateCommentUsecase(
          gh<_i123.ParticipateListRepository>()));
  gh.factory<_i221.AddParticipateUserUsecase>(() =>
      _i221.AddParticipateUserUsecase(gh<_i123.ParticipateListRepository>()));
  gh.factory<_i222.EditParticipateUserUsecase>(() =>
      _i222.EditParticipateUserUsecase(gh<_i123.ParticipateListRepository>()));
  gh.factory<_i223.GetInvoiceByIdUsecase>(
      () => _i223.GetInvoiceByIdUsecase(gh<_i123.ParticipateListRepository>()));
  gh.factory<_i224.ParticipateClientListUsecase>(() =>
      _i224.ParticipateClientListUsecase(
          gh<_i123.ParticipateListRepository>()));
  gh.factory<_i225.ParticipateCommentListUsecase>(() =>
      _i225.ParticipateCommentListUsecase(
          gh<_i123.ParticipateListRepository>()));
  gh.factory<_i226.ParticipateInvoiceListUsecase>(() =>
      _i226.ParticipateInvoiceListUsecase(
          gh<_i123.ParticipateListRepository>()));
  gh.factory<_i227.ParticipateListUsecase>(() =>
      _i227.ParticipateListUsecase(gh<_i123.ParticipateListRepository>()));
  gh.lazySingleton<_i228.ChangeParticipateStatusUsecase>(() =>
      _i228.ChangeParticipateStatusUsecase(
          gh<_i123.ParticipateListRepository>()));
  gh.factory<_i229.PendingInvoicesCubit>(
      () => _i229.PendingInvoicesCubit(gh<_i104.GetPendingInvoicesUsecase>()));
  gh.factory<_i230.EvaluationLevelReportCubit>(() =>
      _i230.EvaluationLevelReportCubit(
          gh<_i89.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i231.GetEmployeesSalesReportsUsecase>(() =>
      _i231.GetEmployeesSalesReportsUsecase(
          gh<_i119.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i232.GetGreetingCommunicationUseCase>(() =>
      _i232.GetGreetingCommunicationUseCase(
          gh<_i146.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i233.ClientsTransferApprovalsRepo>(() =>
      _i234.ClientsTransferApprovalsRepoImpl(
          gh<_i50.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i235.GetDeletedInvoicesUsecase>(
      () => _i235.GetDeletedInvoicesUsecase(gh<_i166.DeletedInvoicesRepo>()));
  gh.lazySingleton<_i236.GetClientsStatusReportsUsecase>(() =>
      _i236.GetClientsStatusReportsUsecase(
          gh<_i139.ClientsStatusReportsRepo>()));
  gh.factory<_i237.ActionLinkUsecase>(
      () => _i237.ActionLinkUsecase(gh<_i201.ImportantLinksRepo>()));
  gh.factory<_i238.GetImportantLinksUsecase>(
      () => _i238.GetImportantLinksUsecase(gh<_i201.ImportantLinksRepo>()));
  gh.lazySingleton<_i239.GetPreviousRatingsUsecase>(
      () => _i239.GetPreviousRatingsUsecase(gh<_i95.PreviousRatingsRepo>()));
  gh.lazySingleton<_i240.WaitingAgentsRepo>(
      () => _i241.WaitingAgentsRepoImpl(gh<_i131.WaitingAgentsDataSource>()));
  gh.factory<_i242.AddClientUserUsecase>(
      () => _i242.AddClientUserUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i243.ApproveRejectClientUsecase>(() =>
      _i243.ApproveRejectClientUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i244.ChangeTypeClientUsecase>(
      () => _i244.ChangeTypeClientUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i245.EditClientUserUsecase>(
      () => _i245.EditClientUserUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i246.GetClientsListByRegionUseCase>(() =>
      _i246.GetClientsListByRegionUseCase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i247.GetClientsListByUserUseCase>(() =>
      _i247.GetClientsListByUserUseCase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i248.GetClientsWithFilterUserUsecase>(() =>
      _i248.GetClientsWithFilterUserUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i249.GetClientMarketingReportUsecase>(() =>
      _i249.GetClientMarketingReportUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i250.GetRecommendedClientsUsecase>(() =>
      _i250.GetRecommendedClientsUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i251.GetSimilarClientsUsecase>(
      () => _i251.GetSimilarClientsUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i252.ReceiveClientUserUsecase>(
      () => _i252.ReceiveClientUserUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i253.TransferClientUserUsecase>(
      () => _i253.TransferClientUserUsecase(gh<_i218.ClientsListRepository>()));
  gh.lazySingleton<_i254.GetHighSimilarClientsUsecase>(() =>
      _i254.GetHighSimilarClientsUsecase(gh<_i218.ClientsListRepository>()));
  gh.factory<_i255.EmployeesSalesReportsCubit>(() =>
      _i255.EmployeesSalesReportsCubit(
          gh<_i231.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i256.ChangeStateAgentUseCase>(
      () => _i256.ChangeStateAgentUseCase(gh<_i213.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i257.GetAgentsAndDistributorsUseCase>(() =>
      _i257.GetAgentsAndDistributorsUseCase(
          gh<_i213.AgentsDistributorsRepo>()));
  gh.factory<_i258.ClientsAcceptCubit>(
      () => _i258.ClientsAcceptCubit(gh<_i175.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i259.CancelWithdrawalUsecase>(() =>
      _i259.CancelWithdrawalUsecase(gh<_i211.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i260.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i260.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i211.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i261.GetWithdrawalsInvoicesUsecase>(() =>
      _i261.GetWithdrawalsInvoicesUsecase(
          gh<_i211.ManageWithdrawalsRepository>()));
  gh.factory<_i262.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i262.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i211.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i263.ExceededClientsUseCase>(
      () => _i263.ExceededClientsUseCase(gh<_i84.ExceededClientsRepo>()));
  gh.lazySingleton<_i264.TransferExceededClientsUseCase>(() =>
      _i264.TransferExceededClientsUseCase(gh<_i84.ExceededClientsRepo>()));
  gh.lazySingleton<_i265.LoginLocalDataSource>(() =>
      _i265.LoginLocalDataSourceImpl(
          gh<_i148.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i266.EditAdvancedConfigsUsecase>(() =>
      _i266.EditAdvancedConfigsUsecase(gh<_i121.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i267.GetAdvancedConfigsUsecase>(() =>
      _i267.GetAdvancedConfigsUsecase(gh<_i121.AdvancedConfigsRepository>()));
  gh.factory<_i268.ClientsInstallReportsCubit>(() =>
      _i268.ClientsInstallReportsCubit(
          gh<_i94.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i269.DatesTableRepo>(
      () => _i270.DatesTableRepoImpl(gh<_i141.DatesTableDataSource>()));
  gh.factory<_i271.GetVersionUseCase>(
      () => _i271.GetVersionUseCase(gh<_i159.AppRepository>()));
  gh.factory<_i272.AddTicketCubit>(
      () => _i272.AddTicketCubit(gh<_i110.AddTicketUseCase>()));
  gh.lazySingleton<_i273.LatestClientsUpdatesRepository>(() =>
      _i274.LatestClientsUpdatesRepositoryImpl(
          gh<_i125.LatestClientsUpdatesDatasource>()));
  gh.factory<_i275.TaskRepository>(
      () => _i276.TaskRepositoryImpl(gh<_i93.TaskDatasource>()));
  gh.lazySingleton<_i277.EditGeneralConfigsUsecase>(() =>
      _i277.EditGeneralConfigsUsecase(gh<_i176.GeneralConfigsRepository>()));
  gh.lazySingleton<_i278.GetGeneralConfigsUsecase>(() =>
      _i278.GetGeneralConfigsUsecase(gh<_i176.GeneralConfigsRepository>()));
  gh.factory<_i279.PeriodicCommunicationReportsCubit>(() =>
      _i279.PeriodicCommunicationReportsCubit(
          gh<_i181.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i280.InstallQualityCubit>(
      () => _i280.InstallQualityCubit(gh<_i186.GetInstallUseCase>()));
  gh.factory<_i281.ImportantLinksCubit>(() => _i281.ImportantLinksCubit(
        gh<_i238.GetImportantLinksUsecase>(),
        gh<_i237.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i282.AddAgentUseCase>(
      () => _i282.AddAgentUseCase(gh<_i163.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i283.UpdateAgentUseCase>(() =>
      _i283.UpdateAgentUseCase(gh<_i163.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i284.GetDelayInstallReportsUseCase>(() =>
      _i284.GetDelayInstallReportsUseCase(gh<_i157.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i285.CrudAgentSupportFilesUsecase>(() =>
      _i285.CrudAgentSupportFilesUsecase(
          gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i286.GetClientsTransferApprovalsUsecase>(() =>
      _i286.GetClientsTransferApprovalsUsecase(
          gh<_i233.ClientsTransferApprovalsRepo>()));
  gh.factory<_i287.ClientsStatusReportsCubit>(() =>
      _i287.ClientsStatusReportsCubit(
          gh<_i236.GetClientsStatusReportsUsecase>()));
  gh.factory<_i288.SupportTabCubit>(() => _i288.SupportTabCubit(
        gh<_i191.GetInvoiceByClientUsecase>(),
        gh<_i189.AddDateInstallUsecase>(),
        gh<_i194.SetDateDoneUsecase>(),
        gh<_i195.SetReadyInstallUsecase>(),
        gh<_i193.ReturnInvoiceApproveUsecase>(),
        gh<_i192.ReceiveDeviceUsecase>(),
        gh<_i190.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i289.ClientsDebtsReportsCubit>(() =>
      _i289.ClientsDebtsReportsCubit(
          gh<_i145.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i290.DeletedInvoicesCubit>(
      () => _i290.DeletedInvoicesCubit(gh<_i235.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i291.AddAgentDateUseCase>(() =>
      _i291.AddAgentDateUseCase(gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i292.GetManageWithdrawnInvoicesUsecase>(() =>
      _i292.GetManageWithdrawnInvoicesUsecase(
          gh<_i150.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i293.NotificationsCubit>(() => _i293.NotificationsCubit(
        gh<_i178.GetNotificationsUsecase>(),
        gh<_i180.MarkNotificationsAsReadUsecase>(),
        gh<_i179.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i294.WithdrawnInvoicesRepo>(() =>
      _i295.WithdrawnInvoicesRepoImpl(gh<_i127.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i296.RegionsRepository>(
      () => _i297.RegionsRepositoryImpl(gh<_i143.RegionsDatasource>()));
  gh.factory<_i298.ClientLogsTabCubit>(
      () => _i298.ClientLogsTabCubit(gh<_i203.GetClientLogsUsecase>()));
  gh.factory<_i299.RegionsSalesReportsCubit>(() =>
      _i299.RegionsSalesReportsCubit(
          gh<_i169.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i300.AgentsDistributorsActionsCubit>(
      () => _i300.AgentsDistributorsActionsCubit(
            gh<_i109.GetCitiesUseCase>(),
            gh<_i282.AddAgentUseCase>(),
            gh<_i283.UpdateAgentUseCase>(),
          ));
  gh.factory<_i301.InvoicesSectionCubit>(() => _i301.InvoicesSectionCubit(
        gh<_i174.GetInvoicesByPrivilegesUsecase>(),
        gh<_i257.GetAgentsAndDistributorsUseCase>(),
        gh<_i227.ParticipateListUsecase>(),
        gh<_i196.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i302.LoginRepo>(() => _i303.LoginRepoImpl(
        gh<_i118.LoginRemoteDataSource>(),
        gh<_i265.LoginLocalDataSource>(),
      ));
  gh.factory<_i304.SpecialClientsBloc>(
      () => _i304.SpecialClientsBloc(gh<_i173.GetSpecialClientsUsecase>()));
  gh.factory<_i305.AddCommentUsecase>(
      () => _i305.AddCommentUsecase(gh<_i183.CompanyRepository>()));
  gh.factory<_i306.GetCommentUsecase>(
      () => _i306.GetCommentUsecase(gh<_i183.CompanyRepository>()));
  gh.factory<_i307.DelayInstallReportsCubit>(() =>
      _i307.DelayInstallReportsCubit(
          gh<_i284.GetDelayInstallReportsUseCase>()));
  gh.factory<_i308.GreetingCommunicationCubit>(() =>
      _i308.GreetingCommunicationCubit(
          gh<_i232.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i309.GetRegionsUseCase>(
      () => _i309.GetRegionsUseCase(gh<_i296.RegionsRepository>()));
  gh.lazySingleton<_i310.GetLatestClientsUseCase>(() =>
      _i310.GetLatestClientsUseCase(
          gh<_i273.LatestClientsUpdatesRepository>()));
  gh.factory<_i311.AdvancedCofigsCubit>(() => _i311.AdvancedCofigsCubit(
        gh<_i267.GetAdvancedConfigsUsecase>(),
        gh<_i266.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i312.SupportClientsInvoicesCubit>(() =>
      _i312.SupportClientsInvoicesCubit(
          gh<_i210.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i313.ParticipateListBloc>(() => _i313.ParticipateListBloc(
        gh<_i227.ParticipateListUsecase>(),
        gh<_i221.AddParticipateUserUsecase>(),
        gh<_i222.EditParticipateUserUsecase>(),
        gh<_i224.ParticipateClientListUsecase>(),
        gh<_i226.ParticipateInvoiceListUsecase>(),
        gh<_i223.GetInvoiceByIdUsecase>(),
        gh<_i225.ParticipateCommentListUsecase>(),
        gh<_i220.AddParticipateCommentUsecase>(),
        gh<_i228.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i314.CacheTokenUsecase>(
      () => _i314.CacheTokenUsecase(gh<_i302.LoginRepo>()));
  gh.lazySingleton<_i315.GetTokenUsecase>(
      () => _i315.GetTokenUsecase(gh<_i302.LoginRepo>()));
  gh.lazySingleton<_i316.LoginUsecase>(
      () => _i316.LoginUsecase(gh<_i302.LoginRepo>()));
  gh.lazySingleton<_i317.ValidateTokenUsecase>(
      () => _i317.ValidateTokenUsecase(gh<_i302.LoginRepo>()));
  gh.lazySingleton<_i318.VerifyOtpUsecase>(
      () => _i318.VerifyOtpUsecase(gh<_i302.LoginRepo>()));
  gh.factory<_i319.ClientsTransferApprovalsCubit>(() =>
      _i319.ClientsTransferApprovalsCubit(
          gh<_i286.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i320.RegionsCubit>(
      () => _i320.RegionsCubit(gh<_i309.GetRegionsUseCase>()));
  gh.factory<_i321.GeneralCofigsCubit>(() => _i321.GeneralCofigsCubit(
        gh<_i278.GetGeneralConfigsUsecase>(),
        gh<_i277.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i322.GetPeriodicCommunicationUseCase>(() =>
      _i322.GetPeriodicCommunicationUseCase(
          gh<_i199.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i323.GetClientsDebtsUsecase>(
      () => _i323.GetClientsDebtsUsecase(gh<_i197.ClientsDebtsRepo>()));
  gh.lazySingleton<_i324.CrudClientSupportFilesUsecase>(() =>
      _i324.CrudClientSupportFilesUsecase(
          repository: gh<_i218.ClientsListRepository>()));
  gh.lazySingleton<_i325.GetClientSupportFilesUsecase>(() =>
      _i325.GetClientSupportFilesUsecase(
          repository: gh<_i218.ClientsListRepository>()));
  gh.factory<_i326.BranchesCubit>(
      () => _i326.BranchesCubit(gh<_i182.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i327.AddAgentCommentUsecase>(() =>
      _i327.AddAgentCommentUsecase(gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i328.DoneTrainingUsecase>(() =>
      _i328.DoneTrainingUsecase(gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i329.GetAgentUsecase>(
      () => _i329.GetAgentUsecase(gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i330.GetAgentClientListUsecase>(() =>
      _i330.GetAgentClientListUsecase(
          gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i331.GetAgentCommentsListUsecase>(() =>
      _i331.GetAgentCommentsListUsecase(
          gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i332.GetAgentDatesListUsecase>(() =>
      _i332.GetAgentDatesListUsecase(
          gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i333.GetAgentInvoiceListUsecase>(() =>
      _i333.GetAgentInvoiceListUsecase(
          gh<_i187.AgentsDistributorsProfileRepo>()));
  gh.factory<_i334.AddRejectReasonsUsecase>(() =>
      _i334.AddRejectReasonsUsecase(gh<_i211.ManageWithdrawalsRepository>()));
  gh.factory<_i335.EditRejectReasonsUsecase>(() =>
      _i335.EditRejectReasonsUsecase(gh<_i211.ManageWithdrawalsRepository>()));
  gh.factory<_i336.GetRejectReasonsUsecase>(() =>
      _i336.GetRejectReasonsUsecase(gh<_i211.ManageWithdrawalsRepository>()));
  gh.factory<_i337.GetUserSeriesUsecase>(() =>
      _i337.GetUserSeriesUsecase(gh<_i211.ManageWithdrawalsRepository>()));
  gh.factory<_i338.GetWithdrawnDetailsUsecase>(() =>
      _i338.GetWithdrawnDetailsUsecase(
          gh<_i211.ManageWithdrawalsRepository>()));
  gh.factory<_i339.SetApproveSeriesUsecase>(() =>
      _i339.SetApproveSeriesUsecase(gh<_i211.ManageWithdrawalsRepository>()));
  gh.factory<_i340.UpdateSeriesUsecase>(
      () => _i340.UpdateSeriesUsecase(gh<_i211.ManageWithdrawalsRepository>()));
  gh.singleton<_i341.AppManagerCubit>(
      () => _i341.AppManagerCubit(gh<_i271.GetVersionUseCase>()));
  gh.lazySingleton<_i342.GetWaitingAgentsUsecase>(
      () => _i342.GetWaitingAgentsUsecase(gh<_i240.WaitingAgentsRepo>()));
  gh.factory<_i343.ProductsSalesReportsCubit>(() =>
      _i343.ProductsSalesReportsCubit(
          gh<_i215.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i344.GetWithdrawnInvoicesUsecase>(() =>
      _i344.GetWithdrawnInvoicesUsecase(gh<_i294.WithdrawnInvoicesRepo>()));
  gh.factory<_i345.PreviousRatingsCubit>(
      () => _i345.PreviousRatingsCubit(gh<_i239.GetPreviousRatingsUsecase>()));
  gh.factory<_i346.AgentsDistributorsCubit>(() => _i346.AgentsDistributorsCubit(
        gh<_i257.GetAgentsAndDistributorsUseCase>(),
        gh<_i256.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i347.ExceededClientsCubit>(() => _i347.ExceededClientsCubit(
        gh<_i263.ExceededClientsUseCase>(),
        gh<_i264.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i348.ManageWithdrawalsCubit>(() => _i348.ManageWithdrawalsCubit(
        gh<_i337.GetUserSeriesUsecase>(),
        gh<_i340.UpdateSeriesUsecase>(),
        gh<_i209.GetUsersUsecase>(),
        gh<_i261.GetWithdrawalsInvoicesUsecase>(),
        gh<_i262.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i339.SetApproveSeriesUsecase>(),
        gh<_i338.GetWithdrawnDetailsUsecase>(),
        gh<_i334.AddRejectReasonsUsecase>(),
        gh<_i336.GetRejectReasonsUsecase>(),
        gh<_i335.EditRejectReasonsUsecase>(),
        gh<_i260.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i259.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i349.ManageWithdrawnInvoicesCubit>(() =>
      _i349.ManageWithdrawnInvoicesCubit(
          gh<_i292.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i350.LatestClientsUpdatesCubit>(() =>
      _i350.LatestClientsUpdatesCubit(gh<_i310.GetLatestClientsUseCase>()));
  gh.factory<_i351.AttachmentsRowCubit>(() => _i351.AttachmentsRowCubit(
        gh<_i325.GetClientSupportFilesUsecase>(),
        gh<_i324.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i352.CancelScheduleUsecase>(
      () => _i352.CancelScheduleUsecase(gh<_i269.DatesTableRepo>()));
  gh.lazySingleton<_i353.ChangeDateToDonUsecase>(
      () => _i353.ChangeDateToDonUsecase(gh<_i269.DatesTableRepo>()));
  gh.lazySingleton<_i354.GetCancelReasonsUsecase>(
      () => _i354.GetCancelReasonsUsecase(gh<_i269.DatesTableRepo>()));
  gh.lazySingleton<_i355.GetDateInstallationUsecase>(
      () => _i355.GetDateInstallationUsecase(gh<_i269.DatesTableRepo>()));
  gh.lazySingleton<_i356.GetInvoicesByClientForDateUsecase>(() =>
      _i356.GetInvoicesByClientForDateUsecase(gh<_i269.DatesTableRepo>()));
  gh.lazySingleton<_i357.GetSubscribedClientsUsecase>(
      () => _i357.GetSubscribedClientsUsecase(gh<_i269.DatesTableRepo>()));
  gh.lazySingleton<_i358.RescheduleDateUsecase>(
      () => _i358.RescheduleDateUsecase(gh<_i269.DatesTableRepo>()));
  gh.lazySingleton<_i359.ReturnScheduleVisitToOpenUsecase>(
      () => _i359.ReturnScheduleVisitToOpenUsecase(gh<_i269.DatesTableRepo>()));
  gh.factory<_i360.AgentsDistributorsProfileBloc>(
      () => _i360.AgentsDistributorsProfileBloc(
            gh<_i330.GetAgentClientListUsecase>(),
            gh<_i333.GetAgentInvoiceListUsecase>(),
            gh<_i223.GetInvoiceByIdUsecase>(),
            gh<_i331.GetAgentCommentsListUsecase>(),
            gh<_i327.AddAgentCommentUsecase>(),
            gh<_i328.DoneTrainingUsecase>(),
            gh<_i291.AddAgentDateUseCase>(),
            gh<_i332.GetAgentDatesListUsecase>(),
            gh<_i285.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i361.AddTaskUsecase>(
      () => _i361.AddTaskUsecase(gh<_i275.TaskRepository>()));
  gh.factory<_i362.ChangeStatusTaskUsecase>(
      () => _i362.ChangeStatusTaskUsecase(gh<_i275.TaskRepository>()));
  gh.factory<_i363.GetTasksUsecase>(
      () => _i363.GetTasksUsecase(gh<_i275.TaskRepository>()));
  gh.factory<_i364.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i364.GetUsersByDepartmentAndRegionUsecase(gh<_i275.TaskRepository>()));
  gh.lazySingleton<_i365.TaskCubit>(() => _i365.TaskCubit(
        gh<_i361.AddTaskUsecase>(),
        gh<_i363.GetTasksUsecase>(),
        gh<_i362.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i366.ClientsListBloc>(() => _i366.ClientsListBloc(
        gh<_i248.GetClientsWithFilterUserUsecase>(),
        gh<_i250.GetRecommendedClientsUsecase>(),
        gh<_i242.AddClientUserUsecase>(),
        gh<_i245.EditClientUserUsecase>(),
        gh<_i244.ChangeTypeClientUsecase>(),
        gh<_i251.GetSimilarClientsUsecase>(),
        gh<_i243.ApproveRejectClientUsecase>(),
        gh<_i324.CrudClientSupportFilesUsecase>(),
        gh<_i325.GetClientSupportFilesUsecase>(),
        gh<_i253.TransferClientUserUsecase>(),
        gh<_i252.ReceiveClientUserUsecase>(),
        gh<_i249.GetClientMarketingReportUsecase>(),
        gh<_i254.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i367.CompanyCubit>(() => _i367.CompanyCubit(
        gh<_i306.GetCommentUsecase>(),
        gh<_i305.AddCommentUsecase>(),
      ));
  gh.factory<_i368.ClientsDebtsCubit>(
      () => _i368.ClientsDebtsCubit(gh<_i323.GetClientsDebtsUsecase>()));
  gh.factory<_i369.PeriodicCommunicationCubit>(() =>
      _i369.PeriodicCommunicationCubit(
          gh<_i322.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i370.LoginCubit>(() => _i370.LoginCubit(
        gh<_i316.LoginUsecase>(),
        gh<_i318.VerifyOtpUsecase>(),
        gh<_i314.CacheTokenUsecase>(),
        gh<_i315.GetTokenUsecase>(),
        gh<_i317.ValidateTokenUsecase>(),
      ));
  gh.factory<_i371.DatesTableCubit>(() => _i371.DatesTableCubit(
        gh<_i355.GetDateInstallationUsecase>(),
        gh<_i358.RescheduleDateUsecase>(),
        gh<_i353.ChangeDateToDonUsecase>(),
        gh<_i352.CancelScheduleUsecase>(),
        gh<_i359.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i357.GetSubscribedClientsUsecase>(),
        gh<_i356.GetInvoicesByClientForDateUsecase>(),
        gh<_i189.AddDateInstallUsecase>(),
        gh<_i354.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i372.WithdrawnInvoicesCubit>(() =>
      _i372.WithdrawnInvoicesCubit(gh<_i344.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i373.WaitingAgentsCubit>(
      () => _i373.WaitingAgentsCubit(gh<_i342.GetWaitingAgentsUsecase>()));
  gh.factory<_i374.UsersCubit>(() => _i374.UsersCubit(
        gh<_i209.GetUsersUsecase>(),
        gh<_i86.ActionUserUsecase>(),
        gh<_i364.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i208.GetManagesForUserUsecase>(),
        gh<_i207.GetLevelsForUserUsecase>(),
        gh<_i206.GetBranchesForUserUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i375.AppModule {}
