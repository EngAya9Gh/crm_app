// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i42;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i139;
import '../../../features/app/domain/repositories/app_repository.dart' as _i138;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i245;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i307;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i239;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i101;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i266;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i265;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i282;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i283;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i284;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i285;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i286;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i331;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i23;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i31;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i30;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i152;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i228;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i22;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i73;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i72;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i89;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i145;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i37;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i53;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i52;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i94;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i95;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i96;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i98;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i97;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i99;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i246;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i119;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i100;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i35;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i34;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i77;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i202;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i14;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i128;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i127;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i204;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i275;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i36;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i133;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i132;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i157;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i251;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i27;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i171;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i170;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i289;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i330;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i21;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i85;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i84;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i209;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i312;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i43;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i114;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i113;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i150;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i271;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i50;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i92;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i91;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i93;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i186;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i86;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i147;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i146;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i160;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i161;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i162;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i163;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i164;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i165;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i166;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i259;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i124;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i188;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i187;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i276;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i308;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i49;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i64;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i63;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i87;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i189;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i51;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i105;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i104;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i240;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i241;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i279;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i67;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i154;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i153;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i249;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i250;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i288;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i44;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i135;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i134;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i267;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i268;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i269;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i270;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i277;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i39;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i66;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i65;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i76;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i174;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i175;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i176;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i177;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i311;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i29;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i182;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i181;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i300;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i229;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i301;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i230;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i302;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i303;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i232;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i231;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i304;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i305;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i306;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i315;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i32;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i169;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i168;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i290;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i329;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i45;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i191;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i190;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i212;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i213;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i214;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i291;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i215;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i219;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i292;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i216;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i217;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i218;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i224;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i220;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i221;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i222;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i223;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i327;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i40;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i206;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i205;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i256;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i287;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i33;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i69;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i68;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i115;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i142;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i108;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i248;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i247;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i278;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i316;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i71;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i70;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i88;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i201;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i46;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i156;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i155;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i272;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i273;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i328;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i41;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i75;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i74;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i237;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i238;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i314;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i90;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i110;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i109;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i167;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i151;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i264;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i15;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i82;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i118;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i141;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i159;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i184;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i140;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i158;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i183;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i293;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i261;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i252;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i226;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i255;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i294;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i295;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i296;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i297;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i298;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i299;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i227;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i253;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i263;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i326;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i313;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i47;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i149;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i148;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i178;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i207;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i26;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i107;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i106;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i192;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i193;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i200;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i194;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i195;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i196;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i197;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i198;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i199;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i281;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i20;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i57;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i56;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i126;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i260;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i121;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i120;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i208;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i257;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i28;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i103;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i102;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i203;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i225;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i13;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i117;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i116;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i185;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i310;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i19;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i55;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i54;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i144;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i262;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i18;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i79;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i78;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i83;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i242;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i122;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i244;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i243;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i318;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i319;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i320;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i321;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i322;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i323;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i324;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i325;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i332;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i61;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i60;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i123;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i143;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i25;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i137;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i136;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i254;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i274;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i59;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i58;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i62;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i111;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i38;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i173;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i172;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i180;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i280;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i112;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i211;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i210;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i309;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i333;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i48;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i81;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i80;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i233;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i234;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i235;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i236;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i258;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i317;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i129;
import '../cache_services/prefs_consumer.dart' as _i131;
import '../cache_services/secure_storage_consumer.dart' as _i130;
import '../maps/location_services.dart' as _i125;
import 'di_container.dart' as _i334;

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
  gh.lazySingleton<_i13.ProductsSalesReportsDatasource>(
      () => _i13.ProductsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i14.GreetingCommunicationDatasource>(
      () => _i14.GreetingCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i15.AgentsDistributorsActionsDataSource>(() =>
      _i15.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i16.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i17.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i18.ClientsInstallReportsDatasource>(
      () => _i18.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i19.RegionsSalesReportsDatasource>(
      () => _i19.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.ClientsDebtsReportsDatasource>(
      () => _i20.ClientsDebtsReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.PreviousRatingsDatasource>(
      () => _i21.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.ClientsCareReportsDatasource>(
      () => _i22.ClientsCareReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.ClientsAcceptDatasource>(
      () => _i23.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.ClientsStatusReportsDatasource>(
      () => _i24.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.DelayInstallReportsDatasource>(
      () => _i25.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.ParticipatesListDatasource>(
      () => _i26.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.PeriodicCommunicationDatasource>(
      () => _i27.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.EmployeesSalesReportsDatasource>(
      () => _i28.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.ManageWithdrawalsDatasource>(
      () => _i29.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.ClientsAcceptRepository>(() =>
      _i31.ClientsAcceptRepositoryImpl(gh<_i23.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i32.ClientsDebtsDatasource>(
      () => _i32.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.FinancePendingDatasource>(
      () => _i33.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i34.EvaluationLevelReportRepo>(() =>
      _i35.EvaluationLevelReportRepoImpl(
          gh<_i10.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i36.InstallQualityDatasource>(
      () => _i36.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i37.TicketsDataSource>(
      () => _i37.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i38.SupportClientsInvoicesDatasource>(
      () => _i38.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i39.UsersDatasource>(
      () => _i39.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i16.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i17.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i40.ClientsTransferApprovalsDatasource>(
      () => _i40.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.ExceededClientsDatasource>(
      () => _i41.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i42.AppDatasource>(
      () => _i42.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i43.SpecialClientsDatasource>(
      () => _i43.SpecialClientsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i44.PrivilegeDatasource>(
      () => _i44.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i45.ClientsListDatasource>(
      () => _i45.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i46.CommentCompanyDatasource>(
      () => _i46.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i47.LinkDatasource>(
      () => _i47.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i48.TaskDatasource>(
      () => _i48.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i49.UsersDatasource>(
      () => _i49.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i50.CitiesDatasource>(
      () => _i50.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i51.AdvancedConfigsDatasource>(
      () => _i51.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i52.TicketsRepo>(
      () => _i53.TicketsRepoImpl(gh<_i37.TicketsDataSource>()));
  gh.lazySingleton<_i54.RegionsSalesReportsRepo>(() =>
      _i55.RegionsSalesReportsRepoImpl(
          gh<_i19.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i56.ClientsDebtsReportsRepo>(() =>
      _i57.ClientsDebtsReportsRepoImpl(
          gh<_i20.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i58.SupportClientsAcceptRepository>(() =>
      _i59.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i60.DelayAfterInstallRepo>(() =>
      _i61.DelayAfterInstallRepoImpl(gh<_i11.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i62.GetSupportClientsAcceptUseCase>(() =>
      _i62.GetSupportClientsAcceptUseCase(
          gh<_i58.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i63.UsersRepository>(
      () => _i64.UsersRepositoryImpl(gh<_i49.UsersDatasource>()));
  gh.lazySingleton<_i65.UsersRepository>(
      () => _i66.UsersRepositoryImpl(gh<_i39.UsersDatasource>()));
  gh.lazySingleton<_i67.GeneralConfigsDatasource>(
      () => _i67.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i68.FinancePendingRepo>(
      () => _i69.FinancePendingRepoImpl(gh<_i33.FinancePendingDatasource>()));
  gh.lazySingleton<_i70.PendingInvoicesRepo>(
      () => _i71.PendingInvoicesRepoImpl(gh<_i12.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i72.ClientsCareReportsRepo>(() =>
      _i73.ClientsCareReportsRepoImpl(gh<_i22.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i74.ExceededClientsRepo>(
      () => _i75.ExceededClientsRepoImpl(gh<_i41.ExceededClientsDatasource>()));
  gh.factory<_i76.ActionUserUsecase>(
      () => _i76.ActionUserUsecase(gh<_i65.UsersRepository>()));
  gh.lazySingleton<_i77.GetEvaluationLevelReportUsecase>(() =>
      _i77.GetEvaluationLevelReportUsecase(
          gh<_i34.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i78.ClientsInstallReportsRepo>(() =>
      _i79.ClientsInstallReportsRepoImpl(
          gh<_i18.ClientsInstallReportsDatasource>()));
  gh.factory<_i80.TaskRepository>(
      () => _i81.TaskRepositoryImpl(gh<_i48.TaskDatasource>()));
  gh.lazySingleton<_i82.AgentsDistributorsDataSource>(
      () => _i82.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i83.GetClientsInstallReportsUsecase>(() =>
      _i83.GetClientsInstallReportsUsecase(
          gh<_i78.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i84.PreviousRatingsRepo>(
      () => _i85.PreviousRatingsRepoImpl(gh<_i21.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i86.SupportTabDataSource>(
      () => _i86.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i87.GetUsersUsecase>(
      () => _i87.GetUsersUsecase(gh<_i63.UsersRepository>()));
  gh.lazySingleton<_i88.GetPendingInvoicesUsecase>(
      () => _i88.GetPendingInvoicesUsecase(gh<_i70.PendingInvoicesRepo>()));
  gh.lazySingleton<_i89.GetClientsCareReportsUsecase>(() =>
      _i89.GetClientsCareReportsUsecase(gh<_i72.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i90.InvoicesTabDataSource>(
      () => _i90.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i91.CitiesRepository>(
      () => _i92.CitiesRepositoryImpl(gh<_i50.CitiesDatasource>()));
  gh.lazySingleton<_i93.GetCitiesUseCase>(
      () => _i93.GetCitiesUseCase(gh<_i91.CitiesRepository>()));
  gh.lazySingleton<_i94.AddTicketUseCase>(
      () => _i94.AddTicketUseCase(gh<_i52.TicketsRepo>()));
  gh.lazySingleton<_i95.EditTicketTypeUseCase>(
      () => _i95.EditTicketTypeUseCase(gh<_i52.TicketsRepo>()));
  gh.lazySingleton<_i96.GetClientTicketsUseCase>(
      () => _i96.GetClientTicketsUseCase(gh<_i52.TicketsRepo>()));
  gh.lazySingleton<_i97.GetTicketsUseCase>(
      () => _i97.GetTicketsUseCase(gh<_i52.TicketsRepo>()));
  gh.lazySingleton<_i98.GetTicketByIdUseCase>(
      () => _i98.GetTicketByIdUseCase(gh<_i52.TicketsRepo>()));
  gh.lazySingleton<_i99.TransferTicketUseCase>(
      () => _i99.TransferTicketUseCase(gh<_i52.TicketsRepo>()));
  gh.factory<_i100.TicketsCubit>(() => _i100.TicketsCubit(
        gh<_i97.GetTicketsUseCase>(),
        gh<_i98.GetTicketByIdUseCase>(),
        gh<_i96.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i101.LoginRemoteDataSource>(
      () => _i101.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i102.EmployeesSalesReportsRepo>(() =>
      _i103.EmployeesSalesReportsRepoImpl(
          gh<_i28.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i104.AdvancedConfigsRepository>(() =>
      _i105.AdvancedConfigsRepositoryImpl(
          gh<_i51.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i106.ParticipateListRepository>(() =>
      _i107.ParticipateListRepositoryImpl(
          gh<_i26.ParticipatesListDatasource>()));
  gh.lazySingleton<_i108.LatestClientsUpdatesDatasource>(
      () => _i108.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i109.InvoicesSectionRepo>(
      () => _i110.InvoicesTabRepoImpl(gh<_i90.InvoicesTabDataSource>()));
  gh.factory<_i111.SupportClientsAcceptCubit>(() =>
      _i111.SupportClientsAcceptCubit(
          gh<_i62.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i112.WaitingAgentsDataSource>(
      () => _i112.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i113.SpecialClientsRepository>(() =>
      _i114.SpecialClientsRepositoryImpl(gh<_i43.SpecialClientsDatasource>()));
  gh.lazySingleton<_i115.GetFinancePendingInvoicesUsecase>(() =>
      _i115.GetFinancePendingInvoicesUsecase(gh<_i68.FinancePendingRepo>()));
  gh.lazySingleton<_i116.ProductsSalesReportsRepo>(() =>
      _i117.ProductsSalesReportsRepoImpl(
          gh<_i13.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i118.AgentsDistributorsProfileDataSource>(() =>
      _i118.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i119.EditTicketCubit>(() => _i119.EditTicketCubit(
        gh<_i95.EditTicketTypeUseCase>(),
        gh<_i99.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i120.ClientsStatusReportsRepo>(() =>
      _i121.ClientsStatusReportsRepoImpl(
          gh<_i24.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i122.DatesTableDataSource>(
      () => _i122.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i123.GetDelayAfterInstallUseCase>(() =>
      _i123.GetDelayAfterInstallUseCase(gh<_i60.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i124.RegionsDatasource>(
      () => _i124.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i125.LocationServices>(
      () => _i125.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i126.GetClientsDebtsReportsUsecase>(() =>
      _i126.GetClientsDebtsReportsUsecase(gh<_i56.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i127.GreetingCommunicationRepo>(() =>
      _i128.GreetingCommunicationRepoImpl(
          gh<_i14.GreetingCommunicationDatasource>()));
  gh.singleton<_i129.CacheServices>(
    () => _i130.SecureStorageConsumer(gh<_i17.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i129.CacheServices>(() async =>
      _i131.PrefsConsumer(await gh.getAsync<_i16.SharedPreferences>()));
  gh.lazySingleton<_i132.InstallQualityRepo>(
      () => _i133.InstallQualityRepoImpl(gh<_i36.InstallQualityDatasource>()));
  gh.factory<_i134.PrivilegeRepository>(
      () => _i135.PrivilegeRepositoryImpl(gh<_i44.PrivilegeDatasource>()));
  gh.lazySingleton<_i136.DelayInstallReportsRepo>(() =>
      _i137.DelayInstallReportsRepoImpl(
          gh<_i25.DelayInstallReportsDatasource>()));
  gh.factory<_i138.AppRepository>(
      () => _i139.AppRepositoryImpl(gh<_i42.AppDatasource>()));
  gh.lazySingleton<_i140.AgentsDistributorsActionsRepo>(() =>
      _i141.AgentsDistributorsActionsRepoImpl(
          gh<_i15.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i142.FinancePendingCubit>(() =>
      _i142.FinancePendingCubit(gh<_i115.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i143.DelayAfterInstallCubit>(() =>
      _i143.DelayAfterInstallCubit(gh<_i123.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i144.GetRegionsSalesReportsUsecase>(() =>
      _i144.GetRegionsSalesReportsUsecase(gh<_i54.RegionsSalesReportsRepo>()));
  gh.factory<_i145.ClientsCareReportsCubit>(() =>
      _i145.ClientsCareReportsCubit(gh<_i89.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i146.SupportTabRepo>(
      () => _i147.SupportTabRepoImpl(gh<_i86.SupportTabDataSource>()));
  gh.factory<_i148.LinksImportantRepository>(
      () => _i149.LinkRepositoryImpl(gh<_i47.LinkDatasource>()));
  gh.factory<_i150.GetSpecialClientsUsecase>(() =>
      _i150.GetSpecialClientsUsecase(gh<_i113.SpecialClientsRepository>()));
  gh.lazySingleton<_i151.GetInvoicesByPrivilegesUsecase>(() =>
      _i151.GetInvoicesByPrivilegesUsecase(gh<_i109.InvoicesSectionRepo>()));
  gh.lazySingleton<_i152.GetClientsAcceptUseCase>(
      () => _i152.GetClientsAcceptUseCase(gh<_i30.ClientsAcceptRepository>()));
  gh.lazySingleton<_i153.GeneralConfigsRepository>(() =>
      _i154.GeneralConfigsRepositoryImpl(gh<_i67.GeneralConfigsDatasource>()));
  gh.factory<_i155.CompanyRepository>(
      () => _i156.CompanyRepositoryImpl(gh<_i46.CommentCompanyDatasource>()));
  gh.lazySingleton<_i157.GetInstallUseCase>(
      () => _i157.GetInstallUseCase(gh<_i132.InstallQualityRepo>()));
  gh.lazySingleton<_i158.AgentsDistributorsProfileRepo>(() =>
      _i159.AgentsDistributorsProfileRepoImpl(
          gh<_i118.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i160.AddDateInstallUsecase>(
      () => _i160.AddDateInstallUsecase(gh<_i146.SupportTabRepo>()));
  gh.lazySingleton<_i161.CancelDateInstallUsecase>(
      () => _i161.CancelDateInstallUsecase(gh<_i146.SupportTabRepo>()));
  gh.lazySingleton<_i162.GetInvoiceByClientUsecase>(
      () => _i162.GetInvoiceByClientUsecase(gh<_i146.SupportTabRepo>()));
  gh.lazySingleton<_i163.ReceiveDeviceUsecase>(
      () => _i163.ReceiveDeviceUsecase(gh<_i146.SupportTabRepo>()));
  gh.lazySingleton<_i164.ReturnInvoiceApproveUsecase>(
      () => _i164.ReturnInvoiceApproveUsecase(gh<_i146.SupportTabRepo>()));
  gh.lazySingleton<_i165.SetDateDoneUsecase>(
      () => _i165.SetDateDoneUsecase(gh<_i146.SupportTabRepo>()));
  gh.lazySingleton<_i166.SetReadyInstallUsecase>(
      () => _i166.SetReadyInstallUsecase(gh<_i146.SupportTabRepo>()));
  gh.lazySingleton<_i167.GetAllUsersUseCase>(
      () => _i167.GetAllUsersUseCase(gh<_i109.InvoicesSectionRepo>()));
  gh.lazySingleton<_i168.ClientsDebtsRepo>(
      () => _i169.ClientsDebtsRepoImpl(gh<_i32.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i170.PeriodicCommunicationRepo>(() =>
      _i171.PeriodicCommunicationRepoImpl(
          gh<_i27.PeriodicCommunicationDatasource>()));
  gh.lazySingleton<_i172.SupportClientsInvoicesRepo>(() =>
      _i173.SupportClientsInvoicesRepoImpl(
          gh<_i38.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i174.GetBranchesForUserUsecase>(
      () => _i174.GetBranchesForUserUsecase(gh<_i65.UsersRepository>()));
  gh.lazySingleton<_i175.GetLevelsForUserUsecase>(
      () => _i175.GetLevelsForUserUsecase(gh<_i65.UsersRepository>()));
  gh.lazySingleton<_i176.GetManagesForUserUsecase>(
      () => _i176.GetManagesForUserUsecase(gh<_i65.UsersRepository>()));
  gh.factory<_i177.GetUsersUsecase>(
      () => _i177.GetUsersUsecase(gh<_i65.UsersRepository>()));
  gh.factory<_i178.ActionLinkUsecase>(
      () => _i178.ActionLinkUsecase(gh<_i148.LinksImportantRepository>()));
  gh.factory<_i179.GetLinkUsecase>(
      () => _i179.GetLinkUsecase(gh<_i148.LinksImportantRepository>()));
  gh.lazySingleton<_i180.GetSupportClientsInvoicesUseCase>(() =>
      _i180.GetSupportClientsInvoicesUseCase(
          gh<_i172.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i181.ManageWithdrawalsRepository>(() =>
      _i182.ManageWithdrawalsRepositoryImpl(
          gh<_i29.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i183.AgentsDistributorsRepo>(() =>
      _i184.AgentsDistributorsRepoImpl(
          gh<_i82.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i185.GetProductsSalesReportsUsecase>(() =>
      _i185.GetProductsSalesReportsUsecase(
          gh<_i116.ProductsSalesReportsRepo>()));
  gh.singleton<_i186.CitiesCubit>(
      () => _i186.CitiesCubit(gh<_i93.GetCitiesUseCase>()));
  gh.lazySingleton<_i187.RegionsRepository>(
      () => _i188.RegionsRepositoryImpl(gh<_i124.RegionsDatasource>()));
  gh.factory<_i189.UsersTypeCubit>(
      () => _i189.UsersTypeCubit(gh<_i87.GetUsersUsecase>()));
  gh.factory<_i190.ClientsListRepository>(
      () => _i191.ClientsListRepositoryImpl(gh<_i45.ClientsListDatasource>()));
  gh.factory<_i192.AddParticipateCommentUsecase>(() =>
      _i192.AddParticipateCommentUsecase(
          gh<_i106.ParticipateListRepository>()));
  gh.factory<_i193.AddParticipateUserUsecase>(() =>
      _i193.AddParticipateUserUsecase(gh<_i106.ParticipateListRepository>()));
  gh.factory<_i194.EditParticipateUserUsecase>(() =>
      _i194.EditParticipateUserUsecase(gh<_i106.ParticipateListRepository>()));
  gh.factory<_i195.GetInvoiceByIdUsecase>(
      () => _i195.GetInvoiceByIdUsecase(gh<_i106.ParticipateListRepository>()));
  gh.factory<_i196.ParticipateClientListUsecase>(() =>
      _i196.ParticipateClientListUsecase(
          gh<_i106.ParticipateListRepository>()));
  gh.factory<_i197.ParticipateCommentListUsecase>(() =>
      _i197.ParticipateCommentListUsecase(
          gh<_i106.ParticipateListRepository>()));
  gh.factory<_i198.ParticipateInvoiceListUsecase>(() =>
      _i198.ParticipateInvoiceListUsecase(
          gh<_i106.ParticipateListRepository>()));
  gh.factory<_i199.ParticipateListUsecase>(() =>
      _i199.ParticipateListUsecase(gh<_i106.ParticipateListRepository>()));
  gh.lazySingleton<_i200.ChangeParticipateStatusUsecase>(() =>
      _i200.ChangeParticipateStatusUsecase(
          gh<_i106.ParticipateListRepository>()));
  gh.factory<_i201.PendingInvoicesCubit>(
      () => _i201.PendingInvoicesCubit(gh<_i88.GetPendingInvoicesUsecase>()));
  gh.factory<_i202.EvaluationLevelReportCubit>(() =>
      _i202.EvaluationLevelReportCubit(
          gh<_i77.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i203.GetEmployeesSalesReportsUsecase>(() =>
      _i203.GetEmployeesSalesReportsUsecase(
          gh<_i102.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i204.GetGreetingCommunicationUseCase>(() =>
      _i204.GetGreetingCommunicationUseCase(
          gh<_i127.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i205.ClientsTransferApprovalsRepo>(() =>
      _i206.ClientsTransferApprovalsRepoImpl(
          gh<_i40.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i207.LinkCubit>(() => _i207.LinkCubit(
        gh<_i179.GetLinkUsecase>(),
        gh<_i178.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i208.GetClientsStatusReportsUsecase>(() =>
      _i208.GetClientsStatusReportsUsecase(
          gh<_i120.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i209.GetPreviousRatingsUsecase>(
      () => _i209.GetPreviousRatingsUsecase(gh<_i84.PreviousRatingsRepo>()));
  gh.lazySingleton<_i210.WaitingAgentsRepo>(
      () => _i211.WaitingAgentsRepoImpl(gh<_i112.WaitingAgentsDataSource>()));
  gh.factory<_i212.AddClientUserUsecase>(
      () => _i212.AddClientUserUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i213.ApproveRejectClientUsecase>(() =>
      _i213.ApproveRejectClientUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i214.ChangeTypeClientUsecase>(
      () => _i214.ChangeTypeClientUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i215.EditClientUserUsecase>(
      () => _i215.EditClientUserUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i216.GetClientsListByRegionUseCase>(() =>
      _i216.GetClientsListByRegionUseCase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i217.GetClientsListByUserUseCase>(() =>
      _i217.GetClientsListByUserUseCase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i218.GetClientsWithFilterUserUsecase>(() =>
      _i218.GetClientsWithFilterUserUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i219.GetClientMarketingReportUsecase>(() =>
      _i219.GetClientMarketingReportUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i220.GetRecommendedClientsUsecase>(() =>
      _i220.GetRecommendedClientsUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i221.GetSimilarClientsUsecase>(
      () => _i221.GetSimilarClientsUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i222.ReceiveClientUserUsecase>(
      () => _i222.ReceiveClientUserUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i223.TransferClientUserUsecase>(
      () => _i223.TransferClientUserUsecase(gh<_i190.ClientsListRepository>()));
  gh.lazySingleton<_i224.GetHighSimilarClientsUsecase>(() =>
      _i224.GetHighSimilarClientsUsecase(gh<_i190.ClientsListRepository>()));
  gh.factory<_i225.EmployeesSalesReportsCubit>(() =>
      _i225.EmployeesSalesReportsCubit(
          gh<_i203.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i226.ChangeStateAgentUseCase>(
      () => _i226.ChangeStateAgentUseCase(gh<_i183.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i227.GetAgentsAndDistributorsUseCase>(() =>
      _i227.GetAgentsAndDistributorsUseCase(
          gh<_i183.AgentsDistributorsRepo>()));
  gh.factory<_i228.ClientsAcceptCubit>(
      () => _i228.ClientsAcceptCubit(gh<_i152.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i229.CancelWithdrawalUsecase>(() =>
      _i229.CancelWithdrawalUsecase(gh<_i181.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i230.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i230.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i181.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i231.GetWithdrawalsInvoicesUsecase>(() =>
      _i231.GetWithdrawalsInvoicesUsecase(
          gh<_i181.ManageWithdrawalsRepository>()));
  gh.factory<_i232.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i232.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i181.ManageWithdrawalsRepository>()));
  gh.factory<_i233.AddTaskUsecase>(
      () => _i233.AddTaskUsecase(gh<_i80.TaskRepository>()));
  gh.factory<_i234.ChangeStatusTaskUsecase>(
      () => _i234.ChangeStatusTaskUsecase(gh<_i80.TaskRepository>()));
  gh.factory<_i235.FilterTaskUsecase>(
      () => _i235.FilterTaskUsecase(gh<_i80.TaskRepository>()));
  gh.factory<_i236.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i236.GetUsersByDepartmentAndRegionUsecase(gh<_i80.TaskRepository>()));
  gh.lazySingleton<_i237.ExceededClientsUseCase>(
      () => _i237.ExceededClientsUseCase(gh<_i74.ExceededClientsRepo>()));
  gh.lazySingleton<_i238.TransferExceededClientsUseCase>(() =>
      _i238.TransferExceededClientsUseCase(gh<_i74.ExceededClientsRepo>()));
  gh.lazySingleton<_i239.LoginLocalDataSource>(() =>
      _i239.LoginLocalDataSourceImpl(
          gh<_i129.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i240.EditAdvancedConfigsUsecase>(() =>
      _i240.EditAdvancedConfigsUsecase(gh<_i104.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i241.GetAdvancedConfigsUsecase>(() =>
      _i241.GetAdvancedConfigsUsecase(gh<_i104.AdvancedConfigsRepository>()));
  gh.factory<_i242.ClientsInstallReportsCubit>(() =>
      _i242.ClientsInstallReportsCubit(
          gh<_i83.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i243.DatesTableRepo>(
      () => _i244.DatesTableRepoImpl(gh<_i122.DatesTableDataSource>()));
  gh.factory<_i245.GetVersionUseCase>(
      () => _i245.GetVersionUseCase(gh<_i138.AppRepository>()));
  gh.factory<_i246.AddTicketCubit>(
      () => _i246.AddTicketCubit(gh<_i94.AddTicketUseCase>()));
  gh.lazySingleton<_i247.LatestClientsUpdatesRepository>(() =>
      _i248.LatestClientsUpdatesRepositoryImpl(
          gh<_i108.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i249.EditGeneralConfigsUsecase>(() =>
      _i249.EditGeneralConfigsUsecase(gh<_i153.GeneralConfigsRepository>()));
  gh.lazySingleton<_i250.GetGeneralConfigsUsecase>(() =>
      _i250.GetGeneralConfigsUsecase(gh<_i153.GeneralConfigsRepository>()));
  gh.factory<_i251.InstallQualityCubit>(
      () => _i251.InstallQualityCubit(gh<_i157.GetInstallUseCase>()));
  gh.lazySingleton<_i252.AddAgentUseCase>(
      () => _i252.AddAgentUseCase(gh<_i140.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i253.UpdateAgentUseCase>(() =>
      _i253.UpdateAgentUseCase(gh<_i140.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i254.GetDelayInstallReportsUseCase>(() =>
      _i254.GetDelayInstallReportsUseCase(gh<_i136.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i255.CrudAgentSupportFilesUsecase>(() =>
      _i255.CrudAgentSupportFilesUsecase(
          gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i256.GetClientsTransferApprovalsUsecase>(() =>
      _i256.GetClientsTransferApprovalsUsecase(
          gh<_i205.ClientsTransferApprovalsRepo>()));
  gh.factory<_i257.ClientsStatusReportsCubit>(() =>
      _i257.ClientsStatusReportsCubit(
          gh<_i208.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i258.TaskCubit>(() => _i258.TaskCubit(
        gh<_i233.AddTaskUsecase>(),
        gh<_i235.FilterTaskUsecase>(),
        gh<_i234.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i259.SupportTabCubit>(() => _i259.SupportTabCubit(
        gh<_i162.GetInvoiceByClientUsecase>(),
        gh<_i160.AddDateInstallUsecase>(),
        gh<_i165.SetDateDoneUsecase>(),
        gh<_i166.SetReadyInstallUsecase>(),
        gh<_i164.ReturnInvoiceApproveUsecase>(),
        gh<_i163.ReceiveDeviceUsecase>(),
        gh<_i161.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i260.ClientsDebtsReportsCubit>(() =>
      _i260.ClientsDebtsReportsCubit(
          gh<_i126.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i261.AddAgentDateUseCase>(() =>
      _i261.AddAgentDateUseCase(gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.factory<_i262.RegionsSalesReportsCubit>(() =>
      _i262.RegionsSalesReportsCubit(
          gh<_i144.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i263.AgentsDistributorsActionsCubit>(
      () => _i263.AgentsDistributorsActionsCubit(
            gh<_i93.GetCitiesUseCase>(),
            gh<_i252.AddAgentUseCase>(),
            gh<_i253.UpdateAgentUseCase>(),
          ));
  gh.factory<_i264.InvoicesSectionCubit>(() => _i264.InvoicesSectionCubit(
        gh<_i151.GetInvoicesByPrivilegesUsecase>(),
        gh<_i227.GetAgentsAndDistributorsUseCase>(),
        gh<_i199.ParticipateListUsecase>(),
        gh<_i167.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i265.LoginRepo>(() => _i266.LoginRepoImpl(
        gh<_i101.LoginRemoteDataSource>(),
        gh<_i239.LoginLocalDataSource>(),
      ));
  gh.factory<_i267.AddLevelUsecase>(
      () => _i267.AddLevelUsecase(gh<_i134.PrivilegeRepository>()));
  gh.factory<_i268.GetLevelsUsecase>(
      () => _i268.GetLevelsUsecase(gh<_i134.PrivilegeRepository>()));
  gh.factory<_i269.GetPrivilegesUsecase>(
      () => _i269.GetPrivilegesUsecase(gh<_i134.PrivilegeRepository>()));
  gh.factory<_i270.UpdatePrivilegeUsecase>(
      () => _i270.UpdatePrivilegeUsecase(gh<_i134.PrivilegeRepository>()));
  gh.factory<_i271.SpecialClientsBloc>(
      () => _i271.SpecialClientsBloc(gh<_i150.GetSpecialClientsUsecase>()));
  gh.factory<_i272.AddCommentUsecase>(
      () => _i272.AddCommentUsecase(gh<_i155.CompanyRepository>()));
  gh.factory<_i273.GetCommentUsecase>(
      () => _i273.GetCommentUsecase(gh<_i155.CompanyRepository>()));
  gh.factory<_i274.DelayInstallReportsCubit>(() =>
      _i274.DelayInstallReportsCubit(
          gh<_i254.GetDelayInstallReportsUseCase>()));
  gh.factory<_i275.GreetingCommunicationCubit>(() =>
      _i275.GreetingCommunicationCubit(
          gh<_i204.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i276.GetRegionsByIdCountryUseCase>(
      () => _i276.GetRegionsByIdCountryUseCase(gh<_i187.RegionsRepository>()));
  gh.lazySingleton<_i277.PrivilegeCubit>(() => _i277.PrivilegeCubit(
        gh<_i268.GetLevelsUsecase>(),
        gh<_i269.GetPrivilegesUsecase>(),
        gh<_i270.UpdatePrivilegeUsecase>(),
        gh<_i267.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i278.GetLatestClientsUseCase>(() =>
      _i278.GetLatestClientsUseCase(
          gh<_i247.LatestClientsUpdatesRepository>()));
  gh.factory<_i279.AdvancedCofigsCubit>(() => _i279.AdvancedCofigsCubit(
        gh<_i241.GetAdvancedConfigsUsecase>(),
        gh<_i240.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i280.SupportClientsInvoicesCubit>(() =>
      _i280.SupportClientsInvoicesCubit(
          gh<_i180.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i281.ParticipateListBloc>(() => _i281.ParticipateListBloc(
        gh<_i199.ParticipateListUsecase>(),
        gh<_i193.AddParticipateUserUsecase>(),
        gh<_i194.EditParticipateUserUsecase>(),
        gh<_i196.ParticipateClientListUsecase>(),
        gh<_i198.ParticipateInvoiceListUsecase>(),
        gh<_i195.GetInvoiceByIdUsecase>(),
        gh<_i197.ParticipateCommentListUsecase>(),
        gh<_i192.AddParticipateCommentUsecase>(),
        gh<_i200.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i282.CacheTokenUsecase>(
      () => _i282.CacheTokenUsecase(gh<_i265.LoginRepo>()));
  gh.lazySingleton<_i283.GetTokenUsecase>(
      () => _i283.GetTokenUsecase(gh<_i265.LoginRepo>()));
  gh.lazySingleton<_i284.LoginUsecase>(
      () => _i284.LoginUsecase(gh<_i265.LoginRepo>()));
  gh.lazySingleton<_i285.ValidateTokenUsecase>(
      () => _i285.ValidateTokenUsecase(gh<_i265.LoginRepo>()));
  gh.lazySingleton<_i286.VerifyOtpUsecase>(
      () => _i286.VerifyOtpUsecase(gh<_i265.LoginRepo>()));
  gh.factory<_i287.ClientsTransferApprovalsCubit>(() =>
      _i287.ClientsTransferApprovalsCubit(
          gh<_i256.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i288.GeneralCofigsCubit>(() => _i288.GeneralCofigsCubit(
        gh<_i250.GetGeneralConfigsUsecase>(),
        gh<_i249.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i289.GetPeriodicCommunicationUseCase>(() =>
      _i289.GetPeriodicCommunicationUseCase(
          gh<_i170.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i290.GetClientsDebtsUsecase>(
      () => _i290.GetClientsDebtsUsecase(gh<_i168.ClientsDebtsRepo>()));
  gh.lazySingleton<_i291.CrudClientSupportFilesUsecase>(() =>
      _i291.CrudClientSupportFilesUsecase(
          repository: gh<_i190.ClientsListRepository>()));
  gh.lazySingleton<_i292.GetClientSupportFilesUsecase>(() =>
      _i292.GetClientSupportFilesUsecase(
          repository: gh<_i190.ClientsListRepository>()));
  gh.lazySingleton<_i293.AddAgentCommentUsecase>(() =>
      _i293.AddAgentCommentUsecase(gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i294.DoneTrainingUsecase>(() =>
      _i294.DoneTrainingUsecase(gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i295.GetAgentUsecase>(
      () => _i295.GetAgentUsecase(gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i296.GetAgentClientListUsecase>(() =>
      _i296.GetAgentClientListUsecase(
          gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i297.GetAgentCommentsListUsecase>(() =>
      _i297.GetAgentCommentsListUsecase(
          gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i298.GetAgentDatesListUsecase>(() =>
      _i298.GetAgentDatesListUsecase(
          gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i299.GetAgentInvoiceListUsecase>(() =>
      _i299.GetAgentInvoiceListUsecase(
          gh<_i158.AgentsDistributorsProfileRepo>()));
  gh.factory<_i300.AddRejectReasonsUsecase>(() =>
      _i300.AddRejectReasonsUsecase(gh<_i181.ManageWithdrawalsRepository>()));
  gh.factory<_i301.EditRejectReasonsUsecase>(() =>
      _i301.EditRejectReasonsUsecase(gh<_i181.ManageWithdrawalsRepository>()));
  gh.factory<_i302.GetRejectReasonsUsecase>(() =>
      _i302.GetRejectReasonsUsecase(gh<_i181.ManageWithdrawalsRepository>()));
  gh.factory<_i303.GetUserSeriesUsecase>(() =>
      _i303.GetUserSeriesUsecase(gh<_i181.ManageWithdrawalsRepository>()));
  gh.factory<_i304.GetWithdrawnDetailsUsecase>(() =>
      _i304.GetWithdrawnDetailsUsecase(
          gh<_i181.ManageWithdrawalsRepository>()));
  gh.factory<_i305.SetApproveSeriesUsecase>(() =>
      _i305.SetApproveSeriesUsecase(gh<_i181.ManageWithdrawalsRepository>()));
  gh.factory<_i306.UpdateSeriesUsecase>(
      () => _i306.UpdateSeriesUsecase(gh<_i181.ManageWithdrawalsRepository>()));
  gh.singleton<_i307.AppManagerCubit>(
      () => _i307.AppManagerCubit(gh<_i245.GetVersionUseCase>()));
  gh.factory<_i308.RegionsCubit>(
      () => _i308.RegionsCubit(gh<_i276.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i309.GetWaitingAgentsUsecase>(
      () => _i309.GetWaitingAgentsUsecase(gh<_i210.WaitingAgentsRepo>()));
  gh.factory<_i310.ProductsSalesReportsCubit>(() =>
      _i310.ProductsSalesReportsCubit(
          gh<_i185.GetProductsSalesReportsUsecase>()));
  gh.factory<_i311.UsersCubit>(() => _i311.UsersCubit(
        gh<_i177.GetUsersUsecase>(),
        gh<_i76.ActionUserUsecase>(),
        gh<_i236.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i176.GetManagesForUserUsecase>(),
        gh<_i175.GetLevelsForUserUsecase>(),
        gh<_i174.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i312.PreviousRatingsCubit>(
      () => _i312.PreviousRatingsCubit(gh<_i209.GetPreviousRatingsUsecase>()));
  gh.factory<_i313.AgentsDistributorsCubit>(() => _i313.AgentsDistributorsCubit(
        gh<_i227.GetAgentsAndDistributorsUseCase>(),
        gh<_i226.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i314.ExceededClientsCubit>(() => _i314.ExceededClientsCubit(
        gh<_i237.ExceededClientsUseCase>(),
        gh<_i238.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i315.ManageWithdrawalsCubit>(() => _i315.ManageWithdrawalsCubit(
        gh<_i303.GetUserSeriesUsecase>(),
        gh<_i306.UpdateSeriesUsecase>(),
        gh<_i177.GetUsersUsecase>(),
        gh<_i231.GetWithdrawalsInvoicesUsecase>(),
        gh<_i232.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i305.SetApproveSeriesUsecase>(),
        gh<_i304.GetWithdrawnDetailsUsecase>(),
        gh<_i300.AddRejectReasonsUsecase>(),
        gh<_i302.GetRejectReasonsUsecase>(),
        gh<_i301.EditRejectReasonsUsecase>(),
        gh<_i230.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i229.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i316.LatestClientsUpdatesCubit>(() =>
      _i316.LatestClientsUpdatesCubit(gh<_i278.GetLatestClientsUseCase>()));
  gh.factory<_i317.AttachmentsRowCubit>(() => _i317.AttachmentsRowCubit(
        gh<_i292.GetClientSupportFilesUsecase>(),
        gh<_i291.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i318.CancelScheduleUsecase>(
      () => _i318.CancelScheduleUsecase(gh<_i243.DatesTableRepo>()));
  gh.lazySingleton<_i319.ChangeDateToDonUsecase>(
      () => _i319.ChangeDateToDonUsecase(gh<_i243.DatesTableRepo>()));
  gh.lazySingleton<_i320.GetCancelReasonsUsecase>(
      () => _i320.GetCancelReasonsUsecase(gh<_i243.DatesTableRepo>()));
  gh.lazySingleton<_i321.GetDateInstallationUsecase>(
      () => _i321.GetDateInstallationUsecase(gh<_i243.DatesTableRepo>()));
  gh.lazySingleton<_i322.GetInvoicesByClientForDateUsecase>(() =>
      _i322.GetInvoicesByClientForDateUsecase(gh<_i243.DatesTableRepo>()));
  gh.lazySingleton<_i323.GetSubscribedClientsUsecase>(
      () => _i323.GetSubscribedClientsUsecase(gh<_i243.DatesTableRepo>()));
  gh.lazySingleton<_i324.RescheduleDateUsecase>(
      () => _i324.RescheduleDateUsecase(gh<_i243.DatesTableRepo>()));
  gh.lazySingleton<_i325.ReturnScheduleVisitToOpenUsecase>(
      () => _i325.ReturnScheduleVisitToOpenUsecase(gh<_i243.DatesTableRepo>()));
  gh.factory<_i326.AgentsDistributorsProfileBloc>(
      () => _i326.AgentsDistributorsProfileBloc(
            gh<_i296.GetAgentClientListUsecase>(),
            gh<_i299.GetAgentInvoiceListUsecase>(),
            gh<_i195.GetInvoiceByIdUsecase>(),
            gh<_i297.GetAgentCommentsListUsecase>(),
            gh<_i293.AddAgentCommentUsecase>(),
            gh<_i294.DoneTrainingUsecase>(),
            gh<_i261.AddAgentDateUseCase>(),
            gh<_i298.GetAgentDatesListUsecase>(),
            gh<_i255.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i327.ClientsListBloc>(() => _i327.ClientsListBloc(
        gh<_i218.GetClientsWithFilterUserUsecase>(),
        gh<_i220.GetRecommendedClientsUsecase>(),
        gh<_i212.AddClientUserUsecase>(),
        gh<_i215.EditClientUserUsecase>(),
        gh<_i214.ChangeTypeClientUsecase>(),
        gh<_i221.GetSimilarClientsUsecase>(),
        gh<_i213.ApproveRejectClientUsecase>(),
        gh<_i291.CrudClientSupportFilesUsecase>(),
        gh<_i292.GetClientSupportFilesUsecase>(),
        gh<_i223.TransferClientUserUsecase>(),
        gh<_i222.ReceiveClientUserUsecase>(),
        gh<_i219.GetClientMarketingReportUsecase>(),
        gh<_i224.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i328.CompanyCubit>(() => _i328.CompanyCubit(
        gh<_i273.GetCommentUsecase>(),
        gh<_i272.AddCommentUsecase>(),
      ));
  gh.factory<_i329.ClientsDebtsCubit>(
      () => _i329.ClientsDebtsCubit(gh<_i290.GetClientsDebtsUsecase>()));
  gh.factory<_i330.PeriodicCommunicationCubit>(() =>
      _i330.PeriodicCommunicationCubit(
          gh<_i289.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i331.LoginCubit>(() => _i331.LoginCubit(
        gh<_i284.LoginUsecase>(),
        gh<_i286.VerifyOtpUsecase>(),
        gh<_i282.CacheTokenUsecase>(),
        gh<_i283.GetTokenUsecase>(),
        gh<_i285.ValidateTokenUsecase>(),
      ));
  gh.factory<_i332.DatesTableCubit>(() => _i332.DatesTableCubit(
        gh<_i321.GetDateInstallationUsecase>(),
        gh<_i324.RescheduleDateUsecase>(),
        gh<_i319.ChangeDateToDonUsecase>(),
        gh<_i318.CancelScheduleUsecase>(),
        gh<_i325.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i323.GetSubscribedClientsUsecase>(),
        gh<_i322.GetInvoicesByClientForDateUsecase>(),
        gh<_i160.AddDateInstallUsecase>(),
        gh<_i320.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i333.WaitingAgentsCubit>(
      () => _i333.WaitingAgentsCubit(gh<_i309.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i334.AppModule {}
