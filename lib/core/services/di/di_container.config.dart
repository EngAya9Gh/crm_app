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
    as _i145;
import '../../../features/app/domain/repositories/app_repository.dart' as _i144;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i255;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i319;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i249;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i107;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i278;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i277;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i294;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i295;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i296;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i297;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i298;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i343;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i26;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i37;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i36;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i158;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i238;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i23;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i79;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i78;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i95;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i151;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i43;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i59;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i58;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i100;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i101;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i102;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i104;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i103;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i105;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i256;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i125;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i106;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i41;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i40;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i83;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i212;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i15;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i134;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i133;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i214;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i287;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i42;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i139;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i138;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i167;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i262;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i31;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i181;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i180;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i301;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i342;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i28;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i34;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i33;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i164;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i261;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i22;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i91;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i90;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i219;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i324;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i49;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i120;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i119;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i156;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i283;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i56;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i98;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i97;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i99;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i196;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i92;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i153;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i152;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i170;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i171;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i172;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i173;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i174;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i175;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i176;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i270;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i130;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i198;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i197;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i288;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i320;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i55;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i70;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i69;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i93;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i199;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i57;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i111;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i110;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i250;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i251;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i291;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i73;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i160;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i159;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i259;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i260;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i300;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i50;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i141;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i140;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i279;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i280;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i281;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i282;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i289;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i45;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i72;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i71;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i82;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i184;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i185;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i186;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i187;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i323;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i35;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i192;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i191;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i312;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i239;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i313;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i240;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i314;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i315;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i242;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i241;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i316;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i317;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i318;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i327;
import '../../../features/notifications/data/data_sources/notifications_datasource.dart'
    as _i13;
import '../../../features/notifications/data/repositories/notifications_repo_impl.dart'
    as _i25;
import '../../../features/notifications/domain/repositories/notifications_repo.dart'
    as _i24;
import '../../../features/notifications/domain/use_cases/get_notifications_usecase.dart'
    as _i161;
import '../../../features/notifications/domain/use_cases/get_unread_notifications_count_usecase.dart'
    as _i163;
import '../../../features/notifications/domain/use_cases/mark_notifications_as_read_usecase.dart'
    as _i162;
import '../../../features/notifications/presentation/manager/notifications_cubit.dart'
    as _i273;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i38;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i179;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i178;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i302;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i341;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i51;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i201;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i200;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i222;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i223;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i224;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i303;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i225;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i229;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i304;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i226;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i227;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i228;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i234;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i230;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i231;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i232;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i233;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i339;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i46;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i216;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i215;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i267;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i299;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i39;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i75;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i74;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i121;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i148;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i114;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i258;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i257;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i290;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i328;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i77;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i76;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i94;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i211;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i52;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i166;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i165;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i284;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i285;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i340;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i47;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i81;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i80;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i247;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i248;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i326;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i96;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i116;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i115;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i177;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i157;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i276;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i16;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i88;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i124;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i147;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i169;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i194;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i146;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i168;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i193;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i305;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i272;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i263;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i236;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i266;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i306;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i307;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i308;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i309;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i310;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i311;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i237;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i264;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i275;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i338;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i325;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i53;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i155;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i154;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i188;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i217;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i30;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i113;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i112;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i202;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i203;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i210;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i204;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i205;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i206;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i207;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i208;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i209;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i293;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i21;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i63;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i62;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i132;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i271;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i27;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i127;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i126;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i218;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i268;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i32;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i109;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i108;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i213;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i235;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i14;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i123;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i122;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i195;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i322;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i20;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i61;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i60;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i150;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i274;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i19;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i85;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i84;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i89;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i252;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i128;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i254;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i253;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i330;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i331;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i332;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i333;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i334;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i335;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i336;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i337;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i344;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i67;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i66;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i129;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i149;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i29;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i143;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i142;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i265;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i286;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i65;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i64;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i68;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i117;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i44;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i183;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i182;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i190;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i292;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i118;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i221;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i220;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i321;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i345;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i54;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i87;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i86;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i243;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i244;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i245;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i246;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i269;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i329;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i135;
