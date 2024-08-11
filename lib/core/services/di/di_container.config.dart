// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i32;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i114;
import '../../../features/app/domain/repositories/app_repository.dart' as _i113;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i213;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i268;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i196;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i86;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i232;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i231;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i246;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i247;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i248;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i249;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i250;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i288;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i17;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i22;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i124;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i186;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i26;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i44;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i43;
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
    as _i214;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i99;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i85;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i33;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i145;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i144;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i173;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i273;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i25;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i108;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i107;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i131;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i217;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i16;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i71;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i70;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i180;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i272;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i41;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i77;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i76;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i78;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i159;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i72;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i120;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i119;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i134;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i135;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i136;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i137;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i138;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i139;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i140;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i226;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i102;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i161;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i160;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i241;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i269;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i39;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i51;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i50;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i73;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i162;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i42;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i90;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i89;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i197;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i198;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i243;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i54;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i126;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i125;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i215;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i216;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i252;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i34;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i110;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i109;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i233;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i234;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i235;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i236;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i242;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i28;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i53;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i52;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i61;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i148;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i149;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i150;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i151;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i271;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i31;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i156;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i155;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i261;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i262;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i187;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i263;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i264;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i189;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i188;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i265;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i266;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i267;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i289;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i23;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i143;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i142;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i253;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i287;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i29;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i176;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i175;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i223;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i251;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i24;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i56;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i55;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i97;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i117;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i11;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i58;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i57;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i74;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i172;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i35;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i130;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i129;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i201;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i202;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i203;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i177;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i204;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i208;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i178;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i205;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i206;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i207;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i209;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i210;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i211;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i212;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i228;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i36;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i128;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i127;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i238;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i239;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i286;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i30;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i60;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i59;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i194;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i195;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i275;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i75;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i94;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i93;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i141;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i123;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i230;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i40;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i68;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i67;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i224;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i276;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i12;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i66;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i98;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i116;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i133;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i158;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i115;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i132;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i157;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i254;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i227;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i218;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i184;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i222;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i255;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i256;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i257;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i258;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i259;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i260;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i185;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i219;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i229;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i284;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i274;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i37;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i122;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i121;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i152;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i153;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i179;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i19;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i92;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i91;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i163;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i164;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i171;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i165;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i166;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i167;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i168;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i169;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i170;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i245;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i20;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i88;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i87;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i174;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i183;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i15;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i63;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i62;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i69;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i220;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i100;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i200;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i199;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i277;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i278;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i279;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i280;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i281;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i282;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i283;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i285;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i10;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i48;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i47;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i101;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i118;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i18;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i112;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i111;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i221;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i240;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i46;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i45;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i49;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i95;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i27;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i147;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i146;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i154;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i244;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i96;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i182;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i181;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i270;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i290;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i38;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i65;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i64;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i190;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i191;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i192;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i193;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i225;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i237;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i104;
