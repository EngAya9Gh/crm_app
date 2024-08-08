// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i8;
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../../api/api.dart' as _i6;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i34;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i113;
import '../../../features/app/domain/repositories/app_repository.dart' as _i112;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i216;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i264;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i61;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i86;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i101;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i100;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i123;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i124;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i125;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i126;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i127;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i232;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i19;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i24;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i23;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i128;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i190;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i28;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i46;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i45;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i79;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i80;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i81;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i83;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i82;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i84;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i217;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i99;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i85;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i35;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i150;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i149;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i177;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i269;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i27;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i107;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i106;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i135;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i220;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i18;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i71;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i70;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i184;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i268;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i43;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i77;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i76;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i78;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i148;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i72;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i119;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i118;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i138;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i139;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i140;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i141;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i142;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i143;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i144;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i228;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i104;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i165;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i164;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i242;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i265;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i41;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i53;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i52;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i73;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i166;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i44;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i90;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i89;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i200;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i201;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i244;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i56;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i130;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i129;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i218;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i219;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i248;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i36;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i109;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i108;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i234;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i235;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i236;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i237;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i243;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i30;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i55;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i54;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i64;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i153;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i154;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i155;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i156;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i267;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i33;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i161;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i160;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i257;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i258;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i191;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i259;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i260;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i193;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i192;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i261;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i262;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i263;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i284;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i25;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i147;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i146;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i249;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i283;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i31;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i180;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i179;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i225;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i247;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i26;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i58;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i57;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i97;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i116;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i16;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i60;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i59;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i74;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i176;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i37;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i134;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i133;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i204;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i205;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i206;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i181;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i207;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i211;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i182;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i208;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i209;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i210;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i212;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i213;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i214;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i215;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i230;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i38;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i132;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i131;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i239;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i240;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i282;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i32;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i63;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i62;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i198;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i199;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i271;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i75;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i94;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i93;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i145;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i122;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i233;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i42;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i69;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i68;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i226;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i272;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i17;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i67;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i98;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i115;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i163;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i114;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i136;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i162;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i250;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i229;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i221;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i188;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i224;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i251;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i252;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i253;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i254;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i255;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i256;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i222;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i280;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i270;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i39;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i121;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i120;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i157;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i158;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i183;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i21;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i92;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i91;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i167;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i168;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i169;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i170;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i171;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i172;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i173;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i174;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i246;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i88;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i87;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i178;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i187;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i102;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i203;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i202;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i273;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i274;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i275;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i276;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i277;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i278;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i279;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i281;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i50;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i49;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i103;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i117;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i20;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i111;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i110;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i223;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i241;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i48;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i47;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i51;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i95;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i29;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i152;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i151;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i159;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i245;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i96;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i186;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i185;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i266;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i285;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i40;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i66;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i65;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i194;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i195;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i196;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i197;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i227;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i238;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i105;
import 'di_container.dart' as _i286;

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
  gh.singletonAsync<_i3.SharedPreferences>(() => appModule.sharedPreferences);
  gh.singleton<_i4.FlutterSecureStorage>(() => appModule.secureStorage);
  gh.singleton<_i5.Logger>(() => appModule.logger);
  gh.lazySingleton<_i6.Api>(() => _i6.Api());
  gh.lazySingleton<_i7.Dio>(() => appModule.dio);
  gh.lazySingleton<_i8.Location>(() => appModule.location);
  gh.lazySingleton<_i9.ApiServices>(() => _i10.DioServices(gh<_i7.Dio>()));
  gh.lazySingleton<_i11.CacheServices>(
    () => _i12.SecureStorageConsumer(gh<_i4.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i13.SupportClientsAcceptDatasource>(
      () => _i13.SupportClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingletonAsync<_i11.CacheServices>(() async =>
      _i14.PrefsConsumer(await gh.getAsync<_i3.SharedPreferences>()));
  gh.lazySingleton<_i15.DelayAfterInstallDatasource>(
      () => _i15.DelayAfterInstallDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i16.PendingInvoicesDatasource>(
      () => _i16.PendingInvoicesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i17.AgentsDistributorsActionsDataSource>(() =>
      _i17.AgentsDistributorsActionsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i18.PreviousRatingsDatasource>(
      () => _i18.PreviousRatingsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i19.ClientsAcceptDatasource>(
      () => _i19.ClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i20.DelayInstallReportsDatasource>(
      () => _i20.DelayInstallReportsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i21.ParticipatesListDatasource>(
      () => _i21.ParticipatesListDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i22.EmployeesSalesReportsDatasource>(
      () => _i22.EmployeesSalesReportsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i23.ClientsAcceptRepository>(() =>
      _i24.ClientsAcceptRepositoryImpl(gh<_i19.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i25.ClientsDebtsDatasource>(
      () => _i25.ClientsDebtsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i26.FinancePendingDatasource>(
      () => _i26.FinancePendingDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i27.InstallQualityDatasource>(
      () => _i27.InstallQualityDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i28.TicketsDataSource>(
      () => _i28.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i29.SupportClientsInvoicesDatasource>(
      () => _i29.DelayInstallReportsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.UsersDatasource>(
      () => _i30.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i31.ClientsTransferApprovalsDatasource>(
      () => _i31.ClientsTransferApprovalsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i32.ExceededClientsDatasource>(
      () => _i32.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i33.ManageWithdrawalsDatasource>(
      () => _i33.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i34.AppDatasource>(
      () => _i34.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i35.CommunicationListDatasource>(
      () => _i35.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i36.PrivilegeDatasource>(
      () => _i36.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i37.ClientsListDatasource>(
      () => _i37.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i38.CommentCompanyDatasource>(
      () => _i38.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i39.LinkDatasource>(
      () => _i39.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i40.TaskDatasource>(
      () => _i40.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i41.UsersDatasource>(
      () => _i41.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i42.LatestClientsUpdatesDatasource>(
      () => _i42.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i43.CitiesDatasource>(
      () => _i43.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i44.AdvancedConfigsDatasource>(
      () => _i44.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i45.TicketsRepo>(
      () => _i46.TicketsRepoImpl(gh<_i28.TicketsDataSource>()));
  gh.lazySingleton<_i47.SupportClientsAcceptRepository>(() =>
      _i48.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i49.DelayAfterInstallRepo>(() =>
      _i50.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i51.GetSupportClientsAcceptUseCase>(() =>
      _i51.GetSupportClientsAcceptUseCase(
          gh<_i47.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i52.UsersRepository>(
      () => _i53.UsersRepositoryImpl(gh<_i41.UsersDatasource>()));
  gh.lazySingleton<_i54.UsersRepository>(
      () => _i55.UsersRepositoryImpl(gh<_i30.UsersDatasource>()));
  gh.lazySingleton<_i56.GeneralConfigsDatasource>(
      () => _i56.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i57.FinancePendingRepo>(
      () => _i58.FinancePendingRepoImpl(gh<_i26.FinancePendingDatasource>()));
  gh.lazySingleton<_i59.PendingInvoicesRepo>(
      () => _i60.PendingInvoicesRepoImpl(gh<_i16.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i61.LoginLocalDataSource>(() =>
      _i61.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i62.ExceededClientsRepo>(
      () => _i63.ExceededClientsRepoImpl(gh<_i32.ExceededClientsDatasource>()));
  gh.factory<_i64.ActionUserUsecase>(
      () => _i64.ActionUserUsecase(gh<_i54.UsersRepository>()));
  gh.factory<_i65.TaskRepository>(
      () => _i66.TaskRepositoryImpl(gh<_i40.TaskDatasource>()));
  gh.lazySingleton<_i67.AgentsDistributorsDataSource>(
      () => _i67.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i68.LatestClientsUpdatesRepository>(() =>
      _i69.LatestClientsUpdatesRepositoryImpl(
          gh<_i42.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i70.PreviousRatingsRepo>(
      () => _i71.PreviousRatingsRepoImpl(gh<_i18.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i72.SupportTabDataSource>(
      () => _i72.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i73.GetUsersUsecase>(
      () => _i73.GetUsersUsecase(gh<_i52.UsersRepository>()));
  gh.lazySingleton<_i74.GetPendingInvoicesUsecase>(
      () => _i74.GetPendingInvoicesUsecase(gh<_i59.PendingInvoicesRepo>()));
  gh.lazySingleton<_i75.InvoicesTabDataSource>(
      () => _i75.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i76.CitiesRepository>(
      () => _i77.CitiesRepositoryImpl(gh<_i43.CitiesDatasource>()));
  gh.lazySingleton<_i78.GetCitiesUseCase>(
      () => _i78.GetCitiesUseCase(gh<_i76.CitiesRepository>()));
  gh.lazySingleton<_i79.AddTicketUseCase>(
      () => _i79.AddTicketUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i80.EditTicketTypeUseCase>(
      () => _i80.EditTicketTypeUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i81.GetClientTicketsUseCase>(
      () => _i81.GetClientTicketsUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i82.GetTicketsUseCase>(
      () => _i82.GetTicketsUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i83.GetTicketByIdUseCase>(
      () => _i83.GetTicketByIdUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i84.TransferTicketUseCase>(
      () => _i84.TransferTicketUseCase(gh<_i45.TicketsRepo>()));
  gh.factory<_i85.TicketsCubit>(() => _i85.TicketsCubit(
        gh<_i82.GetTicketsUseCase>(),
        gh<_i83.GetTicketByIdUseCase>(),
        gh<_i81.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i86.LoginRemoteDataSource>(
      () => _i86.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i87.EmployeesSalesReportsRepo>(() =>
      _i88.EmployeesSalesReportsRepoImpl(
          gh<_i22.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i89.AdvancedConfigsRepository>(() =>
      _i90.AdvancedConfigsRepositoryImpl(gh<_i44.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i91.ParticipateListRepository>(() =>
      _i92.ParticipateListRepositoryImpl(
          gh<_i21.ParticipatesListDatasource>()));
  gh.lazySingleton<_i93.InvoicesSectionRepo>(
      () => _i94.InvoicesTabRepoImpl(gh<_i75.InvoicesTabDataSource>()));
  gh.factory<_i95.SupportClientsAcceptCubit>(() =>
      _i95.SupportClientsAcceptCubit(
          gh<_i51.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i96.WaitingAgentsDataSource>(
      () => _i96.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i97.GetFinancePendingInvoicesUsecase>(() =>
      _i97.GetFinancePendingInvoicesUsecase(gh<_i57.FinancePendingRepo>()));
  gh.lazySingleton<_i98.AgentsDistributorsProfileDataSource>(() =>
      _i98.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i99.EditTicketCubit>(() => _i99.EditTicketCubit(
        gh<_i80.EditTicketTypeUseCase>(),
        gh<_i84.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i100.LoginRepo>(() => _i101.LoginRepoImpl(
        gh<_i86.LoginRemoteDataSource>(),
        gh<_i61.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i102.DatesTableDataSource>(
      () => _i102.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i103.GetDelayAfterInstallUseCase>(() =>
      _i103.GetDelayAfterInstallUseCase(gh<_i49.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i104.RegionsDatasource>(
      () => _i104.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i105.LocationServices>(
      () => _i105.LocationServices(gh<_i8.Location>()));
  gh.lazySingleton<_i106.InstallQualityRepo>(
      () => _i107.InstallQualityRepoImpl(gh<_i27.InstallQualityDatasource>()));
  gh.factory<_i108.PrivilegeRepository>(
      () => _i109.PrivilegeRepositoryImpl(gh<_i36.PrivilegeDatasource>()));
  gh.lazySingleton<_i110.DelayInstallReportsRepo>(() =>
      _i111.DelayInstallReportsRepoImpl(
          gh<_i20.DelayInstallReportsDatasource>()));
  gh.factory<_i112.AppRepository>(
      () => _i113.AppRepositoryImpl(gh<_i34.AppDatasource>()));
  gh.lazySingleton<_i114.AgentsDistributorsActionsRepo>(() =>
      _i115.AgentsDistributorsActionsRepoImpl(
          gh<_i17.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i116.FinancePendingCubit>(() =>
      _i116.FinancePendingCubit(gh<_i97.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i117.DelayAfterInstallCubit>(() =>
      _i117.DelayAfterInstallCubit(gh<_i103.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i118.SupportTabRepo>(
      () => _i119.SupportTabRepoImpl(gh<_i72.SupportTabDataSource>()));
  gh.factory<_i120.LinksImportantRepository>(
      () => _i121.LinkRepositoryImpl(gh<_i39.LinkDatasource>()));
  gh.lazySingleton<_i122.GetInvoicesByPrivilegesUsecase>(() =>
      _i122.GetInvoicesByPrivilegesUsecase(gh<_i93.InvoicesSectionRepo>()));
  gh.lazySingleton<_i123.CacheTokenUsecase>(
      () => _i123.CacheTokenUsecase(gh<_i100.LoginRepo>()));
  gh.lazySingleton<_i124.GetTokenUsecase>(
      () => _i124.GetTokenUsecase(gh<_i100.LoginRepo>()));
  gh.lazySingleton<_i125.LoginUsecase>(
      () => _i125.LoginUsecase(gh<_i100.LoginRepo>()));
  gh.lazySingleton<_i126.ValidateTokenUsecase>(
      () => _i126.ValidateTokenUsecase(gh<_i100.LoginRepo>()));
  gh.lazySingleton<_i127.VerifyOtpUsecase>(
      () => _i127.VerifyOtpUsecase(gh<_i100.LoginRepo>()));
  gh.lazySingleton<_i128.GetClientsAcceptUseCase>(
      () => _i128.GetClientsAcceptUseCase(gh<_i23.ClientsAcceptRepository>()));
  gh.lazySingleton<_i129.GeneralConfigsRepository>(() =>
      _i130.GeneralConfigsRepositoryImpl(gh<_i56.GeneralConfigsDatasource>()));
  gh.factory<_i131.CompanyRepository>(
      () => _i132.CompanyRepositoryImpl(gh<_i38.CommentCompanyDatasource>()));
  gh.factory<_i133.ClientsListRepository>(
      () => _i134.ClientsListRepositoryImpl(gh<_i37.ClientsListDatasource>()));
  gh.lazySingleton<_i135.GetInstallUseCase>(
      () => _i135.GetInstallUseCase(gh<_i106.InstallQualityRepo>()));
  gh.lazySingleton<_i136.AgentsDistributorsProfileRepo>(() =>
      _i137.AgentsDistributorsProfileRepoImpl(
          gh<_i98.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i138.AddDateInstallUsecase>(
      () => _i138.AddDateInstallUsecase(gh<_i118.SupportTabRepo>()));
  gh.lazySingleton<_i139.CancelDateInstallUsecase>(
      () => _i139.CancelDateInstallUsecase(gh<_i118.SupportTabRepo>()));
  gh.lazySingleton<_i140.GetInvoiceByClientUsecase>(
      () => _i140.GetInvoiceByClientUsecase(gh<_i118.SupportTabRepo>()));
  gh.lazySingleton<_i141.ReceiveDeviceUsecase>(
      () => _i141.ReceiveDeviceUsecase(gh<_i118.SupportTabRepo>()));
  gh.lazySingleton<_i142.ReturnInvoiceApproveUsecase>(
      () => _i142.ReturnInvoiceApproveUsecase(gh<_i118.SupportTabRepo>()));
  gh.lazySingleton<_i143.SetDateDoneUsecase>(
      () => _i143.SetDateDoneUsecase(gh<_i118.SupportTabRepo>()));
  gh.lazySingleton<_i144.SetReadyInstallUsecase>(
      () => _i144.SetReadyInstallUsecase(gh<_i118.SupportTabRepo>()));
  gh.lazySingleton<_i145.GetAllUsersUseCase>(
      () => _i145.GetAllUsersUseCase(gh<_i93.InvoicesSectionRepo>()));
  gh.lazySingleton<_i146.ClientsDebtsRepo>(
      () => _i147.ClientsDebtsRepoImpl(gh<_i25.ClientsDebtsDatasource>()));
  gh.singleton<_i148.CitiesCubit>(
      () => _i148.CitiesCubit(gh<_i78.GetCitiesUseCase>()));
  gh.factory<_i149.CommunicationListRepository>(() =>
      _i150.CommunicationListRepositoryImpl(
          gh<_i35.CommunicationListDatasource>()));
  gh.lazySingleton<_i151.SupportClientsInvoicesRepo>(() =>
      _i152.SupportClientsInvoicesRepoImpl(
          gh<_i29.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i153.GetBranchesForUserUsecase>(
      () => _i153.GetBranchesForUserUsecase(gh<_i54.UsersRepository>()));
  gh.lazySingleton<_i154.GetLevelsForUserUsecase>(
      () => _i154.GetLevelsForUserUsecase(gh<_i54.UsersRepository>()));
  gh.lazySingleton<_i155.GetManagesForUserUsecase>(
      () => _i155.GetManagesForUserUsecase(gh<_i54.UsersRepository>()));
  gh.factory<_i156.GetUsersUsecase>(
      () => _i156.GetUsersUsecase(gh<_i54.UsersRepository>()));
  gh.factory<_i157.ActionLinkUsecase>(
      () => _i157.ActionLinkUsecase(gh<_i120.LinksImportantRepository>()));
  gh.factory<_i158.GetLinkUsecase>(
      () => _i158.GetLinkUsecase(gh<_i120.LinksImportantRepository>()));
  gh.lazySingleton<_i159.GetSupportClientsInvoicesUseCase>(() =>
      _i159.GetSupportClientsInvoicesUseCase(
          gh<_i151.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i160.ManageWithdrawalsRepository>(() =>
      _i161.ManageWithdrawalsRepositoryImpl(
          gh<_i33.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i162.AgentsDistributorsRepo>(() =>
      _i163.AgentsDistributorsRepoImpl(
          gh<_i67.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i164.RegionsRepository>(
      () => _i165.RegionsRepositoryImpl(gh<_i104.RegionsDatasource>()));
  gh.factory<_i166.UsersTypeCubit>(
      () => _i166.UsersTypeCubit(gh<_i73.GetUsersUsecase>()));
  gh.factory<_i167.AddParticipateCommentUsecase>(() =>
      _i167.AddParticipateCommentUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i168.AddParticipateUserUsecase>(() =>
      _i168.AddParticipateUserUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i169.EditParticipateUserUsecase>(() =>
      _i169.EditParticipateUserUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i170.GetInvoiceByIdUsecase>(
      () => _i170.GetInvoiceByIdUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i171.ParticipateClientListUsecase>(() =>
      _i171.ParticipateClientListUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i172.ParticipateCommentListUsecase>(() =>
      _i172.ParticipateCommentListUsecase(
          gh<_i91.ParticipateListRepository>()));
  gh.factory<_i173.ParticipateInvoiceListUsecase>(() =>
      _i173.ParticipateInvoiceListUsecase(
          gh<_i91.ParticipateListRepository>()));
  gh.factory<_i174.ParticipateListUsecase>(
      () => _i174.ParticipateListUsecase(gh<_i91.ParticipateListRepository>()));
  gh.lazySingleton<_i175.ChangeParticipateStatusUsecase>(() =>
      _i175.ChangeParticipateStatusUsecase(
          gh<_i91.ParticipateListRepository>()));
  gh.factory<_i176.PendingInvoicesCubit>(
      () => _i176.PendingInvoicesCubit(gh<_i74.GetPendingInvoicesUsecase>()));
  gh.factory<_i177.GetCommunicationListUsecase>(() =>
      _i177.GetCommunicationListUsecase(
          gh<_i149.CommunicationListRepository>()));
  gh.lazySingleton<_i178.GetEmployeesSalesReportsUsecase>(() =>
      _i178.GetEmployeesSalesReportsUsecase(
          gh<_i87.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i179.ClientsTransferApprovalsRepo>(() =>
      _i180.ClientsTransferApprovalsRepoImpl(
          gh<_i31.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i181.CrudClientSupportFilesUsecase>(() =>
      _i181.CrudClientSupportFilesUsecase(
          repository: gh<_i133.ClientsListRepository>()));
  gh.lazySingleton<_i182.GetClientSupportFilesUsecase>(() =>
      _i182.GetClientSupportFilesUsecase(
          repository: gh<_i133.ClientsListRepository>()));
  gh.factory<_i183.LinkCubit>(() => _i183.LinkCubit(
        gh<_i158.GetLinkUsecase>(),
        gh<_i157.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i184.GetPreviousRatingsUsecase>(
      () => _i184.GetPreviousRatingsUsecase(gh<_i70.PreviousRatingsRepo>()));
  gh.lazySingleton<_i185.WaitingAgentsRepo>(
      () => _i186.WaitingAgentsRepoImpl(gh<_i96.WaitingAgentsDataSource>()));
  gh.factory<_i187.EmployeesSalesReportsCubit>(() =>
      _i187.EmployeesSalesReportsCubit(
          gh<_i178.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i188.ChangeStateAgentUseCase>(
      () => _i188.ChangeStateAgentUseCase(gh<_i162.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i189.GetAgentsAndDistributorsUseCase>(() =>
      _i189.GetAgentsAndDistributorsUseCase(
          gh<_i162.AgentsDistributorsRepo>()));
  gh.factory<_i190.ClientsAcceptCubit>(
      () => _i190.ClientsAcceptCubit(gh<_i128.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i191.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i191.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i160.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i192.GetWithdrawalsInvoicesUsecase>(() =>
      _i192.GetWithdrawalsInvoicesUsecase(
          gh<_i160.ManageWithdrawalsRepository>()));
  gh.factory<_i193.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i193.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i160.ManageWithdrawalsRepository>()));
  gh.factory<_i194.AddTaskUsecase>(
      () => _i194.AddTaskUsecase(gh<_i65.TaskRepository>()));
  gh.factory<_i195.ChangeStatusTaskUsecase>(
      () => _i195.ChangeStatusTaskUsecase(gh<_i65.TaskRepository>()));
  gh.factory<_i196.FilterTaskUsecase>(
      () => _i196.FilterTaskUsecase(gh<_i65.TaskRepository>()));
  gh.factory<_i197.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i197.GetUsersByDepartmentAndRegionUsecase(gh<_i65.TaskRepository>()));
  gh.lazySingleton<_i198.ExceededClientsUseCase>(
      () => _i198.ExceededClientsUseCase(gh<_i62.ExceededClientsRepo>()));
  gh.lazySingleton<_i199.TransferExceededClientsUseCase>(() =>
      _i199.TransferExceededClientsUseCase(gh<_i62.ExceededClientsRepo>()));
  gh.lazySingleton<_i200.EditAdvancedConfigsUsecase>(() =>
      _i200.EditAdvancedConfigsUsecase(gh<_i89.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i201.GetAdvancedConfigsUsecase>(() =>
      _i201.GetAdvancedConfigsUsecase(gh<_i89.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i202.DatesTableRepo>(
      () => _i203.DatesTableRepoImpl(gh<_i102.DatesTableDataSource>()));
  gh.factory<_i204.AddClientUserUsecase>(
      () => _i204.AddClientUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i205.ApproveRejectClientUsecase>(() =>
      _i205.ApproveRejectClientUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i206.ChangeTypeClientUsecase>(
      () => _i206.ChangeTypeClientUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i207.EditClientUserUsecase>(
      () => _i207.EditClientUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i208.GetClientsListByRegionUseCase>(() =>
      _i208.GetClientsListByRegionUseCase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i209.GetClientsListByUserUseCase>(() =>
      _i209.GetClientsListByUserUseCase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i210.GetClientsWithFilterUserUsecase>(() =>
      _i210.GetClientsWithFilterUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i211.GetClientMarketingReportUsecase>(() =>
      _i211.GetClientMarketingReportUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i212.GetRecommendedClientsUsecase>(() =>
      _i212.GetRecommendedClientsUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i213.GetSimilarClientsUsecase>(
      () => _i213.GetSimilarClientsUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i214.ReceiveClientUserUsecase>(
      () => _i214.ReceiveClientUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i215.TransferClientUserUsecase>(
      () => _i215.TransferClientUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i216.GetVersionUseCase>(
      () => _i216.GetVersionUseCase(gh<_i112.AppRepository>()));
  gh.factory<_i217.AddTicketCubit>(
      () => _i217.AddTicketCubit(gh<_i79.AddTicketUseCase>()));
  gh.lazySingleton<_i218.EditGeneralConfigsUsecase>(() =>
      _i218.EditGeneralConfigsUsecase(gh<_i129.GeneralConfigsRepository>()));
  gh.lazySingleton<_i219.GetGeneralConfigsUsecase>(() =>
      _i219.GetGeneralConfigsUsecase(gh<_i129.GeneralConfigsRepository>()));
  gh.factory<_i220.InstallQualityCubit>(
      () => _i220.InstallQualityCubit(gh<_i135.GetInstallUseCase>()));
  gh.lazySingleton<_i221.AddAgentUseCase>(
      () => _i221.AddAgentUseCase(gh<_i114.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i222.UpdateAgentUseCase>(() =>
      _i222.UpdateAgentUseCase(gh<_i114.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i223.GetDelayInstallReportsUseCase>(() =>
      _i223.GetDelayInstallReportsUseCase(gh<_i110.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i224.CrudAgentSupportFilesUsecase>(() =>
      _i224.CrudAgentSupportFilesUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i225.GetClientsTransferApprovalsUsecase>(() =>
      _i225.GetClientsTransferApprovalsUsecase(
          gh<_i179.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i226.GetLatestClientsUseCase>(() =>
      _i226.GetLatestClientsUseCase(gh<_i68.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i227.TaskCubit>(() => _i227.TaskCubit(
        gh<_i194.AddTaskUsecase>(),
        gh<_i196.FilterTaskUsecase>(),
        gh<_i195.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i228.SupportTabCubit>(() => _i228.SupportTabCubit(
        gh<_i140.GetInvoiceByClientUsecase>(),
        gh<_i138.AddDateInstallUsecase>(),
        gh<_i143.SetDateDoneUsecase>(),
        gh<_i144.SetReadyInstallUsecase>(),
        gh<_i142.ReturnInvoiceApproveUsecase>(),
        gh<_i141.ReceiveDeviceUsecase>(),
        gh<_i139.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i229.AddAgentDateUseCase>(() =>
      _i229.AddAgentDateUseCase(gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.factory<_i230.ClientsListBloc>(() => _i230.ClientsListBloc(
        gh<_i210.GetClientsWithFilterUserUsecase>(),
        gh<_i212.GetRecommendedClientsUsecase>(),
        gh<_i204.AddClientUserUsecase>(),
        gh<_i207.EditClientUserUsecase>(),
        gh<_i206.ChangeTypeClientUsecase>(),
        gh<_i213.GetSimilarClientsUsecase>(),
        gh<_i205.ApproveRejectClientUsecase>(),
        gh<_i181.CrudClientSupportFilesUsecase>(),
        gh<_i182.GetClientSupportFilesUsecase>(),
        gh<_i215.TransferClientUserUsecase>(),
        gh<_i214.ReceiveClientUserUsecase>(),
        gh<_i211.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i231.AgentsDistributorsActionsCubit>(
      () => _i231.AgentsDistributorsActionsCubit(
            gh<_i78.GetCitiesUseCase>(),
            gh<_i221.AddAgentUseCase>(),
            gh<_i222.UpdateAgentUseCase>(),
          ));
  gh.factory<_i232.LoginCubit>(() => _i232.LoginCubit(
        gh<_i125.LoginUsecase>(),
        gh<_i127.VerifyOtpUsecase>(),
        gh<_i123.CacheTokenUsecase>(),
        gh<_i124.GetTokenUsecase>(),
        gh<_i126.ValidateTokenUsecase>(),
      ));
  gh.factory<_i233.InvoicesSectionCubit>(() => _i233.InvoicesSectionCubit(
        gh<_i122.GetInvoicesByPrivilegesUsecase>(),
        gh<_i189.GetAgentsAndDistributorsUseCase>(),
        gh<_i174.ParticipateListUsecase>(),
        gh<_i145.GetAllUsersUseCase>(),
      ));
  gh.factory<_i234.AddLevelUsecase>(
      () => _i234.AddLevelUsecase(gh<_i108.PrivilegeRepository>()));
  gh.factory<_i235.GetLevelsUsecase>(
      () => _i235.GetLevelsUsecase(gh<_i108.PrivilegeRepository>()));
  gh.factory<_i236.GetPrivilegesUsecase>(
      () => _i236.GetPrivilegesUsecase(gh<_i108.PrivilegeRepository>()));
  gh.factory<_i237.UpdatePrivilegeUsecase>(
      () => _i237.UpdatePrivilegeUsecase(gh<_i108.PrivilegeRepository>()));
  gh.factory<_i238.AttachmentsRowCubit>(() => _i238.AttachmentsRowCubit(
        gh<_i182.GetClientSupportFilesUsecase>(),
        gh<_i181.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i239.AddCommentUsecase>(
      () => _i239.AddCommentUsecase(gh<_i131.CompanyRepository>()));
  gh.factory<_i240.GetCommentUsecase>(
      () => _i240.GetCommentUsecase(gh<_i131.CompanyRepository>()));
  gh.factory<_i241.DelayInstallReportsCubit>(() =>
      _i241.DelayInstallReportsCubit(
          gh<_i223.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i242.GetRegionsByIdCountryUseCase>(
      () => _i242.GetRegionsByIdCountryUseCase(gh<_i164.RegionsRepository>()));
  gh.lazySingleton<_i243.PrivilegeCubit>(() => _i243.PrivilegeCubit(
        gh<_i235.GetLevelsUsecase>(),
        gh<_i236.GetPrivilegesUsecase>(),
        gh<_i237.UpdatePrivilegeUsecase>(),
        gh<_i234.AddLevelUsecase>(),
      ));
  gh.factory<_i244.AdvancedCofigsCubit>(() => _i244.AdvancedCofigsCubit(
        gh<_i201.GetAdvancedConfigsUsecase>(),
        gh<_i200.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i245.SupportClientsInvoicesCubit>(() =>
      _i245.SupportClientsInvoicesCubit(
          gh<_i159.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i246.ParticipateListBloc>(() => _i246.ParticipateListBloc(
        gh<_i174.ParticipateListUsecase>(),
        gh<_i168.AddParticipateUserUsecase>(),
        gh<_i169.EditParticipateUserUsecase>(),
        gh<_i171.ParticipateClientListUsecase>(),
        gh<_i173.ParticipateInvoiceListUsecase>(),
        gh<_i170.GetInvoiceByIdUsecase>(),
        gh<_i172.ParticipateCommentListUsecase>(),
        gh<_i167.AddParticipateCommentUsecase>(),
        gh<_i175.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i247.ClientsTransferApprovalsCubit>(() =>
      _i247.ClientsTransferApprovalsCubit(
          gh<_i225.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i248.GeneralCofigsCubit>(() => _i248.GeneralCofigsCubit(
        gh<_i219.GetGeneralConfigsUsecase>(),
        gh<_i218.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i249.GetClientsDebtsUsecase>(
      () => _i249.GetClientsDebtsUsecase(gh<_i146.ClientsDebtsRepo>()));
  gh.lazySingleton<_i250.AddAgentCommentUsecase>(() =>
      _i250.AddAgentCommentUsecase(gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i251.DoneTrainingUsecase>(() =>
      _i251.DoneTrainingUsecase(gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i252.GetAgentUsecase>(
      () => _i252.GetAgentUsecase(gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i253.GetAgentClientListUsecase>(() =>
      _i253.GetAgentClientListUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i254.GetAgentCommentsListUsecase>(() =>
      _i254.GetAgentCommentsListUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i255.GetAgentDatesListUsecase>(() =>
      _i255.GetAgentDatesListUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i256.GetAgentInvoiceListUsecase>(() =>
      _i256.GetAgentInvoiceListUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.factory<_i257.AddRejectReasonsUsecase>(() =>
      _i257.AddRejectReasonsUsecase(gh<_i160.ManageWithdrawalsRepository>()));
  gh.factory<_i258.EditRejectReasonsUsecase>(() =>
      _i258.EditRejectReasonsUsecase(gh<_i160.ManageWithdrawalsRepository>()));
  gh.factory<_i259.GetRejectReasonsUsecase>(() =>
      _i259.GetRejectReasonsUsecase(gh<_i160.ManageWithdrawalsRepository>()));
  gh.factory<_i260.GetUserSeriesUsecase>(() =>
      _i260.GetUserSeriesUsecase(gh<_i160.ManageWithdrawalsRepository>()));
  gh.factory<_i261.GetWithdrawnDetailsUsecase>(() =>
      _i261.GetWithdrawnDetailsUsecase(
          gh<_i160.ManageWithdrawalsRepository>()));
  gh.factory<_i262.SetApproveSeriesUsecase>(() =>
      _i262.SetApproveSeriesUsecase(gh<_i160.ManageWithdrawalsRepository>()));
  gh.factory<_i263.UpdateSeriesUsecase>(
      () => _i263.UpdateSeriesUsecase(gh<_i160.ManageWithdrawalsRepository>()));
  gh.singleton<_i264.AppManagerCubit>(
      () => _i264.AppManagerCubit(gh<_i216.GetVersionUseCase>()));
  gh.factory<_i265.RegionsCubit>(
      () => _i265.RegionsCubit(gh<_i242.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i266.GetWaitingAgentsUsecase>(
      () => _i266.GetWaitingAgentsUsecase(gh<_i185.WaitingAgentsRepo>()));
  gh.factory<_i267.UsersCubit>(() => _i267.UsersCubit(
        gh<_i156.GetUsersUsecase>(),
        gh<_i64.ActionUserUsecase>(),
        gh<_i197.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i155.GetManagesForUserUsecase>(),
        gh<_i154.GetLevelsForUserUsecase>(),
        gh<_i153.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i268.PreviousRatingsCubit>(
      () => _i268.PreviousRatingsCubit(gh<_i184.GetPreviousRatingsUsecase>()));
  gh.factory<_i269.CommunicationListBloc>(() =>
      _i269.CommunicationListBloc(gh<_i177.GetCommunicationListUsecase>()));
  gh.factory<_i270.AgentsDistributorsCubit>(() => _i270.AgentsDistributorsCubit(
        gh<_i189.GetAgentsAndDistributorsUseCase>(),
        gh<_i188.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i271.ExceededClientsCubit>(() => _i271.ExceededClientsCubit(
        gh<_i198.ExceededClientsUseCase>(),
        gh<_i199.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i272.LatestClientsUpdatesCubit>(() =>
      _i272.LatestClientsUpdatesCubit(gh<_i226.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i273.CancelScheduleUsecase>(
      () => _i273.CancelScheduleUsecase(gh<_i202.DatesTableRepo>()));
  gh.lazySingleton<_i274.ChangeDateToDonUsecase>(
      () => _i274.ChangeDateToDonUsecase(gh<_i202.DatesTableRepo>()));
  gh.lazySingleton<_i275.GetDateInstallationUsecase>(
      () => _i275.GetDateInstallationUsecase(gh<_i202.DatesTableRepo>()));
  gh.lazySingleton<_i276.GetInvoicesByClientForDateUsecase>(() =>
      _i276.GetInvoicesByClientForDateUsecase(gh<_i202.DatesTableRepo>()));
  gh.lazySingleton<_i277.GetSubscribedClientsUsecase>(
      () => _i277.GetSubscribedClientsUsecase(gh<_i202.DatesTableRepo>()));
  gh.lazySingleton<_i278.RescheduleDateUsecase>(
      () => _i278.RescheduleDateUsecase(gh<_i202.DatesTableRepo>()));
  gh.lazySingleton<_i279.ReturnScheduleVisitToOpenUsecase>(
      () => _i279.ReturnScheduleVisitToOpenUsecase(gh<_i202.DatesTableRepo>()));
  gh.factory<_i280.AgentsDistributorsProfileBloc>(
      () => _i280.AgentsDistributorsProfileBloc(
            gh<_i253.GetAgentClientListUsecase>(),
            gh<_i256.GetAgentInvoiceListUsecase>(),
            gh<_i170.GetInvoiceByIdUsecase>(),
            gh<_i254.GetAgentCommentsListUsecase>(),
            gh<_i250.AddAgentCommentUsecase>(),
            gh<_i251.DoneTrainingUsecase>(),
            gh<_i229.AddAgentDateUseCase>(),
            gh<_i255.GetAgentDatesListUsecase>(),
            gh<_i224.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i281.DatesTableCubit>(() => _i281.DatesTableCubit(
        gh<_i275.GetDateInstallationUsecase>(),
        gh<_i278.RescheduleDateUsecase>(),
        gh<_i274.ChangeDateToDonUsecase>(),
        gh<_i273.CancelScheduleUsecase>(),
        gh<_i279.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i277.GetSubscribedClientsUsecase>(),
        gh<_i276.GetInvoicesByClientForDateUsecase>(),
        gh<_i138.AddDateInstallUsecase>(),
      ));
  gh.factory<_i282.CompanyCubit>(() => _i282.CompanyCubit(
        gh<_i240.GetCommentUsecase>(),
        gh<_i239.AddCommentUsecase>(),
      ));
  gh.factory<_i283.ClientsDebtsCubit>(
      () => _i283.ClientsDebtsCubit(gh<_i249.GetClientsDebtsUsecase>()));
  gh.factory<_i284.ManageWithdrawalsCubit>(() => _i284.ManageWithdrawalsCubit(
        gh<_i260.GetUserSeriesUsecase>(),
        gh<_i263.UpdateSeriesUsecase>(),
        gh<_i156.GetUsersUsecase>(),
        gh<_i192.GetWithdrawalsInvoicesUsecase>(),
        gh<_i193.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i262.SetApproveSeriesUsecase>(),
        gh<_i261.GetWithdrawnDetailsUsecase>(),
        gh<_i257.AddRejectReasonsUsecase>(),
        gh<_i259.GetRejectReasonsUsecase>(),
        gh<_i258.EditRejectReasonsUsecase>(),
        gh<_i191.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i285.WaitingAgentsCubit>(
      () => _i285.WaitingAgentsCubit(gh<_i266.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i286.AppModule {}
