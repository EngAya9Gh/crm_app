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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i33;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i112;
import '../../../features/app/domain/repositories/app_repository.dart' as _i111;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i212;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i259;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i60;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i85;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i100;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i99;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i122;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i123;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i124;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i125;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i126;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i228;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i19;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i24;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i23;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i127;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i186;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i28;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i45;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i44;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i78;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i79;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i80;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i82;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i81;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i83;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i213;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i98;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i84;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i34;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i149;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i148;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i173;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i264;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i27;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i106;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i105;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i134;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i216;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i18;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i70;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i69;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i180;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i263;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i42;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i76;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i75;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i77;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i147;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i71;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i118;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i117;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i137;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i138;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i139;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i140;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i141;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i142;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i143;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i224;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i103;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i161;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i160;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i238;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i260;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i40;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i52;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i51;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i72;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i162;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i43;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i89;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i88;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i196;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i197;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i240;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i55;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i129;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i128;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i214;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i215;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i243;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i35;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i108;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i107;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i230;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i231;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i232;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i233;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i239;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i29;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i54;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i53;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i63;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i150;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i151;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i152;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i153;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i262;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i32;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i157;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i156;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i252;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i253;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i187;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i254;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i255;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i189;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i188;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i256;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i257;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i258;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i279;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i25;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i146;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i145;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i244;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i278;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i30;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i176;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i175;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i221;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i242;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i26;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i57;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i56;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i96;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i115;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i16;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i59;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i58;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i73;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i172;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i36;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i133;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i132;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i200;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i201;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i202;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i177;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i203;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i207;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i178;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i204;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i205;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i206;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i208;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i209;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i210;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i211;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i226;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i37;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i131;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i130;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i235;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i236;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i277;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i31;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i62;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i61;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i194;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i195;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i266;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i74;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i93;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i92;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i144;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i121;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i229;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i41;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i68;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i67;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i222;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i267;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i17;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i66;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i97;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i114;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i136;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i159;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i113;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i135;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i158;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i245;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i225;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i217;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i184;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i220;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i246;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i247;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i248;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i249;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i250;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i251;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i185;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i218;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i227;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i275;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i265;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i38;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i120;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i119;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i154;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i179;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i21;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i91;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i90;
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
    as _i241;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i22;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i87;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i86;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i174;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i183;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i101;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i199;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i198;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i268;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i269;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i270;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i271;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i272;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i273;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i274;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i276;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i49;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i48;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i102;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i116;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i20;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i110;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i109;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i219;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i237;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i47;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i46;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i50;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i94;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i95;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i182;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i181;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i261;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i280;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i39;
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
    as _i223;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i234;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i104;
