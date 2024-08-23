// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i18;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i17;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i48;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i148;
import '../../../features/app/domain/repositories/app_repository.dart' as _i147;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i257;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i325;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i251;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i110;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i282;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i281;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i298;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i299;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i300;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i301;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i302;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i348;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i26;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i37;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i36;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i161;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i240;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i23;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i80;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i79;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i98;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i154;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i43;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i59;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i58;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i103;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i104;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i105;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i107;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i106;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i108;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i258;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i128;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i109;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i41;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i40;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i86;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i214;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i15;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i137;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i136;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i216;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i291;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i42;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i142;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i141;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i171;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i264;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i31;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i185;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i184;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i306;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i347;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i28;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i34;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i33;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i167;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i263;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i22;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i94;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i93;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i221;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i329;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i49;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i123;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i122;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i159;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i287;
import '../../../features/common/branches/data/data_sources/branches_datasource.dart'
    as _i78;
import '../../../features/common/branches/data/repositories/branches_repository_impl.dart'
    as _i85;
import '../../../features/common/branches/domain/repositories/branches_repository.dart'
    as _i84;
import '../../../features/common/branches/domain/use_cases/get_branches_by_id_country_use_case.dart'
    as _i168;
import '../../../features/common/branches/presentation/manager/branches_cubit.dart'
    as _i310;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i56;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i101;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i100;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i102;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i200;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i95;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i156;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i155;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i174;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i175;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i176;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i177;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i178;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i179;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i180;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i272;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i133;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i277;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i276;
import '../../../features/common/regions/domain/use_cases/get_regions_use_case.dart'
    as _i292;
import '../../../features/common/regions/presentation/manager/regions_cubit.dart'
    as _i304;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i55;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i70;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i69;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i96;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i201;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i57;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i114;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i113;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i252;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i253;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i295;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i73;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i163;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i162;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i261;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i262;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i305;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i50;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i144;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i143;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i283;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i284;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i285;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i286;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i293;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i45;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i72;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i71;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i83;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i188;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i189;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i190;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i191;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i328;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i35;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i196;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i195;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i318;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i241;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i319;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i242;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i320;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i321;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i244;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i243;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i322;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i323;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i324;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i332;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i13;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i25;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i24;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i164;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i165;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i166;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i275;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i38;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i183;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i182;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i307;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i346;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i51;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i203;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i202;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i224;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i225;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i226;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i308;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i227;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i231;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i309;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i228;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i229;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i230;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i236;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i232;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i233;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i234;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i235;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i344;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i46;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i218;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i217;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i269;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i303;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i39;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i75;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i74;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i124;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i151;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i117;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i260;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i259;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i294;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i333;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i77;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i76;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i97;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i213;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i52;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i170;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i169;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i288;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i289;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i345;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i47;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i82;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i81;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i249;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i250;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i331;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i99;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i119;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i118;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i181;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i160;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i280;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i16;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i91;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i127;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i150;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i173;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i198;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i149;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i172;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i197;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i311;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i274;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i265;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i238;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i268;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i312;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i313;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i314;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i315;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i316;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i317;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i239;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i266;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i279;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i343;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i330;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i53;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i158;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i157;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i192;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i193;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i219;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i30;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i116;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i115;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i204;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i205;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i212;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i206;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i207;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i208;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i209;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i210;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i211;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i297;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i21;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i63;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i62;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i135;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i273;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i27;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i130;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i129;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i220;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i270;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i32;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i112;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i111;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i215;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i237;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i14;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i126;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i125;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i199;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i327;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i20;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i61;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i60;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i153;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i278;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i19;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i88;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i87;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i92;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i254;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i131;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i256;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i255;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i335;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i336;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i337;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i338;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i339;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i340;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i341;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i342;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i349;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i67;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i66;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i132;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i152;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i29;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i146;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i145;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i267;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i290;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i65;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i64;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i68;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i120;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i44;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i187;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i186;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i194;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i296;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i121;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i223;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i222;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i326;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i350;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i54;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i90;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i89;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i245;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i246;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i247;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i248;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i271;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i334;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i138;
