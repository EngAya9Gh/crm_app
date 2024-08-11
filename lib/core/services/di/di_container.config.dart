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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i33;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i117;
import '../../../features/app/domain/repositories/app_repository.dart' as _i116;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i218;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i273;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i200;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i89;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i237;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i236;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i251;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i252;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i253;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i254;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i255;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i293;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i18;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i23;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i22;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i128;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i190;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i27;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i45;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i44;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i82;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i83;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i84;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i86;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i85;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i87;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i219;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i102;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i88;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i34;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i149;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i148;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i177;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i278;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i26;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i111;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i110;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i135;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i222;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i17;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i74;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i73;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i184;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i277;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i42;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i80;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i79;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i81;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i163;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i75;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i124;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i123;
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
    as _i230;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i105;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i165;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i164;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i246;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i274;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i40;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i54;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i53;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i76;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i166;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i43;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i93;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i92;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i201;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i202;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i248;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i57;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i130;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i129;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i220;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i221;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i257;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i35;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i113;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i112;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i238;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i239;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i240;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i241;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i247;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i29;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i56;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i55;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i64;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i152;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i153;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i154;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i155;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i276;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i32;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i160;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i159;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i266;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i267;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i191;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i268;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i269;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i193;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i192;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i270;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i271;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i272;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i294;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i24;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i147;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i146;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i258;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i292;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i30;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i180;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i179;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i227;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i256;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i25;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i59;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i58;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i100;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i120;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i11;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i61;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i60;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i77;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i176;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i36;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i134;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i133;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i206;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i207;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i208;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i181;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i209;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i213;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i182;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i210;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i211;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i212;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i214;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i215;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i216;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i217;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i232;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i37;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i132;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i131;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i243;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i244;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i291;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i31;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i63;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i62;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i198;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i199;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i280;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i78;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i97;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i96;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i145;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i127;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i235;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i41;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i71;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i70;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i228;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i281;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i12;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i69;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i101;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i119;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i162;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i118;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i136;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i161;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i259;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i223;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i188;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i226;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i260;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i261;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i262;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i263;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i264;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i265;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i224;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i234;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i289;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i279;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i38;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i126;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i125;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i156;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i157;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i183;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i20;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i95;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i94;
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
    as _i250;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i21;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i91;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i90;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i178;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i187;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i16;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i47;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i46;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i122;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i233;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i15;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i66;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i65;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i72;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i203;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i103;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i205;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i204;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i282;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i283;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i284;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i285;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i286;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i287;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i288;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i290;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i10;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i51;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i50;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i104;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i121;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i19;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i115;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i114;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i225;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i245;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i49;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i48;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i52;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i98;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i28;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i151;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i150;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i158;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i249;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i99;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i186;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i185;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i275;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i295;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i39;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i68;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i67;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i194;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i195;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i196;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i197;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i229;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i242;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i107;
