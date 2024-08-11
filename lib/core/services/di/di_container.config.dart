// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i14;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i34;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i120;
import '../../../features/app/domain/repositories/app_repository.dart' as _i119;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i222;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i277;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i204;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i90;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i241;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i240;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i255;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i256;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i257;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i258;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i259;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i298;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i19;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i24;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i23;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i131;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i194;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i28;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i46;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i45;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i83;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i84;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i85;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i87;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i86;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i88;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i223;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i105;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i89;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i35;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i152;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i151;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i181;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i283;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i27;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i114;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i113;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i138;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i226;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i18;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i75;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i74;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i188;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i282;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i43;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i81;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i80;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i82;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i167;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i76;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i127;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i126;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i141;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i142;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i143;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i144;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i145;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i146;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i147;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i234;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i108;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i169;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i168;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i250;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i278;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i41;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i55;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i54;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i77;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i170;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i44;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i94;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i93;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i205;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i206;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i252;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i58;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i133;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i132;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i224;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i225;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i261;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i36;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i116;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i115;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i242;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i243;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i244;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i245;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i251;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i30;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i57;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i56;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i65;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i155;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i156;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i157;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i158;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i281;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i33;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i163;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i162;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i270;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i271;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i195;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i272;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i273;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i197;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i196;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i274;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i275;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i276;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i299;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i25;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i150;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i149;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i262;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i297;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i31;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i184;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i183;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i231;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i260;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i26;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i60;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i59;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i101;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i123;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i11;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i62;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i61;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i78;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i180;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i37;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i137;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i136;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i210;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i211;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i212;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i185;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i213;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i217;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i186;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i214;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i215;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i216;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i218;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i219;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i220;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i221;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i236;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i38;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i135;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i134;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i247;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i248;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i296;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i32;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i64;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i63;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i202;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i203;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i285;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i79;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i98;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i97;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i148;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i130;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i239;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i42;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i72;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i71;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i232;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i286;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i13;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i70;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i104;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i122;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i140;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i165;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i121;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i139;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i164;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i263;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i235;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i227;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i192;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i230;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i264;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i265;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i266;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i267;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i268;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i269;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i193;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i228;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i238;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i294;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i284;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i39;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i129;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i128;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i159;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i160;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i187;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i21;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i96;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i95;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i171;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i172;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i173;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i174;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i176;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i177;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i178;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i254;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i92;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i91;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i182;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i191;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i12;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i103;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i102;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i166;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i280;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i17;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i48;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i47;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i125;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i237;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i16;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i67;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i66;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i73;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i207;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i106;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i209;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i208;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i287;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i288;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i289;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i290;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i291;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i292;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i293;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i295;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i10;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i52;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i51;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i107;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i124;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i20;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i118;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i117;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i229;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i249;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i50;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i49;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i53;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i99;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i29;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i154;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i153;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i161;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i253;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i100;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i190;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i189;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i279;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i300;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i40;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i69;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i68;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i198;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i199;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i200;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i201;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i233;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i246;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i110;
import '../cache_services/prefs_consumer.dart' as _i112;
import '../cache_services/secure_storage_consumer.dart' as _i111;
import '../maps/location_services.dart' as _i109;
import 'di_container.dart' as _i301;

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
  gh.lazySingleton<_i13.AgentsDistributorsActionsDataSource>(() =>
      _i13.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i14.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i15.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i16.ClientsInstallReportsDatasource>(
      () => _i16.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i17.RegionsSalesReportsDatasource>(
      () => _i17.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i18.PreviousRatingsDatasource>(
      () => _i18.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i19.ClientsAcceptDatasource>(
      () => _i19.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.DelayInstallReportsDatasource>(
      () => _i20.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.ParticipatesListDatasource>(
      () => _i21.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.EmployeesSalesReportsDatasource>(
      () => _i22.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.ClientsAcceptRepository>(() =>
      _i24.ClientsAcceptRepositoryImpl(gh<_i19.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i25.ClientsDebtsDatasource>(
      () => _i25.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.FinancePendingDatasource>(
      () => _i26.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.InstallQualityDatasource>(
      () => _i27.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.TicketsDataSource>(
      () => _i28.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.SupportClientsInvoicesDatasource>(
      () => _i29.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.UsersDatasource>(
      () => _i30.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i14.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i15.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i31.ClientsTransferApprovalsDatasource>(
      () => _i31.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.ExceededClientsDatasource>(
      () => _i32.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.ManageWithdrawalsDatasource>(
      () => _i33.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i34.AppDatasource>(
      () => _i34.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i35.CommunicationListDatasource>(
      () => _i35.CommunicationListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i36.PrivilegeDatasource>(
      () => _i36.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i37.ClientsListDatasource>(
      () => _i37.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i38.CommentCompanyDatasource>(
      () => _i38.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i39.LinkDatasource>(
      () => _i39.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i40.TaskDatasource>(
      () => _i40.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.UsersDatasource>(
      () => _i41.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i42.LatestClientsUpdatesDatasource>(
      () => _i42.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i43.CitiesDatasource>(
      () => _i43.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.AdvancedConfigsDatasource>(
      () => _i44.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.TicketsRepo>(
      () => _i46.TicketsRepoImpl(gh<_i28.TicketsDataSource>()));
  gh.lazySingleton<_i47.RegionsSalesReportsRepo>(() =>
      _i48.RegionsSalesReportsRepoImpl(
          gh<_i17.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i49.SupportClientsAcceptRepository>(() =>
      _i50.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i51.DelayAfterInstallRepo>(() =>
      _i52.DelayAfterInstallRepoImpl(gh<_i10.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i53.GetSupportClientsAcceptUseCase>(() =>
      _i53.GetSupportClientsAcceptUseCase(
          gh<_i49.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i54.UsersRepository>(
      () => _i55.UsersRepositoryImpl(gh<_i41.UsersDatasource>()));
  gh.lazySingleton<_i56.UsersRepository>(
      () => _i57.UsersRepositoryImpl(gh<_i30.UsersDatasource>()));
  gh.lazySingleton<_i58.GeneralConfigsDatasource>(
      () => _i58.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i59.FinancePendingRepo>(
      () => _i60.FinancePendingRepoImpl(gh<_i26.FinancePendingDatasource>()));
  gh.lazySingleton<_i61.PendingInvoicesRepo>(
      () => _i62.PendingInvoicesRepoImpl(gh<_i11.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i63.ExceededClientsRepo>(
      () => _i64.ExceededClientsRepoImpl(gh<_i32.ExceededClientsDatasource>()));
  gh.factory<_i65.ActionUserUsecase>(
      () => _i65.ActionUserUsecase(gh<_i56.UsersRepository>()));
  gh.lazySingleton<_i66.ClientsInstallReportsRepo>(() =>
      _i67.ClientsInstallReportsRepoImpl(
          gh<_i16.ClientsInstallReportsDatasource>()));
  gh.factory<_i68.TaskRepository>(
      () => _i69.TaskRepositoryImpl(gh<_i40.TaskDatasource>()));
  gh.lazySingleton<_i70.AgentsDistributorsDataSource>(
      () => _i70.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i71.LatestClientsUpdatesRepository>(() =>
      _i72.LatestClientsUpdatesRepositoryImpl(
          gh<_i42.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i73.GetClientsInstallReportsUsecase>(() =>
      _i73.GetClientsInstallReportsUsecase(
          gh<_i66.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i74.PreviousRatingsRepo>(
      () => _i75.PreviousRatingsRepoImpl(gh<_i18.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i76.SupportTabDataSource>(
      () => _i76.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i77.GetUsersUsecase>(
      () => _i77.GetUsersUsecase(gh<_i54.UsersRepository>()));
  gh.lazySingleton<_i78.GetPendingInvoicesUsecase>(
      () => _i78.GetPendingInvoicesUsecase(gh<_i61.PendingInvoicesRepo>()));
  gh.lazySingleton<_i79.InvoicesTabDataSource>(
      () => _i79.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i80.CitiesRepository>(
      () => _i81.CitiesRepositoryImpl(gh<_i43.CitiesDatasource>()));
  gh.lazySingleton<_i82.GetCitiesUseCase>(
      () => _i82.GetCitiesUseCase(gh<_i80.CitiesRepository>()));
  gh.lazySingleton<_i83.AddTicketUseCase>(
      () => _i83.AddTicketUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i84.EditTicketTypeUseCase>(
      () => _i84.EditTicketTypeUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i85.GetClientTicketsUseCase>(
      () => _i85.GetClientTicketsUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i86.GetTicketsUseCase>(
      () => _i86.GetTicketsUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i87.GetTicketByIdUseCase>(
      () => _i87.GetTicketByIdUseCase(gh<_i45.TicketsRepo>()));
  gh.lazySingleton<_i88.TransferTicketUseCase>(
      () => _i88.TransferTicketUseCase(gh<_i45.TicketsRepo>()));
  gh.factory<_i89.TicketsCubit>(() => _i89.TicketsCubit(
        gh<_i86.GetTicketsUseCase>(),
        gh<_i87.GetTicketByIdUseCase>(),
        gh<_i85.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i90.LoginRemoteDataSource>(
      () => _i90.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i91.EmployeesSalesReportsRepo>(() =>
      _i92.EmployeesSalesReportsRepoImpl(
          gh<_i22.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i93.AdvancedConfigsRepository>(() =>
      _i94.AdvancedConfigsRepositoryImpl(gh<_i44.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i95.ParticipateListRepository>(() =>
      _i96.ParticipateListRepositoryImpl(
          gh<_i21.ParticipatesListDatasource>()));
  gh.lazySingleton<_i97.InvoicesSectionRepo>(
      () => _i98.InvoicesTabRepoImpl(gh<_i79.InvoicesTabDataSource>()));
  gh.factory<_i99.SupportClientsAcceptCubit>(() =>
      _i99.SupportClientsAcceptCubit(
          gh<_i53.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i100.WaitingAgentsDataSource>(
      () => _i100.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i101.GetFinancePendingInvoicesUsecase>(() =>
      _i101.GetFinancePendingInvoicesUsecase(gh<_i59.FinancePendingRepo>()));
  gh.lazySingleton<_i102.ProductsSalesReportsRepo>(() =>
      _i103.ProductsSalesReportsRepoImpl(
          gh<_i12.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i104.AgentsDistributorsProfileDataSource>(() =>
      _i104.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i105.EditTicketCubit>(() => _i105.EditTicketCubit(
        gh<_i84.EditTicketTypeUseCase>(),
        gh<_i88.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i106.DatesTableDataSource>(
      () => _i106.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i107.GetDelayAfterInstallUseCase>(() =>
      _i107.GetDelayAfterInstallUseCase(gh<_i51.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i108.RegionsDatasource>(
      () => _i108.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i109.LocationServices>(
      () => _i109.LocationServices(gh<_i6.Location>()));
  gh.singleton<_i110.CacheServices>(
    () => _i111.SecureStorageConsumer(gh<_i15.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i110.CacheServices>(() async =>
      _i112.PrefsConsumer(await gh.getAsync<_i14.SharedPreferences>()));
  gh.lazySingleton<_i113.InstallQualityRepo>(
      () => _i114.InstallQualityRepoImpl(gh<_i27.InstallQualityDatasource>()));
  gh.factory<_i115.PrivilegeRepository>(
      () => _i116.PrivilegeRepositoryImpl(gh<_i36.PrivilegeDatasource>()));
  gh.lazySingleton<_i117.DelayInstallReportsRepo>(() =>
      _i118.DelayInstallReportsRepoImpl(
          gh<_i20.DelayInstallReportsDatasource>()));
  gh.factory<_i119.AppRepository>(
      () => _i120.AppRepositoryImpl(gh<_i34.AppDatasource>()));
  gh.lazySingleton<_i121.AgentsDistributorsActionsRepo>(() =>
      _i122.AgentsDistributorsActionsRepoImpl(
          gh<_i13.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i123.FinancePendingCubit>(() =>
      _i123.FinancePendingCubit(gh<_i101.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i124.DelayAfterInstallCubit>(() =>
      _i124.DelayAfterInstallCubit(gh<_i107.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i125.GetRegionsSalesReportsUsecase>(() =>
      _i125.GetRegionsSalesReportsUsecase(gh<_i47.RegionsSalesReportsRepo>()));
  gh.lazySingleton<_i126.SupportTabRepo>(
      () => _i127.SupportTabRepoImpl(gh<_i76.SupportTabDataSource>()));
  gh.factory<_i128.LinksImportantRepository>(
      () => _i129.LinkRepositoryImpl(gh<_i39.LinkDatasource>()));
  gh.lazySingleton<_i130.GetInvoicesByPrivilegesUsecase>(() =>
      _i130.GetInvoicesByPrivilegesUsecase(gh<_i97.InvoicesSectionRepo>()));
  gh.lazySingleton<_i131.GetClientsAcceptUseCase>(
      () => _i131.GetClientsAcceptUseCase(gh<_i23.ClientsAcceptRepository>()));
  gh.lazySingleton<_i132.GeneralConfigsRepository>(() =>
      _i133.GeneralConfigsRepositoryImpl(gh<_i58.GeneralConfigsDatasource>()));
  gh.factory<_i134.CompanyRepository>(
      () => _i135.CompanyRepositoryImpl(gh<_i38.CommentCompanyDatasource>()));
  gh.factory<_i136.ClientsListRepository>(
      () => _i137.ClientsListRepositoryImpl(gh<_i37.ClientsListDatasource>()));
  gh.lazySingleton<_i138.GetInstallUseCase>(
      () => _i138.GetInstallUseCase(gh<_i113.InstallQualityRepo>()));
  gh.lazySingleton<_i139.AgentsDistributorsProfileRepo>(() =>
      _i140.AgentsDistributorsProfileRepoImpl(
          gh<_i104.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i141.AddDateInstallUsecase>(
      () => _i141.AddDateInstallUsecase(gh<_i126.SupportTabRepo>()));
  gh.lazySingleton<_i142.CancelDateInstallUsecase>(
      () => _i142.CancelDateInstallUsecase(gh<_i126.SupportTabRepo>()));
  gh.lazySingleton<_i143.GetInvoiceByClientUsecase>(
      () => _i143.GetInvoiceByClientUsecase(gh<_i126.SupportTabRepo>()));
  gh.lazySingleton<_i144.ReceiveDeviceUsecase>(
      () => _i144.ReceiveDeviceUsecase(gh<_i126.SupportTabRepo>()));
  gh.lazySingleton<_i145.ReturnInvoiceApproveUsecase>(
      () => _i145.ReturnInvoiceApproveUsecase(gh<_i126.SupportTabRepo>()));
  gh.lazySingleton<_i146.SetDateDoneUsecase>(
      () => _i146.SetDateDoneUsecase(gh<_i126.SupportTabRepo>()));
  gh.lazySingleton<_i147.SetReadyInstallUsecase>(
      () => _i147.SetReadyInstallUsecase(gh<_i126.SupportTabRepo>()));
  gh.lazySingleton<_i148.GetAllUsersUseCase>(
      () => _i148.GetAllUsersUseCase(gh<_i97.InvoicesSectionRepo>()));
  gh.lazySingleton<_i149.ClientsDebtsRepo>(
      () => _i150.ClientsDebtsRepoImpl(gh<_i25.ClientsDebtsDatasource>()));
  gh.factory<_i151.CommunicationListRepository>(() =>
      _i152.CommunicationListRepositoryImpl(
          gh<_i35.CommunicationListDatasource>()));
  gh.lazySingleton<_i153.SupportClientsInvoicesRepo>(() =>
      _i154.SupportClientsInvoicesRepoImpl(
          gh<_i29.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i155.GetBranchesForUserUsecase>(
      () => _i155.GetBranchesForUserUsecase(gh<_i56.UsersRepository>()));
  gh.lazySingleton<_i156.GetLevelsForUserUsecase>(
      () => _i156.GetLevelsForUserUsecase(gh<_i56.UsersRepository>()));
  gh.lazySingleton<_i157.GetManagesForUserUsecase>(
      () => _i157.GetManagesForUserUsecase(gh<_i56.UsersRepository>()));
  gh.factory<_i158.GetUsersUsecase>(
      () => _i158.GetUsersUsecase(gh<_i56.UsersRepository>()));
  gh.factory<_i159.ActionLinkUsecase>(
      () => _i159.ActionLinkUsecase(gh<_i128.LinksImportantRepository>()));
  gh.factory<_i160.GetLinkUsecase>(
      () => _i160.GetLinkUsecase(gh<_i128.LinksImportantRepository>()));
  gh.lazySingleton<_i161.GetSupportClientsInvoicesUseCase>(() =>
      _i161.GetSupportClientsInvoicesUseCase(
          gh<_i153.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i162.ManageWithdrawalsRepository>(() =>
      _i163.ManageWithdrawalsRepositoryImpl(
          gh<_i33.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i164.AgentsDistributorsRepo>(() =>
      _i165.AgentsDistributorsRepoImpl(
          gh<_i70.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i166.GetProductsSalesReportsUsecase>(() =>
      _i166.GetProductsSalesReportsUsecase(
          gh<_i102.ProductsSalesReportsRepo>()));
  gh.singleton<_i167.CitiesCubit>(
      () => _i167.CitiesCubit(gh<_i82.GetCitiesUseCase>()));
  gh.lazySingleton<_i168.RegionsRepository>(
      () => _i169.RegionsRepositoryImpl(gh<_i108.RegionsDatasource>()));
  gh.factory<_i170.UsersTypeCubit>(
      () => _i170.UsersTypeCubit(gh<_i77.GetUsersUsecase>()));
  gh.factory<_i171.AddParticipateCommentUsecase>(() =>
      _i171.AddParticipateCommentUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i172.AddParticipateUserUsecase>(() =>
      _i172.AddParticipateUserUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i173.EditParticipateUserUsecase>(() =>
      _i173.EditParticipateUserUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i174.GetInvoiceByIdUsecase>(
      () => _i174.GetInvoiceByIdUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i175.ParticipateClientListUsecase>(() =>
      _i175.ParticipateClientListUsecase(gh<_i95.ParticipateListRepository>()));
  gh.factory<_i176.ParticipateCommentListUsecase>(() =>
      _i176.ParticipateCommentListUsecase(
          gh<_i95.ParticipateListRepository>()));
  gh.factory<_i177.ParticipateInvoiceListUsecase>(() =>
      _i177.ParticipateInvoiceListUsecase(
          gh<_i95.ParticipateListRepository>()));
  gh.factory<_i178.ParticipateListUsecase>(
      () => _i178.ParticipateListUsecase(gh<_i95.ParticipateListRepository>()));
  gh.lazySingleton<_i179.ChangeParticipateStatusUsecase>(() =>
      _i179.ChangeParticipateStatusUsecase(
          gh<_i95.ParticipateListRepository>()));
  gh.factory<_i180.PendingInvoicesCubit>(
      () => _i180.PendingInvoicesCubit(gh<_i78.GetPendingInvoicesUsecase>()));
  gh.factory<_i181.GetCommunicationListUsecase>(() =>
      _i181.GetCommunicationListUsecase(
          gh<_i151.CommunicationListRepository>()));
  gh.lazySingleton<_i182.GetEmployeesSalesReportsUsecase>(() =>
      _i182.GetEmployeesSalesReportsUsecase(
          gh<_i91.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i183.ClientsTransferApprovalsRepo>(() =>
      _i184.ClientsTransferApprovalsRepoImpl(
          gh<_i31.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i185.CrudClientSupportFilesUsecase>(() =>
      _i185.CrudClientSupportFilesUsecase(
          repository: gh<_i136.ClientsListRepository>()));
  gh.lazySingleton<_i186.GetClientSupportFilesUsecase>(() =>
      _i186.GetClientSupportFilesUsecase(
          repository: gh<_i136.ClientsListRepository>()));
  gh.factory<_i187.LinkCubit>(() => _i187.LinkCubit(
        gh<_i160.GetLinkUsecase>(),
        gh<_i159.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i188.GetPreviousRatingsUsecase>(
      () => _i188.GetPreviousRatingsUsecase(gh<_i74.PreviousRatingsRepo>()));
  gh.lazySingleton<_i189.WaitingAgentsRepo>(
      () => _i190.WaitingAgentsRepoImpl(gh<_i100.WaitingAgentsDataSource>()));
  gh.factory<_i191.EmployeesSalesReportsCubit>(() =>
      _i191.EmployeesSalesReportsCubit(
          gh<_i182.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i192.ChangeStateAgentUseCase>(
      () => _i192.ChangeStateAgentUseCase(gh<_i164.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i193.GetAgentsAndDistributorsUseCase>(() =>
      _i193.GetAgentsAndDistributorsUseCase(
          gh<_i164.AgentsDistributorsRepo>()));
  gh.factory<_i194.ClientsAcceptCubit>(
      () => _i194.ClientsAcceptCubit(gh<_i131.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i195.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i195.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i162.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i196.GetWithdrawalsInvoicesUsecase>(() =>
      _i196.GetWithdrawalsInvoicesUsecase(
          gh<_i162.ManageWithdrawalsRepository>()));
  gh.factory<_i197.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i197.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i162.ManageWithdrawalsRepository>()));
  gh.factory<_i198.AddTaskUsecase>(
      () => _i198.AddTaskUsecase(gh<_i68.TaskRepository>()));
  gh.factory<_i199.ChangeStatusTaskUsecase>(
      () => _i199.ChangeStatusTaskUsecase(gh<_i68.TaskRepository>()));
  gh.factory<_i200.FilterTaskUsecase>(
      () => _i200.FilterTaskUsecase(gh<_i68.TaskRepository>()));
  gh.factory<_i201.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i201.GetUsersByDepartmentAndRegionUsecase(gh<_i68.TaskRepository>()));
  gh.lazySingleton<_i202.ExceededClientsUseCase>(
      () => _i202.ExceededClientsUseCase(gh<_i63.ExceededClientsRepo>()));
  gh.lazySingleton<_i203.TransferExceededClientsUseCase>(() =>
      _i203.TransferExceededClientsUseCase(gh<_i63.ExceededClientsRepo>()));
  gh.lazySingleton<_i204.LoginLocalDataSource>(() =>
      _i204.LoginLocalDataSourceImpl(
          gh<_i110.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i205.EditAdvancedConfigsUsecase>(() =>
      _i205.EditAdvancedConfigsUsecase(gh<_i93.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i206.GetAdvancedConfigsUsecase>(() =>
      _i206.GetAdvancedConfigsUsecase(gh<_i93.AdvancedConfigsRepository>()));
  gh.factory<_i207.ClientsInstallReportsCubit>(() =>
      _i207.ClientsInstallReportsCubit(
          gh<_i73.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i208.DatesTableRepo>(
      () => _i209.DatesTableRepoImpl(gh<_i106.DatesTableDataSource>()));
  gh.factory<_i210.AddClientUserUsecase>(
      () => _i210.AddClientUserUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i211.ApproveRejectClientUsecase>(() =>
      _i211.ApproveRejectClientUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i212.ChangeTypeClientUsecase>(
      () => _i212.ChangeTypeClientUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i213.EditClientUserUsecase>(
      () => _i213.EditClientUserUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i214.GetClientsListByRegionUseCase>(() =>
      _i214.GetClientsListByRegionUseCase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i215.GetClientsListByUserUseCase>(() =>
      _i215.GetClientsListByUserUseCase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i216.GetClientsWithFilterUserUsecase>(() =>
      _i216.GetClientsWithFilterUserUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i217.GetClientMarketingReportUsecase>(() =>
      _i217.GetClientMarketingReportUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i218.GetRecommendedClientsUsecase>(() =>
      _i218.GetRecommendedClientsUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i219.GetSimilarClientsUsecase>(
      () => _i219.GetSimilarClientsUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i220.ReceiveClientUserUsecase>(
      () => _i220.ReceiveClientUserUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i221.TransferClientUserUsecase>(
      () => _i221.TransferClientUserUsecase(gh<_i136.ClientsListRepository>()));
  gh.factory<_i222.GetVersionUseCase>(
      () => _i222.GetVersionUseCase(gh<_i119.AppRepository>()));
  gh.factory<_i223.AddTicketCubit>(
      () => _i223.AddTicketCubit(gh<_i83.AddTicketUseCase>()));
  gh.lazySingleton<_i224.EditGeneralConfigsUsecase>(() =>
      _i224.EditGeneralConfigsUsecase(gh<_i132.GeneralConfigsRepository>()));
  gh.lazySingleton<_i225.GetGeneralConfigsUsecase>(() =>
      _i225.GetGeneralConfigsUsecase(gh<_i132.GeneralConfigsRepository>()));
  gh.factory<_i226.InstallQualityCubit>(
      () => _i226.InstallQualityCubit(gh<_i138.GetInstallUseCase>()));
  gh.lazySingleton<_i227.AddAgentUseCase>(
      () => _i227.AddAgentUseCase(gh<_i121.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i228.UpdateAgentUseCase>(() =>
      _i228.UpdateAgentUseCase(gh<_i121.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i229.GetDelayInstallReportsUseCase>(() =>
      _i229.GetDelayInstallReportsUseCase(gh<_i117.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i230.CrudAgentSupportFilesUsecase>(() =>
      _i230.CrudAgentSupportFilesUsecase(
          gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i231.GetClientsTransferApprovalsUsecase>(() =>
      _i231.GetClientsTransferApprovalsUsecase(
          gh<_i183.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i232.GetLatestClientsUseCase>(() =>
      _i232.GetLatestClientsUseCase(gh<_i71.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i233.TaskCubit>(() => _i233.TaskCubit(
        gh<_i198.AddTaskUsecase>(),
        gh<_i200.FilterTaskUsecase>(),
        gh<_i199.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i234.SupportTabCubit>(() => _i234.SupportTabCubit(
        gh<_i143.GetInvoiceByClientUsecase>(),
        gh<_i141.AddDateInstallUsecase>(),
        gh<_i146.SetDateDoneUsecase>(),
        gh<_i147.SetReadyInstallUsecase>(),
        gh<_i145.ReturnInvoiceApproveUsecase>(),
        gh<_i144.ReceiveDeviceUsecase>(),
        gh<_i142.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i235.AddAgentDateUseCase>(() =>
      _i235.AddAgentDateUseCase(gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.factory<_i236.ClientsListBloc>(() => _i236.ClientsListBloc(
        gh<_i216.GetClientsWithFilterUserUsecase>(),
        gh<_i218.GetRecommendedClientsUsecase>(),
        gh<_i210.AddClientUserUsecase>(),
        gh<_i213.EditClientUserUsecase>(),
        gh<_i212.ChangeTypeClientUsecase>(),
        gh<_i219.GetSimilarClientsUsecase>(),
        gh<_i211.ApproveRejectClientUsecase>(),
        gh<_i185.CrudClientSupportFilesUsecase>(),
        gh<_i186.GetClientSupportFilesUsecase>(),
        gh<_i221.TransferClientUserUsecase>(),
        gh<_i220.ReceiveClientUserUsecase>(),
        gh<_i217.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i237.RegionsSalesReportsCubit>(() =>
      _i237.RegionsSalesReportsCubit(
          gh<_i125.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i238.AgentsDistributorsActionsCubit>(
      () => _i238.AgentsDistributorsActionsCubit(
            gh<_i82.GetCitiesUseCase>(),
            gh<_i227.AddAgentUseCase>(),
            gh<_i228.UpdateAgentUseCase>(),
          ));
  gh.factory<_i239.InvoicesSectionCubit>(() => _i239.InvoicesSectionCubit(
        gh<_i130.GetInvoicesByPrivilegesUsecase>(),
        gh<_i193.GetAgentsAndDistributorsUseCase>(),
        gh<_i178.ParticipateListUsecase>(),
        gh<_i148.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i240.LoginRepo>(() => _i241.LoginRepoImpl(
        gh<_i90.LoginRemoteDataSource>(),
        gh<_i204.LoginLocalDataSource>(),
      ));
  gh.factory<_i242.AddLevelUsecase>(
      () => _i242.AddLevelUsecase(gh<_i115.PrivilegeRepository>()));
  gh.factory<_i243.GetLevelsUsecase>(
      () => _i243.GetLevelsUsecase(gh<_i115.PrivilegeRepository>()));
  gh.factory<_i244.GetPrivilegesUsecase>(
      () => _i244.GetPrivilegesUsecase(gh<_i115.PrivilegeRepository>()));
  gh.factory<_i245.UpdatePrivilegeUsecase>(
      () => _i245.UpdatePrivilegeUsecase(gh<_i115.PrivilegeRepository>()));
  gh.factory<_i246.AttachmentsRowCubit>(() => _i246.AttachmentsRowCubit(
        gh<_i186.GetClientSupportFilesUsecase>(),
        gh<_i185.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i247.AddCommentUsecase>(
      () => _i247.AddCommentUsecase(gh<_i134.CompanyRepository>()));
  gh.factory<_i248.GetCommentUsecase>(
      () => _i248.GetCommentUsecase(gh<_i134.CompanyRepository>()));
  gh.factory<_i249.DelayInstallReportsCubit>(() =>
      _i249.DelayInstallReportsCubit(
          gh<_i229.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i250.GetRegionsByIdCountryUseCase>(
      () => _i250.GetRegionsByIdCountryUseCase(gh<_i168.RegionsRepository>()));
  gh.lazySingleton<_i251.PrivilegeCubit>(() => _i251.PrivilegeCubit(
        gh<_i243.GetLevelsUsecase>(),
        gh<_i244.GetPrivilegesUsecase>(),
        gh<_i245.UpdatePrivilegeUsecase>(),
        gh<_i242.AddLevelUsecase>(),
      ));
  gh.factory<_i252.AdvancedCofigsCubit>(() => _i252.AdvancedCofigsCubit(
        gh<_i206.GetAdvancedConfigsUsecase>(),
        gh<_i205.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i253.SupportClientsInvoicesCubit>(() =>
      _i253.SupportClientsInvoicesCubit(
          gh<_i161.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i254.ParticipateListBloc>(() => _i254.ParticipateListBloc(
        gh<_i178.ParticipateListUsecase>(),
        gh<_i172.AddParticipateUserUsecase>(),
        gh<_i173.EditParticipateUserUsecase>(),
        gh<_i175.ParticipateClientListUsecase>(),
        gh<_i177.ParticipateInvoiceListUsecase>(),
        gh<_i174.GetInvoiceByIdUsecase>(),
        gh<_i176.ParticipateCommentListUsecase>(),
        gh<_i171.AddParticipateCommentUsecase>(),
        gh<_i179.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i255.CacheTokenUsecase>(
      () => _i255.CacheTokenUsecase(gh<_i240.LoginRepo>()));
  gh.lazySingleton<_i256.GetTokenUsecase>(
      () => _i256.GetTokenUsecase(gh<_i240.LoginRepo>()));
  gh.lazySingleton<_i257.LoginUsecase>(
      () => _i257.LoginUsecase(gh<_i240.LoginRepo>()));
  gh.lazySingleton<_i258.ValidateTokenUsecase>(
      () => _i258.ValidateTokenUsecase(gh<_i240.LoginRepo>()));
  gh.lazySingleton<_i259.VerifyOtpUsecase>(
      () => _i259.VerifyOtpUsecase(gh<_i240.LoginRepo>()));
  gh.factory<_i260.ClientsTransferApprovalsCubit>(() =>
      _i260.ClientsTransferApprovalsCubit(
          gh<_i231.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i261.GeneralCofigsCubit>(() => _i261.GeneralCofigsCubit(
        gh<_i225.GetGeneralConfigsUsecase>(),
        gh<_i224.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i262.GetClientsDebtsUsecase>(
      () => _i262.GetClientsDebtsUsecase(gh<_i149.ClientsDebtsRepo>()));
  gh.lazySingleton<_i263.AddAgentCommentUsecase>(() =>
      _i263.AddAgentCommentUsecase(gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i264.DoneTrainingUsecase>(() =>
      _i264.DoneTrainingUsecase(gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i265.GetAgentUsecase>(
      () => _i265.GetAgentUsecase(gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i266.GetAgentClientListUsecase>(() =>
      _i266.GetAgentClientListUsecase(
          gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i267.GetAgentCommentsListUsecase>(() =>
      _i267.GetAgentCommentsListUsecase(
          gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i268.GetAgentDatesListUsecase>(() =>
      _i268.GetAgentDatesListUsecase(
          gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i269.GetAgentInvoiceListUsecase>(() =>
      _i269.GetAgentInvoiceListUsecase(
          gh<_i139.AgentsDistributorsProfileRepo>()));
  gh.factory<_i270.AddRejectReasonsUsecase>(() =>
      _i270.AddRejectReasonsUsecase(gh<_i162.ManageWithdrawalsRepository>()));
  gh.factory<_i271.EditRejectReasonsUsecase>(() =>
      _i271.EditRejectReasonsUsecase(gh<_i162.ManageWithdrawalsRepository>()));
  gh.factory<_i272.GetRejectReasonsUsecase>(() =>
      _i272.GetRejectReasonsUsecase(gh<_i162.ManageWithdrawalsRepository>()));
  gh.factory<_i273.GetUserSeriesUsecase>(() =>
      _i273.GetUserSeriesUsecase(gh<_i162.ManageWithdrawalsRepository>()));
  gh.factory<_i274.GetWithdrawnDetailsUsecase>(() =>
      _i274.GetWithdrawnDetailsUsecase(
          gh<_i162.ManageWithdrawalsRepository>()));
  gh.factory<_i275.SetApproveSeriesUsecase>(() =>
      _i275.SetApproveSeriesUsecase(gh<_i162.ManageWithdrawalsRepository>()));
  gh.factory<_i276.UpdateSeriesUsecase>(
      () => _i276.UpdateSeriesUsecase(gh<_i162.ManageWithdrawalsRepository>()));
  gh.singleton<_i277.AppManagerCubit>(
      () => _i277.AppManagerCubit(gh<_i222.GetVersionUseCase>()));
  gh.factory<_i278.RegionsCubit>(
      () => _i278.RegionsCubit(gh<_i250.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i279.GetWaitingAgentsUsecase>(
      () => _i279.GetWaitingAgentsUsecase(gh<_i189.WaitingAgentsRepo>()));
  gh.factory<_i280.ProductsSalesReportsCubit>(() =>
      _i280.ProductsSalesReportsCubit(
          gh<_i166.GetProductsSalesReportsUsecase>()));
  gh.factory<_i281.UsersCubit>(() => _i281.UsersCubit(
        gh<_i158.GetUsersUsecase>(),
        gh<_i65.ActionUserUsecase>(),
        gh<_i201.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i157.GetManagesForUserUsecase>(),
        gh<_i156.GetLevelsForUserUsecase>(),
        gh<_i155.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i282.PreviousRatingsCubit>(
      () => _i282.PreviousRatingsCubit(gh<_i188.GetPreviousRatingsUsecase>()));
  gh.factory<_i283.CommunicationListBloc>(() =>
      _i283.CommunicationListBloc(gh<_i181.GetCommunicationListUsecase>()));
  gh.factory<_i284.AgentsDistributorsCubit>(() => _i284.AgentsDistributorsCubit(
        gh<_i193.GetAgentsAndDistributorsUseCase>(),
        gh<_i192.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i285.ExceededClientsCubit>(() => _i285.ExceededClientsCubit(
        gh<_i202.ExceededClientsUseCase>(),
        gh<_i203.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i286.LatestClientsUpdatesCubit>(() =>
      _i286.LatestClientsUpdatesCubit(gh<_i232.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i287.CancelScheduleUsecase>(
      () => _i287.CancelScheduleUsecase(gh<_i208.DatesTableRepo>()));
  gh.lazySingleton<_i288.ChangeDateToDonUsecase>(
      () => _i288.ChangeDateToDonUsecase(gh<_i208.DatesTableRepo>()));
  gh.lazySingleton<_i289.GetDateInstallationUsecase>(
      () => _i289.GetDateInstallationUsecase(gh<_i208.DatesTableRepo>()));
  gh.lazySingleton<_i290.GetInvoicesByClientForDateUsecase>(() =>
      _i290.GetInvoicesByClientForDateUsecase(gh<_i208.DatesTableRepo>()));
  gh.lazySingleton<_i291.GetSubscribedClientsUsecase>(
      () => _i291.GetSubscribedClientsUsecase(gh<_i208.DatesTableRepo>()));
  gh.lazySingleton<_i292.RescheduleDateUsecase>(
      () => _i292.RescheduleDateUsecase(gh<_i208.DatesTableRepo>()));
  gh.lazySingleton<_i293.ReturnScheduleVisitToOpenUsecase>(
      () => _i293.ReturnScheduleVisitToOpenUsecase(gh<_i208.DatesTableRepo>()));
  gh.factory<_i294.AgentsDistributorsProfileBloc>(
      () => _i294.AgentsDistributorsProfileBloc(
            gh<_i266.GetAgentClientListUsecase>(),
            gh<_i269.GetAgentInvoiceListUsecase>(),
            gh<_i174.GetInvoiceByIdUsecase>(),
            gh<_i267.GetAgentCommentsListUsecase>(),
            gh<_i263.AddAgentCommentUsecase>(),
            gh<_i264.DoneTrainingUsecase>(),
            gh<_i235.AddAgentDateUseCase>(),
            gh<_i268.GetAgentDatesListUsecase>(),
            gh<_i230.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i295.DatesTableCubit>(() => _i295.DatesTableCubit(
        gh<_i289.GetDateInstallationUsecase>(),
        gh<_i292.RescheduleDateUsecase>(),
        gh<_i288.ChangeDateToDonUsecase>(),
        gh<_i287.CancelScheduleUsecase>(),
        gh<_i293.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i291.GetSubscribedClientsUsecase>(),
        gh<_i290.GetInvoicesByClientForDateUsecase>(),
        gh<_i141.AddDateInstallUsecase>(),
      ));
  gh.factory<_i296.CompanyCubit>(() => _i296.CompanyCubit(
        gh<_i248.GetCommentUsecase>(),
        gh<_i247.AddCommentUsecase>(),
      ));
  gh.factory<_i297.ClientsDebtsCubit>(
      () => _i297.ClientsDebtsCubit(gh<_i262.GetClientsDebtsUsecase>()));
  gh.factory<_i298.LoginCubit>(() => _i298.LoginCubit(
        gh<_i257.LoginUsecase>(),
        gh<_i259.VerifyOtpUsecase>(),
        gh<_i255.CacheTokenUsecase>(),
        gh<_i256.GetTokenUsecase>(),
        gh<_i258.ValidateTokenUsecase>(),
      ));
  gh.factory<_i299.ManageWithdrawalsCubit>(() => _i299.ManageWithdrawalsCubit(
        gh<_i273.GetUserSeriesUsecase>(),
        gh<_i276.UpdateSeriesUsecase>(),
        gh<_i158.GetUsersUsecase>(),
        gh<_i196.GetWithdrawalsInvoicesUsecase>(),
        gh<_i197.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i275.SetApproveSeriesUsecase>(),
        gh<_i274.GetWithdrawnDetailsUsecase>(),
        gh<_i270.AddRejectReasonsUsecase>(),
        gh<_i272.GetRejectReasonsUsecase>(),
        gh<_i271.EditRejectReasonsUsecase>(),
        gh<_i195.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i300.WaitingAgentsCubit>(
      () => _i300.WaitingAgentsCubit(gh<_i279.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i301.AppModule {}
