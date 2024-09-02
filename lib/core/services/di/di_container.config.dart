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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i55;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i163;
import '../../../features/app/domain/repositories/app_repository.dart' as _i162;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i275;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i346;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i269;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i121;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i307;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i306;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i319;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i320;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i321;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i322;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i323;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i375;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i29;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i42;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i41;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i179;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i262;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i26;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i86;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i85;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i108;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i173;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i50;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i64;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i63;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i113;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i114;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i115;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i117;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i116;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i118;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i276;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i141;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i119;
import '../../../features/clients_care/clients_wrong_numbers/data/data_sources/wrong_numbers_datasource.dart'
    as _i25;
import '../../../features/clients_care/clients_wrong_numbers/data/repositories/wrong_numbers_repo_impl.dart'
    as _i34;
import '../../../features/clients_care/clients_wrong_numbers/domain/repositories/wrong_numbers_repo.dart'
    as _i33;
import '../../../features/clients_care/clients_wrong_numbers/domain/use_cases/get_wrong_numbers_usecase.dart'
    as _i178;
import '../../../features/clients_care/clients_wrong_numbers/presentation/manager/wrong_numbers_cubit.dart'
    as _i317;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i46;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i45;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i92;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i234;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i17;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i150;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i149;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i236;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i312;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i47;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i157;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i156;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i190;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i284;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i36;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i204;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i203;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i327;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i374;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i31;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i39;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i38;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i185;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i283;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i24;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i99;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i98;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i243;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i350;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i56;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i136;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i135;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i176;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i308;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i84;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i91;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i90;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i186;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i331;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i61;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i111;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i110;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i112;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i220;
import '../../../features/common/client_profile/logs_tab/data/data_sources/client_logs_tab_data_source.dart'
    as _i67;
import '../../../features/common/client_profile/logs_tab/data/repositories/client_logs_tab_repo_impl.dart'
    as _i101;
import '../../../features/common/client_profile/logs_tab/domain/repositories/client_logs_tab_repo.dart'
    as _i100;
import '../../../features/common/client_profile/logs_tab/domain/use_cases/get_client_logs_usecase.dart'
    as _i207;
import '../../../features/common/client_profile/logs_tab/presentation/manager/client_logs_cubit/client_logs_tab_cubit.dart'
    as _i302;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i105;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i175;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i174;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i193;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i194;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i195;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i196;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i197;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i198;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i199;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i292;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i146;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i301;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i300;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i313;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i325;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i60;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i76;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i75;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i106;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i221;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i62;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i125;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i124;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i270;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i271;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i315;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i79;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i181;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i180;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i281;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i282;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i326;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i49;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i48;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i103;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i104;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i120;
import '../../../features/mangement/manage_privileges/privileges/data/data_sources/privileges_datasource.dart'
    as _i13;
import '../../../features/mangement/manage_privileges/privileges/data/repositories/privileges_repo_impl.dart'
    as _i159;
import '../../../features/mangement/manage_privileges/privileges/domain/repositories/privileges_repo.dart'
    as _i158;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/get_privileges_usecase.dart'
    as _i165;
import '../../../features/mangement/manage_privileges/privileges/domain/use_cases/update_privileges_usecase.dart'
    as _i164;
import '../../../features/mangement/manage_privileges/privileges/presentation/manager/levels_cubit/privileges_cubit.dart'
    as _i189;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i52;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i78;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i77;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i89;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i210;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i211;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i212;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i213;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i379;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i40;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i216;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i215;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i339;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i263;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i340;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i264;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i341;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i342;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i266;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i265;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i343;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i344;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i345;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i353;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i14;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i28;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i27;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i182;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i183;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i184;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i297;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i43;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i202;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i201;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i328;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i373;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i57;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i223;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i222;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i246;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i247;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i248;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i329;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i249;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i253;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i330;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i250;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i251;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i252;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i258;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i254;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i255;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i256;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i257;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i371;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i53;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i238;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i237;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i290;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i324;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i44;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i81;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i80;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i137;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i168;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i128;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i278;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i277;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i314;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i355;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i83;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i82;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i107;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i233;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i58;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i188;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i187;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i309;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i310;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i372;
import '../../../features/sales/deleted_invoices/data/data_sources/deleted_invoices_datasource.dart'
    as _i102;
import '../../../features/sales/deleted_invoices/data/repositories/deleted_invoices_repo_impl.dart'
    as _i170;
import '../../../features/sales/deleted_invoices/domain/repositories/deleted_invoices_repo.dart'
    as _i169;
import '../../../features/sales/deleted_invoices/domain/use_cases/get_deleted_invoices_usecase.dart'
    as _i239;
import '../../../features/sales/deleted_invoices/presentation/manager/deleted_invoices_cubit.dart'
    as _i294;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i54;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i88;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i87;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i267;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i268;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i352;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i109;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i132;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i131;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i200;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i177;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i305;
import '../../../features/sales/manage_withdrawn_invoices/data/data_sources/manage_withdrawn_invoices_data_source.dart'
    as _i129;
import '../../../features/sales/manage_withdrawn_invoices/data/repositories/manage_withdrawn_invoices_repo_impl.dart'
    as _i154;
import '../../../features/sales/manage_withdrawn_invoices/domain/repositories/manage_withdrawn_invoices_repo.dart'
    as _i153;
import '../../../features/sales/manage_withdrawn_invoices/domain/use_cases/get_manage_withdrawn_invoices_usecase.dart'
    as _i296;
import '../../../features/sales/manage_withdrawn_invoices/presentation/manager/manage_withdrawn_invoices_cubit.dart'
    as _i354;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i18;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i95;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i140;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i167;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i192;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i218;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i166;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i191;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i217;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i332;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i295;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i286;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i260;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i289;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i333;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i334;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i335;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i336;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i337;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i338;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i261;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i287;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i304;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i365;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i351;
import '../../../features/sales/public_relations/links/data/data_sources/important_links_datasource.dart'
    as _i59;
import '../../../features/sales/public_relations/links/data/repositories/important_links_repo_impl.dart'
    as _i206;
import '../../../features/sales/public_relations/links/domain/repositories/important_links_repo.dart'
    as _i205;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i241;
import '../../../features/sales/public_relations/links/domain/use_cases/get_important_links_usecase.dart'
    as _i242;
import '../../../features/sales/public_relations/links/presentation/manager/important_links_cubit.dart'
    as _i285;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i35;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i127;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i126;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i224;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i225;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i232;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i226;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i227;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i228;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i229;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i230;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i231;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i318;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i69;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i68;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i148;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i293;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i30;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i143;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i142;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i240;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i291;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i37;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i123;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i122;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i235;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i259;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i15;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i139;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i138;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i219;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i348;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i66;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i65;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i172;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i303;
import '../../../features/sales/withdrawn_invoices/data/data_sources/withdrawn_invoices_data_source.dart'
    as _i130;
