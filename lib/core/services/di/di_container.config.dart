// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i19;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i18;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i52;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i152;
import '../../../features/app/domain/repositories/app_repository.dart' as _i151;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i263;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i331;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i257;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i116;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i288;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i287;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i304;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i305;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i306;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i307;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i308;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i354;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i27;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i39;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i38;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i165;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i246;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i24;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i83;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i82;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i103;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i158;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i47;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i62;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i61;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i108;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i109;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i110;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i112;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i111;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i113;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i264;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i134;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i114;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i43;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i42;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i89;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i220;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i16;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i143;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i142;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i222;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i297;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i44;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i148;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i147;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i177;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i270;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i32;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i191;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i190;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i312;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i353;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i29;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i35;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i34;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i171;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i269;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i23;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i97;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i96;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i227;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i335;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i53;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i129;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i128;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i163;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i293;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i81;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i88;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i87;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i174;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i316;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i59;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i106;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i105;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i107;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i206;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i100;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i160;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i159;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i180;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i181;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i182;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i183;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i184;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i185;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i186;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i278;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i139;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i283;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i282;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i298;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i310;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i58;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i73;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i72;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i101;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i207;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i60;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i120;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i119;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i258;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i259;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i301;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i76;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i167;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i166;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i267;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i268;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i311;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i36;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i173;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i172;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i289;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i290;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i291;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i292;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i299;
import '../../../features/mangement/manage_privileges/levels/data/data_sources/levels_datasource.dart'
    as _i15;
import '../../../features/mangement/manage_privileges/levels/data/repositories/levels_repo_impl.dart'
    as _i46;
import '../../../features/mangement/manage_privileges/levels/domain/repositories/levels_repo.dart'
    as _i45;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/add_level_usecase.dart'
    as _i98;
import '../../../features/mangement/manage_privileges/levels/domain/use_cases/get_levels_usecase.dart'
    as _i99;
import '../../../features/mangement/manage_privileges/levels/presentation/manager/levels_cubit/levels_cubit.dart'
    as _i115;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i49;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i75;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i74;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i86;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i194;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i195;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i196;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i197;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i334;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i37;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i202;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i201;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i324;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i247;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i325;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i248;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i326;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i327;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i250;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i249;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i328;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i329;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i330;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i338;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i13;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i26;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i25;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i168;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i169;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i170;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i281;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i40;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i189;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i188;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i313;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i352;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i54;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i209;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i208;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i230;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i231;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i232;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i314;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i233;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i237;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i315;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i234;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i235;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i236;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i242;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i238;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i239;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i240;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i241;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i350;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i50;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i224;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i223;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i275;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i309;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i41;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i78;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i77;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i130;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i155;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i123;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i266;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i265;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i300;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i339;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i80;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i79;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i102;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i219;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i55;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i176;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i175;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i294;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i295;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i351;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i51;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i85;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i84;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i255;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i256;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i337;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i104;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i125;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i124;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i187;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i164;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i286;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i17;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i94;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i133;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i154;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i179;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i204;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i153;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i178;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i203;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i317;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i280;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i271;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i244;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i274;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i318;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i319;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i320;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i321;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i322;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i323;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i245;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i272;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i285;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i349;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i336;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i56;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i162;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i161;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i198;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i199;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i225;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i31;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i122;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i121;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i210;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i211;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i218;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i212;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i213;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i214;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i215;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i216;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i217;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i303;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i66;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i65;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i141;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i279;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i28;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i136;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i135;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i226;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i276;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i33;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i118;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i117;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i221;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i243;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i14;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i132;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i131;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i205;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i333;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i21;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i64;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i63;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i157;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i284;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i20;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i91;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i90;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i95;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i260;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i137;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i262;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i261;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i341;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i342;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i343;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i344;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i345;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i346;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i347;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i348;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i355;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i70;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i69;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i138;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i156;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i30;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i150;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i149;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i273;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i296;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i68;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i67;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i71;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i126;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i48;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i193;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i192;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i200;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i302;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i127;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i229;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i228;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i332;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i356;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i57;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i93;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i92;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i251;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i252;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i253;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i254;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i277;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i340;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i144;