import 'di_container.dart' as _i281;

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
  gh.lazySingleton<_i29.UsersDatasource>(
      () => _i29.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.ClientsTransferApprovalsDatasource>(
      () => _i30.ClientsTransferApprovalsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i31.ExceededClientsDatasource>(
      () => _i31.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i32.ManageWithdrawalsDatasource>(
      () => _i32.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i33.AppDatasource>(
      () => _i33.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i34.CommunicationListDatasource>(
      () => _i34.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i35.PrivilegeDatasource>(
      () => _i35.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i36.ClientsListDatasource>(
      () => _i36.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i37.CommentCompanyDatasource>(
      () => _i37.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i38.LinkDatasource>(
      () => _i38.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i39.TaskDatasource>(
      () => _i39.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i40.UsersDatasource>(
      () => _i40.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i41.LatestClientsUpdatesDatasource>(
      () => _i41.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i42.CitiesDatasource>(
      () => _i42.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i43.AdvancedConfigsDatasource>(
      () => _i43.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i44.TicketsRepo>(
      () => _i45.TicketsRepoImpl(gh<_i28.TicketsDataSource>()));
  gh.lazySingleton<_i46.SupportClientsAcceptRepository>(() =>
      _i47.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i48.DelayAfterInstallRepo>(() =>
      _i49.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i50.GetSupportClientsAcceptUseCase>(() =>
      _i50.GetSupportClientsAcceptUseCase(
          gh<_i46.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i51.UsersRepository>(
      () => _i52.UsersRepositoryImpl(gh<_i40.UsersDatasource>()));
  gh.lazySingleton<_i53.UsersRepository>(
      () => _i54.UsersRepositoryImpl(gh<_i29.UsersDatasource>()));
  gh.lazySingleton<_i55.GeneralConfigsDatasource>(
      () => _i55.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i56.FinancePendingRepo>(
      () => _i57.FinancePendingRepoImpl(gh<_i26.FinancePendingDatasource>()));
  gh.lazySingleton<_i58.PendingInvoicesRepo>(
      () => _i59.PendingInvoicesRepoImpl(gh<_i16.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i60.LoginLocalDataSource>(() =>
      _i60.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i61.ExceededClientsRepo>(
      () => _i62.ExceededClientsRepoImpl(gh<_i31.ExceededClientsDatasource>()));
  gh.factory<_i63.ActionUserUsecase>(
      () => _i63.ActionUserUsecase(gh<_i53.UsersRepository>()));
  gh.factory<_i64.TaskRepository>(
      () => _i65.TaskRepositoryImpl(gh<_i39.TaskDatasource>()));
  gh.lazySingleton<_i66.AgentsDistributorsDataSource>(
      () => _i66.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i67.LatestClientsUpdatesRepository>(() =>
      _i68.LatestClientsUpdatesRepositoryImpl(
          gh<_i41.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i69.PreviousRatingsRepo>(
      () => _i70.PreviousRatingsRepoImpl(gh<_i18.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i71.SupportTabDataSource>(
      () => _i71.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i72.GetUsersUsecase>(
      () => _i72.GetUsersUsecase(gh<_i51.UsersRepository>()));
  gh.lazySingleton<_i73.GetPendingInvoicesUsecase>(
      () => _i73.GetPendingInvoicesUsecase(gh<_i58.PendingInvoicesRepo>()));
  gh.lazySingleton<_i74.InvoicesTabDataSource>(
      () => _i74.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i75.CitiesRepository>(
      () => _i76.CitiesRepositoryImpl(gh<_i42.CitiesDatasource>()));
  gh.lazySingleton<_i77.GetCitiesUseCase>(
      () => _i77.GetCitiesUseCase(gh<_i75.CitiesRepository>()));
  gh.lazySingleton<_i78.AddTicketUseCase>(
      () => _i78.AddTicketUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i79.EditTicketTypeUseCase>(
      () => _i79.EditTicketTypeUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i80.GetClientTicketsUseCase>(
      () => _i80.GetClientTicketsUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i81.GetTicketsUseCase>(
      () => _i81.GetTicketsUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i82.GetTicketByIdUseCase>(
      () => _i82.GetTicketByIdUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i83.TransferTicketUseCase>(
      () => _i83.TransferTicketUseCase(gh<_i44.TicketsRepo>()));
  gh.factory<_i84.TicketsCubit>(() => _i84.TicketsCubit(
        gh<_i81.GetTicketsUseCase>(),
        gh<_i82.GetTicketByIdUseCase>(),
        gh<_i80.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i85.LoginRemoteDataSource>(
      () => _i85.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i86.EmployeesSalesReportsRepo>(() =>
      _i87.EmployeesSalesReportsRepoImpl(
          gh<_i22.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i88.AdvancedConfigsRepository>(() =>
      _i89.AdvancedConfigsRepositoryImpl(gh<_i43.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i90.ParticipateListRepository>(() =>
      _i91.ParticipateListRepositoryImpl(
          gh<_i21.ParticipatesListDatasource>()));
  gh.lazySingleton<_i92.InvoicesSectionRepo>(
      () => _i93.InvoicesTabRepoImpl(gh<_i74.InvoicesTabDataSource>()));
  gh.factory<_i94.SupportClientsAcceptCubit>(() =>
      _i94.SupportClientsAcceptCubit(
          gh<_i50.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i95.WaitingAgentsDataSource>(
      () => _i95.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i96.GetFinancePendingInvoicesUsecase>(() =>
      _i96.GetFinancePendingInvoicesUsecase(gh<_i56.FinancePendingRepo>()));
  gh.lazySingleton<_i97.AgentsDistributorsProfileDataSource>(() =>
      _i97.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i98.EditTicketCubit>(() => _i98.EditTicketCubit(
        gh<_i79.EditTicketTypeUseCase>(),
        gh<_i83.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i99.LoginRepo>(() => _i100.LoginRepoImpl(
        gh<_i85.LoginRemoteDataSource>(),
        gh<_i60.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i101.DatesTableDataSource>(
      () => _i101.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i102.GetDelayAfterInstallUseCase>(() =>
      _i102.GetDelayAfterInstallUseCase(gh<_i48.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i103.RegionsDatasource>(
      () => _i103.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i104.LocationServices>(
      () => _i104.LocationServices(gh<_i8.Location>()));
  gh.lazySingleton<_i105.InstallQualityRepo>(
      () => _i106.InstallQualityRepoImpl(gh<_i27.InstallQualityDatasource>()));
  gh.factory<_i107.PrivilegeRepository>(
      () => _i108.PrivilegeRepositoryImpl(gh<_i35.PrivilegeDatasource>()));
  gh.lazySingleton<_i109.DelayInstallReportsRepo>(() =>
      _i110.DelayInstallReportsRepoImpl(
          gh<_i20.DelayInstallReportsDatasource>()));
  gh.factory<_i111.AppRepository>(
      () => _i112.AppRepositoryImpl(gh<_i33.AppDatasource>()));
  gh.lazySingleton<_i113.AgentsDistributorsActionsRepo>(() =>
      _i114.AgentsDistributorsActionsRepoImpl(
          gh<_i17.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i115.FinancePendingCubit>(() =>
      _i115.FinancePendingCubit(gh<_i96.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i116.DelayAfterInstallCubit>(() =>
      _i116.DelayAfterInstallCubit(gh<_i102.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i117.SupportTabRepo>(
      () => _i118.SupportTabRepoImpl(gh<_i71.SupportTabDataSource>()));
  gh.factory<_i119.LinksImportantRepository>(
      () => _i120.LinkRepositoryImpl(gh<_i38.LinkDatasource>()));
  gh.lazySingleton<_i121.GetInvoicesByPrivilegesUsecase>(() =>
      _i121.GetInvoicesByPrivilegesUsecase(gh<_i92.InvoicesSectionRepo>()));
  gh.lazySingleton<_i122.CacheTokenUsecase>(
      () => _i122.CacheTokenUsecase(gh<_i99.LoginRepo>()));
  gh.lazySingleton<_i123.GetTokenUsecase>(
      () => _i123.GetTokenUsecase(gh<_i99.LoginRepo>()));
  gh.lazySingleton<_i124.LoginUsecase>(
      () => _i124.LoginUsecase(gh<_i99.LoginRepo>()));
  gh.lazySingleton<_i125.ValidateTokenUsecase>(
      () => _i125.ValidateTokenUsecase(gh<_i99.LoginRepo>()));
  gh.lazySingleton<_i126.VerifyOtpUsecase>(
      () => _i126.VerifyOtpUsecase(gh<_i99.LoginRepo>()));
  gh.lazySingleton<_i127.GetClientsAcceptUseCase>(
      () => _i127.GetClientsAcceptUseCase(gh<_i23.ClientsAcceptRepository>()));
  gh.lazySingleton<_i128.GeneralConfigsRepository>(() =>
      _i129.GeneralConfigsRepositoryImpl(gh<_i55.GeneralConfigsDatasource>()));
  gh.factory<_i130.CompanyRepository>(
      () => _i131.CompanyRepositoryImpl(gh<_i37.CommentCompanyDatasource>()));
  gh.factory<_i132.ClientsListRepository>(
      () => _i133.ClientsListRepositoryImpl(gh<_i36.ClientsListDatasource>()));
  gh.lazySingleton<_i134.GetInstallUseCase>(
      () => _i134.GetInstallUseCase(gh<_i105.InstallQualityRepo>()));
  gh.lazySingleton<_i135.AgentsDistributorsProfileRepo>(() =>
      _i136.AgentsDistributorsProfileRepoImpl(
          gh<_i97.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i137.AddDateInstallUsecase>(
      () => _i137.AddDateInstallUsecase(gh<_i117.SupportTabRepo>()));
  gh.lazySingleton<_i138.CancelDateInstallUsecase>(
      () => _i138.CancelDateInstallUsecase(gh<_i117.SupportTabRepo>()));
  gh.lazySingleton<_i139.GetInvoiceByClientUsecase>(
      () => _i139.GetInvoiceByClientUsecase(gh<_i117.SupportTabRepo>()));
  gh.lazySingleton<_i140.ReceiveDeviceUsecase>(
      () => _i140.ReceiveDeviceUsecase(gh<_i117.SupportTabRepo>()));
  gh.lazySingleton<_i141.ReturnInvoiceApproveUsecase>(
      () => _i141.ReturnInvoiceApproveUsecase(gh<_i117.SupportTabRepo>()));
  gh.lazySingleton<_i142.SetDateDoneUsecase>(
      () => _i142.SetDateDoneUsecase(gh<_i117.SupportTabRepo>()));
  gh.lazySingleton<_i143.SetReadyInstallUsecase>(
      () => _i143.SetReadyInstallUsecase(gh<_i117.SupportTabRepo>()));
  gh.lazySingleton<_i144.GetAllUsersUseCase>(
      () => _i144.GetAllUsersUseCase(gh<_i92.InvoicesSectionRepo>()));
  gh.lazySingleton<_i145.ClientsDebtsRepo>(
      () => _i146.ClientsDebtsRepoImpl(gh<_i25.ClientsDebtsDatasource>()));
  gh.singleton<_i147.CitiesCubit>(
      () => _i147.CitiesCubit(gh<_i77.GetCitiesUseCase>()));
  gh.factory<_i148.CommunicationListRepository>(() =>
      _i149.CommunicationListRepositoryImpl(
          gh<_i34.CommunicationListDatasource>()));
  gh.lazySingleton<_i150.GetBranchesForUserUsecase>(
      () => _i150.GetBranchesForUserUsecase(gh<_i53.UsersRepository>()));
  gh.lazySingleton<_i151.GetLevelsForUserUsecase>(
      () => _i151.GetLevelsForUserUsecase(gh<_i53.UsersRepository>()));
  gh.lazySingleton<_i152.GetManagesForUserUsecase>(
      () => _i152.GetManagesForUserUsecase(gh<_i53.UsersRepository>()));
  gh.factory<_i153.GetUsersUsecase>(
      () => _i153.GetUsersUsecase(gh<_i53.UsersRepository>()));
  gh.factory<_i154.ActionLinkUsecase>(
      () => _i154.ActionLinkUsecase(gh<_i119.LinksImportantRepository>()));
  gh.factory<_i155.GetLinkUsecase>(
      () => _i155.GetLinkUsecase(gh<_i119.LinksImportantRepository>()));
  gh.lazySingleton<_i156.ManageWithdrawalsRepository>(() =>
      _i157.ManageWithdrawalsRepositoryImpl(
          gh<_i32.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i158.AgentsDistributorsRepo>(() =>
      _i159.AgentsDistributorsRepoImpl(
          gh<_i66.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i160.RegionsRepository>(
      () => _i161.RegionsRepositoryImpl(gh<_i103.RegionsDatasource>()));
  gh.factory<_i162.UsersTypeCubit>(
      () => _i162.UsersTypeCubit(gh<_i72.GetUsersUsecase>()));
  gh.factory<_i163.AddParticipateCommentUsecase>(() =>
      _i163.AddParticipateCommentUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i164.AddParticipateUserUsecase>(() =>
      _i164.AddParticipateUserUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i165.EditParticipateUserUsecase>(() =>
      _i165.EditParticipateUserUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i166.GetInvoiceByIdUsecase>(
      () => _i166.GetInvoiceByIdUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i167.ParticipateClientListUsecase>(() =>
      _i167.ParticipateClientListUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i168.ParticipateCommentListUsecase>(() =>
      _i168.ParticipateCommentListUsecase(
          gh<_i90.ParticipateListRepository>()));
  gh.factory<_i169.ParticipateInvoiceListUsecase>(() =>
      _i169.ParticipateInvoiceListUsecase(
          gh<_i90.ParticipateListRepository>()));
  gh.factory<_i170.ParticipateListUsecase>(
      () => _i170.ParticipateListUsecase(gh<_i90.ParticipateListRepository>()));
  gh.lazySingleton<_i171.ChangeParticipateStatusUsecase>(() =>
      _i171.ChangeParticipateStatusUsecase(
          gh<_i90.ParticipateListRepository>()));
  gh.factory<_i172.PendingInvoicesCubit>(
      () => _i172.PendingInvoicesCubit(gh<_i73.GetPendingInvoicesUsecase>()));
  gh.factory<_i173.GetCommunicationListUsecase>(() =>
      _i173.GetCommunicationListUsecase(
          gh<_i148.CommunicationListRepository>()));
  gh.lazySingleton<_i174.GetEmployeesSalesReportsUsecase>(() =>
      _i174.GetEmployeesSalesReportsUsecase(
          gh<_i86.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i175.ClientsTransferApprovalsRepo>(() =>
      _i176.ClientsTransferApprovalsRepoImpl(
          gh<_i30.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i177.CrudClientSupportFilesUsecase>(() =>
      _i177.CrudClientSupportFilesUsecase(
          repository: gh<_i132.ClientsListRepository>()));
  gh.lazySingleton<_i178.GetClientSupportFilesUsecase>(() =>
      _i178.GetClientSupportFilesUsecase(
          repository: gh<_i132.ClientsListRepository>()));
  gh.factory<_i179.LinkCubit>(() => _i179.LinkCubit(
        gh<_i155.GetLinkUsecase>(),
        gh<_i154.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i180.GetPreviousRatingsUsecase>(
      () => _i180.GetPreviousRatingsUsecase(gh<_i69.PreviousRatingsRepo>()));
  gh.lazySingleton<_i181.WaitingAgentsRepo>(
      () => _i182.WaitingAgentsRepoImpl(gh<_i95.WaitingAgentsDataSource>()));
  gh.factory<_i183.EmployeesSalesReportsCubit>(() =>
      _i183.EmployeesSalesReportsCubit(
          gh<_i174.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i184.ChangeStateAgentUseCase>(
      () => _i184.ChangeStateAgentUseCase(gh<_i158.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i185.GetAgentsAndDistributorsUseCase>(() =>
      _i185.GetAgentsAndDistributorsUseCase(
          gh<_i158.AgentsDistributorsRepo>()));
  gh.factory<_i186.ClientsAcceptCubit>(
      () => _i186.ClientsAcceptCubit(gh<_i127.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i187.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i187.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i156.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i188.GetWithdrawalsInvoicesUsecase>(() =>
      _i188.GetWithdrawalsInvoicesUsecase(
          gh<_i156.ManageWithdrawalsRepository>()));
  gh.factory<_i189.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i189.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i156.ManageWithdrawalsRepository>()));
  gh.factory<_i190.AddTaskUsecase>(
      () => _i190.AddTaskUsecase(gh<_i64.TaskRepository>()));
  gh.factory<_i191.ChangeStatusTaskUsecase>(
      () => _i191.ChangeStatusTaskUsecase(gh<_i64.TaskRepository>()));
  gh.factory<_i192.FilterTaskUsecase>(
      () => _i192.FilterTaskUsecase(gh<_i64.TaskRepository>()));
  gh.factory<_i193.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i193.GetUsersByDepartmentAndRegionUsecase(gh<_i64.TaskRepository>()));
  gh.lazySingleton<_i194.ExceededClientsUseCase>(
      () => _i194.ExceededClientsUseCase(gh<_i61.ExceededClientsRepo>()));
  gh.lazySingleton<_i195.TransferExceededClientsUseCase>(() =>
      _i195.TransferExceededClientsUseCase(gh<_i61.ExceededClientsRepo>()));
  gh.lazySingleton<_i196.EditAdvancedConfigsUsecase>(() =>
      _i196.EditAdvancedConfigsUsecase(gh<_i88.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i197.GetAdvancedConfigsUsecase>(() =>
      _i197.GetAdvancedConfigsUsecase(gh<_i88.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i198.DatesTableRepo>(
      () => _i199.DatesTableRepoImpl(gh<_i101.DatesTableDataSource>()));
  gh.factory<_i200.AddClientUserUsecase>(
      () => _i200.AddClientUserUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i201.ApproveRejectClientUsecase>(() =>
      _i201.ApproveRejectClientUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i202.ChangeTypeClientUsecase>(
      () => _i202.ChangeTypeClientUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i203.EditClientUserUsecase>(
      () => _i203.EditClientUserUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i204.GetClientsListByRegionUseCase>(() =>
      _i204.GetClientsListByRegionUseCase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i205.GetClientsListByUserUseCase>(() =>
      _i205.GetClientsListByUserUseCase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i206.GetClientsWithFilterUserUsecase>(() =>
      _i206.GetClientsWithFilterUserUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i207.GetClientMarketingReportUsecase>(() =>
      _i207.GetClientMarketingReportUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i208.GetRecommendedClientsUsecase>(() =>
      _i208.GetRecommendedClientsUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i209.GetSimilarClientsUsecase>(
      () => _i209.GetSimilarClientsUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i210.ReceiveClientUserUsecase>(
      () => _i210.ReceiveClientUserUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i211.TransferClientUserUsecase>(
      () => _i211.TransferClientUserUsecase(gh<_i132.ClientsListRepository>()));
  gh.factory<_i212.GetVersionUseCase>(
      () => _i212.GetVersionUseCase(gh<_i111.AppRepository>()));
  gh.factory<_i213.AddTicketCubit>(
      () => _i213.AddTicketCubit(gh<_i78.AddTicketUseCase>()));
  gh.lazySingleton<_i214.EditGeneralConfigsUsecase>(() =>
      _i214.EditGeneralConfigsUsecase(gh<_i128.GeneralConfigsRepository>()));
  gh.lazySingleton<_i215.GetGeneralConfigsUsecase>(() =>
      _i215.GetGeneralConfigsUsecase(gh<_i128.GeneralConfigsRepository>()));
  gh.factory<_i216.InstallQualityCubit>(
      () => _i216.InstallQualityCubit(gh<_i134.GetInstallUseCase>()));
  gh.lazySingleton<_i217.AddAgentUseCase>(
      () => _i217.AddAgentUseCase(gh<_i113.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i218.UpdateAgentUseCase>(() =>
      _i218.UpdateAgentUseCase(gh<_i113.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i219.GetDelayInstallReportsUseCase>(() =>
      _i219.GetDelayInstallReportsUseCase(gh<_i109.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i220.CrudAgentSupportFilesUsecase>(() =>
      _i220.CrudAgentSupportFilesUsecase(
          gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i221.GetClientsTransferApprovalsUsecase>(() =>
      _i221.GetClientsTransferApprovalsUsecase(
          gh<_i175.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i222.GetLatestClientsUseCase>(() =>
      _i222.GetLatestClientsUseCase(gh<_i67.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i223.TaskCubit>(() => _i223.TaskCubit(
        gh<_i190.AddTaskUsecase>(),
        gh<_i192.FilterTaskUsecase>(),
        gh<_i191.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i224.SupportTabCubit>(() => _i224.SupportTabCubit(
        gh<_i139.GetInvoiceByClientUsecase>(),
        gh<_i137.AddDateInstallUsecase>(),
        gh<_i142.SetDateDoneUsecase>(),
        gh<_i143.SetReadyInstallUsecase>(),
        gh<_i141.ReturnInvoiceApproveUsecase>(),
        gh<_i140.ReceiveDeviceUsecase>(),
        gh<_i138.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i225.AddAgentDateUseCase>(() =>
      _i225.AddAgentDateUseCase(gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.factory<_i226.ClientsListBloc>(() => _i226.ClientsListBloc(
        gh<_i206.GetClientsWithFilterUserUsecase>(),
        gh<_i208.GetRecommendedClientsUsecase>(),
        gh<_i200.AddClientUserUsecase>(),
        gh<_i203.EditClientUserUsecase>(),
        gh<_i202.ChangeTypeClientUsecase>(),
        gh<_i209.GetSimilarClientsUsecase>(),
        gh<_i201.ApproveRejectClientUsecase>(),
        gh<_i177.CrudClientSupportFilesUsecase>(),
        gh<_i178.GetClientSupportFilesUsecase>(),
        gh<_i211.TransferClientUserUsecase>(),
        gh<_i210.ReceiveClientUserUsecase>(),
        gh<_i207.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i227.AgentsDistributorsActionsCubit>(
      () => _i227.AgentsDistributorsActionsCubit(
            gh<_i77.GetCitiesUseCase>(),
            gh<_i217.AddAgentUseCase>(),
            gh<_i218.UpdateAgentUseCase>(),
          ));
  gh.factory<_i228.LoginCubit>(() => _i228.LoginCubit(
        gh<_i124.LoginUsecase>(),
        gh<_i126.VerifyOtpUsecase>(),
        gh<_i122.CacheTokenUsecase>(),
        gh<_i123.GetTokenUsecase>(),
        gh<_i125.ValidateTokenUsecase>(),
      ));
  gh.factory<_i229.InvoicesSectionCubit>(() => _i229.InvoicesSectionCubit(
        gh<_i121.GetInvoicesByPrivilegesUsecase>(),
        gh<_i185.GetAgentsAndDistributorsUseCase>(),
        gh<_i170.ParticipateListUsecase>(),
        gh<_i144.GetAllUsersUseCase>(),
      ));
  gh.factory<_i230.AddLevelUsecase>(
      () => _i230.AddLevelUsecase(gh<_i107.PrivilegeRepository>()));
  gh.factory<_i231.GetLevelsUsecase>(
      () => _i231.GetLevelsUsecase(gh<_i107.PrivilegeRepository>()));
  gh.factory<_i232.GetPrivilegesUsecase>(
      () => _i232.GetPrivilegesUsecase(gh<_i107.PrivilegeRepository>()));
  gh.factory<_i233.UpdatePrivilegeUsecase>(
      () => _i233.UpdatePrivilegeUsecase(gh<_i107.PrivilegeRepository>()));
  gh.factory<_i234.AttachmentsRowCubit>(() => _i234.AttachmentsRowCubit(
        gh<_i178.GetClientSupportFilesUsecase>(),
        gh<_i177.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i235.AddCommentUsecase>(
      () => _i235.AddCommentUsecase(gh<_i130.CompanyRepository>()));
  gh.factory<_i236.GetCommentUsecase>(
      () => _i236.GetCommentUsecase(gh<_i130.CompanyRepository>()));
  gh.factory<_i237.DelayInstallReportsCubit>(() =>
      _i237.DelayInstallReportsCubit(
          gh<_i219.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i238.GetRegionsByIdCountryUseCase>(
      () => _i238.GetRegionsByIdCountryUseCase(gh<_i160.RegionsRepository>()));
  gh.lazySingleton<_i239.PrivilegeCubit>(() => _i239.PrivilegeCubit(
        gh<_i231.GetLevelsUsecase>(),
        gh<_i232.GetPrivilegesUsecase>(),
        gh<_i233.UpdatePrivilegeUsecase>(),
        gh<_i230.AddLevelUsecase>(),
      ));
  gh.factory<_i240.AdvancedCofigsCubit>(() => _i240.AdvancedCofigsCubit(
        gh<_i197.GetAdvancedConfigsUsecase>(),
        gh<_i196.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i241.ParticipateListBloc>(() => _i241.ParticipateListBloc(
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
  gh.factory<_i242.ClientsTransferApprovalsCubit>(() =>
      _i242.ClientsTransferApprovalsCubit(
          gh<_i221.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i243.GeneralCofigsCubit>(() => _i243.GeneralCofigsCubit(
        gh<_i215.GetGeneralConfigsUsecase>(),
        gh<_i214.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i244.GetClientsDebtsUsecase>(
      () => _i244.GetClientsDebtsUsecase(gh<_i145.ClientsDebtsRepo>()));
  gh.lazySingleton<_i245.AddAgentCommentUsecase>(() =>
      _i245.AddAgentCommentUsecase(gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i246.DoneTrainingUsecase>(() =>
      _i246.DoneTrainingUsecase(gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i247.GetAgentUsecase>(
      () => _i247.GetAgentUsecase(gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i248.GetAgentClientListUsecase>(() =>
      _i248.GetAgentClientListUsecase(
          gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i249.GetAgentCommentsListUsecase>(() =>
      _i249.GetAgentCommentsListUsecase(
          gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i250.GetAgentDatesListUsecase>(() =>
      _i250.GetAgentDatesListUsecase(
          gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i251.GetAgentInvoiceListUsecase>(() =>
      _i251.GetAgentInvoiceListUsecase(
          gh<_i135.AgentsDistributorsProfileRepo>()));
  gh.factory<_i252.AddRejectReasonsUsecase>(() =>
      _i252.AddRejectReasonsUsecase(gh<_i156.ManageWithdrawalsRepository>()));
  gh.factory<_i253.EditRejectReasonsUsecase>(() =>
      _i253.EditRejectReasonsUsecase(gh<_i156.ManageWithdrawalsRepository>()));
  gh.factory<_i254.GetRejectReasonsUsecase>(() =>
      _i254.GetRejectReasonsUsecase(gh<_i156.ManageWithdrawalsRepository>()));
  gh.factory<_i255.GetUserSeriesUsecase>(() =>
      _i255.GetUserSeriesUsecase(gh<_i156.ManageWithdrawalsRepository>()));
  gh.factory<_i256.GetWithdrawnDetailsUsecase>(() =>
      _i256.GetWithdrawnDetailsUsecase(
          gh<_i156.ManageWithdrawalsRepository>()));
  gh.factory<_i257.SetApproveSeriesUsecase>(() =>
      _i257.SetApproveSeriesUsecase(gh<_i156.ManageWithdrawalsRepository>()));
  gh.factory<_i258.UpdateSeriesUsecase>(
      () => _i258.UpdateSeriesUsecase(gh<_i156.ManageWithdrawalsRepository>()));
  gh.singleton<_i259.AppManagerCubit>(
      () => _i259.AppManagerCubit(gh<_i212.GetVersionUseCase>()));
  gh.factory<_i260.RegionsCubit>(
      () => _i260.RegionsCubit(gh<_i238.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i261.GetWaitingAgentsUsecase>(
      () => _i261.GetWaitingAgentsUsecase(gh<_i181.WaitingAgentsRepo>()));
  gh.factory<_i262.UsersCubit>(() => _i262.UsersCubit(
        gh<_i153.GetUsersUsecase>(),
        gh<_i63.ActionUserUsecase>(),
        gh<_i193.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i152.GetManagesForUserUsecase>(),
        gh<_i151.GetLevelsForUserUsecase>(),
        gh<_i150.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i263.PreviousRatingsCubit>(
      () => _i263.PreviousRatingsCubit(gh<_i180.GetPreviousRatingsUsecase>()));
  gh.factory<_i264.CommunicationListBloc>(() =>
      _i264.CommunicationListBloc(gh<_i173.GetCommunicationListUsecase>()));
  gh.factory<_i265.AgentsDistributorsCubit>(() => _i265.AgentsDistributorsCubit(
        gh<_i185.GetAgentsAndDistributorsUseCase>(),
        gh<_i184.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i266.ExceededClientsCubit>(() => _i266.ExceededClientsCubit(
        gh<_i194.ExceededClientsUseCase>(),
        gh<_i195.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i267.LatestClientsUpdatesCubit>(() =>
      _i267.LatestClientsUpdatesCubit(gh<_i222.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i268.CancelScheduleUsecase>(
      () => _i268.CancelScheduleUsecase(gh<_i198.DatesTableRepo>()));
  gh.lazySingleton<_i269.ChangeDateToDonUsecase>(
      () => _i269.ChangeDateToDonUsecase(gh<_i198.DatesTableRepo>()));
  gh.lazySingleton<_i270.GetDateInstallationUsecase>(
      () => _i270.GetDateInstallationUsecase(gh<_i198.DatesTableRepo>()));
  gh.lazySingleton<_i271.GetInvoicesByClientForDateUsecase>(() =>
      _i271.GetInvoicesByClientForDateUsecase(gh<_i198.DatesTableRepo>()));
  gh.lazySingleton<_i272.GetSubscribedClientsUsecase>(
      () => _i272.GetSubscribedClientsUsecase(gh<_i198.DatesTableRepo>()));
  gh.lazySingleton<_i273.RescheduleDateUsecase>(
      () => _i273.RescheduleDateUsecase(gh<_i198.DatesTableRepo>()));
  gh.lazySingleton<_i274.ReturnScheduleVisitToOpenUsecase>(
      () => _i274.ReturnScheduleVisitToOpenUsecase(gh<_i198.DatesTableRepo>()));
  gh.factory<_i275.AgentsDistributorsProfileBloc>(
      () => _i275.AgentsDistributorsProfileBloc(
            gh<_i248.GetAgentClientListUsecase>(),
            gh<_i251.GetAgentInvoiceListUsecase>(),
            gh<_i166.GetInvoiceByIdUsecase>(),
            gh<_i249.GetAgentCommentsListUsecase>(),
            gh<_i245.AddAgentCommentUsecase>(),
            gh<_i246.DoneTrainingUsecase>(),
            gh<_i225.AddAgentDateUseCase>(),
            gh<_i250.GetAgentDatesListUsecase>(),
            gh<_i220.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i276.DatesTableCubit>(() => _i276.DatesTableCubit(
        gh<_i270.GetDateInstallationUsecase>(),
        gh<_i273.RescheduleDateUsecase>(),
        gh<_i269.ChangeDateToDonUsecase>(),
        gh<_i268.CancelScheduleUsecase>(),
        gh<_i274.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i272.GetSubscribedClientsUsecase>(),
        gh<_i271.GetInvoicesByClientForDateUsecase>(),
        gh<_i137.AddDateInstallUsecase>(),
      ));
  gh.factory<_i277.CompanyCubit>(() => _i277.CompanyCubit(
        gh<_i236.GetCommentUsecase>(),
        gh<_i235.AddCommentUsecase>(),
      ));
  gh.factory<_i278.ClientsDebtsCubit>(
      () => _i278.ClientsDebtsCubit(gh<_i244.GetClientsDebtsUsecase>()));
  gh.factory<_i279.ManageWithdrawalsCubit>(() => _i279.ManageWithdrawalsCubit(
        gh<_i255.GetUserSeriesUsecase>(),
        gh<_i258.UpdateSeriesUsecase>(),
        gh<_i153.GetUsersUsecase>(),
        gh<_i188.GetWithdrawalsInvoicesUsecase>(),
        gh<_i189.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i257.SetApproveSeriesUsecase>(),
        gh<_i256.GetWithdrawnDetailsUsecase>(),
        gh<_i252.AddRejectReasonsUsecase>(),
        gh<_i254.GetRejectReasonsUsecase>(),
        gh<_i253.EditRejectReasonsUsecase>(),
        gh<_i187.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i280.WaitingAgentsCubit>(
      () => _i280.WaitingAgentsCubit(gh<_i261.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i281.AppModule {}
