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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i29;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i98;
import '../../../features/app/domain/repositories/app_repository.dart' as _i97;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i191;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i235;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i53;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i75;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i88;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i87;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i108;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i109;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i110;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i111;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i112;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i205;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i18;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i22;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i113;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i165;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i25;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i40;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i39;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i69;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i70;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i72;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i71;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i73;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i192;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i86;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i74;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i30;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i134;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i133;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i157;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i239;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i37;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i66;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i65;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i67;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i132;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i62;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i104;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i103;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i122;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i123;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i124;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i125;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i126;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i127;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i128;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i201;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i91;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i146;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i145;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i215;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i236;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i38;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i77;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i76;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i175;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i176;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i217;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i48;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i115;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i114;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i193;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i194;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i219;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i31;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i94;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i93;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i207;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i208;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i209;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i210;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i216;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i26;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i47;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i46;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i56;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i135;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i136;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i137;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i138;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i238;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i28;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i142;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i141;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i228;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i229;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i166;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i230;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i231;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i168;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i167;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i232;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i233;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i234;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i254;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i23;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i131;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i130;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i220;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i253;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i24;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i50;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i49;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i84;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i101;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i16;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i52;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i51;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i63;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i156;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i32;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i119;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i118;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i179;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i180;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i181;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i158;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i182;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i186;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i159;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i183;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i184;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i185;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i187;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i188;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i189;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i190;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i203;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i33;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i117;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i116;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i212;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i213;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i252;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i27;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i55;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i54;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i173;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i174;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i241;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i64;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i81;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i80;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i129;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i107;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i206;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i36;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i61;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i60;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i199;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i242;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i17;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i59;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i85;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i100;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i121;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i144;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i99;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i120;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i143;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i221;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i202;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i195;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i163;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i198;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i222;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i223;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i224;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i225;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i226;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i227;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i164;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i196;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i204;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i250;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i240;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i34;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i106;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i105;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i139;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i140;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i160;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i20;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i79;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i78;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i147;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i148;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i149;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i151;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i152;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i153;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i218;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i89;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i178;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i177;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i243;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i244;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i245;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i246;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i247;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i248;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i249;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i251;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i44;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i43;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i90;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i102;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i19;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i96;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i95;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i197;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i214;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i42;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i41;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i45;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i82;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i83;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i162;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i161;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i237;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i255;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i35;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i58;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i57;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i169;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i170;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i171;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i172;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i200;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i211;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i92;
import 'di_container.dart' as _i256;

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
  gh.lazySingleton<_i27.ExceededClientsDatasource>(
      () => _i27.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i28.ManageWithdrawalsDatasource>(
      () => _i28.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i29.AppDatasource>(
      () => _i29.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i30.CommunicationListDatasource>(
      () => _i30.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i31.PrivilegeDatasource>(
      () => _i31.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i32.ClientsListDatasource>(
      () => _i32.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i33.CommentCompanyDatasource>(
      () => _i33.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i34.LinkDatasource>(
      () => _i34.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i35.TaskDatasource>(
      () => _i35.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i36.LatestClientsUpdatesDatasource>(
      () => _i36.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i37.CitiesDatasource>(
      () => _i37.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i38.AdvancedConfigsDatasource>(
      () => _i38.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i39.TicketsRepo>(
      () => _i40.TicketsRepoImpl(gh<_i25.TicketsDataSource>()));
  gh.lazySingleton<_i41.SupportClientsAcceptRepository>(() =>
      _i42.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i43.DelayAfterInstallRepo>(() =>
      _i44.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i45.GetSupportClientsAcceptUseCase>(() =>
      _i45.GetSupportClientsAcceptUseCase(
          gh<_i41.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i46.UsersRepository>(
      () => _i47.UsersRepositoryImpl(gh<_i26.UsersDatasource>()));
  gh.lazySingleton<_i48.GeneralConfigsDatasource>(
      () => _i48.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i49.FinancePendingRepo>(
      () => _i50.FinancePendingRepoImpl(gh<_i24.FinancePendingDatasource>()));
  gh.lazySingleton<_i51.PendingInvoicesRepo>(
      () => _i52.PendingInvoicesRepoImpl(gh<_i16.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i53.LoginLocalDataSource>(() =>
      _i53.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i54.ExceededClientsRepo>(
      () => _i55.ExceededClientsRepoImpl(gh<_i27.ExceededClientsDatasource>()));
  gh.factory<_i56.ActionUserUsecase>(
      () => _i56.ActionUserUsecase(gh<_i46.UsersRepository>()));
  gh.factory<_i57.TaskRepository>(
      () => _i58.TaskRepositoryImpl(gh<_i35.TaskDatasource>()));
  gh.lazySingleton<_i59.AgentsDistributorsDataSource>(
      () => _i59.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i60.LatestClientsUpdatesRepository>(() =>
      _i61.LatestClientsUpdatesRepositoryImpl(
          gh<_i36.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i62.SupportTabDataSource>(
      () => _i62.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i63.GetPendingInvoicesUsecase>(
      () => _i63.GetPendingInvoicesUsecase(gh<_i51.PendingInvoicesRepo>()));
  gh.lazySingleton<_i64.InvoicesTabDataSource>(
      () => _i64.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i65.CitiesRepository>(
      () => _i66.CitiesRepositoryImpl(gh<_i37.CitiesDatasource>()));
  gh.lazySingleton<_i67.GetCitiesUseCase>(
      () => _i67.GetCitiesUseCase(gh<_i65.CitiesRepository>()));
  gh.lazySingleton<_i68.AddTicketUseCase>(
      () => _i68.AddTicketUseCase(gh<_i39.TicketsRepo>()));
  gh.lazySingleton<_i69.EditTicketTypeUseCase>(
      () => _i69.EditTicketTypeUseCase(gh<_i39.TicketsRepo>()));
  gh.lazySingleton<_i70.GetClientTicketsUseCase>(
      () => _i70.GetClientTicketsUseCase(gh<_i39.TicketsRepo>()));
  gh.lazySingleton<_i71.GetTicketsUseCase>(
      () => _i71.GetTicketsUseCase(gh<_i39.TicketsRepo>()));
  gh.lazySingleton<_i72.GetTicketByIdUseCase>(
      () => _i72.GetTicketByIdUseCase(gh<_i39.TicketsRepo>()));
  gh.lazySingleton<_i73.TransferTicketUseCase>(
      () => _i73.TransferTicketUseCase(gh<_i39.TicketsRepo>()));
  gh.factory<_i74.TicketsCubit>(() => _i74.TicketsCubit(
        gh<_i71.GetTicketsUseCase>(),
        gh<_i72.GetTicketByIdUseCase>(),
        gh<_i70.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i75.LoginRemoteDataSource>(
      () => _i75.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i76.AdvancedConfigsRepository>(() =>
      _i77.AdvancedConfigsRepositoryImpl(gh<_i38.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i78.ParticipateListRepository>(() =>
      _i79.ParticipateListRepositoryImpl(
          gh<_i20.ParticipatesListDatasource>()));
  gh.lazySingleton<_i80.InvoicesSectionRepo>(
      () => _i81.InvoicesTabRepoImpl(gh<_i64.InvoicesTabDataSource>()));
  gh.factory<_i82.SupportClientsAcceptCubit>(() =>
      _i82.SupportClientsAcceptCubit(
          gh<_i45.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i83.WaitingAgentsDataSource>(
      () => _i83.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i84.GetFinancePendingInvoicesUsecase>(() =>
      _i84.GetFinancePendingInvoicesUsecase(gh<_i49.FinancePendingRepo>()));
  gh.lazySingleton<_i85.AgentsDistributorsProfileDataSource>(() =>
      _i85.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i86.EditTicketCubit>(() => _i86.EditTicketCubit(
        gh<_i69.EditTicketTypeUseCase>(),
        gh<_i73.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i87.LoginRepo>(() => _i88.LoginRepoImpl(
        gh<_i75.LoginRemoteDataSource>(),
        gh<_i53.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i89.DatesTableDataSource>(
      () => _i89.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i90.GetDelayAfterInstallUseCase>(
      () => _i90.GetDelayAfterInstallUseCase(gh<_i43.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i91.RegionsDatasource>(
      () => _i91.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i92.LocationServices>(
      () => _i92.LocationServices(gh<_i8.Location>()));
  gh.factory<_i93.PrivilegeRepository>(
      () => _i94.PrivilegeRepositoryImpl(gh<_i31.PrivilegeDatasource>()));
  gh.lazySingleton<_i95.DelayInstallReportsRepo>(() =>
      _i96.DelayInstallReportsRepoImpl(
          gh<_i19.DelayInstallReportsDatasource>()));
  gh.factory<_i97.AppRepository>(
      () => _i98.AppRepositoryImpl(gh<_i29.AppDatasource>()));
  gh.lazySingleton<_i99.AgentsDistributorsActionsRepo>(() =>
      _i100.AgentsDistributorsActionsRepoImpl(
          gh<_i17.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i101.FinancePendingCubit>(() =>
      _i101.FinancePendingCubit(gh<_i84.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i102.DelayAfterInstallCubit>(() =>
      _i102.DelayAfterInstallCubit(gh<_i90.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i103.SupportTabRepo>(
      () => _i104.SupportTabRepoImpl(gh<_i62.SupportTabDataSource>()));
  gh.factory<_i105.LinksImportantRepository>(
      () => _i106.LinkRepositoryImpl(gh<_i34.LinkDatasource>()));
  gh.lazySingleton<_i107.GetInvoicesByPrivilegesUsecase>(() =>
      _i107.GetInvoicesByPrivilegesUsecase(gh<_i80.InvoicesSectionRepo>()));
  gh.lazySingleton<_i108.CacheTokenUsecase>(
      () => _i108.CacheTokenUsecase(gh<_i87.LoginRepo>()));
  gh.lazySingleton<_i109.GetTokenUsecase>(
      () => _i109.GetTokenUsecase(gh<_i87.LoginRepo>()));
  gh.lazySingleton<_i110.LoginUsecase>(
      () => _i110.LoginUsecase(gh<_i87.LoginRepo>()));
  gh.lazySingleton<_i111.ValidateTokenUsecase>(
      () => _i111.ValidateTokenUsecase(gh<_i87.LoginRepo>()));
  gh.lazySingleton<_i112.VerifyOtpUsecase>(
      () => _i112.VerifyOtpUsecase(gh<_i87.LoginRepo>()));
  gh.lazySingleton<_i113.GetClientsAcceptUseCase>(
      () => _i113.GetClientsAcceptUseCase(gh<_i21.ClientsAcceptRepository>()));
  gh.lazySingleton<_i114.GeneralConfigsRepository>(() =>
      _i115.GeneralConfigsRepositoryImpl(gh<_i48.GeneralConfigsDatasource>()));
  gh.factory<_i116.CompanyRepository>(
      () => _i117.CompanyRepositoryImpl(gh<_i33.CommentCompanyDatasource>()));
  gh.factory<_i118.ClientsListRepository>(
      () => _i119.ClientsListRepositoryImpl(gh<_i32.ClientsListDatasource>()));
  gh.lazySingleton<_i120.AgentsDistributorsProfileRepo>(() =>
      _i121.AgentsDistributorsProfileRepoImpl(
          gh<_i85.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i122.AddDateInstallUsecase>(
      () => _i122.AddDateInstallUsecase(gh<_i103.SupportTabRepo>()));
  gh.lazySingleton<_i123.CancelDateInstallUsecase>(
      () => _i123.CancelDateInstallUsecase(gh<_i103.SupportTabRepo>()));
  gh.lazySingleton<_i124.GetInvoiceByClientUsecase>(
      () => _i124.GetInvoiceByClientUsecase(gh<_i103.SupportTabRepo>()));
  gh.lazySingleton<_i125.ReceiveDeviceUsecase>(
      () => _i125.ReceiveDeviceUsecase(gh<_i103.SupportTabRepo>()));
  gh.lazySingleton<_i126.ReturnInvoiceApproveUsecase>(
      () => _i126.ReturnInvoiceApproveUsecase(gh<_i103.SupportTabRepo>()));
  gh.lazySingleton<_i127.SetDateDoneUsecase>(
      () => _i127.SetDateDoneUsecase(gh<_i103.SupportTabRepo>()));
  gh.lazySingleton<_i128.SetReadyInstallUsecase>(
      () => _i128.SetReadyInstallUsecase(gh<_i103.SupportTabRepo>()));
  gh.lazySingleton<_i129.GetAllUsersUseCase>(
      () => _i129.GetAllUsersUseCase(gh<_i80.InvoicesSectionRepo>()));
  gh.lazySingleton<_i130.ClientsDebtsRepo>(
      () => _i131.ClientsDebtsRepoImpl(gh<_i23.ClientsDebtsDatasource>()));
  gh.singleton<_i132.CitiesCubit>(
      () => _i132.CitiesCubit(gh<_i67.GetCitiesUseCase>()));
  gh.factory<_i133.CommunicationListRepository>(() =>
      _i134.CommunicationListRepositoryImpl(
          gh<_i30.CommunicationListDatasource>()));
  gh.lazySingleton<_i135.GetBranchesForUserUsecase>(
      () => _i135.GetBranchesForUserUsecase(gh<_i46.UsersRepository>()));
  gh.lazySingleton<_i136.GetLevelsForUserUsecase>(
      () => _i136.GetLevelsForUserUsecase(gh<_i46.UsersRepository>()));
  gh.lazySingleton<_i137.GetManagesForUserUsecase>(
      () => _i137.GetManagesForUserUsecase(gh<_i46.UsersRepository>()));
  gh.factory<_i138.GetUsersUsecase>(
      () => _i138.GetUsersUsecase(gh<_i46.UsersRepository>()));
  gh.factory<_i139.ActionLinkUsecase>(
      () => _i139.ActionLinkUsecase(gh<_i105.LinksImportantRepository>()));
  gh.factory<_i140.GetLinkUsecase>(
      () => _i140.GetLinkUsecase(gh<_i105.LinksImportantRepository>()));
  gh.lazySingleton<_i141.ManageWithdrawalsRepository>(() =>
      _i142.ManageWithdrawalsRepositoryImpl(
          gh<_i28.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i143.AgentsDistributorsRepo>(() =>
      _i144.AgentsDistributorsRepoImpl(
          gh<_i59.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i145.RegionsRepository>(
      () => _i146.RegionsRepositoryImpl(gh<_i91.RegionsDatasource>()));
  gh.factory<_i147.AddParticipateCommentUsecase>(() =>
      _i147.AddParticipateCommentUsecase(gh<_i78.ParticipateListRepository>()));
  gh.factory<_i148.AddParticipateUserUsecase>(() =>
      _i148.AddParticipateUserUsecase(gh<_i78.ParticipateListRepository>()));
  gh.factory<_i149.EditParticipateUserUsecase>(() =>
      _i149.EditParticipateUserUsecase(gh<_i78.ParticipateListRepository>()));
  gh.factory<_i150.GetInvoiceByIdUsecase>(
      () => _i150.GetInvoiceByIdUsecase(gh<_i78.ParticipateListRepository>()));
  gh.factory<_i151.ParticipateClientListUsecase>(() =>
      _i151.ParticipateClientListUsecase(gh<_i78.ParticipateListRepository>()));
  gh.factory<_i152.ParticipateCommentListUsecase>(() =>
      _i152.ParticipateCommentListUsecase(
          gh<_i78.ParticipateListRepository>()));
  gh.factory<_i153.ParticipateInvoiceListUsecase>(() =>
      _i153.ParticipateInvoiceListUsecase(
          gh<_i78.ParticipateListRepository>()));
  gh.factory<_i154.ParticipateListUsecase>(
      () => _i154.ParticipateListUsecase(gh<_i78.ParticipateListRepository>()));
  gh.lazySingleton<_i155.ChangeParticipateStatusUsecase>(() =>
      _i155.ChangeParticipateStatusUsecase(
          gh<_i78.ParticipateListRepository>()));
  gh.factory<_i156.PendingInvoicesCubit>(
      () => _i156.PendingInvoicesCubit(gh<_i63.GetPendingInvoicesUsecase>()));
  gh.factory<_i157.GetCommunicationListUsecase>(() =>
      _i157.GetCommunicationListUsecase(
          gh<_i133.CommunicationListRepository>()));
  gh.lazySingleton<_i158.CrudClientSupportFilesUsecase>(() =>
      _i158.CrudClientSupportFilesUsecase(
          repository: gh<_i118.ClientsListRepository>()));
  gh.lazySingleton<_i159.GetClientSupportFilesUsecase>(() =>
      _i159.GetClientSupportFilesUsecase(
          repository: gh<_i118.ClientsListRepository>()));
  gh.factory<_i160.LinkCubit>(() => _i160.LinkCubit(
        gh<_i140.GetLinkUsecase>(),
        gh<_i139.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i161.WaitingAgentsRepo>(
      () => _i162.WaitingAgentsRepoImpl(gh<_i83.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i163.ChangeStateAgentUseCase>(
      () => _i163.ChangeStateAgentUseCase(gh<_i143.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i164.GetAgentsAndDistributorsUseCase>(() =>
      _i164.GetAgentsAndDistributorsUseCase(
          gh<_i143.AgentsDistributorsRepo>()));
  gh.factory<_i165.ClientsAcceptCubit>(
      () => _i165.ClientsAcceptCubit(gh<_i113.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i166.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i166.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i141.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i167.GetWithdrawalsInvoicesUsecase>(() =>
      _i167.GetWithdrawalsInvoicesUsecase(
          gh<_i141.ManageWithdrawalsRepository>()));
  gh.factory<_i168.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i168.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i141.ManageWithdrawalsRepository>()));
  gh.factory<_i169.AddTaskUsecase>(
      () => _i169.AddTaskUsecase(gh<_i57.TaskRepository>()));
  gh.factory<_i170.ChangeStatusTaskUsecase>(
      () => _i170.ChangeStatusTaskUsecase(gh<_i57.TaskRepository>()));
  gh.factory<_i171.FilterTaskUsecase>(
      () => _i171.FilterTaskUsecase(gh<_i57.TaskRepository>()));
  gh.factory<_i172.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i172.GetUsersByDepartmentAndRegionUsecase(gh<_i57.TaskRepository>()));
  gh.lazySingleton<_i173.ExceededClientsUseCase>(
      () => _i173.ExceededClientsUseCase(gh<_i54.ExceededClientsRepo>()));
  gh.lazySingleton<_i174.TransferExceededClientsUseCase>(() =>
      _i174.TransferExceededClientsUseCase(gh<_i54.ExceededClientsRepo>()));
  gh.lazySingleton<_i175.EditAdvancedConfigsUsecase>(() =>
      _i175.EditAdvancedConfigsUsecase(gh<_i76.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i176.GetAdvancedConfigsUsecase>(() =>
      _i176.GetAdvancedConfigsUsecase(gh<_i76.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i177.DatesTableRepo>(
      () => _i178.DatesTableRepoImpl(gh<_i89.DatesTableDataSource>()));
  gh.factory<_i179.AddClientUserUsecase>(
      () => _i179.AddClientUserUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i180.ApproveRejectClientUsecase>(() =>
      _i180.ApproveRejectClientUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i181.ChangeTypeClientUsecase>(
      () => _i181.ChangeTypeClientUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i182.EditClientUserUsecase>(
      () => _i182.EditClientUserUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i183.GetClientsListByRegionUseCase>(() =>
      _i183.GetClientsListByRegionUseCase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i184.GetClientsListByUserUseCase>(() =>
      _i184.GetClientsListByUserUseCase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i185.GetClientsWithFilterUserUsecase>(() =>
      _i185.GetClientsWithFilterUserUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i186.GetClientMarketingReportUsecase>(() =>
      _i186.GetClientMarketingReportUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i187.GetRecommendedClientsUsecase>(() =>
      _i187.GetRecommendedClientsUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i188.GetSimilarClientsUsecase>(
      () => _i188.GetSimilarClientsUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i189.ReceiveClientUserUsecase>(
      () => _i189.ReceiveClientUserUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i190.TransferClientUserUsecase>(
      () => _i190.TransferClientUserUsecase(gh<_i118.ClientsListRepository>()));
  gh.factory<_i191.GetVersionUseCase>(
      () => _i191.GetVersionUseCase(gh<_i97.AppRepository>()));
  gh.factory<_i192.AddTicketCubit>(
      () => _i192.AddTicketCubit(gh<_i68.AddTicketUseCase>()));
  gh.lazySingleton<_i193.EditGeneralConfigsUsecase>(() =>
      _i193.EditGeneralConfigsUsecase(gh<_i114.GeneralConfigsRepository>()));
  gh.lazySingleton<_i194.GetGeneralConfigsUsecase>(() =>
      _i194.GetGeneralConfigsUsecase(gh<_i114.GeneralConfigsRepository>()));
  gh.lazySingleton<_i195.AddAgentUseCase>(
      () => _i195.AddAgentUseCase(gh<_i99.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i196.UpdateAgentUseCase>(
      () => _i196.UpdateAgentUseCase(gh<_i99.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i197.GetDelayInstallReportsUseCase>(() =>
      _i197.GetDelayInstallReportsUseCase(gh<_i95.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i198.CrudAgentSupportFilesUsecase>(() =>
      _i198.CrudAgentSupportFilesUsecase(
          gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i199.GetLatestClientsUseCase>(() =>
      _i199.GetLatestClientsUseCase(gh<_i60.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i200.TaskCubit>(() => _i200.TaskCubit(
        gh<_i169.AddTaskUsecase>(),
        gh<_i171.FilterTaskUsecase>(),
        gh<_i170.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i201.SupportTabCubit>(() => _i201.SupportTabCubit(
        gh<_i124.GetInvoiceByClientUsecase>(),
        gh<_i122.AddDateInstallUsecase>(),
        gh<_i127.SetDateDoneUsecase>(),
        gh<_i128.SetReadyInstallUsecase>(),
        gh<_i126.ReturnInvoiceApproveUsecase>(),
        gh<_i125.ReceiveDeviceUsecase>(),
        gh<_i123.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i202.AddAgentDateUseCase>(() =>
      _i202.AddAgentDateUseCase(gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.factory<_i203.ClientsListBloc>(() => _i203.ClientsListBloc(
        gh<_i185.GetClientsWithFilterUserUsecase>(),
        gh<_i187.GetRecommendedClientsUsecase>(),
        gh<_i179.AddClientUserUsecase>(),
        gh<_i182.EditClientUserUsecase>(),
        gh<_i181.ChangeTypeClientUsecase>(),
        gh<_i188.GetSimilarClientsUsecase>(),
        gh<_i180.ApproveRejectClientUsecase>(),
        gh<_i158.CrudClientSupportFilesUsecase>(),
        gh<_i159.GetClientSupportFilesUsecase>(),
        gh<_i190.TransferClientUserUsecase>(),
        gh<_i189.ReceiveClientUserUsecase>(),
        gh<_i186.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i204.AgentsDistributorsActionsCubit>(
      () => _i204.AgentsDistributorsActionsCubit(
            gh<_i67.GetCitiesUseCase>(),
            gh<_i195.AddAgentUseCase>(),
            gh<_i196.UpdateAgentUseCase>(),
          ));
  gh.factory<_i205.LoginCubit>(() => _i205.LoginCubit(
        gh<_i110.LoginUsecase>(),
        gh<_i112.VerifyOtpUsecase>(),
        gh<_i108.CacheTokenUsecase>(),
        gh<_i109.GetTokenUsecase>(),
        gh<_i111.ValidateTokenUsecase>(),
      ));
  gh.factory<_i206.InvoicesSectionCubit>(() => _i206.InvoicesSectionCubit(
        gh<_i107.GetInvoicesByPrivilegesUsecase>(),
        gh<_i164.GetAgentsAndDistributorsUseCase>(),
        gh<_i154.ParticipateListUsecase>(),
        gh<_i129.GetAllUsersUseCase>(),
      ));
  gh.factory<_i207.AddLevelUsecase>(
      () => _i207.AddLevelUsecase(gh<_i93.PrivilegeRepository>()));
  gh.factory<_i208.GetLevelsUsecase>(
      () => _i208.GetLevelsUsecase(gh<_i93.PrivilegeRepository>()));
  gh.factory<_i209.GetPrivilegesUsecase>(
      () => _i209.GetPrivilegesUsecase(gh<_i93.PrivilegeRepository>()));
  gh.factory<_i210.UpdatePrivilegeUsecase>(
      () => _i210.UpdatePrivilegeUsecase(gh<_i93.PrivilegeRepository>()));
  gh.factory<_i211.AttachmentsRowCubit>(() => _i211.AttachmentsRowCubit(
        gh<_i159.GetClientSupportFilesUsecase>(),
        gh<_i158.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i212.AddCommentUsecase>(
      () => _i212.AddCommentUsecase(gh<_i116.CompanyRepository>()));
  gh.factory<_i213.GetCommentUsecase>(
      () => _i213.GetCommentUsecase(gh<_i116.CompanyRepository>()));
  gh.factory<_i214.DelayInstallReportsCubit>(() =>
      _i214.DelayInstallReportsCubit(
          gh<_i197.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i215.GetRegionsByIdCountryUseCase>(
      () => _i215.GetRegionsByIdCountryUseCase(gh<_i145.RegionsRepository>()));
  gh.lazySingleton<_i216.PrivilegeCubit>(() => _i216.PrivilegeCubit(
        gh<_i208.GetLevelsUsecase>(),
        gh<_i209.GetPrivilegesUsecase>(),
        gh<_i210.UpdatePrivilegeUsecase>(),
        gh<_i207.AddLevelUsecase>(),
      ));
  gh.factory<_i217.AdvancedCofigsCubit>(() => _i217.AdvancedCofigsCubit(
        gh<_i176.GetAdvancedConfigsUsecase>(),
        gh<_i175.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i218.ParticipateListBloc>(() => _i218.ParticipateListBloc(
        gh<_i154.ParticipateListUsecase>(),
        gh<_i148.AddParticipateUserUsecase>(),
        gh<_i149.EditParticipateUserUsecase>(),
        gh<_i151.ParticipateClientListUsecase>(),
        gh<_i153.ParticipateInvoiceListUsecase>(),
        gh<_i150.GetInvoiceByIdUsecase>(),
        gh<_i152.ParticipateCommentListUsecase>(),
        gh<_i147.AddParticipateCommentUsecase>(),
        gh<_i155.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i219.GeneralCofigsCubit>(() => _i219.GeneralCofigsCubit(
        gh<_i194.GetGeneralConfigsUsecase>(),
        gh<_i193.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i220.GetClientsDebtsUsecase>(
      () => _i220.GetClientsDebtsUsecase(gh<_i130.ClientsDebtsRepo>()));
  gh.lazySingleton<_i221.AddAgentCommentUsecase>(() =>
      _i221.AddAgentCommentUsecase(gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i222.DoneTrainingUsecase>(() =>
      _i222.DoneTrainingUsecase(gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i223.GetAgentUsecase>(
      () => _i223.GetAgentUsecase(gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i224.GetAgentClientListUsecase>(() =>
      _i224.GetAgentClientListUsecase(
          gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i225.GetAgentCommentsListUsecase>(() =>
      _i225.GetAgentCommentsListUsecase(
          gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i226.GetAgentDatesListUsecase>(() =>
      _i226.GetAgentDatesListUsecase(
          gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i227.GetAgentInvoiceListUsecase>(() =>
      _i227.GetAgentInvoiceListUsecase(
          gh<_i120.AgentsDistributorsProfileRepo>()));
  gh.factory<_i228.AddRejectReasonsUsecase>(() =>
      _i228.AddRejectReasonsUsecase(gh<_i141.ManageWithdrawalsRepository>()));
  gh.factory<_i229.EditRejectReasonsUsecase>(() =>
      _i229.EditRejectReasonsUsecase(gh<_i141.ManageWithdrawalsRepository>()));
  gh.factory<_i230.GetRejectReasonsUsecase>(() =>
      _i230.GetRejectReasonsUsecase(gh<_i141.ManageWithdrawalsRepository>()));
  gh.factory<_i231.GetUserSeriesUsecase>(() =>
      _i231.GetUserSeriesUsecase(gh<_i141.ManageWithdrawalsRepository>()));
  gh.factory<_i232.GetWithdrawnDetailsUsecase>(() =>
      _i232.GetWithdrawnDetailsUsecase(
          gh<_i141.ManageWithdrawalsRepository>()));
  gh.factory<_i233.SetApproveSeriesUsecase>(() =>
      _i233.SetApproveSeriesUsecase(gh<_i141.ManageWithdrawalsRepository>()));
  gh.factory<_i234.UpdateSeriesUsecase>(
      () => _i234.UpdateSeriesUsecase(gh<_i141.ManageWithdrawalsRepository>()));
  gh.singleton<_i235.AppManagerCubit>(
      () => _i235.AppManagerCubit(gh<_i191.GetVersionUseCase>()));
  gh.factory<_i236.RegionsCubit>(
      () => _i236.RegionsCubit(gh<_i215.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i237.GetWaitingAgentsUsecase>(
      () => _i237.GetWaitingAgentsUsecase(gh<_i161.WaitingAgentsRepo>()));
  gh.factory<_i238.UsersCubit>(() => _i238.UsersCubit(
        gh<_i138.GetUsersUsecase>(),
        gh<_i56.ActionUserUsecase>(),
        gh<_i172.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i137.GetManagesForUserUsecase>(),
        gh<_i136.GetLevelsForUserUsecase>(),
        gh<_i135.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i239.CommunicationListBloc>(() =>
      _i239.CommunicationListBloc(gh<_i157.GetCommunicationListUsecase>()));
  gh.factory<_i240.AgentsDistributorsCubit>(() => _i240.AgentsDistributorsCubit(
        gh<_i164.GetAgentsAndDistributorsUseCase>(),
        gh<_i163.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i241.ExceededClientsCubit>(() => _i241.ExceededClientsCubit(
        gh<_i173.ExceededClientsUseCase>(),
        gh<_i174.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i242.LatestClientsUpdatesCubit>(() =>
      _i242.LatestClientsUpdatesCubit(gh<_i199.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i243.CancelScheduleUsecase>(
      () => _i243.CancelScheduleUsecase(gh<_i177.DatesTableRepo>()));
  gh.lazySingleton<_i244.ChangeDateToDonUsecase>(
      () => _i244.ChangeDateToDonUsecase(gh<_i177.DatesTableRepo>()));
  gh.lazySingleton<_i245.GetDateInstallationUsecase>(
      () => _i245.GetDateInstallationUsecase(gh<_i177.DatesTableRepo>()));
  gh.lazySingleton<_i246.GetInvoicesByClientForDateUsecase>(() =>
      _i246.GetInvoicesByClientForDateUsecase(gh<_i177.DatesTableRepo>()));
  gh.lazySingleton<_i247.GetSubscribedClientsUsecase>(
      () => _i247.GetSubscribedClientsUsecase(gh<_i177.DatesTableRepo>()));
  gh.lazySingleton<_i248.RescheduleDateUsecase>(
      () => _i248.RescheduleDateUsecase(gh<_i177.DatesTableRepo>()));
  gh.lazySingleton<_i249.ReturnScheduleVisitToOpenUsecase>(
      () => _i249.ReturnScheduleVisitToOpenUsecase(gh<_i177.DatesTableRepo>()));
  gh.factory<_i250.AgentsDistributorsProfileBloc>(
      () => _i250.AgentsDistributorsProfileBloc(
            gh<_i224.GetAgentClientListUsecase>(),
            gh<_i227.GetAgentInvoiceListUsecase>(),
            gh<_i150.GetInvoiceByIdUsecase>(),
            gh<_i225.GetAgentCommentsListUsecase>(),
            gh<_i221.AddAgentCommentUsecase>(),
            gh<_i222.DoneTrainingUsecase>(),
            gh<_i202.AddAgentDateUseCase>(),
            gh<_i226.GetAgentDatesListUsecase>(),
            gh<_i198.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i251.DatesTableCubit>(() => _i251.DatesTableCubit(
        gh<_i245.GetDateInstallationUsecase>(),
        gh<_i248.RescheduleDateUsecase>(),
        gh<_i244.ChangeDateToDonUsecase>(),
        gh<_i243.CancelScheduleUsecase>(),
        gh<_i249.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i247.GetSubscribedClientsUsecase>(),
        gh<_i246.GetInvoicesByClientForDateUsecase>(),
        gh<_i122.AddDateInstallUsecase>(),
      ));
  gh.factory<_i252.CompanyCubit>(() => _i252.CompanyCubit(
        gh<_i213.GetCommentUsecase>(),
        gh<_i212.AddCommentUsecase>(),
      ));
  gh.factory<_i253.ClientsDebtsCubit>(
      () => _i253.ClientsDebtsCubit(gh<_i220.GetClientsDebtsUsecase>()));
  gh.factory<_i254.ManageWithdrawalsCubit>(() => _i254.ManageWithdrawalsCubit(
        gh<_i231.GetUserSeriesUsecase>(),
        gh<_i234.UpdateSeriesUsecase>(),
        gh<_i138.GetUsersUsecase>(),
        gh<_i167.GetWithdrawalsInvoicesUsecase>(),
        gh<_i168.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i233.SetApproveSeriesUsecase>(),
        gh<_i232.GetWithdrawnDetailsUsecase>(),
        gh<_i228.AddRejectReasonsUsecase>(),
        gh<_i230.GetRejectReasonsUsecase>(),
        gh<_i229.EditRejectReasonsUsecase>(),
        gh<_i166.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i255.WaitingAgentsCubit>(
      () => _i255.WaitingAgentsCubit(gh<_i237.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i256.AppModule {}