import '../cache_services/prefs_consumer.dart' as _i106;
import '../cache_services/secure_storage_consumer.dart' as _i105;
import '../maps/location_services.dart' as _i103;
import 'di_container.dart' as _i291;

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
  gh.lazySingleton<_i12.AgentsDistributorsActionsDataSource>(() =>
      _i12.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i13.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i14.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i15.ClientsInstallReportsDatasource>(
      () => _i15.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i16.PreviousRatingsDatasource>(
      () => _i16.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i17.ClientsAcceptDatasource>(
      () => _i17.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i18.DelayInstallReportsDatasource>(
      () => _i18.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i19.ParticipatesListDatasource>(
      () => _i19.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.EmployeesSalesReportsDatasource>(
      () => _i20.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.ClientsAcceptRepository>(() =>
      _i22.ClientsAcceptRepositoryImpl(gh<_i17.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i23.ClientsDebtsDatasource>(
      () => _i23.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.FinancePendingDatasource>(
      () => _i24.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.InstallQualityDatasource>(
      () => _i25.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.TicketsDataSource>(
      () => _i26.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.SupportClientsInvoicesDatasource>(
      () => _i27.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.UsersDatasource>(
      () => _i28.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i13.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i14.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i29.ClientsTransferApprovalsDatasource>(
      () => _i29.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.ExceededClientsDatasource>(
      () => _i30.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.ManageWithdrawalsDatasource>(
      () => _i31.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i32.AppDatasource>(
      () => _i32.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i33.CommunicationListDatasource>(
      () => _i33.CommunicationListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i34.PrivilegeDatasource>(
      () => _i34.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i35.ClientsListDatasource>(
      () => _i35.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i36.CommentCompanyDatasource>(
      () => _i36.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i37.LinkDatasource>(
      () => _i37.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i38.TaskDatasource>(
      () => _i38.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i39.UsersDatasource>(
      () => _i39.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i40.LatestClientsUpdatesDatasource>(
      () => _i40.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.CitiesDatasource>(
      () => _i41.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i42.AdvancedConfigsDatasource>(
      () => _i42.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i43.TicketsRepo>(
      () => _i44.TicketsRepoImpl(gh<_i26.TicketsDataSource>()));
  gh.lazySingleton<_i45.SupportClientsAcceptRepository>(() =>
      _i46.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i47.DelayAfterInstallRepo>(() =>
      _i48.DelayAfterInstallRepoImpl(gh<_i10.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i49.GetSupportClientsAcceptUseCase>(() =>
      _i49.GetSupportClientsAcceptUseCase(
          gh<_i45.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i50.UsersRepository>(
      () => _i51.UsersRepositoryImpl(gh<_i39.UsersDatasource>()));
  gh.lazySingleton<_i52.UsersRepository>(
      () => _i53.UsersRepositoryImpl(gh<_i28.UsersDatasource>()));
  gh.lazySingleton<_i54.GeneralConfigsDatasource>(
      () => _i54.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i55.FinancePendingRepo>(
      () => _i56.FinancePendingRepoImpl(gh<_i24.FinancePendingDatasource>()));
  gh.lazySingleton<_i57.PendingInvoicesRepo>(
      () => _i58.PendingInvoicesRepoImpl(gh<_i11.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i59.ExceededClientsRepo>(
      () => _i60.ExceededClientsRepoImpl(gh<_i30.ExceededClientsDatasource>()));
  gh.factory<_i61.ActionUserUsecase>(
      () => _i61.ActionUserUsecase(gh<_i52.UsersRepository>()));
  gh.lazySingleton<_i62.ClientsInstallReportsRepo>(() =>
      _i63.ClientsInstallReportsRepoImpl(
          gh<_i15.ClientsInstallReportsDatasource>()));
  gh.factory<_i64.TaskRepository>(
      () => _i65.TaskRepositoryImpl(gh<_i38.TaskDatasource>()));
  gh.lazySingleton<_i66.AgentsDistributorsDataSource>(
      () => _i66.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i67.LatestClientsUpdatesRepository>(() =>
      _i68.LatestClientsUpdatesRepositoryImpl(
          gh<_i40.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i69.GetClientsInstallReportsUsecase>(() =>
      _i69.GetClientsInstallReportsUsecase(
          gh<_i62.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i70.PreviousRatingsRepo>(
      () => _i71.PreviousRatingsRepoImpl(gh<_i16.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i72.SupportTabDataSource>(
      () => _i72.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i73.GetUsersUsecase>(
      () => _i73.GetUsersUsecase(gh<_i50.UsersRepository>()));
  gh.lazySingleton<_i74.GetPendingInvoicesUsecase>(
      () => _i74.GetPendingInvoicesUsecase(gh<_i57.PendingInvoicesRepo>()));
  gh.lazySingleton<_i75.InvoicesTabDataSource>(
      () => _i75.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i76.CitiesRepository>(
      () => _i77.CitiesRepositoryImpl(gh<_i41.CitiesDatasource>()));
  gh.lazySingleton<_i78.GetCitiesUseCase>(
      () => _i78.GetCitiesUseCase(gh<_i76.CitiesRepository>()));
  gh.lazySingleton<_i79.AddTicketUseCase>(
      () => _i79.AddTicketUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i80.EditTicketTypeUseCase>(
      () => _i80.EditTicketTypeUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i81.GetClientTicketsUseCase>(
      () => _i81.GetClientTicketsUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i82.GetTicketsUseCase>(
      () => _i82.GetTicketsUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i83.GetTicketByIdUseCase>(
      () => _i83.GetTicketByIdUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i84.TransferTicketUseCase>(
      () => _i84.TransferTicketUseCase(gh<_i43.TicketsRepo>()));
  gh.factory<_i85.TicketsCubit>(() => _i85.TicketsCubit(
        gh<_i82.GetTicketsUseCase>(),
        gh<_i83.GetTicketByIdUseCase>(),
        gh<_i81.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i86.LoginRemoteDataSource>(
      () => _i86.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i87.EmployeesSalesReportsRepo>(() =>
      _i88.EmployeesSalesReportsRepoImpl(
          gh<_i20.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i89.AdvancedConfigsRepository>(() =>
      _i90.AdvancedConfigsRepositoryImpl(gh<_i42.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i91.ParticipateListRepository>(() =>
      _i92.ParticipateListRepositoryImpl(
          gh<_i19.ParticipatesListDatasource>()));
  gh.lazySingleton<_i93.InvoicesSectionRepo>(
      () => _i94.InvoicesTabRepoImpl(gh<_i75.InvoicesTabDataSource>()));
  gh.factory<_i95.SupportClientsAcceptCubit>(() =>
      _i95.SupportClientsAcceptCubit(
          gh<_i49.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i96.WaitingAgentsDataSource>(
      () => _i96.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i97.GetFinancePendingInvoicesUsecase>(() =>
      _i97.GetFinancePendingInvoicesUsecase(gh<_i55.FinancePendingRepo>()));
  gh.lazySingleton<_i98.AgentsDistributorsProfileDataSource>(() =>
      _i98.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i99.EditTicketCubit>(() => _i99.EditTicketCubit(
        gh<_i80.EditTicketTypeUseCase>(),
        gh<_i84.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i100.DatesTableDataSource>(
      () => _i100.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i101.GetDelayAfterInstallUseCase>(() =>
      _i101.GetDelayAfterInstallUseCase(gh<_i47.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i102.RegionsDatasource>(
      () => _i102.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i103.LocationServices>(
      () => _i103.LocationServices(gh<_i6.Location>()));
  gh.singleton<_i104.CacheServices>(
    () => _i105.SecureStorageConsumer(gh<_i14.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i104.CacheServices>(() async =>
      _i106.PrefsConsumer(await gh.getAsync<_i13.SharedPreferences>()));
  gh.lazySingleton<_i107.InstallQualityRepo>(
      () => _i108.InstallQualityRepoImpl(gh<_i25.InstallQualityDatasource>()));
  gh.factory<_i109.PrivilegeRepository>(
      () => _i110.PrivilegeRepositoryImpl(gh<_i34.PrivilegeDatasource>()));
  gh.lazySingleton<_i111.DelayInstallReportsRepo>(() =>
      _i112.DelayInstallReportsRepoImpl(
          gh<_i18.DelayInstallReportsDatasource>()));
  gh.factory<_i113.AppRepository>(
      () => _i114.AppRepositoryImpl(gh<_i32.AppDatasource>()));
  gh.lazySingleton<_i115.AgentsDistributorsActionsRepo>(() =>
      _i116.AgentsDistributorsActionsRepoImpl(
          gh<_i12.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i117.FinancePendingCubit>(() =>
      _i117.FinancePendingCubit(gh<_i97.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i118.DelayAfterInstallCubit>(() =>
      _i118.DelayAfterInstallCubit(gh<_i101.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i119.SupportTabRepo>(
      () => _i120.SupportTabRepoImpl(gh<_i72.SupportTabDataSource>()));
  gh.factory<_i121.LinksImportantRepository>(
      () => _i122.LinkRepositoryImpl(gh<_i37.LinkDatasource>()));
  gh.lazySingleton<_i123.GetInvoicesByPrivilegesUsecase>(() =>
      _i123.GetInvoicesByPrivilegesUsecase(gh<_i93.InvoicesSectionRepo>()));
  gh.lazySingleton<_i124.GetClientsAcceptUseCase>(
      () => _i124.GetClientsAcceptUseCase(gh<_i21.ClientsAcceptRepository>()));
  gh.lazySingleton<_i125.GeneralConfigsRepository>(() =>
      _i126.GeneralConfigsRepositoryImpl(gh<_i54.GeneralConfigsDatasource>()));
  gh.factory<_i127.CompanyRepository>(
      () => _i128.CompanyRepositoryImpl(gh<_i36.CommentCompanyDatasource>()));
  gh.factory<_i129.ClientsListRepository>(
      () => _i130.ClientsListRepositoryImpl(gh<_i35.ClientsListDatasource>()));
  gh.lazySingleton<_i131.GetInstallUseCase>(
      () => _i131.GetInstallUseCase(gh<_i107.InstallQualityRepo>()));
  gh.lazySingleton<_i132.AgentsDistributorsProfileRepo>(() =>
      _i133.AgentsDistributorsProfileRepoImpl(
          gh<_i98.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i134.AddDateInstallUsecase>(
      () => _i134.AddDateInstallUsecase(gh<_i119.SupportTabRepo>()));
  gh.lazySingleton<_i135.CancelDateInstallUsecase>(
      () => _i135.CancelDateInstallUsecase(gh<_i119.SupportTabRepo>()));
  gh.lazySingleton<_i136.GetInvoiceByClientUsecase>(
      () => _i136.GetInvoiceByClientUsecase(gh<_i119.SupportTabRepo>()));
  gh.lazySingleton<_i137.ReceiveDeviceUsecase>(
      () => _i137.ReceiveDeviceUsecase(gh<_i119.SupportTabRepo>()));
  gh.lazySingleton<_i138.ReturnInvoiceApproveUsecase>(
      () => _i138.ReturnInvoiceApproveUsecase(gh<_i119.SupportTabRepo>()));
  gh.lazySingleton<_i139.SetDateDoneUsecase>(
      () => _i139.SetDateDoneUsecase(gh<_i119.SupportTabRepo>()));
  gh.lazySingleton<_i140.SetReadyInstallUsecase>(
      () => _i140.SetReadyInstallUsecase(gh<_i119.SupportTabRepo>()));
  gh.lazySingleton<_i141.GetAllUsersUseCase>(
      () => _i141.GetAllUsersUseCase(gh<_i93.InvoicesSectionRepo>()));
  gh.lazySingleton<_i142.ClientsDebtsRepo>(
      () => _i143.ClientsDebtsRepoImpl(gh<_i23.ClientsDebtsDatasource>()));
  gh.factory<_i144.CommunicationListRepository>(() =>
      _i145.CommunicationListRepositoryImpl(
          gh<_i33.CommunicationListDatasource>()));
  gh.lazySingleton<_i146.SupportClientsInvoicesRepo>(() =>
      _i147.SupportClientsInvoicesRepoImpl(
          gh<_i27.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i148.GetBranchesForUserUsecase>(
      () => _i148.GetBranchesForUserUsecase(gh<_i52.UsersRepository>()));
  gh.lazySingleton<_i149.GetLevelsForUserUsecase>(
      () => _i149.GetLevelsForUserUsecase(gh<_i52.UsersRepository>()));
  gh.lazySingleton<_i150.GetManagesForUserUsecase>(
      () => _i150.GetManagesForUserUsecase(gh<_i52.UsersRepository>()));
  gh.factory<_i151.GetUsersUsecase>(
      () => _i151.GetUsersUsecase(gh<_i52.UsersRepository>()));
  gh.factory<_i152.ActionLinkUsecase>(
      () => _i152.ActionLinkUsecase(gh<_i121.LinksImportantRepository>()));
  gh.factory<_i153.GetLinkUsecase>(
      () => _i153.GetLinkUsecase(gh<_i121.LinksImportantRepository>()));
  gh.lazySingleton<_i154.GetSupportClientsInvoicesUseCase>(() =>
      _i154.GetSupportClientsInvoicesUseCase(
          gh<_i146.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i155.ManageWithdrawalsRepository>(() =>
      _i156.ManageWithdrawalsRepositoryImpl(
          gh<_i31.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i157.AgentsDistributorsRepo>(() =>
      _i158.AgentsDistributorsRepoImpl(
          gh<_i66.AgentsDistributorsDataSource>()));
  gh.singleton<_i159.CitiesCubit>(
      () => _i159.CitiesCubit(gh<_i78.GetCitiesUseCase>()));
  gh.lazySingleton<_i160.RegionsRepository>(
      () => _i161.RegionsRepositoryImpl(gh<_i102.RegionsDatasource>()));
  gh.factory<_i162.UsersTypeCubit>(
      () => _i162.UsersTypeCubit(gh<_i73.GetUsersUsecase>()));
  gh.factory<_i163.AddParticipateCommentUsecase>(() =>
      _i163.AddParticipateCommentUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i164.AddParticipateUserUsecase>(() =>
      _i164.AddParticipateUserUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i165.EditParticipateUserUsecase>(() =>
      _i165.EditParticipateUserUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i166.GetInvoiceByIdUsecase>(
      () => _i166.GetInvoiceByIdUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i167.ParticipateClientListUsecase>(() =>
      _i167.ParticipateClientListUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i168.ParticipateCommentListUsecase>(() =>
      _i168.ParticipateCommentListUsecase(
          gh<_i91.ParticipateListRepository>()));
  gh.factory<_i169.ParticipateInvoiceListUsecase>(() =>
      _i169.ParticipateInvoiceListUsecase(
          gh<_i91.ParticipateListRepository>()));
  gh.factory<_i170.ParticipateListUsecase>(
      () => _i170.ParticipateListUsecase(gh<_i91.ParticipateListRepository>()));
  gh.lazySingleton<_i171.ChangeParticipateStatusUsecase>(() =>
      _i171.ChangeParticipateStatusUsecase(
          gh<_i91.ParticipateListRepository>()));
  gh.factory<_i172.PendingInvoicesCubit>(
      () => _i172.PendingInvoicesCubit(gh<_i74.GetPendingInvoicesUsecase>()));
  gh.factory<_i173.GetCommunicationListUsecase>(() =>
      _i173.GetCommunicationListUsecase(
          gh<_i144.CommunicationListRepository>()));
  gh.lazySingleton<_i174.GetEmployeesSalesReportsUsecase>(() =>
      _i174.GetEmployeesSalesReportsUsecase(
          gh<_i87.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i175.ClientsTransferApprovalsRepo>(() =>
      _i176.ClientsTransferApprovalsRepoImpl(
          gh<_i29.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i177.CrudClientSupportFilesUsecase>(() =>
      _i177.CrudClientSupportFilesUsecase(
          repository: gh<_i129.ClientsListRepository>()));
  gh.lazySingleton<_i178.GetClientSupportFilesUsecase>(() =>
      _i178.GetClientSupportFilesUsecase(
          repository: gh<_i129.ClientsListRepository>()));
  gh.factory<_i179.LinkCubit>(() => _i179.LinkCubit(
        gh<_i153.GetLinkUsecase>(),
        gh<_i152.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i180.GetPreviousRatingsUsecase>(
      () => _i180.GetPreviousRatingsUsecase(gh<_i70.PreviousRatingsRepo>()));
  gh.lazySingleton<_i181.WaitingAgentsRepo>(
      () => _i182.WaitingAgentsRepoImpl(gh<_i96.WaitingAgentsDataSource>()));
  gh.factory<_i183.EmployeesSalesReportsCubit>(() =>
      _i183.EmployeesSalesReportsCubit(
          gh<_i174.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i184.ChangeStateAgentUseCase>(
      () => _i184.ChangeStateAgentUseCase(gh<_i157.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i185.GetAgentsAndDistributorsUseCase>(() =>
      _i185.GetAgentsAndDistributorsUseCase(
          gh<_i157.AgentsDistributorsRepo>()));
  gh.factory<_i186.ClientsAcceptCubit>(
      () => _i186.ClientsAcceptCubit(gh<_i124.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i187.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i187.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i155.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i188.GetWithdrawalsInvoicesUsecase>(() =>
      _i188.GetWithdrawalsInvoicesUsecase(
          gh<_i155.ManageWithdrawalsRepository>()));
  gh.factory<_i189.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i189.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i155.ManageWithdrawalsRepository>()));
  gh.factory<_i190.AddTaskUsecase>(
      () => _i190.AddTaskUsecase(gh<_i64.TaskRepository>()));
  gh.factory<_i191.ChangeStatusTaskUsecase>(
      () => _i191.ChangeStatusTaskUsecase(gh<_i64.TaskRepository>()));
  gh.factory<_i192.FilterTaskUsecase>(
      () => _i192.FilterTaskUsecase(gh<_i64.TaskRepository>()));
  gh.factory<_i193.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i193.GetUsersByDepartmentAndRegionUsecase(gh<_i64.TaskRepository>()));
  gh.lazySingleton<_i194.ExceededClientsUseCase>(
      () => _i194.ExceededClientsUseCase(gh<_i59.ExceededClientsRepo>()));
  gh.lazySingleton<_i195.TransferExceededClientsUseCase>(() =>
      _i195.TransferExceededClientsUseCase(gh<_i59.ExceededClientsRepo>()));
  gh.lazySingleton<_i196.LoginLocalDataSource>(() =>
      _i196.LoginLocalDataSourceImpl(
          gh<_i104.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i197.EditAdvancedConfigsUsecase>(() =>
      _i197.EditAdvancedConfigsUsecase(gh<_i89.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i198.GetAdvancedConfigsUsecase>(() =>
      _i198.GetAdvancedConfigsUsecase(gh<_i89.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i199.DatesTableRepo>(
      () => _i200.DatesTableRepoImpl(gh<_i100.DatesTableDataSource>()));
  gh.factory<_i201.AddClientUserUsecase>(
      () => _i201.AddClientUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i202.ApproveRejectClientUsecase>(() =>
      _i202.ApproveRejectClientUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i203.ChangeTypeClientUsecase>(
      () => _i203.ChangeTypeClientUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i204.EditClientUserUsecase>(
      () => _i204.EditClientUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i205.GetClientsListByRegionUseCase>(() =>
      _i205.GetClientsListByRegionUseCase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i206.GetClientsListByUserUseCase>(() =>
      _i206.GetClientsListByUserUseCase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i207.GetClientsWithFilterUserUsecase>(() =>
      _i207.GetClientsWithFilterUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i208.GetClientMarketingReportUsecase>(() =>
      _i208.GetClientMarketingReportUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i209.GetRecommendedClientsUsecase>(() =>
      _i209.GetRecommendedClientsUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i210.GetSimilarClientsUsecase>(
      () => _i210.GetSimilarClientsUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i211.ReceiveClientUserUsecase>(
      () => _i211.ReceiveClientUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i212.TransferClientUserUsecase>(
      () => _i212.TransferClientUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i213.GetVersionUseCase>(
      () => _i213.GetVersionUseCase(gh<_i113.AppRepository>()));
  gh.factory<_i214.AddTicketCubit>(
      () => _i214.AddTicketCubit(gh<_i79.AddTicketUseCase>()));
  gh.lazySingleton<_i215.EditGeneralConfigsUsecase>(() =>
      _i215.EditGeneralConfigsUsecase(gh<_i125.GeneralConfigsRepository>()));
  gh.lazySingleton<_i216.GetGeneralConfigsUsecase>(() =>
      _i216.GetGeneralConfigsUsecase(gh<_i125.GeneralConfigsRepository>()));
  gh.factory<_i217.InstallQualityCubit>(
      () => _i217.InstallQualityCubit(gh<_i131.GetInstallUseCase>()));
  gh.lazySingleton<_i218.AddAgentUseCase>(
      () => _i218.AddAgentUseCase(gh<_i115.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i219.UpdateAgentUseCase>(() =>
      _i219.UpdateAgentUseCase(gh<_i115.AgentsDistributorsActionsRepo>()));
  gh.factory<_i220.ClientsInstallReportsCubit>(() =>
      _i220.ClientsInstallReportsCubit(
          gh<_i69.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i221.GetDelayInstallReportsUseCase>(() =>
      _i221.GetDelayInstallReportsUseCase(gh<_i111.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i222.CrudAgentSupportFilesUsecase>(() =>
      _i222.CrudAgentSupportFilesUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i223.GetClientsTransferApprovalsUsecase>(() =>
      _i223.GetClientsTransferApprovalsUsecase(
          gh<_i175.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i224.GetLatestClientsUseCase>(() =>
      _i224.GetLatestClientsUseCase(gh<_i67.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i225.TaskCubit>(() => _i225.TaskCubit(
        gh<_i190.AddTaskUsecase>(),
        gh<_i192.FilterTaskUsecase>(),
        gh<_i191.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i226.SupportTabCubit>(() => _i226.SupportTabCubit(
        gh<_i136.GetInvoiceByClientUsecase>(),
        gh<_i134.AddDateInstallUsecase>(),
        gh<_i139.SetDateDoneUsecase>(),
        gh<_i140.SetReadyInstallUsecase>(),
        gh<_i138.ReturnInvoiceApproveUsecase>(),
        gh<_i137.ReceiveDeviceUsecase>(),
        gh<_i135.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i227.AddAgentDateUseCase>(() =>
      _i227.AddAgentDateUseCase(gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.factory<_i228.ClientsListBloc>(() => _i228.ClientsListBloc(
        gh<_i207.GetClientsWithFilterUserUsecase>(),
        gh<_i209.GetRecommendedClientsUsecase>(),
        gh<_i201.AddClientUserUsecase>(),
        gh<_i204.EditClientUserUsecase>(),
        gh<_i203.ChangeTypeClientUsecase>(),
        gh<_i210.GetSimilarClientsUsecase>(),
        gh<_i202.ApproveRejectClientUsecase>(),
        gh<_i177.CrudClientSupportFilesUsecase>(),
        gh<_i178.GetClientSupportFilesUsecase>(),
        gh<_i212.TransferClientUserUsecase>(),
        gh<_i211.ReceiveClientUserUsecase>(),
        gh<_i208.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i229.AgentsDistributorsActionsCubit>(
      () => _i229.AgentsDistributorsActionsCubit(
            gh<_i78.GetCitiesUseCase>(),
            gh<_i218.AddAgentUseCase>(),
            gh<_i219.UpdateAgentUseCase>(),
          ));
  gh.factory<_i230.InvoicesSectionCubit>(() => _i230.InvoicesSectionCubit(
        gh<_i123.GetInvoicesByPrivilegesUsecase>(),
        gh<_i185.GetAgentsAndDistributorsUseCase>(),
        gh<_i170.ParticipateListUsecase>(),
        gh<_i141.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i231.LoginRepo>(() => _i232.LoginRepoImpl(
        gh<_i86.LoginRemoteDataSource>(),
        gh<_i196.LoginLocalDataSource>(),
      ));
  gh.factory<_i233.AddLevelUsecase>(
      () => _i233.AddLevelUsecase(gh<_i109.PrivilegeRepository>()));
  gh.factory<_i234.GetLevelsUsecase>(
      () => _i234.GetLevelsUsecase(gh<_i109.PrivilegeRepository>()));
  gh.factory<_i235.GetPrivilegesUsecase>(
      () => _i235.GetPrivilegesUsecase(gh<_i109.PrivilegeRepository>()));
  gh.factory<_i236.UpdatePrivilegeUsecase>(
      () => _i236.UpdatePrivilegeUsecase(gh<_i109.PrivilegeRepository>()));
  gh.factory<_i237.AttachmentsRowCubit>(() => _i237.AttachmentsRowCubit(
        gh<_i178.GetClientSupportFilesUsecase>(),
        gh<_i177.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i238.AddCommentUsecase>(
      () => _i238.AddCommentUsecase(gh<_i127.CompanyRepository>()));
  gh.factory<_i239.GetCommentUsecase>(
      () => _i239.GetCommentUsecase(gh<_i127.CompanyRepository>()));
  gh.factory<_i240.DelayInstallReportsCubit>(() =>
      _i240.DelayInstallReportsCubit(
          gh<_i221.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i241.GetRegionsByIdCountryUseCase>(
      () => _i241.GetRegionsByIdCountryUseCase(gh<_i160.RegionsRepository>()));
  gh.lazySingleton<_i242.PrivilegeCubit>(() => _i242.PrivilegeCubit(
        gh<_i234.GetLevelsUsecase>(),
        gh<_i235.GetPrivilegesUsecase>(),
        gh<_i236.UpdatePrivilegeUsecase>(),
        gh<_i233.AddLevelUsecase>(),
      ));
  gh.factory<_i243.AdvancedCofigsCubit>(() => _i243.AdvancedCofigsCubit(
        gh<_i198.GetAdvancedConfigsUsecase>(),
        gh<_i197.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i244.SupportClientsInvoicesCubit>(() =>
      _i244.SupportClientsInvoicesCubit(
          gh<_i154.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i245.ParticipateListBloc>(() => _i245.ParticipateListBloc(
        gh<_i170.ParticipateListUsecase>(),
        gh<_i164.AddParticipateUserUsecase>(),
        gh<_i165.EditParticipateUserUsecase>(),
        gh<_i167.ParticipateClientListUsecase>(),
        gh<_i169.ParticipateInvoiceListUsecase>(),
        gh<_i166.GetInvoiceByIdUsecase>(),
        gh<_i168.ParticipateCommentListUsecase>(),
        gh<_i163.AddParticipateCommentUsecase>(),
        gh<_i171.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i246.CacheTokenUsecase>(
      () => _i246.CacheTokenUsecase(gh<_i231.LoginRepo>()));
  gh.lazySingleton<_i247.GetTokenUsecase>(
      () => _i247.GetTokenUsecase(gh<_i231.LoginRepo>()));
  gh.lazySingleton<_i248.LoginUsecase>(
      () => _i248.LoginUsecase(gh<_i231.LoginRepo>()));
  gh.lazySingleton<_i249.ValidateTokenUsecase>(
      () => _i249.ValidateTokenUsecase(gh<_i231.LoginRepo>()));
  gh.lazySingleton<_i250.VerifyOtpUsecase>(
      () => _i250.VerifyOtpUsecase(gh<_i231.LoginRepo>()));
  gh.factory<_i251.ClientsTransferApprovalsCubit>(() =>
      _i251.ClientsTransferApprovalsCubit(
          gh<_i223.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i252.GeneralCofigsCubit>(() => _i252.GeneralCofigsCubit(
        gh<_i216.GetGeneralConfigsUsecase>(),
        gh<_i215.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i253.GetClientsDebtsUsecase>(
      () => _i253.GetClientsDebtsUsecase(gh<_i142.ClientsDebtsRepo>()));
  gh.lazySingleton<_i254.AddAgentCommentUsecase>(() =>
      _i254.AddAgentCommentUsecase(gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i255.DoneTrainingUsecase>(() =>
      _i255.DoneTrainingUsecase(gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i256.GetAgentUsecase>(
      () => _i256.GetAgentUsecase(gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i257.GetAgentClientListUsecase>(() =>
      _i257.GetAgentClientListUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i258.GetAgentCommentsListUsecase>(() =>
      _i258.GetAgentCommentsListUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i259.GetAgentDatesListUsecase>(() =>
      _i259.GetAgentDatesListUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i260.GetAgentInvoiceListUsecase>(() =>
      _i260.GetAgentInvoiceListUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.factory<_i261.AddRejectReasonsUsecase>(() =>
      _i261.AddRejectReasonsUsecase(gh<_i155.ManageWithdrawalsRepository>()));
  gh.factory<_i262.EditRejectReasonsUsecase>(() =>
      _i262.EditRejectReasonsUsecase(gh<_i155.ManageWithdrawalsRepository>()));
  gh.factory<_i263.GetRejectReasonsUsecase>(() =>
      _i263.GetRejectReasonsUsecase(gh<_i155.ManageWithdrawalsRepository>()));
  gh.factory<_i264.GetUserSeriesUsecase>(() =>
      _i264.GetUserSeriesUsecase(gh<_i155.ManageWithdrawalsRepository>()));
  gh.factory<_i265.GetWithdrawnDetailsUsecase>(() =>
      _i265.GetWithdrawnDetailsUsecase(
          gh<_i155.ManageWithdrawalsRepository>()));
  gh.factory<_i266.SetApproveSeriesUsecase>(() =>
      _i266.SetApproveSeriesUsecase(gh<_i155.ManageWithdrawalsRepository>()));
  gh.factory<_i267.UpdateSeriesUsecase>(
      () => _i267.UpdateSeriesUsecase(gh<_i155.ManageWithdrawalsRepository>()));
  gh.singleton<_i268.AppManagerCubit>(
      () => _i268.AppManagerCubit(gh<_i213.GetVersionUseCase>()));
  gh.factory<_i269.RegionsCubit>(
      () => _i269.RegionsCubit(gh<_i241.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i270.GetWaitingAgentsUsecase>(
      () => _i270.GetWaitingAgentsUsecase(gh<_i181.WaitingAgentsRepo>()));
  gh.factory<_i271.UsersCubit>(() => _i271.UsersCubit(
        gh<_i151.GetUsersUsecase>(),
        gh<_i61.ActionUserUsecase>(),
        gh<_i193.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i150.GetManagesForUserUsecase>(),
        gh<_i149.GetLevelsForUserUsecase>(),
        gh<_i148.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i272.PreviousRatingsCubit>(
      () => _i272.PreviousRatingsCubit(gh<_i180.GetPreviousRatingsUsecase>()));
  gh.factory<_i273.CommunicationListBloc>(() =>
      _i273.CommunicationListBloc(gh<_i173.GetCommunicationListUsecase>()));
  gh.factory<_i274.AgentsDistributorsCubit>(() => _i274.AgentsDistributorsCubit(
        gh<_i185.GetAgentsAndDistributorsUseCase>(),
        gh<_i184.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i275.ExceededClientsCubit>(() => _i275.ExceededClientsCubit(
        gh<_i194.ExceededClientsUseCase>(),
        gh<_i195.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i276.LatestClientsUpdatesCubit>(() =>
      _i276.LatestClientsUpdatesCubit(gh<_i224.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i277.CancelScheduleUsecase>(
      () => _i277.CancelScheduleUsecase(gh<_i199.DatesTableRepo>()));
  gh.lazySingleton<_i278.ChangeDateToDonUsecase>(
      () => _i278.ChangeDateToDonUsecase(gh<_i199.DatesTableRepo>()));
  gh.lazySingleton<_i279.GetDateInstallationUsecase>(
      () => _i279.GetDateInstallationUsecase(gh<_i199.DatesTableRepo>()));
  gh.lazySingleton<_i280.GetInvoicesByClientForDateUsecase>(() =>
      _i280.GetInvoicesByClientForDateUsecase(gh<_i199.DatesTableRepo>()));
  gh.lazySingleton<_i281.GetSubscribedClientsUsecase>(
      () => _i281.GetSubscribedClientsUsecase(gh<_i199.DatesTableRepo>()));
  gh.lazySingleton<_i282.RescheduleDateUsecase>(
      () => _i282.RescheduleDateUsecase(gh<_i199.DatesTableRepo>()));
  gh.lazySingleton<_i283.ReturnScheduleVisitToOpenUsecase>(
      () => _i283.ReturnScheduleVisitToOpenUsecase(gh<_i199.DatesTableRepo>()));
  gh.factory<_i284.AgentsDistributorsProfileBloc>(
      () => _i284.AgentsDistributorsProfileBloc(
            gh<_i257.GetAgentClientListUsecase>(),
            gh<_i260.GetAgentInvoiceListUsecase>(),
            gh<_i166.GetInvoiceByIdUsecase>(),
            gh<_i258.GetAgentCommentsListUsecase>(),
            gh<_i254.AddAgentCommentUsecase>(),
            gh<_i255.DoneTrainingUsecase>(),
            gh<_i227.AddAgentDateUseCase>(),
            gh<_i259.GetAgentDatesListUsecase>(),
            gh<_i222.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i285.DatesTableCubit>(() => _i285.DatesTableCubit(
        gh<_i279.GetDateInstallationUsecase>(),
        gh<_i282.RescheduleDateUsecase>(),
        gh<_i278.ChangeDateToDonUsecase>(),
        gh<_i277.CancelScheduleUsecase>(),
        gh<_i283.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i281.GetSubscribedClientsUsecase>(),
        gh<_i280.GetInvoicesByClientForDateUsecase>(),
        gh<_i134.AddDateInstallUsecase>(),
      ));
  gh.factory<_i286.CompanyCubit>(() => _i286.CompanyCubit(
        gh<_i239.GetCommentUsecase>(),
        gh<_i238.AddCommentUsecase>(),
      ));
  gh.factory<_i287.ClientsDebtsCubit>(
      () => _i287.ClientsDebtsCubit(gh<_i253.GetClientsDebtsUsecase>()));
  gh.factory<_i288.LoginCubit>(() => _i288.LoginCubit(
        gh<_i248.LoginUsecase>(),
        gh<_i250.VerifyOtpUsecase>(),
        gh<_i246.CacheTokenUsecase>(),
        gh<_i247.GetTokenUsecase>(),
        gh<_i249.ValidateTokenUsecase>(),
      ));
  gh.factory<_i289.ManageWithdrawalsCubit>(() => _i289.ManageWithdrawalsCubit(
        gh<_i264.GetUserSeriesUsecase>(),
        gh<_i267.UpdateSeriesUsecase>(),
        gh<_i151.GetUsersUsecase>(),
        gh<_i188.GetWithdrawalsInvoicesUsecase>(),
        gh<_i189.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i266.SetApproveSeriesUsecase>(),
        gh<_i265.GetWithdrawnDetailsUsecase>(),
        gh<_i261.AddRejectReasonsUsecase>(),
        gh<_i263.GetRejectReasonsUsecase>(),
        gh<_i262.EditRejectReasonsUsecase>(),
        gh<_i187.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i290.WaitingAgentsCubit>(
      () => _i290.WaitingAgentsCubit(gh<_i270.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i291.AppModule {}