import '../cache_services/prefs_consumer.dart' as _i146;
import '../cache_services/secure_storage_consumer.dart' as _i145;
import '../maps/location_services.dart' as _i140;
import 'di_container.dart' as _i357;

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
  gh.lazySingleton<_i13.NotificationsDatasource>(
      () => _i13.NotificationsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i14.ProductsSalesReportsDatasource>(
      () => _i14.ProductsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i15.LevelsDatasource>(
      () => _i15.LevelsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i16.GreetingCommunicationDatasource>(
      () => _i16.GreetingCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i17.AgentsDistributorsActionsDataSource>(() =>
      _i17.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i18.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i19.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i20.ClientsInstallReportsDatasource>(
      () => _i20.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.RegionsSalesReportsDatasource>(
      () => _i21.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.ClientsDebtsReportsDatasource>(
      () => _i22.ClientsDebtsReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.PreviousRatingsDatasource>(
      () => _i23.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.ClientsCareReportsDatasource>(
      () => _i24.ClientsCareReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.NotificationsRepo>(
      () => _i26.NotificationsRepoImpl(gh<_i13.NotificationsDatasource>()));
  gh.lazySingleton<_i27.ClientsAcceptDatasource>(
      () => _i27.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.ClientsStatusReportsDatasource>(
      () => _i28.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.PeriodicCommunicationReportsDatasource>(() =>
      _i29.PeriodicCommunicationReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.DelayInstallReportsDatasource>(
      () => _i30.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.ParticipatesListDatasource>(
      () => _i31.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.PeriodicCommunicationDatasource>(
      () => _i32.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.EmployeesSalesReportsDatasource>(
      () => _i33.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i34.PeriodicCommunicationReportsRepo>(() =>
      _i35.PeriodicCommunicationReportsRepoImpl(
          gh<_i29.PeriodicCommunicationReportsDatasource>()));
  gh.factory<_i36.PrivilegesDatasource>(
      () => _i36.PrivilegesDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i37.ManageWithdrawalsDatasource>(
      () => _i37.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i38.ClientsAcceptRepository>(() =>
      _i39.ClientsAcceptRepositoryImpl(gh<_i27.ClientsAcceptDatasource>()));
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
      () => _i46.LevelsRepoImpl(gh<_i15.LevelsDatasource>()));
  gh.lazySingleton<_i47.TicketsDataSource>(
      () => _i47.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i48.SupportClientsInvoicesDatasource>(
      () => _i48.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i49.UsersDatasource>(
      () => _i49.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i18.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i19.FlutterSecureStorage>(
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
  gh.factory<_i56.LinkDatasource>(
      () => _i56.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i57.TaskDatasource>(
      () => _i57.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i58.UsersDatasource>(
      () => _i58.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i59.CitiesDatasource>(
      () => _i59.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i60.AdvancedConfigsDatasource>(
      () => _i60.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i61.TicketsRepo>(
      () => _i62.TicketsRepoImpl(gh<_i47.TicketsDataSource>()));
  gh.lazySingleton<_i63.RegionsSalesReportsRepo>(() =>
      _i64.RegionsSalesReportsRepoImpl(
          gh<_i21.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i65.ClientsDebtsReportsRepo>(() =>
      _i66.ClientsDebtsReportsRepoImpl(
          gh<_i22.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i67.SupportClientsAcceptRepository>(() =>
      _i68.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i69.DelayAfterInstallRepo>(() =>
      _i70.DelayAfterInstallRepoImpl(gh<_i11.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i71.GetSupportClientsAcceptUseCase>(() =>
      _i71.GetSupportClientsAcceptUseCase(
          gh<_i67.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i72.UsersRepository>(
      () => _i73.UsersRepositoryImpl(gh<_i58.UsersDatasource>()));
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
      _i83.ClientsCareReportsRepoImpl(gh<_i24.ClientsCareReportsDatasource>()));
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
          gh<_i20.ClientsInstallReportsDatasource>()));
  gh.factory<_i92.TaskRepository>(
      () => _i93.TaskRepositoryImpl(gh<_i57.TaskDatasource>()));
  gh.lazySingleton<_i94.AgentsDistributorsDataSource>(
      () => _i94.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i95.GetClientsInstallReportsUsecase>(() =>
      _i95.GetClientsInstallReportsUsecase(
          gh<_i90.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i96.PreviousRatingsRepo>(
      () => _i97.PreviousRatingsRepoImpl(gh<_i23.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i98.AddLevelUsecase>(
      () => _i98.AddLevelUsecase(gh<_i45.LevelsRepo>()));
  gh.lazySingleton<_i99.GetLevelsUsecase>(
      () => _i99.GetLevelsUsecase(gh<_i45.LevelsRepo>()));
  gh.lazySingleton<_i100.SupportTabDataSource>(
      () => _i100.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i101.GetUsersUsecase>(
      () => _i101.GetUsersUsecase(gh<_i72.UsersRepository>()));
  gh.lazySingleton<_i102.GetPendingInvoicesUsecase>(
      () => _i102.GetPendingInvoicesUsecase(gh<_i79.PendingInvoicesRepo>()));
  gh.lazySingleton<_i103.GetClientsCareReportsUsecase>(() =>
      _i103.GetClientsCareReportsUsecase(gh<_i82.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i104.InvoicesTabDataSource>(
      () => _i104.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i105.CitiesRepository>(
      () => _i106.CitiesRepositoryImpl(gh<_i59.CitiesDatasource>()));
  gh.lazySingleton<_i107.GetCitiesUseCase>(
      () => _i107.GetCitiesUseCase(gh<_i105.CitiesRepository>()));
  gh.lazySingleton<_i108.AddTicketUseCase>(
      () => _i108.AddTicketUseCase(gh<_i61.TicketsRepo>()));
  gh.lazySingleton<_i109.EditTicketTypeUseCase>(
      () => _i109.EditTicketTypeUseCase(gh<_i61.TicketsRepo>()));
  gh.lazySingleton<_i110.GetClientTicketsUseCase>(
      () => _i110.GetClientTicketsUseCase(gh<_i61.TicketsRepo>()));
  gh.lazySingleton<_i111.GetTicketsUseCase>(
      () => _i111.GetTicketsUseCase(gh<_i61.TicketsRepo>()));
  gh.lazySingleton<_i112.GetTicketByIdUseCase>(
      () => _i112.GetTicketByIdUseCase(gh<_i61.TicketsRepo>()));
  gh.lazySingleton<_i113.TransferTicketUseCase>(
      () => _i113.TransferTicketUseCase(gh<_i61.TicketsRepo>()));
  gh.factory<_i114.TicketsCubit>(() => _i114.TicketsCubit(
        gh<_i111.GetTicketsUseCase>(),
        gh<_i112.GetTicketByIdUseCase>(),
        gh<_i110.GetClientTicketsUseCase>(),
      ));
  gh.factory<_i115.LevelsCubit>(() => _i115.LevelsCubit(
        gh<_i99.GetLevelsUsecase>(),
        gh<_i98.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i116.LoginRemoteDataSource>(
      () => _i116.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i117.EmployeesSalesReportsRepo>(() =>
      _i118.EmployeesSalesReportsRepoImpl(
          gh<_i33.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i119.AdvancedConfigsRepository>(() =>
      _i120.AdvancedConfigsRepositoryImpl(
          gh<_i60.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i121.ParticipateListRepository>(() =>
      _i122.ParticipateListRepositoryImpl(
          gh<_i31.ParticipatesListDatasource>()));
  gh.lazySingleton<_i123.LatestClientsUpdatesDatasource>(
      () => _i123.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i124.InvoicesSectionRepo>(
      () => _i125.InvoicesTabRepoImpl(gh<_i104.InvoicesTabDataSource>()));
  gh.factory<_i126.SupportClientsAcceptCubit>(() =>
      _i126.SupportClientsAcceptCubit(
          gh<_i71.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i127.WaitingAgentsDataSource>(
      () => _i127.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i128.SpecialClientsRepository>(() =>
      _i129.SpecialClientsRepositoryImpl(gh<_i53.SpecialClientsDatasource>()));
  gh.lazySingleton<_i130.GetFinancePendingInvoicesUsecase>(() =>
      _i130.GetFinancePendingInvoicesUsecase(gh<_i77.FinancePendingRepo>()));
  gh.lazySingleton<_i131.ProductsSalesReportsRepo>(() =>
      _i132.ProductsSalesReportsRepoImpl(
          gh<_i14.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i133.AgentsDistributorsProfileDataSource>(() =>
      _i133.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i134.EditTicketCubit>(() => _i134.EditTicketCubit(
        gh<_i109.EditTicketTypeUseCase>(),
        gh<_i113.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i135.ClientsStatusReportsRepo>(() =>
      _i136.ClientsStatusReportsRepoImpl(
          gh<_i28.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i137.DatesTableDataSource>(
      () => _i137.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i138.GetDelayAfterInstallUseCase>(() =>
      _i138.GetDelayAfterInstallUseCase(gh<_i69.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i139.RegionsDatasource>(
      () => _i139.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i140.LocationServices>(
      () => _i140.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i141.GetClientsDebtsReportsUsecase>(() =>
      _i141.GetClientsDebtsReportsUsecase(gh<_i65.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i142.GreetingCommunicationRepo>(() =>
      _i143.GreetingCommunicationRepoImpl(
          gh<_i16.GreetingCommunicationDatasource>()));
  gh.singleton<_i144.CacheServices>(
    () => _i145.SecureStorageConsumer(gh<_i19.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i144.CacheServices>(() async =>
      _i146.PrefsConsumer(await gh.getAsync<_i18.SharedPreferences>()));
  gh.lazySingleton<_i147.InstallQualityRepo>(
      () => _i148.InstallQualityRepoImpl(gh<_i44.InstallQualityDatasource>()));
  gh.lazySingleton<_i149.DelayInstallReportsRepo>(() =>
      _i150.DelayInstallReportsRepoImpl(
          gh<_i30.DelayInstallReportsDatasource>()));
  gh.factory<_i151.AppRepository>(
      () => _i152.AppRepositoryImpl(gh<_i52.AppDatasource>()));
  gh.lazySingleton<_i153.AgentsDistributorsActionsRepo>(() =>
      _i154.AgentsDistributorsActionsRepoImpl(
          gh<_i17.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i155.FinancePendingCubit>(() =>
      _i155.FinancePendingCubit(gh<_i130.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i156.DelayAfterInstallCubit>(() =>
      _i156.DelayAfterInstallCubit(gh<_i138.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i157.GetRegionsSalesReportsUsecase>(() =>
      _i157.GetRegionsSalesReportsUsecase(gh<_i63.RegionsSalesReportsRepo>()));
  gh.factory<_i158.ClientsCareReportsCubit>(() =>
      _i158.ClientsCareReportsCubit(gh<_i103.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i159.SupportTabRepo>(
      () => _i160.SupportTabRepoImpl(gh<_i100.SupportTabDataSource>()));
  gh.factory<_i161.LinksImportantRepository>(
      () => _i162.LinkRepositoryImpl(gh<_i56.LinkDatasource>()));
  gh.factory<_i163.GetSpecialClientsUsecase>(() =>
      _i163.GetSpecialClientsUsecase(gh<_i128.SpecialClientsRepository>()));
  gh.lazySingleton<_i164.GetInvoicesByPrivilegesUsecase>(() =>
      _i164.GetInvoicesByPrivilegesUsecase(gh<_i124.InvoicesSectionRepo>()));
  gh.lazySingleton<_i165.GetClientsAcceptUseCase>(
      () => _i165.GetClientsAcceptUseCase(gh<_i38.ClientsAcceptRepository>()));
  gh.lazySingleton<_i166.GeneralConfigsRepository>(() =>
      _i167.GeneralConfigsRepositoryImpl(gh<_i76.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i168.GetNotificationsUsecase>(
      () => _i168.GetNotificationsUsecase(gh<_i25.NotificationsRepo>()));
  gh.lazySingleton<_i169.GetUnreadNotificationsCountUsecase>(() =>
      _i169.GetUnreadNotificationsCountUsecase(gh<_i25.NotificationsRepo>()));
  gh.lazySingleton<_i170.MarkNotificationsAsReadUsecase>(
      () => _i170.MarkNotificationsAsReadUsecase(gh<_i25.NotificationsRepo>()));
  gh.lazySingleton<_i171.GetPeriodicCommunicationReportsUsecase>(() =>
      _i171.GetPeriodicCommunicationReportsUsecase(
          gh<_i34.PeriodicCommunicationReportsRepo>()));
  gh.factory<_i172.PrivilegeRepository>(
      () => _i173.PrivilegeRepositoryImpl(gh<_i36.PrivilegesDatasource>()));
  gh.lazySingleton<_i174.GetBranchesByIdCountryUseCase>(
      () => _i174.GetBranchesByIdCountryUseCase(gh<_i87.BranchesRepository>()));
  gh.factory<_i175.CompanyRepository>(
      () => _i176.CompanyRepositoryImpl(gh<_i55.CommentCompanyDatasource>()));
  gh.lazySingleton<_i177.GetInstallUseCase>(
      () => _i177.GetInstallUseCase(gh<_i147.InstallQualityRepo>()));
  gh.lazySingleton<_i178.AgentsDistributorsProfileRepo>(() =>
      _i179.AgentsDistributorsProfileRepoImpl(
          gh<_i133.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i180.AddDateInstallUsecase>(
      () => _i180.AddDateInstallUsecase(gh<_i159.SupportTabRepo>()));
  gh.lazySingleton<_i181.CancelDateInstallUsecase>(
      () => _i181.CancelDateInstallUsecase(gh<_i159.SupportTabRepo>()));
  gh.lazySingleton<_i182.GetInvoiceByClientUsecase>(
      () => _i182.GetInvoiceByClientUsecase(gh<_i159.SupportTabRepo>()));
  gh.lazySingleton<_i183.ReceiveDeviceUsecase>(
      () => _i183.ReceiveDeviceUsecase(gh<_i159.SupportTabRepo>()));
  gh.lazySingleton<_i184.ReturnInvoiceApproveUsecase>(
      () => _i184.ReturnInvoiceApproveUsecase(gh<_i159.SupportTabRepo>()));
  gh.lazySingleton<_i185.SetDateDoneUsecase>(
      () => _i185.SetDateDoneUsecase(gh<_i159.SupportTabRepo>()));
  gh.lazySingleton<_i186.SetReadyInstallUsecase>(
      () => _i186.SetReadyInstallUsecase(gh<_i159.SupportTabRepo>()));
  gh.lazySingleton<_i187.GetAllUsersUseCase>(
      () => _i187.GetAllUsersUseCase(gh<_i124.InvoicesSectionRepo>()));
  gh.lazySingleton<_i188.ClientsDebtsRepo>(
      () => _i189.ClientsDebtsRepoImpl(gh<_i40.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i190.PeriodicCommunicationRepo>(() =>
      _i191.PeriodicCommunicationRepoImpl(
          gh<_i32.PeriodicCommunicationDatasource>()));
  gh.lazySingleton<_i192.SupportClientsInvoicesRepo>(() =>
      _i193.SupportClientsInvoicesRepoImpl(
          gh<_i48.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i194.GetBranchesForUserUsecase>(
      () => _i194.GetBranchesForUserUsecase(gh<_i74.UsersRepository>()));
  gh.lazySingleton<_i195.GetLevelsForUserUsecase>(
      () => _i195.GetLevelsForUserUsecase(gh<_i74.UsersRepository>()));
  gh.lazySingleton<_i196.GetManagesForUserUsecase>(
      () => _i196.GetManagesForUserUsecase(gh<_i74.UsersRepository>()));
  gh.factory<_i197.GetUsersUsecase>(
      () => _i197.GetUsersUsecase(gh<_i74.UsersRepository>()));
  gh.factory<_i198.ActionLinkUsecase>(
      () => _i198.ActionLinkUsecase(gh<_i161.LinksImportantRepository>()));
  gh.factory<_i199.GetLinkUsecase>(
      () => _i199.GetLinkUsecase(gh<_i161.LinksImportantRepository>()));
  gh.lazySingleton<_i200.GetSupportClientsInvoicesUseCase>(() =>
      _i200.GetSupportClientsInvoicesUseCase(
          gh<_i192.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i201.ManageWithdrawalsRepository>(() =>
      _i202.ManageWithdrawalsRepositoryImpl(
          gh<_i37.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i203.AgentsDistributorsRepo>(() =>
      _i204.AgentsDistributorsRepoImpl(
          gh<_i94.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i205.GetProductsSalesReportsUsecase>(() =>
      _i205.GetProductsSalesReportsUsecase(
          gh<_i131.ProductsSalesReportsRepo>()));
  gh.singleton<_i206.CitiesCubit>(
      () => _i206.CitiesCubit(gh<_i107.GetCitiesUseCase>()));
  gh.factory<_i207.UsersTypeCubit>(
      () => _i207.UsersTypeCubit(gh<_i101.GetUsersUsecase>()));
  gh.factory<_i208.ClientsListRepository>(
      () => _i209.ClientsListRepositoryImpl(gh<_i54.ClientsListDatasource>()));
  gh.factory<_i210.AddParticipateCommentUsecase>(() =>
      _i210.AddParticipateCommentUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i211.AddParticipateUserUsecase>(() =>
      _i211.AddParticipateUserUsecase(gh<_i121.ParticipateListRepository>()));
  gh.factory<_i212.EditParticipateUserUsecase>(() =>
      _i212.EditParticipateUserUsecase(gh<_i121.ParticipateListRepository>()));
  gh.factory<_i213.GetInvoiceByIdUsecase>(
      () => _i213.GetInvoiceByIdUsecase(gh<_i121.ParticipateListRepository>()));
  gh.factory<_i214.ParticipateClientListUsecase>(() =>
      _i214.ParticipateClientListUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i215.ParticipateCommentListUsecase>(() =>
      _i215.ParticipateCommentListUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i216.ParticipateInvoiceListUsecase>(() =>
      _i216.ParticipateInvoiceListUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i217.ParticipateListUsecase>(() =>
      _i217.ParticipateListUsecase(gh<_i121.ParticipateListRepository>()));
  gh.lazySingleton<_i218.ChangeParticipateStatusUsecase>(() =>
      _i218.ChangeParticipateStatusUsecase(
          gh<_i121.ParticipateListRepository>()));
  gh.factory<_i219.PendingInvoicesCubit>(
      () => _i219.PendingInvoicesCubit(gh<_i102.GetPendingInvoicesUsecase>()));
  gh.factory<_i220.EvaluationLevelReportCubit>(() =>
      _i220.EvaluationLevelReportCubit(
          gh<_i89.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i221.GetEmployeesSalesReportsUsecase>(() =>
      _i221.GetEmployeesSalesReportsUsecase(
          gh<_i117.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i222.GetGreetingCommunicationUseCase>(() =>
      _i222.GetGreetingCommunicationUseCase(
          gh<_i142.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i223.ClientsTransferApprovalsRepo>(() =>
      _i224.ClientsTransferApprovalsRepoImpl(
          gh<_i50.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i225.LinkCubit>(() => _i225.LinkCubit(
        gh<_i199.GetLinkUsecase>(),
        gh<_i198.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i226.GetClientsStatusReportsUsecase>(() =>
      _i226.GetClientsStatusReportsUsecase(
          gh<_i135.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i227.GetPreviousRatingsUsecase>(
      () => _i227.GetPreviousRatingsUsecase(gh<_i96.PreviousRatingsRepo>()));
  gh.lazySingleton<_i228.WaitingAgentsRepo>(
      () => _i229.WaitingAgentsRepoImpl(gh<_i127.WaitingAgentsDataSource>()));
  gh.factory<_i230.AddClientUserUsecase>(
      () => _i230.AddClientUserUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i231.ApproveRejectClientUsecase>(() =>
      _i231.ApproveRejectClientUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i232.ChangeTypeClientUsecase>(
      () => _i232.ChangeTypeClientUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i233.EditClientUserUsecase>(
      () => _i233.EditClientUserUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i234.GetClientsListByRegionUseCase>(() =>
      _i234.GetClientsListByRegionUseCase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i235.GetClientsListByUserUseCase>(() =>
      _i235.GetClientsListByUserUseCase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i236.GetClientsWithFilterUserUsecase>(() =>
      _i236.GetClientsWithFilterUserUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i237.GetClientMarketingReportUsecase>(() =>
      _i237.GetClientMarketingReportUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i238.GetRecommendedClientsUsecase>(() =>
      _i238.GetRecommendedClientsUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i239.GetSimilarClientsUsecase>(
      () => _i239.GetSimilarClientsUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i240.ReceiveClientUserUsecase>(
      () => _i240.ReceiveClientUserUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i241.TransferClientUserUsecase>(
      () => _i241.TransferClientUserUsecase(gh<_i208.ClientsListRepository>()));
  gh.lazySingleton<_i242.GetHighSimilarClientsUsecase>(() =>
      _i242.GetHighSimilarClientsUsecase(gh<_i208.ClientsListRepository>()));
  gh.factory<_i243.EmployeesSalesReportsCubit>(() =>
      _i243.EmployeesSalesReportsCubit(
          gh<_i221.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i244.ChangeStateAgentUseCase>(
      () => _i244.ChangeStateAgentUseCase(gh<_i203.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i245.GetAgentsAndDistributorsUseCase>(() =>
      _i245.GetAgentsAndDistributorsUseCase(
          gh<_i203.AgentsDistributorsRepo>()));
  gh.factory<_i246.ClientsAcceptCubit>(
      () => _i246.ClientsAcceptCubit(gh<_i165.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i247.CancelWithdrawalUsecase>(() =>
      _i247.CancelWithdrawalUsecase(gh<_i201.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i248.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i248.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i201.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i249.GetWithdrawalsInvoicesUsecase>(() =>
      _i249.GetWithdrawalsInvoicesUsecase(
          gh<_i201.ManageWithdrawalsRepository>()));
  gh.factory<_i250.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i250.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i201.ManageWithdrawalsRepository>()));
  gh.factory<_i251.AddTaskUsecase>(
      () => _i251.AddTaskUsecase(gh<_i92.TaskRepository>()));
  gh.factory<_i252.ChangeStatusTaskUsecase>(
      () => _i252.ChangeStatusTaskUsecase(gh<_i92.TaskRepository>()));
  gh.factory<_i253.FilterTaskUsecase>(
      () => _i253.FilterTaskUsecase(gh<_i92.TaskRepository>()));
  gh.factory<_i254.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i254.GetUsersByDepartmentAndRegionUsecase(gh<_i92.TaskRepository>()));
  gh.lazySingleton<_i255.ExceededClientsUseCase>(
      () => _i255.ExceededClientsUseCase(gh<_i84.ExceededClientsRepo>()));
  gh.lazySingleton<_i256.TransferExceededClientsUseCase>(() =>
      _i256.TransferExceededClientsUseCase(gh<_i84.ExceededClientsRepo>()));
  gh.lazySingleton<_i257.LoginLocalDataSource>(() =>
      _i257.LoginLocalDataSourceImpl(
          gh<_i144.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i258.EditAdvancedConfigsUsecase>(() =>
      _i258.EditAdvancedConfigsUsecase(gh<_i119.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i259.GetAdvancedConfigsUsecase>(() =>
      _i259.GetAdvancedConfigsUsecase(gh<_i119.AdvancedConfigsRepository>()));
  gh.factory<_i260.ClientsInstallReportsCubit>(() =>
      _i260.ClientsInstallReportsCubit(
          gh<_i95.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i261.DatesTableRepo>(
      () => _i262.DatesTableRepoImpl(gh<_i137.DatesTableDataSource>()));
  gh.factory<_i263.GetVersionUseCase>(
      () => _i263.GetVersionUseCase(gh<_i151.AppRepository>()));
  gh.factory<_i264.AddTicketCubit>(
      () => _i264.AddTicketCubit(gh<_i108.AddTicketUseCase>()));
  gh.lazySingleton<_i265.LatestClientsUpdatesRepository>(() =>
      _i266.LatestClientsUpdatesRepositoryImpl(
          gh<_i123.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i267.EditGeneralConfigsUsecase>(() =>
      _i267.EditGeneralConfigsUsecase(gh<_i166.GeneralConfigsRepository>()));
  gh.lazySingleton<_i268.GetGeneralConfigsUsecase>(() =>
      _i268.GetGeneralConfigsUsecase(gh<_i166.GeneralConfigsRepository>()));
  gh.factory<_i269.PeriodicCommunicationReportsCubit>(() =>
      _i269.PeriodicCommunicationReportsCubit(
          gh<_i171.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i270.InstallQualityCubit>(
      () => _i270.InstallQualityCubit(gh<_i177.GetInstallUseCase>()));
  gh.lazySingleton<_i271.AddAgentUseCase>(
      () => _i271.AddAgentUseCase(gh<_i153.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i272.UpdateAgentUseCase>(() =>
      _i272.UpdateAgentUseCase(gh<_i153.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i273.GetDelayInstallReportsUseCase>(() =>
      _i273.GetDelayInstallReportsUseCase(gh<_i149.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i274.CrudAgentSupportFilesUsecase>(() =>
      _i274.CrudAgentSupportFilesUsecase(
          gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i275.GetClientsTransferApprovalsUsecase>(() =>
      _i275.GetClientsTransferApprovalsUsecase(
          gh<_i223.ClientsTransferApprovalsRepo>()));
  gh.factory<_i276.ClientsStatusReportsCubit>(() =>
      _i276.ClientsStatusReportsCubit(
          gh<_i226.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i277.TaskCubit>(() => _i277.TaskCubit(
        gh<_i251.AddTaskUsecase>(),
        gh<_i253.FilterTaskUsecase>(),
        gh<_i252.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i278.SupportTabCubit>(() => _i278.SupportTabCubit(
        gh<_i182.GetInvoiceByClientUsecase>(),
        gh<_i180.AddDateInstallUsecase>(),
        gh<_i185.SetDateDoneUsecase>(),
        gh<_i186.SetReadyInstallUsecase>(),
        gh<_i184.ReturnInvoiceApproveUsecase>(),
        gh<_i183.ReceiveDeviceUsecase>(),
        gh<_i181.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i279.ClientsDebtsReportsCubit>(() =>
      _i279.ClientsDebtsReportsCubit(
          gh<_i141.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i280.AddAgentDateUseCase>(() =>
      _i280.AddAgentDateUseCase(gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.factory<_i281.NotificationsCubit>(() => _i281.NotificationsCubit(
        gh<_i168.GetNotificationsUsecase>(),
        gh<_i170.MarkNotificationsAsReadUsecase>(),
        gh<_i169.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i282.RegionsRepository>(
      () => _i283.RegionsRepositoryImpl(gh<_i139.RegionsDatasource>()));
  gh.factory<_i284.RegionsSalesReportsCubit>(() =>
      _i284.RegionsSalesReportsCubit(
          gh<_i157.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i285.AgentsDistributorsActionsCubit>(
      () => _i285.AgentsDistributorsActionsCubit(
            gh<_i107.GetCitiesUseCase>(),
            gh<_i271.AddAgentUseCase>(),
            gh<_i272.UpdateAgentUseCase>(),
          ));
  gh.factory<_i286.InvoicesSectionCubit>(() => _i286.InvoicesSectionCubit(
        gh<_i164.GetInvoicesByPrivilegesUsecase>(),
        gh<_i245.GetAgentsAndDistributorsUseCase>(),
        gh<_i217.ParticipateListUsecase>(),
        gh<_i187.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i287.LoginRepo>(() => _i288.LoginRepoImpl(
        gh<_i116.LoginRemoteDataSource>(),
        gh<_i257.LoginLocalDataSource>(),
      ));
  gh.factory<_i289.AddLevelUsecase>(
      () => _i289.AddLevelUsecase(gh<_i172.PrivilegeRepository>()));
  gh.factory<_i290.GetLevelsUsecase>(
      () => _i290.GetLevelsUsecase(gh<_i172.PrivilegeRepository>()));
  gh.factory<_i291.GetPrivilegesUsecase>(
      () => _i291.GetPrivilegesUsecase(gh<_i172.PrivilegeRepository>()));
  gh.factory<_i292.UpdatePrivilegeUsecase>(
      () => _i292.UpdatePrivilegeUsecase(gh<_i172.PrivilegeRepository>()));
  gh.factory<_i293.SpecialClientsBloc>(
      () => _i293.SpecialClientsBloc(gh<_i163.GetSpecialClientsUsecase>()));
  gh.factory<_i294.AddCommentUsecase>(
      () => _i294.AddCommentUsecase(gh<_i175.CompanyRepository>()));
  gh.factory<_i295.GetCommentUsecase>(
      () => _i295.GetCommentUsecase(gh<_i175.CompanyRepository>()));
  gh.factory<_i296.DelayInstallReportsCubit>(() =>
      _i296.DelayInstallReportsCubit(
          gh<_i273.GetDelayInstallReportsUseCase>()));
  gh.factory<_i297.GreetingCommunicationCubit>(() =>
      _i297.GreetingCommunicationCubit(
          gh<_i222.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i298.GetRegionsUseCase>(
      () => _i298.GetRegionsUseCase(gh<_i282.RegionsRepository>()));
  gh.lazySingleton<_i299.PrivilegeCubit>(() => _i299.PrivilegeCubit(
        gh<_i290.GetLevelsUsecase>(),
        gh<_i291.GetPrivilegesUsecase>(),
        gh<_i292.UpdatePrivilegeUsecase>(),
        gh<_i289.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i300.GetLatestClientsUseCase>(() =>
      _i300.GetLatestClientsUseCase(
          gh<_i265.LatestClientsUpdatesRepository>()));
  gh.factory<_i301.AdvancedCofigsCubit>(() => _i301.AdvancedCofigsCubit(
        gh<_i259.GetAdvancedConfigsUsecase>(),
        gh<_i258.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i302.SupportClientsInvoicesCubit>(() =>
      _i302.SupportClientsInvoicesCubit(
          gh<_i200.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i303.ParticipateListBloc>(() => _i303.ParticipateListBloc(
        gh<_i217.ParticipateListUsecase>(),
        gh<_i211.AddParticipateUserUsecase>(),
        gh<_i212.EditParticipateUserUsecase>(),
        gh<_i214.ParticipateClientListUsecase>(),
        gh<_i216.ParticipateInvoiceListUsecase>(),
        gh<_i213.GetInvoiceByIdUsecase>(),
        gh<_i215.ParticipateCommentListUsecase>(),
        gh<_i210.AddParticipateCommentUsecase>(),
        gh<_i218.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i304.CacheTokenUsecase>(
      () => _i304.CacheTokenUsecase(gh<_i287.LoginRepo>()));
  gh.lazySingleton<_i305.GetTokenUsecase>(
      () => _i305.GetTokenUsecase(gh<_i287.LoginRepo>()));
  gh.lazySingleton<_i306.LoginUsecase>(
      () => _i306.LoginUsecase(gh<_i287.LoginRepo>()));
  gh.lazySingleton<_i307.ValidateTokenUsecase>(
      () => _i307.ValidateTokenUsecase(gh<_i287.LoginRepo>()));
  gh.lazySingleton<_i308.VerifyOtpUsecase>(
      () => _i308.VerifyOtpUsecase(gh<_i287.LoginRepo>()));
  gh.factory<_i309.ClientsTransferApprovalsCubit>(() =>
      _i309.ClientsTransferApprovalsCubit(
          gh<_i275.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i310.RegionsCubit>(
      () => _i310.RegionsCubit(gh<_i298.GetRegionsUseCase>()));
  gh.factory<_i311.GeneralCofigsCubit>(() => _i311.GeneralCofigsCubit(
        gh<_i268.GetGeneralConfigsUsecase>(),
        gh<_i267.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i312.GetPeriodicCommunicationUseCase>(() =>
      _i312.GetPeriodicCommunicationUseCase(
          gh<_i190.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i313.GetClientsDebtsUsecase>(
      () => _i313.GetClientsDebtsUsecase(gh<_i188.ClientsDebtsRepo>()));
  gh.lazySingleton<_i314.CrudClientSupportFilesUsecase>(() =>
      _i314.CrudClientSupportFilesUsecase(
          repository: gh<_i208.ClientsListRepository>()));
  gh.lazySingleton<_i315.GetClientSupportFilesUsecase>(() =>
      _i315.GetClientSupportFilesUsecase(
          repository: gh<_i208.ClientsListRepository>()));
  gh.factory<_i316.BranchesCubit>(
      () => _i316.BranchesCubit(gh<_i174.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i317.AddAgentCommentUsecase>(() =>
      _i317.AddAgentCommentUsecase(gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i318.DoneTrainingUsecase>(() =>
      _i318.DoneTrainingUsecase(gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i319.GetAgentUsecase>(
      () => _i319.GetAgentUsecase(gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i320.GetAgentClientListUsecase>(() =>
      _i320.GetAgentClientListUsecase(
          gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i321.GetAgentCommentsListUsecase>(() =>
      _i321.GetAgentCommentsListUsecase(
          gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i322.GetAgentDatesListUsecase>(() =>
      _i322.GetAgentDatesListUsecase(
          gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i323.GetAgentInvoiceListUsecase>(() =>
      _i323.GetAgentInvoiceListUsecase(
          gh<_i178.AgentsDistributorsProfileRepo>()));
  gh.factory<_i324.AddRejectReasonsUsecase>(() =>
      _i324.AddRejectReasonsUsecase(gh<_i201.ManageWithdrawalsRepository>()));
  gh.factory<_i325.EditRejectReasonsUsecase>(() =>
      _i325.EditRejectReasonsUsecase(gh<_i201.ManageWithdrawalsRepository>()));
  gh.factory<_i326.GetRejectReasonsUsecase>(() =>
      _i326.GetRejectReasonsUsecase(gh<_i201.ManageWithdrawalsRepository>()));
  gh.factory<_i327.GetUserSeriesUsecase>(() =>
      _i327.GetUserSeriesUsecase(gh<_i201.ManageWithdrawalsRepository>()));
  gh.factory<_i328.GetWithdrawnDetailsUsecase>(() =>
      _i328.GetWithdrawnDetailsUsecase(
          gh<_i201.ManageWithdrawalsRepository>()));
  gh.factory<_i329.SetApproveSeriesUsecase>(() =>
      _i329.SetApproveSeriesUsecase(gh<_i201.ManageWithdrawalsRepository>()));
  gh.factory<_i330.UpdateSeriesUsecase>(
      () => _i330.UpdateSeriesUsecase(gh<_i201.ManageWithdrawalsRepository>()));
  gh.singleton<_i331.AppManagerCubit>(
      () => _i331.AppManagerCubit(gh<_i263.GetVersionUseCase>()));
  gh.lazySingleton<_i332.GetWaitingAgentsUsecase>(
      () => _i332.GetWaitingAgentsUsecase(gh<_i228.WaitingAgentsRepo>()));
  gh.factory<_i333.ProductsSalesReportsCubit>(() =>
      _i333.ProductsSalesReportsCubit(
          gh<_i205.GetProductsSalesReportsUsecase>()));
  gh.factory<_i334.UsersCubit>(() => _i334.UsersCubit(
        gh<_i197.GetUsersUsecase>(),
        gh<_i86.ActionUserUsecase>(),
        gh<_i254.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i196.GetManagesForUserUsecase>(),
        gh<_i195.GetLevelsForUserUsecase>(),
        gh<_i194.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i335.PreviousRatingsCubit>(
      () => _i335.PreviousRatingsCubit(gh<_i227.GetPreviousRatingsUsecase>()));
  gh.factory<_i336.AgentsDistributorsCubit>(() => _i336.AgentsDistributorsCubit(
        gh<_i245.GetAgentsAndDistributorsUseCase>(),
        gh<_i244.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i337.ExceededClientsCubit>(() => _i337.ExceededClientsCubit(
        gh<_i255.ExceededClientsUseCase>(),
        gh<_i256.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i338.ManageWithdrawalsCubit>(() => _i338.ManageWithdrawalsCubit(
        gh<_i327.GetUserSeriesUsecase>(),
        gh<_i330.UpdateSeriesUsecase>(),
        gh<_i197.GetUsersUsecase>(),
        gh<_i249.GetWithdrawalsInvoicesUsecase>(),
        gh<_i250.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i329.SetApproveSeriesUsecase>(),
        gh<_i328.GetWithdrawnDetailsUsecase>(),
        gh<_i324.AddRejectReasonsUsecase>(),
        gh<_i326.GetRejectReasonsUsecase>(),
        gh<_i325.EditRejectReasonsUsecase>(),
        gh<_i248.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i247.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i339.LatestClientsUpdatesCubit>(() =>
      _i339.LatestClientsUpdatesCubit(gh<_i300.GetLatestClientsUseCase>()));
  gh.factory<_i340.AttachmentsRowCubit>(() => _i340.AttachmentsRowCubit(
        gh<_i315.GetClientSupportFilesUsecase>(),
        gh<_i314.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i341.CancelScheduleUsecase>(
      () => _i341.CancelScheduleUsecase(gh<_i261.DatesTableRepo>()));
  gh.lazySingleton<_i342.ChangeDateToDonUsecase>(
      () => _i342.ChangeDateToDonUsecase(gh<_i261.DatesTableRepo>()));
  gh.lazySingleton<_i343.GetCancelReasonsUsecase>(
      () => _i343.GetCancelReasonsUsecase(gh<_i261.DatesTableRepo>()));
  gh.lazySingleton<_i344.GetDateInstallationUsecase>(
      () => _i344.GetDateInstallationUsecase(gh<_i261.DatesTableRepo>()));
  gh.lazySingleton<_i345.GetInvoicesByClientForDateUsecase>(() =>
      _i345.GetInvoicesByClientForDateUsecase(gh<_i261.DatesTableRepo>()));
  gh.lazySingleton<_i346.GetSubscribedClientsUsecase>(
      () => _i346.GetSubscribedClientsUsecase(gh<_i261.DatesTableRepo>()));
  gh.lazySingleton<_i347.RescheduleDateUsecase>(
      () => _i347.RescheduleDateUsecase(gh<_i261.DatesTableRepo>()));
  gh.lazySingleton<_i348.ReturnScheduleVisitToOpenUsecase>(
      () => _i348.ReturnScheduleVisitToOpenUsecase(gh<_i261.DatesTableRepo>()));
  gh.factory<_i349.AgentsDistributorsProfileBloc>(
      () => _i349.AgentsDistributorsProfileBloc(
            gh<_i320.GetAgentClientListUsecase>(),
            gh<_i323.GetAgentInvoiceListUsecase>(),
            gh<_i213.GetInvoiceByIdUsecase>(),
            gh<_i321.GetAgentCommentsListUsecase>(),
            gh<_i317.AddAgentCommentUsecase>(),
            gh<_i318.DoneTrainingUsecase>(),
            gh<_i280.AddAgentDateUseCase>(),
            gh<_i322.GetAgentDatesListUsecase>(),
            gh<_i274.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i350.ClientsListBloc>(() => _i350.ClientsListBloc(
        gh<_i236.GetClientsWithFilterUserUsecase>(),
        gh<_i238.GetRecommendedClientsUsecase>(),
        gh<_i230.AddClientUserUsecase>(),
        gh<_i233.EditClientUserUsecase>(),
        gh<_i232.ChangeTypeClientUsecase>(),
        gh<_i239.GetSimilarClientsUsecase>(),
        gh<_i231.ApproveRejectClientUsecase>(),
        gh<_i314.CrudClientSupportFilesUsecase>(),
        gh<_i315.GetClientSupportFilesUsecase>(),
        gh<_i241.TransferClientUserUsecase>(),
        gh<_i240.ReceiveClientUserUsecase>(),
        gh<_i237.GetClientMarketingReportUsecase>(),
        gh<_i242.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i351.CompanyCubit>(() => _i351.CompanyCubit(
        gh<_i295.GetCommentUsecase>(),
        gh<_i294.AddCommentUsecase>(),
      ));
  gh.factory<_i352.ClientsDebtsCubit>(
      () => _i352.ClientsDebtsCubit(gh<_i313.GetClientsDebtsUsecase>()));
  gh.factory<_i353.PeriodicCommunicationCubit>(() =>
      _i353.PeriodicCommunicationCubit(
          gh<_i312.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i354.LoginCubit>(() => _i354.LoginCubit(
        gh<_i306.LoginUsecase>(),
        gh<_i308.VerifyOtpUsecase>(),
        gh<_i304.CacheTokenUsecase>(),
        gh<_i305.GetTokenUsecase>(),
        gh<_i307.ValidateTokenUsecase>(),
      ));
  gh.factory<_i355.DatesTableCubit>(() => _i355.DatesTableCubit(
        gh<_i344.GetDateInstallationUsecase>(),
        gh<_i347.RescheduleDateUsecase>(),
        gh<_i342.ChangeDateToDonUsecase>(),
        gh<_i341.CancelScheduleUsecase>(),
        gh<_i348.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i346.GetSubscribedClientsUsecase>(),
        gh<_i345.GetInvoicesByClientForDateUsecase>(),
        gh<_i180.AddDateInstallUsecase>(),
        gh<_i343.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i356.WaitingAgentsCubit>(
      () => _i356.WaitingAgentsCubit(gh<_i332.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i357.AppModule {}
