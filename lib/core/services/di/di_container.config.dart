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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i31;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i102;
import '../../../features/app/domain/repositories/app_repository.dart' as _i101;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i199;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i245;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i55;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i77;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i90;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i89;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i112;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i113;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i114;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i115;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i116;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i214;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i18;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i22;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i117;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i173;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i26;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i42;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i41;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i70;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i71;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i72;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i74;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i73;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i75;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i200;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i88;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i76;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i32;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i139;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i138;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i163;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i249;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i25;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i96;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i95;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i124;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i140;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i39;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i68;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i67;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i69;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i137;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i64;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i108;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i107;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i127;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i128;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i129;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i130;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i131;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i132;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i133;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i210;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i93;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i152;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i151;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i224;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i246;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i40;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i79;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i78;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i183;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i184;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i226;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i50;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i119;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i118;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i201;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i202;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i229;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i33;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i98;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i97;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i216;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i217;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i218;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i219;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i225;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i27;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i49;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i48;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i58;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i141;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i142;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i143;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i144;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i248;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i30;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i148;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i147;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i238;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i239;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i174;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i240;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i241;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i176;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i175;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i242;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i243;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i244;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i264;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i23;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i136;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i135;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i230;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i263;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i28;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i165;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i164;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i207;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i228;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i24;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i52;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i51;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i86;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i105;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i16;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i54;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i53;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i65;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i162;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i34;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i123;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i122;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i187;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i188;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i189;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i166;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i190;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i194;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i167;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i191;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i192;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i193;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i195;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i196;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i197;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i198;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i212;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i35;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i121;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i120;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i221;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i222;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i262;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i29;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i57;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i56;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i181;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i182;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i251;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i66;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i83;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i82;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i134;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i111;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i215;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i38;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i63;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i62;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i208;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i252;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i17;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i61;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i87;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i104;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i126;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i150;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i103;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i125;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i149;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i211;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i203;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i206;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i232;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i233;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i234;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i235;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i236;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i237;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i172;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i204;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i213;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i260;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i250;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i36;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i110;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i109;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i145;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i146;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i168;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i20;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i81;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i80;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i153;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i161;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i156;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i159;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i157;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i158;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i160;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i227;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i91;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i186;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i185;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i253;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i254;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i255;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i256;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i257;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i258;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i259;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i261;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i46;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i45;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i92;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i106;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i19;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i100;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i99;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i205;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i223;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i44;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i43;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i47;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i84;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i85;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i170;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i169;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i247;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i265;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i37;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i60;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i59;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i177;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i178;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i179;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i180;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i209;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i220;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i94;
import 'di_container.dart' as _i266;

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
  gh.lazySingleton<_i18.ClientsAcceptDatasource>(
      () => _i18.ClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i19.DelayInstallReportsDatasource>(
      () => _i19.DelayInstallReportsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i20.ParticipatesListDatasource>(
      () => _i20.ParticipatesListDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i21.ClientsAcceptRepository>(() =>
      _i22.ClientsAcceptRepositoryImpl(gh<_i18.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i23.ClientsDebtsDatasource>(
      () => _i23.ClientsDebtsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i24.FinancePendingDatasource>(
      () => _i24.FinancePendingDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i25.InstallQualityDatasource>(
      () => _i25.InstallQualityDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i26.TicketsDataSource>(
      () => _i26.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i27.UsersDatasource>(
      () => _i27.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i28.ClientsTransferApprovalsDatasource>(
      () => _i28.ClientsTransferApprovalsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i29.ExceededClientsDatasource>(
      () => _i29.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.ManageWithdrawalsDatasource>(
      () => _i30.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i31.AppDatasource>(
      () => _i31.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i32.CommunicationListDatasource>(
      () => _i32.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i33.PrivilegeDatasource>(
      () => _i33.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i34.ClientsListDatasource>(
      () => _i34.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i35.CommentCompanyDatasource>(
      () => _i35.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i36.LinkDatasource>(
      () => _i36.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i37.TaskDatasource>(
      () => _i37.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i38.LatestClientsUpdatesDatasource>(
      () => _i38.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i39.CitiesDatasource>(
      () => _i39.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i40.AdvancedConfigsDatasource>(
      () => _i40.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i41.TicketsRepo>(
      () => _i42.TicketsRepoImpl(gh<_i26.TicketsDataSource>()));
  gh.lazySingleton<_i43.SupportClientsAcceptRepository>(() =>
      _i44.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i45.DelayAfterInstallRepo>(() =>
      _i46.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i47.GetSupportClientsAcceptUseCase>(() =>
      _i47.GetSupportClientsAcceptUseCase(
          gh<_i43.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i48.UsersRepository>(
      () => _i49.UsersRepositoryImpl(gh<_i27.UsersDatasource>()));
  gh.lazySingleton<_i50.GeneralConfigsDatasource>(
      () => _i50.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i51.FinancePendingRepo>(
      () => _i52.FinancePendingRepoImpl(gh<_i24.FinancePendingDatasource>()));
  gh.lazySingleton<_i53.PendingInvoicesRepo>(
      () => _i54.PendingInvoicesRepoImpl(gh<_i16.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i55.LoginLocalDataSource>(() =>
      _i55.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i56.ExceededClientsRepo>(
      () => _i57.ExceededClientsRepoImpl(gh<_i29.ExceededClientsDatasource>()));
  gh.factory<_i58.ActionUserUsecase>(
      () => _i58.ActionUserUsecase(gh<_i48.UsersRepository>()));
  gh.factory<_i59.TaskRepository>(
      () => _i60.TaskRepositoryImpl(gh<_i37.TaskDatasource>()));
  gh.lazySingleton<_i61.AgentsDistributorsDataSource>(
      () => _i61.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i62.LatestClientsUpdatesRepository>(() =>
      _i63.LatestClientsUpdatesRepositoryImpl(
          gh<_i38.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i64.SupportTabDataSource>(
      () => _i64.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i65.GetPendingInvoicesUsecase>(
      () => _i65.GetPendingInvoicesUsecase(gh<_i53.PendingInvoicesRepo>()));
  gh.lazySingleton<_i66.InvoicesTabDataSource>(
      () => _i66.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i67.CitiesRepository>(
      () => _i68.CitiesRepositoryImpl(gh<_i39.CitiesDatasource>()));
  gh.lazySingleton<_i69.GetCitiesUseCase>(
      () => _i69.GetCitiesUseCase(gh<_i67.CitiesRepository>()));
  gh.lazySingleton<_i70.AddTicketUseCase>(
      () => _i70.AddTicketUseCase(gh<_i41.TicketsRepo>()));
  gh.lazySingleton<_i71.EditTicketTypeUseCase>(
      () => _i71.EditTicketTypeUseCase(gh<_i41.TicketsRepo>()));
  gh.lazySingleton<_i72.GetClientTicketsUseCase>(
      () => _i72.GetClientTicketsUseCase(gh<_i41.TicketsRepo>()));
  gh.lazySingleton<_i73.GetTicketsUseCase>(
      () => _i73.GetTicketsUseCase(gh<_i41.TicketsRepo>()));
  gh.lazySingleton<_i74.GetTicketByIdUseCase>(
      () => _i74.GetTicketByIdUseCase(gh<_i41.TicketsRepo>()));
  gh.lazySingleton<_i75.TransferTicketUseCase>(
      () => _i75.TransferTicketUseCase(gh<_i41.TicketsRepo>()));
  gh.factory<_i76.TicketsCubit>(() => _i76.TicketsCubit(
        gh<_i73.GetTicketsUseCase>(),
        gh<_i74.GetTicketByIdUseCase>(),
        gh<_i72.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i77.LoginRemoteDataSource>(
      () => _i77.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i78.AdvancedConfigsRepository>(() =>
      _i79.AdvancedConfigsRepositoryImpl(gh<_i40.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i80.ParticipateListRepository>(() =>
      _i81.ParticipateListRepositoryImpl(
          gh<_i20.ParticipatesListDatasource>()));
  gh.lazySingleton<_i82.InvoicesSectionRepo>(
      () => _i83.InvoicesTabRepoImpl(gh<_i66.InvoicesTabDataSource>()));
  gh.factory<_i84.SupportClientsAcceptCubit>(() =>
      _i84.SupportClientsAcceptCubit(
          gh<_i47.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i85.WaitingAgentsDataSource>(
      () => _i85.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i86.GetFinancePendingInvoicesUsecase>(() =>
      _i86.GetFinancePendingInvoicesUsecase(gh<_i51.FinancePendingRepo>()));
  gh.lazySingleton<_i87.AgentsDistributorsProfileDataSource>(() =>
      _i87.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i88.EditTicketCubit>(() => _i88.EditTicketCubit(
        gh<_i71.EditTicketTypeUseCase>(),
        gh<_i75.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i89.LoginRepo>(() => _i90.LoginRepoImpl(
        gh<_i77.LoginRemoteDataSource>(),
        gh<_i55.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i91.DatesTableDataSource>(
      () => _i91.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i92.GetDelayAfterInstallUseCase>(
      () => _i92.GetDelayAfterInstallUseCase(gh<_i45.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i93.RegionsDatasource>(
      () => _i93.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i94.LocationServices>(
      () => _i94.LocationServices(gh<_i8.Location>()));
  gh.lazySingleton<_i95.InstallQualityRepo>(
      () => _i96.InstallQualityRepoImpl(gh<_i25.InstallQualityDatasource>()));
  gh.factory<_i97.PrivilegeRepository>(
      () => _i98.PrivilegeRepositoryImpl(gh<_i33.PrivilegeDatasource>()));
  gh.lazySingleton<_i99.DelayInstallReportsRepo>(() =>
      _i100.DelayInstallReportsRepoImpl(
          gh<_i19.DelayInstallReportsDatasource>()));
  gh.factory<_i101.AppRepository>(
      () => _i102.AppRepositoryImpl(gh<_i31.AppDatasource>()));
  gh.lazySingleton<_i103.AgentsDistributorsActionsRepo>(() =>
      _i104.AgentsDistributorsActionsRepoImpl(
          gh<_i17.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i105.FinancePendingCubit>(() =>
      _i105.FinancePendingCubit(gh<_i86.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i106.DelayAfterInstallCubit>(() =>
      _i106.DelayAfterInstallCubit(gh<_i92.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i107.SupportTabRepo>(
      () => _i108.SupportTabRepoImpl(gh<_i64.SupportTabDataSource>()));
  gh.factory<_i109.LinksImportantRepository>(
      () => _i110.LinkRepositoryImpl(gh<_i36.LinkDatasource>()));
  gh.lazySingleton<_i111.GetInvoicesByPrivilegesUsecase>(() =>
      _i111.GetInvoicesByPrivilegesUsecase(gh<_i82.InvoicesSectionRepo>()));
  gh.lazySingleton<_i112.CacheTokenUsecase>(
      () => _i112.CacheTokenUsecase(gh<_i89.LoginRepo>()));
  gh.lazySingleton<_i113.GetTokenUsecase>(
      () => _i113.GetTokenUsecase(gh<_i89.LoginRepo>()));
  gh.lazySingleton<_i114.LoginUsecase>(
      () => _i114.LoginUsecase(gh<_i89.LoginRepo>()));
  gh.lazySingleton<_i115.ValidateTokenUsecase>(
      () => _i115.ValidateTokenUsecase(gh<_i89.LoginRepo>()));
  gh.lazySingleton<_i116.VerifyOtpUsecase>(
      () => _i116.VerifyOtpUsecase(gh<_i89.LoginRepo>()));
  gh.lazySingleton<_i117.GetClientsAcceptUseCase>(
      () => _i117.GetClientsAcceptUseCase(gh<_i21.ClientsAcceptRepository>()));
  gh.lazySingleton<_i118.GeneralConfigsRepository>(() =>
      _i119.GeneralConfigsRepositoryImpl(gh<_i50.GeneralConfigsDatasource>()));
  gh.factory<_i120.CompanyRepository>(
      () => _i121.CompanyRepositoryImpl(gh<_i35.CommentCompanyDatasource>()));
  gh.factory<_i122.ClientsListRepository>(
      () => _i123.ClientsListRepositoryImpl(gh<_i34.ClientsListDatasource>()));
  gh.lazySingleton<_i124.GetInstallUseCase>(
      () => _i124.GetInstallUseCase(gh<_i95.InstallQualityRepo>()));
  gh.lazySingleton<_i125.AgentsDistributorsProfileRepo>(() =>
      _i126.AgentsDistributorsProfileRepoImpl(
          gh<_i87.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i127.AddDateInstallUsecase>(
      () => _i127.AddDateInstallUsecase(gh<_i107.SupportTabRepo>()));
  gh.lazySingleton<_i128.CancelDateInstallUsecase>(
      () => _i128.CancelDateInstallUsecase(gh<_i107.SupportTabRepo>()));
  gh.lazySingleton<_i129.GetInvoiceByClientUsecase>(
      () => _i129.GetInvoiceByClientUsecase(gh<_i107.SupportTabRepo>()));
  gh.lazySingleton<_i130.ReceiveDeviceUsecase>(
      () => _i130.ReceiveDeviceUsecase(gh<_i107.SupportTabRepo>()));
  gh.lazySingleton<_i131.ReturnInvoiceApproveUsecase>(
      () => _i131.ReturnInvoiceApproveUsecase(gh<_i107.SupportTabRepo>()));
  gh.lazySingleton<_i132.SetDateDoneUsecase>(
      () => _i132.SetDateDoneUsecase(gh<_i107.SupportTabRepo>()));
  gh.lazySingleton<_i133.SetReadyInstallUsecase>(
      () => _i133.SetReadyInstallUsecase(gh<_i107.SupportTabRepo>()));
  gh.lazySingleton<_i134.GetAllUsersUseCase>(
      () => _i134.GetAllUsersUseCase(gh<_i82.InvoicesSectionRepo>()));
  gh.lazySingleton<_i135.ClientsDebtsRepo>(
      () => _i136.ClientsDebtsRepoImpl(gh<_i23.ClientsDebtsDatasource>()));
  gh.singleton<_i137.CitiesCubit>(
      () => _i137.CitiesCubit(gh<_i69.GetCitiesUseCase>()));
  gh.factory<_i138.CommunicationListRepository>(() =>
      _i139.CommunicationListRepositoryImpl(
          gh<_i32.CommunicationListDatasource>()));
  gh.factory<_i140.InstallQualityCubit>(
      () => _i140.InstallQualityCubit(gh<_i124.GetInstallUseCase>()));
  gh.lazySingleton<_i141.GetBranchesForUserUsecase>(
      () => _i141.GetBranchesForUserUsecase(gh<_i48.UsersRepository>()));
  gh.lazySingleton<_i142.GetLevelsForUserUsecase>(
      () => _i142.GetLevelsForUserUsecase(gh<_i48.UsersRepository>()));
  gh.lazySingleton<_i143.GetManagesForUserUsecase>(
      () => _i143.GetManagesForUserUsecase(gh<_i48.UsersRepository>()));
  gh.factory<_i144.GetUsersUsecase>(
      () => _i144.GetUsersUsecase(gh<_i48.UsersRepository>()));
  gh.factory<_i145.ActionLinkUsecase>(
      () => _i145.ActionLinkUsecase(gh<_i109.LinksImportantRepository>()));
  gh.factory<_i146.GetLinkUsecase>(
      () => _i146.GetLinkUsecase(gh<_i109.LinksImportantRepository>()));
  gh.lazySingleton<_i147.ManageWithdrawalsRepository>(() =>
      _i148.ManageWithdrawalsRepositoryImpl(
          gh<_i30.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i149.AgentsDistributorsRepo>(() =>
      _i150.AgentsDistributorsRepoImpl(
          gh<_i61.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i151.RegionsRepository>(
      () => _i152.RegionsRepositoryImpl(gh<_i93.RegionsDatasource>()));
  gh.factory<_i153.AddParticipateCommentUsecase>(() =>
      _i153.AddParticipateCommentUsecase(gh<_i80.ParticipateListRepository>()));
  gh.factory<_i154.AddParticipateUserUsecase>(() =>
      _i154.AddParticipateUserUsecase(gh<_i80.ParticipateListRepository>()));
  gh.factory<_i155.EditParticipateUserUsecase>(() =>
      _i155.EditParticipateUserUsecase(gh<_i80.ParticipateListRepository>()));
  gh.factory<_i156.GetInvoiceByIdUsecase>(
      () => _i156.GetInvoiceByIdUsecase(gh<_i80.ParticipateListRepository>()));
  gh.factory<_i157.ParticipateClientListUsecase>(() =>
      _i157.ParticipateClientListUsecase(gh<_i80.ParticipateListRepository>()));
  gh.factory<_i158.ParticipateCommentListUsecase>(() =>
      _i158.ParticipateCommentListUsecase(
          gh<_i80.ParticipateListRepository>()));
  gh.factory<_i159.ParticipateInvoiceListUsecase>(() =>
      _i159.ParticipateInvoiceListUsecase(
          gh<_i80.ParticipateListRepository>()));
  gh.factory<_i160.ParticipateListUsecase>(
      () => _i160.ParticipateListUsecase(gh<_i80.ParticipateListRepository>()));
  gh.lazySingleton<_i161.ChangeParticipateStatusUsecase>(() =>
      _i161.ChangeParticipateStatusUsecase(
          gh<_i80.ParticipateListRepository>()));
  gh.factory<_i162.PendingInvoicesCubit>(
      () => _i162.PendingInvoicesCubit(gh<_i65.GetPendingInvoicesUsecase>()));
  gh.factory<_i163.GetCommunicationListUsecase>(() =>
      _i163.GetCommunicationListUsecase(
          gh<_i138.CommunicationListRepository>()));
  gh.lazySingleton<_i164.ClientsTransferApprovalsRepo>(() =>
      _i165.ClientsTransferApprovalsRepoImpl(
          gh<_i28.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i166.CrudClientSupportFilesUsecase>(() =>
      _i166.CrudClientSupportFilesUsecase(
          repository: gh<_i122.ClientsListRepository>()));
  gh.lazySingleton<_i167.GetClientSupportFilesUsecase>(() =>
      _i167.GetClientSupportFilesUsecase(
          repository: gh<_i122.ClientsListRepository>()));
  gh.factory<_i168.LinkCubit>(() => _i168.LinkCubit(
        gh<_i146.GetLinkUsecase>(),
        gh<_i145.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i169.WaitingAgentsRepo>(
      () => _i170.WaitingAgentsRepoImpl(gh<_i85.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i171.ChangeStateAgentUseCase>(
      () => _i171.ChangeStateAgentUseCase(gh<_i149.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i172.GetAgentsAndDistributorsUseCase>(() =>
      _i172.GetAgentsAndDistributorsUseCase(
          gh<_i149.AgentsDistributorsRepo>()));
  gh.factory<_i173.ClientsAcceptCubit>(
      () => _i173.ClientsAcceptCubit(gh<_i117.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i174.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i174.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i147.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i175.GetWithdrawalsInvoicesUsecase>(() =>
      _i175.GetWithdrawalsInvoicesUsecase(
          gh<_i147.ManageWithdrawalsRepository>()));
  gh.factory<_i176.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i176.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i147.ManageWithdrawalsRepository>()));
  gh.factory<_i177.AddTaskUsecase>(
      () => _i177.AddTaskUsecase(gh<_i59.TaskRepository>()));
  gh.factory<_i178.ChangeStatusTaskUsecase>(
      () => _i178.ChangeStatusTaskUsecase(gh<_i59.TaskRepository>()));
  gh.factory<_i179.FilterTaskUsecase>(
      () => _i179.FilterTaskUsecase(gh<_i59.TaskRepository>()));
  gh.factory<_i180.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i180.GetUsersByDepartmentAndRegionUsecase(gh<_i59.TaskRepository>()));
  gh.lazySingleton<_i181.ExceededClientsUseCase>(
      () => _i181.ExceededClientsUseCase(gh<_i56.ExceededClientsRepo>()));
  gh.lazySingleton<_i182.TransferExceededClientsUseCase>(() =>
      _i182.TransferExceededClientsUseCase(gh<_i56.ExceededClientsRepo>()));
  gh.lazySingleton<_i183.EditAdvancedConfigsUsecase>(() =>
      _i183.EditAdvancedConfigsUsecase(gh<_i78.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i184.GetAdvancedConfigsUsecase>(() =>
      _i184.GetAdvancedConfigsUsecase(gh<_i78.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i185.DatesTableRepo>(
      () => _i186.DatesTableRepoImpl(gh<_i91.DatesTableDataSource>()));
  gh.factory<_i187.AddClientUserUsecase>(
      () => _i187.AddClientUserUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i188.ApproveRejectClientUsecase>(() =>
      _i188.ApproveRejectClientUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i189.ChangeTypeClientUsecase>(
      () => _i189.ChangeTypeClientUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i190.EditClientUserUsecase>(
      () => _i190.EditClientUserUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i191.GetClientsListByRegionUseCase>(() =>
      _i191.GetClientsListByRegionUseCase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i192.GetClientsListByUserUseCase>(() =>
      _i192.GetClientsListByUserUseCase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i193.GetClientsWithFilterUserUsecase>(() =>
      _i193.GetClientsWithFilterUserUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i194.GetClientMarketingReportUsecase>(() =>
      _i194.GetClientMarketingReportUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i195.GetRecommendedClientsUsecase>(() =>
      _i195.GetRecommendedClientsUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i196.GetSimilarClientsUsecase>(
      () => _i196.GetSimilarClientsUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i197.ReceiveClientUserUsecase>(
      () => _i197.ReceiveClientUserUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i198.TransferClientUserUsecase>(
      () => _i198.TransferClientUserUsecase(gh<_i122.ClientsListRepository>()));
  gh.factory<_i199.GetVersionUseCase>(
      () => _i199.GetVersionUseCase(gh<_i101.AppRepository>()));
  gh.factory<_i200.AddTicketCubit>(
      () => _i200.AddTicketCubit(gh<_i70.AddTicketUseCase>()));
  gh.lazySingleton<_i201.EditGeneralConfigsUsecase>(() =>
      _i201.EditGeneralConfigsUsecase(gh<_i118.GeneralConfigsRepository>()));
  gh.lazySingleton<_i202.GetGeneralConfigsUsecase>(() =>
      _i202.GetGeneralConfigsUsecase(gh<_i118.GeneralConfigsRepository>()));
  gh.lazySingleton<_i203.AddAgentUseCase>(
      () => _i203.AddAgentUseCase(gh<_i103.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i204.UpdateAgentUseCase>(() =>
      _i204.UpdateAgentUseCase(gh<_i103.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i205.GetDelayInstallReportsUseCase>(() =>
      _i205.GetDelayInstallReportsUseCase(gh<_i99.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i206.CrudAgentSupportFilesUsecase>(() =>
      _i206.CrudAgentSupportFilesUsecase(
          gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i207.GetClientsTransferApprovalsUsecase>(() =>
      _i207.GetClientsTransferApprovalsUsecase(
          gh<_i164.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i208.GetLatestClientsUseCase>(() =>
      _i208.GetLatestClientsUseCase(gh<_i62.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i209.TaskCubit>(() => _i209.TaskCubit(
        gh<_i177.AddTaskUsecase>(),
        gh<_i179.FilterTaskUsecase>(),
        gh<_i178.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i210.SupportTabCubit>(() => _i210.SupportTabCubit(
        gh<_i129.GetInvoiceByClientUsecase>(),
        gh<_i127.AddDateInstallUsecase>(),
        gh<_i132.SetDateDoneUsecase>(),
        gh<_i133.SetReadyInstallUsecase>(),
        gh<_i131.ReturnInvoiceApproveUsecase>(),
        gh<_i130.ReceiveDeviceUsecase>(),
        gh<_i128.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i211.AddAgentDateUseCase>(() =>
      _i211.AddAgentDateUseCase(gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.factory<_i212.ClientsListBloc>(() => _i212.ClientsListBloc(
        gh<_i193.GetClientsWithFilterUserUsecase>(),
        gh<_i195.GetRecommendedClientsUsecase>(),
        gh<_i187.AddClientUserUsecase>(),
        gh<_i190.EditClientUserUsecase>(),
        gh<_i189.ChangeTypeClientUsecase>(),
        gh<_i196.GetSimilarClientsUsecase>(),
        gh<_i188.ApproveRejectClientUsecase>(),
        gh<_i166.CrudClientSupportFilesUsecase>(),
        gh<_i167.GetClientSupportFilesUsecase>(),
        gh<_i198.TransferClientUserUsecase>(),
        gh<_i197.ReceiveClientUserUsecase>(),
        gh<_i194.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i213.AgentsDistributorsActionsCubit>(
      () => _i213.AgentsDistributorsActionsCubit(
            gh<_i69.GetCitiesUseCase>(),
            gh<_i203.AddAgentUseCase>(),
            gh<_i204.UpdateAgentUseCase>(),
          ));
  gh.factory<_i214.LoginCubit>(() => _i214.LoginCubit(
        gh<_i114.LoginUsecase>(),
        gh<_i116.VerifyOtpUsecase>(),
        gh<_i112.CacheTokenUsecase>(),
        gh<_i113.GetTokenUsecase>(),
        gh<_i115.ValidateTokenUsecase>(),
      ));
  gh.factory<_i215.InvoicesSectionCubit>(() => _i215.InvoicesSectionCubit(
        gh<_i111.GetInvoicesByPrivilegesUsecase>(),
        gh<_i172.GetAgentsAndDistributorsUseCase>(),
        gh<_i160.ParticipateListUsecase>(),
        gh<_i134.GetAllUsersUseCase>(),
      ));
  gh.factory<_i216.AddLevelUsecase>(
      () => _i216.AddLevelUsecase(gh<_i97.PrivilegeRepository>()));
  gh.factory<_i217.GetLevelsUsecase>(
      () => _i217.GetLevelsUsecase(gh<_i97.PrivilegeRepository>()));
  gh.factory<_i218.GetPrivilegesUsecase>(
      () => _i218.GetPrivilegesUsecase(gh<_i97.PrivilegeRepository>()));
  gh.factory<_i219.UpdatePrivilegeUsecase>(
      () => _i219.UpdatePrivilegeUsecase(gh<_i97.PrivilegeRepository>()));
  gh.factory<_i220.AttachmentsRowCubit>(() => _i220.AttachmentsRowCubit(
        gh<_i167.GetClientSupportFilesUsecase>(),
        gh<_i166.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i221.AddCommentUsecase>(
      () => _i221.AddCommentUsecase(gh<_i120.CompanyRepository>()));
  gh.factory<_i222.GetCommentUsecase>(
      () => _i222.GetCommentUsecase(gh<_i120.CompanyRepository>()));
  gh.factory<_i223.DelayInstallReportsCubit>(() =>
      _i223.DelayInstallReportsCubit(
          gh<_i205.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i224.GetRegionsByIdCountryUseCase>(
      () => _i224.GetRegionsByIdCountryUseCase(gh<_i151.RegionsRepository>()));
  gh.lazySingleton<_i225.PrivilegeCubit>(() => _i225.PrivilegeCubit(
        gh<_i217.GetLevelsUsecase>(),
        gh<_i218.GetPrivilegesUsecase>(),
        gh<_i219.UpdatePrivilegeUsecase>(),
        gh<_i216.AddLevelUsecase>(),
      ));
  gh.factory<_i226.AdvancedCofigsCubit>(() => _i226.AdvancedCofigsCubit(
        gh<_i184.GetAdvancedConfigsUsecase>(),
        gh<_i183.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i227.ParticipateListBloc>(() => _i227.ParticipateListBloc(
        gh<_i160.ParticipateListUsecase>(),
        gh<_i154.AddParticipateUserUsecase>(),
        gh<_i155.EditParticipateUserUsecase>(),
        gh<_i157.ParticipateClientListUsecase>(),
        gh<_i159.ParticipateInvoiceListUsecase>(),
        gh<_i156.GetInvoiceByIdUsecase>(),
        gh<_i158.ParticipateCommentListUsecase>(),
        gh<_i153.AddParticipateCommentUsecase>(),
        gh<_i161.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i228.ClientsTransferApprovalsCubit>(() =>
      _i228.ClientsTransferApprovalsCubit(
          gh<_i207.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i229.GeneralCofigsCubit>(() => _i229.GeneralCofigsCubit(
        gh<_i202.GetGeneralConfigsUsecase>(),
        gh<_i201.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i230.GetClientsDebtsUsecase>(
      () => _i230.GetClientsDebtsUsecase(gh<_i135.ClientsDebtsRepo>()));
  gh.lazySingleton<_i231.AddAgentCommentUsecase>(() =>
      _i231.AddAgentCommentUsecase(gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i232.DoneTrainingUsecase>(() =>
      _i232.DoneTrainingUsecase(gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i233.GetAgentUsecase>(
      () => _i233.GetAgentUsecase(gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i234.GetAgentClientListUsecase>(() =>
      _i234.GetAgentClientListUsecase(
          gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i235.GetAgentCommentsListUsecase>(() =>
      _i235.GetAgentCommentsListUsecase(
          gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i236.GetAgentDatesListUsecase>(() =>
      _i236.GetAgentDatesListUsecase(
          gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i237.GetAgentInvoiceListUsecase>(() =>
      _i237.GetAgentInvoiceListUsecase(
          gh<_i125.AgentsDistributorsProfileRepo>()));
  gh.factory<_i238.AddRejectReasonsUsecase>(() =>
      _i238.AddRejectReasonsUsecase(gh<_i147.ManageWithdrawalsRepository>()));
  gh.factory<_i239.EditRejectReasonsUsecase>(() =>
      _i239.EditRejectReasonsUsecase(gh<_i147.ManageWithdrawalsRepository>()));
  gh.factory<_i240.GetRejectReasonsUsecase>(() =>
      _i240.GetRejectReasonsUsecase(gh<_i147.ManageWithdrawalsRepository>()));
  gh.factory<_i241.GetUserSeriesUsecase>(() =>
      _i241.GetUserSeriesUsecase(gh<_i147.ManageWithdrawalsRepository>()));
  gh.factory<_i242.GetWithdrawnDetailsUsecase>(() =>
      _i242.GetWithdrawnDetailsUsecase(
          gh<_i147.ManageWithdrawalsRepository>()));
  gh.factory<_i243.SetApproveSeriesUsecase>(() =>
      _i243.SetApproveSeriesUsecase(gh<_i147.ManageWithdrawalsRepository>()));
  gh.factory<_i244.UpdateSeriesUsecase>(
      () => _i244.UpdateSeriesUsecase(gh<_i147.ManageWithdrawalsRepository>()));
  gh.singleton<_i245.AppManagerCubit>(
      () => _i245.AppManagerCubit(gh<_i199.GetVersionUseCase>()));
  gh.factory<_i246.RegionsCubit>(
      () => _i246.RegionsCubit(gh<_i224.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i247.GetWaitingAgentsUsecase>(
      () => _i247.GetWaitingAgentsUsecase(gh<_i169.WaitingAgentsRepo>()));
  gh.factory<_i248.UsersCubit>(() => _i248.UsersCubit(
        gh<_i144.GetUsersUsecase>(),
        gh<_i58.ActionUserUsecase>(),
        gh<_i180.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i143.GetManagesForUserUsecase>(),
        gh<_i142.GetLevelsForUserUsecase>(),
        gh<_i141.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i249.CommunicationListBloc>(() =>
      _i249.CommunicationListBloc(gh<_i163.GetCommunicationListUsecase>()));
  gh.factory<_i250.AgentsDistributorsCubit>(() => _i250.AgentsDistributorsCubit(
        gh<_i172.GetAgentsAndDistributorsUseCase>(),
        gh<_i171.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i251.ExceededClientsCubit>(() => _i251.ExceededClientsCubit(
        gh<_i181.ExceededClientsUseCase>(),
        gh<_i182.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i252.LatestClientsUpdatesCubit>(() =>
      _i252.LatestClientsUpdatesCubit(gh<_i208.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i253.CancelScheduleUsecase>(
      () => _i253.CancelScheduleUsecase(gh<_i185.DatesTableRepo>()));
  gh.lazySingleton<_i254.ChangeDateToDonUsecase>(
      () => _i254.ChangeDateToDonUsecase(gh<_i185.DatesTableRepo>()));
  gh.lazySingleton<_i255.GetDateInstallationUsecase>(
      () => _i255.GetDateInstallationUsecase(gh<_i185.DatesTableRepo>()));
  gh.lazySingleton<_i256.GetInvoicesByClientForDateUsecase>(() =>
      _i256.GetInvoicesByClientForDateUsecase(gh<_i185.DatesTableRepo>()));
  gh.lazySingleton<_i257.GetSubscribedClientsUsecase>(
      () => _i257.GetSubscribedClientsUsecase(gh<_i185.DatesTableRepo>()));
  gh.lazySingleton<_i258.RescheduleDateUsecase>(
      () => _i258.RescheduleDateUsecase(gh<_i185.DatesTableRepo>()));
  gh.lazySingleton<_i259.ReturnScheduleVisitToOpenUsecase>(
      () => _i259.ReturnScheduleVisitToOpenUsecase(gh<_i185.DatesTableRepo>()));
  gh.factory<_i260.AgentsDistributorsProfileBloc>(
      () => _i260.AgentsDistributorsProfileBloc(
            gh<_i234.GetAgentClientListUsecase>(),
            gh<_i237.GetAgentInvoiceListUsecase>(),
            gh<_i156.GetInvoiceByIdUsecase>(),
            gh<_i235.GetAgentCommentsListUsecase>(),
            gh<_i231.AddAgentCommentUsecase>(),
            gh<_i232.DoneTrainingUsecase>(),
            gh<_i211.AddAgentDateUseCase>(),
            gh<_i236.GetAgentDatesListUsecase>(),
            gh<_i206.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i261.DatesTableCubit>(() => _i261.DatesTableCubit(
        gh<_i255.GetDateInstallationUsecase>(),
        gh<_i258.RescheduleDateUsecase>(),
        gh<_i254.ChangeDateToDonUsecase>(),
        gh<_i253.CancelScheduleUsecase>(),
        gh<_i259.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i257.GetSubscribedClientsUsecase>(),
        gh<_i256.GetInvoicesByClientForDateUsecase>(),
        gh<_i127.AddDateInstallUsecase>(),
      ));
  gh.factory<_i262.CompanyCubit>(() => _i262.CompanyCubit(
        gh<_i222.GetCommentUsecase>(),
        gh<_i221.AddCommentUsecase>(),
      ));
  gh.factory<_i263.ClientsDebtsCubit>(
      () => _i263.ClientsDebtsCubit(gh<_i230.GetClientsDebtsUsecase>()));
  gh.factory<_i264.ManageWithdrawalsCubit>(() => _i264.ManageWithdrawalsCubit(
        gh<_i241.GetUserSeriesUsecase>(),
        gh<_i244.UpdateSeriesUsecase>(),
        gh<_i144.GetUsersUsecase>(),
        gh<_i175.GetWithdrawalsInvoicesUsecase>(),
        gh<_i176.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i243.SetApproveSeriesUsecase>(),
        gh<_i242.GetWithdrawnDetailsUsecase>(),
        gh<_i238.AddRejectReasonsUsecase>(),
        gh<_i240.GetRejectReasonsUsecase>(),
        gh<_i239.EditRejectReasonsUsecase>(),
        gh<_i174.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i265.WaitingAgentsCubit>(
      () => _i265.WaitingAgentsCubit(gh<_i247.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i266.AppModule {}