import '../cache_services/prefs_consumer.dart' as _i137;
import '../cache_services/secure_storage_consumer.dart' as _i136;
import '../maps/location_services.dart' as _i131;
import 'di_container.dart' as _i346;

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
  gh.lazySingleton<_i78.ClientsCareReportsRepo>(() =>
      _i79.ClientsCareReportsRepoImpl(gh<_i23.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i80.ExceededClientsRepo>(
      () => _i81.ExceededClientsRepoImpl(gh<_i47.ExceededClientsDatasource>()));
  gh.factory<_i82.ActionUserUsecase>(
      () => _i82.ActionUserUsecase(gh<_i71.UsersRepository>()));
  gh.lazySingleton<_i83.GetEvaluationLevelReportUsecase>(() =>
      _i83.GetEvaluationLevelReportUsecase(
          gh<_i40.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i84.ClientsInstallReportsRepo>(() =>
      _i85.ClientsInstallReportsRepoImpl(
          gh<_i19.ClientsInstallReportsDatasource>()));
  gh.factory<_i86.TaskRepository>(
      () => _i87.TaskRepositoryImpl(gh<_i54.TaskDatasource>()));
  gh.lazySingleton<_i88.AgentsDistributorsDataSource>(
      () => _i88.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i89.GetClientsInstallReportsUsecase>(() =>
      _i89.GetClientsInstallReportsUsecase(
          gh<_i84.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i90.PreviousRatingsRepo>(
      () => _i91.PreviousRatingsRepoImpl(gh<_i22.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i92.SupportTabDataSource>(
      () => _i92.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i93.GetUsersUsecase>(
      () => _i93.GetUsersUsecase(gh<_i69.UsersRepository>()));
  gh.lazySingleton<_i94.GetPendingInvoicesUsecase>(
      () => _i94.GetPendingInvoicesUsecase(gh<_i76.PendingInvoicesRepo>()));
  gh.lazySingleton<_i95.GetClientsCareReportsUsecase>(() =>
      _i95.GetClientsCareReportsUsecase(gh<_i78.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i96.InvoicesTabDataSource>(
      () => _i96.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i97.CitiesRepository>(
      () => _i98.CitiesRepositoryImpl(gh<_i56.CitiesDatasource>()));
  gh.lazySingleton<_i99.GetCitiesUseCase>(
      () => _i99.GetCitiesUseCase(gh<_i97.CitiesRepository>()));
  gh.lazySingleton<_i100.AddTicketUseCase>(
      () => _i100.AddTicketUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i101.EditTicketTypeUseCase>(
      () => _i101.EditTicketTypeUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i102.GetClientTicketsUseCase>(
      () => _i102.GetClientTicketsUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i103.GetTicketsUseCase>(
      () => _i103.GetTicketsUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i104.GetTicketByIdUseCase>(
      () => _i104.GetTicketByIdUseCase(gh<_i58.TicketsRepo>()));
  gh.lazySingleton<_i105.TransferTicketUseCase>(
      () => _i105.TransferTicketUseCase(gh<_i58.TicketsRepo>()));
  gh.factory<_i106.TicketsCubit>(() => _i106.TicketsCubit(
        gh<_i103.GetTicketsUseCase>(),
        gh<_i104.GetTicketByIdUseCase>(),
        gh<_i102.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i107.LoginRemoteDataSource>(
      () => _i107.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i108.EmployeesSalesReportsRepo>(() =>
      _i109.EmployeesSalesReportsRepoImpl(
          gh<_i32.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i110.AdvancedConfigsRepository>(() =>
      _i111.AdvancedConfigsRepositoryImpl(
          gh<_i57.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i112.ParticipateListRepository>(() =>
      _i113.ParticipateListRepositoryImpl(
          gh<_i30.ParticipatesListDatasource>()));
  gh.lazySingleton<_i114.LatestClientsUpdatesDatasource>(
      () => _i114.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i115.InvoicesSectionRepo>(
      () => _i116.InvoicesTabRepoImpl(gh<_i96.InvoicesTabDataSource>()));
  gh.factory<_i117.SupportClientsAcceptCubit>(() =>
      _i117.SupportClientsAcceptCubit(
          gh<_i68.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i118.WaitingAgentsDataSource>(
      () => _i118.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i119.SpecialClientsRepository>(() =>
      _i120.SpecialClientsRepositoryImpl(gh<_i49.SpecialClientsDatasource>()));
  gh.lazySingleton<_i121.GetFinancePendingInvoicesUsecase>(() =>
      _i121.GetFinancePendingInvoicesUsecase(gh<_i74.FinancePendingRepo>()));
  gh.lazySingleton<_i122.ProductsSalesReportsRepo>(() =>
      _i123.ProductsSalesReportsRepoImpl(
          gh<_i14.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i124.AgentsDistributorsProfileDataSource>(() =>
      _i124.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i125.EditTicketCubit>(() => _i125.EditTicketCubit(
        gh<_i101.EditTicketTypeUseCase>(),
        gh<_i105.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i126.ClientsStatusReportsRepo>(() =>
      _i127.ClientsStatusReportsRepoImpl(
          gh<_i27.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i128.DatesTableDataSource>(
      () => _i128.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i129.GetDelayAfterInstallUseCase>(() =>
      _i129.GetDelayAfterInstallUseCase(gh<_i66.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i130.RegionsDatasource>(
      () => _i130.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i131.LocationServices>(
      () => _i131.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i132.GetClientsDebtsReportsUsecase>(() =>
      _i132.GetClientsDebtsReportsUsecase(gh<_i62.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i133.GreetingCommunicationRepo>(() =>
      _i134.GreetingCommunicationRepoImpl(
          gh<_i15.GreetingCommunicationDatasource>()));
  gh.singleton<_i135.CacheServices>(
    () => _i136.SecureStorageConsumer(gh<_i18.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i135.CacheServices>(() async =>
      _i137.PrefsConsumer(await gh.getAsync<_i17.SharedPreferences>()));
  gh.lazySingleton<_i138.InstallQualityRepo>(
      () => _i139.InstallQualityRepoImpl(gh<_i42.InstallQualityDatasource>()));
  gh.factory<_i140.PrivilegeRepository>(
      () => _i141.PrivilegeRepositoryImpl(gh<_i50.PrivilegeDatasource>()));
  gh.lazySingleton<_i142.DelayInstallReportsRepo>(() =>
      _i143.DelayInstallReportsRepoImpl(
          gh<_i29.DelayInstallReportsDatasource>()));
  gh.factory<_i144.AppRepository>(
      () => _i145.AppRepositoryImpl(gh<_i48.AppDatasource>()));
  gh.lazySingleton<_i146.AgentsDistributorsActionsRepo>(() =>
      _i147.AgentsDistributorsActionsRepoImpl(
          gh<_i16.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i148.FinancePendingCubit>(() =>
      _i148.FinancePendingCubit(gh<_i121.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i149.DelayAfterInstallCubit>(() =>
      _i149.DelayAfterInstallCubit(gh<_i129.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i150.GetRegionsSalesReportsUsecase>(() =>
      _i150.GetRegionsSalesReportsUsecase(gh<_i60.RegionsSalesReportsRepo>()));
  gh.factory<_i151.ClientsCareReportsCubit>(() =>
      _i151.ClientsCareReportsCubit(gh<_i95.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i152.SupportTabRepo>(
      () => _i153.SupportTabRepoImpl(gh<_i92.SupportTabDataSource>()));
  gh.factory<_i154.LinksImportantRepository>(
      () => _i155.LinkRepositoryImpl(gh<_i53.LinkDatasource>()));
  gh.factory<_i156.GetSpecialClientsUsecase>(() =>
      _i156.GetSpecialClientsUsecase(gh<_i119.SpecialClientsRepository>()));
  gh.lazySingleton<_i157.GetInvoicesByPrivilegesUsecase>(() =>
      _i157.GetInvoicesByPrivilegesUsecase(gh<_i115.InvoicesSectionRepo>()));
  gh.lazySingleton<_i158.GetClientsAcceptUseCase>(
      () => _i158.GetClientsAcceptUseCase(gh<_i36.ClientsAcceptRepository>()));
  gh.lazySingleton<_i159.GeneralConfigsRepository>(() =>
      _i160.GeneralConfigsRepositoryImpl(gh<_i73.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i161.GetNotificationsUsecase>(
      () => _i161.GetNotificationsUsecase(gh<_i24.NotificationsRepo>()));
  gh.lazySingleton<_i162.MarkNotificationsAsReadUsecase>(
      () => _i162.MarkNotificationsAsReadUsecase(gh<_i24.NotificationsRepo>()));
  gh.lazySingleton<_i163.GetUnreadNotificationsCountUsecase>(() =>
      _i163.GetUnreadNotificationsCountUsecase(gh<_i24.NotificationsRepo>()));
  gh.lazySingleton<_i164.GetPeriodicCommunicationReportsUsecase>(() =>
      _i164.GetPeriodicCommunicationReportsUsecase(
          gh<_i33.PeriodicCommunicationReportsRepo>()));
  gh.factory<_i165.CompanyRepository>(
      () => _i166.CompanyRepositoryImpl(gh<_i52.CommentCompanyDatasource>()));
  gh.lazySingleton<_i167.GetInstallUseCase>(
      () => _i167.GetInstallUseCase(gh<_i138.InstallQualityRepo>()));
  gh.lazySingleton<_i168.AgentsDistributorsProfileRepo>(() =>
      _i169.AgentsDistributorsProfileRepoImpl(
          gh<_i124.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i170.AddDateInstallUsecase>(
      () => _i170.AddDateInstallUsecase(gh<_i152.SupportTabRepo>()));
  gh.lazySingleton<_i171.CancelDateInstallUsecase>(
      () => _i171.CancelDateInstallUsecase(gh<_i152.SupportTabRepo>()));
  gh.lazySingleton<_i172.GetInvoiceByClientUsecase>(
      () => _i172.GetInvoiceByClientUsecase(gh<_i152.SupportTabRepo>()));
  gh.lazySingleton<_i173.ReceiveDeviceUsecase>(
      () => _i173.ReceiveDeviceUsecase(gh<_i152.SupportTabRepo>()));
  gh.lazySingleton<_i174.ReturnInvoiceApproveUsecase>(
      () => _i174.ReturnInvoiceApproveUsecase(gh<_i152.SupportTabRepo>()));
  gh.lazySingleton<_i175.SetDateDoneUsecase>(
      () => _i175.SetDateDoneUsecase(gh<_i152.SupportTabRepo>()));
  gh.lazySingleton<_i176.SetReadyInstallUsecase>(
      () => _i176.SetReadyInstallUsecase(gh<_i152.SupportTabRepo>()));
  gh.lazySingleton<_i177.GetAllUsersUseCase>(
      () => _i177.GetAllUsersUseCase(gh<_i115.InvoicesSectionRepo>()));
  gh.lazySingleton<_i178.ClientsDebtsRepo>(
      () => _i179.ClientsDebtsRepoImpl(gh<_i38.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i180.PeriodicCommunicationRepo>(() =>
      _i181.PeriodicCommunicationRepoImpl(
          gh<_i31.PeriodicCommunicationDatasource>()));
  gh.lazySingleton<_i182.SupportClientsInvoicesRepo>(() =>
      _i183.SupportClientsInvoicesRepoImpl(
          gh<_i44.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i184.GetBranchesForUserUsecase>(
      () => _i184.GetBranchesForUserUsecase(gh<_i71.UsersRepository>()));
  gh.lazySingleton<_i185.GetLevelsForUserUsecase>(
      () => _i185.GetLevelsForUserUsecase(gh<_i71.UsersRepository>()));
  gh.lazySingleton<_i186.GetManagesForUserUsecase>(
      () => _i186.GetManagesForUserUsecase(gh<_i71.UsersRepository>()));
  gh.factory<_i187.GetUsersUsecase>(
      () => _i187.GetUsersUsecase(gh<_i71.UsersRepository>()));
  gh.factory<_i188.ActionLinkUsecase>(
      () => _i188.ActionLinkUsecase(gh<_i154.LinksImportantRepository>()));
  gh.factory<_i189.GetLinkUsecase>(
      () => _i189.GetLinkUsecase(gh<_i154.LinksImportantRepository>()));
  gh.lazySingleton<_i190.GetSupportClientsInvoicesUseCase>(() =>
      _i190.GetSupportClientsInvoicesUseCase(
          gh<_i182.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i191.ManageWithdrawalsRepository>(() =>
      _i192.ManageWithdrawalsRepositoryImpl(
          gh<_i35.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i193.AgentsDistributorsRepo>(() =>
      _i194.AgentsDistributorsRepoImpl(
          gh<_i88.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i195.GetProductsSalesReportsUsecase>(() =>
      _i195.GetProductsSalesReportsUsecase(
          gh<_i122.ProductsSalesReportsRepo>()));
  gh.singleton<_i196.CitiesCubit>(
      () => _i196.CitiesCubit(gh<_i99.GetCitiesUseCase>()));
  gh.lazySingleton<_i197.RegionsRepository>(
      () => _i198.RegionsRepositoryImpl(gh<_i130.RegionsDatasource>()));
  gh.factory<_i199.UsersTypeCubit>(
      () => _i199.UsersTypeCubit(gh<_i93.GetUsersUsecase>()));
  gh.factory<_i200.ClientsListRepository>(
      () => _i201.ClientsListRepositoryImpl(gh<_i51.ClientsListDatasource>()));
  gh.factory<_i202.AddParticipateCommentUsecase>(() =>
      _i202.AddParticipateCommentUsecase(
          gh<_i112.ParticipateListRepository>()));
  gh.factory<_i203.AddParticipateUserUsecase>(() =>
      _i203.AddParticipateUserUsecase(gh<_i112.ParticipateListRepository>()));
  gh.factory<_i204.EditParticipateUserUsecase>(() =>
      _i204.EditParticipateUserUsecase(gh<_i112.ParticipateListRepository>()));
  gh.factory<_i205.GetInvoiceByIdUsecase>(
      () => _i205.GetInvoiceByIdUsecase(gh<_i112.ParticipateListRepository>()));
  gh.factory<_i206.ParticipateClientListUsecase>(() =>
      _i206.ParticipateClientListUsecase(
          gh<_i112.ParticipateListRepository>()));
  gh.factory<_i207.ParticipateCommentListUsecase>(() =>
      _i207.ParticipateCommentListUsecase(
          gh<_i112.ParticipateListRepository>()));
  gh.factory<_i208.ParticipateInvoiceListUsecase>(() =>
      _i208.ParticipateInvoiceListUsecase(
          gh<_i112.ParticipateListRepository>()));
  gh.factory<_i209.ParticipateListUsecase>(() =>
      _i209.ParticipateListUsecase(gh<_i112.ParticipateListRepository>()));
  gh.lazySingleton<_i210.ChangeParticipateStatusUsecase>(() =>
      _i210.ChangeParticipateStatusUsecase(
          gh<_i112.ParticipateListRepository>()));
  gh.factory<_i211.PendingInvoicesCubit>(
      () => _i211.PendingInvoicesCubit(gh<_i94.GetPendingInvoicesUsecase>()));
  gh.factory<_i212.EvaluationLevelReportCubit>(() =>
      _i212.EvaluationLevelReportCubit(
          gh<_i83.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i213.GetEmployeesSalesReportsUsecase>(() =>
      _i213.GetEmployeesSalesReportsUsecase(
          gh<_i108.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i214.GetGreetingCommunicationUseCase>(() =>
      _i214.GetGreetingCommunicationUseCase(
          gh<_i133.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i215.ClientsTransferApprovalsRepo>(() =>
      _i216.ClientsTransferApprovalsRepoImpl(
          gh<_i46.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i217.LinkCubit>(() => _i217.LinkCubit(
        gh<_i189.GetLinkUsecase>(),
        gh<_i188.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i218.GetClientsStatusReportsUsecase>(() =>
      _i218.GetClientsStatusReportsUsecase(
          gh<_i126.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i219.GetPreviousRatingsUsecase>(
      () => _i219.GetPreviousRatingsUsecase(gh<_i90.PreviousRatingsRepo>()));
  gh.lazySingleton<_i220.WaitingAgentsRepo>(
      () => _i221.WaitingAgentsRepoImpl(gh<_i118.WaitingAgentsDataSource>()));
  gh.factory<_i222.AddClientUserUsecase>(
      () => _i222.AddClientUserUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i223.ApproveRejectClientUsecase>(() =>
      _i223.ApproveRejectClientUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i224.ChangeTypeClientUsecase>(
      () => _i224.ChangeTypeClientUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i225.EditClientUserUsecase>(
      () => _i225.EditClientUserUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i226.GetClientsListByRegionUseCase>(() =>
      _i226.GetClientsListByRegionUseCase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i227.GetClientsListByUserUseCase>(() =>
      _i227.GetClientsListByUserUseCase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i228.GetClientsWithFilterUserUsecase>(() =>
      _i228.GetClientsWithFilterUserUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i229.GetClientMarketingReportUsecase>(() =>
      _i229.GetClientMarketingReportUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i230.GetRecommendedClientsUsecase>(() =>
      _i230.GetRecommendedClientsUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i231.GetSimilarClientsUsecase>(
      () => _i231.GetSimilarClientsUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i232.ReceiveClientUserUsecase>(
      () => _i232.ReceiveClientUserUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i233.TransferClientUserUsecase>(
      () => _i233.TransferClientUserUsecase(gh<_i200.ClientsListRepository>()));
  gh.lazySingleton<_i234.GetHighSimilarClientsUsecase>(() =>
      _i234.GetHighSimilarClientsUsecase(gh<_i200.ClientsListRepository>()));
  gh.factory<_i235.EmployeesSalesReportsCubit>(() =>
      _i235.EmployeesSalesReportsCubit(
          gh<_i213.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i236.ChangeStateAgentUseCase>(
      () => _i236.ChangeStateAgentUseCase(gh<_i193.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i237.GetAgentsAndDistributorsUseCase>(() =>
      _i237.GetAgentsAndDistributorsUseCase(
          gh<_i193.AgentsDistributorsRepo>()));
  gh.factory<_i238.ClientsAcceptCubit>(
      () => _i238.ClientsAcceptCubit(gh<_i158.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i239.CancelWithdrawalUsecase>(() =>
      _i239.CancelWithdrawalUsecase(gh<_i191.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i240.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i240.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i191.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i241.GetWithdrawalsInvoicesUsecase>(() =>
      _i241.GetWithdrawalsInvoicesUsecase(
          gh<_i191.ManageWithdrawalsRepository>()));
  gh.factory<_i242.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i242.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i191.ManageWithdrawalsRepository>()));
  gh.factory<_i243.AddTaskUsecase>(
      () => _i243.AddTaskUsecase(gh<_i86.TaskRepository>()));
  gh.factory<_i244.ChangeStatusTaskUsecase>(
      () => _i244.ChangeStatusTaskUsecase(gh<_i86.TaskRepository>()));
  gh.factory<_i245.FilterTaskUsecase>(
      () => _i245.FilterTaskUsecase(gh<_i86.TaskRepository>()));
  gh.factory<_i246.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i246.GetUsersByDepartmentAndRegionUsecase(gh<_i86.TaskRepository>()));
  gh.lazySingleton<_i247.ExceededClientsUseCase>(
      () => _i247.ExceededClientsUseCase(gh<_i80.ExceededClientsRepo>()));
  gh.lazySingleton<_i248.TransferExceededClientsUseCase>(() =>
      _i248.TransferExceededClientsUseCase(gh<_i80.ExceededClientsRepo>()));
  gh.lazySingleton<_i249.LoginLocalDataSource>(() =>
      _i249.LoginLocalDataSourceImpl(
          gh<_i135.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i250.EditAdvancedConfigsUsecase>(() =>
      _i250.EditAdvancedConfigsUsecase(gh<_i110.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i251.GetAdvancedConfigsUsecase>(() =>
      _i251.GetAdvancedConfigsUsecase(gh<_i110.AdvancedConfigsRepository>()));
  gh.factory<_i252.ClientsInstallReportsCubit>(() =>
      _i252.ClientsInstallReportsCubit(
          gh<_i89.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i253.DatesTableRepo>(
      () => _i254.DatesTableRepoImpl(gh<_i128.DatesTableDataSource>()));
  gh.factory<_i255.GetVersionUseCase>(
      () => _i255.GetVersionUseCase(gh<_i144.AppRepository>()));
  gh.factory<_i256.AddTicketCubit>(
      () => _i256.AddTicketCubit(gh<_i100.AddTicketUseCase>()));
  gh.lazySingleton<_i257.LatestClientsUpdatesRepository>(() =>
      _i258.LatestClientsUpdatesRepositoryImpl(
          gh<_i114.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i259.EditGeneralConfigsUsecase>(() =>
      _i259.EditGeneralConfigsUsecase(gh<_i159.GeneralConfigsRepository>()));
  gh.lazySingleton<_i260.GetGeneralConfigsUsecase>(() =>
      _i260.GetGeneralConfigsUsecase(gh<_i159.GeneralConfigsRepository>()));
  gh.factory<_i261.PeriodicCommunicationReportsCubit>(() =>
      _i261.PeriodicCommunicationReportsCubit(
          gh<_i164.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i262.InstallQualityCubit>(
      () => _i262.InstallQualityCubit(gh<_i167.GetInstallUseCase>()));
  gh.lazySingleton<_i263.AddAgentUseCase>(
      () => _i263.AddAgentUseCase(gh<_i146.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i264.UpdateAgentUseCase>(() =>
      _i264.UpdateAgentUseCase(gh<_i146.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i265.GetDelayInstallReportsUseCase>(() =>
      _i265.GetDelayInstallReportsUseCase(gh<_i142.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i266.CrudAgentSupportFilesUsecase>(() =>
      _i266.CrudAgentSupportFilesUsecase(
          gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i267.GetClientsTransferApprovalsUsecase>(() =>
      _i267.GetClientsTransferApprovalsUsecase(
          gh<_i215.ClientsTransferApprovalsRepo>()));
  gh.factory<_i268.ClientsStatusReportsCubit>(() =>
      _i268.ClientsStatusReportsCubit(
          gh<_i218.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i269.TaskCubit>(() => _i269.TaskCubit(
        gh<_i243.AddTaskUsecase>(),
        gh<_i245.FilterTaskUsecase>(),
        gh<_i244.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i270.SupportTabCubit>(() => _i270.SupportTabCubit(
        gh<_i172.GetInvoiceByClientUsecase>(),
        gh<_i170.AddDateInstallUsecase>(),
        gh<_i175.SetDateDoneUsecase>(),
        gh<_i176.SetReadyInstallUsecase>(),
        gh<_i174.ReturnInvoiceApproveUsecase>(),
        gh<_i173.ReceiveDeviceUsecase>(),
        gh<_i171.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i271.ClientsDebtsReportsCubit>(() =>
      _i271.ClientsDebtsReportsCubit(
          gh<_i132.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i272.AddAgentDateUseCase>(() =>
      _i272.AddAgentDateUseCase(gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.factory<_i273.NotificationsCubit>(() => _i273.NotificationsCubit(
        gh<_i161.GetNotificationsUsecase>(),
        gh<_i162.MarkNotificationsAsReadUsecase>(),
        gh<_i163.GetUnreadNotificationsCountUsecase>(),
      ));
  gh.factory<_i274.RegionsSalesReportsCubit>(() =>
      _i274.RegionsSalesReportsCubit(
          gh<_i150.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i275.AgentsDistributorsActionsCubit>(
      () => _i275.AgentsDistributorsActionsCubit(
            gh<_i99.GetCitiesUseCase>(),
            gh<_i263.AddAgentUseCase>(),
            gh<_i264.UpdateAgentUseCase>(),
          ));
  gh.factory<_i276.InvoicesSectionCubit>(() => _i276.InvoicesSectionCubit(
        gh<_i157.GetInvoicesByPrivilegesUsecase>(),
        gh<_i237.GetAgentsAndDistributorsUseCase>(),
        gh<_i209.ParticipateListUsecase>(),
        gh<_i177.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i277.LoginRepo>(() => _i278.LoginRepoImpl(
        gh<_i107.LoginRemoteDataSource>(),
        gh<_i249.LoginLocalDataSource>(),
      ));
  gh.factory<_i279.AddLevelUsecase>(
      () => _i279.AddLevelUsecase(gh<_i140.PrivilegeRepository>()));
  gh.factory<_i280.GetLevelsUsecase>(
      () => _i280.GetLevelsUsecase(gh<_i140.PrivilegeRepository>()));
  gh.factory<_i281.GetPrivilegesUsecase>(
      () => _i281.GetPrivilegesUsecase(gh<_i140.PrivilegeRepository>()));
  gh.factory<_i282.UpdatePrivilegeUsecase>(
      () => _i282.UpdatePrivilegeUsecase(gh<_i140.PrivilegeRepository>()));
  gh.factory<_i283.SpecialClientsBloc>(
      () => _i283.SpecialClientsBloc(gh<_i156.GetSpecialClientsUsecase>()));
  gh.factory<_i284.AddCommentUsecase>(
      () => _i284.AddCommentUsecase(gh<_i165.CompanyRepository>()));
  gh.factory<_i285.GetCommentUsecase>(
      () => _i285.GetCommentUsecase(gh<_i165.CompanyRepository>()));
  gh.factory<_i286.DelayInstallReportsCubit>(() =>
      _i286.DelayInstallReportsCubit(
          gh<_i265.GetDelayInstallReportsUseCase>()));
  gh.factory<_i287.GreetingCommunicationCubit>(() =>
      _i287.GreetingCommunicationCubit(
          gh<_i214.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i288.GetRegionsByIdCountryUseCase>(
      () => _i288.GetRegionsByIdCountryUseCase(gh<_i197.RegionsRepository>()));
  gh.lazySingleton<_i289.PrivilegeCubit>(() => _i289.PrivilegeCubit(
        gh<_i280.GetLevelsUsecase>(),
        gh<_i281.GetPrivilegesUsecase>(),
        gh<_i282.UpdatePrivilegeUsecase>(),
        gh<_i279.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i290.GetLatestClientsUseCase>(() =>
      _i290.GetLatestClientsUseCase(
          gh<_i257.LatestClientsUpdatesRepository>()));
  gh.factory<_i291.AdvancedCofigsCubit>(() => _i291.AdvancedCofigsCubit(
        gh<_i251.GetAdvancedConfigsUsecase>(),
        gh<_i250.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i292.SupportClientsInvoicesCubit>(() =>
      _i292.SupportClientsInvoicesCubit(
          gh<_i190.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i293.ParticipateListBloc>(() => _i293.ParticipateListBloc(
        gh<_i209.ParticipateListUsecase>(),
        gh<_i203.AddParticipateUserUsecase>(),
        gh<_i204.EditParticipateUserUsecase>(),
        gh<_i206.ParticipateClientListUsecase>(),
        gh<_i208.ParticipateInvoiceListUsecase>(),
        gh<_i205.GetInvoiceByIdUsecase>(),
        gh<_i207.ParticipateCommentListUsecase>(),
        gh<_i202.AddParticipateCommentUsecase>(),
        gh<_i210.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i294.CacheTokenUsecase>(
      () => _i294.CacheTokenUsecase(gh<_i277.LoginRepo>()));
  gh.lazySingleton<_i295.GetTokenUsecase>(
      () => _i295.GetTokenUsecase(gh<_i277.LoginRepo>()));
  gh.lazySingleton<_i296.LoginUsecase>(
      () => _i296.LoginUsecase(gh<_i277.LoginRepo>()));
  gh.lazySingleton<_i297.ValidateTokenUsecase>(
      () => _i297.ValidateTokenUsecase(gh<_i277.LoginRepo>()));
  gh.lazySingleton<_i298.VerifyOtpUsecase>(
      () => _i298.VerifyOtpUsecase(gh<_i277.LoginRepo>()));
  gh.factory<_i299.ClientsTransferApprovalsCubit>(() =>
      _i299.ClientsTransferApprovalsCubit(
          gh<_i267.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i300.GeneralCofigsCubit>(() => _i300.GeneralCofigsCubit(
        gh<_i260.GetGeneralConfigsUsecase>(),
        gh<_i259.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i301.GetPeriodicCommunicationUseCase>(() =>
      _i301.GetPeriodicCommunicationUseCase(
          gh<_i180.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i302.GetClientsDebtsUsecase>(
      () => _i302.GetClientsDebtsUsecase(gh<_i178.ClientsDebtsRepo>()));
  gh.lazySingleton<_i303.CrudClientSupportFilesUsecase>(() =>
      _i303.CrudClientSupportFilesUsecase(
          repository: gh<_i200.ClientsListRepository>()));
  gh.lazySingleton<_i304.GetClientSupportFilesUsecase>(() =>
      _i304.GetClientSupportFilesUsecase(
          repository: gh<_i200.ClientsListRepository>()));
  gh.lazySingleton<_i305.AddAgentCommentUsecase>(() =>
      _i305.AddAgentCommentUsecase(gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i306.DoneTrainingUsecase>(() =>
      _i306.DoneTrainingUsecase(gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i307.GetAgentUsecase>(
      () => _i307.GetAgentUsecase(gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i308.GetAgentClientListUsecase>(() =>
      _i308.GetAgentClientListUsecase(
          gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i309.GetAgentCommentsListUsecase>(() =>
      _i309.GetAgentCommentsListUsecase(
          gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i310.GetAgentDatesListUsecase>(() =>
      _i310.GetAgentDatesListUsecase(
          gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i311.GetAgentInvoiceListUsecase>(() =>
      _i311.GetAgentInvoiceListUsecase(
          gh<_i168.AgentsDistributorsProfileRepo>()));
  gh.factory<_i312.AddRejectReasonsUsecase>(() =>
      _i312.AddRejectReasonsUsecase(gh<_i191.ManageWithdrawalsRepository>()));
  gh.factory<_i313.EditRejectReasonsUsecase>(() =>
      _i313.EditRejectReasonsUsecase(gh<_i191.ManageWithdrawalsRepository>()));
  gh.factory<_i314.GetRejectReasonsUsecase>(() =>
      _i314.GetRejectReasonsUsecase(gh<_i191.ManageWithdrawalsRepository>()));
  gh.factory<_i315.GetUserSeriesUsecase>(() =>
      _i315.GetUserSeriesUsecase(gh<_i191.ManageWithdrawalsRepository>()));
  gh.factory<_i316.GetWithdrawnDetailsUsecase>(() =>
      _i316.GetWithdrawnDetailsUsecase(
          gh<_i191.ManageWithdrawalsRepository>()));
  gh.factory<_i317.SetApproveSeriesUsecase>(() =>
      _i317.SetApproveSeriesUsecase(gh<_i191.ManageWithdrawalsRepository>()));
  gh.factory<_i318.UpdateSeriesUsecase>(
      () => _i318.UpdateSeriesUsecase(gh<_i191.ManageWithdrawalsRepository>()));
  gh.singleton<_i319.AppManagerCubit>(
      () => _i319.AppManagerCubit(gh<_i255.GetVersionUseCase>()));
  gh.factory<_i320.RegionsCubit>(
      () => _i320.RegionsCubit(gh<_i288.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i321.GetWaitingAgentsUsecase>(
      () => _i321.GetWaitingAgentsUsecase(gh<_i220.WaitingAgentsRepo>()));
  gh.factory<_i322.ProductsSalesReportsCubit>(() =>
      _i322.ProductsSalesReportsCubit(
          gh<_i195.GetProductsSalesReportsUsecase>()));
  gh.factory<_i323.UsersCubit>(() => _i323.UsersCubit(
        gh<_i187.GetUsersUsecase>(),
        gh<_i82.ActionUserUsecase>(),
        gh<_i246.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i186.GetManagesForUserUsecase>(),
        gh<_i185.GetLevelsForUserUsecase>(),
        gh<_i184.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i324.PreviousRatingsCubit>(
      () => _i324.PreviousRatingsCubit(gh<_i219.GetPreviousRatingsUsecase>()));
  gh.factory<_i325.AgentsDistributorsCubit>(() => _i325.AgentsDistributorsCubit(
        gh<_i237.GetAgentsAndDistributorsUseCase>(),
        gh<_i236.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i326.ExceededClientsCubit>(() => _i326.ExceededClientsCubit(
        gh<_i247.ExceededClientsUseCase>(),
        gh<_i248.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i327.ManageWithdrawalsCubit>(() => _i327.ManageWithdrawalsCubit(
        gh<_i315.GetUserSeriesUsecase>(),
        gh<_i318.UpdateSeriesUsecase>(),
        gh<_i187.GetUsersUsecase>(),
        gh<_i241.GetWithdrawalsInvoicesUsecase>(),
        gh<_i242.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i317.SetApproveSeriesUsecase>(),
        gh<_i316.GetWithdrawnDetailsUsecase>(),
        gh<_i312.AddRejectReasonsUsecase>(),
        gh<_i314.GetRejectReasonsUsecase>(),
        gh<_i313.EditRejectReasonsUsecase>(),
        gh<_i240.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i239.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i328.LatestClientsUpdatesCubit>(() =>
      _i328.LatestClientsUpdatesCubit(gh<_i290.GetLatestClientsUseCase>()));
  gh.factory<_i329.AttachmentsRowCubit>(() => _i329.AttachmentsRowCubit(
        gh<_i304.GetClientSupportFilesUsecase>(),
        gh<_i303.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i330.CancelScheduleUsecase>(
      () => _i330.CancelScheduleUsecase(gh<_i253.DatesTableRepo>()));
  gh.lazySingleton<_i331.ChangeDateToDonUsecase>(
      () => _i331.ChangeDateToDonUsecase(gh<_i253.DatesTableRepo>()));
  gh.lazySingleton<_i332.GetCancelReasonsUsecase>(
      () => _i332.GetCancelReasonsUsecase(gh<_i253.DatesTableRepo>()));
  gh.lazySingleton<_i333.GetDateInstallationUsecase>(
      () => _i333.GetDateInstallationUsecase(gh<_i253.DatesTableRepo>()));
  gh.lazySingleton<_i334.GetInvoicesByClientForDateUsecase>(() =>
      _i334.GetInvoicesByClientForDateUsecase(gh<_i253.DatesTableRepo>()));
  gh.lazySingleton<_i335.GetSubscribedClientsUsecase>(
      () => _i335.GetSubscribedClientsUsecase(gh<_i253.DatesTableRepo>()));
  gh.lazySingleton<_i336.RescheduleDateUsecase>(
      () => _i336.RescheduleDateUsecase(gh<_i253.DatesTableRepo>()));
  gh.lazySingleton<_i337.ReturnScheduleVisitToOpenUsecase>(
      () => _i337.ReturnScheduleVisitToOpenUsecase(gh<_i253.DatesTableRepo>()));
  gh.factory<_i338.AgentsDistributorsProfileBloc>(
      () => _i338.AgentsDistributorsProfileBloc(
            gh<_i308.GetAgentClientListUsecase>(),
            gh<_i311.GetAgentInvoiceListUsecase>(),
            gh<_i205.GetInvoiceByIdUsecase>(),
            gh<_i309.GetAgentCommentsListUsecase>(),
            gh<_i305.AddAgentCommentUsecase>(),
            gh<_i306.DoneTrainingUsecase>(),
            gh<_i272.AddAgentDateUseCase>(),
            gh<_i310.GetAgentDatesListUsecase>(),
            gh<_i266.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i339.ClientsListBloc>(() => _i339.ClientsListBloc(
        gh<_i228.GetClientsWithFilterUserUsecase>(),
        gh<_i230.GetRecommendedClientsUsecase>(),
        gh<_i222.AddClientUserUsecase>(),
        gh<_i225.EditClientUserUsecase>(),
        gh<_i224.ChangeTypeClientUsecase>(),
        gh<_i231.GetSimilarClientsUsecase>(),
        gh<_i223.ApproveRejectClientUsecase>(),
        gh<_i303.CrudClientSupportFilesUsecase>(),
        gh<_i304.GetClientSupportFilesUsecase>(),
        gh<_i233.TransferClientUserUsecase>(),
        gh<_i232.ReceiveClientUserUsecase>(),
        gh<_i229.GetClientMarketingReportUsecase>(),
        gh<_i234.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i340.CompanyCubit>(() => _i340.CompanyCubit(
        gh<_i285.GetCommentUsecase>(),
        gh<_i284.AddCommentUsecase>(),
      ));
  gh.factory<_i341.ClientsDebtsCubit>(
      () => _i341.ClientsDebtsCubit(gh<_i302.GetClientsDebtsUsecase>()));
  gh.factory<_i342.PeriodicCommunicationCubit>(() =>
      _i342.PeriodicCommunicationCubit(
          gh<_i301.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i343.LoginCubit>(() => _i343.LoginCubit(
        gh<_i296.LoginUsecase>(),
        gh<_i298.VerifyOtpUsecase>(),
        gh<_i294.CacheTokenUsecase>(),
        gh<_i295.GetTokenUsecase>(),
        gh<_i297.ValidateTokenUsecase>(),
      ));
  gh.factory<_i344.DatesTableCubit>(() => _i344.DatesTableCubit(
        gh<_i333.GetDateInstallationUsecase>(),
        gh<_i336.RescheduleDateUsecase>(),
        gh<_i331.ChangeDateToDonUsecase>(),
        gh<_i330.CancelScheduleUsecase>(),
        gh<_i337.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i335.GetSubscribedClientsUsecase>(),
        gh<_i334.GetInvoicesByClientForDateUsecase>(),
        gh<_i170.AddDateInstallUsecase>(),
        gh<_i332.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i345.WaitingAgentsCubit>(
      () => _i345.WaitingAgentsCubit(gh<_i321.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i346.AppModule {}
