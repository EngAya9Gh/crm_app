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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i32;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i109;
import '../../../features/app/domain/repositories/app_repository.dart' as _i108;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i207;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i255;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i59;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i84;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i97;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i96;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i119;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i120;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i121;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i122;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i123;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i223;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i19;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i23;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i22;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i124;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i181;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i27;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i44;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i43;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i77;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i78;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i79;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i81;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i80;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i82;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i208;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i95;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i83;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i33;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i146;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i145;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i170;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i259;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i26;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i103;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i102;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i131;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i211;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i18;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i69;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i68;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i176;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i236;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i41;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i75;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i74;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i76;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i144;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i70;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i115;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i114;
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
    as _i219;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i100;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i158;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i157;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i233;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i256;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i39;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i51;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i50;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i71;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i159;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i42;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i86;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i85;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i191;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i192;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i235;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i54;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i126;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i125;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i209;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i210;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i239;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i34;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i105;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i104;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i225;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i226;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i227;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i228;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i234;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i28;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i53;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i52;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i62;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i147;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i148;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i149;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i150;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i258;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i31;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i154;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i153;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i248;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i249;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i182;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i250;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i251;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i184;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i183;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i252;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i253;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i254;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i274;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i24;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i143;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i142;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i240;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i273;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i29;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i172;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i171;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i216;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i238;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i25;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i56;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i55;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i93;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i112;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i16;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i58;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i57;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i72;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i169;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i35;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i130;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i129;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i195;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i196;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i197;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i173;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i198;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i202;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i174;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i199;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i200;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i201;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i203;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i204;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i205;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i206;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i221;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i36;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i128;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i127;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i230;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i231;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i272;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i30;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i61;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i60;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i189;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i190;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i261;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i73;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i90;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i89;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i141;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i118;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i224;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i40;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i67;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i66;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i217;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i262;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i17;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i65;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i94;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i111;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i133;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i156;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i110;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i132;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i155;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i241;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i220;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i212;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i215;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i242;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i243;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i244;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i245;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i246;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i247;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i180;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i213;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i222;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i270;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i260;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i37;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i117;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i116;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i151;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i152;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i175;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i21;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i88;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i87;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i160;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i161;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i168;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i162;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i163;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i164;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i165;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i166;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i167;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i237;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i98;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i194;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i193;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i263;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i264;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i265;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i266;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i267;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i268;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i269;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i271;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i48;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i47;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i99;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i113;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i20;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i107;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i106;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i214;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i232;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i46;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i45;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i49;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i91;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i92;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i178;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i177;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i257;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i275;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i38;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i64;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i63;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i185;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i186;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i187;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i188;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i218;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i229;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i101;
