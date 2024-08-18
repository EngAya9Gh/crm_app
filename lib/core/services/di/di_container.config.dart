// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i15;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i38;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i129;
import '../../../features/app/domain/repositories/app_repository.dart' as _i128;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i235;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i296;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i229;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i93;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i256;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i255;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i271;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i272;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i273;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i274;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i275;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i321;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i29;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i28;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i140;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i218;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i33;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i49;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i48;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i86;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i87;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i88;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i90;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i89;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i91;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i236;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i109;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i92;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i39;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i161;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i160;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i192;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i302;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i13;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i118;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i117;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i194;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i264;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i32;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i123;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i122;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i145;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i241;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i25;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i159;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i158;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i278;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i306;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i20;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i78;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i77;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i199;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i301;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i46;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i84;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i83;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i85;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i176;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i79;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i136;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i135;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i148;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i149;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i150;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i151;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i152;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i153;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i154;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i249;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i114;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i178;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i177;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i265;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i297;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i45;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i60;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i59;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i80;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i179;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i47;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i97;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i96;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i230;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i231;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i268;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i63;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i142;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i141;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i239;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i240;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i277;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i40;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i125;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i124;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i257;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i258;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i259;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i260;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i266;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i35;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i62;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i61;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i70;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i164;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i165;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i166;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i167;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i300;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i27;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i172;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i171;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i289;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i219;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i290;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i220;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i291;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i292;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i222;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i221;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i293;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i294;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i295;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i305;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i30;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i157;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i156;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i279;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i320;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i41;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i181;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i180;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i202;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i203;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i204;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i280;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i205;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i209;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i281;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i206;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i207;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i208;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i214;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i210;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i211;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i212;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i213;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i318;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i36;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i196;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i195;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i246;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i276;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i31;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i65;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i64;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i105;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i132;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i100;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i238;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i237;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i267;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i307;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i11;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i67;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i66;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i81;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i191;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i42;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i144;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i143;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i261;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i262;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i319;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i37;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i69;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i68;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i227;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i228;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i304;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i82;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i102;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i101;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i155;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i139;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i254;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i75;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i108;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i131;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i147;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i174;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i130;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i146;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i173;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i282;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i251;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i242;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i216;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i245;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i283;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i284;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i285;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i286;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i287;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i288;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i217;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i243;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i253;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i317;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i303;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i43;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i138;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i137;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i168;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i169;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i197;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i24;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i99;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i98;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i182;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i183;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i190;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i184;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i185;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i188;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i186;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i187;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i270;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i19;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i53;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i52;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i116;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i250;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i111;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i110;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i198;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i247;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i26;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i95;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i94;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i193;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i215;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i12;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i107;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i106;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i175;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i299;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i18;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i51;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i50;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i134;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i252;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i17;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i72;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i71;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i76;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i232;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i112;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i234;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i233;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i309;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i310;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i316;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i311;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i312;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i313;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i314;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i315;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i322;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i10;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i57;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i56;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i113;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i133;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i23;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i127;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i126;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i244;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i263;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i55;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i54;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i58;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i103;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i34;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i163;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i162;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i170;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i269;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i104;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i201;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i200;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i298;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i323;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i44;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i74;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i73;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i223;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i224;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i225;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i226;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i248;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i308;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i119;
import '../cache_services/prefs_consumer.dart' as _i121;
import '../cache_services/secure_storage_consumer.dart' as _i120;
import '../maps/location_services.dart' as _i115;
import 'di_container.dart' as _i324;

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
  gh.lazySingleton<_i10.DelayAfterInstallDatasource>(
      () => _i10.DelayAfterInstallDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i11.PendingInvoicesDatasource>(
      () => _i11.PendingInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i12.ProductsSalesReportsDatasource>(
      () => _i12.ProductsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i13.GreetingCommunicationDatasource>(
      () => _i13.GreetingCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i14.AgentsDistributorsActionsDataSource>(() =>
      _i14.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i15.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i16.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i17.ClientsInstallReportsDatasource>(
      () => _i17.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i18.RegionsSalesReportsDatasource>(
      () => _i18.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i19.ClientsDebtsReportsDatasource>(
      () => _i19.ClientsDebtsReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.PreviousRatingsDatasource>(
      () => _i20.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.ClientsAcceptDatasource>(
      () => _i21.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.ClientsStatusReportsDatasource>(
      () => _i22.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.DelayInstallReportsDatasource>(
      () => _i23.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.ParticipatesListDatasource>(
      () => _i24.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.PeriodicCommunicationDatasource>(
      () => _i25.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.EmployeesSalesReportsDatasource>(
      () => _i26.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.ManageWithdrawalsDatasource>(
      () => _i27.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.ClientsAcceptRepository>(() =>
      _i29.ClientsAcceptRepositoryImpl(gh<_i21.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i30.ClientsDebtsDatasource>(
      () => _i30.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.FinancePendingDatasource>(
      () => _i31.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.InstallQualityDatasource>(
      () => _i32.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.TicketsDataSource>(
      () => _i33.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i34.SupportClientsInvoicesDatasource>(
      () => _i34.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i35.UsersDatasource>(
      () => _i35.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i15.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i16.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i36.ClientsTransferApprovalsDatasource>(
      () => _i36.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i37.ExceededClientsDatasource>(
      () => _i37.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i38.AppDatasource>(
      () => _i38.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i39.CommunicationListDatasource>(
      () => _i39.CommunicationListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i40.PrivilegeDatasource>(
      () => _i40.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i41.ClientsListDatasource>(
      () => _i41.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i42.CommentCompanyDatasource>(
      () => _i42.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i43.LinkDatasource>(
      () => _i43.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i44.TaskDatasource>(
      () => _i44.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.UsersDatasource>(
      () => _i45.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i46.CitiesDatasource>(
      () => _i46.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i47.AdvancedConfigsDatasource>(
      () => _i47.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i48.TicketsRepo>(
      () => _i49.TicketsRepoImpl(gh<_i33.TicketsDataSource>()));
  gh.lazySingleton<_i50.RegionsSalesReportsRepo>(() =>
      _i51.RegionsSalesReportsRepoImpl(
          gh<_i18.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i52.ClientsDebtsReportsRepo>(() =>
      _i53.ClientsDebtsReportsRepoImpl(
          gh<_i19.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i54.SupportClientsAcceptRepository>(() =>
      _i55.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i56.DelayAfterInstallRepo>(() =>
      _i57.DelayAfterInstallRepoImpl(gh<_i10.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i58.GetSupportClientsAcceptUseCase>(() =>
      _i58.GetSupportClientsAcceptUseCase(
          gh<_i54.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i59.UsersRepository>(
      () => _i60.UsersRepositoryImpl(gh<_i45.UsersDatasource>()));
  gh.lazySingleton<_i61.UsersRepository>(
      () => _i62.UsersRepositoryImpl(gh<_i35.UsersDatasource>()));
  gh.lazySingleton<_i63.GeneralConfigsDatasource>(
      () => _i63.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i64.FinancePendingRepo>(
      () => _i65.FinancePendingRepoImpl(gh<_i31.FinancePendingDatasource>()));
  gh.lazySingleton<_i66.PendingInvoicesRepo>(
      () => _i67.PendingInvoicesRepoImpl(gh<_i11.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i68.ExceededClientsRepo>(
      () => _i69.ExceededClientsRepoImpl(gh<_i37.ExceededClientsDatasource>()));
  gh.factory<_i70.ActionUserUsecase>(
      () => _i70.ActionUserUsecase(gh<_i61.UsersRepository>()));
  gh.lazySingleton<_i71.ClientsInstallReportsRepo>(() =>
      _i72.ClientsInstallReportsRepoImpl(
          gh<_i17.ClientsInstallReportsDatasource>()));
  gh.factory<_i73.TaskRepository>(
      () => _i74.TaskRepositoryImpl(gh<_i44.TaskDatasource>()));
  gh.lazySingleton<_i75.AgentsDistributorsDataSource>(
      () => _i75.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i76.GetClientsInstallReportsUsecase>(() =>
      _i76.GetClientsInstallReportsUsecase(
          gh<_i71.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i77.PreviousRatingsRepo>(
      () => _i78.PreviousRatingsRepoImpl(gh<_i20.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i79.SupportTabDataSource>(
      () => _i79.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i80.GetUsersUsecase>(
      () => _i80.GetUsersUsecase(gh<_i59.UsersRepository>()));
  gh.lazySingleton<_i81.GetPendingInvoicesUsecase>(
      () => _i81.GetPendingInvoicesUsecase(gh<_i66.PendingInvoicesRepo>()));
  gh.lazySingleton<_i82.InvoicesTabDataSource>(
      () => _i82.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i83.CitiesRepository>(
      () => _i84.CitiesRepositoryImpl(gh<_i46.CitiesDatasource>()));
  gh.lazySingleton<_i85.GetCitiesUseCase>(
      () => _i85.GetCitiesUseCase(gh<_i83.CitiesRepository>()));
  gh.lazySingleton<_i86.AddTicketUseCase>(
      () => _i86.AddTicketUseCase(gh<_i48.TicketsRepo>()));
  gh.lazySingleton<_i87.EditTicketTypeUseCase>(
      () => _i87.EditTicketTypeUseCase(gh<_i48.TicketsRepo>()));
  gh.lazySingleton<_i88.GetClientTicketsUseCase>(
      () => _i88.GetClientTicketsUseCase(gh<_i48.TicketsRepo>()));
  gh.lazySingleton<_i89.GetTicketsUseCase>(
      () => _i89.GetTicketsUseCase(gh<_i48.TicketsRepo>()));
  gh.lazySingleton<_i90.GetTicketByIdUseCase>(
      () => _i90.GetTicketByIdUseCase(gh<_i48.TicketsRepo>()));
  gh.lazySingleton<_i91.TransferTicketUseCase>(
      () => _i91.TransferTicketUseCase(gh<_i48.TicketsRepo>()));
  gh.factory<_i92.TicketsCubit>(() => _i92.TicketsCubit(
        gh<_i89.GetTicketsUseCase>(),
        gh<_i90.GetTicketByIdUseCase>(),
        gh<_i88.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i93.LoginRemoteDataSource>(
      () => _i93.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i94.EmployeesSalesReportsRepo>(() =>
      _i95.EmployeesSalesReportsRepoImpl(
          gh<_i26.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i96.AdvancedConfigsRepository>(() =>
      _i97.AdvancedConfigsRepositoryImpl(gh<_i47.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i98.ParticipateListRepository>(() =>
      _i99.ParticipateListRepositoryImpl(
          gh<_i24.ParticipatesListDatasource>()));
  gh.lazySingleton<_i100.LatestClientsUpdatesDatasource>(
      () => _i100.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i101.InvoicesSectionRepo>(
      () => _i102.InvoicesTabRepoImpl(gh<_i82.InvoicesTabDataSource>()));
  gh.factory<_i103.SupportClientsAcceptCubit>(() =>
      _i103.SupportClientsAcceptCubit(
          gh<_i58.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i104.WaitingAgentsDataSource>(
      () => _i104.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i105.GetFinancePendingInvoicesUsecase>(() =>
      _i105.GetFinancePendingInvoicesUsecase(gh<_i64.FinancePendingRepo>()));
  gh.lazySingleton<_i106.ProductsSalesReportsRepo>(() =>
      _i107.ProductsSalesReportsRepoImpl(
          gh<_i12.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i108.AgentsDistributorsProfileDataSource>(() =>
      _i108.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i109.EditTicketCubit>(() => _i109.EditTicketCubit(
        gh<_i87.EditTicketTypeUseCase>(),
        gh<_i91.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i110.ClientsStatusReportsRepo>(() =>
      _i111.ClientsStatusReportsRepoImpl(
          gh<_i22.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i112.DatesTableDataSource>(
      () => _i112.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i113.GetDelayAfterInstallUseCase>(() =>
      _i113.GetDelayAfterInstallUseCase(gh<_i56.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i114.RegionsDatasource>(
      () => _i114.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i115.LocationServices>(
      () => _i115.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i116.GetClientsDebtsReportsUsecase>(() =>
      _i116.GetClientsDebtsReportsUsecase(gh<_i52.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i117.GreetingCommunicationRepo>(() =>
      _i118.GreetingCommunicationRepoImpl(
          gh<_i13.GreetingCommunicationDatasource>()));
  gh.singleton<_i119.CacheServices>(
    () => _i120.SecureStorageConsumer(gh<_i16.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i119.CacheServices>(() async =>
      _i121.PrefsConsumer(await gh.getAsync<_i15.SharedPreferences>()));
  gh.lazySingleton<_i122.InstallQualityRepo>(
      () => _i123.InstallQualityRepoImpl(gh<_i32.InstallQualityDatasource>()));
  gh.factory<_i124.PrivilegeRepository>(
      () => _i125.PrivilegeRepositoryImpl(gh<_i40.PrivilegeDatasource>()));
  gh.lazySingleton<_i126.DelayInstallReportsRepo>(() =>
      _i127.DelayInstallReportsRepoImpl(
          gh<_i23.DelayInstallReportsDatasource>()));
  gh.factory<_i128.AppRepository>(
      () => _i129.AppRepositoryImpl(gh<_i38.AppDatasource>()));
  gh.lazySingleton<_i130.AgentsDistributorsActionsRepo>(() =>
      _i131.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i132.FinancePendingCubit>(() =>
      _i132.FinancePendingCubit(gh<_i105.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i133.DelayAfterInstallCubit>(() =>
      _i133.DelayAfterInstallCubit(gh<_i113.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i134.GetRegionsSalesReportsUsecase>(() =>
      _i134.GetRegionsSalesReportsUsecase(gh<_i50.RegionsSalesReportsRepo>()));
  gh.lazySingleton<_i135.SupportTabRepo>(
      () => _i136.SupportTabRepoImpl(gh<_i79.SupportTabDataSource>()));
  gh.factory<_i137.LinksImportantRepository>(
      () => _i138.LinkRepositoryImpl(gh<_i43.LinkDatasource>()));
  gh.lazySingleton<_i139.GetInvoicesByPrivilegesUsecase>(() =>
      _i139.GetInvoicesByPrivilegesUsecase(gh<_i101.InvoicesSectionRepo>()));
  gh.lazySingleton<_i140.GetClientsAcceptUseCase>(
      () => _i140.GetClientsAcceptUseCase(gh<_i28.ClientsAcceptRepository>()));
  gh.lazySingleton<_i141.GeneralConfigsRepository>(() =>
      _i142.GeneralConfigsRepositoryImpl(gh<_i63.GeneralConfigsDatasource>()));
  gh.factory<_i143.CompanyRepository>(
      () => _i144.CompanyRepositoryImpl(gh<_i42.CommentCompanyDatasource>()));
  gh.lazySingleton<_i145.GetInstallUseCase>(
      () => _i145.GetInstallUseCase(gh<_i122.InstallQualityRepo>()));
  gh.lazySingleton<_i146.AgentsDistributorsProfileRepo>(() =>
      _i147.AgentsDistributorsProfileRepoImpl(
          gh<_i108.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i148.AddDateInstallUsecase>(
      () => _i148.AddDateInstallUsecase(gh<_i135.SupportTabRepo>()));
  gh.lazySingleton<_i149.CancelDateInstallUsecase>(
      () => _i149.CancelDateInstallUsecase(gh<_i135.SupportTabRepo>()));
  gh.lazySingleton<_i150.GetInvoiceByClientUsecase>(
      () => _i150.GetInvoiceByClientUsecase(gh<_i135.SupportTabRepo>()));
  gh.lazySingleton<_i151.ReceiveDeviceUsecase>(
      () => _i151.ReceiveDeviceUsecase(gh<_i135.SupportTabRepo>()));
  gh.lazySingleton<_i152.ReturnInvoiceApproveUsecase>(
      () => _i152.ReturnInvoiceApproveUsecase(gh<_i135.SupportTabRepo>()));
  gh.lazySingleton<_i153.SetDateDoneUsecase>(
      () => _i153.SetDateDoneUsecase(gh<_i135.SupportTabRepo>()));
  gh.lazySingleton<_i154.SetReadyInstallUsecase>(
      () => _i154.SetReadyInstallUsecase(gh<_i135.SupportTabRepo>()));
  gh.lazySingleton<_i155.GetAllUsersUseCase>(
      () => _i155.GetAllUsersUseCase(gh<_i101.InvoicesSectionRepo>()));
  gh.lazySingleton<_i156.ClientsDebtsRepo>(
      () => _i157.ClientsDebtsRepoImpl(gh<_i30.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i158.PeriodicCommunicationRepo>(() =>
      _i159.PeriodicCommunicationRepoImpl(
          gh<_i25.PeriodicCommunicationDatasource>()));
  gh.factory<_i160.CommunicationListRepository>(() =>
      _i161.CommunicationListRepositoryImpl(
          gh<_i39.CommunicationListDatasource>()));
  gh.lazySingleton<_i162.SupportClientsInvoicesRepo>(() =>
      _i163.SupportClientsInvoicesRepoImpl(
          gh<_i34.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i164.GetBranchesForUserUsecase>(
      () => _i164.GetBranchesForUserUsecase(gh<_i61.UsersRepository>()));
  gh.lazySingleton<_i165.GetLevelsForUserUsecase>(
      () => _i165.GetLevelsForUserUsecase(gh<_i61.UsersRepository>()));
  gh.lazySingleton<_i166.GetManagesForUserUsecase>(
      () => _i166.GetManagesForUserUsecase(gh<_i61.UsersRepository>()));
  gh.factory<_i167.GetUsersUsecase>(
      () => _i167.GetUsersUsecase(gh<_i61.UsersRepository>()));
  gh.factory<_i168.ActionLinkUsecase>(
      () => _i168.ActionLinkUsecase(gh<_i137.LinksImportantRepository>()));
  gh.factory<_i169.GetLinkUsecase>(
      () => _i169.GetLinkUsecase(gh<_i137.LinksImportantRepository>()));
  gh.lazySingleton<_i170.GetSupportClientsInvoicesUseCase>(() =>
      _i170.GetSupportClientsInvoicesUseCase(
          gh<_i162.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i171.ManageWithdrawalsRepository>(() =>
      _i172.ManageWithdrawalsRepositoryImpl(
          gh<_i27.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i173.AgentsDistributorsRepo>(() =>
      _i174.AgentsDistributorsRepoImpl(
          gh<_i75.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i175.GetProductsSalesReportsUsecase>(() =>
      _i175.GetProductsSalesReportsUsecase(
          gh<_i106.ProductsSalesReportsRepo>()));
  gh.singleton<_i176.CitiesCubit>(
      () => _i176.CitiesCubit(gh<_i85.GetCitiesUseCase>()));
  gh.lazySingleton<_i177.RegionsRepository>(
      () => _i178.RegionsRepositoryImpl(gh<_i114.RegionsDatasource>()));
  gh.factory<_i179.UsersTypeCubit>(
      () => _i179.UsersTypeCubit(gh<_i80.GetUsersUsecase>()));
  gh.factory<_i180.ClientsListRepository>(
      () => _i181.ClientsListRepositoryImpl(gh<_i41.ClientsListDatasource>()));
  gh.factory<_i182.AddParticipateCommentUsecase>(() =>
      _i182.AddParticipateCommentUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i183.AddParticipateUserUsecase>(() =>
      _i183.AddParticipateUserUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i184.EditParticipateUserUsecase>(() =>
      _i184.EditParticipateUserUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i185.GetInvoiceByIdUsecase>(
      () => _i185.GetInvoiceByIdUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i186.ParticipateClientListUsecase>(() =>
      _i186.ParticipateClientListUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i187.ParticipateCommentListUsecase>(() =>
      _i187.ParticipateCommentListUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i188.ParticipateInvoiceListUsecase>(() =>
      _i188.ParticipateInvoiceListUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i189.ParticipateListUsecase>(
      () => _i189.ParticipateListUsecase(gh<_i98.ParticipateListRepository>()));
  gh.lazySingleton<_i190.ChangeParticipateStatusUsecase>(() =>
      _i190.ChangeParticipateStatusUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i191.PendingInvoicesCubit>(
      () => _i191.PendingInvoicesCubit(gh<_i81.GetPendingInvoicesUsecase>()));
  gh.factory<_i192.GetCommunicationListUsecase>(() =>
      _i192.GetCommunicationListUsecase(
          gh<_i160.CommunicationListRepository>()));
  gh.lazySingleton<_i193.GetEmployeesSalesReportsUsecase>(() =>
      _i193.GetEmployeesSalesReportsUsecase(
          gh<_i94.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i194.GetGreetingCommunicationUseCase>(() =>
      _i194.GetGreetingCommunicationUseCase(
          gh<_i117.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i195.ClientsTransferApprovalsRepo>(() =>
      _i196.ClientsTransferApprovalsRepoImpl(
          gh<_i36.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i197.LinkCubit>(() => _i197.LinkCubit(
        gh<_i169.GetLinkUsecase>(),
        gh<_i168.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i198.GetClientsStatusReportsUsecase>(() =>
      _i198.GetClientsStatusReportsUsecase(
          gh<_i110.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i199.GetPreviousRatingsUsecase>(
      () => _i199.GetPreviousRatingsUsecase(gh<_i77.PreviousRatingsRepo>()));
  gh.lazySingleton<_i200.WaitingAgentsRepo>(
      () => _i201.WaitingAgentsRepoImpl(gh<_i104.WaitingAgentsDataSource>()));
  gh.factory<_i202.AddClientUserUsecase>(
      () => _i202.AddClientUserUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i203.ApproveRejectClientUsecase>(() =>
      _i203.ApproveRejectClientUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i204.ChangeTypeClientUsecase>(
      () => _i204.ChangeTypeClientUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i205.EditClientUserUsecase>(
      () => _i205.EditClientUserUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i206.GetClientsListByRegionUseCase>(() =>
      _i206.GetClientsListByRegionUseCase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i207.GetClientsListByUserUseCase>(() =>
      _i207.GetClientsListByUserUseCase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i208.GetClientsWithFilterUserUsecase>(() =>
      _i208.GetClientsWithFilterUserUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i209.GetClientMarketingReportUsecase>(() =>
      _i209.GetClientMarketingReportUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i210.GetRecommendedClientsUsecase>(() =>
      _i210.GetRecommendedClientsUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i211.GetSimilarClientsUsecase>(
      () => _i211.GetSimilarClientsUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i212.ReceiveClientUserUsecase>(
      () => _i212.ReceiveClientUserUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i213.TransferClientUserUsecase>(
      () => _i213.TransferClientUserUsecase(gh<_i180.ClientsListRepository>()));
  gh.lazySingleton<_i214.GetHighSimilarClientsUsecase>(() =>
      _i214.GetHighSimilarClientsUsecase(gh<_i180.ClientsListRepository>()));
  gh.factory<_i215.EmployeesSalesReportsCubit>(() =>
      _i215.EmployeesSalesReportsCubit(
          gh<_i193.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i216.ChangeStateAgentUseCase>(
      () => _i216.ChangeStateAgentUseCase(gh<_i173.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i217.GetAgentsAndDistributorsUseCase>(() =>
      _i217.GetAgentsAndDistributorsUseCase(
          gh<_i173.AgentsDistributorsRepo>()));
  gh.factory<_i218.ClientsAcceptCubit>(
      () => _i218.ClientsAcceptCubit(gh<_i140.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i219.CancelWithdrawalUsecase>(() =>
      _i219.CancelWithdrawalUsecase(gh<_i171.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i220.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i220.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i171.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i221.GetWithdrawalsInvoicesUsecase>(() =>
      _i221.GetWithdrawalsInvoicesUsecase(
          gh<_i171.ManageWithdrawalsRepository>()));
  gh.factory<_i222.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i222.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i171.ManageWithdrawalsRepository>()));
  gh.factory<_i223.AddTaskUsecase>(
      () => _i223.AddTaskUsecase(gh<_i73.TaskRepository>()));
  gh.factory<_i224.ChangeStatusTaskUsecase>(
      () => _i224.ChangeStatusTaskUsecase(gh<_i73.TaskRepository>()));
  gh.factory<_i225.FilterTaskUsecase>(
      () => _i225.FilterTaskUsecase(gh<_i73.TaskRepository>()));
  gh.factory<_i226.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i226.GetUsersByDepartmentAndRegionUsecase(gh<_i73.TaskRepository>()));
  gh.lazySingleton<_i227.ExceededClientsUseCase>(
      () => _i227.ExceededClientsUseCase(gh<_i68.ExceededClientsRepo>()));
  gh.lazySingleton<_i228.TransferExceededClientsUseCase>(() =>
      _i228.TransferExceededClientsUseCase(gh<_i68.ExceededClientsRepo>()));
  gh.lazySingleton<_i229.LoginLocalDataSource>(() =>
      _i229.LoginLocalDataSourceImpl(
          gh<_i119.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i230.EditAdvancedConfigsUsecase>(() =>
      _i230.EditAdvancedConfigsUsecase(gh<_i96.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i231.GetAdvancedConfigsUsecase>(() =>
      _i231.GetAdvancedConfigsUsecase(gh<_i96.AdvancedConfigsRepository>()));
  gh.factory<_i232.ClientsInstallReportsCubit>(() =>
      _i232.ClientsInstallReportsCubit(
          gh<_i76.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i233.DatesTableRepo>(
      () => _i234.DatesTableRepoImpl(gh<_i112.DatesTableDataSource>()));
  gh.factory<_i235.GetVersionUseCase>(
      () => _i235.GetVersionUseCase(gh<_i128.AppRepository>()));
  gh.factory<_i236.AddTicketCubit>(
      () => _i236.AddTicketCubit(gh<_i86.AddTicketUseCase>()));
  gh.lazySingleton<_i237.LatestClientsUpdatesRepository>(() =>
      _i238.LatestClientsUpdatesRepositoryImpl(
          gh<_i100.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i239.EditGeneralConfigsUsecase>(() =>
      _i239.EditGeneralConfigsUsecase(gh<_i141.GeneralConfigsRepository>()));
  gh.lazySingleton<_i240.GetGeneralConfigsUsecase>(() =>
      _i240.GetGeneralConfigsUsecase(gh<_i141.GeneralConfigsRepository>()));
  gh.factory<_i241.InstallQualityCubit>(
      () => _i241.InstallQualityCubit(gh<_i145.GetInstallUseCase>()));
  gh.lazySingleton<_i242.AddAgentUseCase>(
      () => _i242.AddAgentUseCase(gh<_i130.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i243.UpdateAgentUseCase>(() =>
      _i243.UpdateAgentUseCase(gh<_i130.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i244.GetDelayInstallReportsUseCase>(() =>
      _i244.GetDelayInstallReportsUseCase(gh<_i126.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i245.CrudAgentSupportFilesUsecase>(() =>
      _i245.CrudAgentSupportFilesUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i246.GetClientsTransferApprovalsUsecase>(() =>
      _i246.GetClientsTransferApprovalsUsecase(
          gh<_i195.ClientsTransferApprovalsRepo>()));
  gh.factory<_i247.ClientsStatusReportsCubit>(() =>
      _i247.ClientsStatusReportsCubit(
          gh<_i198.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i248.TaskCubit>(() => _i248.TaskCubit(
        gh<_i223.AddTaskUsecase>(),
        gh<_i225.FilterTaskUsecase>(),
        gh<_i224.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i249.SupportTabCubit>(() => _i249.SupportTabCubit(
        gh<_i150.GetInvoiceByClientUsecase>(),
        gh<_i148.AddDateInstallUsecase>(),
        gh<_i153.SetDateDoneUsecase>(),
        gh<_i154.SetReadyInstallUsecase>(),
        gh<_i152.ReturnInvoiceApproveUsecase>(),
        gh<_i151.ReceiveDeviceUsecase>(),
        gh<_i149.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i250.ClientsDebtsReportsCubit>(() =>
      _i250.ClientsDebtsReportsCubit(
          gh<_i116.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i251.AddAgentDateUseCase>(() =>
      _i251.AddAgentDateUseCase(gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.factory<_i252.RegionsSalesReportsCubit>(() =>
      _i252.RegionsSalesReportsCubit(
          gh<_i134.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i253.AgentsDistributorsActionsCubit>(
      () => _i253.AgentsDistributorsActionsCubit(
            gh<_i85.GetCitiesUseCase>(),
            gh<_i242.AddAgentUseCase>(),
            gh<_i243.UpdateAgentUseCase>(),
          ));
  gh.factory<_i254.InvoicesSectionCubit>(() => _i254.InvoicesSectionCubit(
        gh<_i139.GetInvoicesByPrivilegesUsecase>(),
        gh<_i217.GetAgentsAndDistributorsUseCase>(),
        gh<_i189.ParticipateListUsecase>(),
        gh<_i155.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i255.LoginRepo>(() => _i256.LoginRepoImpl(
        gh<_i93.LoginRemoteDataSource>(),
        gh<_i229.LoginLocalDataSource>(),
      ));
  gh.factory<_i257.AddLevelUsecase>(
      () => _i257.AddLevelUsecase(gh<_i124.PrivilegeRepository>()));
  gh.factory<_i258.GetLevelsUsecase>(
      () => _i258.GetLevelsUsecase(gh<_i124.PrivilegeRepository>()));
  gh.factory<_i259.GetPrivilegesUsecase>(
      () => _i259.GetPrivilegesUsecase(gh<_i124.PrivilegeRepository>()));
  gh.factory<_i260.UpdatePrivilegeUsecase>(
      () => _i260.UpdatePrivilegeUsecase(gh<_i124.PrivilegeRepository>()));
  gh.factory<_i261.AddCommentUsecase>(
      () => _i261.AddCommentUsecase(gh<_i143.CompanyRepository>()));
  gh.factory<_i262.GetCommentUsecase>(
      () => _i262.GetCommentUsecase(gh<_i143.CompanyRepository>()));
  gh.factory<_i263.DelayInstallReportsCubit>(() =>
      _i263.DelayInstallReportsCubit(
          gh<_i244.GetDelayInstallReportsUseCase>()));
  gh.factory<_i264.GreetingCommunicationCubit>(() =>
      _i264.GreetingCommunicationCubit(
          gh<_i194.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i265.GetRegionsByIdCountryUseCase>(
      () => _i265.GetRegionsByIdCountryUseCase(gh<_i177.RegionsRepository>()));
  gh.lazySingleton<_i266.PrivilegeCubit>(() => _i266.PrivilegeCubit(
        gh<_i258.GetLevelsUsecase>(),
        gh<_i259.GetPrivilegesUsecase>(),
        gh<_i260.UpdatePrivilegeUsecase>(),
        gh<_i257.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i267.GetLatestClientsUseCase>(() =>
      _i267.GetLatestClientsUseCase(
          gh<_i237.LatestClientsUpdatesRepository>()));
  gh.factory<_i268.AdvancedCofigsCubit>(() => _i268.AdvancedCofigsCubit(
        gh<_i231.GetAdvancedConfigsUsecase>(),
        gh<_i230.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i269.SupportClientsInvoicesCubit>(() =>
      _i269.SupportClientsInvoicesCubit(
          gh<_i170.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i270.ParticipateListBloc>(() => _i270.ParticipateListBloc(
        gh<_i189.ParticipateListUsecase>(),
        gh<_i183.AddParticipateUserUsecase>(),
        gh<_i184.EditParticipateUserUsecase>(),
        gh<_i186.ParticipateClientListUsecase>(),
        gh<_i188.ParticipateInvoiceListUsecase>(),
        gh<_i185.GetInvoiceByIdUsecase>(),
        gh<_i187.ParticipateCommentListUsecase>(),
        gh<_i182.AddParticipateCommentUsecase>(),
        gh<_i190.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i271.CacheTokenUsecase>(
      () => _i271.CacheTokenUsecase(gh<_i255.LoginRepo>()));
  gh.lazySingleton<_i272.GetTokenUsecase>(
      () => _i272.GetTokenUsecase(gh<_i255.LoginRepo>()));
  gh.lazySingleton<_i273.LoginUsecase>(
      () => _i273.LoginUsecase(gh<_i255.LoginRepo>()));
  gh.lazySingleton<_i274.ValidateTokenUsecase>(
      () => _i274.ValidateTokenUsecase(gh<_i255.LoginRepo>()));
  gh.lazySingleton<_i275.VerifyOtpUsecase>(
      () => _i275.VerifyOtpUsecase(gh<_i255.LoginRepo>()));
  gh.factory<_i276.ClientsTransferApprovalsCubit>(() =>
      _i276.ClientsTransferApprovalsCubit(
          gh<_i246.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i277.GeneralCofigsCubit>(() => _i277.GeneralCofigsCubit(
        gh<_i240.GetGeneralConfigsUsecase>(),
        gh<_i239.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i278.GetPeriodicCommunicationUseCase>(() =>
      _i278.GetPeriodicCommunicationUseCase(
          gh<_i158.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i279.GetClientsDebtsUsecase>(
      () => _i279.GetClientsDebtsUsecase(gh<_i156.ClientsDebtsRepo>()));
  gh.lazySingleton<_i280.CrudClientSupportFilesUsecase>(() =>
      _i280.CrudClientSupportFilesUsecase(
          repository: gh<_i180.ClientsListRepository>()));
  gh.lazySingleton<_i281.GetClientSupportFilesUsecase>(() =>
      _i281.GetClientSupportFilesUsecase(
          repository: gh<_i180.ClientsListRepository>()));
  gh.lazySingleton<_i282.AddAgentCommentUsecase>(() =>
      _i282.AddAgentCommentUsecase(gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i283.DoneTrainingUsecase>(() =>
      _i283.DoneTrainingUsecase(gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i284.GetAgentUsecase>(
      () => _i284.GetAgentUsecase(gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i285.GetAgentClientListUsecase>(() =>
      _i285.GetAgentClientListUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i286.GetAgentCommentsListUsecase>(() =>
      _i286.GetAgentCommentsListUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i287.GetAgentDatesListUsecase>(() =>
      _i287.GetAgentDatesListUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i288.GetAgentInvoiceListUsecase>(() =>
      _i288.GetAgentInvoiceListUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.factory<_i289.AddRejectReasonsUsecase>(() =>
      _i289.AddRejectReasonsUsecase(gh<_i171.ManageWithdrawalsRepository>()));
  gh.factory<_i290.EditRejectReasonsUsecase>(() =>
      _i290.EditRejectReasonsUsecase(gh<_i171.ManageWithdrawalsRepository>()));
  gh.factory<_i291.GetRejectReasonsUsecase>(() =>
      _i291.GetRejectReasonsUsecase(gh<_i171.ManageWithdrawalsRepository>()));
  gh.factory<_i292.GetUserSeriesUsecase>(() =>
      _i292.GetUserSeriesUsecase(gh<_i171.ManageWithdrawalsRepository>()));
  gh.factory<_i293.GetWithdrawnDetailsUsecase>(() =>
      _i293.GetWithdrawnDetailsUsecase(
          gh<_i171.ManageWithdrawalsRepository>()));
  gh.factory<_i294.SetApproveSeriesUsecase>(() =>
      _i294.SetApproveSeriesUsecase(gh<_i171.ManageWithdrawalsRepository>()));
  gh.factory<_i295.UpdateSeriesUsecase>(
      () => _i295.UpdateSeriesUsecase(gh<_i171.ManageWithdrawalsRepository>()));
  gh.singleton<_i296.AppManagerCubit>(
      () => _i296.AppManagerCubit(gh<_i235.GetVersionUseCase>()));
  gh.factory<_i297.RegionsCubit>(
      () => _i297.RegionsCubit(gh<_i265.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i298.GetWaitingAgentsUsecase>(
      () => _i298.GetWaitingAgentsUsecase(gh<_i200.WaitingAgentsRepo>()));
  gh.factory<_i299.ProductsSalesReportsCubit>(() =>
      _i299.ProductsSalesReportsCubit(
          gh<_i175.GetProductsSalesReportsUsecase>()));
  gh.factory<_i300.UsersCubit>(() => _i300.UsersCubit(
        gh<_i167.GetUsersUsecase>(),
        gh<_i70.ActionUserUsecase>(),
        gh<_i226.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i166.GetManagesForUserUsecase>(),
        gh<_i165.GetLevelsForUserUsecase>(),
        gh<_i164.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i301.PreviousRatingsCubit>(
      () => _i301.PreviousRatingsCubit(gh<_i199.GetPreviousRatingsUsecase>()));
  gh.factory<_i302.CommunicationListBloc>(() =>
      _i302.CommunicationListBloc(gh<_i192.GetCommunicationListUsecase>()));
  gh.factory<_i303.AgentsDistributorsCubit>(() => _i303.AgentsDistributorsCubit(
        gh<_i217.GetAgentsAndDistributorsUseCase>(),
        gh<_i216.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i304.ExceededClientsCubit>(() => _i304.ExceededClientsCubit(
        gh<_i227.ExceededClientsUseCase>(),
        gh<_i228.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i305.ManageWithdrawalsCubit>(() => _i305.ManageWithdrawalsCubit(
        gh<_i292.GetUserSeriesUsecase>(),
        gh<_i295.UpdateSeriesUsecase>(),
        gh<_i167.GetUsersUsecase>(),
        gh<_i221.GetWithdrawalsInvoicesUsecase>(),
        gh<_i222.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i294.SetApproveSeriesUsecase>(),
        gh<_i293.GetWithdrawnDetailsUsecase>(),
        gh<_i289.AddRejectReasonsUsecase>(),
        gh<_i291.GetRejectReasonsUsecase>(),
        gh<_i290.EditRejectReasonsUsecase>(),
        gh<_i220.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i219.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i306.PeriodicCommunicationCubit>(() =>
      _i306.PeriodicCommunicationCubit(
          gh<_i278.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i307.LatestClientsUpdatesCubit>(() =>
      _i307.LatestClientsUpdatesCubit(gh<_i267.GetLatestClientsUseCase>()));
  gh.factory<_i308.AttachmentsRowCubit>(() => _i308.AttachmentsRowCubit(
        gh<_i281.GetClientSupportFilesUsecase>(),
        gh<_i280.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i309.CancelScheduleUsecase>(
      () => _i309.CancelScheduleUsecase(gh<_i233.DatesTableRepo>()));
  gh.lazySingleton<_i310.ChangeDateToDonUsecase>(
      () => _i310.ChangeDateToDonUsecase(gh<_i233.DatesTableRepo>()));
  gh.lazySingleton<_i311.GetDateInstallationUsecase>(
      () => _i311.GetDateInstallationUsecase(gh<_i233.DatesTableRepo>()));
  gh.lazySingleton<_i312.GetInvoicesByClientForDateUsecase>(() =>
      _i312.GetInvoicesByClientForDateUsecase(gh<_i233.DatesTableRepo>()));
  gh.lazySingleton<_i313.GetSubscribedClientsUsecase>(
      () => _i313.GetSubscribedClientsUsecase(gh<_i233.DatesTableRepo>()));
  gh.lazySingleton<_i314.RescheduleDateUsecase>(
      () => _i314.RescheduleDateUsecase(gh<_i233.DatesTableRepo>()));
  gh.lazySingleton<_i315.ReturnScheduleVisitToOpenUsecase>(
      () => _i315.ReturnScheduleVisitToOpenUsecase(gh<_i233.DatesTableRepo>()));
  gh.lazySingleton<_i316.GetCancelReasonsUsecase>(
      () => _i316.GetCancelReasonsUsecase(gh<_i233.DatesTableRepo>()));
  gh.factory<_i317.AgentsDistributorsProfileBloc>(
      () => _i317.AgentsDistributorsProfileBloc(
            gh<_i285.GetAgentClientListUsecase>(),
            gh<_i288.GetAgentInvoiceListUsecase>(),
            gh<_i185.GetInvoiceByIdUsecase>(),
            gh<_i286.GetAgentCommentsListUsecase>(),
            gh<_i282.AddAgentCommentUsecase>(),
            gh<_i283.DoneTrainingUsecase>(),
            gh<_i251.AddAgentDateUseCase>(),
            gh<_i287.GetAgentDatesListUsecase>(),
            gh<_i245.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i318.ClientsListBloc>(() => _i318.ClientsListBloc(
        gh<_i208.GetClientsWithFilterUserUsecase>(),
        gh<_i210.GetRecommendedClientsUsecase>(),
        gh<_i202.AddClientUserUsecase>(),
        gh<_i205.EditClientUserUsecase>(),
        gh<_i204.ChangeTypeClientUsecase>(),
        gh<_i211.GetSimilarClientsUsecase>(),
        gh<_i203.ApproveRejectClientUsecase>(),
        gh<_i280.CrudClientSupportFilesUsecase>(),
        gh<_i281.GetClientSupportFilesUsecase>(),
        gh<_i213.TransferClientUserUsecase>(),
        gh<_i212.ReceiveClientUserUsecase>(),
        gh<_i209.GetClientMarketingReportUsecase>(),
        gh<_i214.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i319.CompanyCubit>(() => _i319.CompanyCubit(
        gh<_i262.GetCommentUsecase>(),
        gh<_i261.AddCommentUsecase>(),
      ));
  gh.factory<_i320.ClientsDebtsCubit>(
      () => _i320.ClientsDebtsCubit(gh<_i279.GetClientsDebtsUsecase>()));
  gh.factory<_i321.LoginCubit>(() => _i321.LoginCubit(
        gh<_i273.LoginUsecase>(),
        gh<_i275.VerifyOtpUsecase>(),
        gh<_i271.CacheTokenUsecase>(),
        gh<_i272.GetTokenUsecase>(),
        gh<_i274.ValidateTokenUsecase>(),
      ));
  gh.factory<_i322.DatesTableCubit>(() => _i322.DatesTableCubit(
        gh<_i311.GetDateInstallationUsecase>(),
        gh<_i314.RescheduleDateUsecase>(),
        gh<_i310.ChangeDateToDonUsecase>(),
        gh<_i309.CancelScheduleUsecase>(),
        gh<_i315.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i313.GetSubscribedClientsUsecase>(),
        gh<_i312.GetInvoicesByClientForDateUsecase>(),
        gh<_i148.AddDateInstallUsecase>(),
        gh<_i316.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i323.WaitingAgentsCubit>(
      () => _i323.WaitingAgentsCubit(gh<_i298.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i324.AppModule {}
