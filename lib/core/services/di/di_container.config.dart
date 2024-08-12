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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i36;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i127;
import '../../../features/app/domain/repositories/app_repository.dart' as _i126;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i230;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i287;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i212;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i94;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i251;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i250;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i265;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i266;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i267;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i268;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i269;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i308;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i26;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i25;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i138;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i202;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i30;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i48;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i47;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i87;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i88;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i89;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i91;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i90;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i92;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i231;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i109;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i93;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i37;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i159;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i158;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i188;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i293;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i29;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i121;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i120;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i145;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i234;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i20;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i79;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i78;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i196;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i292;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i45;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i85;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i84;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i86;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i174;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i80;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i134;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i133;
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
    as _i243;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i114;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i176;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i175;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i260;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i288;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i43;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i59;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i58;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i81;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i177;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i46;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i98;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i97;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i213;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i214;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i262;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i62;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i140;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i139;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i232;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i233;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i271;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i38;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i123;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i122;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i252;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i253;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i254;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i255;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i261;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i32;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i61;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i60;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i69;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i162;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i163;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i164;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i165;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i291;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i35;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i170;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i169;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i280;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i281;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i203;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i282;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i283;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i205;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i204;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i284;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i285;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i286;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i309;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i27;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i157;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i156;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i272;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i307;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i39;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i144;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i143;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i218;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i219;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i220;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i192;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i221;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i225;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i193;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i222;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i223;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i224;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i226;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i227;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i228;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i229;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i246;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i33;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i191;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i190;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i240;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i270;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i28;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i64;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i63;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i105;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i130;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i66;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i65;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i82;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i187;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i40;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i142;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i141;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i257;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i258;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i306;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i34;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i68;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i67;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i210;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i211;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i295;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i83;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i102;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i101;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i155;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i137;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i249;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i44;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i76;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i75;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i241;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i296;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i74;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i108;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i129;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i147;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i172;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i128;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i146;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i273;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i245;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i235;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i200;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i239;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i274;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i275;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i276;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i277;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i278;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i279;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i201;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i236;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i248;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i304;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i294;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i41;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i136;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i135;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i166;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i167;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i194;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i23;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i100;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i99;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i178;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i186;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i180;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i181;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i184;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i182;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i183;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i185;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i264;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i19;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i52;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i51;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i116;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i244;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i11;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i111;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i110;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i195;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i237;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i96;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i95;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i189;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i199;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i13;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i107;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i106;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i173;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i290;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i18;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i50;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i49;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i132;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i247;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i17;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i71;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i70;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i77;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i215;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i112;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i217;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i216;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i297;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i298;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i299;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i300;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i301;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i302;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i303;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i305;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i10;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i56;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i55;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i113;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i131;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i22;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i125;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i124;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i238;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i259;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i54;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i53;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i57;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i103;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i31;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i161;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i160;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i168;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i263;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i104;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i198;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i197;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i289;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i310;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i42;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i73;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i72;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i206;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i207;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i208;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i209;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i242;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i256;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i117;
