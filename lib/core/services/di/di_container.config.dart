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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i35;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i123;
import '../../../features/app/domain/repositories/app_repository.dart' as _i122;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i226;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i282;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i208;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i93;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i246;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i245;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i260;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i261;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i262;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i263;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i264;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i303;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i20;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i25;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i24;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i134;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i198;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i29;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i47;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i46;
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
    as _i227;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i108;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i92;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i36;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i156;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i155;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i185;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i288;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i28;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i117;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i116;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i141;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i230;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i19;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i78;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i77;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i192;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i287;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i44;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i84;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i83;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i85;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i171;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i79;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i130;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i129;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i144;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i145;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i146;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i147;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i148;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i149;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i150;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i238;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i111;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i173;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i172;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i255;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i283;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i42;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i56;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i55;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i80;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i174;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i45;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i97;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i96;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i209;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i210;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i257;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i61;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i136;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i135;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i228;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i229;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i266;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i37;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i119;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i118;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i247;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i248;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i249;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i250;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i256;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i31;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i58;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i57;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i68;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i159;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i160;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i161;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i162;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i286;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i34;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i167;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i166;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i275;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i276;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i199;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i277;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i278;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i201;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i200;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i279;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i280;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i281;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i304;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i26;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i154;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i153;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i267;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i302;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i32;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i188;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i187;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i235;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i265;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i27;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i63;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i62;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i104;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i126;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i11;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i65;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i64;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i81;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i184;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i38;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i140;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i139;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i214;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i215;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i216;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i189;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i217;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i221;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i190;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i218;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i219;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i220;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i222;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i223;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i224;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i225;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i241;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i39;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i138;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i137;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i252;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i253;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i301;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i33;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i67;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i66;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i206;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i207;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i290;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i82;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i101;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i100;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i151;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i133;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i244;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i43;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i75;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i74;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i236;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i291;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i13;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i73;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i107;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i125;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i143;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i169;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i124;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i142;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i168;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i268;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i240;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i196;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i234;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i269;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i270;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i271;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i272;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i273;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i274;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i197;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i232;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i243;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i299;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i289;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i40;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i132;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i131;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i163;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i164;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i191;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i22;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i99;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i98;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i176;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i183;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i177;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i178;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i181;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i180;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i182;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i259;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i18;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i60;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i59;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i152;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i239;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i23;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i95;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i94;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i186;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i195;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i12;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i106;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i105;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i170;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i285;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i17;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i49;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i48;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i128;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i242;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i16;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i70;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i69;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i76;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i211;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i109;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i213;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i212;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i292;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i293;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i294;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i295;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i296;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i297;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i298;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i300;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i10;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i53;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i52;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i110;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i127;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i21;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i121;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i120;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i233;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i254;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i51;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i50;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i54;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i102;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i30;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i158;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i157;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i165;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i258;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i103;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i194;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i193;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i284;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i305;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i41;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i72;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i71;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i202;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i203;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i204;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i205;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i237;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i251;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i113;
