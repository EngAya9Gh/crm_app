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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i37;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i128;
import '../../../features/app/domain/repositories/app_repository.dart' as _i127;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i232;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i292;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i226;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i92;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i254;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i253;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i268;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i269;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i270;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i271;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i272;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i316;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i28;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i27;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i139;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i215;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i32;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i48;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i47;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i85;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i86;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i87;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i89;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i88;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i90;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i233;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i108;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i91;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i38;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i158;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i157;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i189;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i298;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i13;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i117;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i116;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i191;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i244;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i31;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i122;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i121;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i144;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i238;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i20;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i77;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i76;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i196;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i297;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i45;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i83;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i82;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i84;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i173;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i78;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i135;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i134;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i147;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i148;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i149;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i150;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i151;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i152;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i153;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i247;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i113;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i175;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i174;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i262;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i293;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i44;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i59;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i58;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i79;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i176;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i46;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i96;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i95;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i227;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i228;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i265;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i62;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i141;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i140;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i236;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i237;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i274;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i39;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i124;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i123;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i255;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i256;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i257;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i258;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i263;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i34;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i61;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i60;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i69;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i161;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i162;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i163;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i164;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i296;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i26;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i169;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i168;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i285;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i216;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i286;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i217;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i287;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i288;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i219;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i218;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i289;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i290;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i291;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i301;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i29;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i156;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i155;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i275;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i315;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i40;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i178;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i177;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i199;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i200;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i201;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i276;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i202;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i206;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i277;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i203;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i204;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i205;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i211;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i207;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i208;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i209;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i210;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i313;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i35;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i193;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i192;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i243;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i273;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i30;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i64;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i63;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i104;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i131;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i99;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i235;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i234;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i264;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i302;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i11;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i66;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i65;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i80;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i188;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i41;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i143;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i142;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i259;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i260;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i314;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i36;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i68;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i67;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i224;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i225;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i300;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i81;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i101;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i100;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i154;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i138;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i252;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i74;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i107;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i130;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i146;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i129;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i145;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i170;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i278;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i249;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i239;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i213;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i242;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i279;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i280;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i281;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i282;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i283;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i284;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i214;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i240;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i251;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i312;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i299;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i42;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i137;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i136;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i165;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i166;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i194;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i24;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i98;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i97;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i180;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i187;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i181;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i182;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i183;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i184;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i185;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i186;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i267;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i19;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i52;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i51;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i115;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i248;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i110;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i109;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i195;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i245;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i25;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i94;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i93;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i190;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i212;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i12;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i106;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i105;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i172;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i295;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i18;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i50;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i49;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i133;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i250;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i17;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i71;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i70;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i75;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i229;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i111;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i231;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i230;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i304;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i305;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i311;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i306;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i307;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i308;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i309;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i310;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i317;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i10;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i56;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i55;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i112;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i132;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i23;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i126;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i125;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i241;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i261;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i54;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i53;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i57;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i102;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i33;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i160;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i159;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i167;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i266;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i103;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i198;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i197;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i294;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i318;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i43;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i73;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i72;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i220;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i221;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i222;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i223;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i246;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i303;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i118;
import '../cache_services/prefs_consumer.dart' as _i120;
import '../cache_services/secure_storage_consumer.dart' as _i119;
import '../maps/location_services.dart' as _i114;
import 'di_container.dart' as _i319;

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
  gh.lazySingleton<_i25.EmployeesSalesReportsDatasource>(
      () => _i25.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.ManageWithdrawalsDatasource>(
      () => _i26.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.ClientsAcceptRepository>(() =>
      _i28.ClientsAcceptRepositoryImpl(gh<_i21.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i29.ClientsDebtsDatasource>(
      () => _i29.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.FinancePendingDatasource>(
      () => _i30.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.InstallQualityDatasource>(
      () => _i31.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.TicketsDataSource>(
      () => _i32.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.SupportClientsInvoicesDatasource>(
      () => _i33.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i34.UsersDatasource>(
      () => _i34.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i15.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i16.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i35.ClientsTransferApprovalsDatasource>(
      () => _i35.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i36.ExceededClientsDatasource>(
      () => _i36.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i37.AppDatasource>(
      () => _i37.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i38.CommunicationListDatasource>(
      () => _i38.CommunicationListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i39.PrivilegeDatasource>(
      () => _i39.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i40.ClientsListDatasource>(
      () => _i40.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i41.CommentCompanyDatasource>(
      () => _i41.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i42.LinkDatasource>(
      () => _i42.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i43.TaskDatasource>(
      () => _i43.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.UsersDatasource>(
      () => _i44.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.CitiesDatasource>(
      () => _i45.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i46.AdvancedConfigsDatasource>(
      () => _i46.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i47.TicketsRepo>(
      () => _i48.TicketsRepoImpl(gh<_i32.TicketsDataSource>()));
  gh.lazySingleton<_i49.RegionsSalesReportsRepo>(() =>
      _i50.RegionsSalesReportsRepoImpl(
          gh<_i18.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i51.ClientsDebtsReportsRepo>(() =>
      _i52.ClientsDebtsReportsRepoImpl(
          gh<_i19.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i53.SupportClientsAcceptRepository>(() =>
      _i54.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i55.DelayAfterInstallRepo>(() =>
      _i56.DelayAfterInstallRepoImpl(gh<_i10.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i57.GetSupportClientsAcceptUseCase>(() =>
      _i57.GetSupportClientsAcceptUseCase(
          gh<_i53.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i58.UsersRepository>(
      () => _i59.UsersRepositoryImpl(gh<_i44.UsersDatasource>()));
  gh.lazySingleton<_i60.UsersRepository>(
      () => _i61.UsersRepositoryImpl(gh<_i34.UsersDatasource>()));
  gh.lazySingleton<_i62.GeneralConfigsDatasource>(
      () => _i62.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i63.FinancePendingRepo>(
      () => _i64.FinancePendingRepoImpl(gh<_i30.FinancePendingDatasource>()));
  gh.lazySingleton<_i65.PendingInvoicesRepo>(
      () => _i66.PendingInvoicesRepoImpl(gh<_i11.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i67.ExceededClientsRepo>(
      () => _i68.ExceededClientsRepoImpl(gh<_i36.ExceededClientsDatasource>()));
  gh.factory<_i69.ActionUserUsecase>(
      () => _i69.ActionUserUsecase(gh<_i60.UsersRepository>()));
  gh.lazySingleton<_i70.ClientsInstallReportsRepo>(() =>
      _i71.ClientsInstallReportsRepoImpl(
          gh<_i17.ClientsInstallReportsDatasource>()));
  gh.factory<_i72.TaskRepository>(
      () => _i73.TaskRepositoryImpl(gh<_i43.TaskDatasource>()));
  gh.lazySingleton<_i74.AgentsDistributorsDataSource>(
      () => _i74.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i75.GetClientsInstallReportsUsecase>(() =>
      _i75.GetClientsInstallReportsUsecase(
          gh<_i70.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i76.PreviousRatingsRepo>(
      () => _i77.PreviousRatingsRepoImpl(gh<_i20.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i78.SupportTabDataSource>(
      () => _i78.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i79.GetUsersUsecase>(
      () => _i79.GetUsersUsecase(gh<_i58.UsersRepository>()));
  gh.lazySingleton<_i80.GetPendingInvoicesUsecase>(
      () => _i80.GetPendingInvoicesUsecase(gh<_i65.PendingInvoicesRepo>()));
  gh.lazySingleton<_i81.InvoicesTabDataSource>(
      () => _i81.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i82.CitiesRepository>(
      () => _i83.CitiesRepositoryImpl(gh<_i45.CitiesDatasource>()));
  gh.lazySingleton<_i84.GetCitiesUseCase>(
      () => _i84.GetCitiesUseCase(gh<_i82.CitiesRepository>()));
  gh.lazySingleton<_i85.AddTicketUseCase>(
      () => _i85.AddTicketUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i86.EditTicketTypeUseCase>(
      () => _i86.EditTicketTypeUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i87.GetClientTicketsUseCase>(
      () => _i87.GetClientTicketsUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i88.GetTicketsUseCase>(
      () => _i88.GetTicketsUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i89.GetTicketByIdUseCase>(
      () => _i89.GetTicketByIdUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i90.TransferTicketUseCase>(
      () => _i90.TransferTicketUseCase(gh<_i47.TicketsRepo>()));
  gh.factory<_i91.TicketsCubit>(() => _i91.TicketsCubit(
        gh<_i88.GetTicketsUseCase>(),
        gh<_i89.GetTicketByIdUseCase>(),
        gh<_i87.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i92.LoginRemoteDataSource>(
      () => _i92.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i93.EmployeesSalesReportsRepo>(() =>
      _i94.EmployeesSalesReportsRepoImpl(
          gh<_i25.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i95.AdvancedConfigsRepository>(() =>
      _i96.AdvancedConfigsRepositoryImpl(gh<_i46.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i97.ParticipateListRepository>(() =>
      _i98.ParticipateListRepositoryImpl(
          gh<_i24.ParticipatesListDatasource>()));
  gh.lazySingleton<_i99.LatestClientsUpdatesDatasource>(
      () => _i99.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i100.InvoicesSectionRepo>(
      () => _i101.InvoicesTabRepoImpl(gh<_i81.InvoicesTabDataSource>()));
  gh.factory<_i102.SupportClientsAcceptCubit>(() =>
      _i102.SupportClientsAcceptCubit(
          gh<_i57.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i103.WaitingAgentsDataSource>(
      () => _i103.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i104.GetFinancePendingInvoicesUsecase>(() =>
      _i104.GetFinancePendingInvoicesUsecase(gh<_i63.FinancePendingRepo>()));
  gh.lazySingleton<_i105.ProductsSalesReportsRepo>(() =>
      _i106.ProductsSalesReportsRepoImpl(
          gh<_i12.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i107.AgentsDistributorsProfileDataSource>(() =>
      _i107.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i108.EditTicketCubit>(() => _i108.EditTicketCubit(
        gh<_i86.EditTicketTypeUseCase>(),
        gh<_i90.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i109.ClientsStatusReportsRepo>(() =>
      _i110.ClientsStatusReportsRepoImpl(
          gh<_i22.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i111.DatesTableDataSource>(
      () => _i111.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i112.GetDelayAfterInstallUseCase>(() =>
      _i112.GetDelayAfterInstallUseCase(gh<_i55.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i113.RegionsDatasource>(
      () => _i113.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i114.LocationServices>(
      () => _i114.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i115.GetClientsDebtsReportsUsecase>(() =>
      _i115.GetClientsDebtsReportsUsecase(gh<_i51.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i116.GreetingCommunicationRepo>(() =>
      _i117.GreetingCommunicationRepoImpl(
          gh<_i13.GreetingCommunicationDatasource>()));
  gh.singleton<_i118.CacheServices>(
    () => _i119.SecureStorageConsumer(gh<_i16.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i118.CacheServices>(() async =>
      _i120.PrefsConsumer(await gh.getAsync<_i15.SharedPreferences>()));
  gh.lazySingleton<_i121.InstallQualityRepo>(
      () => _i122.InstallQualityRepoImpl(gh<_i31.InstallQualityDatasource>()));
  gh.factory<_i123.PrivilegeRepository>(
      () => _i124.PrivilegeRepositoryImpl(gh<_i39.PrivilegeDatasource>()));
  gh.lazySingleton<_i125.DelayInstallReportsRepo>(() =>
      _i126.DelayInstallReportsRepoImpl(
          gh<_i23.DelayInstallReportsDatasource>()));
  gh.factory<_i127.AppRepository>(
      () => _i128.AppRepositoryImpl(gh<_i37.AppDatasource>()));
  gh.lazySingleton<_i129.AgentsDistributorsActionsRepo>(() =>
      _i130.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i131.FinancePendingCubit>(() =>
      _i131.FinancePendingCubit(gh<_i104.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i132.DelayAfterInstallCubit>(() =>
      _i132.DelayAfterInstallCubit(gh<_i112.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i133.GetRegionsSalesReportsUsecase>(() =>
      _i133.GetRegionsSalesReportsUsecase(gh<_i49.RegionsSalesReportsRepo>()));
  gh.lazySingleton<_i134.SupportTabRepo>(
      () => _i135.SupportTabRepoImpl(gh<_i78.SupportTabDataSource>()));
  gh.factory<_i136.LinksImportantRepository>(
      () => _i137.LinkRepositoryImpl(gh<_i42.LinkDatasource>()));
  gh.lazySingleton<_i138.GetInvoicesByPrivilegesUsecase>(() =>
      _i138.GetInvoicesByPrivilegesUsecase(gh<_i100.InvoicesSectionRepo>()));
  gh.lazySingleton<_i139.GetClientsAcceptUseCase>(
      () => _i139.GetClientsAcceptUseCase(gh<_i27.ClientsAcceptRepository>()));
  gh.lazySingleton<_i140.GeneralConfigsRepository>(() =>
      _i141.GeneralConfigsRepositoryImpl(gh<_i62.GeneralConfigsDatasource>()));
  gh.factory<_i142.CompanyRepository>(
      () => _i143.CompanyRepositoryImpl(gh<_i41.CommentCompanyDatasource>()));
  gh.lazySingleton<_i144.GetInstallUseCase>(
      () => _i144.GetInstallUseCase(gh<_i121.InstallQualityRepo>()));
  gh.lazySingleton<_i145.AgentsDistributorsProfileRepo>(() =>
      _i146.AgentsDistributorsProfileRepoImpl(
          gh<_i107.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i147.AddDateInstallUsecase>(
      () => _i147.AddDateInstallUsecase(gh<_i134.SupportTabRepo>()));
  gh.lazySingleton<_i148.CancelDateInstallUsecase>(
      () => _i148.CancelDateInstallUsecase(gh<_i134.SupportTabRepo>()));
  gh.lazySingleton<_i149.GetInvoiceByClientUsecase>(
      () => _i149.GetInvoiceByClientUsecase(gh<_i134.SupportTabRepo>()));
  gh.lazySingleton<_i150.ReceiveDeviceUsecase>(
      () => _i150.ReceiveDeviceUsecase(gh<_i134.SupportTabRepo>()));
  gh.lazySingleton<_i151.ReturnInvoiceApproveUsecase>(
      () => _i151.ReturnInvoiceApproveUsecase(gh<_i134.SupportTabRepo>()));
  gh.lazySingleton<_i152.SetDateDoneUsecase>(
      () => _i152.SetDateDoneUsecase(gh<_i134.SupportTabRepo>()));
  gh.lazySingleton<_i153.SetReadyInstallUsecase>(
      () => _i153.SetReadyInstallUsecase(gh<_i134.SupportTabRepo>()));
  gh.lazySingleton<_i154.GetAllUsersUseCase>(
      () => _i154.GetAllUsersUseCase(gh<_i100.InvoicesSectionRepo>()));
  gh.lazySingleton<_i155.ClientsDebtsRepo>(
      () => _i156.ClientsDebtsRepoImpl(gh<_i29.ClientsDebtsDatasource>()));
  gh.factory<_i157.CommunicationListRepository>(() =>
      _i158.CommunicationListRepositoryImpl(
          gh<_i38.CommunicationListDatasource>()));
  gh.lazySingleton<_i159.SupportClientsInvoicesRepo>(() =>
      _i160.SupportClientsInvoicesRepoImpl(
          gh<_i33.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i161.GetBranchesForUserUsecase>(
      () => _i161.GetBranchesForUserUsecase(gh<_i60.UsersRepository>()));
  gh.lazySingleton<_i162.GetLevelsForUserUsecase>(
      () => _i162.GetLevelsForUserUsecase(gh<_i60.UsersRepository>()));
  gh.lazySingleton<_i163.GetManagesForUserUsecase>(
      () => _i163.GetManagesForUserUsecase(gh<_i60.UsersRepository>()));
  gh.factory<_i164.GetUsersUsecase>(
      () => _i164.GetUsersUsecase(gh<_i60.UsersRepository>()));
  gh.factory<_i165.ActionLinkUsecase>(
      () => _i165.ActionLinkUsecase(gh<_i136.LinksImportantRepository>()));
  gh.factory<_i166.GetLinkUsecase>(
      () => _i166.GetLinkUsecase(gh<_i136.LinksImportantRepository>()));
  gh.lazySingleton<_i167.GetSupportClientsInvoicesUseCase>(() =>
      _i167.GetSupportClientsInvoicesUseCase(
          gh<_i159.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i168.ManageWithdrawalsRepository>(() =>
      _i169.ManageWithdrawalsRepositoryImpl(
          gh<_i26.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i170.AgentsDistributorsRepo>(() =>
      _i171.AgentsDistributorsRepoImpl(
          gh<_i74.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i172.GetProductsSalesReportsUsecase>(() =>
      _i172.GetProductsSalesReportsUsecase(
          gh<_i105.ProductsSalesReportsRepo>()));
  gh.singleton<_i173.CitiesCubit>(
      () => _i173.CitiesCubit(gh<_i84.GetCitiesUseCase>()));
  gh.lazySingleton<_i174.RegionsRepository>(
      () => _i175.RegionsRepositoryImpl(gh<_i113.RegionsDatasource>()));
  gh.factory<_i176.UsersTypeCubit>(
      () => _i176.UsersTypeCubit(gh<_i79.GetUsersUsecase>()));
  gh.factory<_i177.ClientsListRepository>(
      () => _i178.ClientsListRepositoryImpl(gh<_i40.ClientsListDatasource>()));
  gh.factory<_i179.AddParticipateCommentUsecase>(() =>
      _i179.AddParticipateCommentUsecase(gh<_i97.ParticipateListRepository>()));
  gh.factory<_i180.AddParticipateUserUsecase>(() =>
      _i180.AddParticipateUserUsecase(gh<_i97.ParticipateListRepository>()));
  gh.factory<_i181.EditParticipateUserUsecase>(() =>
      _i181.EditParticipateUserUsecase(gh<_i97.ParticipateListRepository>()));
  gh.factory<_i182.GetInvoiceByIdUsecase>(
      () => _i182.GetInvoiceByIdUsecase(gh<_i97.ParticipateListRepository>()));
  gh.factory<_i183.ParticipateClientListUsecase>(() =>
      _i183.ParticipateClientListUsecase(gh<_i97.ParticipateListRepository>()));
  gh.factory<_i184.ParticipateCommentListUsecase>(() =>
      _i184.ParticipateCommentListUsecase(
          gh<_i97.ParticipateListRepository>()));
  gh.factory<_i185.ParticipateInvoiceListUsecase>(() =>
      _i185.ParticipateInvoiceListUsecase(
          gh<_i97.ParticipateListRepository>()));
  gh.factory<_i186.ParticipateListUsecase>(
      () => _i186.ParticipateListUsecase(gh<_i97.ParticipateListRepository>()));
  gh.lazySingleton<_i187.ChangeParticipateStatusUsecase>(() =>
      _i187.ChangeParticipateStatusUsecase(
          gh<_i97.ParticipateListRepository>()));
  gh.factory<_i188.PendingInvoicesCubit>(
      () => _i188.PendingInvoicesCubit(gh<_i80.GetPendingInvoicesUsecase>()));
  gh.factory<_i189.GetCommunicationListUsecase>(() =>
      _i189.GetCommunicationListUsecase(
          gh<_i157.CommunicationListRepository>()));
  gh.lazySingleton<_i190.GetEmployeesSalesReportsUsecase>(() =>
      _i190.GetEmployeesSalesReportsUsecase(
          gh<_i93.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i191.GetGreetingCommunicationUseCase>(() =>
      _i191.GetGreetingCommunicationUseCase(
          gh<_i116.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i192.ClientsTransferApprovalsRepo>(() =>
      _i193.ClientsTransferApprovalsRepoImpl(
          gh<_i35.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i194.LinkCubit>(() => _i194.LinkCubit(
        gh<_i166.GetLinkUsecase>(),
        gh<_i165.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i195.GetClientsStatusReportsUsecase>(() =>
      _i195.GetClientsStatusReportsUsecase(
          gh<_i109.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i196.GetPreviousRatingsUsecase>(
      () => _i196.GetPreviousRatingsUsecase(gh<_i76.PreviousRatingsRepo>()));
  gh.lazySingleton<_i197.WaitingAgentsRepo>(
      () => _i198.WaitingAgentsRepoImpl(gh<_i103.WaitingAgentsDataSource>()));
  gh.factory<_i199.AddClientUserUsecase>(
      () => _i199.AddClientUserUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i200.ApproveRejectClientUsecase>(() =>
      _i200.ApproveRejectClientUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i201.ChangeTypeClientUsecase>(
      () => _i201.ChangeTypeClientUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i202.EditClientUserUsecase>(
      () => _i202.EditClientUserUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i203.GetClientsListByRegionUseCase>(() =>
      _i203.GetClientsListByRegionUseCase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i204.GetClientsListByUserUseCase>(() =>
      _i204.GetClientsListByUserUseCase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i205.GetClientsWithFilterUserUsecase>(() =>
      _i205.GetClientsWithFilterUserUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i206.GetClientMarketingReportUsecase>(() =>
      _i206.GetClientMarketingReportUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i207.GetRecommendedClientsUsecase>(() =>
      _i207.GetRecommendedClientsUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i208.GetSimilarClientsUsecase>(
      () => _i208.GetSimilarClientsUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i209.ReceiveClientUserUsecase>(
      () => _i209.ReceiveClientUserUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i210.TransferClientUserUsecase>(
      () => _i210.TransferClientUserUsecase(gh<_i177.ClientsListRepository>()));
  gh.lazySingleton<_i211.GetHighSimilarClientsUsecase>(() =>
      _i211.GetHighSimilarClientsUsecase(gh<_i177.ClientsListRepository>()));
  gh.factory<_i212.EmployeesSalesReportsCubit>(() =>
      _i212.EmployeesSalesReportsCubit(
          gh<_i190.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i213.ChangeStateAgentUseCase>(
      () => _i213.ChangeStateAgentUseCase(gh<_i170.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i214.GetAgentsAndDistributorsUseCase>(() =>
      _i214.GetAgentsAndDistributorsUseCase(
          gh<_i170.AgentsDistributorsRepo>()));
  gh.factory<_i215.ClientsAcceptCubit>(
      () => _i215.ClientsAcceptCubit(gh<_i139.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i216.CancelWithdrawalUsecase>(() =>
      _i216.CancelWithdrawalUsecase(gh<_i168.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i217.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i217.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i168.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i218.GetWithdrawalsInvoicesUsecase>(() =>
      _i218.GetWithdrawalsInvoicesUsecase(
          gh<_i168.ManageWithdrawalsRepository>()));
  gh.factory<_i219.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i219.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i168.ManageWithdrawalsRepository>()));
  gh.factory<_i220.AddTaskUsecase>(
      () => _i220.AddTaskUsecase(gh<_i72.TaskRepository>()));
  gh.factory<_i221.ChangeStatusTaskUsecase>(
      () => _i221.ChangeStatusTaskUsecase(gh<_i72.TaskRepository>()));
  gh.factory<_i222.FilterTaskUsecase>(
      () => _i222.FilterTaskUsecase(gh<_i72.TaskRepository>()));
  gh.factory<_i223.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i223.GetUsersByDepartmentAndRegionUsecase(gh<_i72.TaskRepository>()));
  gh.lazySingleton<_i224.ExceededClientsUseCase>(
      () => _i224.ExceededClientsUseCase(gh<_i67.ExceededClientsRepo>()));
  gh.lazySingleton<_i225.TransferExceededClientsUseCase>(() =>
      _i225.TransferExceededClientsUseCase(gh<_i67.ExceededClientsRepo>()));
  gh.lazySingleton<_i226.LoginLocalDataSource>(() =>
      _i226.LoginLocalDataSourceImpl(
          gh<_i118.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i227.EditAdvancedConfigsUsecase>(() =>
      _i227.EditAdvancedConfigsUsecase(gh<_i95.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i228.GetAdvancedConfigsUsecase>(() =>
      _i228.GetAdvancedConfigsUsecase(gh<_i95.AdvancedConfigsRepository>()));
  gh.factory<_i229.ClientsInstallReportsCubit>(() =>
      _i229.ClientsInstallReportsCubit(
          gh<_i75.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i230.DatesTableRepo>(
      () => _i231.DatesTableRepoImpl(gh<_i111.DatesTableDataSource>()));
  gh.factory<_i232.GetVersionUseCase>(
      () => _i232.GetVersionUseCase(gh<_i127.AppRepository>()));
  gh.factory<_i233.AddTicketCubit>(
      () => _i233.AddTicketCubit(gh<_i85.AddTicketUseCase>()));
  gh.lazySingleton<_i234.LatestClientsUpdatesRepository>(() =>
      _i235.LatestClientsUpdatesRepositoryImpl(
          gh<_i99.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i236.EditGeneralConfigsUsecase>(() =>
      _i236.EditGeneralConfigsUsecase(gh<_i140.GeneralConfigsRepository>()));
  gh.lazySingleton<_i237.GetGeneralConfigsUsecase>(() =>
      _i237.GetGeneralConfigsUsecase(gh<_i140.GeneralConfigsRepository>()));
  gh.factory<_i238.InstallQualityCubit>(
      () => _i238.InstallQualityCubit(gh<_i144.GetInstallUseCase>()));
  gh.lazySingleton<_i239.AddAgentUseCase>(
      () => _i239.AddAgentUseCase(gh<_i129.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i240.UpdateAgentUseCase>(() =>
      _i240.UpdateAgentUseCase(gh<_i129.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i241.GetDelayInstallReportsUseCase>(() =>
      _i241.GetDelayInstallReportsUseCase(gh<_i125.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i242.CrudAgentSupportFilesUsecase>(() =>
      _i242.CrudAgentSupportFilesUsecase(
          gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i243.GetClientsTransferApprovalsUsecase>(() =>
      _i243.GetClientsTransferApprovalsUsecase(
          gh<_i192.ClientsTransferApprovalsRepo>()));
  gh.factory<_i244.GreetingCommunicationCubit>(() =>
      _i244.GreetingCommunicationCubit(
          gh<_i191.GetGreetingCommunicationUseCase>()));
  gh.factory<_i245.ClientsStatusReportsCubit>(() =>
      _i245.ClientsStatusReportsCubit(
          gh<_i195.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i246.TaskCubit>(() => _i246.TaskCubit(
        gh<_i220.AddTaskUsecase>(),
        gh<_i222.FilterTaskUsecase>(),
        gh<_i221.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i247.SupportTabCubit>(() => _i247.SupportTabCubit(
        gh<_i149.GetInvoiceByClientUsecase>(),
        gh<_i147.AddDateInstallUsecase>(),
        gh<_i152.SetDateDoneUsecase>(),
        gh<_i153.SetReadyInstallUsecase>(),
        gh<_i151.ReturnInvoiceApproveUsecase>(),
        gh<_i150.ReceiveDeviceUsecase>(),
        gh<_i148.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i248.ClientsDebtsReportsCubit>(() =>
      _i248.ClientsDebtsReportsCubit(
          gh<_i115.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i249.AddAgentDateUseCase>(() =>
      _i249.AddAgentDateUseCase(gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.factory<_i250.RegionsSalesReportsCubit>(() =>
      _i250.RegionsSalesReportsCubit(
          gh<_i133.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i251.AgentsDistributorsActionsCubit>(
      () => _i251.AgentsDistributorsActionsCubit(
            gh<_i84.GetCitiesUseCase>(),
            gh<_i239.AddAgentUseCase>(),
            gh<_i240.UpdateAgentUseCase>(),
          ));
  gh.factory<_i252.InvoicesSectionCubit>(() => _i252.InvoicesSectionCubit(
        gh<_i138.GetInvoicesByPrivilegesUsecase>(),
        gh<_i214.GetAgentsAndDistributorsUseCase>(),
        gh<_i186.ParticipateListUsecase>(),
        gh<_i154.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i253.LoginRepo>(() => _i254.LoginRepoImpl(
        gh<_i92.LoginRemoteDataSource>(),
        gh<_i226.LoginLocalDataSource>(),
      ));
  gh.factory<_i255.AddLevelUsecase>(
      () => _i255.AddLevelUsecase(gh<_i123.PrivilegeRepository>()));
  gh.factory<_i256.GetLevelsUsecase>(
      () => _i256.GetLevelsUsecase(gh<_i123.PrivilegeRepository>()));
  gh.factory<_i257.GetPrivilegesUsecase>(
      () => _i257.GetPrivilegesUsecase(gh<_i123.PrivilegeRepository>()));
  gh.factory<_i258.UpdatePrivilegeUsecase>(
      () => _i258.UpdatePrivilegeUsecase(gh<_i123.PrivilegeRepository>()));
  gh.factory<_i259.AddCommentUsecase>(
      () => _i259.AddCommentUsecase(gh<_i142.CompanyRepository>()));
  gh.factory<_i260.GetCommentUsecase>(
      () => _i260.GetCommentUsecase(gh<_i142.CompanyRepository>()));
  gh.factory<_i261.DelayInstallReportsCubit>(() =>
      _i261.DelayInstallReportsCubit(
          gh<_i241.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i262.GetRegionsByIdCountryUseCase>(
      () => _i262.GetRegionsByIdCountryUseCase(gh<_i174.RegionsRepository>()));
  gh.lazySingleton<_i263.PrivilegeCubit>(() => _i263.PrivilegeCubit(
        gh<_i256.GetLevelsUsecase>(),
        gh<_i257.GetPrivilegesUsecase>(),
        gh<_i258.UpdatePrivilegeUsecase>(),
        gh<_i255.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i264.GetLatestClientsUseCase>(() =>
      _i264.GetLatestClientsUseCase(
          gh<_i234.LatestClientsUpdatesRepository>()));
  gh.factory<_i265.AdvancedCofigsCubit>(() => _i265.AdvancedCofigsCubit(
        gh<_i228.GetAdvancedConfigsUsecase>(),
        gh<_i227.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i266.SupportClientsInvoicesCubit>(() =>
      _i266.SupportClientsInvoicesCubit(
          gh<_i167.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i267.ParticipateListBloc>(() => _i267.ParticipateListBloc(
        gh<_i186.ParticipateListUsecase>(),
        gh<_i180.AddParticipateUserUsecase>(),
        gh<_i181.EditParticipateUserUsecase>(),
        gh<_i183.ParticipateClientListUsecase>(),
        gh<_i185.ParticipateInvoiceListUsecase>(),
        gh<_i182.GetInvoiceByIdUsecase>(),
        gh<_i184.ParticipateCommentListUsecase>(),
        gh<_i179.AddParticipateCommentUsecase>(),
        gh<_i187.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i268.CacheTokenUsecase>(
      () => _i268.CacheTokenUsecase(gh<_i253.LoginRepo>()));
  gh.lazySingleton<_i269.GetTokenUsecase>(
      () => _i269.GetTokenUsecase(gh<_i253.LoginRepo>()));
  gh.lazySingleton<_i270.LoginUsecase>(
      () => _i270.LoginUsecase(gh<_i253.LoginRepo>()));
  gh.lazySingleton<_i271.ValidateTokenUsecase>(
      () => _i271.ValidateTokenUsecase(gh<_i253.LoginRepo>()));
  gh.lazySingleton<_i272.VerifyOtpUsecase>(
      () => _i272.VerifyOtpUsecase(gh<_i253.LoginRepo>()));
  gh.factory<_i273.ClientsTransferApprovalsCubit>(() =>
      _i273.ClientsTransferApprovalsCubit(
          gh<_i243.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i274.GeneralCofigsCubit>(() => _i274.GeneralCofigsCubit(
        gh<_i237.GetGeneralConfigsUsecase>(),
        gh<_i236.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i275.GetClientsDebtsUsecase>(
      () => _i275.GetClientsDebtsUsecase(gh<_i155.ClientsDebtsRepo>()));
  gh.lazySingleton<_i276.CrudClientSupportFilesUsecase>(() =>
      _i276.CrudClientSupportFilesUsecase(
          repository: gh<_i177.ClientsListRepository>()));
  gh.lazySingleton<_i277.GetClientSupportFilesUsecase>(() =>
      _i277.GetClientSupportFilesUsecase(
          repository: gh<_i177.ClientsListRepository>()));
  gh.lazySingleton<_i278.AddAgentCommentUsecase>(() =>
      _i278.AddAgentCommentUsecase(gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i279.DoneTrainingUsecase>(() =>
      _i279.DoneTrainingUsecase(gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i280.GetAgentUsecase>(
      () => _i280.GetAgentUsecase(gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i281.GetAgentClientListUsecase>(() =>
      _i281.GetAgentClientListUsecase(
          gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i282.GetAgentCommentsListUsecase>(() =>
      _i282.GetAgentCommentsListUsecase(
          gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i283.GetAgentDatesListUsecase>(() =>
      _i283.GetAgentDatesListUsecase(
          gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i284.GetAgentInvoiceListUsecase>(() =>
      _i284.GetAgentInvoiceListUsecase(
          gh<_i145.AgentsDistributorsProfileRepo>()));
  gh.factory<_i285.AddRejectReasonsUsecase>(() =>
      _i285.AddRejectReasonsUsecase(gh<_i168.ManageWithdrawalsRepository>()));
  gh.factory<_i286.EditRejectReasonsUsecase>(() =>
      _i286.EditRejectReasonsUsecase(gh<_i168.ManageWithdrawalsRepository>()));
  gh.factory<_i287.GetRejectReasonsUsecase>(() =>
      _i287.GetRejectReasonsUsecase(gh<_i168.ManageWithdrawalsRepository>()));
  gh.factory<_i288.GetUserSeriesUsecase>(() =>
      _i288.GetUserSeriesUsecase(gh<_i168.ManageWithdrawalsRepository>()));
  gh.factory<_i289.GetWithdrawnDetailsUsecase>(() =>
      _i289.GetWithdrawnDetailsUsecase(
          gh<_i168.ManageWithdrawalsRepository>()));
  gh.factory<_i290.SetApproveSeriesUsecase>(() =>
      _i290.SetApproveSeriesUsecase(gh<_i168.ManageWithdrawalsRepository>()));
  gh.factory<_i291.UpdateSeriesUsecase>(
      () => _i291.UpdateSeriesUsecase(gh<_i168.ManageWithdrawalsRepository>()));
  gh.singleton<_i292.AppManagerCubit>(
      () => _i292.AppManagerCubit(gh<_i232.GetVersionUseCase>()));
  gh.factory<_i293.RegionsCubit>(
      () => _i293.RegionsCubit(gh<_i262.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i294.GetWaitingAgentsUsecase>(
      () => _i294.GetWaitingAgentsUsecase(gh<_i197.WaitingAgentsRepo>()));
  gh.factory<_i295.ProductsSalesReportsCubit>(() =>
      _i295.ProductsSalesReportsCubit(
          gh<_i172.GetProductsSalesReportsUsecase>()));
  gh.factory<_i296.UsersCubit>(() => _i296.UsersCubit(
        gh<_i164.GetUsersUsecase>(),
        gh<_i69.ActionUserUsecase>(),
        gh<_i223.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i163.GetManagesForUserUsecase>(),
        gh<_i162.GetLevelsForUserUsecase>(),
        gh<_i161.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i297.PreviousRatingsCubit>(
      () => _i297.PreviousRatingsCubit(gh<_i196.GetPreviousRatingsUsecase>()));
  gh.factory<_i298.CommunicationListBloc>(() =>
      _i298.CommunicationListBloc(gh<_i189.GetCommunicationListUsecase>()));
  gh.factory<_i299.AgentsDistributorsCubit>(() => _i299.AgentsDistributorsCubit(
        gh<_i214.GetAgentsAndDistributorsUseCase>(),
        gh<_i213.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i300.ExceededClientsCubit>(() => _i300.ExceededClientsCubit(
        gh<_i224.ExceededClientsUseCase>(),
        gh<_i225.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i301.ManageWithdrawalsCubit>(() => _i301.ManageWithdrawalsCubit(
        gh<_i288.GetUserSeriesUsecase>(),
        gh<_i291.UpdateSeriesUsecase>(),
        gh<_i164.GetUsersUsecase>(),
        gh<_i218.GetWithdrawalsInvoicesUsecase>(),
        gh<_i219.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i290.SetApproveSeriesUsecase>(),
        gh<_i289.GetWithdrawnDetailsUsecase>(),
        gh<_i285.AddRejectReasonsUsecase>(),
        gh<_i287.GetRejectReasonsUsecase>(),
        gh<_i286.EditRejectReasonsUsecase>(),
        gh<_i217.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i216.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i302.LatestClientsUpdatesCubit>(() =>
      _i302.LatestClientsUpdatesCubit(gh<_i264.GetLatestClientsUseCase>()));
  gh.factory<_i303.AttachmentsRowCubit>(() => _i303.AttachmentsRowCubit(
        gh<_i277.GetClientSupportFilesUsecase>(),
        gh<_i276.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i304.CancelScheduleUsecase>(
      () => _i304.CancelScheduleUsecase(gh<_i230.DatesTableRepo>()));
  gh.lazySingleton<_i305.ChangeDateToDonUsecase>(
      () => _i305.ChangeDateToDonUsecase(gh<_i230.DatesTableRepo>()));
  gh.lazySingleton<_i306.GetDateInstallationUsecase>(
      () => _i306.GetDateInstallationUsecase(gh<_i230.DatesTableRepo>()));
  gh.lazySingleton<_i307.GetInvoicesByClientForDateUsecase>(() =>
      _i307.GetInvoicesByClientForDateUsecase(gh<_i230.DatesTableRepo>()));
  gh.lazySingleton<_i308.GetSubscribedClientsUsecase>(
      () => _i308.GetSubscribedClientsUsecase(gh<_i230.DatesTableRepo>()));
  gh.lazySingleton<_i309.RescheduleDateUsecase>(
      () => _i309.RescheduleDateUsecase(gh<_i230.DatesTableRepo>()));
  gh.lazySingleton<_i310.ReturnScheduleVisitToOpenUsecase>(
      () => _i310.ReturnScheduleVisitToOpenUsecase(gh<_i230.DatesTableRepo>()));
  gh.lazySingleton<_i311.GetCancelReasonsUsecase>(
      () => _i311.GetCancelReasonsUsecase(gh<_i230.DatesTableRepo>()));
  gh.factory<_i312.AgentsDistributorsProfileBloc>(
      () => _i312.AgentsDistributorsProfileBloc(
            gh<_i281.GetAgentClientListUsecase>(),
            gh<_i284.GetAgentInvoiceListUsecase>(),
            gh<_i182.GetInvoiceByIdUsecase>(),
            gh<_i282.GetAgentCommentsListUsecase>(),
            gh<_i278.AddAgentCommentUsecase>(),
            gh<_i279.DoneTrainingUsecase>(),
            gh<_i249.AddAgentDateUseCase>(),
            gh<_i283.GetAgentDatesListUsecase>(),
            gh<_i242.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i313.ClientsListBloc>(() => _i313.ClientsListBloc(
        gh<_i205.GetClientsWithFilterUserUsecase>(),
        gh<_i207.GetRecommendedClientsUsecase>(),
        gh<_i199.AddClientUserUsecase>(),
        gh<_i202.EditClientUserUsecase>(),
        gh<_i201.ChangeTypeClientUsecase>(),
        gh<_i208.GetSimilarClientsUsecase>(),
        gh<_i200.ApproveRejectClientUsecase>(),
        gh<_i276.CrudClientSupportFilesUsecase>(),
        gh<_i277.GetClientSupportFilesUsecase>(),
        gh<_i210.TransferClientUserUsecase>(),
        gh<_i209.ReceiveClientUserUsecase>(),
        gh<_i206.GetClientMarketingReportUsecase>(),
        gh<_i211.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i314.CompanyCubit>(() => _i314.CompanyCubit(
        gh<_i260.GetCommentUsecase>(),
        gh<_i259.AddCommentUsecase>(),
      ));
  gh.factory<_i315.ClientsDebtsCubit>(
      () => _i315.ClientsDebtsCubit(gh<_i275.GetClientsDebtsUsecase>()));
  gh.factory<_i316.LoginCubit>(() => _i316.LoginCubit(
        gh<_i270.LoginUsecase>(),
        gh<_i272.VerifyOtpUsecase>(),
        gh<_i268.CacheTokenUsecase>(),
        gh<_i269.GetTokenUsecase>(),
        gh<_i271.ValidateTokenUsecase>(),
      ));
  gh.factory<_i317.DatesTableCubit>(() => _i317.DatesTableCubit(
        gh<_i306.GetDateInstallationUsecase>(),
        gh<_i309.RescheduleDateUsecase>(),
        gh<_i305.ChangeDateToDonUsecase>(),
        gh<_i304.CancelScheduleUsecase>(),
        gh<_i310.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i308.GetSubscribedClientsUsecase>(),
        gh<_i307.GetInvoicesByClientForDateUsecase>(),
        gh<_i147.AddDateInstallUsecase>(),
        gh<_i311.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i318.WaitingAgentsCubit>(
      () => _i318.WaitingAgentsCubit(gh<_i294.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i319.AppModule {}
