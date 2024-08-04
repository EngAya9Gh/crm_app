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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i28;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i97;
import '../../../features/app/domain/repositories/app_repository.dart' as _i96;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i188;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i231;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i52;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i74;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i87;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i86;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i107;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i108;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i109;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i110;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i111;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i202;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i18;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i22;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i112;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i162;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i24;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i39;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i38;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i67;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i69;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i71;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i70;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i72;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i189;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i85;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i73;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i29;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i131;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i130;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i154;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i235;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i36;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i65;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i64;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i66;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i129;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i61;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i103;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i102;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i121;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i122;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i123;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i124;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i125;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i126;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i127;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i198;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i90;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i143;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i142;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i212;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i232;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i37;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i76;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i75;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i172;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i173;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i214;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i47;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i114;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i113;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i190;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i191;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i216;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i30;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i93;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i92;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i204;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i205;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i206;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i207;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i213;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i25;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i46;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i45;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i55;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i132;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i133;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i134;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i135;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i234;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i27;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i139;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i138;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i224;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i225;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i163;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i226;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i227;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i165;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i164;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i228;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i229;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i230;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i249;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i23;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i49;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i48;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i83;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i100;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i16;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i51;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i50;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i62;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i153;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i31;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i118;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i117;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i176;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i177;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i178;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i155;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i179;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i183;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i156;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i180;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i181;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i182;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i184;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i185;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i186;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i187;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i200;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i32;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i116;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i115;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i209;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i210;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i248;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i26;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i54;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i53;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i170;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i171;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i237;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i63;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i80;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i79;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i128;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i106;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i203;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i35;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i60;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i59;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i196;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i238;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i17;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i58;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i84;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i99;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i120;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i141;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i98;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i119;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i140;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i217;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i199;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i192;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i160;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i195;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i218;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i219;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i220;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i221;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i222;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i223;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i161;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i193;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i201;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i246;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i236;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i33;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i105;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i104;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i136;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i137;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i157;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i20;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i78;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i77;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i144;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i145;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i152;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i146;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i147;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i148;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i149;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i151;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i215;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i88;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i175;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i174;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i239;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i240;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i241;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i242;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i243;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i244;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i245;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i247;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i43;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i42;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i89;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i101;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i19;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i95;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i94;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i194;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i211;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i41;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i40;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i44;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i81;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i82;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i159;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i158;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i233;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i250;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i34;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i57;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i56;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i166;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i167;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i168;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i169;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i197;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i208;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i91;
import 'di_container.dart' as _i251;

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
  gh.lazySingleton<_i23.FinancePendingDatasource>(
      () => _i23.FinancePendingDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i24.TicketsDataSource>(
      () => _i24.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i25.UsersDatasource>(
      () => _i25.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i26.ExceededClientsDatasource>(
      () => _i26.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i27.ManageWithdrawalsDatasource>(
      () => _i27.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.AppDatasource>(
      () => _i28.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i29.CommunicationListDatasource>(
      () => _i29.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i30.PrivilegeDatasource>(
      () => _i30.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i31.ClientsListDatasource>(
      () => _i31.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i32.CommentCompanyDatasource>(
      () => _i32.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i33.LinkDatasource>(
      () => _i33.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i34.TaskDatasource>(
      () => _i34.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i35.LatestClientsUpdatesDatasource>(
      () => _i35.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i36.CitiesDatasource>(
      () => _i36.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i37.AdvancedConfigsDatasource>(
      () => _i37.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i38.TicketsRepo>(
      () => _i39.TicketsRepoImpl(gh<_i24.TicketsDataSource>()));
  gh.lazySingleton<_i40.SupportClientsAcceptRepository>(() =>
      _i41.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i42.DelayAfterInstallRepo>(() =>
      _i43.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i44.GetSupportClientsAcceptUseCase>(() =>
      _i44.GetSupportClientsAcceptUseCase(
          gh<_i40.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i45.UsersRepository>(
      () => _i46.UsersRepositoryImpl(gh<_i25.UsersDatasource>()));
  gh.lazySingleton<_i47.GeneralConfigsDatasource>(
      () => _i47.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i48.FinancePendingRepo>(
      () => _i49.FinancePendingRepoImpl(gh<_i23.FinancePendingDatasource>()));
  gh.lazySingleton<_i50.PendingInvoicesRepo>(
      () => _i51.PendingInvoicesRepoImpl(gh<_i16.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i52.LoginLocalDataSource>(() =>
      _i52.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i53.ExceededClientsRepo>(
      () => _i54.ExceededClientsRepoImpl(gh<_i26.ExceededClientsDatasource>()));
  gh.factory<_i55.ActionUserUsecase>(
      () => _i55.ActionUserUsecase(gh<_i45.UsersRepository>()));
  gh.factory<_i56.TaskRepository>(
      () => _i57.TaskRepositoryImpl(gh<_i34.TaskDatasource>()));
  gh.lazySingleton<_i58.AgentsDistributorsDataSource>(
      () => _i58.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i59.LatestClientsUpdatesRepository>(() =>
      _i60.LatestClientsUpdatesRepositoryImpl(
          gh<_i35.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i61.SupportTabDataSource>(
      () => _i61.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i62.GetPendingInvoicesUsecase>(
      () => _i62.GetPendingInvoicesUsecase(gh<_i50.PendingInvoicesRepo>()));
  gh.lazySingleton<_i63.InvoicesTabDataSource>(
      () => _i63.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i64.CitiesRepository>(
      () => _i65.CitiesRepositoryImpl(gh<_i36.CitiesDatasource>()));
  gh.lazySingleton<_i66.GetCitiesUseCase>(
      () => _i66.GetCitiesUseCase(gh<_i64.CitiesRepository>()));
  gh.lazySingleton<_i67.AddTicketUseCase>(
      () => _i67.AddTicketUseCase(gh<_i38.TicketsRepo>()));
  gh.lazySingleton<_i68.EditTicketTypeUseCase>(
      () => _i68.EditTicketTypeUseCase(gh<_i38.TicketsRepo>()));
  gh.lazySingleton<_i69.GetClientTicketsUseCase>(
      () => _i69.GetClientTicketsUseCase(gh<_i38.TicketsRepo>()));
  gh.lazySingleton<_i70.GetTicketsUseCase>(
      () => _i70.GetTicketsUseCase(gh<_i38.TicketsRepo>()));
  gh.lazySingleton<_i71.GetTicketByIdUseCase>(
      () => _i71.GetTicketByIdUseCase(gh<_i38.TicketsRepo>()));
  gh.lazySingleton<_i72.TransferTicketUseCase>(
      () => _i72.TransferTicketUseCase(gh<_i38.TicketsRepo>()));
  gh.factory<_i73.TicketsCubit>(() => _i73.TicketsCubit(
        gh<_i70.GetTicketsUseCase>(),
        gh<_i71.GetTicketByIdUseCase>(),
        gh<_i69.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i74.LoginRemoteDataSource>(
      () => _i74.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i75.AdvancedConfigsRepository>(() =>
      _i76.AdvancedConfigsRepositoryImpl(gh<_i37.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i77.ParticipateListRepository>(() =>
      _i78.ParticipateListRepositoryImpl(
          gh<_i20.ParticipatesListDatasource>()));
  gh.lazySingleton<_i79.InvoicesSectionRepo>(
      () => _i80.InvoicesTabRepoImpl(gh<_i63.InvoicesTabDataSource>()));
  gh.factory<_i81.SupportClientsAcceptCubit>(() =>
      _i81.SupportClientsAcceptCubit(
          gh<_i44.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i82.WaitingAgentsDataSource>(
      () => _i82.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i83.GetFinancePendingInvoicesUsecase>(() =>
      _i83.GetFinancePendingInvoicesUsecase(gh<_i48.FinancePendingRepo>()));
  gh.lazySingleton<_i84.AgentsDistributorsProfileDataSource>(() =>
      _i84.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i85.EditTicketCubit>(() => _i85.EditTicketCubit(
        gh<_i68.EditTicketTypeUseCase>(),
        gh<_i72.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i86.LoginRepo>(() => _i87.LoginRepoImpl(
        gh<_i74.LoginRemoteDataSource>(),
        gh<_i52.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i88.DatesTableDataSource>(
      () => _i88.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i89.GetDelayAfterInstallUseCase>(
      () => _i89.GetDelayAfterInstallUseCase(gh<_i42.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i90.RegionsDatasource>(
      () => _i90.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i91.LocationServices>(
      () => _i91.LocationServices(gh<_i8.Location>()));
  gh.factory<_i92.PrivilegeRepository>(
      () => _i93.PrivilegeRepositoryImpl(gh<_i30.PrivilegeDatasource>()));
  gh.lazySingleton<_i94.DelayInstallReportsRepo>(() =>
      _i95.DelayInstallReportsRepoImpl(
          gh<_i19.DelayInstallReportsDatasource>()));
  gh.factory<_i96.AppRepository>(
      () => _i97.AppRepositoryImpl(gh<_i28.AppDatasource>()));
  gh.lazySingleton<_i98.AgentsDistributorsActionsRepo>(() =>
      _i99.AgentsDistributorsActionsRepoImpl(
          gh<_i17.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i100.FinancePendingCubit>(() =>
      _i100.FinancePendingCubit(gh<_i83.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i101.DelayAfterInstallCubit>(() =>
      _i101.DelayAfterInstallCubit(gh<_i89.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i102.SupportTabRepo>(
      () => _i103.SupportTabRepoImpl(gh<_i61.SupportTabDataSource>()));
  gh.factory<_i104.LinksImportantRepository>(
      () => _i105.LinkRepositoryImpl(gh<_i33.LinkDatasource>()));
  gh.lazySingleton<_i106.GetInvoicesByPrivilegesUsecase>(() =>
      _i106.GetInvoicesByPrivilegesUsecase(gh<_i79.InvoicesSectionRepo>()));
  gh.lazySingleton<_i107.CacheTokenUsecase>(
      () => _i107.CacheTokenUsecase(gh<_i86.LoginRepo>()));
  gh.lazySingleton<_i108.GetTokenUsecase>(
      () => _i108.GetTokenUsecase(gh<_i86.LoginRepo>()));
  gh.lazySingleton<_i109.LoginUsecase>(
      () => _i109.LoginUsecase(gh<_i86.LoginRepo>()));
  gh.lazySingleton<_i110.ValidateTokenUsecase>(
      () => _i110.ValidateTokenUsecase(gh<_i86.LoginRepo>()));
  gh.lazySingleton<_i111.VerifyOtpUsecase>(
      () => _i111.VerifyOtpUsecase(gh<_i86.LoginRepo>()));
  gh.lazySingleton<_i112.GetClientsAcceptUseCase>(
      () => _i112.GetClientsAcceptUseCase(gh<_i21.ClientsAcceptRepository>()));
  gh.lazySingleton<_i113.GeneralConfigsRepository>(() =>
      _i114.GeneralConfigsRepositoryImpl(gh<_i47.GeneralConfigsDatasource>()));
  gh.factory<_i115.CompanyRepository>(
      () => _i116.CompanyRepositoryImpl(gh<_i32.CommentCompanyDatasource>()));
  gh.factory<_i117.ClientsListRepository>(
      () => _i118.ClientsListRepositoryImpl(gh<_i31.ClientsListDatasource>()));
  gh.lazySingleton<_i119.AgentsDistributorsProfileRepo>(() =>
      _i120.AgentsDistributorsProfileRepoImpl(
          gh<_i84.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i121.AddDateInstallUsecase>(
      () => _i121.AddDateInstallUsecase(gh<_i102.SupportTabRepo>()));
  gh.lazySingleton<_i122.CancelDateInstallUsecase>(
      () => _i122.CancelDateInstallUsecase(gh<_i102.SupportTabRepo>()));
  gh.lazySingleton<_i123.GetInvoiceByClientUsecase>(
      () => _i123.GetInvoiceByClientUsecase(gh<_i102.SupportTabRepo>()));
  gh.lazySingleton<_i124.ReceiveDeviceUsecase>(
      () => _i124.ReceiveDeviceUsecase(gh<_i102.SupportTabRepo>()));
  gh.lazySingleton<_i125.ReturnInvoiceApproveUsecase>(
      () => _i125.ReturnInvoiceApproveUsecase(gh<_i102.SupportTabRepo>()));
  gh.lazySingleton<_i126.SetDateDoneUsecase>(
      () => _i126.SetDateDoneUsecase(gh<_i102.SupportTabRepo>()));
  gh.lazySingleton<_i127.SetReadyInstallUsecase>(
      () => _i127.SetReadyInstallUsecase(gh<_i102.SupportTabRepo>()));
  gh.lazySingleton<_i128.GetAllUsersUseCase>(
      () => _i128.GetAllUsersUseCase(gh<_i79.InvoicesSectionRepo>()));
  gh.singleton<_i129.CitiesCubit>(
      () => _i129.CitiesCubit(gh<_i66.GetCitiesUseCase>()));
  gh.factory<_i130.CommunicationListRepository>(() =>
      _i131.CommunicationListRepositoryImpl(
          gh<_i29.CommunicationListDatasource>()));
  gh.lazySingleton<_i132.GetBranchesForUserUsecase>(
      () => _i132.GetBranchesForUserUsecase(gh<_i45.UsersRepository>()));
  gh.lazySingleton<_i133.GetLevelsForUserUsecase>(
      () => _i133.GetLevelsForUserUsecase(gh<_i45.UsersRepository>()));
  gh.lazySingleton<_i134.GetManagesForUserUsecase>(
      () => _i134.GetManagesForUserUsecase(gh<_i45.UsersRepository>()));
  gh.factory<_i135.GetUsersUsecase>(
      () => _i135.GetUsersUsecase(gh<_i45.UsersRepository>()));
  gh.factory<_i136.ActionLinkUsecase>(
      () => _i136.ActionLinkUsecase(gh<_i104.LinksImportantRepository>()));
  gh.factory<_i137.GetLinkUsecase>(
      () => _i137.GetLinkUsecase(gh<_i104.LinksImportantRepository>()));
  gh.lazySingleton<_i138.ManageWithdrawalsRepository>(() =>
      _i139.ManageWithdrawalsRepositoryImpl(
          gh<_i27.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i140.AgentsDistributorsRepo>(() =>
      _i141.AgentsDistributorsRepoImpl(
          gh<_i58.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i142.RegionsRepository>(
      () => _i143.RegionsRepositoryImpl(gh<_i90.RegionsDatasource>()));
  gh.factory<_i144.AddParticipateCommentUsecase>(() =>
      _i144.AddParticipateCommentUsecase(gh<_i77.ParticipateListRepository>()));
  gh.factory<_i145.AddParticipateUserUsecase>(() =>
      _i145.AddParticipateUserUsecase(gh<_i77.ParticipateListRepository>()));
  gh.factory<_i146.EditParticipateUserUsecase>(() =>
      _i146.EditParticipateUserUsecase(gh<_i77.ParticipateListRepository>()));
  gh.factory<_i147.GetInvoiceByIdUsecase>(
      () => _i147.GetInvoiceByIdUsecase(gh<_i77.ParticipateListRepository>()));
  gh.factory<_i148.ParticipateClientListUsecase>(() =>
      _i148.ParticipateClientListUsecase(gh<_i77.ParticipateListRepository>()));
  gh.factory<_i149.ParticipateCommentListUsecase>(() =>
      _i149.ParticipateCommentListUsecase(
          gh<_i77.ParticipateListRepository>()));
  gh.factory<_i150.ParticipateInvoiceListUsecase>(() =>
      _i150.ParticipateInvoiceListUsecase(
          gh<_i77.ParticipateListRepository>()));
  gh.factory<_i151.ParticipateListUsecase>(
      () => _i151.ParticipateListUsecase(gh<_i77.ParticipateListRepository>()));
  gh.lazySingleton<_i152.ChangeParticipateStatusUsecase>(() =>
      _i152.ChangeParticipateStatusUsecase(
          gh<_i77.ParticipateListRepository>()));
  gh.factory<_i153.PendingInvoicesCubit>(
      () => _i153.PendingInvoicesCubit(gh<_i62.GetPendingInvoicesUsecase>()));
  gh.factory<_i154.GetCommunicationListUsecase>(() =>
      _i154.GetCommunicationListUsecase(
          gh<_i130.CommunicationListRepository>()));
  gh.lazySingleton<_i155.CrudClientSupportFilesUsecase>(() =>
      _i155.CrudClientSupportFilesUsecase(
          repository: gh<_i117.ClientsListRepository>()));
  gh.lazySingleton<_i156.GetClientSupportFilesUsecase>(() =>
      _i156.GetClientSupportFilesUsecase(
          repository: gh<_i117.ClientsListRepository>()));
  gh.factory<_i157.LinkCubit>(() => _i157.LinkCubit(
        gh<_i137.GetLinkUsecase>(),
        gh<_i136.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i158.WaitingAgentsRepo>(
      () => _i159.WaitingAgentsRepoImpl(gh<_i82.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i160.ChangeStateAgentUseCase>(
      () => _i160.ChangeStateAgentUseCase(gh<_i140.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i161.GetAgentsAndDistributorsUseCase>(() =>
      _i161.GetAgentsAndDistributorsUseCase(
          gh<_i140.AgentsDistributorsRepo>()));
  gh.factory<_i162.ClientsAcceptCubit>(
      () => _i162.ClientsAcceptCubit(gh<_i112.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i163.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i163.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i138.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i164.GetWithdrawalsInvoicesUsecase>(() =>
      _i164.GetWithdrawalsInvoicesUsecase(
          gh<_i138.ManageWithdrawalsRepository>()));
  gh.factory<_i165.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i165.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i138.ManageWithdrawalsRepository>()));
  gh.factory<_i166.AddTaskUsecase>(
      () => _i166.AddTaskUsecase(gh<_i56.TaskRepository>()));
  gh.factory<_i167.ChangeStatusTaskUsecase>(
      () => _i167.ChangeStatusTaskUsecase(gh<_i56.TaskRepository>()));
  gh.factory<_i168.FilterTaskUsecase>(
      () => _i168.FilterTaskUsecase(gh<_i56.TaskRepository>()));
  gh.factory<_i169.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i169.GetUsersByDepartmentAndRegionUsecase(gh<_i56.TaskRepository>()));
  gh.lazySingleton<_i170.ExceededClientsUseCase>(
      () => _i170.ExceededClientsUseCase(gh<_i53.ExceededClientsRepo>()));
  gh.lazySingleton<_i171.TransferExceededClientsUseCase>(() =>
      _i171.TransferExceededClientsUseCase(gh<_i53.ExceededClientsRepo>()));
  gh.lazySingleton<_i172.EditAdvancedConfigsUsecase>(() =>
      _i172.EditAdvancedConfigsUsecase(gh<_i75.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i173.GetAdvancedConfigsUsecase>(() =>
      _i173.GetAdvancedConfigsUsecase(gh<_i75.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i174.DatesTableRepo>(
      () => _i175.DatesTableRepoImpl(gh<_i88.DatesTableDataSource>()));
  gh.factory<_i176.AddClientUserUsecase>(
      () => _i176.AddClientUserUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i177.ApproveRejectClientUsecase>(() =>
      _i177.ApproveRejectClientUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i178.ChangeTypeClientUsecase>(
      () => _i178.ChangeTypeClientUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i179.EditClientUserUsecase>(
      () => _i179.EditClientUserUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i180.GetClientsListByRegionUseCase>(() =>
      _i180.GetClientsListByRegionUseCase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i181.GetClientsListByUserUseCase>(() =>
      _i181.GetClientsListByUserUseCase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i182.GetClientsWithFilterUserUsecase>(() =>
      _i182.GetClientsWithFilterUserUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i183.GetClientMarketingReportUsecase>(() =>
      _i183.GetClientMarketingReportUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i184.GetRecommendedClientsUsecase>(() =>
      _i184.GetRecommendedClientsUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i185.GetSimilarClientsUsecase>(
      () => _i185.GetSimilarClientsUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i186.ReceiveClientUserUsecase>(
      () => _i186.ReceiveClientUserUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i187.TransferClientUserUsecase>(
      () => _i187.TransferClientUserUsecase(gh<_i117.ClientsListRepository>()));
  gh.factory<_i188.GetVersionUseCase>(
      () => _i188.GetVersionUseCase(gh<_i96.AppRepository>()));
  gh.factory<_i189.AddTicketCubit>(
      () => _i189.AddTicketCubit(gh<_i67.AddTicketUseCase>()));
  gh.lazySingleton<_i190.EditGeneralConfigsUsecase>(() =>
      _i190.EditGeneralConfigsUsecase(gh<_i113.GeneralConfigsRepository>()));
  gh.lazySingleton<_i191.GetGeneralConfigsUsecase>(() =>
      _i191.GetGeneralConfigsUsecase(gh<_i113.GeneralConfigsRepository>()));
  gh.lazySingleton<_i192.AddAgentUseCase>(
      () => _i192.AddAgentUseCase(gh<_i98.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i193.UpdateAgentUseCase>(
      () => _i193.UpdateAgentUseCase(gh<_i98.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i194.GetDelayInstallReportsUseCase>(() =>
      _i194.GetDelayInstallReportsUseCase(gh<_i94.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i195.CrudAgentSupportFilesUsecase>(() =>
      _i195.CrudAgentSupportFilesUsecase(
          gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i196.GetLatestClientsUseCase>(() =>
      _i196.GetLatestClientsUseCase(gh<_i59.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i197.TaskCubit>(() => _i197.TaskCubit(
        gh<_i166.AddTaskUsecase>(),
        gh<_i168.FilterTaskUsecase>(),
        gh<_i167.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i198.SupportTabCubit>(() => _i198.SupportTabCubit(
        gh<_i123.GetInvoiceByClientUsecase>(),
        gh<_i121.AddDateInstallUsecase>(),
        gh<_i126.SetDateDoneUsecase>(),
        gh<_i127.SetReadyInstallUsecase>(),
        gh<_i125.ReturnInvoiceApproveUsecase>(),
        gh<_i124.ReceiveDeviceUsecase>(),
        gh<_i122.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i199.AddAgentDateUseCase>(() =>
      _i199.AddAgentDateUseCase(gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.factory<_i200.ClientsListBloc>(() => _i200.ClientsListBloc(
        gh<_i182.GetClientsWithFilterUserUsecase>(),
        gh<_i184.GetRecommendedClientsUsecase>(),
        gh<_i176.AddClientUserUsecase>(),
        gh<_i179.EditClientUserUsecase>(),
        gh<_i178.ChangeTypeClientUsecase>(),
        gh<_i185.GetSimilarClientsUsecase>(),
        gh<_i177.ApproveRejectClientUsecase>(),
        gh<_i155.CrudClientSupportFilesUsecase>(),
        gh<_i156.GetClientSupportFilesUsecase>(),
        gh<_i187.TransferClientUserUsecase>(),
        gh<_i186.ReceiveClientUserUsecase>(),
        gh<_i183.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i201.AgentsDistributorsActionsCubit>(
      () => _i201.AgentsDistributorsActionsCubit(
            gh<_i66.GetCitiesUseCase>(),
            gh<_i192.AddAgentUseCase>(),
            gh<_i193.UpdateAgentUseCase>(),
          ));
  gh.factory<_i202.LoginCubit>(() => _i202.LoginCubit(
        gh<_i109.LoginUsecase>(),
        gh<_i111.VerifyOtpUsecase>(),
        gh<_i107.CacheTokenUsecase>(),
        gh<_i108.GetTokenUsecase>(),
        gh<_i110.ValidateTokenUsecase>(),
      ));
  gh.factory<_i203.InvoicesSectionCubit>(() => _i203.InvoicesSectionCubit(
        gh<_i106.GetInvoicesByPrivilegesUsecase>(),
        gh<_i161.GetAgentsAndDistributorsUseCase>(),
        gh<_i151.ParticipateListUsecase>(),
        gh<_i128.GetAllUsersUseCase>(),
      ));
  gh.factory<_i204.AddLevelUsecase>(
      () => _i204.AddLevelUsecase(gh<_i92.PrivilegeRepository>()));
  gh.factory<_i205.GetLevelsUsecase>(
      () => _i205.GetLevelsUsecase(gh<_i92.PrivilegeRepository>()));
  gh.factory<_i206.GetPrivilegesUsecase>(
      () => _i206.GetPrivilegesUsecase(gh<_i92.PrivilegeRepository>()));
  gh.factory<_i207.UpdatePrivilegeUsecase>(
      () => _i207.UpdatePrivilegeUsecase(gh<_i92.PrivilegeRepository>()));
  gh.factory<_i208.AttachmentsRowCubit>(() => _i208.AttachmentsRowCubit(
        gh<_i156.GetClientSupportFilesUsecase>(),
        gh<_i155.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i209.AddCommentUsecase>(
      () => _i209.AddCommentUsecase(gh<_i115.CompanyRepository>()));
  gh.factory<_i210.GetCommentUsecase>(
      () => _i210.GetCommentUsecase(gh<_i115.CompanyRepository>()));
  gh.factory<_i211.DelayInstallReportsCubit>(() =>
      _i211.DelayInstallReportsCubit(
          gh<_i194.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i212.GetRegionsByIdCountryUseCase>(
      () => _i212.GetRegionsByIdCountryUseCase(gh<_i142.RegionsRepository>()));
  gh.lazySingleton<_i213.PrivilegeCubit>(() => _i213.PrivilegeCubit(
        gh<_i205.GetLevelsUsecase>(),
        gh<_i206.GetPrivilegesUsecase>(),
        gh<_i207.UpdatePrivilegeUsecase>(),
        gh<_i204.AddLevelUsecase>(),
      ));
  gh.factory<_i214.AdvancedCofigsCubit>(() => _i214.AdvancedCofigsCubit(
        gh<_i173.GetAdvancedConfigsUsecase>(),
        gh<_i172.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i215.ParticipateListBloc>(() => _i215.ParticipateListBloc(
        gh<_i151.ParticipateListUsecase>(),
        gh<_i145.AddParticipateUserUsecase>(),
        gh<_i146.EditParticipateUserUsecase>(),
        gh<_i148.ParticipateClientListUsecase>(),
        gh<_i150.ParticipateInvoiceListUsecase>(),
        gh<_i147.GetInvoiceByIdUsecase>(),
        gh<_i149.ParticipateCommentListUsecase>(),
        gh<_i144.AddParticipateCommentUsecase>(),
        gh<_i152.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i216.GeneralCofigsCubit>(() => _i216.GeneralCofigsCubit(
        gh<_i191.GetGeneralConfigsUsecase>(),
        gh<_i190.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i217.AddAgentCommentUsecase>(() =>
      _i217.AddAgentCommentUsecase(gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i218.DoneTrainingUsecase>(() =>
      _i218.DoneTrainingUsecase(gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i219.GetAgentUsecase>(
      () => _i219.GetAgentUsecase(gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i220.GetAgentClientListUsecase>(() =>
      _i220.GetAgentClientListUsecase(
          gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i221.GetAgentCommentsListUsecase>(() =>
      _i221.GetAgentCommentsListUsecase(
          gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i222.GetAgentDatesListUsecase>(() =>
      _i222.GetAgentDatesListUsecase(
          gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i223.GetAgentInvoiceListUsecase>(() =>
      _i223.GetAgentInvoiceListUsecase(
          gh<_i119.AgentsDistributorsProfileRepo>()));
  gh.factory<_i224.AddRejectReasonsUsecase>(() =>
      _i224.AddRejectReasonsUsecase(gh<_i138.ManageWithdrawalsRepository>()));
  gh.factory<_i225.EditRejectReasonsUsecase>(() =>
      _i225.EditRejectReasonsUsecase(gh<_i138.ManageWithdrawalsRepository>()));
  gh.factory<_i226.GetRejectReasonsUsecase>(() =>
      _i226.GetRejectReasonsUsecase(gh<_i138.ManageWithdrawalsRepository>()));
  gh.factory<_i227.GetUserSeriesUsecase>(() =>
      _i227.GetUserSeriesUsecase(gh<_i138.ManageWithdrawalsRepository>()));
  gh.factory<_i228.GetWithdrawnDetailsUsecase>(() =>
      _i228.GetWithdrawnDetailsUsecase(
          gh<_i138.ManageWithdrawalsRepository>()));
  gh.factory<_i229.SetApproveSeriesUsecase>(() =>
      _i229.SetApproveSeriesUsecase(gh<_i138.ManageWithdrawalsRepository>()));
  gh.factory<_i230.UpdateSeriesUsecase>(
      () => _i230.UpdateSeriesUsecase(gh<_i138.ManageWithdrawalsRepository>()));
  gh.singleton<_i231.AppManagerCubit>(
      () => _i231.AppManagerCubit(gh<_i188.GetVersionUseCase>()));
  gh.factory<_i232.RegionsCubit>(
      () => _i232.RegionsCubit(gh<_i212.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i233.GetWaitingAgentsUsecase>(
      () => _i233.GetWaitingAgentsUsecase(gh<_i158.WaitingAgentsRepo>()));
  gh.factory<_i234.UsersCubit>(() => _i234.UsersCubit(
        gh<_i135.GetUsersUsecase>(),
        gh<_i55.ActionUserUsecase>(),
        gh<_i169.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i134.GetManagesForUserUsecase>(),
        gh<_i133.GetLevelsForUserUsecase>(),
        gh<_i132.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i235.CommunicationListBloc>(() =>
      _i235.CommunicationListBloc(gh<_i154.GetCommunicationListUsecase>()));
  gh.factory<_i236.AgentsDistributorsCubit>(() => _i236.AgentsDistributorsCubit(
        gh<_i161.GetAgentsAndDistributorsUseCase>(),
        gh<_i160.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i237.ExceededClientsCubit>(() => _i237.ExceededClientsCubit(
        gh<_i170.ExceededClientsUseCase>(),
        gh<_i171.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i238.LatestClientsUpdatesCubit>(() =>
      _i238.LatestClientsUpdatesCubit(gh<_i196.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i239.CancelScheduleUsecase>(
      () => _i239.CancelScheduleUsecase(gh<_i174.DatesTableRepo>()));
  gh.lazySingleton<_i240.ChangeDateToDonUsecase>(
      () => _i240.ChangeDateToDonUsecase(gh<_i174.DatesTableRepo>()));
  gh.lazySingleton<_i241.GetDateInstallationUsecase>(
      () => _i241.GetDateInstallationUsecase(gh<_i174.DatesTableRepo>()));
  gh.lazySingleton<_i242.GetInvoicesByClientForDateUsecase>(() =>
      _i242.GetInvoicesByClientForDateUsecase(gh<_i174.DatesTableRepo>()));
  gh.lazySingleton<_i243.GetSubscribedClientsUsecase>(
      () => _i243.GetSubscribedClientsUsecase(gh<_i174.DatesTableRepo>()));
  gh.lazySingleton<_i244.RescheduleDateUsecase>(
      () => _i244.RescheduleDateUsecase(gh<_i174.DatesTableRepo>()));
  gh.lazySingleton<_i245.ReturnScheduleVisitToOpenUsecase>(
      () => _i245.ReturnScheduleVisitToOpenUsecase(gh<_i174.DatesTableRepo>()));
  gh.factory<_i246.AgentsDistributorsProfileBloc>(
      () => _i246.AgentsDistributorsProfileBloc(
            gh<_i220.GetAgentClientListUsecase>(),
            gh<_i223.GetAgentInvoiceListUsecase>(),
            gh<_i147.GetInvoiceByIdUsecase>(),
            gh<_i221.GetAgentCommentsListUsecase>(),
            gh<_i217.AddAgentCommentUsecase>(),
            gh<_i218.DoneTrainingUsecase>(),
            gh<_i199.AddAgentDateUseCase>(),
            gh<_i222.GetAgentDatesListUsecase>(),
            gh<_i195.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i247.DatesTableCubit>(() => _i247.DatesTableCubit(
        gh<_i241.GetDateInstallationUsecase>(),
        gh<_i244.RescheduleDateUsecase>(),
        gh<_i240.ChangeDateToDonUsecase>(),
        gh<_i239.CancelScheduleUsecase>(),
        gh<_i245.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i243.GetSubscribedClientsUsecase>(),
        gh<_i242.GetInvoicesByClientForDateUsecase>(),
        gh<_i121.AddDateInstallUsecase>(),
      ));
  gh.factory<_i248.CompanyCubit>(() => _i248.CompanyCubit(
        gh<_i210.GetCommentUsecase>(),
        gh<_i209.AddCommentUsecase>(),
      ));
  gh.factory<_i249.ManageWithdrawalsCubit>(() => _i249.ManageWithdrawalsCubit(
        gh<_i227.GetUserSeriesUsecase>(),
        gh<_i230.UpdateSeriesUsecase>(),
        gh<_i135.GetUsersUsecase>(),
        gh<_i164.GetWithdrawalsInvoicesUsecase>(),
        gh<_i165.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i229.SetApproveSeriesUsecase>(),
        gh<_i228.GetWithdrawnDetailsUsecase>(),
        gh<_i224.AddRejectReasonsUsecase>(),
        gh<_i226.GetRejectReasonsUsecase>(),
        gh<_i225.EditRejectReasonsUsecase>(),
        gh<_i163.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i250.WaitingAgentsCubit>(
      () => _i250.WaitingAgentsCubit(gh<_i233.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i251.AppModule {}