import '../cache_services/prefs_consumer.dart' as _i115;
import '../cache_services/secure_storage_consumer.dart' as _i114;
import '../maps/location_services.dart' as _i112;
import 'di_container.dart' as _i306;

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
  gh.lazySingleton<_i18.ClientsDebtsReportsDatasource>(
      () => _i18.ClientsDebtsReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i19.PreviousRatingsDatasource>(
      () => _i19.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.ClientsAcceptDatasource>(
      () => _i20.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.DelayInstallReportsDatasource>(
      () => _i21.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.ParticipatesListDatasource>(
      () => _i22.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.EmployeesSalesReportsDatasource>(
      () => _i23.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.ClientsAcceptRepository>(() =>
      _i25.ClientsAcceptRepositoryImpl(gh<_i20.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i26.ClientsDebtsDatasource>(
      () => _i26.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.FinancePendingDatasource>(
      () => _i27.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.InstallQualityDatasource>(
      () => _i28.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.TicketsDataSource>(
      () => _i29.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.SupportClientsInvoicesDatasource>(
      () => _i30.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i31.UsersDatasource>(
      () => _i31.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i14.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i15.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i32.ClientsTransferApprovalsDatasource>(
      () => _i32.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.ExceededClientsDatasource>(
      () => _i33.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i34.ManageWithdrawalsDatasource>(
      () => _i34.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i35.AppDatasource>(
      () => _i35.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i36.CommunicationListDatasource>(
      () => _i36.CommunicationListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i37.PrivilegeDatasource>(
      () => _i37.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i38.ClientsListDatasource>(
      () => _i38.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i39.CommentCompanyDatasource>(
      () => _i39.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i40.LinkDatasource>(
      () => _i40.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i41.TaskDatasource>(
      () => _i41.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i42.UsersDatasource>(
      () => _i42.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i43.LatestClientsUpdatesDatasource>(
      () => _i43.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.CitiesDatasource>(
      () => _i44.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i45.AdvancedConfigsDatasource>(
      () => _i45.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i46.TicketsRepo>(
      () => _i47.TicketsRepoImpl(gh<_i29.TicketsDataSource>()));
  gh.lazySingleton<_i48.RegionsSalesReportsRepo>(() =>
      _i49.RegionsSalesReportsRepoImpl(
          gh<_i17.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i50.SupportClientsAcceptRepository>(() =>
      _i51.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i52.DelayAfterInstallRepo>(() =>
      _i53.DelayAfterInstallRepoImpl(gh<_i10.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i54.GetSupportClientsAcceptUseCase>(() =>
      _i54.GetSupportClientsAcceptUseCase(
          gh<_i50.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i55.UsersRepository>(
      () => _i56.UsersRepositoryImpl(gh<_i42.UsersDatasource>()));
  gh.lazySingleton<_i57.UsersRepository>(
      () => _i58.UsersRepositoryImpl(gh<_i31.UsersDatasource>()));
  gh.lazySingleton<_i59.ClientsDebtsReportsRepo>(() =>
      _i60.ClientsDebtsReportsRepoImpl(
          gh<_i18.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i61.GeneralConfigsDatasource>(
      () => _i61.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i62.FinancePendingRepo>(
      () => _i63.FinancePendingRepoImpl(gh<_i27.FinancePendingDatasource>()));
  gh.lazySingleton<_i64.PendingInvoicesRepo>(
      () => _i65.PendingInvoicesRepoImpl(gh<_i11.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i66.ExceededClientsRepo>(
      () => _i67.ExceededClientsRepoImpl(gh<_i33.ExceededClientsDatasource>()));
  gh.factory<_i68.ActionUserUsecase>(
      () => _i68.ActionUserUsecase(gh<_i57.UsersRepository>()));
  gh.lazySingleton<_i69.ClientsInstallReportsRepo>(() =>
      _i70.ClientsInstallReportsRepoImpl(
          gh<_i16.ClientsInstallReportsDatasource>()));
  gh.factory<_i71.TaskRepository>(
      () => _i72.TaskRepositoryImpl(gh<_i41.TaskDatasource>()));
  gh.lazySingleton<_i73.AgentsDistributorsDataSource>(
      () => _i73.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i74.LatestClientsUpdatesRepository>(() =>
      _i75.LatestClientsUpdatesRepositoryImpl(
          gh<_i43.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i76.GetClientsInstallReportsUsecase>(() =>
      _i76.GetClientsInstallReportsUsecase(
          gh<_i69.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i77.PreviousRatingsRepo>(
      () => _i78.PreviousRatingsRepoImpl(gh<_i19.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i79.SupportTabDataSource>(
      () => _i79.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i80.GetUsersUsecase>(
      () => _i80.GetUsersUsecase(gh<_i55.UsersRepository>()));
  gh.lazySingleton<_i81.GetPendingInvoicesUsecase>(
      () => _i81.GetPendingInvoicesUsecase(gh<_i64.PendingInvoicesRepo>()));
  gh.lazySingleton<_i82.InvoicesTabDataSource>(
      () => _i82.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i83.CitiesRepository>(
      () => _i84.CitiesRepositoryImpl(gh<_i44.CitiesDatasource>()));
  gh.lazySingleton<_i85.GetCitiesUseCase>(
      () => _i85.GetCitiesUseCase(gh<_i83.CitiesRepository>()));
  gh.lazySingleton<_i86.AddTicketUseCase>(
      () => _i86.AddTicketUseCase(gh<_i46.TicketsRepo>()));
  gh.lazySingleton<_i87.EditTicketTypeUseCase>(
      () => _i87.EditTicketTypeUseCase(gh<_i46.TicketsRepo>()));
  gh.lazySingleton<_i88.GetClientTicketsUseCase>(
      () => _i88.GetClientTicketsUseCase(gh<_i46.TicketsRepo>()));
  gh.lazySingleton<_i89.GetTicketsUseCase>(
      () => _i89.GetTicketsUseCase(gh<_i46.TicketsRepo>()));
  gh.lazySingleton<_i90.GetTicketByIdUseCase>(
      () => _i90.GetTicketByIdUseCase(gh<_i46.TicketsRepo>()));
  gh.lazySingleton<_i91.TransferTicketUseCase>(
      () => _i91.TransferTicketUseCase(gh<_i46.TicketsRepo>()));
  gh.factory<_i92.TicketsCubit>(() => _i92.TicketsCubit(
        gh<_i89.GetTicketsUseCase>(),
        gh<_i90.GetTicketByIdUseCase>(),
        gh<_i88.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i93.LoginRemoteDataSource>(
      () => _i93.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i94.EmployeesSalesReportsRepo>(() =>
      _i95.EmployeesSalesReportsRepoImpl(
          gh<_i23.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i96.AdvancedConfigsRepository>(() =>
      _i97.AdvancedConfigsRepositoryImpl(gh<_i45.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i98.ParticipateListRepository>(() =>
      _i99.ParticipateListRepositoryImpl(
          gh<_i22.ParticipatesListDatasource>()));
  gh.lazySingleton<_i100.InvoicesSectionRepo>(
      () => _i101.InvoicesTabRepoImpl(gh<_i82.InvoicesTabDataSource>()));
  gh.factory<_i102.SupportClientsAcceptCubit>(() =>
      _i102.SupportClientsAcceptCubit(
          gh<_i54.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i103.WaitingAgentsDataSource>(
      () => _i103.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i104.GetFinancePendingInvoicesUsecase>(() =>
      _i104.GetFinancePendingInvoicesUsecase(gh<_i62.FinancePendingRepo>()));
  gh.lazySingleton<_i105.ProductsSalesReportsRepo>(() =>
      _i106.ProductsSalesReportsRepoImpl(
          gh<_i12.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i107.AgentsDistributorsProfileDataSource>(() =>
      _i107.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i108.EditTicketCubit>(() => _i108.EditTicketCubit(
        gh<_i87.EditTicketTypeUseCase>(),
        gh<_i91.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i109.DatesTableDataSource>(
      () => _i109.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i110.GetDelayAfterInstallUseCase>(() =>
      _i110.GetDelayAfterInstallUseCase(gh<_i52.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i111.RegionsDatasource>(
      () => _i111.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i112.LocationServices>(
      () => _i112.LocationServices(gh<_i6.Location>()));
  gh.singleton<_i113.CacheServices>(
    () => _i114.SecureStorageConsumer(gh<_i15.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i113.CacheServices>(() async =>
      _i115.PrefsConsumer(await gh.getAsync<_i14.SharedPreferences>()));
  gh.lazySingleton<_i116.InstallQualityRepo>(
      () => _i117.InstallQualityRepoImpl(gh<_i28.InstallQualityDatasource>()));
  gh.factory<_i118.PrivilegeRepository>(
      () => _i119.PrivilegeRepositoryImpl(gh<_i37.PrivilegeDatasource>()));
  gh.lazySingleton<_i120.DelayInstallReportsRepo>(() =>
      _i121.DelayInstallReportsRepoImpl(
          gh<_i21.DelayInstallReportsDatasource>()));
  gh.factory<_i122.AppRepository>(
      () => _i123.AppRepositoryImpl(gh<_i35.AppDatasource>()));
  gh.lazySingleton<_i124.AgentsDistributorsActionsRepo>(() =>
      _i125.AgentsDistributorsActionsRepoImpl(
          gh<_i13.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i126.FinancePendingCubit>(() =>
      _i126.FinancePendingCubit(gh<_i104.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i127.DelayAfterInstallCubit>(() =>
      _i127.DelayAfterInstallCubit(gh<_i110.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i128.GetRegionsSalesReportsUsecase>(() =>
      _i128.GetRegionsSalesReportsUsecase(gh<_i48.RegionsSalesReportsRepo>()));
  gh.lazySingleton<_i129.SupportTabRepo>(
      () => _i130.SupportTabRepoImpl(gh<_i79.SupportTabDataSource>()));
  gh.factory<_i131.LinksImportantRepository>(
      () => _i132.LinkRepositoryImpl(gh<_i40.LinkDatasource>()));
  gh.lazySingleton<_i133.GetInvoicesByPrivilegesUsecase>(() =>
      _i133.GetInvoicesByPrivilegesUsecase(gh<_i100.InvoicesSectionRepo>()));
  gh.lazySingleton<_i134.GetClientsAcceptUseCase>(
      () => _i134.GetClientsAcceptUseCase(gh<_i24.ClientsAcceptRepository>()));
  gh.lazySingleton<_i135.GeneralConfigsRepository>(() =>
      _i136.GeneralConfigsRepositoryImpl(gh<_i61.GeneralConfigsDatasource>()));
  gh.factory<_i137.CompanyRepository>(
      () => _i138.CompanyRepositoryImpl(gh<_i39.CommentCompanyDatasource>()));
  gh.factory<_i139.ClientsListRepository>(
      () => _i140.ClientsListRepositoryImpl(gh<_i38.ClientsListDatasource>()));
  gh.lazySingleton<_i141.GetInstallUseCase>(
      () => _i141.GetInstallUseCase(gh<_i116.InstallQualityRepo>()));
  gh.lazySingleton<_i142.AgentsDistributorsProfileRepo>(() =>
      _i143.AgentsDistributorsProfileRepoImpl(
          gh<_i107.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i144.AddDateInstallUsecase>(
      () => _i144.AddDateInstallUsecase(gh<_i129.SupportTabRepo>()));
  gh.lazySingleton<_i145.CancelDateInstallUsecase>(
      () => _i145.CancelDateInstallUsecase(gh<_i129.SupportTabRepo>()));
  gh.lazySingleton<_i146.GetInvoiceByClientUsecase>(
      () => _i146.GetInvoiceByClientUsecase(gh<_i129.SupportTabRepo>()));
  gh.lazySingleton<_i147.ReceiveDeviceUsecase>(
      () => _i147.ReceiveDeviceUsecase(gh<_i129.SupportTabRepo>()));
  gh.lazySingleton<_i148.ReturnInvoiceApproveUsecase>(
      () => _i148.ReturnInvoiceApproveUsecase(gh<_i129.SupportTabRepo>()));
  gh.lazySingleton<_i149.SetDateDoneUsecase>(
      () => _i149.SetDateDoneUsecase(gh<_i129.SupportTabRepo>()));
  gh.lazySingleton<_i150.SetReadyInstallUsecase>(
      () => _i150.SetReadyInstallUsecase(gh<_i129.SupportTabRepo>()));
  gh.lazySingleton<_i151.GetAllUsersUseCase>(
      () => _i151.GetAllUsersUseCase(gh<_i100.InvoicesSectionRepo>()));
  gh.lazySingleton<_i152.GetClientsDebtsReportsUsecase>(() =>
      _i152.GetClientsDebtsReportsUsecase(gh<_i59.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i153.ClientsDebtsRepo>(
      () => _i154.ClientsDebtsRepoImpl(gh<_i26.ClientsDebtsDatasource>()));
  gh.factory<_i155.CommunicationListRepository>(() =>
      _i156.CommunicationListRepositoryImpl(
          gh<_i36.CommunicationListDatasource>()));
  gh.lazySingleton<_i157.SupportClientsInvoicesRepo>(() =>
      _i158.SupportClientsInvoicesRepoImpl(
          gh<_i30.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i159.GetBranchesForUserUsecase>(
      () => _i159.GetBranchesForUserUsecase(gh<_i57.UsersRepository>()));
  gh.lazySingleton<_i160.GetLevelsForUserUsecase>(
      () => _i160.GetLevelsForUserUsecase(gh<_i57.UsersRepository>()));
  gh.lazySingleton<_i161.GetManagesForUserUsecase>(
      () => _i161.GetManagesForUserUsecase(gh<_i57.UsersRepository>()));
  gh.factory<_i162.GetUsersUsecase>(
      () => _i162.GetUsersUsecase(gh<_i57.UsersRepository>()));
  gh.factory<_i163.ActionLinkUsecase>(
      () => _i163.ActionLinkUsecase(gh<_i131.LinksImportantRepository>()));
  gh.factory<_i164.GetLinkUsecase>(
      () => _i164.GetLinkUsecase(gh<_i131.LinksImportantRepository>()));
  gh.lazySingleton<_i165.GetSupportClientsInvoicesUseCase>(() =>
      _i165.GetSupportClientsInvoicesUseCase(
          gh<_i157.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i166.ManageWithdrawalsRepository>(() =>
      _i167.ManageWithdrawalsRepositoryImpl(
          gh<_i34.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i168.AgentsDistributorsRepo>(() =>
      _i169.AgentsDistributorsRepoImpl(
          gh<_i73.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i170.GetProductsSalesReportsUsecase>(() =>
      _i170.GetProductsSalesReportsUsecase(
          gh<_i105.ProductsSalesReportsRepo>()));
  gh.singleton<_i171.CitiesCubit>(
      () => _i171.CitiesCubit(gh<_i85.GetCitiesUseCase>()));
  gh.lazySingleton<_i172.RegionsRepository>(
      () => _i173.RegionsRepositoryImpl(gh<_i111.RegionsDatasource>()));
  gh.factory<_i174.UsersTypeCubit>(
      () => _i174.UsersTypeCubit(gh<_i80.GetUsersUsecase>()));
  gh.factory<_i175.AddParticipateCommentUsecase>(() =>
      _i175.AddParticipateCommentUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i176.AddParticipateUserUsecase>(() =>
      _i176.AddParticipateUserUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i177.EditParticipateUserUsecase>(() =>
      _i177.EditParticipateUserUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i178.GetInvoiceByIdUsecase>(
      () => _i178.GetInvoiceByIdUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i179.ParticipateClientListUsecase>(() =>
      _i179.ParticipateClientListUsecase(gh<_i98.ParticipateListRepository>()));
  gh.factory<_i180.ParticipateCommentListUsecase>(() =>
      _i180.ParticipateCommentListUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i181.ParticipateInvoiceListUsecase>(() =>
      _i181.ParticipateInvoiceListUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i182.ParticipateListUsecase>(
      () => _i182.ParticipateListUsecase(gh<_i98.ParticipateListRepository>()));
  gh.lazySingleton<_i183.ChangeParticipateStatusUsecase>(() =>
      _i183.ChangeParticipateStatusUsecase(
          gh<_i98.ParticipateListRepository>()));
  gh.factory<_i184.PendingInvoicesCubit>(
      () => _i184.PendingInvoicesCubit(gh<_i81.GetPendingInvoicesUsecase>()));
  gh.factory<_i185.GetCommunicationListUsecase>(() =>
      _i185.GetCommunicationListUsecase(
          gh<_i155.CommunicationListRepository>()));
  gh.lazySingleton<_i186.GetEmployeesSalesReportsUsecase>(() =>
      _i186.GetEmployeesSalesReportsUsecase(
          gh<_i94.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i187.ClientsTransferApprovalsRepo>(() =>
      _i188.ClientsTransferApprovalsRepoImpl(
          gh<_i32.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i189.CrudClientSupportFilesUsecase>(() =>
      _i189.CrudClientSupportFilesUsecase(
          repository: gh<_i139.ClientsListRepository>()));
  gh.lazySingleton<_i190.GetClientSupportFilesUsecase>(() =>
      _i190.GetClientSupportFilesUsecase(
          repository: gh<_i139.ClientsListRepository>()));
  gh.factory<_i191.LinkCubit>(() => _i191.LinkCubit(
        gh<_i164.GetLinkUsecase>(),
        gh<_i163.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i192.GetPreviousRatingsUsecase>(
      () => _i192.GetPreviousRatingsUsecase(gh<_i77.PreviousRatingsRepo>()));
  gh.lazySingleton<_i193.WaitingAgentsRepo>(
      () => _i194.WaitingAgentsRepoImpl(gh<_i103.WaitingAgentsDataSource>()));
  gh.factory<_i195.EmployeesSalesReportsCubit>(() =>
      _i195.EmployeesSalesReportsCubit(
          gh<_i186.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i196.ChangeStateAgentUseCase>(
      () => _i196.ChangeStateAgentUseCase(gh<_i168.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i197.GetAgentsAndDistributorsUseCase>(() =>
      _i197.GetAgentsAndDistributorsUseCase(
          gh<_i168.AgentsDistributorsRepo>()));
  gh.factory<_i198.ClientsAcceptCubit>(
      () => _i198.ClientsAcceptCubit(gh<_i134.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i199.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i199.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i166.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i200.GetWithdrawalsInvoicesUsecase>(() =>
      _i200.GetWithdrawalsInvoicesUsecase(
          gh<_i166.ManageWithdrawalsRepository>()));
  gh.factory<_i201.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i201.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i166.ManageWithdrawalsRepository>()));
  gh.factory<_i202.AddTaskUsecase>(
      () => _i202.AddTaskUsecase(gh<_i71.TaskRepository>()));
  gh.factory<_i203.ChangeStatusTaskUsecase>(
      () => _i203.ChangeStatusTaskUsecase(gh<_i71.TaskRepository>()));
  gh.factory<_i204.FilterTaskUsecase>(
      () => _i204.FilterTaskUsecase(gh<_i71.TaskRepository>()));
  gh.factory<_i205.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i205.GetUsersByDepartmentAndRegionUsecase(gh<_i71.TaskRepository>()));
  gh.lazySingleton<_i206.ExceededClientsUseCase>(
      () => _i206.ExceededClientsUseCase(gh<_i66.ExceededClientsRepo>()));
  gh.lazySingleton<_i207.TransferExceededClientsUseCase>(() =>
      _i207.TransferExceededClientsUseCase(gh<_i66.ExceededClientsRepo>()));
  gh.lazySingleton<_i208.LoginLocalDataSource>(() =>
      _i208.LoginLocalDataSourceImpl(
          gh<_i113.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i209.EditAdvancedConfigsUsecase>(() =>
      _i209.EditAdvancedConfigsUsecase(gh<_i96.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i210.GetAdvancedConfigsUsecase>(() =>
      _i210.GetAdvancedConfigsUsecase(gh<_i96.AdvancedConfigsRepository>()));
  gh.factory<_i211.ClientsInstallReportsCubit>(() =>
      _i211.ClientsInstallReportsCubit(
          gh<_i76.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i212.DatesTableRepo>(
      () => _i213.DatesTableRepoImpl(gh<_i109.DatesTableDataSource>()));
  gh.factory<_i214.AddClientUserUsecase>(
      () => _i214.AddClientUserUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i215.ApproveRejectClientUsecase>(() =>
      _i215.ApproveRejectClientUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i216.ChangeTypeClientUsecase>(
      () => _i216.ChangeTypeClientUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i217.EditClientUserUsecase>(
      () => _i217.EditClientUserUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i218.GetClientsListByRegionUseCase>(() =>
      _i218.GetClientsListByRegionUseCase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i219.GetClientsListByUserUseCase>(() =>
      _i219.GetClientsListByUserUseCase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i220.GetClientsWithFilterUserUsecase>(() =>
      _i220.GetClientsWithFilterUserUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i221.GetClientMarketingReportUsecase>(() =>
      _i221.GetClientMarketingReportUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i222.GetRecommendedClientsUsecase>(() =>
      _i222.GetRecommendedClientsUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i223.GetSimilarClientsUsecase>(
      () => _i223.GetSimilarClientsUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i224.ReceiveClientUserUsecase>(
      () => _i224.ReceiveClientUserUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i225.TransferClientUserUsecase>(
      () => _i225.TransferClientUserUsecase(gh<_i139.ClientsListRepository>()));
  gh.factory<_i226.GetVersionUseCase>(
      () => _i226.GetVersionUseCase(gh<_i122.AppRepository>()));
  gh.factory<_i227.AddTicketCubit>(
      () => _i227.AddTicketCubit(gh<_i86.AddTicketUseCase>()));
  gh.lazySingleton<_i228.EditGeneralConfigsUsecase>(() =>
      _i228.EditGeneralConfigsUsecase(gh<_i135.GeneralConfigsRepository>()));
  gh.lazySingleton<_i229.GetGeneralConfigsUsecase>(() =>
      _i229.GetGeneralConfigsUsecase(gh<_i135.GeneralConfigsRepository>()));
  gh.factory<_i230.InstallQualityCubit>(
      () => _i230.InstallQualityCubit(gh<_i141.GetInstallUseCase>()));
  gh.lazySingleton<_i231.AddAgentUseCase>(
      () => _i231.AddAgentUseCase(gh<_i124.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i232.UpdateAgentUseCase>(() =>
      _i232.UpdateAgentUseCase(gh<_i124.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i233.GetDelayInstallReportsUseCase>(() =>
      _i233.GetDelayInstallReportsUseCase(gh<_i120.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i234.CrudAgentSupportFilesUsecase>(() =>
      _i234.CrudAgentSupportFilesUsecase(
          gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i235.GetClientsTransferApprovalsUsecase>(() =>
      _i235.GetClientsTransferApprovalsUsecase(
          gh<_i187.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i236.GetLatestClientsUseCase>(() =>
      _i236.GetLatestClientsUseCase(gh<_i74.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i237.TaskCubit>(() => _i237.TaskCubit(
        gh<_i202.AddTaskUsecase>(),
        gh<_i204.FilterTaskUsecase>(),
        gh<_i203.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i238.SupportTabCubit>(() => _i238.SupportTabCubit(
        gh<_i146.GetInvoiceByClientUsecase>(),
        gh<_i144.AddDateInstallUsecase>(),
        gh<_i149.SetDateDoneUsecase>(),
        gh<_i150.SetReadyInstallUsecase>(),
        gh<_i148.ReturnInvoiceApproveUsecase>(),
        gh<_i147.ReceiveDeviceUsecase>(),
        gh<_i145.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i239.ClientsDebtsReportsCubit>(() =>
      _i239.ClientsDebtsReportsCubit(
          gh<_i152.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i240.AddAgentDateUseCase>(() =>
      _i240.AddAgentDateUseCase(gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.factory<_i241.ClientsListBloc>(() => _i241.ClientsListBloc(
        gh<_i220.GetClientsWithFilterUserUsecase>(),
        gh<_i222.GetRecommendedClientsUsecase>(),
        gh<_i214.AddClientUserUsecase>(),
        gh<_i217.EditClientUserUsecase>(),
        gh<_i216.ChangeTypeClientUsecase>(),
        gh<_i223.GetSimilarClientsUsecase>(),
        gh<_i215.ApproveRejectClientUsecase>(),
        gh<_i189.CrudClientSupportFilesUsecase>(),
        gh<_i190.GetClientSupportFilesUsecase>(),
        gh<_i225.TransferClientUserUsecase>(),
        gh<_i224.ReceiveClientUserUsecase>(),
        gh<_i221.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i242.RegionsSalesReportsCubit>(() =>
      _i242.RegionsSalesReportsCubit(
          gh<_i128.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i243.AgentsDistributorsActionsCubit>(
      () => _i243.AgentsDistributorsActionsCubit(
            gh<_i85.GetCitiesUseCase>(),
            gh<_i231.AddAgentUseCase>(),
            gh<_i232.UpdateAgentUseCase>(),
          ));
  gh.factory<_i244.InvoicesSectionCubit>(() => _i244.InvoicesSectionCubit(
        gh<_i133.GetInvoicesByPrivilegesUsecase>(),
        gh<_i197.GetAgentsAndDistributorsUseCase>(),
        gh<_i182.ParticipateListUsecase>(),
        gh<_i151.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i245.LoginRepo>(() => _i246.LoginRepoImpl(
        gh<_i93.LoginRemoteDataSource>(),
        gh<_i208.LoginLocalDataSource>(),
      ));
  gh.factory<_i247.AddLevelUsecase>(
      () => _i247.AddLevelUsecase(gh<_i118.PrivilegeRepository>()));
  gh.factory<_i248.GetLevelsUsecase>(
      () => _i248.GetLevelsUsecase(gh<_i118.PrivilegeRepository>()));
  gh.factory<_i249.GetPrivilegesUsecase>(
      () => _i249.GetPrivilegesUsecase(gh<_i118.PrivilegeRepository>()));
  gh.factory<_i250.UpdatePrivilegeUsecase>(
      () => _i250.UpdatePrivilegeUsecase(gh<_i118.PrivilegeRepository>()));
  gh.factory<_i251.AttachmentsRowCubit>(() => _i251.AttachmentsRowCubit(
        gh<_i190.GetClientSupportFilesUsecase>(),
        gh<_i189.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i252.AddCommentUsecase>(
      () => _i252.AddCommentUsecase(gh<_i137.CompanyRepository>()));
  gh.factory<_i253.GetCommentUsecase>(
      () => _i253.GetCommentUsecase(gh<_i137.CompanyRepository>()));
  gh.factory<_i254.DelayInstallReportsCubit>(() =>
      _i254.DelayInstallReportsCubit(
          gh<_i233.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i255.GetRegionsByIdCountryUseCase>(
      () => _i255.GetRegionsByIdCountryUseCase(gh<_i172.RegionsRepository>()));
  gh.lazySingleton<_i256.PrivilegeCubit>(() => _i256.PrivilegeCubit(
        gh<_i248.GetLevelsUsecase>(),
        gh<_i249.GetPrivilegesUsecase>(),
        gh<_i250.UpdatePrivilegeUsecase>(),
        gh<_i247.AddLevelUsecase>(),
      ));
  gh.factory<_i257.AdvancedCofigsCubit>(() => _i257.AdvancedCofigsCubit(
        gh<_i210.GetAdvancedConfigsUsecase>(),
        gh<_i209.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i258.SupportClientsInvoicesCubit>(() =>
      _i258.SupportClientsInvoicesCubit(
          gh<_i165.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i259.ParticipateListBloc>(() => _i259.ParticipateListBloc(
        gh<_i182.ParticipateListUsecase>(),
        gh<_i176.AddParticipateUserUsecase>(),
        gh<_i177.EditParticipateUserUsecase>(),
        gh<_i179.ParticipateClientListUsecase>(),
        gh<_i181.ParticipateInvoiceListUsecase>(),
        gh<_i178.GetInvoiceByIdUsecase>(),
        gh<_i180.ParticipateCommentListUsecase>(),
        gh<_i175.AddParticipateCommentUsecase>(),
        gh<_i183.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i260.CacheTokenUsecase>(
      () => _i260.CacheTokenUsecase(gh<_i245.LoginRepo>()));
  gh.lazySingleton<_i261.GetTokenUsecase>(
      () => _i261.GetTokenUsecase(gh<_i245.LoginRepo>()));
  gh.lazySingleton<_i262.LoginUsecase>(
      () => _i262.LoginUsecase(gh<_i245.LoginRepo>()));
  gh.lazySingleton<_i263.ValidateTokenUsecase>(
      () => _i263.ValidateTokenUsecase(gh<_i245.LoginRepo>()));
  gh.lazySingleton<_i264.VerifyOtpUsecase>(
      () => _i264.VerifyOtpUsecase(gh<_i245.LoginRepo>()));
  gh.factory<_i265.ClientsTransferApprovalsCubit>(() =>
      _i265.ClientsTransferApprovalsCubit(
          gh<_i235.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i266.GeneralCofigsCubit>(() => _i266.GeneralCofigsCubit(
        gh<_i229.GetGeneralConfigsUsecase>(),
        gh<_i228.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i267.GetClientsDebtsUsecase>(
      () => _i267.GetClientsDebtsUsecase(gh<_i153.ClientsDebtsRepo>()));
  gh.lazySingleton<_i268.AddAgentCommentUsecase>(() =>
      _i268.AddAgentCommentUsecase(gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i269.DoneTrainingUsecase>(() =>
      _i269.DoneTrainingUsecase(gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i270.GetAgentUsecase>(
      () => _i270.GetAgentUsecase(gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i271.GetAgentClientListUsecase>(() =>
      _i271.GetAgentClientListUsecase(
          gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i272.GetAgentCommentsListUsecase>(() =>
      _i272.GetAgentCommentsListUsecase(
          gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i273.GetAgentDatesListUsecase>(() =>
      _i273.GetAgentDatesListUsecase(
          gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i274.GetAgentInvoiceListUsecase>(() =>
      _i274.GetAgentInvoiceListUsecase(
          gh<_i142.AgentsDistributorsProfileRepo>()));
  gh.factory<_i275.AddRejectReasonsUsecase>(() =>
      _i275.AddRejectReasonsUsecase(gh<_i166.ManageWithdrawalsRepository>()));
  gh.factory<_i276.EditRejectReasonsUsecase>(() =>
      _i276.EditRejectReasonsUsecase(gh<_i166.ManageWithdrawalsRepository>()));
  gh.factory<_i277.GetRejectReasonsUsecase>(() =>
      _i277.GetRejectReasonsUsecase(gh<_i166.ManageWithdrawalsRepository>()));
  gh.factory<_i278.GetUserSeriesUsecase>(() =>
      _i278.GetUserSeriesUsecase(gh<_i166.ManageWithdrawalsRepository>()));
  gh.factory<_i279.GetWithdrawnDetailsUsecase>(() =>
      _i279.GetWithdrawnDetailsUsecase(
          gh<_i166.ManageWithdrawalsRepository>()));
  gh.factory<_i280.SetApproveSeriesUsecase>(() =>
      _i280.SetApproveSeriesUsecase(gh<_i166.ManageWithdrawalsRepository>()));
  gh.factory<_i281.UpdateSeriesUsecase>(
      () => _i281.UpdateSeriesUsecase(gh<_i166.ManageWithdrawalsRepository>()));
  gh.singleton<_i282.AppManagerCubit>(
      () => _i282.AppManagerCubit(gh<_i226.GetVersionUseCase>()));
  gh.factory<_i283.RegionsCubit>(
      () => _i283.RegionsCubit(gh<_i255.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i284.GetWaitingAgentsUsecase>(
      () => _i284.GetWaitingAgentsUsecase(gh<_i193.WaitingAgentsRepo>()));
  gh.factory<_i285.ProductsSalesReportsCubit>(() =>
      _i285.ProductsSalesReportsCubit(
          gh<_i170.GetProductsSalesReportsUsecase>()));
  gh.factory<_i286.UsersCubit>(() => _i286.UsersCubit(
        gh<_i162.GetUsersUsecase>(),
        gh<_i68.ActionUserUsecase>(),
        gh<_i205.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i161.GetManagesForUserUsecase>(),
        gh<_i160.GetLevelsForUserUsecase>(),
        gh<_i159.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i287.PreviousRatingsCubit>(
      () => _i287.PreviousRatingsCubit(gh<_i192.GetPreviousRatingsUsecase>()));
  gh.factory<_i288.CommunicationListBloc>(() =>
      _i288.CommunicationListBloc(gh<_i185.GetCommunicationListUsecase>()));
  gh.factory<_i289.AgentsDistributorsCubit>(() => _i289.AgentsDistributorsCubit(
        gh<_i197.GetAgentsAndDistributorsUseCase>(),
        gh<_i196.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i290.ExceededClientsCubit>(() => _i290.ExceededClientsCubit(
        gh<_i206.ExceededClientsUseCase>(),
        gh<_i207.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i291.LatestClientsUpdatesCubit>(() =>
      _i291.LatestClientsUpdatesCubit(gh<_i236.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i292.CancelScheduleUsecase>(
      () => _i292.CancelScheduleUsecase(gh<_i212.DatesTableRepo>()));
  gh.lazySingleton<_i293.ChangeDateToDonUsecase>(
      () => _i293.ChangeDateToDonUsecase(gh<_i212.DatesTableRepo>()));
  gh.lazySingleton<_i294.GetDateInstallationUsecase>(
      () => _i294.GetDateInstallationUsecase(gh<_i212.DatesTableRepo>()));
  gh.lazySingleton<_i295.GetInvoicesByClientForDateUsecase>(() =>
      _i295.GetInvoicesByClientForDateUsecase(gh<_i212.DatesTableRepo>()));
  gh.lazySingleton<_i296.GetSubscribedClientsUsecase>(
      () => _i296.GetSubscribedClientsUsecase(gh<_i212.DatesTableRepo>()));
  gh.lazySingleton<_i297.RescheduleDateUsecase>(
      () => _i297.RescheduleDateUsecase(gh<_i212.DatesTableRepo>()));
  gh.lazySingleton<_i298.ReturnScheduleVisitToOpenUsecase>(
      () => _i298.ReturnScheduleVisitToOpenUsecase(gh<_i212.DatesTableRepo>()));
  gh.factory<_i299.AgentsDistributorsProfileBloc>(
      () => _i299.AgentsDistributorsProfileBloc(
            gh<_i271.GetAgentClientListUsecase>(),
            gh<_i274.GetAgentInvoiceListUsecase>(),
            gh<_i178.GetInvoiceByIdUsecase>(),
            gh<_i272.GetAgentCommentsListUsecase>(),
            gh<_i268.AddAgentCommentUsecase>(),
            gh<_i269.DoneTrainingUsecase>(),
            gh<_i240.AddAgentDateUseCase>(),
            gh<_i273.GetAgentDatesListUsecase>(),
            gh<_i234.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i300.DatesTableCubit>(() => _i300.DatesTableCubit(
        gh<_i294.GetDateInstallationUsecase>(),
        gh<_i297.RescheduleDateUsecase>(),
        gh<_i293.ChangeDateToDonUsecase>(),
        gh<_i292.CancelScheduleUsecase>(),
        gh<_i298.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i296.GetSubscribedClientsUsecase>(),
        gh<_i295.GetInvoicesByClientForDateUsecase>(),
        gh<_i144.AddDateInstallUsecase>(),
      ));
  gh.factory<_i301.CompanyCubit>(() => _i301.CompanyCubit(
        gh<_i253.GetCommentUsecase>(),
        gh<_i252.AddCommentUsecase>(),
      ));
  gh.factory<_i302.ClientsDebtsCubit>(
      () => _i302.ClientsDebtsCubit(gh<_i267.GetClientsDebtsUsecase>()));
  gh.factory<_i303.LoginCubit>(() => _i303.LoginCubit(
        gh<_i262.LoginUsecase>(),
        gh<_i264.VerifyOtpUsecase>(),
        gh<_i260.CacheTokenUsecase>(),
        gh<_i261.GetTokenUsecase>(),
        gh<_i263.ValidateTokenUsecase>(),
      ));
  gh.factory<_i304.ManageWithdrawalsCubit>(() => _i304.ManageWithdrawalsCubit(
        gh<_i278.GetUserSeriesUsecase>(),
        gh<_i281.UpdateSeriesUsecase>(),
        gh<_i162.GetUsersUsecase>(),
        gh<_i200.GetWithdrawalsInvoicesUsecase>(),
        gh<_i201.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i280.SetApproveSeriesUsecase>(),
        gh<_i279.GetWithdrawnDetailsUsecase>(),
        gh<_i275.AddRejectReasonsUsecase>(),
        gh<_i277.GetRejectReasonsUsecase>(),
        gh<_i276.EditRejectReasonsUsecase>(),
        gh<_i199.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i305.WaitingAgentsCubit>(
      () => _i305.WaitingAgentsCubit(gh<_i284.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i306.AppModule {}