import 'di_container.dart' as _i276;

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
  gh.lazySingleton<_i22.ClientsAcceptRepository>(() =>
      _i23.ClientsAcceptRepositoryImpl(gh<_i19.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i24.ClientsDebtsDatasource>(
      () => _i24.ClientsDebtsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i25.FinancePendingDatasource>(
      () => _i25.FinancePendingDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i26.InstallQualityDatasource>(
      () => _i26.InstallQualityDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i27.TicketsDataSource>(
      () => _i27.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i28.UsersDatasource>(
      () => _i28.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i29.ClientsTransferApprovalsDatasource>(
      () => _i29.ClientsTransferApprovalsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.ExceededClientsDatasource>(
      () => _i30.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i31.ManageWithdrawalsDatasource>(
      () => _i31.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i32.AppDatasource>(
      () => _i32.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i33.CommunicationListDatasource>(
      () => _i33.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i34.PrivilegeDatasource>(
      () => _i34.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i35.ClientsListDatasource>(
      () => _i35.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i36.CommentCompanyDatasource>(
      () => _i36.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i37.LinkDatasource>(
      () => _i37.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i38.TaskDatasource>(
      () => _i38.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i39.UsersDatasource>(
      () => _i39.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i40.LatestClientsUpdatesDatasource>(
      () => _i40.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i41.CitiesDatasource>(
      () => _i41.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i42.AdvancedConfigsDatasource>(
      () => _i42.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i43.TicketsRepo>(
      () => _i44.TicketsRepoImpl(gh<_i27.TicketsDataSource>()));
  gh.lazySingleton<_i45.SupportClientsAcceptRepository>(() =>
      _i46.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i47.DelayAfterInstallRepo>(() =>
      _i48.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i49.GetSupportClientsAcceptUseCase>(() =>
      _i49.GetSupportClientsAcceptUseCase(
          gh<_i45.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i50.UsersRepository>(
      () => _i51.UsersRepositoryImpl(gh<_i39.UsersDatasource>()));
  gh.lazySingleton<_i52.UsersRepository>(
      () => _i53.UsersRepositoryImpl(gh<_i28.UsersDatasource>()));
  gh.lazySingleton<_i54.GeneralConfigsDatasource>(
      () => _i54.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i55.FinancePendingRepo>(
      () => _i56.FinancePendingRepoImpl(gh<_i25.FinancePendingDatasource>()));
  gh.lazySingleton<_i57.PendingInvoicesRepo>(
      () => _i58.PendingInvoicesRepoImpl(gh<_i16.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i59.LoginLocalDataSource>(() =>
      _i59.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i60.ExceededClientsRepo>(
      () => _i61.ExceededClientsRepoImpl(gh<_i30.ExceededClientsDatasource>()));
  gh.factory<_i62.ActionUserUsecase>(
      () => _i62.ActionUserUsecase(gh<_i52.UsersRepository>()));
  gh.factory<_i63.TaskRepository>(
      () => _i64.TaskRepositoryImpl(gh<_i38.TaskDatasource>()));
  gh.lazySingleton<_i65.AgentsDistributorsDataSource>(
      () => _i65.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i66.LatestClientsUpdatesRepository>(() =>
      _i67.LatestClientsUpdatesRepositoryImpl(
          gh<_i40.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i68.PreviousRatingsRepo>(
      () => _i69.PreviousRatingsRepoImpl(gh<_i18.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i70.SupportTabDataSource>(
      () => _i70.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i71.GetUsersUsecase>(
      () => _i71.GetUsersUsecase(gh<_i50.UsersRepository>()));
  gh.lazySingleton<_i72.GetPendingInvoicesUsecase>(
      () => _i72.GetPendingInvoicesUsecase(gh<_i57.PendingInvoicesRepo>()));
  gh.lazySingleton<_i73.InvoicesTabDataSource>(
      () => _i73.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i74.CitiesRepository>(
      () => _i75.CitiesRepositoryImpl(gh<_i41.CitiesDatasource>()));
  gh.lazySingleton<_i76.GetCitiesUseCase>(
      () => _i76.GetCitiesUseCase(gh<_i74.CitiesRepository>()));
  gh.lazySingleton<_i77.AddTicketUseCase>(
      () => _i77.AddTicketUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i78.EditTicketTypeUseCase>(
      () => _i78.EditTicketTypeUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i79.GetClientTicketsUseCase>(
      () => _i79.GetClientTicketsUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i80.GetTicketsUseCase>(
      () => _i80.GetTicketsUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i81.GetTicketByIdUseCase>(
      () => _i81.GetTicketByIdUseCase(gh<_i43.TicketsRepo>()));
  gh.lazySingleton<_i82.TransferTicketUseCase>(
      () => _i82.TransferTicketUseCase(gh<_i43.TicketsRepo>()));
  gh.factory<_i83.TicketsCubit>(() => _i83.TicketsCubit(
        gh<_i80.GetTicketsUseCase>(),
        gh<_i81.GetTicketByIdUseCase>(),
        gh<_i79.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i84.LoginRemoteDataSource>(
      () => _i84.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i85.AdvancedConfigsRepository>(() =>
      _i86.AdvancedConfigsRepositoryImpl(gh<_i42.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i87.ParticipateListRepository>(() =>
      _i88.ParticipateListRepositoryImpl(
          gh<_i21.ParticipatesListDatasource>()));
  gh.lazySingleton<_i89.InvoicesSectionRepo>(
      () => _i90.InvoicesTabRepoImpl(gh<_i73.InvoicesTabDataSource>()));
  gh.factory<_i91.SupportClientsAcceptCubit>(() =>
      _i91.SupportClientsAcceptCubit(
          gh<_i49.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i92.WaitingAgentsDataSource>(
      () => _i92.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i93.GetFinancePendingInvoicesUsecase>(() =>
      _i93.GetFinancePendingInvoicesUsecase(gh<_i55.FinancePendingRepo>()));
  gh.lazySingleton<_i94.AgentsDistributorsProfileDataSource>(() =>
      _i94.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i95.EditTicketCubit>(() => _i95.EditTicketCubit(
        gh<_i78.EditTicketTypeUseCase>(),
        gh<_i82.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i96.LoginRepo>(() => _i97.LoginRepoImpl(
        gh<_i84.LoginRemoteDataSource>(),
        gh<_i59.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i98.DatesTableDataSource>(
      () => _i98.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i99.GetDelayAfterInstallUseCase>(
      () => _i99.GetDelayAfterInstallUseCase(gh<_i47.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i100.RegionsDatasource>(
      () => _i100.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i101.LocationServices>(
      () => _i101.LocationServices(gh<_i8.Location>()));
  gh.lazySingleton<_i102.InstallQualityRepo>(
      () => _i103.InstallQualityRepoImpl(gh<_i26.InstallQualityDatasource>()));
  gh.factory<_i104.PrivilegeRepository>(
      () => _i105.PrivilegeRepositoryImpl(gh<_i34.PrivilegeDatasource>()));
  gh.lazySingleton<_i106.DelayInstallReportsRepo>(() =>
      _i107.DelayInstallReportsRepoImpl(
          gh<_i20.DelayInstallReportsDatasource>()));
  gh.factory<_i108.AppRepository>(
      () => _i109.AppRepositoryImpl(gh<_i32.AppDatasource>()));
  gh.lazySingleton<_i110.AgentsDistributorsActionsRepo>(() =>
      _i111.AgentsDistributorsActionsRepoImpl(
          gh<_i17.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i112.FinancePendingCubit>(() =>
      _i112.FinancePendingCubit(gh<_i93.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i113.DelayAfterInstallCubit>(() =>
      _i113.DelayAfterInstallCubit(gh<_i99.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i114.SupportTabRepo>(
      () => _i115.SupportTabRepoImpl(gh<_i70.SupportTabDataSource>()));
  gh.factory<_i116.LinksImportantRepository>(
      () => _i117.LinkRepositoryImpl(gh<_i37.LinkDatasource>()));
  gh.lazySingleton<_i118.GetInvoicesByPrivilegesUsecase>(() =>
      _i118.GetInvoicesByPrivilegesUsecase(gh<_i89.InvoicesSectionRepo>()));
  gh.lazySingleton<_i119.CacheTokenUsecase>(
      () => _i119.CacheTokenUsecase(gh<_i96.LoginRepo>()));
  gh.lazySingleton<_i120.GetTokenUsecase>(
      () => _i120.GetTokenUsecase(gh<_i96.LoginRepo>()));
  gh.lazySingleton<_i121.LoginUsecase>(
      () => _i121.LoginUsecase(gh<_i96.LoginRepo>()));
  gh.lazySingleton<_i122.ValidateTokenUsecase>(
      () => _i122.ValidateTokenUsecase(gh<_i96.LoginRepo>()));
  gh.lazySingleton<_i123.VerifyOtpUsecase>(
      () => _i123.VerifyOtpUsecase(gh<_i96.LoginRepo>()));
  gh.lazySingleton<_i124.GetClientsAcceptUseCase>(
      () => _i124.GetClientsAcceptUseCase(gh<_i22.ClientsAcceptRepository>()));
  gh.lazySingleton<_i125.GeneralConfigsRepository>(() =>
      _i126.GeneralConfigsRepositoryImpl(gh<_i54.GeneralConfigsDatasource>()));
  gh.factory<_i127.CompanyRepository>(
      () => _i128.CompanyRepositoryImpl(gh<_i36.CommentCompanyDatasource>()));
  gh.factory<_i129.ClientsListRepository>(
      () => _i130.ClientsListRepositoryImpl(gh<_i35.ClientsListDatasource>()));
  gh.lazySingleton<_i131.GetInstallUseCase>(
      () => _i131.GetInstallUseCase(gh<_i102.InstallQualityRepo>()));
  gh.lazySingleton<_i132.AgentsDistributorsProfileRepo>(() =>
      _i133.AgentsDistributorsProfileRepoImpl(
          gh<_i94.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i134.AddDateInstallUsecase>(
      () => _i134.AddDateInstallUsecase(gh<_i114.SupportTabRepo>()));
  gh.lazySingleton<_i135.CancelDateInstallUsecase>(
      () => _i135.CancelDateInstallUsecase(gh<_i114.SupportTabRepo>()));
  gh.lazySingleton<_i136.GetInvoiceByClientUsecase>(
      () => _i136.GetInvoiceByClientUsecase(gh<_i114.SupportTabRepo>()));
  gh.lazySingleton<_i137.ReceiveDeviceUsecase>(
      () => _i137.ReceiveDeviceUsecase(gh<_i114.SupportTabRepo>()));
  gh.lazySingleton<_i138.ReturnInvoiceApproveUsecase>(
      () => _i138.ReturnInvoiceApproveUsecase(gh<_i114.SupportTabRepo>()));
  gh.lazySingleton<_i139.SetDateDoneUsecase>(
      () => _i139.SetDateDoneUsecase(gh<_i114.SupportTabRepo>()));
  gh.lazySingleton<_i140.SetReadyInstallUsecase>(
      () => _i140.SetReadyInstallUsecase(gh<_i114.SupportTabRepo>()));
  gh.lazySingleton<_i141.GetAllUsersUseCase>(
      () => _i141.GetAllUsersUseCase(gh<_i89.InvoicesSectionRepo>()));
  gh.lazySingleton<_i142.ClientsDebtsRepo>(
      () => _i143.ClientsDebtsRepoImpl(gh<_i24.ClientsDebtsDatasource>()));
  gh.singleton<_i144.CitiesCubit>(
      () => _i144.CitiesCubit(gh<_i76.GetCitiesUseCase>()));
  gh.factory<_i145.CommunicationListRepository>(() =>
      _i146.CommunicationListRepositoryImpl(
          gh<_i33.CommunicationListDatasource>()));
  gh.lazySingleton<_i147.GetBranchesForUserUsecase>(
      () => _i147.GetBranchesForUserUsecase(gh<_i52.UsersRepository>()));
  gh.lazySingleton<_i148.GetLevelsForUserUsecase>(
      () => _i148.GetLevelsForUserUsecase(gh<_i52.UsersRepository>()));
  gh.lazySingleton<_i149.GetManagesForUserUsecase>(
      () => _i149.GetManagesForUserUsecase(gh<_i52.UsersRepository>()));
  gh.factory<_i150.GetUsersUsecase>(
      () => _i150.GetUsersUsecase(gh<_i52.UsersRepository>()));
  gh.factory<_i151.ActionLinkUsecase>(
      () => _i151.ActionLinkUsecase(gh<_i116.LinksImportantRepository>()));
  gh.factory<_i152.GetLinkUsecase>(
      () => _i152.GetLinkUsecase(gh<_i116.LinksImportantRepository>()));
  gh.lazySingleton<_i153.ManageWithdrawalsRepository>(() =>
      _i154.ManageWithdrawalsRepositoryImpl(
          gh<_i31.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i155.AgentsDistributorsRepo>(() =>
      _i156.AgentsDistributorsRepoImpl(
          gh<_i65.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i157.RegionsRepository>(
      () => _i158.RegionsRepositoryImpl(gh<_i100.RegionsDatasource>()));
  gh.factory<_i159.UsersTypeCubit>(
      () => _i159.UsersTypeCubit(gh<_i71.GetUsersUsecase>()));
  gh.factory<_i160.AddParticipateCommentUsecase>(() =>
      _i160.AddParticipateCommentUsecase(gh<_i87.ParticipateListRepository>()));
  gh.factory<_i161.AddParticipateUserUsecase>(() =>
      _i161.AddParticipateUserUsecase(gh<_i87.ParticipateListRepository>()));
  gh.factory<_i162.EditParticipateUserUsecase>(() =>
      _i162.EditParticipateUserUsecase(gh<_i87.ParticipateListRepository>()));
  gh.factory<_i163.GetInvoiceByIdUsecase>(
      () => _i163.GetInvoiceByIdUsecase(gh<_i87.ParticipateListRepository>()));
  gh.factory<_i164.ParticipateClientListUsecase>(() =>
      _i164.ParticipateClientListUsecase(gh<_i87.ParticipateListRepository>()));
  gh.factory<_i165.ParticipateCommentListUsecase>(() =>
      _i165.ParticipateCommentListUsecase(
          gh<_i87.ParticipateListRepository>()));
  gh.factory<_i166.ParticipateInvoiceListUsecase>(() =>
      _i166.ParticipateInvoiceListUsecase(
          gh<_i87.ParticipateListRepository>()));
  gh.factory<_i167.ParticipateListUsecase>(
      () => _i167.ParticipateListUsecase(gh<_i87.ParticipateListRepository>()));
  gh.lazySingleton<_i168.ChangeParticipateStatusUsecase>(() =>
      _i168.ChangeParticipateStatusUsecase(
          gh<_i87.ParticipateListRepository>()));
  gh.factory<_i169.PendingInvoicesCubit>(
      () => _i169.PendingInvoicesCubit(gh<_i72.GetPendingInvoicesUsecase>()));
  gh.factory<_i170.GetCommunicationListUsecase>(() =>
      _i170.GetCommunicationListUsecase(
          gh<_i145.CommunicationListRepository>()));
  gh.lazySingleton<_i171.ClientsTransferApprovalsRepo>(() =>
      _i172.ClientsTransferApprovalsRepoImpl(
          gh<_i29.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i173.CrudClientSupportFilesUsecase>(() =>
      _i173.CrudClientSupportFilesUsecase(
          repository: gh<_i129.ClientsListRepository>()));
  gh.lazySingleton<_i174.GetClientSupportFilesUsecase>(() =>
      _i174.GetClientSupportFilesUsecase(
          repository: gh<_i129.ClientsListRepository>()));
  gh.factory<_i175.LinkCubit>(() => _i175.LinkCubit(
        gh<_i152.GetLinkUsecase>(),
        gh<_i151.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i176.GetPreviousRatingsUsecase>(
      () => _i176.GetPreviousRatingsUsecase(gh<_i68.PreviousRatingsRepo>()));
  gh.lazySingleton<_i177.WaitingAgentsRepo>(
      () => _i178.WaitingAgentsRepoImpl(gh<_i92.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i179.ChangeStateAgentUseCase>(
      () => _i179.ChangeStateAgentUseCase(gh<_i155.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i180.GetAgentsAndDistributorsUseCase>(() =>
      _i180.GetAgentsAndDistributorsUseCase(
          gh<_i155.AgentsDistributorsRepo>()));
  gh.factory<_i181.ClientsAcceptCubit>(
      () => _i181.ClientsAcceptCubit(gh<_i124.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i182.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i182.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i153.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i183.GetWithdrawalsInvoicesUsecase>(() =>
      _i183.GetWithdrawalsInvoicesUsecase(
          gh<_i153.ManageWithdrawalsRepository>()));
  gh.factory<_i184.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i184.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i153.ManageWithdrawalsRepository>()));
  gh.factory<_i185.AddTaskUsecase>(
      () => _i185.AddTaskUsecase(gh<_i63.TaskRepository>()));
  gh.factory<_i186.ChangeStatusTaskUsecase>(
      () => _i186.ChangeStatusTaskUsecase(gh<_i63.TaskRepository>()));
  gh.factory<_i187.FilterTaskUsecase>(
      () => _i187.FilterTaskUsecase(gh<_i63.TaskRepository>()));
  gh.factory<_i188.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i188.GetUsersByDepartmentAndRegionUsecase(gh<_i63.TaskRepository>()));
  gh.lazySingleton<_i189.ExceededClientsUseCase>(
      () => _i189.ExceededClientsUseCase(gh<_i60.ExceededClientsRepo>()));
  gh.lazySingleton<_i190.TransferExceededClientsUseCase>(() =>
      _i190.TransferExceededClientsUseCase(gh<_i60.ExceededClientsRepo>()));
  gh.lazySingleton<_i191.EditAdvancedConfigsUsecase>(() =>
      _i191.EditAdvancedConfigsUsecase(gh<_i85.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i192.GetAdvancedConfigsUsecase>(() =>
      _i192.GetAdvancedConfigsUsecase(gh<_i85.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i193.DatesTableRepo>(
      () => _i194.DatesTableRepoImpl(gh<_i98.DatesTableDataSource>()));
  gh.factory<_i195.AddClientUserUsecase>(
      () => _i195.AddClientUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i196.ApproveRejectClientUsecase>(() =>
      _i196.ApproveRejectClientUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i197.ChangeTypeClientUsecase>(
      () => _i197.ChangeTypeClientUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i198.EditClientUserUsecase>(
      () => _i198.EditClientUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i199.GetClientsListByRegionUseCase>(() =>
      _i199.GetClientsListByRegionUseCase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i200.GetClientsListByUserUseCase>(() =>
      _i200.GetClientsListByUserUseCase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i201.GetClientsWithFilterUserUsecase>(() =>
      _i201.GetClientsWithFilterUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i202.GetClientMarketingReportUsecase>(() =>
      _i202.GetClientMarketingReportUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i203.GetRecommendedClientsUsecase>(() =>
      _i203.GetRecommendedClientsUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i204.GetSimilarClientsUsecase>(
      () => _i204.GetSimilarClientsUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i205.ReceiveClientUserUsecase>(
      () => _i205.ReceiveClientUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i206.TransferClientUserUsecase>(
      () => _i206.TransferClientUserUsecase(gh<_i129.ClientsListRepository>()));
  gh.factory<_i207.GetVersionUseCase>(
      () => _i207.GetVersionUseCase(gh<_i108.AppRepository>()));
  gh.factory<_i208.AddTicketCubit>(
      () => _i208.AddTicketCubit(gh<_i77.AddTicketUseCase>()));
  gh.lazySingleton<_i209.EditGeneralConfigsUsecase>(() =>
      _i209.EditGeneralConfigsUsecase(gh<_i125.GeneralConfigsRepository>()));
  gh.lazySingleton<_i210.GetGeneralConfigsUsecase>(() =>
      _i210.GetGeneralConfigsUsecase(gh<_i125.GeneralConfigsRepository>()));
  gh.factory<_i211.InstallQualityCubit>(
      () => _i211.InstallQualityCubit(gh<_i131.GetInstallUseCase>()));
  gh.lazySingleton<_i212.AddAgentUseCase>(
      () => _i212.AddAgentUseCase(gh<_i110.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i213.UpdateAgentUseCase>(() =>
      _i213.UpdateAgentUseCase(gh<_i110.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i214.GetDelayInstallReportsUseCase>(() =>
      _i214.GetDelayInstallReportsUseCase(gh<_i106.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i215.CrudAgentSupportFilesUsecase>(() =>
      _i215.CrudAgentSupportFilesUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i216.GetClientsTransferApprovalsUsecase>(() =>
      _i216.GetClientsTransferApprovalsUsecase(
          gh<_i171.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i217.GetLatestClientsUseCase>(() =>
      _i217.GetLatestClientsUseCase(gh<_i66.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i218.TaskCubit>(() => _i218.TaskCubit(
        gh<_i185.AddTaskUsecase>(),
        gh<_i187.FilterTaskUsecase>(),
        gh<_i186.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i219.SupportTabCubit>(() => _i219.SupportTabCubit(
        gh<_i136.GetInvoiceByClientUsecase>(),
        gh<_i134.AddDateInstallUsecase>(),
        gh<_i139.SetDateDoneUsecase>(),
        gh<_i140.SetReadyInstallUsecase>(),
        gh<_i138.ReturnInvoiceApproveUsecase>(),
        gh<_i137.ReceiveDeviceUsecase>(),
        gh<_i135.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i220.AddAgentDateUseCase>(() =>
      _i220.AddAgentDateUseCase(gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.factory<_i221.ClientsListBloc>(() => _i221.ClientsListBloc(
        gh<_i201.GetClientsWithFilterUserUsecase>(),
        gh<_i203.GetRecommendedClientsUsecase>(),
        gh<_i195.AddClientUserUsecase>(),
        gh<_i198.EditClientUserUsecase>(),
        gh<_i197.ChangeTypeClientUsecase>(),
        gh<_i204.GetSimilarClientsUsecase>(),
        gh<_i196.ApproveRejectClientUsecase>(),
        gh<_i173.CrudClientSupportFilesUsecase>(),
        gh<_i174.GetClientSupportFilesUsecase>(),
        gh<_i206.TransferClientUserUsecase>(),
        gh<_i205.ReceiveClientUserUsecase>(),
        gh<_i202.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i222.AgentsDistributorsActionsCubit>(
      () => _i222.AgentsDistributorsActionsCubit(
            gh<_i76.GetCitiesUseCase>(),
            gh<_i212.AddAgentUseCase>(),
            gh<_i213.UpdateAgentUseCase>(),
          ));
  gh.factory<_i223.LoginCubit>(() => _i223.LoginCubit(
        gh<_i121.LoginUsecase>(),
        gh<_i123.VerifyOtpUsecase>(),
        gh<_i119.CacheTokenUsecase>(),
        gh<_i120.GetTokenUsecase>(),
        gh<_i122.ValidateTokenUsecase>(),
      ));
  gh.factory<_i224.InvoicesSectionCubit>(() => _i224.InvoicesSectionCubit(
        gh<_i118.GetInvoicesByPrivilegesUsecase>(),
        gh<_i180.GetAgentsAndDistributorsUseCase>(),
        gh<_i167.ParticipateListUsecase>(),
        gh<_i141.GetAllUsersUseCase>(),
      ));
  gh.factory<_i225.AddLevelUsecase>(
      () => _i225.AddLevelUsecase(gh<_i104.PrivilegeRepository>()));
  gh.factory<_i226.GetLevelsUsecase>(
      () => _i226.GetLevelsUsecase(gh<_i104.PrivilegeRepository>()));
  gh.factory<_i227.GetPrivilegesUsecase>(
      () => _i227.GetPrivilegesUsecase(gh<_i104.PrivilegeRepository>()));
  gh.factory<_i228.UpdatePrivilegeUsecase>(
      () => _i228.UpdatePrivilegeUsecase(gh<_i104.PrivilegeRepository>()));
  gh.factory<_i229.AttachmentsRowCubit>(() => _i229.AttachmentsRowCubit(
        gh<_i174.GetClientSupportFilesUsecase>(),
        gh<_i173.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i230.AddCommentUsecase>(
      () => _i230.AddCommentUsecase(gh<_i127.CompanyRepository>()));
  gh.factory<_i231.GetCommentUsecase>(
      () => _i231.GetCommentUsecase(gh<_i127.CompanyRepository>()));
  gh.factory<_i232.DelayInstallReportsCubit>(() =>
      _i232.DelayInstallReportsCubit(
          gh<_i214.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i233.GetRegionsByIdCountryUseCase>(
      () => _i233.GetRegionsByIdCountryUseCase(gh<_i157.RegionsRepository>()));
  gh.lazySingleton<_i234.PrivilegeCubit>(() => _i234.PrivilegeCubit(
        gh<_i226.GetLevelsUsecase>(),
        gh<_i227.GetPrivilegesUsecase>(),
        gh<_i228.UpdatePrivilegeUsecase>(),
        gh<_i225.AddLevelUsecase>(),
      ));
  gh.factory<_i235.AdvancedCofigsCubit>(() => _i235.AdvancedCofigsCubit(
        gh<_i192.GetAdvancedConfigsUsecase>(),
        gh<_i191.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i236.PreviousRatingsCubit>(
      () => _i236.PreviousRatingsCubit(gh<_i176.GetPreviousRatingsUsecase>()));
  gh.factory<_i237.ParticipateListBloc>(() => _i237.ParticipateListBloc(
        gh<_i167.ParticipateListUsecase>(),
        gh<_i161.AddParticipateUserUsecase>(),
        gh<_i162.EditParticipateUserUsecase>(),
        gh<_i164.ParticipateClientListUsecase>(),
        gh<_i166.ParticipateInvoiceListUsecase>(),
        gh<_i163.GetInvoiceByIdUsecase>(),
        gh<_i165.ParticipateCommentListUsecase>(),
        gh<_i160.AddParticipateCommentUsecase>(),
        gh<_i168.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i238.ClientsTransferApprovalsCubit>(() =>
      _i238.ClientsTransferApprovalsCubit(
          gh<_i216.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i239.GeneralCofigsCubit>(() => _i239.GeneralCofigsCubit(
        gh<_i210.GetGeneralConfigsUsecase>(),
        gh<_i209.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i240.GetClientsDebtsUsecase>(
      () => _i240.GetClientsDebtsUsecase(gh<_i142.ClientsDebtsRepo>()));
  gh.lazySingleton<_i241.AddAgentCommentUsecase>(() =>
      _i241.AddAgentCommentUsecase(gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i242.DoneTrainingUsecase>(() =>
      _i242.DoneTrainingUsecase(gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i243.GetAgentUsecase>(
      () => _i243.GetAgentUsecase(gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i244.GetAgentClientListUsecase>(() =>
      _i244.GetAgentClientListUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i245.GetAgentCommentsListUsecase>(() =>
      _i245.GetAgentCommentsListUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i246.GetAgentDatesListUsecase>(() =>
      _i246.GetAgentDatesListUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i247.GetAgentInvoiceListUsecase>(() =>
      _i247.GetAgentInvoiceListUsecase(
          gh<_i132.AgentsDistributorsProfileRepo>()));
  gh.factory<_i248.AddRejectReasonsUsecase>(() =>
      _i248.AddRejectReasonsUsecase(gh<_i153.ManageWithdrawalsRepository>()));
  gh.factory<_i249.EditRejectReasonsUsecase>(() =>
      _i249.EditRejectReasonsUsecase(gh<_i153.ManageWithdrawalsRepository>()));
  gh.factory<_i250.GetRejectReasonsUsecase>(() =>
      _i250.GetRejectReasonsUsecase(gh<_i153.ManageWithdrawalsRepository>()));
  gh.factory<_i251.GetUserSeriesUsecase>(() =>
      _i251.GetUserSeriesUsecase(gh<_i153.ManageWithdrawalsRepository>()));
  gh.factory<_i252.GetWithdrawnDetailsUsecase>(() =>
      _i252.GetWithdrawnDetailsUsecase(
          gh<_i153.ManageWithdrawalsRepository>()));
  gh.factory<_i253.SetApproveSeriesUsecase>(() =>
      _i253.SetApproveSeriesUsecase(gh<_i153.ManageWithdrawalsRepository>()));
  gh.factory<_i254.UpdateSeriesUsecase>(
      () => _i254.UpdateSeriesUsecase(gh<_i153.ManageWithdrawalsRepository>()));
  gh.singleton<_i255.AppManagerCubit>(
      () => _i255.AppManagerCubit(gh<_i207.GetVersionUseCase>()));
  gh.factory<_i256.RegionsCubit>(
      () => _i256.RegionsCubit(gh<_i233.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i257.GetWaitingAgentsUsecase>(
      () => _i257.GetWaitingAgentsUsecase(gh<_i177.WaitingAgentsRepo>()));
  gh.factory<_i258.UsersCubit>(() => _i258.UsersCubit(
        gh<_i150.GetUsersUsecase>(),
        gh<_i62.ActionUserUsecase>(),
        gh<_i188.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i149.GetManagesForUserUsecase>(),
        gh<_i148.GetLevelsForUserUsecase>(),
        gh<_i147.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i259.CommunicationListBloc>(() =>
      _i259.CommunicationListBloc(gh<_i170.GetCommunicationListUsecase>()));
  gh.factory<_i260.AgentsDistributorsCubit>(() => _i260.AgentsDistributorsCubit(
        gh<_i180.GetAgentsAndDistributorsUseCase>(),
        gh<_i179.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i261.ExceededClientsCubit>(() => _i261.ExceededClientsCubit(
        gh<_i189.ExceededClientsUseCase>(),
        gh<_i190.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i262.LatestClientsUpdatesCubit>(() =>
      _i262.LatestClientsUpdatesCubit(gh<_i217.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i263.CancelScheduleUsecase>(
      () => _i263.CancelScheduleUsecase(gh<_i193.DatesTableRepo>()));
  gh.lazySingleton<_i264.ChangeDateToDonUsecase>(
      () => _i264.ChangeDateToDonUsecase(gh<_i193.DatesTableRepo>()));
  gh.lazySingleton<_i265.GetDateInstallationUsecase>(
      () => _i265.GetDateInstallationUsecase(gh<_i193.DatesTableRepo>()));
  gh.lazySingleton<_i266.GetInvoicesByClientForDateUsecase>(() =>
      _i266.GetInvoicesByClientForDateUsecase(gh<_i193.DatesTableRepo>()));
  gh.lazySingleton<_i267.GetSubscribedClientsUsecase>(
      () => _i267.GetSubscribedClientsUsecase(gh<_i193.DatesTableRepo>()));
  gh.lazySingleton<_i268.RescheduleDateUsecase>(
      () => _i268.RescheduleDateUsecase(gh<_i193.DatesTableRepo>()));
  gh.lazySingleton<_i269.ReturnScheduleVisitToOpenUsecase>(
      () => _i269.ReturnScheduleVisitToOpenUsecase(gh<_i193.DatesTableRepo>()));
  gh.factory<_i270.AgentsDistributorsProfileBloc>(
      () => _i270.AgentsDistributorsProfileBloc(
            gh<_i244.GetAgentClientListUsecase>(),
            gh<_i247.GetAgentInvoiceListUsecase>(),
            gh<_i163.GetInvoiceByIdUsecase>(),
            gh<_i245.GetAgentCommentsListUsecase>(),
            gh<_i241.AddAgentCommentUsecase>(),
            gh<_i242.DoneTrainingUsecase>(),
            gh<_i220.AddAgentDateUseCase>(),
            gh<_i246.GetAgentDatesListUsecase>(),
            gh<_i215.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i271.DatesTableCubit>(() => _i271.DatesTableCubit(
        gh<_i265.GetDateInstallationUsecase>(),
        gh<_i268.RescheduleDateUsecase>(),
        gh<_i264.ChangeDateToDonUsecase>(),
        gh<_i263.CancelScheduleUsecase>(),
        gh<_i269.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i267.GetSubscribedClientsUsecase>(),
        gh<_i266.GetInvoicesByClientForDateUsecase>(),
        gh<_i134.AddDateInstallUsecase>(),
      ));
  gh.factory<_i272.CompanyCubit>(() => _i272.CompanyCubit(
        gh<_i231.GetCommentUsecase>(),
        gh<_i230.AddCommentUsecase>(),
      ));
  gh.factory<_i273.ClientsDebtsCubit>(
      () => _i273.ClientsDebtsCubit(gh<_i240.GetClientsDebtsUsecase>()));
  gh.factory<_i274.ManageWithdrawalsCubit>(() => _i274.ManageWithdrawalsCubit(
        gh<_i251.GetUserSeriesUsecase>(),
        gh<_i254.UpdateSeriesUsecase>(),
        gh<_i150.GetUsersUsecase>(),
        gh<_i183.GetWithdrawalsInvoicesUsecase>(),
        gh<_i184.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i253.SetApproveSeriesUsecase>(),
        gh<_i252.GetWithdrawnDetailsUsecase>(),
        gh<_i248.AddRejectReasonsUsecase>(),
        gh<_i250.GetRejectReasonsUsecase>(),
        gh<_i249.EditRejectReasonsUsecase>(),
        gh<_i182.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i275.WaitingAgentsCubit>(
      () => _i275.WaitingAgentsCubit(gh<_i257.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i276.AppModule {}