import '../../../features/sales/withdrawn_invoices/data/repositories/withdrawn_invoices_repo_impl.dart'
    as _i299;
import '../../../features/sales/withdrawn_invoices/domain/repositories/withdrawn_invoices_repo.dart'
    as _i298;
import '../../../features/sales/withdrawn_invoices/domain/use_cases/get_withdrawn_invoices_usecase.dart'
    as _i349;
import '../../../features/sales/withdrawn_invoices/presentation/manager/withdrawn_invoices_cubit.dart'
    as _i377;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i21;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i94;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i93;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i97;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i272;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i144;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i274;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i273;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i357;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i358;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i359;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i360;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i361;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i362;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i363;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i364;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i376;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i73;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i72;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i145;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i171;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i32;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i161;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i160;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i288;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i311;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i71;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i70;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i74;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i133;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i51;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i209;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i208;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i214;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i316;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i134;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i245;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i244;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i347;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i378;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i96;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i280;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i279;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i366;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i367;
import '../../../features/task_management/domain/use_cases/get_tasks_usecase.dart'
    as _i368;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i369;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i370;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i356;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i151;
import '../cache_services/prefs_consumer.dart' as _i155;
import '../cache_services/secure_storage_consumer.dart' as _i152;
import '../maps/location_services.dart' as _i147;
import 'di_container.dart' as _i380;

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
  gh.lazySingleton<_i25.WrongNumbersDatasource>(
      () => _i25.WrongNumbersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.ClientsCareReportsDatasource>(
      () => _i26.ClientsCareReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.NotificationsRepo>(
      () => _i28.NotificationsRepoImpl(gh<_i14.NotificationsDatasource>()));
  gh.lazySingleton<_i29.ClientsAcceptDatasource>(
      () => _i29.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.ClientsStatusReportsDatasource>(
      () => _i30.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.PeriodicCommunicationReportsDatasource>(() =>
      _i31.PeriodicCommunicationReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.DelayInstallReportsDatasource>(
      () => _i32.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.WrongNumbersRepo>(
      () => _i34.WrongNumbersRepoImpl(gh<_i25.WrongNumbersDatasource>()));
  gh.lazySingleton<_i35.ParticipatesListDatasource>(
      () => _i35.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i36.PeriodicCommunicationDatasource>(
      () => _i36.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i37.EmployeesSalesReportsDatasource>(
      () => _i37.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i38.PeriodicCommunicationReportsRepo>(() =>
      _i39.PeriodicCommunicationReportsRepoImpl(
          gh<_i31.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i40.ManageWithdrawalsDatasource>(
      () => _i40.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.ClientsAcceptRepository>(() =>
      _i42.ClientsAcceptRepositoryImpl(gh<_i29.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i43.ClientsDebtsDatasource>(
      () => _i43.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.FinancePendingDatasource>(
      () => _i44.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.EvaluationLevelReportRepo>(() =>
      _i46.EvaluationLevelReportRepoImpl(
          gh<_i10.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i47.InstallQualityDatasource>(
      () => _i47.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i48.LevelsRepo>(
      () => _i49.LevelsRepoImpl(gh<_i16.LevelsDatasource>()));
  gh.lazySingleton<_i50.TicketsDataSource>(
      () => _i50.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i51.SupportClientsInvoicesDatasource>(
      () => _i51.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i52.UsersDatasource>(
      () => _i52.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i19.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i20.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i53.ClientsTransferApprovalsDatasource>(
      () => _i53.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i54.ExceededClientsDatasource>(
      () => _i54.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i55.AppDatasource>(
      () => _i55.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i56.SpecialClientsDatasource>(
      () => _i56.SpecialClientsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i57.ClientsListDatasource>(
      () => _i57.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i58.CommentCompanyDatasource>(
      () => _i58.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i59.ImportantLinksDatasource>(
      () => _i59.ImportantLinksDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i60.UsersDatasource>(
      () => _i60.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i61.CitiesDatasource>(
      () => _i61.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i62.AdvancedConfigsDatasource>(
      () => _i62.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i63.TicketsRepo>(
      () => _i64.TicketsRepoImpl(gh<_i50.TicketsDataSource>()));
  gh.lazySingleton<_i65.RegionsSalesReportsRepo>(() =>
      _i66.RegionsSalesReportsRepoImpl(
          gh<_i22.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i67.ClientLogsTabDataSource>(
      () => _i67.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i68.ClientsDebtsReportsRepo>(() =>
      _i69.ClientsDebtsReportsRepoImpl(
          gh<_i23.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i70.SupportClientsAcceptRepository>(() =>
      _i71.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i72.DelayAfterInstallRepo>(() =>
      _i73.DelayAfterInstallRepoImpl(gh<_i11.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i74.GetSupportClientsAcceptUseCase>(() =>
      _i74.GetSupportClientsAcceptUseCase(
          gh<_i70.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i75.UsersRepository>(
      () => _i76.UsersRepositoryImpl(gh<_i60.UsersDatasource>()));
  gh.lazySingleton<_i77.UsersRepository>(
      () => _i78.UsersRepositoryImpl(gh<_i52.UsersDatasource>()));
  gh.lazySingleton<_i79.GeneralConfigsDatasource>(
      () => _i79.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i80.FinancePendingRepo>(
      () => _i81.FinancePendingRepoImpl(gh<_i44.FinancePendingDatasource>()));
  gh.lazySingleton<_i82.PendingInvoicesRepo>(
      () => _i83.PendingInvoicesRepoImpl(gh<_i12.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i84.BranchesDatasource>(
      () => _i84.BranchesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i85.ClientsCareReportsRepo>(() =>
      _i86.ClientsCareReportsRepoImpl(gh<_i26.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i87.ExceededClientsRepo>(
      () => _i88.ExceededClientsRepoImpl(gh<_i54.ExceededClientsDatasource>()));
  gh.factory<_i89.ActionUserUsecase>(
      () => _i89.ActionUserUsecase(gh<_i77.UsersRepository>()));
  gh.lazySingleton<_i90.BranchesRepository>(
      () => _i91.BranchesRepositoryImpl(gh<_i84.BranchesDatasource>()));
  gh.lazySingleton<_i92.GetEvaluationLevelReportUsecase>(() =>
      _i92.GetEvaluationLevelReportUsecase(
          gh<_i45.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i93.ClientsInstallReportsRepo>(() =>
      _i94.ClientsInstallReportsRepoImpl(
          gh<_i21.ClientsInstallReportsDatasource>()));
  gh.lazySingleton<_i95.AgentsDistributorsDataSource>(
      () => _i95.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i96.TaskDatasource>(
      () => _i96.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i97.GetClientsInstallReportsUsecase>(() =>
      _i97.GetClientsInstallReportsUsecase(
          gh<_i93.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i98.PreviousRatingsRepo>(
      () => _i99.PreviousRatingsRepoImpl(gh<_i24.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i100.ClientLogsTabRepo>(
      () => _i101.ClientLogsTabRepoImpl(gh<_i67.ClientLogsTabDataSource>()));
  gh.lazySingleton<_i102.DeletedInvoicesDatasource>(
      () => _i102.DeletedInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i103.AddLevelUsecase>(
      () => _i103.AddLevelUsecase(gh<_i48.LevelsRepo>()));
  gh.lazySingleton<_i104.GetLevelsUsecase>(
      () => _i104.GetLevelsUsecase(gh<_i48.LevelsRepo>()));
  gh.lazySingleton<_i105.SupportTabDataSource>(
      () => _i105.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i106.GetUsersUsecase>(
      () => _i106.GetUsersUsecase(gh<_i75.UsersRepository>()));
  gh.lazySingleton<_i107.GetPendingInvoicesUsecase>(
      () => _i107.GetPendingInvoicesUsecase(gh<_i82.PendingInvoicesRepo>()));
  gh.lazySingleton<_i108.GetClientsCareReportsUsecase>(() =>
      _i108.GetClientsCareReportsUsecase(gh<_i85.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i109.InvoicesTabDataSource>(
      () => _i109.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i110.CitiesRepository>(
      () => _i111.CitiesRepositoryImpl(gh<_i61.CitiesDatasource>()));
  gh.lazySingleton<_i112.GetCitiesUseCase>(
      () => _i112.GetCitiesUseCase(gh<_i110.CitiesRepository>()));
  gh.lazySingleton<_i113.AddTicketUseCase>(
      () => _i113.AddTicketUseCase(gh<_i63.TicketsRepo>()));
  gh.lazySingleton<_i114.EditTicketTypeUseCase>(
      () => _i114.EditTicketTypeUseCase(gh<_i63.TicketsRepo>()));
  gh.lazySingleton<_i115.GetClientTicketsUseCase>(
      () => _i115.GetClientTicketsUseCase(gh<_i63.TicketsRepo>()));
  gh.lazySingleton<_i116.GetTicketsUseCase>(
      () => _i116.GetTicketsUseCase(gh<_i63.TicketsRepo>()));
  gh.lazySingleton<_i117.GetTicketByIdUseCase>(
      () => _i117.GetTicketByIdUseCase(gh<_i63.TicketsRepo>()));
  gh.lazySingleton<_i118.TransferTicketUseCase>(
      () => _i118.TransferTicketUseCase(gh<_i63.TicketsRepo>()));
  gh.factory<_i119.TicketsCubit>(() => _i119.TicketsCubit(
        gh<_i116.GetTicketsUseCase>(),
        gh<_i117.GetTicketByIdUseCase>(),
        gh<_i115.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i120.LevelsCubit>(() => _i120.LevelsCubit(
        gh<_i104.GetLevelsUsecase>(),
        gh<_i103.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i121.LoginRemoteDataSource>(
      () => _i121.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i122.EmployeesSalesReportsRepo>(() =>
      _i123.EmployeesSalesReportsRepoImpl(
          gh<_i37.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i124.AdvancedConfigsRepository>(() =>
      _i125.AdvancedConfigsRepositoryImpl(
          gh<_i62.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i126.ParticipateListRepository>(() =>
      _i127.ParticipateListRepositoryImpl(
          gh<_i35.ParticipatesListDatasource>()));
  gh.lazySingleton<_i128.LatestClientsUpdatesDatasource>(
      () => _i128.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i129.ManageWithdrawnInvoicesDataSource>(
      () => _i129.ManageWithdrawnInvoicesDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i130.WithdrawnInvoicesDataSource>(
      () => _i130.WithdrawnInvoicesDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i131.InvoicesSectionRepo>(
      () => _i132.InvoicesTabRepoImpl(gh<_i109.InvoicesTabDataSource>()));
  gh.factory<_i133.SupportClientsAcceptCubit>(() =>
      _i133.SupportClientsAcceptCubit(
          gh<_i74.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i134.WaitingAgentsDataSource>(
      () => _i134.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i135.SpecialClientsRepository>(() =>
      _i136.SpecialClientsRepositoryImpl(gh<_i56.SpecialClientsDatasource>()));
  gh.lazySingleton<_i137.GetFinancePendingInvoicesUsecase>(() =>
      _i137.GetFinancePendingInvoicesUsecase(gh<_i80.FinancePendingRepo>()));
  gh.lazySingleton<_i138.ProductsSalesReportsRepo>(() =>
      _i139.ProductsSalesReportsRepoImpl(
          gh<_i15.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i140.AgentsDistributorsProfileDataSource>(() =>
      _i140.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i141.EditTicketCubit>(() => _i141.EditTicketCubit(
        gh<_i114.EditTicketTypeUseCase>(),
        gh<_i118.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i142.ClientsStatusReportsRepo>(() =>
      _i143.ClientsStatusReportsRepoImpl(
          gh<_i30.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i144.DatesTableDataSource>(
      () => _i144.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i145.GetDelayAfterInstallUseCase>(() =>
      _i145.GetDelayAfterInstallUseCase(gh<_i72.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i146.RegionsDatasource>(
      () => _i146.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i147.LocationServices>(
      () => _i147.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i148.GetClientsDebtsReportsUsecase>(() =>
      _i148.GetClientsDebtsReportsUsecase(gh<_i68.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i149.GreetingCommunicationRepo>(() =>
      _i150.GreetingCommunicationRepoImpl(
          gh<_i17.GreetingCommunicationDatasource>()));
  gh.singleton<_i151.CacheServices>(
    () => _i152.SecureStorageConsumer(gh<_i20.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i153.ManageWithdrawnInvoicesRepo>(() =>
      _i154.ManageWithdrawnInvoicesRepoImpl(
          gh<_i129.ManageWithdrawnInvoicesDataSource>()));
  gh.singletonAsync<_i151.CacheServices>(() async =>
      _i155.PrefsConsumer(await gh.getAsync<_i19.SharedPreferences>()));
  gh.lazySingleton<_i156.InstallQualityRepo>(
      () => _i157.InstallQualityRepoImpl(gh<_i47.InstallQualityDatasource>()));
  gh.lazySingleton<_i158.PrivilegesRepo>(
      () => _i159.PrivilegesRepoImpl(gh<_i13.PrivilegesDatasource>()));
  gh.lazySingleton<_i160.DelayInstallReportsRepo>(() =>
      _i161.DelayInstallReportsRepoImpl(
          gh<_i32.DelayInstallReportsDatasource>()));
  gh.factory<_i162.AppRepository>(
      () => _i163.AppRepositoryImpl(gh<_i55.AppDatasource>()));
  gh.factory<_i164.UpdatePrivilegesUsecase>(
      () => _i164.UpdatePrivilegesUsecase(gh<_i158.PrivilegesRepo>()));
  gh.lazySingleton<_i165.GetPrivilegesUsecase>(
      () => _i165.GetPrivilegesUsecase(gh<_i158.PrivilegesRepo>()));
  gh.lazySingleton<_i166.AgentsDistributorsActionsRepo>(() =>
      _i167.AgentsDistributorsActionsRepoImpl(
          gh<_i18.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i168.FinancePendingCubit>(() =>
      _i168.FinancePendingCubit(gh<_i137.GetFinancePendingInvoicesUsecase>()));
  gh.lazySingleton<_i169.DeletedInvoicesRepo>(() =>
      _i170.DeletedInvoicesRepoImpl(gh<_i102.DeletedInvoicesDatasource>()));
  gh.factory<_i171.DelayAfterInstallCubit>(() =>
      _i171.DelayAfterInstallCubit(gh<_i145.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i172.GetRegionsSalesReportsUsecase>(() =>
      _i172.GetRegionsSalesReportsUsecase(gh<_i65.RegionsSalesReportsRepo>()));
  gh.factory<_i173.ClientsCareReportsCubit>(() =>
      _i173.ClientsCareReportsCubit(gh<_i108.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i174.SupportTabRepo>(
      () => _i175.SupportTabRepoImpl(gh<_i105.SupportTabDataSource>()));
  gh.factory<_i176.GetSpecialClientsUsecase>(() =>
      _i176.GetSpecialClientsUsecase(gh<_i135.SpecialClientsRepository>()));
  gh.lazySingleton<_i177.GetInvoicesByPrivilegesUsecase>(() =>
      _i177.GetInvoicesByPrivilegesUsecase(gh<_i131.InvoicesSectionRepo>()));
  gh.lazySingleton<_i178.GetWrongNumbersUsecase>(
      () => _i178.GetWrongNumbersUsecase(gh<_i33.WrongNumbersRepo>()));
  gh.lazySingleton<_i179.GetClientsAcceptUseCase>(
      () => _i179.GetClientsAcceptUseCase(gh<_i41.ClientsAcceptRepository>()));
  gh.lazySingleton<_i180.GeneralConfigsRepository>(() =>
      _i181.GeneralConfigsRepositoryImpl(gh<_i79.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i182.GetNotificationsUsecase>(
      () => _i182.GetNotificationsUsecase(gh<_i27.NotificationsRepo>()));
  gh.lazySingleton<_i183.GetUnreadNotificationsCountUsecase>(() =>
      _i183.GetUnreadNotificationsCountUsecase(gh<_i27.NotificationsRepo>()));
  gh.lazySingleton<_i184.MarkNotificationsAsReadUsecase>(
      () => _i184.MarkNotificationsAsReadUsecase(gh<_i27.NotificationsRepo>()));
  gh.lazySingleton<_i185.GetPeriodicCommunicationReportsUsecase>(() =>
      _i185.GetPeriodicCommunicationReportsUsecase(
          gh<_i38.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i186.GetBranchesByIdCountryUseCase>(
      () => _i186.GetBranchesByIdCountryUseCase(gh<_i90.BranchesRepository>()));
  gh.factory<_i187.CompanyRepository>(
      () => _i188.CompanyRepositoryImpl(gh<_i58.CommentCompanyDatasource>()));
  gh.singleton<_i189.PrivilegesCubit>(() => _i189.PrivilegesCubit(
        gh<_i165.GetPrivilegesUsecase>(),
        gh<_i164.UpdatePrivilegesUsecase>(),
      ));
  gh.lazySingleton<_i190.GetInstallUseCase>(
      () => _i190.GetInstallUseCase(gh<_i156.InstallQualityRepo>()));
  gh.lazySingleton<_i191.AgentsDistributorsProfileRepo>(() =>
      _i192.AgentsDistributorsProfileRepoImpl(
          gh<_i140.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i193.AddDateInstallUsecase>(
      () => _i193.AddDateInstallUsecase(gh<_i174.SupportTabRepo>()));
  gh.lazySingleton<_i194.CancelDateInstallUsecase>(
      () => _i194.CancelDateInstallUsecase(gh<_i174.SupportTabRepo>()));
  gh.lazySingleton<_i195.GetInvoiceByClientUsecase>(
      () => _i195.GetInvoiceByClientUsecase(gh<_i174.SupportTabRepo>()));
  gh.lazySingleton<_i196.ReceiveDeviceUsecase>(
      () => _i196.ReceiveDeviceUsecase(gh<_i174.SupportTabRepo>()));
  gh.lazySingleton<_i197.ReturnInvoiceApproveUsecase>(
      () => _i197.ReturnInvoiceApproveUsecase(gh<_i174.SupportTabRepo>()));
  gh.lazySingleton<_i198.SetDateDoneUsecase>(
      () => _i198.SetDateDoneUsecase(gh<_i174.SupportTabRepo>()));
  gh.lazySingleton<_i199.SetReadyInstallUsecase>(
      () => _i199.SetReadyInstallUsecase(gh<_i174.SupportTabRepo>()));
  gh.lazySingleton<_i200.GetAllUsersUseCase>(
      () => _i200.GetAllUsersUseCase(gh<_i131.InvoicesSectionRepo>()));
  gh.lazySingleton<_i201.ClientsDebtsRepo>(
      () => _i202.ClientsDebtsRepoImpl(gh<_i43.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i203.PeriodicCommunicationRepo>(() =>
      _i204.PeriodicCommunicationRepoImpl(
          gh<_i36.PeriodicCommunicationDatasource>()));
  gh.factory<_i205.ImportantLinksRepo>(
      () => _i206.ImportantLinksRepoImpl(gh<_i59.ImportantLinksDatasource>()));
  gh.lazySingleton<_i207.GetClientLogsUsecase>(
      () => _i207.GetClientLogsUsecase(gh<_i100.ClientLogsTabRepo>()));
  gh.lazySingleton<_i208.SupportClientsInvoicesRepo>(() =>
      _i209.SupportClientsInvoicesRepoImpl(
          gh<_i51.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i210.GetBranchesForUserUsecase>(
      () => _i210.GetBranchesForUserUsecase(gh<_i77.UsersRepository>()));
  gh.lazySingleton<_i211.GetLevelsForUserUsecase>(
      () => _i211.GetLevelsForUserUsecase(gh<_i77.UsersRepository>()));
  gh.lazySingleton<_i212.GetManagesForUserUsecase>(
      () => _i212.GetManagesForUserUsecase(gh<_i77.UsersRepository>()));
  gh.factory<_i213.GetUsersUsecase>(
      () => _i213.GetUsersUsecase(gh<_i77.UsersRepository>()));
  gh.lazySingleton<_i214.GetSupportClientsInvoicesUseCase>(() =>
      _i214.GetSupportClientsInvoicesUseCase(
          gh<_i208.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i215.ManageWithdrawalsRepository>(() =>
      _i216.ManageWithdrawalsRepositoryImpl(
          gh<_i40.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i217.AgentsDistributorsRepo>(() =>
      _i218.AgentsDistributorsRepoImpl(
          gh<_i95.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i219.GetProductsSalesReportsUsecase>(() =>
      _i219.GetProductsSalesReportsUsecase(
          gh<_i138.ProductsSalesReportsRepo>()));
  gh.singleton<_i220.CitiesCubit>(
      () => _i220.CitiesCubit(gh<_i112.GetCitiesUseCase>()));
  gh.factory<_i221.UsersTypeCubit>(
      () => _i221.UsersTypeCubit(gh<_i106.GetUsersUsecase>()));
  gh.factory<_i222.ClientsListRepository>(
      () => _i223.ClientsListRepositoryImpl(gh<_i57.ClientsListDatasource>()));
  gh.factory<_i224.AddParticipateCommentUsecase>(() =>
      _i224.AddParticipateCommentUsecase(
          gh<_i126.ParticipateListRepository>()));
  gh.factory<_i225.AddParticipateUserUsecase>(() =>
      _i225.AddParticipateUserUsecase(gh<_i126.ParticipateListRepository>()));
  gh.factory<_i226.EditParticipateUserUsecase>(() =>
      _i226.EditParticipateUserUsecase(gh<_i126.ParticipateListRepository>()));
  gh.factory<_i227.GetInvoiceByIdUsecase>(
      () => _i227.GetInvoiceByIdUsecase(gh<_i126.ParticipateListRepository>()));
  gh.factory<_i228.ParticipateClientListUsecase>(() =>
      _i228.ParticipateClientListUsecase(
          gh<_i126.ParticipateListRepository>()));
  gh.factory<_i229.ParticipateCommentListUsecase>(() =>
      _i229.ParticipateCommentListUsecase(
          gh<_i126.ParticipateListRepository>()));
  gh.factory<_i230.ParticipateInvoiceListUsecase>(() =>
      _i230.ParticipateInvoiceListUsecase(
          gh<_i126.ParticipateListRepository>()));
  gh.factory<_i231.ParticipateListUsecase>(() =>
      _i231.ParticipateListUsecase(gh<_i126.ParticipateListRepository>()));
  gh.lazySingleton<_i232.ChangeParticipateStatusUsecase>(() =>
      _i232.ChangeParticipateStatusUsecase(
          gh<_i126.ParticipateListRepository>()));
  gh.factory<_i233.PendingInvoicesCubit>(
      () => _i233.PendingInvoicesCubit(gh<_i107.GetPendingInvoicesUsecase>()));
  gh.factory<_i234.EvaluationLevelReportCubit>(() =>
      _i234.EvaluationLevelReportCubit(
          gh<_i92.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i235.GetEmployeesSalesReportsUsecase>(() =>
      _i235.GetEmployeesSalesReportsUsecase(
          gh<_i122.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i236.GetGreetingCommunicationUseCase>(() =>
      _i236.GetGreetingCommunicationUseCase(
          gh<_i149.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i237.ClientsTransferApprovalsRepo>(() =>
      _i238.ClientsTransferApprovalsRepoImpl(
          gh<_i53.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i239.GetDeletedInvoicesUsecase>(
      () => _i239.GetDeletedInvoicesUsecase(gh<_i169.DeletedInvoicesRepo>()));
  gh.lazySingleton<_i240.GetClientsStatusReportsUsecase>(() =>
      _i240.GetClientsStatusReportsUsecase(
          gh<_i142.ClientsStatusReportsRepo>()));
  gh.factory<_i241.ActionLinkUsecase>(
      () => _i241.ActionLinkUsecase(gh<_i205.ImportantLinksRepo>()));
  gh.factory<_i242.GetImportantLinksUsecase>(
      () => _i242.GetImportantLinksUsecase(gh<_i205.ImportantLinksRepo>()));
  gh.lazySingleton<_i243.GetPreviousRatingsUsecase>(
      () => _i243.GetPreviousRatingsUsecase(gh<_i98.PreviousRatingsRepo>()));
  gh.lazySingleton<_i244.WaitingAgentsRepo>(
      () => _i245.WaitingAgentsRepoImpl(gh<_i134.WaitingAgentsDataSource>()));
  gh.factory<_i246.AddClientUserUsecase>(
      () => _i246.AddClientUserUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i247.ApproveRejectClientUsecase>(() =>
      _i247.ApproveRejectClientUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i248.ChangeTypeClientUsecase>(
      () => _i248.ChangeTypeClientUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i249.EditClientUserUsecase>(
      () => _i249.EditClientUserUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i250.GetClientsListByRegionUseCase>(() =>
      _i250.GetClientsListByRegionUseCase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i251.GetClientsListByUserUseCase>(() =>
      _i251.GetClientsListByUserUseCase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i252.GetClientsWithFilterUserUsecase>(() =>
      _i252.GetClientsWithFilterUserUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i253.GetClientMarketingReportUsecase>(() =>
      _i253.GetClientMarketingReportUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i254.GetRecommendedClientsUsecase>(() =>
      _i254.GetRecommendedClientsUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i255.GetSimilarClientsUsecase>(
      () => _i255.GetSimilarClientsUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i256.ReceiveClientUserUsecase>(
      () => _i256.ReceiveClientUserUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i257.TransferClientUserUsecase>(
      () => _i257.TransferClientUserUsecase(gh<_i222.ClientsListRepository>()));
  gh.lazySingleton<_i258.GetHighSimilarClientsUsecase>(() =>
      _i258.GetHighSimilarClientsUsecase(gh<_i222.ClientsListRepository>()));
  gh.factory<_i259.EmployeesSalesReportsCubit>(() =>
      _i259.EmployeesSalesReportsCubit(
          gh<_i235.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i260.ChangeStateAgentUseCase>(
      () => _i260.ChangeStateAgentUseCase(gh<_i217.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i261.GetAgentsAndDistributorsUseCase>(() =>
      _i261.GetAgentsAndDistributorsUseCase(
          gh<_i217.AgentsDistributorsRepo>()));
  gh.factory<_i262.ClientsAcceptCubit>(
      () => _i262.ClientsAcceptCubit(gh<_i179.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i263.CancelWithdrawalUsecase>(() =>
      _i263.CancelWithdrawalUsecase(gh<_i215.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i264.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i264.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i215.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i265.GetWithdrawalsInvoicesUsecase>(() =>
      _i265.GetWithdrawalsInvoicesUsecase(
          gh<_i215.ManageWithdrawalsRepository>()));
  gh.factory<_i266.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i266.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i215.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i267.ExceededClientsUseCase>(
      () => _i267.ExceededClientsUseCase(gh<_i87.ExceededClientsRepo>()));
  gh.lazySingleton<_i268.TransferExceededClientsUseCase>(() =>
      _i268.TransferExceededClientsUseCase(gh<_i87.ExceededClientsRepo>()));
  gh.lazySingleton<_i269.LoginLocalDataSource>(() =>
      _i269.LoginLocalDataSourceImpl(
          gh<_i151.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i270.EditAdvancedConfigsUsecase>(() =>
      _i270.EditAdvancedConfigsUsecase(gh<_i124.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i271.GetAdvancedConfigsUsecase>(() =>
      _i271.GetAdvancedConfigsUsecase(gh<_i124.AdvancedConfigsRepository>()));
  gh.factory<_i272.ClientsInstallReportsCubit>(() =>
      _i272.ClientsInstallReportsCubit(
          gh<_i97.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i273.DatesTableRepo>(
      () => _i274.DatesTableRepoImpl(gh<_i144.DatesTableDataSource>()));
  gh.factory<_i275.GetVersionUseCase>(
      () => _i275.GetVersionUseCase(gh<_i162.AppRepository>()));
  gh.factory<_i276.AddTicketCubit>(
      () => _i276.AddTicketCubit(gh<_i113.AddTicketUseCase>()));
  gh.lazySingleton<_i277.LatestClientsUpdatesRepository>(() =>
      _i278.LatestClientsUpdatesRepositoryImpl(
          gh<_i128.LatestClientsUpdatesDatasource>()));
  gh.factory<_i279.TaskRepository>(
      () => _i280.TaskRepositoryImpl(gh<_i96.TaskDatasource>()));
  gh.lazySingleton<_i281.EditGeneralConfigsUsecase>(() =>
      _i281.EditGeneralConfigsUsecase(gh<_i180.GeneralConfigsRepository>()));
  gh.lazySingleton<_i282.GetGeneralConfigsUsecase>(() =>
      _i282.GetGeneralConfigsUsecase(gh<_i180.GeneralConfigsRepository>()));
  gh.factory<_i283.PeriodicCommunicationReportsCubit>(() =>
      _i283.PeriodicCommunicationReportsCubit(
          gh<_i185.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i284.InstallQualityCubit>(
      () => _i284.InstallQualityCubit(gh<_i190.GetInstallUseCase>()));
  gh.factory<_i285.ImportantLinksCubit>(() => _i285.ImportantLinksCubit(
        gh<_i242.GetImportantLinksUsecase>(),
        gh<_i241.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i286.AddAgentUseCase>(
      () => _i286.AddAgentUseCase(gh<_i166.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i287.UpdateAgentUseCase>(() =>
      _i287.UpdateAgentUseCase(gh<_i166.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i288.GetDelayInstallReportsUseCase>(() =>
      _i288.GetDelayInstallReportsUseCase(gh<_i160.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i289.CrudAgentSupportFilesUsecase>(() =>
      _i289.CrudAgentSupportFilesUsecase(
          gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i290.GetClientsTransferApprovalsUsecase>(() =>
      _i290.GetClientsTransferApprovalsUsecase(
          gh<_i237.ClientsTransferApprovalsRepo>()));
  gh.factory<_i291.ClientsStatusReportsCubit>(() =>
      _i291.ClientsStatusReportsCubit(
          gh<_i240.GetClientsStatusReportsUsecase>()));
  gh.factory<_i292.SupportTabCubit>(() => _i292.SupportTabCubit(
        gh<_i195.GetInvoiceByClientUsecase>(),
        gh<_i193.AddDateInstallUsecase>(),
        gh<_i198.SetDateDoneUsecase>(),
        gh<_i199.SetReadyInstallUsecase>(),
        gh<_i197.ReturnInvoiceApproveUsecase>(),
        gh<_i196.ReceiveDeviceUsecase>(),
        gh<_i194.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i293.ClientsDebtsReportsCubit>(() =>
      _i293.ClientsDebtsReportsCubit(
          gh<_i148.GetClientsDebtsReportsUsecase>()));
  gh.factory<_i294.DeletedInvoicesCubit>(
      () => _i294.DeletedInvoicesCubit(gh<_i239.GetDeletedInvoicesUsecase>()));
  gh.lazySingleton<_i295.AddAgentDateUseCase>(() =>
      _i295.AddAgentDateUseCase(gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i296.GetManageWithdrawnInvoicesUsecase>(() =>
      _i296.GetManageWithdrawnInvoicesUsecase(
          gh<_i153.ManageWithdrawnInvoicesRepo>()));
  gh.factory<_i297.NotificationsCubit>(() => _i297.NotificationsCubit(
        gh<_i182.GetNotificationsUsecase>(),
        gh<_i184.MarkNotificationsAsReadUsecase>(),
        gh<_i183.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i298.WithdrawnInvoicesRepo>(() =>
      _i299.WithdrawnInvoicesRepoImpl(gh<_i130.WithdrawnInvoicesDataSource>()));
  gh.lazySingleton<_i300.RegionsRepository>(
      () => _i301.RegionsRepositoryImpl(gh<_i146.RegionsDatasource>()));
  gh.factory<_i302.ClientLogsTabCubit>(
      () => _i302.ClientLogsTabCubit(gh<_i207.GetClientLogsUsecase>()));
  gh.factory<_i303.RegionsSalesReportsCubit>(() =>
      _i303.RegionsSalesReportsCubit(
          gh<_i172.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i304.AgentsDistributorsActionsCubit>(
      () => _i304.AgentsDistributorsActionsCubit(
            gh<_i112.GetCitiesUseCase>(),
            gh<_i286.AddAgentUseCase>(),
            gh<_i287.UpdateAgentUseCase>(),
          ));
  gh.factory<_i305.InvoicesSectionCubit>(() => _i305.InvoicesSectionCubit(
        gh<_i177.GetInvoicesByPrivilegesUsecase>(),
        gh<_i261.GetAgentsAndDistributorsUseCase>(),
        gh<_i231.ParticipateListUsecase>(),
        gh<_i200.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i306.LoginRepo>(() => _i307.LoginRepoImpl(
        gh<_i121.LoginRemoteDataSource>(),
        gh<_i269.LoginLocalDataSource>(),
      ));
  gh.factory<_i308.SpecialClientsBloc>(
      () => _i308.SpecialClientsBloc(gh<_i176.GetSpecialClientsUsecase>()));
  gh.factory<_i309.AddCommentUsecase>(
      () => _i309.AddCommentUsecase(gh<_i187.CompanyRepository>()));
  gh.factory<_i310.GetCommentUsecase>(
      () => _i310.GetCommentUsecase(gh<_i187.CompanyRepository>()));
  gh.factory<_i311.DelayInstallReportsCubit>(() =>
      _i311.DelayInstallReportsCubit(
          gh<_i288.GetDelayInstallReportsUseCase>()));
  gh.factory<_i312.GreetingCommunicationCubit>(() =>
      _i312.GreetingCommunicationCubit(
          gh<_i236.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i313.GetRegionsUseCase>(
      () => _i313.GetRegionsUseCase(gh<_i300.RegionsRepository>()));
  gh.lazySingleton<_i314.GetLatestClientsUseCase>(() =>
      _i314.GetLatestClientsUseCase(
          gh<_i277.LatestClientsUpdatesRepository>()));
  gh.factory<_i315.AdvancedCofigsCubit>(() => _i315.AdvancedCofigsCubit(
        gh<_i271.GetAdvancedConfigsUsecase>(),
        gh<_i270.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i316.SupportClientsInvoicesCubit>(() =>
      _i316.SupportClientsInvoicesCubit(
          gh<_i214.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i317.WrongNumbersCubit>(
      () => _i317.WrongNumbersCubit(gh<_i178.GetWrongNumbersUsecase>()));
  gh.factory<_i318.ParticipateListBloc>(() => _i318.ParticipateListBloc(
        gh<_i231.ParticipateListUsecase>(),
        gh<_i225.AddParticipateUserUsecase>(),
        gh<_i226.EditParticipateUserUsecase>(),
        gh<_i228.ParticipateClientListUsecase>(),
        gh<_i230.ParticipateInvoiceListUsecase>(),
        gh<_i227.GetInvoiceByIdUsecase>(),
        gh<_i229.ParticipateCommentListUsecase>(),
        gh<_i224.AddParticipateCommentUsecase>(),
        gh<_i232.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i319.CacheTokenUsecase>(
      () => _i319.CacheTokenUsecase(gh<_i306.LoginRepo>()));
  gh.lazySingleton<_i320.GetTokenUsecase>(
      () => _i320.GetTokenUsecase(gh<_i306.LoginRepo>()));
  gh.lazySingleton<_i321.LoginUsecase>(
      () => _i321.LoginUsecase(gh<_i306.LoginRepo>()));
  gh.lazySingleton<_i322.ValidateTokenUsecase>(
      () => _i322.ValidateTokenUsecase(gh<_i306.LoginRepo>()));
  gh.lazySingleton<_i323.VerifyOtpUsecase>(
      () => _i323.VerifyOtpUsecase(gh<_i306.LoginRepo>()));
  gh.factory<_i324.ClientsTransferApprovalsCubit>(() =>
      _i324.ClientsTransferApprovalsCubit(
          gh<_i290.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i325.RegionsCubit>(
      () => _i325.RegionsCubit(gh<_i313.GetRegionsUseCase>()));
  gh.factory<_i326.GeneralCofigsCubit>(() => _i326.GeneralCofigsCubit(
        gh<_i282.GetGeneralConfigsUsecase>(),
        gh<_i281.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i327.GetPeriodicCommunicationUseCase>(() =>
      _i327.GetPeriodicCommunicationUseCase(
          gh<_i203.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i328.GetClientsDebtsUsecase>(
      () => _i328.GetClientsDebtsUsecase(gh<_i201.ClientsDebtsRepo>()));
  gh.lazySingleton<_i329.CrudClientSupportFilesUsecase>(() =>
      _i329.CrudClientSupportFilesUsecase(
          repository: gh<_i222.ClientsListRepository>()));
  gh.lazySingleton<_i330.GetClientSupportFilesUsecase>(() =>
      _i330.GetClientSupportFilesUsecase(
          repository: gh<_i222.ClientsListRepository>()));
  gh.factory<_i331.BranchesCubit>(
      () => _i331.BranchesCubit(gh<_i186.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i332.AddAgentCommentUsecase>(() =>
      _i332.AddAgentCommentUsecase(gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i333.DoneTrainingUsecase>(() =>
      _i333.DoneTrainingUsecase(gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i334.GetAgentUsecase>(
      () => _i334.GetAgentUsecase(gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i335.GetAgentClientListUsecase>(() =>
      _i335.GetAgentClientListUsecase(
          gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i336.GetAgentCommentsListUsecase>(() =>
      _i336.GetAgentCommentsListUsecase(
          gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i337.GetAgentDatesListUsecase>(() =>
      _i337.GetAgentDatesListUsecase(
          gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i338.GetAgentInvoiceListUsecase>(() =>
      _i338.GetAgentInvoiceListUsecase(
          gh<_i191.AgentsDistributorsProfileRepo>()));
  gh.factory<_i339.AddRejectReasonsUsecase>(() =>
      _i339.AddRejectReasonsUsecase(gh<_i215.ManageWithdrawalsRepository>()));
  gh.factory<_i340.EditRejectReasonsUsecase>(() =>
      _i340.EditRejectReasonsUsecase(gh<_i215.ManageWithdrawalsRepository>()));
  gh.factory<_i341.GetRejectReasonsUsecase>(() =>
      _i341.GetRejectReasonsUsecase(gh<_i215.ManageWithdrawalsRepository>()));
  gh.factory<_i342.GetUserSeriesUsecase>(() =>
      _i342.GetUserSeriesUsecase(gh<_i215.ManageWithdrawalsRepository>()));
  gh.factory<_i343.GetWithdrawnDetailsUsecase>(() =>
      _i343.GetWithdrawnDetailsUsecase(
          gh<_i215.ManageWithdrawalsRepository>()));
  gh.factory<_i344.SetApproveSeriesUsecase>(() =>
      _i344.SetApproveSeriesUsecase(gh<_i215.ManageWithdrawalsRepository>()));
  gh.factory<_i345.UpdateSeriesUsecase>(
      () => _i345.UpdateSeriesUsecase(gh<_i215.ManageWithdrawalsRepository>()));
  gh.singleton<_i346.AppManagerCubit>(
      () => _i346.AppManagerCubit(gh<_i275.GetVersionUseCase>()));
  gh.lazySingleton<_i347.GetWaitingAgentsUsecase>(
      () => _i347.GetWaitingAgentsUsecase(gh<_i244.WaitingAgentsRepo>()));
  gh.factory<_i348.ProductsSalesReportsCubit>(() =>
      _i348.ProductsSalesReportsCubit(
          gh<_i219.GetProductsSalesReportsUsecase>()));
  gh.lazySingleton<_i349.GetWithdrawnInvoicesUsecase>(() =>
      _i349.GetWithdrawnInvoicesUsecase(gh<_i298.WithdrawnInvoicesRepo>()));
  gh.factory<_i350.PreviousRatingsCubit>(
      () => _i350.PreviousRatingsCubit(gh<_i243.GetPreviousRatingsUsecase>()));
  gh.factory<_i351.AgentsDistributorsCubit>(() => _i351.AgentsDistributorsCubit(
        gh<_i261.GetAgentsAndDistributorsUseCase>(),
        gh<_i260.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i352.ExceededClientsCubit>(() => _i352.ExceededClientsCubit(
        gh<_i267.ExceededClientsUseCase>(),
        gh<_i268.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i353.ManageWithdrawalsCubit>(() => _i353.ManageWithdrawalsCubit(
        gh<_i342.GetUserSeriesUsecase>(),
        gh<_i345.UpdateSeriesUsecase>(),
        gh<_i213.GetUsersUsecase>(),
        gh<_i265.GetWithdrawalsInvoicesUsecase>(),
        gh<_i266.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i344.SetApproveSeriesUsecase>(),
        gh<_i343.GetWithdrawnDetailsUsecase>(),
        gh<_i339.AddRejectReasonsUsecase>(),
        gh<_i341.GetRejectReasonsUsecase>(),
        gh<_i340.EditRejectReasonsUsecase>(),
        gh<_i264.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i263.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i354.ManageWithdrawnInvoicesCubit>(() =>
      _i354.ManageWithdrawnInvoicesCubit(
          gh<_i296.GetManageWithdrawnInvoicesUsecase>()));
  gh.factory<_i355.LatestClientsUpdatesCubit>(() =>
      _i355.LatestClientsUpdatesCubit(gh<_i314.GetLatestClientsUseCase>()));
  gh.factory<_i356.AttachmentsRowCubit>(() => _i356.AttachmentsRowCubit(
        gh<_i330.GetClientSupportFilesUsecase>(),
        gh<_i329.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i357.CancelScheduleUsecase>(
      () => _i357.CancelScheduleUsecase(gh<_i273.DatesTableRepo>()));
  gh.lazySingleton<_i358.ChangeDateToDonUsecase>(
      () => _i358.ChangeDateToDonUsecase(gh<_i273.DatesTableRepo>()));
  gh.lazySingleton<_i359.GetCancelReasonsUsecase>(
      () => _i359.GetCancelReasonsUsecase(gh<_i273.DatesTableRepo>()));
  gh.lazySingleton<_i360.GetDateInstallationUsecase>(
      () => _i360.GetDateInstallationUsecase(gh<_i273.DatesTableRepo>()));
  gh.lazySingleton<_i361.GetInvoicesByClientForDateUsecase>(() =>
      _i361.GetInvoicesByClientForDateUsecase(gh<_i273.DatesTableRepo>()));
  gh.lazySingleton<_i362.GetSubscribedClientsUsecase>(
      () => _i362.GetSubscribedClientsUsecase(gh<_i273.DatesTableRepo>()));
  gh.lazySingleton<_i363.RescheduleDateUsecase>(
      () => _i363.RescheduleDateUsecase(gh<_i273.DatesTableRepo>()));
  gh.lazySingleton<_i364.ReturnScheduleVisitToOpenUsecase>(
      () => _i364.ReturnScheduleVisitToOpenUsecase(gh<_i273.DatesTableRepo>()));
  gh.factory<_i365.AgentsDistributorsProfileBloc>(
      () => _i365.AgentsDistributorsProfileBloc(
            gh<_i335.GetAgentClientListUsecase>(),
            gh<_i338.GetAgentInvoiceListUsecase>(),
            gh<_i227.GetInvoiceByIdUsecase>(),
            gh<_i336.GetAgentCommentsListUsecase>(),
            gh<_i332.AddAgentCommentUsecase>(),
            gh<_i333.DoneTrainingUsecase>(),
            gh<_i295.AddAgentDateUseCase>(),
            gh<_i337.GetAgentDatesListUsecase>(),
            gh<_i289.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i366.AddTaskUsecase>(
      () => _i366.AddTaskUsecase(gh<_i279.TaskRepository>()));
  gh.factory<_i367.ChangeStatusTaskUsecase>(
      () => _i367.ChangeStatusTaskUsecase(gh<_i279.TaskRepository>()));
  gh.factory<_i368.GetTasksUsecase>(
      () => _i368.GetTasksUsecase(gh<_i279.TaskRepository>()));
  gh.factory<_i369.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i369.GetUsersByDepartmentAndRegionUsecase(gh<_i279.TaskRepository>()));
  gh.lazySingleton<_i370.TaskCubit>(() => _i370.TaskCubit(
        gh<_i366.AddTaskUsecase>(),
        gh<_i368.GetTasksUsecase>(),
        gh<_i367.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i371.ClientsListBloc>(() => _i371.ClientsListBloc(
        gh<_i252.GetClientsWithFilterUserUsecase>(),
        gh<_i254.GetRecommendedClientsUsecase>(),
        gh<_i246.AddClientUserUsecase>(),
        gh<_i249.EditClientUserUsecase>(),
        gh<_i248.ChangeTypeClientUsecase>(),
        gh<_i255.GetSimilarClientsUsecase>(),
        gh<_i247.ApproveRejectClientUsecase>(),
        gh<_i329.CrudClientSupportFilesUsecase>(),
        gh<_i330.GetClientSupportFilesUsecase>(),
        gh<_i257.TransferClientUserUsecase>(),
        gh<_i256.ReceiveClientUserUsecase>(),
        gh<_i253.GetClientMarketingReportUsecase>(),
        gh<_i258.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i372.CompanyCubit>(() => _i372.CompanyCubit(
        gh<_i310.GetCommentUsecase>(),
        gh<_i309.AddCommentUsecase>(),
      ));
  gh.factory<_i373.ClientsDebtsCubit>(
      () => _i373.ClientsDebtsCubit(gh<_i328.GetClientsDebtsUsecase>()));
  gh.factory<_i374.PeriodicCommunicationCubit>(() =>
      _i374.PeriodicCommunicationCubit(
          gh<_i327.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i375.LoginCubit>(() => _i375.LoginCubit(
        gh<_i321.LoginUsecase>(),
        gh<_i323.VerifyOtpUsecase>(),
        gh<_i319.CacheTokenUsecase>(),
        gh<_i320.GetTokenUsecase>(),
        gh<_i322.ValidateTokenUsecase>(),
      ));
  gh.factory<_i376.DatesTableCubit>(() => _i376.DatesTableCubit(
        gh<_i360.GetDateInstallationUsecase>(),
        gh<_i363.RescheduleDateUsecase>(),
        gh<_i358.ChangeDateToDonUsecase>(),
        gh<_i357.CancelScheduleUsecase>(),
        gh<_i364.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i362.GetSubscribedClientsUsecase>(),
        gh<_i361.GetInvoicesByClientForDateUsecase>(),
        gh<_i193.AddDateInstallUsecase>(),
        gh<_i359.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i377.WithdrawnInvoicesCubit>(() =>
      _i377.WithdrawnInvoicesCubit(gh<_i349.GetWithdrawnInvoicesUsecase>()));
  gh.factory<_i378.WaitingAgentsCubit>(
      () => _i378.WaitingAgentsCubit(gh<_i347.GetWaitingAgentsUsecase>()));
  gh.factory<_i379.UsersCubit>(() => _i379.UsersCubit(
        gh<_i213.GetUsersUsecase>(),
        gh<_i89.ActionUserUsecase>(),
        gh<_i369.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i212.GetManagesForUserUsecase>(),
        gh<_i211.GetLevelsForUserUsecase>(),
        gh<_i210.GetBranchesForUserUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i380.AppModule {}