import '../cache_services/prefs_consumer.dart' as _i109;
import '../cache_services/secure_storage_consumer.dart' as _i108;
import '../maps/location_services.dart' as _i106;
import 'di_container.dart' as _i296;

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
  gh.lazySingleton<_i16.RegionsSalesReportsDatasource>(
      () => _i16.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i17.PreviousRatingsDatasource>(
      () => _i17.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i18.ClientsAcceptDatasource>(
      () => _i18.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i19.DelayInstallReportsDatasource>(
      () => _i19.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.ParticipatesListDatasource>(
      () => _i20.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.EmployeesSalesReportsDatasource>(
      () => _i21.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.ClientsAcceptRepository>(() =>
      _i23.ClientsAcceptRepositoryImpl(gh<_i18.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i24.ClientsDebtsDatasource>(
      () => _i24.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.FinancePendingDatasource>(
      () => _i25.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.InstallQualityDatasource>(
      () => _i26.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.TicketsDataSource>(
      () => _i27.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.SupportClientsInvoicesDatasource>(
      () => _i28.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.UsersDatasource>(
      () => _i29.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i13.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i14.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i30.ClientsTransferApprovalsDatasource>(
      () => _i30.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.ExceededClientsDatasource>(
      () => _i31.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i32.ManageWithdrawalsDatasource>(
      () => _i32.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i33.AppDatasource>(
      () => _i33.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i34.CommunicationListDatasource>(
      () => _i34.CommunicationListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i35.PrivilegeDatasource>(
      () => _i35.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i36.ClientsListDatasource>(
      () => _i36.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i37.CommentCompanyDatasource>(
      () => _i37.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i38.LinkDatasource>(
      () => _i38.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i39.TaskDatasource>(
      () => _i39.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i40.UsersDatasource>(
      () => _i40.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.LatestClientsUpdatesDatasource>(
      () => _i41.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i42.CitiesDatasource>(
      () => _i42.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i43.AdvancedConfigsDatasource>(
      () => _i43.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.TicketsRepo>(
      () => _i45.TicketsRepoImpl(gh<_i27.TicketsDataSource>()));
  gh.lazySingleton<_i46.RegionsSalesReportsRepo>(() =>
      _i47.RegionsSalesReportsRepoImpl(
          gh<_i16.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i48.SupportClientsAcceptRepository>(() =>
      _i49.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i50.DelayAfterInstallRepo>(() =>
      _i51.DelayAfterInstallRepoImpl(gh<_i10.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i52.GetSupportClientsAcceptUseCase>(() =>
      _i52.GetSupportClientsAcceptUseCase(
          gh<_i48.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i53.UsersRepository>(
      () => _i54.UsersRepositoryImpl(gh<_i40.UsersDatasource>()));
  gh.lazySingleton<_i55.UsersRepository>(
      () => _i56.UsersRepositoryImpl(gh<_i29.UsersDatasource>()));
  gh.lazySingleton<_i57.GeneralConfigsDatasource>(
      () => _i57.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i58.FinancePendingRepo>(
      () => _i59.FinancePendingRepoImpl(gh<_i25.FinancePendingDatasource>()));
  gh.lazySingleton<_i60.PendingInvoicesRepo>(
      () => _i61.PendingInvoicesRepoImpl(gh<_i11.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i62.ExceededClientsRepo>(
      () => _i63.ExceededClientsRepoImpl(gh<_i31.ExceededClientsDatasource>()));
  gh.factory<_i64.ActionUserUsecase>(
      () => _i64.ActionUserUsecase(gh<_i55.UsersRepository>()));
  gh.lazySingleton<_i65.ClientsInstallReportsRepo>(() =>
      _i66.ClientsInstallReportsRepoImpl(
          gh<_i15.ClientsInstallReportsDatasource>()));
  gh.factory<_i67.TaskRepository>(
      () => _i68.TaskRepositoryImpl(gh<_i39.TaskDatasource>()));
  gh.lazySingleton<_i69.AgentsDistributorsDataSource>(
      () => _i69.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i70.LatestClientsUpdatesRepository>(() =>
      _i71.LatestClientsUpdatesRepositoryImpl(
          gh<_i41.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i72.GetClientsInstallReportsUsecase>(() =>
      _i72.GetClientsInstallReportsUsecase(
          gh<_i65.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i73.PreviousRatingsRepo>(
      () => _i74.PreviousRatingsRepoImpl(gh<_i17.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i75.SupportTabDataSource>(
      () => _i75.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i76.GetUsersUsecase>(
      () => _i76.GetUsersUsecase(gh<_i53.UsersRepository>()));
  gh.lazySingleton<_i77.GetPendingInvoicesUsecase>(
      () => _i77.GetPendingInvoicesUsecase(gh<_i60.PendingInvoicesRepo>()));
  gh.lazySingleton<_i78.InvoicesTabDataSource>(
      () => _i78.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i79.CitiesRepository>(
      () => _i80.CitiesRepositoryImpl(gh<_i42.CitiesDatasource>()));
  gh.lazySingleton<_i81.GetCitiesUseCase>(
      () => _i81.GetCitiesUseCase(gh<_i79.CitiesRepository>()));
  gh.lazySingleton<_i82.AddTicketUseCase>(
      () => _i82.AddTicketUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i83.EditTicketTypeUseCase>(
      () => _i83.EditTicketTypeUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i84.GetClientTicketsUseCase>(
      () => _i84.GetClientTicketsUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i85.GetTicketsUseCase>(
      () => _i85.GetTicketsUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i86.GetTicketByIdUseCase>(
      () => _i86.GetTicketByIdUseCase(gh<_i44.TicketsRepo>()));
  gh.lazySingleton<_i87.TransferTicketUseCase>(
      () => _i87.TransferTicketUseCase(gh<_i44.TicketsRepo>()));
  gh.factory<_i88.TicketsCubit>(() => _i88.TicketsCubit(
        gh<_i85.GetTicketsUseCase>(),
        gh<_i86.GetTicketByIdUseCase>(),
        gh<_i84.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i89.LoginRemoteDataSource>(
      () => _i89.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i90.EmployeesSalesReportsRepo>(() =>
      _i91.EmployeesSalesReportsRepoImpl(
          gh<_i21.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i92.AdvancedConfigsRepository>(() =>
      _i93.AdvancedConfigsRepositoryImpl(gh<_i43.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i94.ParticipateListRepository>(() =>
      _i95.ParticipateListRepositoryImpl(
          gh<_i20.ParticipatesListDatasource>()));
  gh.lazySingleton<_i96.InvoicesSectionRepo>(
      () => _i97.InvoicesTabRepoImpl(gh<_i78.InvoicesTabDataSource>()));
  gh.factory<_i98.SupportClientsAcceptCubit>(() =>
      _i98.SupportClientsAcceptCubit(
          gh<_i52.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i99.WaitingAgentsDataSource>(
      () => _i99.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i100.GetFinancePendingInvoicesUsecase>(() =>
      _i100.GetFinancePendingInvoicesUsecase(gh<_i58.FinancePendingRepo>()));
  gh.lazySingleton<_i101.AgentsDistributorsProfileDataSource>(() =>
      _i101.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i102.EditTicketCubit>(() => _i102.EditTicketCubit(
        gh<_i83.EditTicketTypeUseCase>(),
        gh<_i87.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i103.DatesTableDataSource>(
      () => _i103.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i104.GetDelayAfterInstallUseCase>(() =>
      _i104.GetDelayAfterInstallUseCase(gh<_i50.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i105.RegionsDatasource>(
      () => _i105.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i106.LocationServices>(
      () => _i106.LocationServices(gh<_i6.Location>()));
  gh.singleton<_i107.CacheServices>(
    () => _i108.SecureStorageConsumer(gh<_i14.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i107.CacheServices>(() async =>
      _i109.PrefsConsumer(await gh.getAsync<_i13.SharedPreferences>()));
  gh.lazySingleton<_i110.InstallQualityRepo>(
      () => _i111.InstallQualityRepoImpl(gh<_i26.InstallQualityDatasource>()));
  gh.factory<_i112.PrivilegeRepository>(
      () => _i113.PrivilegeRepositoryImpl(gh<_i35.PrivilegeDatasource>()));
  gh.lazySingleton<_i114.DelayInstallReportsRepo>(() =>
      _i115.DelayInstallReportsRepoImpl(
          gh<_i19.DelayInstallReportsDatasource>()));
  gh.factory<_i116.AppRepository>(
      () => _i117.AppRepositoryImpl(gh<_i33.AppDatasource>()));
  gh.lazySingleton<_i118.AgentsDistributorsActionsRepo>(() =>
      _i119.AgentsDistributorsActionsRepoImpl(
          gh<_i12.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i120.FinancePendingCubit>(() =>
      _i120.FinancePendingCubit(gh<_i100.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i121.DelayAfterInstallCubit>(() =>
      _i121.DelayAfterInstallCubit(gh<_i104.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i122.GetRegionsSalesReportsUsecase>(() =>
      _i122.GetRegionsSalesReportsUsecase(gh<_i46.RegionsSalesReportsRepo>()));
  gh.lazySingleton<_i123.SupportTabRepo>(
      () => _i124.SupportTabRepoImpl(gh<_i75.SupportTabDataSource>()));
  gh.factory<_i125.LinksImportantRepository>(
      () => _i126.LinkRepositoryImpl(gh<_i38.LinkDatasource>()));
  gh.lazySingleton<_i127.GetInvoicesByPrivilegesUsecase>(() =>
      _i127.GetInvoicesByPrivilegesUsecase(gh<_i96.InvoicesSectionRepo>()));
  gh.lazySingleton<_i128.GetClientsAcceptUseCase>(
      () => _i128.GetClientsAcceptUseCase(gh<_i22.ClientsAcceptRepository>()));
  gh.lazySingleton<_i129.GeneralConfigsRepository>(() =>
      _i130.GeneralConfigsRepositoryImpl(gh<_i57.GeneralConfigsDatasource>()));
  gh.factory<_i131.CompanyRepository>(
      () => _i132.CompanyRepositoryImpl(gh<_i37.CommentCompanyDatasource>()));
  gh.factory<_i133.ClientsListRepository>(
      () => _i134.ClientsListRepositoryImpl(gh<_i36.ClientsListDatasource>()));
  gh.lazySingleton<_i135.GetInstallUseCase>(
      () => _i135.GetInstallUseCase(gh<_i110.InstallQualityRepo>()));
  gh.lazySingleton<_i136.AgentsDistributorsProfileRepo>(() =>
      _i137.AgentsDistributorsProfileRepoImpl(
          gh<_i101.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i138.AddDateInstallUsecase>(
      () => _i138.AddDateInstallUsecase(gh<_i123.SupportTabRepo>()));
  gh.lazySingleton<_i139.CancelDateInstallUsecase>(
      () => _i139.CancelDateInstallUsecase(gh<_i123.SupportTabRepo>()));
  gh.lazySingleton<_i140.GetInvoiceByClientUsecase>(
      () => _i140.GetInvoiceByClientUsecase(gh<_i123.SupportTabRepo>()));
  gh.lazySingleton<_i141.ReceiveDeviceUsecase>(
      () => _i141.ReceiveDeviceUsecase(gh<_i123.SupportTabRepo>()));
  gh.lazySingleton<_i142.ReturnInvoiceApproveUsecase>(
      () => _i142.ReturnInvoiceApproveUsecase(gh<_i123.SupportTabRepo>()));
  gh.lazySingleton<_i143.SetDateDoneUsecase>(
      () => _i143.SetDateDoneUsecase(gh<_i123.SupportTabRepo>()));
  gh.lazySingleton<_i144.SetReadyInstallUsecase>(
      () => _i144.SetReadyInstallUsecase(gh<_i123.SupportTabRepo>()));
  gh.lazySingleton<_i145.GetAllUsersUseCase>(
      () => _i145.GetAllUsersUseCase(gh<_i96.InvoicesSectionRepo>()));
  gh.lazySingleton<_i146.ClientsDebtsRepo>(
      () => _i147.ClientsDebtsRepoImpl(gh<_i24.ClientsDebtsDatasource>()));
  gh.factory<_i148.CommunicationListRepository>(() =>
      _i149.CommunicationListRepositoryImpl(
          gh<_i34.CommunicationListDatasource>()));
  gh.lazySingleton<_i150.SupportClientsInvoicesRepo>(() =>
      _i151.SupportClientsInvoicesRepoImpl(
          gh<_i28.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i152.GetBranchesForUserUsecase>(
      () => _i152.GetBranchesForUserUsecase(gh<_i55.UsersRepository>()));
  gh.lazySingleton<_i153.GetLevelsForUserUsecase>(
      () => _i153.GetLevelsForUserUsecase(gh<_i55.UsersRepository>()));
  gh.lazySingleton<_i154.GetManagesForUserUsecase>(
      () => _i154.GetManagesForUserUsecase(gh<_i55.UsersRepository>()));
  gh.factory<_i155.GetUsersUsecase>(
      () => _i155.GetUsersUsecase(gh<_i55.UsersRepository>()));
  gh.factory<_i156.ActionLinkUsecase>(
      () => _i156.ActionLinkUsecase(gh<_i125.LinksImportantRepository>()));
  gh.factory<_i157.GetLinkUsecase>(
      () => _i157.GetLinkUsecase(gh<_i125.LinksImportantRepository>()));
  gh.lazySingleton<_i158.GetSupportClientsInvoicesUseCase>(() =>
      _i158.GetSupportClientsInvoicesUseCase(
          gh<_i150.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i159.ManageWithdrawalsRepository>(() =>
      _i160.ManageWithdrawalsRepositoryImpl(
          gh<_i32.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i161.AgentsDistributorsRepo>(() =>
      _i162.AgentsDistributorsRepoImpl(
          gh<_i69.AgentsDistributorsDataSource>()));
  gh.singleton<_i163.CitiesCubit>(
      () => _i163.CitiesCubit(gh<_i81.GetCitiesUseCase>()));
  gh.lazySingleton<_i164.RegionsRepository>(
      () => _i165.RegionsRepositoryImpl(gh<_i105.RegionsDatasource>()));
  gh.factory<_i166.UsersTypeCubit>(
      () => _i166.UsersTypeCubit(gh<_i76.GetUsersUsecase>()));
  gh.factory<_i167.AddParticipateCommentUsecase>(() =>
      _i167.AddParticipateCommentUsecase(gh<_i94.ParticipateListRepository>()));
  gh.factory<_i168.AddParticipateUserUsecase>(() =>
      _i168.AddParticipateUserUsecase(gh<_i94.ParticipateListRepository>()));
  gh.factory<_i169.EditParticipateUserUsecase>(() =>
      _i169.EditParticipateUserUsecase(gh<_i94.ParticipateListRepository>()));
  gh.factory<_i170.GetInvoiceByIdUsecase>(
      () => _i170.GetInvoiceByIdUsecase(gh<_i94.ParticipateListRepository>()));
  gh.factory<_i171.ParticipateClientListUsecase>(() =>
      _i171.ParticipateClientListUsecase(gh<_i94.ParticipateListRepository>()));
  gh.factory<_i172.ParticipateCommentListUsecase>(() =>
      _i172.ParticipateCommentListUsecase(
          gh<_i94.ParticipateListRepository>()));
  gh.factory<_i173.ParticipateInvoiceListUsecase>(() =>
      _i173.ParticipateInvoiceListUsecase(
          gh<_i94.ParticipateListRepository>()));
  gh.factory<_i174.ParticipateListUsecase>(
      () => _i174.ParticipateListUsecase(gh<_i94.ParticipateListRepository>()));
  gh.lazySingleton<_i175.ChangeParticipateStatusUsecase>(() =>
      _i175.ChangeParticipateStatusUsecase(
          gh<_i94.ParticipateListRepository>()));
  gh.factory<_i176.PendingInvoicesCubit>(
      () => _i176.PendingInvoicesCubit(gh<_i77.GetPendingInvoicesUsecase>()));
  gh.factory<_i177.GetCommunicationListUsecase>(() =>
      _i177.GetCommunicationListUsecase(
          gh<_i148.CommunicationListRepository>()));
  gh.lazySingleton<_i178.GetEmployeesSalesReportsUsecase>(() =>
      _i178.GetEmployeesSalesReportsUsecase(
          gh<_i90.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i179.ClientsTransferApprovalsRepo>(() =>
      _i180.ClientsTransferApprovalsRepoImpl(
          gh<_i30.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i181.CrudClientSupportFilesUsecase>(() =>
      _i181.CrudClientSupportFilesUsecase(
          repository: gh<_i133.ClientsListRepository>()));
  gh.lazySingleton<_i182.GetClientSupportFilesUsecase>(() =>
      _i182.GetClientSupportFilesUsecase(
          repository: gh<_i133.ClientsListRepository>()));
  gh.factory<_i183.LinkCubit>(() => _i183.LinkCubit(
        gh<_i157.GetLinkUsecase>(),
        gh<_i156.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i184.GetPreviousRatingsUsecase>(
      () => _i184.GetPreviousRatingsUsecase(gh<_i73.PreviousRatingsRepo>()));
  gh.lazySingleton<_i185.WaitingAgentsRepo>(
      () => _i186.WaitingAgentsRepoImpl(gh<_i99.WaitingAgentsDataSource>()));
  gh.factory<_i187.EmployeesSalesReportsCubit>(() =>
      _i187.EmployeesSalesReportsCubit(
          gh<_i178.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i188.ChangeStateAgentUseCase>(
      () => _i188.ChangeStateAgentUseCase(gh<_i161.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i189.GetAgentsAndDistributorsUseCase>(() =>
      _i189.GetAgentsAndDistributorsUseCase(
          gh<_i161.AgentsDistributorsRepo>()));
  gh.factory<_i190.ClientsAcceptCubit>(
      () => _i190.ClientsAcceptCubit(gh<_i128.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i191.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i191.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i159.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i192.GetWithdrawalsInvoicesUsecase>(() =>
      _i192.GetWithdrawalsInvoicesUsecase(
          gh<_i159.ManageWithdrawalsRepository>()));
  gh.factory<_i193.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i193.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i159.ManageWithdrawalsRepository>()));
  gh.factory<_i194.AddTaskUsecase>(
      () => _i194.AddTaskUsecase(gh<_i67.TaskRepository>()));
  gh.factory<_i195.ChangeStatusTaskUsecase>(
      () => _i195.ChangeStatusTaskUsecase(gh<_i67.TaskRepository>()));
  gh.factory<_i196.FilterTaskUsecase>(
      () => _i196.FilterTaskUsecase(gh<_i67.TaskRepository>()));
  gh.factory<_i197.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i197.GetUsersByDepartmentAndRegionUsecase(gh<_i67.TaskRepository>()));
  gh.lazySingleton<_i198.ExceededClientsUseCase>(
      () => _i198.ExceededClientsUseCase(gh<_i62.ExceededClientsRepo>()));
  gh.lazySingleton<_i199.TransferExceededClientsUseCase>(() =>
      _i199.TransferExceededClientsUseCase(gh<_i62.ExceededClientsRepo>()));
  gh.lazySingleton<_i200.LoginLocalDataSource>(() =>
      _i200.LoginLocalDataSourceImpl(
          gh<_i107.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i201.EditAdvancedConfigsUsecase>(() =>
      _i201.EditAdvancedConfigsUsecase(gh<_i92.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i202.GetAdvancedConfigsUsecase>(() =>
      _i202.GetAdvancedConfigsUsecase(gh<_i92.AdvancedConfigsRepository>()));
  gh.factory<_i203.ClientsInstallReportsCubit>(() =>
      _i203.ClientsInstallReportsCubit(
          gh<_i72.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i204.DatesTableRepo>(
      () => _i205.DatesTableRepoImpl(gh<_i103.DatesTableDataSource>()));
  gh.factory<_i206.AddClientUserUsecase>(
      () => _i206.AddClientUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i207.ApproveRejectClientUsecase>(() =>
      _i207.ApproveRejectClientUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i208.ChangeTypeClientUsecase>(
      () => _i208.ChangeTypeClientUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i209.EditClientUserUsecase>(
      () => _i209.EditClientUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i210.GetClientsListByRegionUseCase>(() =>
      _i210.GetClientsListByRegionUseCase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i211.GetClientsListByUserUseCase>(() =>
      _i211.GetClientsListByUserUseCase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i212.GetClientsWithFilterUserUsecase>(() =>
      _i212.GetClientsWithFilterUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i213.GetClientMarketingReportUsecase>(() =>
      _i213.GetClientMarketingReportUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i214.GetRecommendedClientsUsecase>(() =>
      _i214.GetRecommendedClientsUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i215.GetSimilarClientsUsecase>(
      () => _i215.GetSimilarClientsUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i216.ReceiveClientUserUsecase>(
      () => _i216.ReceiveClientUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i217.TransferClientUserUsecase>(
      () => _i217.TransferClientUserUsecase(gh<_i133.ClientsListRepository>()));
  gh.factory<_i218.GetVersionUseCase>(
      () => _i218.GetVersionUseCase(gh<_i116.AppRepository>()));
  gh.factory<_i219.AddTicketCubit>(
      () => _i219.AddTicketCubit(gh<_i82.AddTicketUseCase>()));
  gh.lazySingleton<_i220.EditGeneralConfigsUsecase>(() =>
      _i220.EditGeneralConfigsUsecase(gh<_i129.GeneralConfigsRepository>()));
  gh.lazySingleton<_i221.GetGeneralConfigsUsecase>(() =>
      _i221.GetGeneralConfigsUsecase(gh<_i129.GeneralConfigsRepository>()));
  gh.factory<_i222.InstallQualityCubit>(
      () => _i222.InstallQualityCubit(gh<_i135.GetInstallUseCase>()));
  gh.lazySingleton<_i223.AddAgentUseCase>(
      () => _i223.AddAgentUseCase(gh<_i118.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i224.UpdateAgentUseCase>(() =>
      _i224.UpdateAgentUseCase(gh<_i118.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i225.GetDelayInstallReportsUseCase>(() =>
      _i225.GetDelayInstallReportsUseCase(gh<_i114.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i226.CrudAgentSupportFilesUsecase>(() =>
      _i226.CrudAgentSupportFilesUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i227.GetClientsTransferApprovalsUsecase>(() =>
      _i227.GetClientsTransferApprovalsUsecase(
          gh<_i179.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i228.GetLatestClientsUseCase>(() =>
      _i228.GetLatestClientsUseCase(gh<_i70.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i229.TaskCubit>(() => _i229.TaskCubit(
        gh<_i194.AddTaskUsecase>(),
        gh<_i196.FilterTaskUsecase>(),
        gh<_i195.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i230.SupportTabCubit>(() => _i230.SupportTabCubit(
        gh<_i140.GetInvoiceByClientUsecase>(),
        gh<_i138.AddDateInstallUsecase>(),
        gh<_i143.SetDateDoneUsecase>(),
        gh<_i144.SetReadyInstallUsecase>(),
        gh<_i142.ReturnInvoiceApproveUsecase>(),
        gh<_i141.ReceiveDeviceUsecase>(),
        gh<_i139.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i231.AddAgentDateUseCase>(() =>
      _i231.AddAgentDateUseCase(gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.factory<_i232.ClientsListBloc>(() => _i232.ClientsListBloc(
        gh<_i212.GetClientsWithFilterUserUsecase>(),
        gh<_i214.GetRecommendedClientsUsecase>(),
        gh<_i206.AddClientUserUsecase>(),
        gh<_i209.EditClientUserUsecase>(),
        gh<_i208.ChangeTypeClientUsecase>(),
        gh<_i215.GetSimilarClientsUsecase>(),
        gh<_i207.ApproveRejectClientUsecase>(),
        gh<_i181.CrudClientSupportFilesUsecase>(),
        gh<_i182.GetClientSupportFilesUsecase>(),
        gh<_i217.TransferClientUserUsecase>(),
        gh<_i216.ReceiveClientUserUsecase>(),
        gh<_i213.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i233.RegionsSalesReportsCubit>(() =>
      _i233.RegionsSalesReportsCubit(
          gh<_i122.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i234.AgentsDistributorsActionsCubit>(
      () => _i234.AgentsDistributorsActionsCubit(
            gh<_i81.GetCitiesUseCase>(),
            gh<_i223.AddAgentUseCase>(),
            gh<_i224.UpdateAgentUseCase>(),
          ));
  gh.factory<_i235.InvoicesSectionCubit>(() => _i235.InvoicesSectionCubit(
        gh<_i127.GetInvoicesByPrivilegesUsecase>(),
        gh<_i189.GetAgentsAndDistributorsUseCase>(),
        gh<_i174.ParticipateListUsecase>(),
        gh<_i145.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i236.LoginRepo>(() => _i237.LoginRepoImpl(
        gh<_i89.LoginRemoteDataSource>(),
        gh<_i200.LoginLocalDataSource>(),
      ));
  gh.factory<_i238.AddLevelUsecase>(
      () => _i238.AddLevelUsecase(gh<_i112.PrivilegeRepository>()));
  gh.factory<_i239.GetLevelsUsecase>(
      () => _i239.GetLevelsUsecase(gh<_i112.PrivilegeRepository>()));
  gh.factory<_i240.GetPrivilegesUsecase>(
      () => _i240.GetPrivilegesUsecase(gh<_i112.PrivilegeRepository>()));
  gh.factory<_i241.UpdatePrivilegeUsecase>(
      () => _i241.UpdatePrivilegeUsecase(gh<_i112.PrivilegeRepository>()));
  gh.factory<_i242.AttachmentsRowCubit>(() => _i242.AttachmentsRowCubit(
        gh<_i182.GetClientSupportFilesUsecase>(),
        gh<_i181.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i243.AddCommentUsecase>(
      () => _i243.AddCommentUsecase(gh<_i131.CompanyRepository>()));
  gh.factory<_i244.GetCommentUsecase>(
      () => _i244.GetCommentUsecase(gh<_i131.CompanyRepository>()));
  gh.factory<_i245.DelayInstallReportsCubit>(() =>
      _i245.DelayInstallReportsCubit(
          gh<_i225.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i246.GetRegionsByIdCountryUseCase>(
      () => _i246.GetRegionsByIdCountryUseCase(gh<_i164.RegionsRepository>()));
  gh.lazySingleton<_i247.PrivilegeCubit>(() => _i247.PrivilegeCubit(
        gh<_i239.GetLevelsUsecase>(),
        gh<_i240.GetPrivilegesUsecase>(),
        gh<_i241.UpdatePrivilegeUsecase>(),
        gh<_i238.AddLevelUsecase>(),
      ));
  gh.factory<_i248.AdvancedCofigsCubit>(() => _i248.AdvancedCofigsCubit(
        gh<_i202.GetAdvancedConfigsUsecase>(),
        gh<_i201.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i249.SupportClientsInvoicesCubit>(() =>
      _i249.SupportClientsInvoicesCubit(
          gh<_i158.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i250.ParticipateListBloc>(() => _i250.ParticipateListBloc(
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
  gh.lazySingleton<_i251.CacheTokenUsecase>(
      () => _i251.CacheTokenUsecase(gh<_i236.LoginRepo>()));
  gh.lazySingleton<_i252.GetTokenUsecase>(
      () => _i252.GetTokenUsecase(gh<_i236.LoginRepo>()));
  gh.lazySingleton<_i253.LoginUsecase>(
      () => _i253.LoginUsecase(gh<_i236.LoginRepo>()));
  gh.lazySingleton<_i254.ValidateTokenUsecase>(
      () => _i254.ValidateTokenUsecase(gh<_i236.LoginRepo>()));
  gh.lazySingleton<_i255.VerifyOtpUsecase>(
      () => _i255.VerifyOtpUsecase(gh<_i236.LoginRepo>()));
  gh.factory<_i256.ClientsTransferApprovalsCubit>(() =>
      _i256.ClientsTransferApprovalsCubit(
          gh<_i227.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i257.GeneralCofigsCubit>(() => _i257.GeneralCofigsCubit(
        gh<_i221.GetGeneralConfigsUsecase>(),
        gh<_i220.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i258.GetClientsDebtsUsecase>(
      () => _i258.GetClientsDebtsUsecase(gh<_i146.ClientsDebtsRepo>()));
  gh.lazySingleton<_i259.AddAgentCommentUsecase>(() =>
      _i259.AddAgentCommentUsecase(gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i260.DoneTrainingUsecase>(() =>
      _i260.DoneTrainingUsecase(gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i261.GetAgentUsecase>(
      () => _i261.GetAgentUsecase(gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i262.GetAgentClientListUsecase>(() =>
      _i262.GetAgentClientListUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i263.GetAgentCommentsListUsecase>(() =>
      _i263.GetAgentCommentsListUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i264.GetAgentDatesListUsecase>(() =>
      _i264.GetAgentDatesListUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i265.GetAgentInvoiceListUsecase>(() =>
      _i265.GetAgentInvoiceListUsecase(
          gh<_i136.AgentsDistributorsProfileRepo>()));
  gh.factory<_i266.AddRejectReasonsUsecase>(() =>
      _i266.AddRejectReasonsUsecase(gh<_i159.ManageWithdrawalsRepository>()));
  gh.factory<_i267.EditRejectReasonsUsecase>(() =>
      _i267.EditRejectReasonsUsecase(gh<_i159.ManageWithdrawalsRepository>()));
  gh.factory<_i268.GetRejectReasonsUsecase>(() =>
      _i268.GetRejectReasonsUsecase(gh<_i159.ManageWithdrawalsRepository>()));
  gh.factory<_i269.GetUserSeriesUsecase>(() =>
      _i269.GetUserSeriesUsecase(gh<_i159.ManageWithdrawalsRepository>()));
  gh.factory<_i270.GetWithdrawnDetailsUsecase>(() =>
      _i270.GetWithdrawnDetailsUsecase(
          gh<_i159.ManageWithdrawalsRepository>()));
  gh.factory<_i271.SetApproveSeriesUsecase>(() =>
      _i271.SetApproveSeriesUsecase(gh<_i159.ManageWithdrawalsRepository>()));
  gh.factory<_i272.UpdateSeriesUsecase>(
      () => _i272.UpdateSeriesUsecase(gh<_i159.ManageWithdrawalsRepository>()));
  gh.singleton<_i273.AppManagerCubit>(
      () => _i273.AppManagerCubit(gh<_i218.GetVersionUseCase>()));
  gh.factory<_i274.RegionsCubit>(
      () => _i274.RegionsCubit(gh<_i246.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i275.GetWaitingAgentsUsecase>(
      () => _i275.GetWaitingAgentsUsecase(gh<_i185.WaitingAgentsRepo>()));
  gh.factory<_i276.UsersCubit>(() => _i276.UsersCubit(
        gh<_i155.GetUsersUsecase>(),
        gh<_i64.ActionUserUsecase>(),
        gh<_i197.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i154.GetManagesForUserUsecase>(),
        gh<_i153.GetLevelsForUserUsecase>(),
        gh<_i152.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i277.PreviousRatingsCubit>(
      () => _i277.PreviousRatingsCubit(gh<_i184.GetPreviousRatingsUsecase>()));
  gh.factory<_i278.CommunicationListBloc>(() =>
      _i278.CommunicationListBloc(gh<_i177.GetCommunicationListUsecase>()));
  gh.factory<_i279.AgentsDistributorsCubit>(() => _i279.AgentsDistributorsCubit(
        gh<_i189.GetAgentsAndDistributorsUseCase>(),
        gh<_i188.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i280.ExceededClientsCubit>(() => _i280.ExceededClientsCubit(
        gh<_i198.ExceededClientsUseCase>(),
        gh<_i199.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i281.LatestClientsUpdatesCubit>(() =>
      _i281.LatestClientsUpdatesCubit(gh<_i228.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i282.CancelScheduleUsecase>(
      () => _i282.CancelScheduleUsecase(gh<_i204.DatesTableRepo>()));
  gh.lazySingleton<_i283.ChangeDateToDonUsecase>(
      () => _i283.ChangeDateToDonUsecase(gh<_i204.DatesTableRepo>()));
  gh.lazySingleton<_i284.GetDateInstallationUsecase>(
      () => _i284.GetDateInstallationUsecase(gh<_i204.DatesTableRepo>()));
  gh.lazySingleton<_i285.GetInvoicesByClientForDateUsecase>(() =>
      _i285.GetInvoicesByClientForDateUsecase(gh<_i204.DatesTableRepo>()));
  gh.lazySingleton<_i286.GetSubscribedClientsUsecase>(
      () => _i286.GetSubscribedClientsUsecase(gh<_i204.DatesTableRepo>()));
  gh.lazySingleton<_i287.RescheduleDateUsecase>(
      () => _i287.RescheduleDateUsecase(gh<_i204.DatesTableRepo>()));
  gh.lazySingleton<_i288.ReturnScheduleVisitToOpenUsecase>(
      () => _i288.ReturnScheduleVisitToOpenUsecase(gh<_i204.DatesTableRepo>()));
  gh.factory<_i289.AgentsDistributorsProfileBloc>(
      () => _i289.AgentsDistributorsProfileBloc(
            gh<_i262.GetAgentClientListUsecase>(),
            gh<_i265.GetAgentInvoiceListUsecase>(),
            gh<_i170.GetInvoiceByIdUsecase>(),
            gh<_i263.GetAgentCommentsListUsecase>(),
            gh<_i259.AddAgentCommentUsecase>(),
            gh<_i260.DoneTrainingUsecase>(),
            gh<_i231.AddAgentDateUseCase>(),
            gh<_i264.GetAgentDatesListUsecase>(),
            gh<_i226.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i290.DatesTableCubit>(() => _i290.DatesTableCubit(
        gh<_i284.GetDateInstallationUsecase>(),
        gh<_i287.RescheduleDateUsecase>(),
        gh<_i283.ChangeDateToDonUsecase>(),
        gh<_i282.CancelScheduleUsecase>(),
        gh<_i288.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i286.GetSubscribedClientsUsecase>(),
        gh<_i285.GetInvoicesByClientForDateUsecase>(),
        gh<_i138.AddDateInstallUsecase>(),
      ));
  gh.factory<_i291.CompanyCubit>(() => _i291.CompanyCubit(
        gh<_i244.GetCommentUsecase>(),
        gh<_i243.AddCommentUsecase>(),
      ));
  gh.factory<_i292.ClientsDebtsCubit>(
      () => _i292.ClientsDebtsCubit(gh<_i258.GetClientsDebtsUsecase>()));
  gh.factory<_i293.LoginCubit>(() => _i293.LoginCubit(
        gh<_i253.LoginUsecase>(),
        gh<_i255.VerifyOtpUsecase>(),
        gh<_i251.CacheTokenUsecase>(),
        gh<_i252.GetTokenUsecase>(),
        gh<_i254.ValidateTokenUsecase>(),
      ));
  gh.factory<_i294.ManageWithdrawalsCubit>(() => _i294.ManageWithdrawalsCubit(
        gh<_i269.GetUserSeriesUsecase>(),
        gh<_i272.UpdateSeriesUsecase>(),
        gh<_i155.GetUsersUsecase>(),
        gh<_i192.GetWithdrawalsInvoicesUsecase>(),
        gh<_i193.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i271.SetApproveSeriesUsecase>(),
        gh<_i270.GetWithdrawnDetailsUsecase>(),
        gh<_i266.AddRejectReasonsUsecase>(),
        gh<_i268.GetRejectReasonsUsecase>(),
        gh<_i267.EditRejectReasonsUsecase>(),
        gh<_i191.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i295.WaitingAgentsCubit>(
      () => _i295.WaitingAgentsCubit(gh<_i275.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i296.AppModule {}