import '../cache_services/prefs_consumer.dart' as _i119;
import '../cache_services/secure_storage_consumer.dart' as _i118;
import '../maps/location_services.dart' as _i115;
import 'di_container.dart' as _i311;

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
  gh.lazySingleton<_i11.ClientsStatusReportsDatasource>(
      () => _i11.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i12.PendingInvoicesDatasource>(
      () => _i12.PendingInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i13.ProductsSalesReportsDatasource>(
      () => _i13.ProductsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
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
  gh.lazySingleton<_i22.DelayInstallReportsDatasource>(
      () => _i22.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.ParticipatesListDatasource>(
      () => _i23.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.EmployeesSalesReportsDatasource>(
      () => _i24.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.ClientsAcceptRepository>(() =>
      _i26.ClientsAcceptRepositoryImpl(gh<_i21.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i27.ClientsDebtsDatasource>(
      () => _i27.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.FinancePendingDatasource>(
      () => _i28.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.InstallQualityDatasource>(
      () => _i29.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.TicketsDataSource>(
      () => _i30.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.SupportClientsInvoicesDatasource>(
      () => _i31.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.UsersDatasource>(
      () => _i32.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i15.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i16.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i33.ClientsTransferApprovalsDatasource>(
      () => _i33.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i34.ExceededClientsDatasource>(
      () => _i34.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i35.ManageWithdrawalsDatasource>(
      () => _i35.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i36.AppDatasource>(
      () => _i36.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i37.CommunicationListDatasource>(
      () => _i37.CommunicationListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i38.PrivilegeDatasource>(
      () => _i38.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i39.ClientsListDatasource>(
      () => _i39.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i40.CommentCompanyDatasource>(
      () => _i40.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i41.LinkDatasource>(
      () => _i41.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i42.TaskDatasource>(
      () => _i42.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i43.UsersDatasource>(
      () => _i43.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.LatestClientsUpdatesDatasource>(
      () => _i44.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.CitiesDatasource>(
      () => _i45.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i46.AdvancedConfigsDatasource>(
      () => _i46.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i47.TicketsRepo>(
      () => _i48.TicketsRepoImpl(gh<_i30.TicketsDataSource>()));
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
      () => _i59.UsersRepositoryImpl(gh<_i43.UsersDatasource>()));
  gh.lazySingleton<_i60.UsersRepository>(
      () => _i61.UsersRepositoryImpl(gh<_i32.UsersDatasource>()));
  gh.lazySingleton<_i62.GeneralConfigsDatasource>(
      () => _i62.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i63.FinancePendingRepo>(
      () => _i64.FinancePendingRepoImpl(gh<_i28.FinancePendingDatasource>()));
  gh.lazySingleton<_i65.PendingInvoicesRepo>(
      () => _i66.PendingInvoicesRepoImpl(gh<_i12.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i67.ExceededClientsRepo>(
      () => _i68.ExceededClientsRepoImpl(gh<_i34.ExceededClientsDatasource>()));
  gh.factory<_i69.ActionUserUsecase>(
      () => _i69.ActionUserUsecase(gh<_i60.UsersRepository>()));
  gh.lazySingleton<_i70.ClientsInstallReportsRepo>(() =>
      _i71.ClientsInstallReportsRepoImpl(
          gh<_i17.ClientsInstallReportsDatasource>()));
  gh.factory<_i72.TaskRepository>(
      () => _i73.TaskRepositoryImpl(gh<_i42.TaskDatasource>()));
  gh.lazySingleton<_i74.AgentsDistributorsDataSource>(
      () => _i74.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i75.LatestClientsUpdatesRepository>(() =>
      _i76.LatestClientsUpdatesRepositoryImpl(
          gh<_i44.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i77.GetClientsInstallReportsUsecase>(() =>
      _i77.GetClientsInstallReportsUsecase(
          gh<_i70.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i78.PreviousRatingsRepo>(
      () => _i79.PreviousRatingsRepoImpl(gh<_i20.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i80.SupportTabDataSource>(
      () => _i80.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i81.GetUsersUsecase>(
      () => _i81.GetUsersUsecase(gh<_i58.UsersRepository>()));
  gh.lazySingleton<_i82.GetPendingInvoicesUsecase>(
      () => _i82.GetPendingInvoicesUsecase(gh<_i65.PendingInvoicesRepo>()));
  gh.lazySingleton<_i83.InvoicesTabDataSource>(
      () => _i83.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i84.CitiesRepository>(
      () => _i85.CitiesRepositoryImpl(gh<_i45.CitiesDatasource>()));
  gh.lazySingleton<_i86.GetCitiesUseCase>(
      () => _i86.GetCitiesUseCase(gh<_i84.CitiesRepository>()));
  gh.lazySingleton<_i87.AddTicketUseCase>(
      () => _i87.AddTicketUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i88.EditTicketTypeUseCase>(
      () => _i88.EditTicketTypeUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i89.GetClientTicketsUseCase>(
      () => _i89.GetClientTicketsUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i90.GetTicketsUseCase>(
      () => _i90.GetTicketsUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i91.GetTicketByIdUseCase>(
      () => _i91.GetTicketByIdUseCase(gh<_i47.TicketsRepo>()));
  gh.lazySingleton<_i92.TransferTicketUseCase>(
      () => _i92.TransferTicketUseCase(gh<_i47.TicketsRepo>()));
  gh.factory<_i93.TicketsCubit>(() => _i93.TicketsCubit(
        gh<_i90.GetTicketsUseCase>(),
        gh<_i91.GetTicketByIdUseCase>(),
        gh<_i89.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i94.LoginRemoteDataSource>(
      () => _i94.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i95.EmployeesSalesReportsRepo>(() =>
      _i96.EmployeesSalesReportsRepoImpl(
          gh<_i24.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i97.AdvancedConfigsRepository>(() =>
      _i98.AdvancedConfigsRepositoryImpl(gh<_i46.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i99.ParticipateListRepository>(() =>
      _i100.ParticipateListRepositoryImpl(
          gh<_i23.ParticipatesListDatasource>()));
  gh.lazySingleton<_i101.InvoicesSectionRepo>(
      () => _i102.InvoicesTabRepoImpl(gh<_i83.InvoicesTabDataSource>()));
  gh.factory<_i103.SupportClientsAcceptCubit>(() =>
      _i103.SupportClientsAcceptCubit(
          gh<_i57.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i104.WaitingAgentsDataSource>(
      () => _i104.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i105.GetFinancePendingInvoicesUsecase>(() =>
      _i105.GetFinancePendingInvoicesUsecase(gh<_i63.FinancePendingRepo>()));
  gh.lazySingleton<_i106.ProductsSalesReportsRepo>(() =>
      _i107.ProductsSalesReportsRepoImpl(
          gh<_i13.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i108.AgentsDistributorsProfileDataSource>(() =>
      _i108.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i109.EditTicketCubit>(() => _i109.EditTicketCubit(
        gh<_i88.EditTicketTypeUseCase>(),
        gh<_i92.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i110.ClientsStatusReportsRepo>(() =>
      _i111.ClientsStatusReportsRepoImpl(
          gh<_i11.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i112.DatesTableDataSource>(
      () => _i112.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i113.GetDelayAfterInstallUseCase>(() =>
      _i113.GetDelayAfterInstallUseCase(gh<_i55.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i114.RegionsDatasource>(
      () => _i114.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i115.LocationServices>(
      () => _i115.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i116.GetClientsDebtsReportsUsecase>(() =>
      _i116.GetClientsDebtsReportsUsecase(gh<_i51.ClientsDebtsReportsRepo>()));
  gh.singleton<_i117.CacheServices>(
    () => _i118.SecureStorageConsumer(gh<_i16.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i117.CacheServices>(() async =>
      _i119.PrefsConsumer(await gh.getAsync<_i15.SharedPreferences>()));
  gh.lazySingleton<_i120.InstallQualityRepo>(
      () => _i121.InstallQualityRepoImpl(gh<_i29.InstallQualityDatasource>()));
  gh.factory<_i122.PrivilegeRepository>(
      () => _i123.PrivilegeRepositoryImpl(gh<_i38.PrivilegeDatasource>()));
  gh.lazySingleton<_i124.DelayInstallReportsRepo>(() =>
      _i125.DelayInstallReportsRepoImpl(
          gh<_i22.DelayInstallReportsDatasource>()));
  gh.factory<_i126.AppRepository>(
      () => _i127.AppRepositoryImpl(gh<_i36.AppDatasource>()));
  gh.lazySingleton<_i128.AgentsDistributorsActionsRepo>(() =>
      _i129.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i130.FinancePendingCubit>(() =>
      _i130.FinancePendingCubit(gh<_i105.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i131.DelayAfterInstallCubit>(() =>
      _i131.DelayAfterInstallCubit(gh<_i113.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i132.GetRegionsSalesReportsUsecase>(() =>
      _i132.GetRegionsSalesReportsUsecase(gh<_i49.RegionsSalesReportsRepo>()));
  gh.lazySingleton<_i133.SupportTabRepo>(
      () => _i134.SupportTabRepoImpl(gh<_i80.SupportTabDataSource>()));
  gh.factory<_i135.LinksImportantRepository>(
      () => _i136.LinkRepositoryImpl(gh<_i41.LinkDatasource>()));
  gh.lazySingleton<_i137.GetInvoicesByPrivilegesUsecase>(() =>
      _i137.GetInvoicesByPrivilegesUsecase(gh<_i101.InvoicesSectionRepo>()));
  gh.lazySingleton<_i138.GetClientsAcceptUseCase>(
      () => _i138.GetClientsAcceptUseCase(gh<_i25.ClientsAcceptRepository>()));
  gh.lazySingleton<_i139.GeneralConfigsRepository>(() =>
      _i140.GeneralConfigsRepositoryImpl(gh<_i62.GeneralConfigsDatasource>()));
  gh.factory<_i141.CompanyRepository>(
      () => _i142.CompanyRepositoryImpl(gh<_i40.CommentCompanyDatasource>()));
  gh.factory<_i143.ClientsListRepository>(
      () => _i144.ClientsListRepositoryImpl(gh<_i39.ClientsListDatasource>()));
  gh.lazySingleton<_i145.GetInstallUseCase>(
      () => _i145.GetInstallUseCase(gh<_i120.InstallQualityRepo>()));
  gh.lazySingleton<_i146.AgentsDistributorsProfileRepo>(() =>
      _i147.AgentsDistributorsProfileRepoImpl(
          gh<_i108.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i148.AddDateInstallUsecase>(
      () => _i148.AddDateInstallUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i149.CancelDateInstallUsecase>(
      () => _i149.CancelDateInstallUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i150.GetInvoiceByClientUsecase>(
      () => _i150.GetInvoiceByClientUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i151.ReceiveDeviceUsecase>(
      () => _i151.ReceiveDeviceUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i152.ReturnInvoiceApproveUsecase>(
      () => _i152.ReturnInvoiceApproveUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i153.SetDateDoneUsecase>(
      () => _i153.SetDateDoneUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i154.SetReadyInstallUsecase>(
      () => _i154.SetReadyInstallUsecase(gh<_i133.SupportTabRepo>()));
  gh.lazySingleton<_i155.GetAllUsersUseCase>(
      () => _i155.GetAllUsersUseCase(gh<_i101.InvoicesSectionRepo>()));
  gh.lazySingleton<_i156.ClientsDebtsRepo>(
      () => _i157.ClientsDebtsRepoImpl(gh<_i27.ClientsDebtsDatasource>()));
  gh.factory<_i158.CommunicationListRepository>(() =>
      _i159.CommunicationListRepositoryImpl(
          gh<_i37.CommunicationListDatasource>()));
  gh.lazySingleton<_i160.SupportClientsInvoicesRepo>(() =>
      _i161.SupportClientsInvoicesRepoImpl(
          gh<_i31.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i162.GetBranchesForUserUsecase>(
      () => _i162.GetBranchesForUserUsecase(gh<_i60.UsersRepository>()));
  gh.lazySingleton<_i163.GetLevelsForUserUsecase>(
      () => _i163.GetLevelsForUserUsecase(gh<_i60.UsersRepository>()));
  gh.lazySingleton<_i164.GetManagesForUserUsecase>(
      () => _i164.GetManagesForUserUsecase(gh<_i60.UsersRepository>()));
  gh.factory<_i165.GetUsersUsecase>(
      () => _i165.GetUsersUsecase(gh<_i60.UsersRepository>()));
  gh.factory<_i166.ActionLinkUsecase>(
      () => _i166.ActionLinkUsecase(gh<_i135.LinksImportantRepository>()));
  gh.factory<_i167.GetLinkUsecase>(
      () => _i167.GetLinkUsecase(gh<_i135.LinksImportantRepository>()));
  gh.lazySingleton<_i168.GetSupportClientsInvoicesUseCase>(() =>
      _i168.GetSupportClientsInvoicesUseCase(
          gh<_i160.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i169.ManageWithdrawalsRepository>(() =>
      _i170.ManageWithdrawalsRepositoryImpl(
          gh<_i35.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i171.AgentsDistributorsRepo>(() =>
      _i172.AgentsDistributorsRepoImpl(
          gh<_i74.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i173.GetProductsSalesReportsUsecase>(() =>
      _i173.GetProductsSalesReportsUsecase(
          gh<_i106.ProductsSalesReportsRepo>()));
  gh.singleton<_i174.CitiesCubit>(
      () => _i174.CitiesCubit(gh<_i86.GetCitiesUseCase>()));
  gh.lazySingleton<_i175.RegionsRepository>(
      () => _i176.RegionsRepositoryImpl(gh<_i114.RegionsDatasource>()));
  gh.factory<_i177.UsersTypeCubit>(
      () => _i177.UsersTypeCubit(gh<_i81.GetUsersUsecase>()));
  gh.factory<_i178.AddParticipateCommentUsecase>(() =>
      _i178.AddParticipateCommentUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i179.AddParticipateUserUsecase>(() =>
      _i179.AddParticipateUserUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i180.EditParticipateUserUsecase>(() =>
      _i180.EditParticipateUserUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i181.GetInvoiceByIdUsecase>(
      () => _i181.GetInvoiceByIdUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i182.ParticipateClientListUsecase>(() =>
      _i182.ParticipateClientListUsecase(gh<_i99.ParticipateListRepository>()));
  gh.factory<_i183.ParticipateCommentListUsecase>(() =>
      _i183.ParticipateCommentListUsecase(
          gh<_i99.ParticipateListRepository>()));
  gh.factory<_i184.ParticipateInvoiceListUsecase>(() =>
      _i184.ParticipateInvoiceListUsecase(
          gh<_i99.ParticipateListRepository>()));
  gh.factory<_i185.ParticipateListUsecase>(
      () => _i185.ParticipateListUsecase(gh<_i99.ParticipateListRepository>()));
  gh.lazySingleton<_i186.ChangeParticipateStatusUsecase>(() =>
      _i186.ChangeParticipateStatusUsecase(
          gh<_i99.ParticipateListRepository>()));
  gh.factory<_i187.PendingInvoicesCubit>(
      () => _i187.PendingInvoicesCubit(gh<_i82.GetPendingInvoicesUsecase>()));
  gh.factory<_i188.GetCommunicationListUsecase>(() =>
      _i188.GetCommunicationListUsecase(
          gh<_i158.CommunicationListRepository>()));
  gh.lazySingleton<_i189.GetEmployeesSalesReportsUsecase>(() =>
      _i189.GetEmployeesSalesReportsUsecase(
          gh<_i95.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i190.ClientsTransferApprovalsRepo>(() =>
      _i191.ClientsTransferApprovalsRepoImpl(
          gh<_i33.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i192.CrudClientSupportFilesUsecase>(() =>
      _i192.CrudClientSupportFilesUsecase(
          repository: gh<_i143.ClientsListRepository>()));
  gh.lazySingleton<_i193.GetClientSupportFilesUsecase>(() =>
      _i193.GetClientSupportFilesUsecase(
          repository: gh<_i143.ClientsListRepository>()));
  gh.factory<_i194.LinkCubit>(() => _i194.LinkCubit(
        gh<_i167.GetLinkUsecase>(),
        gh<_i166.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i195.GetClientsStatusReportsUsecase>(() =>
      _i195.GetClientsStatusReportsUsecase(
          gh<_i110.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i196.GetPreviousRatingsUsecase>(
      () => _i196.GetPreviousRatingsUsecase(gh<_i78.PreviousRatingsRepo>()));
  gh.lazySingleton<_i197.WaitingAgentsRepo>(
      () => _i198.WaitingAgentsRepoImpl(gh<_i104.WaitingAgentsDataSource>()));
  gh.factory<_i199.EmployeesSalesReportsCubit>(() =>
      _i199.EmployeesSalesReportsCubit(
          gh<_i189.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i200.ChangeStateAgentUseCase>(
      () => _i200.ChangeStateAgentUseCase(gh<_i171.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i201.GetAgentsAndDistributorsUseCase>(() =>
      _i201.GetAgentsAndDistributorsUseCase(
          gh<_i171.AgentsDistributorsRepo>()));
  gh.factory<_i202.ClientsAcceptCubit>(
      () => _i202.ClientsAcceptCubit(gh<_i138.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i203.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i203.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i169.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i204.GetWithdrawalsInvoicesUsecase>(() =>
      _i204.GetWithdrawalsInvoicesUsecase(
          gh<_i169.ManageWithdrawalsRepository>()));
  gh.factory<_i205.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i205.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i169.ManageWithdrawalsRepository>()));
  gh.factory<_i206.AddTaskUsecase>(
      () => _i206.AddTaskUsecase(gh<_i72.TaskRepository>()));
  gh.factory<_i207.ChangeStatusTaskUsecase>(
      () => _i207.ChangeStatusTaskUsecase(gh<_i72.TaskRepository>()));
  gh.factory<_i208.FilterTaskUsecase>(
      () => _i208.FilterTaskUsecase(gh<_i72.TaskRepository>()));
  gh.factory<_i209.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i209.GetUsersByDepartmentAndRegionUsecase(gh<_i72.TaskRepository>()));
  gh.lazySingleton<_i210.ExceededClientsUseCase>(
      () => _i210.ExceededClientsUseCase(gh<_i67.ExceededClientsRepo>()));
  gh.lazySingleton<_i211.TransferExceededClientsUseCase>(() =>
      _i211.TransferExceededClientsUseCase(gh<_i67.ExceededClientsRepo>()));
  gh.lazySingleton<_i212.LoginLocalDataSource>(() =>
      _i212.LoginLocalDataSourceImpl(
          gh<_i117.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i213.EditAdvancedConfigsUsecase>(() =>
      _i213.EditAdvancedConfigsUsecase(gh<_i97.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i214.GetAdvancedConfigsUsecase>(() =>
      _i214.GetAdvancedConfigsUsecase(gh<_i97.AdvancedConfigsRepository>()));
  gh.factory<_i215.ClientsInstallReportsCubit>(() =>
      _i215.ClientsInstallReportsCubit(
          gh<_i77.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i216.DatesTableRepo>(
      () => _i217.DatesTableRepoImpl(gh<_i112.DatesTableDataSource>()));
  gh.factory<_i218.AddClientUserUsecase>(
      () => _i218.AddClientUserUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i219.ApproveRejectClientUsecase>(() =>
      _i219.ApproveRejectClientUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i220.ChangeTypeClientUsecase>(
      () => _i220.ChangeTypeClientUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i221.EditClientUserUsecase>(
      () => _i221.EditClientUserUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i222.GetClientsListByRegionUseCase>(() =>
      _i222.GetClientsListByRegionUseCase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i223.GetClientsListByUserUseCase>(() =>
      _i223.GetClientsListByUserUseCase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i224.GetClientsWithFilterUserUsecase>(() =>
      _i224.GetClientsWithFilterUserUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i225.GetClientMarketingReportUsecase>(() =>
      _i225.GetClientMarketingReportUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i226.GetRecommendedClientsUsecase>(() =>
      _i226.GetRecommendedClientsUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i227.GetSimilarClientsUsecase>(
      () => _i227.GetSimilarClientsUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i228.ReceiveClientUserUsecase>(
      () => _i228.ReceiveClientUserUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i229.TransferClientUserUsecase>(
      () => _i229.TransferClientUserUsecase(gh<_i143.ClientsListRepository>()));
  gh.factory<_i230.GetVersionUseCase>(
      () => _i230.GetVersionUseCase(gh<_i126.AppRepository>()));
  gh.factory<_i231.AddTicketCubit>(
      () => _i231.AddTicketCubit(gh<_i87.AddTicketUseCase>()));
  gh.lazySingleton<_i232.EditGeneralConfigsUsecase>(() =>
      _i232.EditGeneralConfigsUsecase(gh<_i139.GeneralConfigsRepository>()));
  gh.lazySingleton<_i233.GetGeneralConfigsUsecase>(() =>
      _i233.GetGeneralConfigsUsecase(gh<_i139.GeneralConfigsRepository>()));
  gh.factory<_i234.InstallQualityCubit>(
      () => _i234.InstallQualityCubit(gh<_i145.GetInstallUseCase>()));
  gh.lazySingleton<_i235.AddAgentUseCase>(
      () => _i235.AddAgentUseCase(gh<_i128.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i236.UpdateAgentUseCase>(() =>
      _i236.UpdateAgentUseCase(gh<_i128.AgentsDistributorsActionsRepo>()));
  gh.factory<_i237.ClientsStatusReportsCubit>(() =>
      _i237.ClientsStatusReportsCubit(
          gh<_i195.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i238.GetDelayInstallReportsUseCase>(() =>
      _i238.GetDelayInstallReportsUseCase(gh<_i124.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i239.CrudAgentSupportFilesUsecase>(() =>
      _i239.CrudAgentSupportFilesUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i240.GetClientsTransferApprovalsUsecase>(() =>
      _i240.GetClientsTransferApprovalsUsecase(
          gh<_i190.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i241.GetLatestClientsUseCase>(() =>
      _i241.GetLatestClientsUseCase(gh<_i75.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i242.TaskCubit>(() => _i242.TaskCubit(
        gh<_i206.AddTaskUsecase>(),
        gh<_i208.FilterTaskUsecase>(),
        gh<_i207.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i243.SupportTabCubit>(() => _i243.SupportTabCubit(
        gh<_i150.GetInvoiceByClientUsecase>(),
        gh<_i148.AddDateInstallUsecase>(),
        gh<_i153.SetDateDoneUsecase>(),
        gh<_i154.SetReadyInstallUsecase>(),
        gh<_i152.ReturnInvoiceApproveUsecase>(),
        gh<_i151.ReceiveDeviceUsecase>(),
        gh<_i149.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i244.ClientsDebtsReportsCubit>(() =>
      _i244.ClientsDebtsReportsCubit(
          gh<_i116.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i245.AddAgentDateUseCase>(() =>
      _i245.AddAgentDateUseCase(gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.factory<_i246.ClientsListBloc>(() => _i246.ClientsListBloc(
        gh<_i224.GetClientsWithFilterUserUsecase>(),
        gh<_i226.GetRecommendedClientsUsecase>(),
        gh<_i218.AddClientUserUsecase>(),
        gh<_i221.EditClientUserUsecase>(),
        gh<_i220.ChangeTypeClientUsecase>(),
        gh<_i227.GetSimilarClientsUsecase>(),
        gh<_i219.ApproveRejectClientUsecase>(),
        gh<_i192.CrudClientSupportFilesUsecase>(),
        gh<_i193.GetClientSupportFilesUsecase>(),
        gh<_i229.TransferClientUserUsecase>(),
        gh<_i228.ReceiveClientUserUsecase>(),
        gh<_i225.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i247.RegionsSalesReportsCubit>(() =>
      _i247.RegionsSalesReportsCubit(
          gh<_i132.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i248.AgentsDistributorsActionsCubit>(
      () => _i248.AgentsDistributorsActionsCubit(
            gh<_i86.GetCitiesUseCase>(),
            gh<_i235.AddAgentUseCase>(),
            gh<_i236.UpdateAgentUseCase>(),
          ));
  gh.factory<_i249.InvoicesSectionCubit>(() => _i249.InvoicesSectionCubit(
        gh<_i137.GetInvoicesByPrivilegesUsecase>(),
        gh<_i201.GetAgentsAndDistributorsUseCase>(),
        gh<_i185.ParticipateListUsecase>(),
        gh<_i155.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i250.LoginRepo>(() => _i251.LoginRepoImpl(
        gh<_i94.LoginRemoteDataSource>(),
        gh<_i212.LoginLocalDataSource>(),
      ));
  gh.factory<_i252.AddLevelUsecase>(
      () => _i252.AddLevelUsecase(gh<_i122.PrivilegeRepository>()));
  gh.factory<_i253.GetLevelsUsecase>(
      () => _i253.GetLevelsUsecase(gh<_i122.PrivilegeRepository>()));
  gh.factory<_i254.GetPrivilegesUsecase>(
      () => _i254.GetPrivilegesUsecase(gh<_i122.PrivilegeRepository>()));
  gh.factory<_i255.UpdatePrivilegeUsecase>(
      () => _i255.UpdatePrivilegeUsecase(gh<_i122.PrivilegeRepository>()));
  gh.factory<_i256.AttachmentsRowCubit>(() => _i256.AttachmentsRowCubit(
        gh<_i193.GetClientSupportFilesUsecase>(),
        gh<_i192.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i257.AddCommentUsecase>(
      () => _i257.AddCommentUsecase(gh<_i141.CompanyRepository>()));
  gh.factory<_i258.GetCommentUsecase>(
      () => _i258.GetCommentUsecase(gh<_i141.CompanyRepository>()));
  gh.factory<_i259.DelayInstallReportsCubit>(() =>
      _i259.DelayInstallReportsCubit(
          gh<_i238.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i260.GetRegionsByIdCountryUseCase>(
      () => _i260.GetRegionsByIdCountryUseCase(gh<_i175.RegionsRepository>()));
  gh.lazySingleton<_i261.PrivilegeCubit>(() => _i261.PrivilegeCubit(
        gh<_i253.GetLevelsUsecase>(),
        gh<_i254.GetPrivilegesUsecase>(),
        gh<_i255.UpdatePrivilegeUsecase>(),
        gh<_i252.AddLevelUsecase>(),
      ));
  gh.factory<_i262.AdvancedCofigsCubit>(() => _i262.AdvancedCofigsCubit(
        gh<_i214.GetAdvancedConfigsUsecase>(),
        gh<_i213.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i263.SupportClientsInvoicesCubit>(() =>
      _i263.SupportClientsInvoicesCubit(
          gh<_i168.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i264.ParticipateListBloc>(() => _i264.ParticipateListBloc(
        gh<_i185.ParticipateListUsecase>(),
        gh<_i179.AddParticipateUserUsecase>(),
        gh<_i180.EditParticipateUserUsecase>(),
        gh<_i182.ParticipateClientListUsecase>(),
        gh<_i184.ParticipateInvoiceListUsecase>(),
        gh<_i181.GetInvoiceByIdUsecase>(),
        gh<_i183.ParticipateCommentListUsecase>(),
        gh<_i178.AddParticipateCommentUsecase>(),
        gh<_i186.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i265.CacheTokenUsecase>(
      () => _i265.CacheTokenUsecase(gh<_i250.LoginRepo>()));
  gh.lazySingleton<_i266.GetTokenUsecase>(
      () => _i266.GetTokenUsecase(gh<_i250.LoginRepo>()));
  gh.lazySingleton<_i267.LoginUsecase>(
      () => _i267.LoginUsecase(gh<_i250.LoginRepo>()));
  gh.lazySingleton<_i268.ValidateTokenUsecase>(
      () => _i268.ValidateTokenUsecase(gh<_i250.LoginRepo>()));
  gh.lazySingleton<_i269.VerifyOtpUsecase>(
      () => _i269.VerifyOtpUsecase(gh<_i250.LoginRepo>()));
  gh.factory<_i270.ClientsTransferApprovalsCubit>(() =>
      _i270.ClientsTransferApprovalsCubit(
          gh<_i240.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i271.GeneralCofigsCubit>(() => _i271.GeneralCofigsCubit(
        gh<_i233.GetGeneralConfigsUsecase>(),
        gh<_i232.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i272.GetClientsDebtsUsecase>(
      () => _i272.GetClientsDebtsUsecase(gh<_i156.ClientsDebtsRepo>()));
  gh.lazySingleton<_i273.AddAgentCommentUsecase>(() =>
      _i273.AddAgentCommentUsecase(gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i274.DoneTrainingUsecase>(() =>
      _i274.DoneTrainingUsecase(gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i275.GetAgentUsecase>(
      () => _i275.GetAgentUsecase(gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i276.GetAgentClientListUsecase>(() =>
      _i276.GetAgentClientListUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i277.GetAgentCommentsListUsecase>(() =>
      _i277.GetAgentCommentsListUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i278.GetAgentDatesListUsecase>(() =>
      _i278.GetAgentDatesListUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i279.GetAgentInvoiceListUsecase>(() =>
      _i279.GetAgentInvoiceListUsecase(
          gh<_i146.AgentsDistributorsProfileRepo>()));
  gh.factory<_i280.AddRejectReasonsUsecase>(() =>
      _i280.AddRejectReasonsUsecase(gh<_i169.ManageWithdrawalsRepository>()));
  gh.factory<_i281.EditRejectReasonsUsecase>(() =>
      _i281.EditRejectReasonsUsecase(gh<_i169.ManageWithdrawalsRepository>()));
  gh.factory<_i282.GetRejectReasonsUsecase>(() =>
      _i282.GetRejectReasonsUsecase(gh<_i169.ManageWithdrawalsRepository>()));
  gh.factory<_i283.GetUserSeriesUsecase>(() =>
      _i283.GetUserSeriesUsecase(gh<_i169.ManageWithdrawalsRepository>()));
  gh.factory<_i284.GetWithdrawnDetailsUsecase>(() =>
      _i284.GetWithdrawnDetailsUsecase(
          gh<_i169.ManageWithdrawalsRepository>()));
  gh.factory<_i285.SetApproveSeriesUsecase>(() =>
      _i285.SetApproveSeriesUsecase(gh<_i169.ManageWithdrawalsRepository>()));
  gh.factory<_i286.UpdateSeriesUsecase>(
      () => _i286.UpdateSeriesUsecase(gh<_i169.ManageWithdrawalsRepository>()));
  gh.singleton<_i287.AppManagerCubit>(
      () => _i287.AppManagerCubit(gh<_i230.GetVersionUseCase>()));
  gh.factory<_i288.RegionsCubit>(
      () => _i288.RegionsCubit(gh<_i260.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i289.GetWaitingAgentsUsecase>(
      () => _i289.GetWaitingAgentsUsecase(gh<_i197.WaitingAgentsRepo>()));
  gh.factory<_i290.ProductsSalesReportsCubit>(() =>
      _i290.ProductsSalesReportsCubit(
          gh<_i173.GetProductsSalesReportsUsecase>()));
  gh.factory<_i291.UsersCubit>(() => _i291.UsersCubit(
        gh<_i165.GetUsersUsecase>(),
        gh<_i69.ActionUserUsecase>(),
        gh<_i209.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i164.GetManagesForUserUsecase>(),
        gh<_i163.GetLevelsForUserUsecase>(),
        gh<_i162.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i292.PreviousRatingsCubit>(
      () => _i292.PreviousRatingsCubit(gh<_i196.GetPreviousRatingsUsecase>()));
  gh.factory<_i293.CommunicationListBloc>(() =>
      _i293.CommunicationListBloc(gh<_i188.GetCommunicationListUsecase>()));
  gh.factory<_i294.AgentsDistributorsCubit>(() => _i294.AgentsDistributorsCubit(
        gh<_i201.GetAgentsAndDistributorsUseCase>(),
        gh<_i200.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i295.ExceededClientsCubit>(() => _i295.ExceededClientsCubit(
        gh<_i210.ExceededClientsUseCase>(),
        gh<_i211.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i296.LatestClientsUpdatesCubit>(() =>
      _i296.LatestClientsUpdatesCubit(gh<_i241.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i297.CancelScheduleUsecase>(
      () => _i297.CancelScheduleUsecase(gh<_i216.DatesTableRepo>()));
  gh.lazySingleton<_i298.ChangeDateToDonUsecase>(
      () => _i298.ChangeDateToDonUsecase(gh<_i216.DatesTableRepo>()));
  gh.lazySingleton<_i299.GetDateInstallationUsecase>(
      () => _i299.GetDateInstallationUsecase(gh<_i216.DatesTableRepo>()));
  gh.lazySingleton<_i300.GetInvoicesByClientForDateUsecase>(() =>
      _i300.GetInvoicesByClientForDateUsecase(gh<_i216.DatesTableRepo>()));
  gh.lazySingleton<_i301.GetSubscribedClientsUsecase>(
      () => _i301.GetSubscribedClientsUsecase(gh<_i216.DatesTableRepo>()));
  gh.lazySingleton<_i302.RescheduleDateUsecase>(
      () => _i302.RescheduleDateUsecase(gh<_i216.DatesTableRepo>()));
  gh.lazySingleton<_i303.ReturnScheduleVisitToOpenUsecase>(
      () => _i303.ReturnScheduleVisitToOpenUsecase(gh<_i216.DatesTableRepo>()));
  gh.factory<_i304.AgentsDistributorsProfileBloc>(
      () => _i304.AgentsDistributorsProfileBloc(
            gh<_i276.GetAgentClientListUsecase>(),
            gh<_i279.GetAgentInvoiceListUsecase>(),
            gh<_i181.GetInvoiceByIdUsecase>(),
            gh<_i277.GetAgentCommentsListUsecase>(),
            gh<_i273.AddAgentCommentUsecase>(),
            gh<_i274.DoneTrainingUsecase>(),
            gh<_i245.AddAgentDateUseCase>(),
            gh<_i278.GetAgentDatesListUsecase>(),
            gh<_i239.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i305.DatesTableCubit>(() => _i305.DatesTableCubit(
        gh<_i299.GetDateInstallationUsecase>(),
        gh<_i302.RescheduleDateUsecase>(),
        gh<_i298.ChangeDateToDonUsecase>(),
        gh<_i297.CancelScheduleUsecase>(),
        gh<_i303.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i301.GetSubscribedClientsUsecase>(),
        gh<_i300.GetInvoicesByClientForDateUsecase>(),
        gh<_i148.AddDateInstallUsecase>(),
      ));
  gh.factory<_i306.CompanyCubit>(() => _i306.CompanyCubit(
        gh<_i258.GetCommentUsecase>(),
        gh<_i257.AddCommentUsecase>(),
      ));
  gh.factory<_i307.ClientsDebtsCubit>(
      () => _i307.ClientsDebtsCubit(gh<_i272.GetClientsDebtsUsecase>()));
  gh.factory<_i308.LoginCubit>(() => _i308.LoginCubit(
        gh<_i267.LoginUsecase>(),
        gh<_i269.VerifyOtpUsecase>(),
        gh<_i265.CacheTokenUsecase>(),
        gh<_i266.GetTokenUsecase>(),
        gh<_i268.ValidateTokenUsecase>(),
      ));
  gh.factory<_i309.ManageWithdrawalsCubit>(() => _i309.ManageWithdrawalsCubit(
        gh<_i283.GetUserSeriesUsecase>(),
        gh<_i286.UpdateSeriesUsecase>(),
        gh<_i165.GetUsersUsecase>(),
        gh<_i204.GetWithdrawalsInvoicesUsecase>(),
        gh<_i205.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i285.SetApproveSeriesUsecase>(),
        gh<_i284.GetWithdrawnDetailsUsecase>(),
        gh<_i280.AddRejectReasonsUsecase>(),
        gh<_i282.GetRejectReasonsUsecase>(),
        gh<_i281.EditRejectReasonsUsecase>(),
        gh<_i203.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i310.WaitingAgentsCubit>(
      () => _i310.WaitingAgentsCubit(gh<_i289.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i311.AppModule {}
