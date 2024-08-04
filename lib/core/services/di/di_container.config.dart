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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i30;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i99;
import '../../../features/app/domain/repositories/app_repository.dart' as _i98;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i194;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i240;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i54;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i76;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i89;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i88;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i109;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i110;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i111;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i112;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i113;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i209;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i18;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i22;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i114;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i168;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i25;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i41;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i40;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i69;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i70;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i71;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i73;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i72;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i74;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i195;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i87;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i75;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i31;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i135;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i134;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i158;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i244;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i38;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i67;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i66;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i68;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i133;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i63;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i105;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i104;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i123;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i124;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i125;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i126;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i127;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i128;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i129;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i205;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i92;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i147;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i146;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i219;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i241;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i39;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i78;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i77;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i178;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i179;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i221;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i49;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i116;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i115;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i196;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i197;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i224;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i32;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i95;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i94;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i211;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i212;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i213;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i214;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i220;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i26;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i48;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i47;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i57;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i136;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i137;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i138;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i139;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i243;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i29;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i143;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i142;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i233;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i234;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i169;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i235;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i236;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i171;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i170;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i237;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i238;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i239;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i259;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i23;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i132;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i131;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i225;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i258;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i27;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i160;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i159;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i202;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i223;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i24;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i51;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i50;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i85;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i102;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i16;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i53;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i52;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i64;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i157;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i33;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i120;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i119;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i182;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i183;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i184;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i161;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i185;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i189;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i162;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i186;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i187;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i188;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i190;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i191;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i192;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i193;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i207;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i34;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i118;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i117;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i216;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i217;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i257;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i28;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i56;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i55;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i176;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i177;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i246;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i65;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i82;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i81;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i130;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i108;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i210;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i37;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i62;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i61;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i203;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i247;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i17;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i60;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i86;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i101;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i122;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i145;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i100;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i121;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i144;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i226;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i206;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i198;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i166;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i201;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i227;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i228;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i229;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i230;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i232;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i167;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i199;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i208;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i255;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i245;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i35;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i107;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i106;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i140;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i141;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i163;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i20;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i80;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i79;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i148;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i149;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i156;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i151;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i152;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i153;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i222;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i90;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i181;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i180;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i248;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i249;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i250;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i251;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i252;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i253;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i254;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i256;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i45;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i44;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i91;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i103;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i19;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i97;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i96;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i200;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i218;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i43;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i42;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i46;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i83;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i84;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i165;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i164;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i242;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i260;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i36;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i59;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i58;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i172;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i173;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i174;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i175;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i204;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i215;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i93;
import 'di_container.dart' as _i261;

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
  gh.lazySingleton<_i25.TicketsDataSource>(
      () => _i25.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i26.UsersDatasource>(
      () => _i26.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i27.ClientsTransferApprovalsDatasource>(
      () => _i27.ClientsTransferApprovalsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i28.ExceededClientsDatasource>(
      () => _i28.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i29.ManageWithdrawalsDatasource>(
      () => _i29.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i30.AppDatasource>(
      () => _i30.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i31.CommunicationListDatasource>(
      () => _i31.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i32.PrivilegeDatasource>(
      () => _i32.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i33.ClientsListDatasource>(
      () => _i33.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i34.CommentCompanyDatasource>(
      () => _i34.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i35.LinkDatasource>(
      () => _i35.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i36.TaskDatasource>(
      () => _i36.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i37.LatestClientsUpdatesDatasource>(
      () => _i37.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i38.CitiesDatasource>(
      () => _i38.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i39.AdvancedConfigsDatasource>(
      () => _i39.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i40.TicketsRepo>(
      () => _i41.TicketsRepoImpl(gh<_i25.TicketsDataSource>()));
  gh.lazySingleton<_i42.SupportClientsAcceptRepository>(() =>
      _i43.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i44.DelayAfterInstallRepo>(() =>
      _i45.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i46.GetSupportClientsAcceptUseCase>(() =>
      _i46.GetSupportClientsAcceptUseCase(
          gh<_i42.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i47.UsersRepository>(
      () => _i48.UsersRepositoryImpl(gh<_i26.UsersDatasource>()));
  gh.lazySingleton<_i49.GeneralConfigsDatasource>(
      () => _i49.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i50.FinancePendingRepo>(
      () => _i51.FinancePendingRepoImpl(gh<_i24.FinancePendingDatasource>()));
  gh.lazySingleton<_i52.PendingInvoicesRepo>(
      () => _i53.PendingInvoicesRepoImpl(gh<_i16.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i54.LoginLocalDataSource>(() =>
      _i54.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i55.ExceededClientsRepo>(
      () => _i56.ExceededClientsRepoImpl(gh<_i28.ExceededClientsDatasource>()));
  gh.factory<_i57.ActionUserUsecase>(
      () => _i57.ActionUserUsecase(gh<_i47.UsersRepository>()));
  gh.factory<_i58.TaskRepository>(
      () => _i59.TaskRepositoryImpl(gh<_i36.TaskDatasource>()));
  gh.lazySingleton<_i60.AgentsDistributorsDataSource>(
      () => _i60.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i61.LatestClientsUpdatesRepository>(() =>
      _i62.LatestClientsUpdatesRepositoryImpl(
          gh<_i37.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i63.SupportTabDataSource>(
      () => _i63.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i64.GetPendingInvoicesUsecase>(
      () => _i64.GetPendingInvoicesUsecase(gh<_i52.PendingInvoicesRepo>()));
  gh.lazySingleton<_i65.InvoicesTabDataSource>(
      () => _i65.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i66.CitiesRepository>(
      () => _i67.CitiesRepositoryImpl(gh<_i38.CitiesDatasource>()));
  gh.lazySingleton<_i68.GetCitiesUseCase>(
      () => _i68.GetCitiesUseCase(gh<_i66.CitiesRepository>()));
  gh.lazySingleton<_i69.AddTicketUseCase>(
      () => _i69.AddTicketUseCase(gh<_i40.TicketsRepo>()));
  gh.lazySingleton<_i70.EditTicketTypeUseCase>(
      () => _i70.EditTicketTypeUseCase(gh<_i40.TicketsRepo>()));
  gh.lazySingleton<_i71.GetClientTicketsUseCase>(
      () => _i71.GetClientTicketsUseCase(gh<_i40.TicketsRepo>()));
  gh.lazySingleton<_i72.GetTicketsUseCase>(
      () => _i72.GetTicketsUseCase(gh<_i40.TicketsRepo>()));
  gh.lazySingleton<_i73.GetTicketByIdUseCase>(
      () => _i73.GetTicketByIdUseCase(gh<_i40.TicketsRepo>()));
  gh.lazySingleton<_i74.TransferTicketUseCase>(
      () => _i74.TransferTicketUseCase(gh<_i40.TicketsRepo>()));
  gh.factory<_i75.TicketsCubit>(() => _i75.TicketsCubit(
        gh<_i72.GetTicketsUseCase>(),
        gh<_i73.GetTicketByIdUseCase>(),
        gh<_i71.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i76.LoginRemoteDataSource>(
      () => _i76.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i77.AdvancedConfigsRepository>(() =>
      _i78.AdvancedConfigsRepositoryImpl(gh<_i39.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i79.ParticipateListRepository>(() =>
      _i80.ParticipateListRepositoryImpl(
          gh<_i20.ParticipatesListDatasource>()));
  gh.lazySingleton<_i81.InvoicesSectionRepo>(
      () => _i82.InvoicesTabRepoImpl(gh<_i65.InvoicesTabDataSource>()));
  gh.factory<_i83.SupportClientsAcceptCubit>(() =>
      _i83.SupportClientsAcceptCubit(
          gh<_i46.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i84.WaitingAgentsDataSource>(
      () => _i84.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i85.GetFinancePendingInvoicesUsecase>(() =>
      _i85.GetFinancePendingInvoicesUsecase(gh<_i50.FinancePendingRepo>()));
  gh.lazySingleton<_i86.AgentsDistributorsProfileDataSource>(() =>
      _i86.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i87.EditTicketCubit>(() => _i87.EditTicketCubit(
        gh<_i70.EditTicketTypeUseCase>(),
        gh<_i74.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i88.LoginRepo>(() => _i89.LoginRepoImpl(
        gh<_i76.LoginRemoteDataSource>(),
        gh<_i54.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i90.DatesTableDataSource>(
      () => _i90.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i91.GetDelayAfterInstallUseCase>(
      () => _i91.GetDelayAfterInstallUseCase(gh<_i44.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i92.RegionsDatasource>(
      () => _i92.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i93.LocationServices>(
      () => _i93.LocationServices(gh<_i8.Location>()));
  gh.factory<_i94.PrivilegeRepository>(
      () => _i95.PrivilegeRepositoryImpl(gh<_i32.PrivilegeDatasource>()));
  gh.lazySingleton<_i96.DelayInstallReportsRepo>(() =>
      _i97.DelayInstallReportsRepoImpl(
          gh<_i19.DelayInstallReportsDatasource>()));
  gh.factory<_i98.AppRepository>(
      () => _i99.AppRepositoryImpl(gh<_i30.AppDatasource>()));
  gh.lazySingleton<_i100.AgentsDistributorsActionsRepo>(() =>
      _i101.AgentsDistributorsActionsRepoImpl(
          gh<_i17.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i102.FinancePendingCubit>(() =>
      _i102.FinancePendingCubit(gh<_i85.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i103.DelayAfterInstallCubit>(() =>
      _i103.DelayAfterInstallCubit(gh<_i91.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i104.SupportTabRepo>(
      () => _i105.SupportTabRepoImpl(gh<_i63.SupportTabDataSource>()));
  gh.factory<_i106.LinksImportantRepository>(
      () => _i107.LinkRepositoryImpl(gh<_i35.LinkDatasource>()));
  gh.lazySingleton<_i108.GetInvoicesByPrivilegesUsecase>(() =>
      _i108.GetInvoicesByPrivilegesUsecase(gh<_i81.InvoicesSectionRepo>()));
  gh.lazySingleton<_i109.CacheTokenUsecase>(
      () => _i109.CacheTokenUsecase(gh<_i88.LoginRepo>()));
  gh.lazySingleton<_i110.GetTokenUsecase>(
      () => _i110.GetTokenUsecase(gh<_i88.LoginRepo>()));
  gh.lazySingleton<_i111.LoginUsecase>(
      () => _i111.LoginUsecase(gh<_i88.LoginRepo>()));
  gh.lazySingleton<_i112.ValidateTokenUsecase>(
      () => _i112.ValidateTokenUsecase(gh<_i88.LoginRepo>()));
  gh.lazySingleton<_i113.VerifyOtpUsecase>(
      () => _i113.VerifyOtpUsecase(gh<_i88.LoginRepo>()));
  gh.lazySingleton<_i114.GetClientsAcceptUseCase>(
      () => _i114.GetClientsAcceptUseCase(gh<_i21.ClientsAcceptRepository>()));
  gh.lazySingleton<_i115.GeneralConfigsRepository>(() =>
      _i116.GeneralConfigsRepositoryImpl(gh<_i49.GeneralConfigsDatasource>()));
  gh.factory<_i117.CompanyRepository>(
      () => _i118.CompanyRepositoryImpl(gh<_i34.CommentCompanyDatasource>()));
  gh.factory<_i119.ClientsListRepository>(
      () => _i120.ClientsListRepositoryImpl(gh<_i33.ClientsListDatasource>()));
  gh.lazySingleton<_i121.AgentsDistributorsProfileRepo>(() =>
      _i122.AgentsDistributorsProfileRepoImpl(
          gh<_i86.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i123.AddDateInstallUsecase>(
      () => _i123.AddDateInstallUsecase(gh<_i104.SupportTabRepo>()));
  gh.lazySingleton<_i124.CancelDateInstallUsecase>(
      () => _i124.CancelDateInstallUsecase(gh<_i104.SupportTabRepo>()));
  gh.lazySingleton<_i125.GetInvoiceByClientUsecase>(
      () => _i125.GetInvoiceByClientUsecase(gh<_i104.SupportTabRepo>()));
  gh.lazySingleton<_i126.ReceiveDeviceUsecase>(
      () => _i126.ReceiveDeviceUsecase(gh<_i104.SupportTabRepo>()));
  gh.lazySingleton<_i127.ReturnInvoiceApproveUsecase>(
      () => _i127.ReturnInvoiceApproveUsecase(gh<_i104.SupportTabRepo>()));
  gh.lazySingleton<_i128.SetDateDoneUsecase>(
      () => _i128.SetDateDoneUsecase(gh<_i104.SupportTabRepo>()));
  gh.lazySingleton<_i129.SetReadyInstallUsecase>(
      () => _i129.SetReadyInstallUsecase(gh<_i104.SupportTabRepo>()));
  gh.lazySingleton<_i130.GetAllUsersUseCase>(
      () => _i130.GetAllUsersUseCase(gh<_i81.InvoicesSectionRepo>()));
  gh.lazySingleton<_i131.ClientsDebtsRepo>(
      () => _i132.ClientsDebtsRepoImpl(gh<_i23.ClientsDebtsDatasource>()));
  gh.singleton<_i133.CitiesCubit>(
      () => _i133.CitiesCubit(gh<_i68.GetCitiesUseCase>()));
  gh.factory<_i134.CommunicationListRepository>(() =>
      _i135.CommunicationListRepositoryImpl(
          gh<_i31.CommunicationListDatasource>()));
  gh.lazySingleton<_i136.GetBranchesForUserUsecase>(
      () => _i136.GetBranchesForUserUsecase(gh<_i47.UsersRepository>()));
  gh.lazySingleton<_i137.GetLevelsForUserUsecase>(
      () => _i137.GetLevelsForUserUsecase(gh<_i47.UsersRepository>()));
  gh.lazySingleton<_i138.GetManagesForUserUsecase>(
      () => _i138.GetManagesForUserUsecase(gh<_i47.UsersRepository>()));
  gh.factory<_i139.GetUsersUsecase>(
      () => _i139.GetUsersUsecase(gh<_i47.UsersRepository>()));
  gh.factory<_i140.ActionLinkUsecase>(
      () => _i140.ActionLinkUsecase(gh<_i106.LinksImportantRepository>()));
  gh.factory<_i141.GetLinkUsecase>(
      () => _i141.GetLinkUsecase(gh<_i106.LinksImportantRepository>()));
  gh.lazySingleton<_i142.ManageWithdrawalsRepository>(() =>
      _i143.ManageWithdrawalsRepositoryImpl(
          gh<_i29.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i144.AgentsDistributorsRepo>(() =>
      _i145.AgentsDistributorsRepoImpl(
          gh<_i60.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i146.RegionsRepository>(
      () => _i147.RegionsRepositoryImpl(gh<_i92.RegionsDatasource>()));
  gh.factory<_i148.AddParticipateCommentUsecase>(() =>
      _i148.AddParticipateCommentUsecase(gh<_i79.ParticipateListRepository>()));
  gh.factory<_i149.AddParticipateUserUsecase>(() =>
      _i149.AddParticipateUserUsecase(gh<_i79.ParticipateListRepository>()));
  gh.factory<_i150.EditParticipateUserUsecase>(() =>
      _i150.EditParticipateUserUsecase(gh<_i79.ParticipateListRepository>()));
  gh.factory<_i151.GetInvoiceByIdUsecase>(
      () => _i151.GetInvoiceByIdUsecase(gh<_i79.ParticipateListRepository>()));
  gh.factory<_i152.ParticipateClientListUsecase>(() =>
      _i152.ParticipateClientListUsecase(gh<_i79.ParticipateListRepository>()));
  gh.factory<_i153.ParticipateCommentListUsecase>(() =>
      _i153.ParticipateCommentListUsecase(
          gh<_i79.ParticipateListRepository>()));
  gh.factory<_i154.ParticipateInvoiceListUsecase>(() =>
      _i154.ParticipateInvoiceListUsecase(
          gh<_i79.ParticipateListRepository>()));
  gh.factory<_i155.ParticipateListUsecase>(
      () => _i155.ParticipateListUsecase(gh<_i79.ParticipateListRepository>()));
  gh.lazySingleton<_i156.ChangeParticipateStatusUsecase>(() =>
      _i156.ChangeParticipateStatusUsecase(
          gh<_i79.ParticipateListRepository>()));
  gh.factory<_i157.PendingInvoicesCubit>(
      () => _i157.PendingInvoicesCubit(gh<_i64.GetPendingInvoicesUsecase>()));
  gh.factory<_i158.GetCommunicationListUsecase>(() =>
      _i158.GetCommunicationListUsecase(
          gh<_i134.CommunicationListRepository>()));
  gh.lazySingleton<_i159.ClientsTransferApprovalsRepo>(() =>
      _i160.ClientsTransferApprovalsRepoImpl(
          gh<_i27.ClientsTransferApprovalsDatasource>()));
  gh.lazySingleton<_i161.CrudClientSupportFilesUsecase>(() =>
      _i161.CrudClientSupportFilesUsecase(
          repository: gh<_i119.ClientsListRepository>()));
  gh.lazySingleton<_i162.GetClientSupportFilesUsecase>(() =>
      _i162.GetClientSupportFilesUsecase(
          repository: gh<_i119.ClientsListRepository>()));
  gh.factory<_i163.LinkCubit>(() => _i163.LinkCubit(
        gh<_i141.GetLinkUsecase>(),
        gh<_i140.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i164.WaitingAgentsRepo>(
      () => _i165.WaitingAgentsRepoImpl(gh<_i84.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i166.ChangeStateAgentUseCase>(
      () => _i166.ChangeStateAgentUseCase(gh<_i144.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i167.GetAgentsAndDistributorsUseCase>(() =>
      _i167.GetAgentsAndDistributorsUseCase(
          gh<_i144.AgentsDistributorsRepo>()));
  gh.factory<_i168.ClientsAcceptCubit>(
      () => _i168.ClientsAcceptCubit(gh<_i114.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i169.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i169.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i142.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i170.GetWithdrawalsInvoicesUsecase>(() =>
      _i170.GetWithdrawalsInvoicesUsecase(
          gh<_i142.ManageWithdrawalsRepository>()));
  gh.factory<_i171.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i171.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i142.ManageWithdrawalsRepository>()));
  gh.factory<_i172.AddTaskUsecase>(
      () => _i172.AddTaskUsecase(gh<_i58.TaskRepository>()));
  gh.factory<_i173.ChangeStatusTaskUsecase>(
      () => _i173.ChangeStatusTaskUsecase(gh<_i58.TaskRepository>()));
  gh.factory<_i174.FilterTaskUsecase>(
      () => _i174.FilterTaskUsecase(gh<_i58.TaskRepository>()));
  gh.factory<_i175.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i175.GetUsersByDepartmentAndRegionUsecase(gh<_i58.TaskRepository>()));
  gh.lazySingleton<_i176.ExceededClientsUseCase>(
      () => _i176.ExceededClientsUseCase(gh<_i55.ExceededClientsRepo>()));
  gh.lazySingleton<_i177.TransferExceededClientsUseCase>(() =>
      _i177.TransferExceededClientsUseCase(gh<_i55.ExceededClientsRepo>()));
  gh.lazySingleton<_i178.EditAdvancedConfigsUsecase>(() =>
      _i178.EditAdvancedConfigsUsecase(gh<_i77.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i179.GetAdvancedConfigsUsecase>(() =>
      _i179.GetAdvancedConfigsUsecase(gh<_i77.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i180.DatesTableRepo>(
      () => _i181.DatesTableRepoImpl(gh<_i90.DatesTableDataSource>()));
  gh.factory<_i182.AddClientUserUsecase>(
      () => _i182.AddClientUserUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i183.ApproveRejectClientUsecase>(() =>
      _i183.ApproveRejectClientUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i184.ChangeTypeClientUsecase>(
      () => _i184.ChangeTypeClientUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i185.EditClientUserUsecase>(
      () => _i185.EditClientUserUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i186.GetClientsListByRegionUseCase>(() =>
      _i186.GetClientsListByRegionUseCase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i187.GetClientsListByUserUseCase>(() =>
      _i187.GetClientsListByUserUseCase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i188.GetClientsWithFilterUserUsecase>(() =>
      _i188.GetClientsWithFilterUserUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i189.GetClientMarketingReportUsecase>(() =>
      _i189.GetClientMarketingReportUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i190.GetRecommendedClientsUsecase>(() =>
      _i190.GetRecommendedClientsUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i191.GetSimilarClientsUsecase>(
      () => _i191.GetSimilarClientsUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i192.ReceiveClientUserUsecase>(
      () => _i192.ReceiveClientUserUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i193.TransferClientUserUsecase>(
      () => _i193.TransferClientUserUsecase(gh<_i119.ClientsListRepository>()));
  gh.factory<_i194.GetVersionUseCase>(
      () => _i194.GetVersionUseCase(gh<_i98.AppRepository>()));
  gh.factory<_i195.AddTicketCubit>(
      () => _i195.AddTicketCubit(gh<_i69.AddTicketUseCase>()));
  gh.lazySingleton<_i196.EditGeneralConfigsUsecase>(() =>
      _i196.EditGeneralConfigsUsecase(gh<_i115.GeneralConfigsRepository>()));
  gh.lazySingleton<_i197.GetGeneralConfigsUsecase>(() =>
      _i197.GetGeneralConfigsUsecase(gh<_i115.GeneralConfigsRepository>()));
  gh.lazySingleton<_i198.AddAgentUseCase>(
      () => _i198.AddAgentUseCase(gh<_i100.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i199.UpdateAgentUseCase>(() =>
      _i199.UpdateAgentUseCase(gh<_i100.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i200.GetDelayInstallReportsUseCase>(() =>
      _i200.GetDelayInstallReportsUseCase(gh<_i96.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i201.CrudAgentSupportFilesUsecase>(() =>
      _i201.CrudAgentSupportFilesUsecase(
          gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i202.GetClientsTransferApprovalsUsecase>(() =>
      _i202.GetClientsTransferApprovalsUsecase(
          gh<_i159.ClientsTransferApprovalsRepo>()));
  gh.lazySingleton<_i203.GetLatestClientsUseCase>(() =>
      _i203.GetLatestClientsUseCase(gh<_i61.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i204.TaskCubit>(() => _i204.TaskCubit(
        gh<_i172.AddTaskUsecase>(),
        gh<_i174.FilterTaskUsecase>(),
        gh<_i173.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i205.SupportTabCubit>(() => _i205.SupportTabCubit(
        gh<_i125.GetInvoiceByClientUsecase>(),
        gh<_i123.AddDateInstallUsecase>(),
        gh<_i128.SetDateDoneUsecase>(),
        gh<_i129.SetReadyInstallUsecase>(),
        gh<_i127.ReturnInvoiceApproveUsecase>(),
        gh<_i126.ReceiveDeviceUsecase>(),
        gh<_i124.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i206.AddAgentDateUseCase>(() =>
      _i206.AddAgentDateUseCase(gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.factory<_i207.ClientsListBloc>(() => _i207.ClientsListBloc(
        gh<_i188.GetClientsWithFilterUserUsecase>(),
        gh<_i190.GetRecommendedClientsUsecase>(),
        gh<_i182.AddClientUserUsecase>(),
        gh<_i185.EditClientUserUsecase>(),
        gh<_i184.ChangeTypeClientUsecase>(),
        gh<_i191.GetSimilarClientsUsecase>(),
        gh<_i183.ApproveRejectClientUsecase>(),
        gh<_i161.CrudClientSupportFilesUsecase>(),
        gh<_i162.GetClientSupportFilesUsecase>(),
        gh<_i193.TransferClientUserUsecase>(),
        gh<_i192.ReceiveClientUserUsecase>(),
        gh<_i189.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i208.AgentsDistributorsActionsCubit>(
      () => _i208.AgentsDistributorsActionsCubit(
            gh<_i68.GetCitiesUseCase>(),
            gh<_i198.AddAgentUseCase>(),
            gh<_i199.UpdateAgentUseCase>(),
          ));
  gh.factory<_i209.LoginCubit>(() => _i209.LoginCubit(
        gh<_i111.LoginUsecase>(),
        gh<_i113.VerifyOtpUsecase>(),
        gh<_i109.CacheTokenUsecase>(),
        gh<_i110.GetTokenUsecase>(),
        gh<_i112.ValidateTokenUsecase>(),
      ));
  gh.factory<_i210.InvoicesSectionCubit>(() => _i210.InvoicesSectionCubit(
        gh<_i108.GetInvoicesByPrivilegesUsecase>(),
        gh<_i167.GetAgentsAndDistributorsUseCase>(),
        gh<_i155.ParticipateListUsecase>(),
        gh<_i130.GetAllUsersUseCase>(),
      ));
  gh.factory<_i211.AddLevelUsecase>(
      () => _i211.AddLevelUsecase(gh<_i94.PrivilegeRepository>()));
  gh.factory<_i212.GetLevelsUsecase>(
      () => _i212.GetLevelsUsecase(gh<_i94.PrivilegeRepository>()));
  gh.factory<_i213.GetPrivilegesUsecase>(
      () => _i213.GetPrivilegesUsecase(gh<_i94.PrivilegeRepository>()));
  gh.factory<_i214.UpdatePrivilegeUsecase>(
      () => _i214.UpdatePrivilegeUsecase(gh<_i94.PrivilegeRepository>()));
  gh.factory<_i215.AttachmentsRowCubit>(() => _i215.AttachmentsRowCubit(
        gh<_i162.GetClientSupportFilesUsecase>(),
        gh<_i161.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i216.AddCommentUsecase>(
      () => _i216.AddCommentUsecase(gh<_i117.CompanyRepository>()));
  gh.factory<_i217.GetCommentUsecase>(
      () => _i217.GetCommentUsecase(gh<_i117.CompanyRepository>()));
  gh.factory<_i218.DelayInstallReportsCubit>(() =>
      _i218.DelayInstallReportsCubit(
          gh<_i200.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i219.GetRegionsByIdCountryUseCase>(
      () => _i219.GetRegionsByIdCountryUseCase(gh<_i146.RegionsRepository>()));
  gh.lazySingleton<_i220.PrivilegeCubit>(() => _i220.PrivilegeCubit(
        gh<_i212.GetLevelsUsecase>(),
        gh<_i213.GetPrivilegesUsecase>(),
        gh<_i214.UpdatePrivilegeUsecase>(),
        gh<_i211.AddLevelUsecase>(),
      ));
  gh.factory<_i221.AdvancedCofigsCubit>(() => _i221.AdvancedCofigsCubit(
        gh<_i179.GetAdvancedConfigsUsecase>(),
        gh<_i178.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i222.ParticipateListBloc>(() => _i222.ParticipateListBloc(
        gh<_i155.ParticipateListUsecase>(),
        gh<_i149.AddParticipateUserUsecase>(),
        gh<_i150.EditParticipateUserUsecase>(),
        gh<_i152.ParticipateClientListUsecase>(),
        gh<_i154.ParticipateInvoiceListUsecase>(),
        gh<_i151.GetInvoiceByIdUsecase>(),
        gh<_i153.ParticipateCommentListUsecase>(),
        gh<_i148.AddParticipateCommentUsecase>(),
        gh<_i156.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i223.ClientsTransferApprovalsCubit>(() =>
      _i223.ClientsTransferApprovalsCubit(
          gh<_i202.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i224.GeneralCofigsCubit>(() => _i224.GeneralCofigsCubit(
        gh<_i197.GetGeneralConfigsUsecase>(),
        gh<_i196.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i225.GetClientsDebtsUsecase>(
      () => _i225.GetClientsDebtsUsecase(gh<_i131.ClientsDebtsRepo>()));
  gh.lazySingleton<_i226.AddAgentCommentUsecase>(() =>
      _i226.AddAgentCommentUsecase(gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i227.DoneTrainingUsecase>(() =>
      _i227.DoneTrainingUsecase(gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i228.GetAgentUsecase>(
      () => _i228.GetAgentUsecase(gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i229.GetAgentClientListUsecase>(() =>
      _i229.GetAgentClientListUsecase(
          gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i230.GetAgentCommentsListUsecase>(() =>
      _i230.GetAgentCommentsListUsecase(
          gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i231.GetAgentDatesListUsecase>(() =>
      _i231.GetAgentDatesListUsecase(
          gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i232.GetAgentInvoiceListUsecase>(() =>
      _i232.GetAgentInvoiceListUsecase(
          gh<_i121.AgentsDistributorsProfileRepo>()));
  gh.factory<_i233.AddRejectReasonsUsecase>(() =>
      _i233.AddRejectReasonsUsecase(gh<_i142.ManageWithdrawalsRepository>()));
  gh.factory<_i234.EditRejectReasonsUsecase>(() =>
      _i234.EditRejectReasonsUsecase(gh<_i142.ManageWithdrawalsRepository>()));
  gh.factory<_i235.GetRejectReasonsUsecase>(() =>
      _i235.GetRejectReasonsUsecase(gh<_i142.ManageWithdrawalsRepository>()));
  gh.factory<_i236.GetUserSeriesUsecase>(() =>
      _i236.GetUserSeriesUsecase(gh<_i142.ManageWithdrawalsRepository>()));
  gh.factory<_i237.GetWithdrawnDetailsUsecase>(() =>
      _i237.GetWithdrawnDetailsUsecase(
          gh<_i142.ManageWithdrawalsRepository>()));
  gh.factory<_i238.SetApproveSeriesUsecase>(() =>
      _i238.SetApproveSeriesUsecase(gh<_i142.ManageWithdrawalsRepository>()));
  gh.factory<_i239.UpdateSeriesUsecase>(
      () => _i239.UpdateSeriesUsecase(gh<_i142.ManageWithdrawalsRepository>()));
  gh.singleton<_i240.AppManagerCubit>(
      () => _i240.AppManagerCubit(gh<_i194.GetVersionUseCase>()));
  gh.factory<_i241.RegionsCubit>(
      () => _i241.RegionsCubit(gh<_i219.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i242.GetWaitingAgentsUsecase>(
      () => _i242.GetWaitingAgentsUsecase(gh<_i164.WaitingAgentsRepo>()));
  gh.factory<_i243.UsersCubit>(() => _i243.UsersCubit(
        gh<_i139.GetUsersUsecase>(),
        gh<_i57.ActionUserUsecase>(),
        gh<_i175.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i138.GetManagesForUserUsecase>(),
        gh<_i137.GetLevelsForUserUsecase>(),
        gh<_i136.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i244.CommunicationListBloc>(() =>
      _i244.CommunicationListBloc(gh<_i158.GetCommunicationListUsecase>()));
  gh.factory<_i245.AgentsDistributorsCubit>(() => _i245.AgentsDistributorsCubit(
        gh<_i167.GetAgentsAndDistributorsUseCase>(),
        gh<_i166.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i246.ExceededClientsCubit>(() => _i246.ExceededClientsCubit(
        gh<_i176.ExceededClientsUseCase>(),
        gh<_i177.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i247.LatestClientsUpdatesCubit>(() =>
      _i247.LatestClientsUpdatesCubit(gh<_i203.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i248.CancelScheduleUsecase>(
      () => _i248.CancelScheduleUsecase(gh<_i180.DatesTableRepo>()));
  gh.lazySingleton<_i249.ChangeDateToDonUsecase>(
      () => _i249.ChangeDateToDonUsecase(gh<_i180.DatesTableRepo>()));
  gh.lazySingleton<_i250.GetDateInstallationUsecase>(
      () => _i250.GetDateInstallationUsecase(gh<_i180.DatesTableRepo>()));
  gh.lazySingleton<_i251.GetInvoicesByClientForDateUsecase>(() =>
      _i251.GetInvoicesByClientForDateUsecase(gh<_i180.DatesTableRepo>()));
  gh.lazySingleton<_i252.GetSubscribedClientsUsecase>(
      () => _i252.GetSubscribedClientsUsecase(gh<_i180.DatesTableRepo>()));
  gh.lazySingleton<_i253.RescheduleDateUsecase>(
      () => _i253.RescheduleDateUsecase(gh<_i180.DatesTableRepo>()));
  gh.lazySingleton<_i254.ReturnScheduleVisitToOpenUsecase>(
      () => _i254.ReturnScheduleVisitToOpenUsecase(gh<_i180.DatesTableRepo>()));
  gh.factory<_i255.AgentsDistributorsProfileBloc>(
      () => _i255.AgentsDistributorsProfileBloc(
            gh<_i229.GetAgentClientListUsecase>(),
            gh<_i232.GetAgentInvoiceListUsecase>(),
            gh<_i151.GetInvoiceByIdUsecase>(),
            gh<_i230.GetAgentCommentsListUsecase>(),
            gh<_i226.AddAgentCommentUsecase>(),
            gh<_i227.DoneTrainingUsecase>(),
            gh<_i206.AddAgentDateUseCase>(),
            gh<_i231.GetAgentDatesListUsecase>(),
            gh<_i201.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i256.DatesTableCubit>(() => _i256.DatesTableCubit(
        gh<_i250.GetDateInstallationUsecase>(),
        gh<_i253.RescheduleDateUsecase>(),
        gh<_i249.ChangeDateToDonUsecase>(),
        gh<_i248.CancelScheduleUsecase>(),
        gh<_i254.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i252.GetSubscribedClientsUsecase>(),
        gh<_i251.GetInvoicesByClientForDateUsecase>(),
        gh<_i123.AddDateInstallUsecase>(),
      ));
  gh.factory<_i257.CompanyCubit>(() => _i257.CompanyCubit(
        gh<_i217.GetCommentUsecase>(),
        gh<_i216.AddCommentUsecase>(),
      ));
  gh.factory<_i258.ClientsDebtsCubit>(
      () => _i258.ClientsDebtsCubit(gh<_i225.GetClientsDebtsUsecase>()));
  gh.factory<_i259.ManageWithdrawalsCubit>(() => _i259.ManageWithdrawalsCubit(
        gh<_i236.GetUserSeriesUsecase>(),
        gh<_i239.UpdateSeriesUsecase>(),
        gh<_i139.GetUsersUsecase>(),
        gh<_i170.GetWithdrawalsInvoicesUsecase>(),
        gh<_i171.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i238.SetApproveSeriesUsecase>(),
        gh<_i237.GetWithdrawnDetailsUsecase>(),
        gh<_i233.AddRejectReasonsUsecase>(),
        gh<_i235.GetRejectReasonsUsecase>(),
        gh<_i234.EditRejectReasonsUsecase>(),
        gh<_i169.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i260.WaitingAgentsCubit>(
      () => _i260.WaitingAgentsCubit(gh<_i242.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i261.AppModule {}