import '../cache_services/prefs_consumer.dart' as _i140;
import '../cache_services/secure_storage_consumer.dart' as _i139;
import '../maps/location_services.dart' as _i134;
import 'di_container.dart' as _i351;

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
  gh.lazySingleton<_i15.GreetingCommunicationDatasource>(
      () => _i15.GreetingCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i16.AgentsDistributorsActionsDataSource>(() =>
      _i16.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i17.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i18.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i19.ClientsInstallReportsDatasource>(
      () => _i19.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.RegionsSalesReportsDatasource>(
      () => _i20.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.ClientsDebtsReportsDatasource>(
      () => _i21.ClientsDebtsReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.PreviousRatingsDatasource>(
      () => _i22.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.ClientsCareReportsDatasource>(
      () => _i23.ClientsCareReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.NotificationsRepo>(
      () => _i25.NotificationsRepoImpl(gh<_i13.NotificationsDatasource>()));
  gh.lazySingleton<_i26.ClientsAcceptDatasource>(
      () => _i26.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.ClientsStatusReportsDatasource>(
      () => _i27.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.PeriodicCommunicationReportsDatasource>(() =>
      _i28.PeriodicCommunicationReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.DelayInstallReportsDatasource>(
      () => _i29.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.ParticipatesListDatasource>(
      () => _i30.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.PeriodicCommunicationDatasource>(
      () => _i31.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.EmployeesSalesReportsDatasource>(
      () => _i32.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.PeriodicCommunicationReportsRepo>(() =>
      _i34.PeriodicCommunicationReportsRepoImpl(
          gh<_i28.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i35.ManageWithdrawalsDatasource>(
      () => _i35.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i36.ClientsAcceptRepository>(() =>
      _i37.ClientsAcceptRepositoryImpl(gh<_i26.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i38.ClientsDebtsDatasource>(
      () => _i38.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i39.FinancePendingDatasource>(
      () => _i39.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i40.EvaluationLevelReportRepo>(() =>
      _i41.EvaluationLevelReportRepoImpl(
          gh<_i10.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i42.InstallQualityDatasource>(
      () => _i42.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i43.TicketsDataSource>(
      () => _i43.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.SupportClientsInvoicesDatasource>(
      () => _i44.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.UsersDatasource>(
      () => _i45.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i17.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i18.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i46.ClientsTransferApprovalsDatasource>(
      () => _i46.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i47.ExceededClientsDatasource>(
      () => _i47.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i48.AppDatasource>(
      () => _i48.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i49.SpecialClientsDatasource>(
      () => _i49.SpecialClientsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i50.PrivilegeDatasource>(
      () => _i50.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i51.ClientsListDatasource>(
      () => _i51.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i52.CommentCompanyDatasource>(
      () => _i52.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i53.LinkDatasource>(
      () => _i53.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i54.TaskDatasource>(
      () => _i54.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i55.UsersDatasource>(
      () => _i55.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i56.CitiesDatasource>(
      () => _i56.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i57.AdvancedConfigsDatasource>(
      () => _i57.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i58.TicketsRepo>(
      () => _i59.TicketsRepoImpl(gh<_i43.TicketsDataSource>()));
  gh.lazySingleton<_i60.RegionsSalesReportsRepo>(() =>
      _i61.RegionsSalesReportsRepoImpl(
          gh<_i20.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i62.ClientsDebtsReportsRepo>(() =>
      _i63.ClientsDebtsReportsRepoImpl(
          gh<_i21.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i64.SupportClientsAcceptRepository>(() =>
      _i65.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i66.DelayAfterInstallRepo>(() =>
      _i67.DelayAfterInstallRepoImpl(gh<_i11.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i68.GetSupportClientsAcceptUseCase>(() =>
      _i68.GetSupportClientsAcceptUseCase(
          gh<_i64.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i69.UsersRepository>(
      () => _i70.UsersRepositoryImpl(gh<_i55.UsersDatasource>()));
  gh.lazySingleton<_i71.UsersRepository>(
      () => _i72.UsersRepositoryImpl(gh<_i45.UsersDatasource>()));
  gh.lazySingleton<_i73.GeneralConfigsDatasource>(
      () => _i73.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i74.FinancePendingRepo>(
      () => _i75.FinancePendingRepoImpl(gh<_i39.FinancePendingDatasource>()));
  gh.lazySingleton<_i76.PendingInvoicesRepo>(
      () => _i77.PendingInvoicesRepoImpl(gh<_i12.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i78.BranchesDatasource>(
      () => _i78.BranchesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i79.ClientsCareReportsRepo>(() =>
      _i80.ClientsCareReportsRepoImpl(gh<_i23.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i81.ExceededClientsRepo>(
      () => _i82.ExceededClientsRepoImpl(gh<_i47.ExceededClientsDatasource>()));
  gh.factory<_i83.ActionUserUsecase>(
      () => _i83.ActionUserUsecase(gh<_i71.UsersRepository>()));
  gh.lazySingleton<_i84.BranchesRepository>(
      () => _i85.BranchesRepositoryImpl(gh<_i78.BranchesDatasource>()));
  gh.lazySingleton<_i86.GetEvaluationLevelReportUsecase>(() =>
      _i86.GetEvaluationLevelReportUsecase(
          gh<_i40.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i87.ClientsInstallReportsRepo>(() =>
      _i88.ClientsInstallReportsRepoImpl(
          gh<_i19.ClientsInstallReportsDatasource>()));
  gh.factory<_i89.TaskRepository>(
      () => _i90.TaskRepositoryImpl(gh<_i54.TaskDatasource>()));
  gh.lazySingleton<_i91.AgentsDistributorsDataSource>(
      () => _i91.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i92.GetClientsInstallReportsUsecase>(() =>
      _i92.GetClientsInstallReportsUsecase(
          gh<_i87.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i93.PreviousRatingsRepo>(
      () => _i94.PreviousRatingsRepoImpl(gh<_i22.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i95.SupportTabDataSource>(
      () => _i95.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i96.GetUsersUsecase>(
      () => _i96.GetUsersUsecase(gh<_i69.UsersRepository>()));
  gh.lazySingleton<_i97.GetPendingInvoicesUsecase>(
      () => _i97.GetPendingInvoicesUsecase(gh<_i76.PendingInvoicesRepo>()));
  gh.lazySingleton<_i98.GetClientsCareReportsUsecase>(() =>
      _i98.GetClientsCareReportsUsecase(gh<_i79.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i99.InvoicesTabDataSource>(
      () => _i99.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i100.CitiesRepository>(
      () => _i101.CitiesRepositoryImpl(gh<_i56.CitiesDatasource>()));
  gh.lazySingleton<_i102.GetCitiesUseCase>(
      () => _i102.GetCitiesUseCase(gh<_i100.CitiesRepository>()));
  gh.lazySingleton<_i103.AddTicketUseCase>(
      () => _i103.AddTicketUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i104.EditTicketTypeUseCase>(
      () => _i104.EditTicketTypeUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i105.GetClientTicketsUseCase>(
      () => _i105.GetClientTicketsUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i106.GetTicketsUseCase>(
      () => _i106.GetTicketsUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i107.GetTicketByIdUseCase>(
      () => _i107.GetTicketByIdUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i108.TransferTicketUseCase>(
      () => _i108.TransferTicketUseCase(gh<_i58.TicketsRepo>()));
  gh.factory<_i109.TicketsCubit>(() => _i109.TicketsCubit(
        gh<_i106.GetTicketsUseCase>(),
        gh<_i107.GetTicketByIdUseCase>(),
        gh<_i105.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i110.LoginRemoteDataSource>(
      () => _i110.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i111.EmployeesSalesReportsRepo>(() =>
      _i112.EmployeesSalesReportsRepoImpl(
          gh<_i32.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i113.AdvancedConfigsRepository>(() =>
      _i114.AdvancedConfigsRepositoryImpl(
          gh<_i57.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i115.ParticipateListRepository>(() =>
      _i116.ParticipateListRepositoryImpl(
          gh<_i30.ParticipatesListDatasource>()));
  gh.lazySingleton<_i117.LatestClientsUpdatesDatasource>(
      () => _i117.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i118.InvoicesSectionRepo>(
      () => _i119.InvoicesTabRepoImpl(gh<_i99.InvoicesTabDataSource>()));
  gh.factory<_i120.SupportClientsAcceptCubit>(() =>
      _i120.SupportClientsAcceptCubit(
          gh<_i68.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i121.WaitingAgentsDataSource>(
      () => _i121.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i122.SpecialClientsRepository>(() =>
      _i123.SpecialClientsRepositoryImpl(gh<_i49.SpecialClientsDatasource>()));
  gh.lazySingleton<_i124.GetFinancePendingInvoicesUsecase>(() =>
      _i124.GetFinancePendingInvoicesUsecase(gh<_i74.FinancePendingRepo>()));
  gh.lazySingleton<_i125.ProductsSalesReportsRepo>(() =>
      _i126.ProductsSalesReportsRepoImpl(
          gh<_i14.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i127.AgentsDistributorsProfileDataSource>(() =>
      _i127.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i128.EditTicketCubit>(() => _i128.EditTicketCubit(
        gh<_i104.EditTicketTypeUseCase>(),
        gh<_i108.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i129.ClientsStatusReportsRepo>(() =>
      _i130.ClientsStatusReportsRepoImpl(
          gh<_i27.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i131.DatesTableDataSource>(
      () => _i131.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i132.GetDelayAfterInstallUseCase>(() =>
      _i132.GetDelayAfterInstallUseCase(gh<_i66.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i133.RegionsDatasource>(
      () => _i133.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i134.LocationServices>(
      () => _i134.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i135.GetClientsDebtsReportsUsecase>(() =>
      _i135.GetClientsDebtsReportsUsecase(gh<_i62.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i136.GreetingCommunicationRepo>(() =>
      _i137.GreetingCommunicationRepoImpl(
          gh<_i15.GreetingCommunicationDatasource>()));
  gh.singleton<_i138.CacheServices>(
    () => _i139.SecureStorageConsumer(gh<_i18.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i138.CacheServices>(() async =>
      _i140.PrefsConsumer(await gh.getAsync<_i17.SharedPreferences>()));
  gh.lazySingleton<_i141.InstallQualityRepo>(
      () => _i142.InstallQualityRepoImpl(gh<_i42.InstallQualityDatasource>()));
  gh.factory<_i143.PrivilegeRepository>(
      () => _i144.PrivilegeRepositoryImpl(gh<_i50.PrivilegeDatasource>()));
  gh.lazySingleton<_i145.DelayInstallReportsRepo>(() =>
      _i146.DelayInstallReportsRepoImpl(
          gh<_i29.DelayInstallReportsDatasource>()));
  gh.factory<_i147.AppRepository>(
      () => _i148.AppRepositoryImpl(gh<_i48.AppDatasource>()));
  gh.lazySingleton<_i149.AgentsDistributorsActionsRepo>(() =>
      _i150.AgentsDistributorsActionsRepoImpl(
          gh<_i16.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i151.FinancePendingCubit>(() =>
      _i151.FinancePendingCubit(gh<_i124.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i152.DelayAfterInstallCubit>(() =>
      _i152.DelayAfterInstallCubit(gh<_i132.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i153.GetRegionsSalesReportsUsecase>(() =>
      _i153.GetRegionsSalesReportsUsecase(gh<_i60.RegionsSalesReportsRepo>()));
  gh.factory<_i154.ClientsCareReportsCubit>(() =>
      _i154.ClientsCareReportsCubit(gh<_i98.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i155.SupportTabRepo>(
      () => _i156.SupportTabRepoImpl(gh<_i95.SupportTabDataSource>()));
  gh.factory<_i157.LinksImportantRepository>(
      () => _i158.LinkRepositoryImpl(gh<_i53.LinkDatasource>()));
  gh.factory<_i159.GetSpecialClientsUsecase>(() =>
      _i159.GetSpecialClientsUsecase(gh<_i122.SpecialClientsRepository>()));
  gh.lazySingleton<_i160.GetInvoicesByPrivilegesUsecase>(() =>
      _i160.GetInvoicesByPrivilegesUsecase(gh<_i118.InvoicesSectionRepo>()));
  gh.lazySingleton<_i161.GetClientsAcceptUseCase>(
      () => _i161.GetClientsAcceptUseCase(gh<_i36.ClientsAcceptRepository>()));
  gh.lazySingleton<_i162.GeneralConfigsRepository>(() =>
      _i163.GeneralConfigsRepositoryImpl(gh<_i73.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i164.GetNotificationsUsecase>(
      () => _i164.GetNotificationsUsecase(gh<_i24.NotificationsRepo>()));
  gh.lazySingleton<_i165.GetUnreadNotificationsCountUsecase>(() =>
      _i165.GetUnreadNotificationsCountUsecase(gh<_i24.NotificationsRepo>()));
  gh.lazySingleton<_i166.MarkNotificationsAsReadUsecase>(
      () => _i166.MarkNotificationsAsReadUsecase(gh<_i24.NotificationsRepo>()));
  gh.lazySingleton<_i167.GetPeriodicCommunicationReportsUsecase>(() =>
      _i167.GetPeriodicCommunicationReportsUsecase(
          gh<_i33.PeriodicCommunicationReportsRepo>()));
  gh.lazySingleton<_i168.GetBranchesByIdCountryUseCase>(
      () => _i168.GetBranchesByIdCountryUseCase(gh<_i84.BranchesRepository>()));
  gh.factory<_i169.CompanyRepository>(
      () => _i170.CompanyRepositoryImpl(gh<_i52.CommentCompanyDatasource>()));
  gh.lazySingleton<_i171.GetInstallUseCase>(
      () => _i171.GetInstallUseCase(gh<_i141.InstallQualityRepo>()));
  gh.lazySingleton<_i172.AgentsDistributorsProfileRepo>(() =>
      _i173.AgentsDistributorsProfileRepoImpl(
          gh<_i127.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i174.AddDateInstallUsecase>(
      () => _i174.AddDateInstallUsecase(gh<_i155.SupportTabRepo>()));
  gh.lazySingleton<_i175.CancelDateInstallUsecase>(
      () => _i175.CancelDateInstallUsecase(gh<_i155.SupportTabRepo>()));
  gh.lazySingleton<_i176.GetInvoiceByClientUsecase>(
      () => _i176.GetInvoiceByClientUsecase(gh<_i155.SupportTabRepo>()));
  gh.lazySingleton<_i177.ReceiveDeviceUsecase>(
      () => _i177.ReceiveDeviceUsecase(gh<_i155.SupportTabRepo>()));
  gh.lazySingleton<_i178.ReturnInvoiceApproveUsecase>(
      () => _i178.ReturnInvoiceApproveUsecase(gh<_i155.SupportTabRepo>()));
  gh.lazySingleton<_i179.SetDateDoneUsecase>(
      () => _i179.SetDateDoneUsecase(gh<_i155.SupportTabRepo>()));
  gh.lazySingleton<_i180.SetReadyInstallUsecase>(
      () => _i180.SetReadyInstallUsecase(gh<_i155.SupportTabRepo>()));
  gh.lazySingleton<_i181.GetAllUsersUseCase>(
      () => _i181.GetAllUsersUseCase(gh<_i118.InvoicesSectionRepo>()));
  gh.lazySingleton<_i182.ClientsDebtsRepo>(
      () => _i183.ClientsDebtsRepoImpl(gh<_i38.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i184.PeriodicCommunicationRepo>(() =>
      _i185.PeriodicCommunicationRepoImpl(
          gh<_i31.PeriodicCommunicationDatasource>()));
  gh.lazySingleton<_i186.SupportClientsInvoicesRepo>(() =>
      _i187.SupportClientsInvoicesRepoImpl(
          gh<_i44.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i188.GetBranchesForUserUsecase>(
      () => _i188.GetBranchesForUserUsecase(gh<_i71.UsersRepository>()));
  gh.lazySingleton<_i189.GetLevelsForUserUsecase>(
      () => _i189.GetLevelsForUserUsecase(gh<_i71.UsersRepository>()));
  gh.lazySingleton<_i190.GetManagesForUserUsecase>(
      () => _i190.GetManagesForUserUsecase(gh<_i71.UsersRepository>()));
  gh.factory<_i191.GetUsersUsecase>(
      () => _i191.GetUsersUsecase(gh<_i71.UsersRepository>()));
  gh.factory<_i192.ActionLinkUsecase>(
      () => _i192.ActionLinkUsecase(gh<_i157.LinksImportantRepository>()));
  gh.factory<_i193.GetLinkUsecase>(
      () => _i193.GetLinkUsecase(gh<_i157.LinksImportantRepository>()));
  gh.lazySingleton<_i194.GetSupportClientsInvoicesUseCase>(() =>
      _i194.GetSupportClientsInvoicesUseCase(
          gh<_i186.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i195.ManageWithdrawalsRepository>(() =>
      _i196.ManageWithdrawalsRepositoryImpl(
          gh<_i35.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i197.AgentsDistributorsRepo>(() =>
      _i198.AgentsDistributorsRepoImpl(
          gh<_i91.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i199.GetProductsSalesReportsUsecase>(() =>
      _i199.GetProductsSalesReportsUsecase(
          gh<_i125.ProductsSalesReportsRepo>()));
  gh.singleton<_i200.CitiesCubit>(
      () => _i200.CitiesCubit(gh<_i102.GetCitiesUseCase>()));
  gh.factory<_i201.UsersTypeCubit>(
      () => _i201.UsersTypeCubit(gh<_i96.GetUsersUsecase>()));
  gh.factory<_i202.ClientsListRepository>(
      () => _i203.ClientsListRepositoryImpl(gh<_i51.ClientsListDatasource>()));
  gh.factory<_i204.AddParticipateCommentUsecase>(() =>
      _i204.AddParticipateCommentUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i205.AddParticipateUserUsecase>(() =>
      _i205.AddParticipateUserUsecase(gh<_i115.ParticipateListRepository>()));
  gh.factory<_i206.EditParticipateUserUsecase>(() =>
      _i206.EditParticipateUserUsecase(gh<_i115.ParticipateListRepository>()));
  gh.factory<_i207.GetInvoiceByIdUsecase>(
      () => _i207.GetInvoiceByIdUsecase(gh<_i115.ParticipateListRepository>()));
  gh.factory<_i208.ParticipateClientListUsecase>(() =>
      _i208.ParticipateClientListUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i209.ParticipateCommentListUsecase>(() =>
      _i209.ParticipateCommentListUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i210.ParticipateInvoiceListUsecase>(() =>
      _i210.ParticipateInvoiceListUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i211.ParticipateListUsecase>(() =>
      _i211.ParticipateListUsecase(gh<_i115.ParticipateListRepository>()));
  gh.lazySingleton<_i212.ChangeParticipateStatusUsecase>(() =>
      _i212.ChangeParticipateStatusUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i213.PendingInvoicesCubit>(
      () => _i213.PendingInvoicesCubit(gh<_i97.GetPendingInvoicesUsecase>()));
  gh.factory<_i214.EvaluationLevelReportCubit>(() =>
      _i214.EvaluationLevelReportCubit(
          gh<_i86.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i215.GetEmployeesSalesReportsUsecase>(() =>
      _i215.GetEmployeesSalesReportsUsecase(
          gh<_i111.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i216.GetGreetingCommunicationUseCase>(() =>
      _i216.GetGreetingCommunicationUseCase(
          gh<_i136.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i217.ClientsTransferApprovalsRepo>(() =>
      _i218.ClientsTransferApprovalsRepoImpl(
          gh<_i46.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i219.LinkCubit>(() => _i219.LinkCubit(
        gh<_i193.GetLinkUsecase>(),
        gh<_i192.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i220.GetClientsStatusReportsUsecase>(() =>
      _i220.GetClientsStatusReportsUsecase(
          gh<_i129.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i221.GetPreviousRatingsUsecase>(
      () => _i221.GetPreviousRatingsUsecase(gh<_i93.PreviousRatingsRepo>()));
  gh.lazySingleton<_i222.WaitingAgentsRepo>(
      () => _i223.WaitingAgentsRepoImpl(gh<_i121.WaitingAgentsDataSource>()));
  gh.factory<_i224.AddClientUserUsecase>(
      () => _i224.AddClientUserUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i225.ApproveRejectClientUsecase>(() =>
      _i225.ApproveRejectClientUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i226.ChangeTypeClientUsecase>(
      () => _i226.ChangeTypeClientUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i227.EditClientUserUsecase>(
      () => _i227.EditClientUserUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i228.GetClientsListByRegionUseCase>(() =>
      _i228.GetClientsListByRegionUseCase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i229.GetClientsListByUserUseCase>(() =>
      _i229.GetClientsListByUserUseCase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i230.GetClientsWithFilterUserUsecase>(() =>
      _i230.GetClientsWithFilterUserUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i231.GetClientMarketingReportUsecase>(() =>
      _i231.GetClientMarketingReportUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i232.GetRecommendedClientsUsecase>(() =>
      _i232.GetRecommendedClientsUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i233.GetSimilarClientsUsecase>(
      () => _i233.GetSimilarClientsUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i234.ReceiveClientUserUsecase>(
      () => _i234.ReceiveClientUserUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i235.TransferClientUserUsecase>(
      () => _i235.TransferClientUserUsecase(gh<_i202.ClientsListRepository>()));
  gh.lazySingleton<_i236.GetHighSimilarClientsUsecase>(() =>
      _i236.GetHighSimilarClientsUsecase(gh<_i202.ClientsListRepository>()));
  gh.factory<_i237.EmployeesSalesReportsCubit>(() =>
      _i237.EmployeesSalesReportsCubit(
          gh<_i215.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i238.ChangeStateAgentUseCase>(
      () => _i238.ChangeStateAgentUseCase(gh<_i197.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i239.GetAgentsAndDistributorsUseCase>(() =>
      _i239.GetAgentsAndDistributorsUseCase(
          gh<_i197.AgentsDistributorsRepo>()));
  gh.factory<_i240.ClientsAcceptCubit>(
      () => _i240.ClientsAcceptCubit(gh<_i161.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i241.CancelWithdrawalUsecase>(() =>
      _i241.CancelWithdrawalUsecase(gh<_i195.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i242.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i242.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i195.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i243.GetWithdrawalsInvoicesUsecase>(() =>
      _i243.GetWithdrawalsInvoicesUsecase(
          gh<_i195.ManageWithdrawalsRepository>()));
  gh.factory<_i244.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i244.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i195.ManageWithdrawalsRepository>()));
  gh.factory<_i245.AddTaskUsecase>(
      () => _i245.AddTaskUsecase(gh<_i89.TaskRepository>()));
  gh.factory<_i246.ChangeStatusTaskUsecase>(
      () => _i246.ChangeStatusTaskUsecase(gh<_i89.TaskRepository>()));
  gh.factory<_i247.FilterTaskUsecase>(
      () => _i247.FilterTaskUsecase(gh<_i89.TaskRepository>()));
  gh.factory<_i248.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i248.GetUsersByDepartmentAndRegionUsecase(gh<_i89.TaskRepository>()));
  gh.lazySingleton<_i249.ExceededClientsUseCase>(
      () => _i249.ExceededClientsUseCase(gh<_i81.ExceededClientsRepo>()));
  gh.lazySingleton<_i250.TransferExceededClientsUseCase>(() =>
      _i250.TransferExceededClientsUseCase(gh<_i81.ExceededClientsRepo>()));
  gh.lazySingleton<_i251.LoginLocalDataSource>(() =>
      _i251.LoginLocalDataSourceImpl(
          gh<_i138.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i252.EditAdvancedConfigsUsecase>(() =>
      _i252.EditAdvancedConfigsUsecase(gh<_i113.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i253.GetAdvancedConfigsUsecase>(() =>
      _i253.GetAdvancedConfigsUsecase(gh<_i113.AdvancedConfigsRepository>()));
  gh.factory<_i254.ClientsInstallReportsCubit>(() =>
      _i254.ClientsInstallReportsCubit(
          gh<_i92.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i255.DatesTableRepo>(
      () => _i256.DatesTableRepoImpl(gh<_i131.DatesTableDataSource>()));
  gh.factory<_i257.GetVersionUseCase>(
      () => _i257.GetVersionUseCase(gh<_i147.AppRepository>()));
  gh.factory<_i258.AddTicketCubit>(
      () => _i258.AddTicketCubit(gh<_i103.AddTicketUseCase>()));
  gh.lazySingleton<_i259.LatestClientsUpdatesRepository>(() =>
      _i260.LatestClientsUpdatesRepositoryImpl(
          gh<_i117.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i261.EditGeneralConfigsUsecase>(() =>
      _i261.EditGeneralConfigsUsecase(gh<_i162.GeneralConfigsRepository>()));
  gh.lazySingleton<_i262.GetGeneralConfigsUsecase>(() =>
      _i262.GetGeneralConfigsUsecase(gh<_i162.GeneralConfigsRepository>()));
  gh.factory<_i263.PeriodicCommunicationReportsCubit>(() =>
      _i263.PeriodicCommunicationReportsCubit(
          gh<_i167.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i264.InstallQualityCubit>(
      () => _i264.InstallQualityCubit(gh<_i171.GetInstallUseCase>()));
  gh.lazySingleton<_i265.AddAgentUseCase>(
      () => _i265.AddAgentUseCase(gh<_i149.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i266.UpdateAgentUseCase>(() =>
      _i266.UpdateAgentUseCase(gh<_i149.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i267.GetDelayInstallReportsUseCase>(() =>
      _i267.GetDelayInstallReportsUseCase(gh<_i145.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i268.CrudAgentSupportFilesUsecase>(() =>
      _i268.CrudAgentSupportFilesUsecase(
          gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i269.GetClientsTransferApprovalsUsecase>(() =>
      _i269.GetClientsTransferApprovalsUsecase(
          gh<_i217.ClientsTransferApprovalsRepo>()));
  gh.factory<_i270.ClientsStatusReportsCubit>(() =>
      _i270.ClientsStatusReportsCubit(
          gh<_i220.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i271.TaskCubit>(() => _i271.TaskCubit(
        gh<_i245.AddTaskUsecase>(),
        gh<_i247.FilterTaskUsecase>(),
        gh<_i246.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i272.SupportTabCubit>(() => _i272.SupportTabCubit(
        gh<_i176.GetInvoiceByClientUsecase>(),
        gh<_i174.AddDateInstallUsecase>(),
        gh<_i179.SetDateDoneUsecase>(),
        gh<_i180.SetReadyInstallUsecase>(),
        gh<_i178.ReturnInvoiceApproveUsecase>(),
        gh<_i177.ReceiveDeviceUsecase>(),
        gh<_i175.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i273.ClientsDebtsReportsCubit>(() =>
      _i273.ClientsDebtsReportsCubit(
          gh<_i135.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i274.AddAgentDateUseCase>(() =>
      _i274.AddAgentDateUseCase(gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.factory<_i275.NotificationsCubit>(() => _i275.NotificationsCubit(
        gh<_i164.GetNotificationsUsecase>(),
        gh<_i166.MarkNotificationsAsReadUsecase>(),
        gh<_i165.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.lazySingleton<_i276.RegionsRepository>(
      () => _i277.RegionsRepositoryImpl(gh<_i133.RegionsDatasource>()));
  gh.factory<_i278.RegionsSalesReportsCubit>(() =>
      _i278.RegionsSalesReportsCubit(
          gh<_i153.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i279.AgentsDistributorsActionsCubit>(
      () => _i279.AgentsDistributorsActionsCubit(
            gh<_i102.GetCitiesUseCase>(),
            gh<_i265.AddAgentUseCase>(),
            gh<_i266.UpdateAgentUseCase>(),
          ));
  gh.factory<_i280.InvoicesSectionCubit>(() => _i280.InvoicesSectionCubit(
        gh<_i160.GetInvoicesByPrivilegesUsecase>(),
        gh<_i239.GetAgentsAndDistributorsUseCase>(),
        gh<_i211.ParticipateListUsecase>(),
        gh<_i181.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i281.LoginRepo>(() => _i282.LoginRepoImpl(
        gh<_i110.LoginRemoteDataSource>(),
        gh<_i251.LoginLocalDataSource>(),
      ));
  gh.factory<_i283.AddLevelUsecase>(
      () => _i283.AddLevelUsecase(gh<_i143.PrivilegeRepository>()));
  gh.factory<_i284.GetLevelsUsecase>(
      () => _i284.GetLevelsUsecase(gh<_i143.PrivilegeRepository>()));
  gh.factory<_i285.GetPrivilegesUsecase>(
      () => _i285.GetPrivilegesUsecase(gh<_i143.PrivilegeRepository>()));
  gh.factory<_i286.UpdatePrivilegeUsecase>(
      () => _i286.UpdatePrivilegeUsecase(gh<_i143.PrivilegeRepository>()));
  gh.factory<_i287.SpecialClientsBloc>(
      () => _i287.SpecialClientsBloc(gh<_i159.GetSpecialClientsUsecase>()));
  gh.factory<_i288.AddCommentUsecase>(
      () => _i288.AddCommentUsecase(gh<_i169.CompanyRepository>()));
  gh.factory<_i289.GetCommentUsecase>(
      () => _i289.GetCommentUsecase(gh<_i169.CompanyRepository>()));
  gh.factory<_i290.DelayInstallReportsCubit>(() =>
      _i290.DelayInstallReportsCubit(
          gh<_i267.GetDelayInstallReportsUseCase>()));
  gh.factory<_i291.GreetingCommunicationCubit>(() =>
      _i291.GreetingCommunicationCubit(
          gh<_i216.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i292.GetRegionsUseCase>(
      () => _i292.GetRegionsUseCase(gh<_i276.RegionsRepository>()));
  gh.lazySingleton<_i293.PrivilegeCubit>(() => _i293.PrivilegeCubit(
        gh<_i284.GetLevelsUsecase>(),
        gh<_i285.GetPrivilegesUsecase>(),
        gh<_i286.UpdatePrivilegeUsecase>(),
        gh<_i283.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i294.GetLatestClientsUseCase>(() =>
      _i294.GetLatestClientsUseCase(
          gh<_i259.LatestClientsUpdatesRepository>()));
  gh.factory<_i295.AdvancedCofigsCubit>(() => _i295.AdvancedCofigsCubit(
        gh<_i253.GetAdvancedConfigsUsecase>(),
        gh<_i252.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i296.SupportClientsInvoicesCubit>(() =>
      _i296.SupportClientsInvoicesCubit(
          gh<_i194.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i297.ParticipateListBloc>(() => _i297.ParticipateListBloc(
        gh<_i211.ParticipateListUsecase>(),
        gh<_i205.AddParticipateUserUsecase>(),
        gh<_i206.EditParticipateUserUsecase>(),
        gh<_i208.ParticipateClientListUsecase>(),
        gh<_i210.ParticipateInvoiceListUsecase>(),
        gh<_i207.GetInvoiceByIdUsecase>(),
        gh<_i209.ParticipateCommentListUsecase>(),
        gh<_i204.AddParticipateCommentUsecase>(),
        gh<_i212.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i298.CacheTokenUsecase>(
      () => _i298.CacheTokenUsecase(gh<_i281.LoginRepo>()));
  gh.lazySingleton<_i299.GetTokenUsecase>(
      () => _i299.GetTokenUsecase(gh<_i281.LoginRepo>()));
  gh.lazySingleton<_i300.LoginUsecase>(
      () => _i300.LoginUsecase(gh<_i281.LoginRepo>()));
  gh.lazySingleton<_i301.ValidateTokenUsecase>(
      () => _i301.ValidateTokenUsecase(gh<_i281.LoginRepo>()));
  gh.lazySingleton<_i302.VerifyOtpUsecase>(
      () => _i302.VerifyOtpUsecase(gh<_i281.LoginRepo>()));
  gh.factory<_i303.ClientsTransferApprovalsCubit>(() =>
      _i303.ClientsTransferApprovalsCubit(
          gh<_i269.GetClientsTransferApprovalsUsecase>()));
  gh.singleton<_i304.RegionsCubit>(
      () => _i304.RegionsCubit(gh<_i292.GetRegionsUseCase>()));
  gh.factory<_i305.GeneralCofigsCubit>(() => _i305.GeneralCofigsCubit(
        gh<_i262.GetGeneralConfigsUsecase>(),
        gh<_i261.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i306.GetPeriodicCommunicationUseCase>(() =>
      _i306.GetPeriodicCommunicationUseCase(
          gh<_i184.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i307.GetClientsDebtsUsecase>(
      () => _i307.GetClientsDebtsUsecase(gh<_i182.ClientsDebtsRepo>()));
  gh.lazySingleton<_i308.CrudClientSupportFilesUsecase>(() =>
      _i308.CrudClientSupportFilesUsecase(
          repository: gh<_i202.ClientsListRepository>()));
  gh.lazySingleton<_i309.GetClientSupportFilesUsecase>(() =>
      _i309.GetClientSupportFilesUsecase(
          repository: gh<_i202.ClientsListRepository>()));
  gh.factory<_i310.BranchesCubit>(
      () => _i310.BranchesCubit(gh<_i168.GetBranchesByIdCountryUseCase>()));
  gh.lazySingleton<_i311.AddAgentCommentUsecase>(() =>
      _i311.AddAgentCommentUsecase(gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i312.DoneTrainingUsecase>(() =>
      _i312.DoneTrainingUsecase(gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i313.GetAgentUsecase>(
      () => _i313.GetAgentUsecase(gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i314.GetAgentClientListUsecase>(() =>
      _i314.GetAgentClientListUsecase(
          gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i315.GetAgentCommentsListUsecase>(() =>
      _i315.GetAgentCommentsListUsecase(
          gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i316.GetAgentDatesListUsecase>(() =>
      _i316.GetAgentDatesListUsecase(
          gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i317.GetAgentInvoiceListUsecase>(() =>
      _i317.GetAgentInvoiceListUsecase(
          gh<_i172.AgentsDistributorsProfileRepo>()));
  gh.factory<_i318.AddRejectReasonsUsecase>(() =>
      _i318.AddRejectReasonsUsecase(gh<_i195.ManageWithdrawalsRepository>()));
  gh.factory<_i319.EditRejectReasonsUsecase>(() =>
      _i319.EditRejectReasonsUsecase(gh<_i195.ManageWithdrawalsRepository>()));
  gh.factory<_i320.GetRejectReasonsUsecase>(() =>
      _i320.GetRejectReasonsUsecase(gh<_i195.ManageWithdrawalsRepository>()));
  gh.factory<_i321.GetUserSeriesUsecase>(() =>
      _i321.GetUserSeriesUsecase(gh<_i195.ManageWithdrawalsRepository>()));
  gh.factory<_i322.GetWithdrawnDetailsUsecase>(() =>
      _i322.GetWithdrawnDetailsUsecase(
          gh<_i195.ManageWithdrawalsRepository>()));
  gh.factory<_i323.SetApproveSeriesUsecase>(() =>
      _i323.SetApproveSeriesUsecase(gh<_i195.ManageWithdrawalsRepository>()));
  gh.factory<_i324.UpdateSeriesUsecase>(
      () => _i324.UpdateSeriesUsecase(gh<_i195.ManageWithdrawalsRepository>()));
  gh.singleton<_i325.AppManagerCubit>(
      () => _i325.AppManagerCubit(gh<_i257.GetVersionUseCase>()));
  gh.lazySingleton<_i326.GetWaitingAgentsUsecase>(
      () => _i326.GetWaitingAgentsUsecase(gh<_i222.WaitingAgentsRepo>()));
  gh.factory<_i327.ProductsSalesReportsCubit>(() =>
      _i327.ProductsSalesReportsCubit(
          gh<_i199.GetProductsSalesReportsUsecase>()));
  gh.factory<_i328.UsersCubit>(() => _i328.UsersCubit(
        gh<_i191.GetUsersUsecase>(),
        gh<_i83.ActionUserUsecase>(),
        gh<_i248.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i190.GetManagesForUserUsecase>(),
        gh<_i189.GetLevelsForUserUsecase>(),
        gh<_i188.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i329.PreviousRatingsCubit>(
      () => _i329.PreviousRatingsCubit(gh<_i221.GetPreviousRatingsUsecase>()));
  gh.factory<_i330.AgentsDistributorsCubit>(() => _i330.AgentsDistributorsCubit(
        gh<_i239.GetAgentsAndDistributorsUseCase>(),
        gh<_i238.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i331.ExceededClientsCubit>(() => _i331.ExceededClientsCubit(
        gh<_i249.ExceededClientsUseCase>(),
        gh<_i250.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i332.ManageWithdrawalsCubit>(() => _i332.ManageWithdrawalsCubit(
        gh<_i321.GetUserSeriesUsecase>(),
        gh<_i324.UpdateSeriesUsecase>(),
        gh<_i191.GetUsersUsecase>(),
        gh<_i243.GetWithdrawalsInvoicesUsecase>(),
        gh<_i244.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i323.SetApproveSeriesUsecase>(),
        gh<_i322.GetWithdrawnDetailsUsecase>(),
        gh<_i318.AddRejectReasonsUsecase>(),
        gh<_i320.GetRejectReasonsUsecase>(),
        gh<_i319.EditRejectReasonsUsecase>(),
        gh<_i242.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i241.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i333.LatestClientsUpdatesCubit>(() =>
      _i333.LatestClientsUpdatesCubit(gh<_i294.GetLatestClientsUseCase>()));
  gh.factory<_i334.AttachmentsRowCubit>(() => _i334.AttachmentsRowCubit(
        gh<_i309.GetClientSupportFilesUsecase>(),
        gh<_i308.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i335.CancelScheduleUsecase>(
      () => _i335.CancelScheduleUsecase(gh<_i255.DatesTableRepo>()));
  gh.lazySingleton<_i336.ChangeDateToDonUsecase>(
      () => _i336.ChangeDateToDonUsecase(gh<_i255.DatesTableRepo>()));
  gh.lazySingleton<_i337.GetCancelReasonsUsecase>(
      () => _i337.GetCancelReasonsUsecase(gh<_i255.DatesTableRepo>()));
  gh.lazySingleton<_i338.GetDateInstallationUsecase>(
      () => _i338.GetDateInstallationUsecase(gh<_i255.DatesTableRepo>()));
  gh.lazySingleton<_i339.GetInvoicesByClientForDateUsecase>(() =>
      _i339.GetInvoicesByClientForDateUsecase(gh<_i255.DatesTableRepo>()));
  gh.lazySingleton<_i340.GetSubscribedClientsUsecase>(
      () => _i340.GetSubscribedClientsUsecase(gh<_i255.DatesTableRepo>()));
  gh.lazySingleton<_i341.RescheduleDateUsecase>(
      () => _i341.RescheduleDateUsecase(gh<_i255.DatesTableRepo>()));
  gh.lazySingleton<_i342.ReturnScheduleVisitToOpenUsecase>(
      () => _i342.ReturnScheduleVisitToOpenUsecase(gh<_i255.DatesTableRepo>()));
  gh.factory<_i343.AgentsDistributorsProfileBloc>(
      () => _i343.AgentsDistributorsProfileBloc(
            gh<_i314.GetAgentClientListUsecase>(),
            gh<_i317.GetAgentInvoiceListUsecase>(),
            gh<_i207.GetInvoiceByIdUsecase>(),
            gh<_i315.GetAgentCommentsListUsecase>(),
            gh<_i311.AddAgentCommentUsecase>(),
            gh<_i312.DoneTrainingUsecase>(),
            gh<_i274.AddAgentDateUseCase>(),
            gh<_i316.GetAgentDatesListUsecase>(),
            gh<_i268.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i344.ClientsListBloc>(() => _i344.ClientsListBloc(
        gh<_i230.GetClientsWithFilterUserUsecase>(),
        gh<_i232.GetRecommendedClientsUsecase>(),
        gh<_i224.AddClientUserUsecase>(),
        gh<_i227.EditClientUserUsecase>(),
        gh<_i226.ChangeTypeClientUsecase>(),
        gh<_i233.GetSimilarClientsUsecase>(),
        gh<_i225.ApproveRejectClientUsecase>(),
        gh<_i308.CrudClientSupportFilesUsecase>(),
        gh<_i309.GetClientSupportFilesUsecase>(),
        gh<_i235.TransferClientUserUsecase>(),
        gh<_i234.ReceiveClientUserUsecase>(),
        gh<_i231.GetClientMarketingReportUsecase>(),
        gh<_i236.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i345.CompanyCubit>(() => _i345.CompanyCubit(
        gh<_i289.GetCommentUsecase>(),
        gh<_i288.AddCommentUsecase>(),
      ));
  gh.factory<_i346.ClientsDebtsCubit>(
      () => _i346.ClientsDebtsCubit(gh<_i307.GetClientsDebtsUsecase>()));
  gh.factory<_i347.PeriodicCommunicationCubit>(() =>
      _i347.PeriodicCommunicationCubit(
          gh<_i306.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i348.LoginCubit>(() => _i348.LoginCubit(
        gh<_i300.LoginUsecase>(),
        gh<_i302.VerifyOtpUsecase>(),
        gh<_i298.CacheTokenUsecase>(),
        gh<_i299.GetTokenUsecase>(),
        gh<_i301.ValidateTokenUsecase>(),
      ));
  gh.factory<_i349.DatesTableCubit>(() => _i349.DatesTableCubit(
        gh<_i338.GetDateInstallationUsecase>(),
        gh<_i341.RescheduleDateUsecase>(),
        gh<_i336.ChangeDateToDonUsecase>(),
        gh<_i335.CancelScheduleUsecase>(),
        gh<_i342.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i340.GetSubscribedClientsUsecase>(),
        gh<_i339.GetInvoicesByClientForDateUsecase>(),
        gh<_i174.AddDateInstallUsecase>(),
        gh<_i337.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i350.WaitingAgentsCubit>(
      () => _i350.WaitingAgentsCubit(gh<_i326.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i351.AppModule {}
