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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i26;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i89;
import '../../../features/app/domain/repositories/app_repository.dart' as _i88;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i178;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i221;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i46;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i67;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i79;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i78;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i98;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i99;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i100;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i101;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i102;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i192;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i17;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i21;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i20;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i103;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i152;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i22;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i37;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i36;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i60;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i61;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i62;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i64;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i63;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i65;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i179;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i77;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i66;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i27;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i122;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i121;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i144;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i225;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i34;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i58;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i57;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i59;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i120;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i55;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i94;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i93;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i112;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i113;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i114;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i115;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i116;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i117;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i118;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i188;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i82;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i134;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i133;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i202;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i222;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i35;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i69;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i68;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i162;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i163;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i204;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i45;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i105;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i104;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i180;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i181;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i206;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i28;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i85;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i84;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i194;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i195;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i196;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i197;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i203;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i23;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i44;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i43;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i49;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i123;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i124;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i125;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i126;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i224;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i25;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i130;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i129;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i214;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i215;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i153;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i216;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i217;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i155;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i154;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i218;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i219;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i220;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i239;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i29;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i109;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i108;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i166;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i167;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i168;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i145;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i169;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i173;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i146;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i170;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i171;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i172;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i174;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i175;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i176;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i177;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i190;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i30;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i107;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i106;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i199;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i200;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i238;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i24;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i48;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i47;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i160;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i161;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i227;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i56;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i73;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i72;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i119;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i97;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i193;
import '../../../features/sales/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i33;
import '../../../features/sales/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i54;
import '../../../features/sales/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i53;
import '../../../features/sales/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i186;
import '../../../features/sales/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i228;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i16;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i52;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i76;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i91;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i111;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i132;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i90;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i110;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i131;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i207;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i182;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i185;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i208;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i209;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i210;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i211;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i212;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i213;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i151;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i183;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i191;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i236;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i226;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i31;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i96;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i95;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i127;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i128;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i147;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i19;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i71;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i70;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i135;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i136;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i143;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i137;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i138;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i141;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i139;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i140;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i142;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i205;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i80;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i165;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i164;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i229;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i230;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i231;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i232;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i233;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i234;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i235;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i237;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i15;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i41;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i40;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i81;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i92;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i18;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i87;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i86;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i184;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i201;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i13;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i39;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i38;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i42;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i74;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i75;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i149;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i148;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i223;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i240;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i32;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i51;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i50;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i156;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i157;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i158;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i159;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i187;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i198;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i14;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i83;
import 'di_container.dart' as _i241;

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
  gh.lazySingleton<_i16.AgentsDistributorsActionsDataSource>(() =>
      _i16.AgentsDistributorsActionsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i17.ClientsAcceptDatasource>(
      () => _i17.ClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i18.DelayInstallReportsDatasource>(
      () => _i18.DelayInstallReportsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i19.ParticipatesListDatasource>(
      () => _i19.ParticipatesListDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i20.ClientsAcceptRepository>(() =>
      _i21.ClientsAcceptRepositoryImpl(gh<_i17.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i22.TicketsDataSource>(
      () => _i22.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i23.UsersDatasource>(
      () => _i23.UsersDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i24.ExceededClientsDatasource>(
      () => _i24.ExceededClientsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i25.ManageWithdrawalsDatasource>(
      () => _i25.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i26.AppDatasource>(
      () => _i26.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i27.CommunicationListDatasource>(
      () => _i27.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.PrivilegeDatasource>(
      () => _i28.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i29.ClientsListDatasource>(
      () => _i29.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i30.CommentCompanyDatasource>(
      () => _i30.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i31.LinkDatasource>(
      () => _i31.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i32.TaskDatasource>(
      () => _i32.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i33.LatestClientsUpdatesDatasource>(
      () => _i33.LatestClientsUpdatesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i34.CitiesDatasource>(
      () => _i34.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i35.AdvancedConfigsDatasource>(
      () => _i35.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i36.TicketsRepo>(
      () => _i37.TicketsRepoImpl(gh<_i22.TicketsDataSource>()));
  gh.lazySingleton<_i38.SupportClientsAcceptRepository>(() =>
      _i39.SupportClientsAcceptRepositoryImpl(
          gh<_i13.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i40.DelayAfterInstallRepo>(() =>
      _i41.DelayAfterInstallRepoImpl(gh<_i15.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i42.GetSupportClientsAcceptUseCase>(() =>
      _i42.GetSupportClientsAcceptUseCase(
          gh<_i38.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i43.UsersRepository>(
      () => _i44.UsersRepositoryImpl(gh<_i23.UsersDatasource>()));
  gh.lazySingleton<_i45.GeneralConfigsDatasource>(
      () => _i45.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i46.LoginLocalDataSource>(() =>
      _i46.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i47.ExceededClientsRepo>(
      () => _i48.ExceededClientsRepoImpl(gh<_i24.ExceededClientsDatasource>()));
  gh.factory<_i49.ActionUserUsecase>(
      () => _i49.ActionUserUsecase(gh<_i43.UsersRepository>()));
  gh.factory<_i50.TaskRepository>(
      () => _i51.TaskRepositoryImpl(gh<_i32.TaskDatasource>()));
  gh.lazySingleton<_i52.AgentsDistributorsDataSource>(
      () => _i52.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i53.LatestClientsUpdatesRepository>(() =>
      _i54.LatestClientsUpdatesRepositoryImpl(
          gh<_i33.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i55.SupportTabDataSource>(
      () => _i55.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i56.InvoicesTabDataSource>(
      () => _i56.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i57.CitiesRepository>(
      () => _i58.CitiesRepositoryImpl(gh<_i34.CitiesDatasource>()));
  gh.lazySingleton<_i59.GetCitiesUseCase>(
      () => _i59.GetCitiesUseCase(gh<_i57.CitiesRepository>()));
  gh.lazySingleton<_i60.AddTicketUseCase>(
      () => _i60.AddTicketUseCase(gh<_i36.TicketsRepo>()));
  gh.lazySingleton<_i61.EditTicketTypeUseCase>(
      () => _i61.EditTicketTypeUseCase(gh<_i36.TicketsRepo>()));
  gh.lazySingleton<_i62.GetClientTicketsUseCase>(
      () => _i62.GetClientTicketsUseCase(gh<_i36.TicketsRepo>()));
  gh.lazySingleton<_i63.GetTicketsUseCase>(
      () => _i63.GetTicketsUseCase(gh<_i36.TicketsRepo>()));
  gh.lazySingleton<_i64.GetTicketByIdUseCase>(
      () => _i64.GetTicketByIdUseCase(gh<_i36.TicketsRepo>()));
  gh.lazySingleton<_i65.TransferTicketUseCase>(
      () => _i65.TransferTicketUseCase(gh<_i36.TicketsRepo>()));
  gh.factory<_i66.TicketsCubit>(() => _i66.TicketsCubit(
        gh<_i63.GetTicketsUseCase>(),
        gh<_i64.GetTicketByIdUseCase>(),
        gh<_i62.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i67.LoginRemoteDataSource>(
      () => _i67.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i68.AdvancedConfigsRepository>(() =>
      _i69.AdvancedConfigsRepositoryImpl(gh<_i35.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i70.ParticipateListRepository>(() =>
      _i71.ParticipateListRepositoryImpl(
          gh<_i19.ParticipatesListDatasource>()));
  gh.lazySingleton<_i72.InvoicesSectionRepo>(
      () => _i73.InvoicesTabRepoImpl(gh<_i56.InvoicesTabDataSource>()));
  gh.factory<_i74.SupportClientsAcceptCubit>(() =>
      _i74.SupportClientsAcceptCubit(
          gh<_i42.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i75.WaitingAgentsDataSource>(
      () => _i75.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i76.AgentsDistributorsProfileDataSource>(() =>
      _i76.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i77.EditTicketCubit>(() => _i77.EditTicketCubit(
        gh<_i61.EditTicketTypeUseCase>(),
        gh<_i65.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i78.LoginRepo>(() => _i79.LoginRepoImpl(
        gh<_i67.LoginRemoteDataSource>(),
        gh<_i46.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i80.DatesTableDataSource>(
      () => _i80.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i81.GetDelayAfterInstallUseCase>(
      () => _i81.GetDelayAfterInstallUseCase(gh<_i40.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i82.RegionsDatasource>(
      () => _i82.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i83.LocationServices>(
      () => _i83.LocationServices(gh<_i8.Location>()));
  gh.factory<_i84.PrivilegeRepository>(
      () => _i85.PrivilegeRepositoryImpl(gh<_i28.PrivilegeDatasource>()));
  gh.lazySingleton<_i86.DelayInstallReportsRepo>(() =>
      _i87.DelayInstallReportsRepoImpl(
          gh<_i18.DelayInstallReportsDatasource>()));
  gh.factory<_i88.AppRepository>(
      () => _i89.AppRepositoryImpl(gh<_i26.AppDatasource>()));
  gh.lazySingleton<_i90.AgentsDistributorsActionsRepo>(() =>
      _i91.AgentsDistributorsActionsRepoImpl(
          gh<_i16.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i92.DelayAfterInstallCubit>(() =>
      _i92.DelayAfterInstallCubit(gh<_i81.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i93.SupportTabRepo>(
      () => _i94.SupportTabRepoImpl(gh<_i55.SupportTabDataSource>()));
  gh.factory<_i95.LinksImportantRepository>(
      () => _i96.LinkRepositoryImpl(gh<_i31.LinkDatasource>()));
  gh.lazySingleton<_i97.GetInvoicesByPrivilegesUsecase>(() =>
      _i97.GetInvoicesByPrivilegesUsecase(gh<_i72.InvoicesSectionRepo>()));
  gh.lazySingleton<_i98.CacheTokenUsecase>(
      () => _i98.CacheTokenUsecase(gh<_i78.LoginRepo>()));
  gh.lazySingleton<_i99.GetTokenUsecase>(
      () => _i99.GetTokenUsecase(gh<_i78.LoginRepo>()));
  gh.lazySingleton<_i100.LoginUsecase>(
      () => _i100.LoginUsecase(gh<_i78.LoginRepo>()));
  gh.lazySingleton<_i101.ValidateTokenUsecase>(
      () => _i101.ValidateTokenUsecase(gh<_i78.LoginRepo>()));
  gh.lazySingleton<_i102.VerifyOtpUsecase>(
      () => _i102.VerifyOtpUsecase(gh<_i78.LoginRepo>()));
  gh.lazySingleton<_i103.GetClientsAcceptUseCase>(
      () => _i103.GetClientsAcceptUseCase(gh<_i20.ClientsAcceptRepository>()));
  gh.lazySingleton<_i104.GeneralConfigsRepository>(() =>
      _i105.GeneralConfigsRepositoryImpl(gh<_i45.GeneralConfigsDatasource>()));
  gh.factory<_i106.CompanyRepository>(
      () => _i107.CompanyRepositoryImpl(gh<_i30.CommentCompanyDatasource>()));
  gh.factory<_i108.ClientsListRepository>(
      () => _i109.ClientsListRepositoryImpl(gh<_i29.ClientsListDatasource>()));
  gh.lazySingleton<_i110.AgentsDistributorsProfileRepo>(() =>
      _i111.AgentsDistributorsProfileRepoImpl(
          gh<_i76.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i112.AddDateInstallUsecase>(
      () => _i112.AddDateInstallUsecase(gh<_i93.SupportTabRepo>()));
  gh.lazySingleton<_i113.CancelDateInstallUsecase>(
      () => _i113.CancelDateInstallUsecase(gh<_i93.SupportTabRepo>()));
  gh.lazySingleton<_i114.GetInvoiceByClientUsecase>(
      () => _i114.GetInvoiceByClientUsecase(gh<_i93.SupportTabRepo>()));
  gh.lazySingleton<_i115.ReceiveDeviceUsecase>(
      () => _i115.ReceiveDeviceUsecase(gh<_i93.SupportTabRepo>()));
  gh.lazySingleton<_i116.ReturnInvoiceApproveUsecase>(
      () => _i116.ReturnInvoiceApproveUsecase(gh<_i93.SupportTabRepo>()));
  gh.lazySingleton<_i117.SetDateDoneUsecase>(
      () => _i117.SetDateDoneUsecase(gh<_i93.SupportTabRepo>()));
  gh.lazySingleton<_i118.SetReadyInstallUsecase>(
      () => _i118.SetReadyInstallUsecase(gh<_i93.SupportTabRepo>()));
  gh.lazySingleton<_i119.GetAllUsersUseCase>(
      () => _i119.GetAllUsersUseCase(gh<_i72.InvoicesSectionRepo>()));
  gh.singleton<_i120.CitiesCubit>(
      () => _i120.CitiesCubit(gh<_i59.GetCitiesUseCase>()));
  gh.factory<_i121.CommunicationListRepository>(() =>
      _i122.CommunicationListRepositoryImpl(
          gh<_i27.CommunicationListDatasource>()));
  gh.lazySingleton<_i123.GetBranchesForUserUsecase>(
      () => _i123.GetBranchesForUserUsecase(gh<_i43.UsersRepository>()));
  gh.lazySingleton<_i124.GetLevelsForUserUsecase>(
      () => _i124.GetLevelsForUserUsecase(gh<_i43.UsersRepository>()));
  gh.lazySingleton<_i125.GetManagesForUserUsecase>(
      () => _i125.GetManagesForUserUsecase(gh<_i43.UsersRepository>()));
  gh.factory<_i126.GetUsersUsecase>(
      () => _i126.GetUsersUsecase(gh<_i43.UsersRepository>()));
  gh.factory<_i127.ActionLinkUsecase>(
      () => _i127.ActionLinkUsecase(gh<_i95.LinksImportantRepository>()));
  gh.factory<_i128.GetLinkUsecase>(
      () => _i128.GetLinkUsecase(gh<_i95.LinksImportantRepository>()));
  gh.lazySingleton<_i129.ManageWithdrawalsRepository>(() =>
      _i130.ManageWithdrawalsRepositoryImpl(
          gh<_i25.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i131.AgentsDistributorsRepo>(() =>
      _i132.AgentsDistributorsRepoImpl(
          gh<_i52.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i133.RegionsRepository>(
      () => _i134.RegionsRepositoryImpl(gh<_i82.RegionsDatasource>()));
  gh.factory<_i135.AddParticipateCommentUsecase>(() =>
      _i135.AddParticipateCommentUsecase(gh<_i70.ParticipateListRepository>()));
  gh.factory<_i136.AddParticipateUserUsecase>(() =>
      _i136.AddParticipateUserUsecase(gh<_i70.ParticipateListRepository>()));
  gh.factory<_i137.EditParticipateUserUsecase>(() =>
      _i137.EditParticipateUserUsecase(gh<_i70.ParticipateListRepository>()));
  gh.factory<_i138.GetInvoiceByIdUsecase>(
      () => _i138.GetInvoiceByIdUsecase(gh<_i70.ParticipateListRepository>()));
  gh.factory<_i139.ParticipateClientListUsecase>(() =>
      _i139.ParticipateClientListUsecase(gh<_i70.ParticipateListRepository>()));
  gh.factory<_i140.ParticipateCommentListUsecase>(() =>
      _i140.ParticipateCommentListUsecase(
          gh<_i70.ParticipateListRepository>()));
  gh.factory<_i141.ParticipateInvoiceListUsecase>(() =>
      _i141.ParticipateInvoiceListUsecase(
          gh<_i70.ParticipateListRepository>()));
  gh.factory<_i142.ParticipateListUsecase>(
      () => _i142.ParticipateListUsecase(gh<_i70.ParticipateListRepository>()));
  gh.lazySingleton<_i143.ChangeParticipateStatusUsecase>(() =>
      _i143.ChangeParticipateStatusUsecase(
          gh<_i70.ParticipateListRepository>()));
  gh.factory<_i144.GetCommunicationListUsecase>(() =>
      _i144.GetCommunicationListUsecase(
          gh<_i121.CommunicationListRepository>()));
  gh.lazySingleton<_i145.CrudClientSupportFilesUsecase>(() =>
      _i145.CrudClientSupportFilesUsecase(
          repository: gh<_i108.ClientsListRepository>()));
  gh.lazySingleton<_i146.GetClientSupportFilesUsecase>(() =>
      _i146.GetClientSupportFilesUsecase(
          repository: gh<_i108.ClientsListRepository>()));
  gh.factory<_i147.LinkCubit>(() => _i147.LinkCubit(
        gh<_i128.GetLinkUsecase>(),
        gh<_i127.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i148.WaitingAgentsRepo>(
      () => _i149.WaitingAgentsRepoImpl(gh<_i75.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i150.ChangeStateAgentUseCase>(
      () => _i150.ChangeStateAgentUseCase(gh<_i131.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i151.GetAgentsAndDistributorsUseCase>(() =>
      _i151.GetAgentsAndDistributorsUseCase(
          gh<_i131.AgentsDistributorsRepo>()));
  gh.factory<_i152.ClientsAcceptCubit>(
      () => _i152.ClientsAcceptCubit(gh<_i103.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i153.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i153.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i129.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i154.GetWithdrawalsInvoicesUsecase>(() =>
      _i154.GetWithdrawalsInvoicesUsecase(
          gh<_i129.ManageWithdrawalsRepository>()));
  gh.factory<_i155.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i155.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i129.ManageWithdrawalsRepository>()));
  gh.factory<_i156.AddTaskUsecase>(
      () => _i156.AddTaskUsecase(gh<_i50.TaskRepository>()));
  gh.factory<_i157.ChangeStatusTaskUsecase>(
      () => _i157.ChangeStatusTaskUsecase(gh<_i50.TaskRepository>()));
  gh.factory<_i158.FilterTaskUsecase>(
      () => _i158.FilterTaskUsecase(gh<_i50.TaskRepository>()));
  gh.factory<_i159.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i159.GetUsersByDepartmentAndRegionUsecase(gh<_i50.TaskRepository>()));
  gh.lazySingleton<_i160.ExceededClientsUseCase>(
      () => _i160.ExceededClientsUseCase(gh<_i47.ExceededClientsRepo>()));
  gh.lazySingleton<_i161.TransferExceededClientsUseCase>(() =>
      _i161.TransferExceededClientsUseCase(gh<_i47.ExceededClientsRepo>()));
  gh.lazySingleton<_i162.EditAdvancedConfigsUsecase>(() =>
      _i162.EditAdvancedConfigsUsecase(gh<_i68.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i163.GetAdvancedConfigsUsecase>(() =>
      _i163.GetAdvancedConfigsUsecase(gh<_i68.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i164.DatesTableRepo>(
      () => _i165.DatesTableRepoImpl(gh<_i80.DatesTableDataSource>()));
  gh.factory<_i166.AddClientUserUsecase>(
      () => _i166.AddClientUserUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i167.ApproveRejectClientUsecase>(() =>
      _i167.ApproveRejectClientUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i168.ChangeTypeClientUsecase>(
      () => _i168.ChangeTypeClientUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i169.EditClientUserUsecase>(
      () => _i169.EditClientUserUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i170.GetClientsListByRegionUseCase>(() =>
      _i170.GetClientsListByRegionUseCase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i171.GetClientsListByUserUseCase>(() =>
      _i171.GetClientsListByUserUseCase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i172.GetClientsWithFilterUserUsecase>(() =>
      _i172.GetClientsWithFilterUserUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i173.GetClientMarketingReportUsecase>(() =>
      _i173.GetClientMarketingReportUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i174.GetRecommendedClientsUsecase>(() =>
      _i174.GetRecommendedClientsUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i175.GetSimilarClientsUsecase>(
      () => _i175.GetSimilarClientsUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i176.ReceiveClientUserUsecase>(
      () => _i176.ReceiveClientUserUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i177.TransferClientUserUsecase>(
      () => _i177.TransferClientUserUsecase(gh<_i108.ClientsListRepository>()));
  gh.factory<_i178.GetVersionUseCase>(
      () => _i178.GetVersionUseCase(gh<_i88.AppRepository>()));
  gh.factory<_i179.AddTicketCubit>(
      () => _i179.AddTicketCubit(gh<_i60.AddTicketUseCase>()));
  gh.lazySingleton<_i180.EditGeneralConfigsUsecase>(() =>
      _i180.EditGeneralConfigsUsecase(gh<_i104.GeneralConfigsRepository>()));
  gh.lazySingleton<_i181.GetGeneralConfigsUsecase>(() =>
      _i181.GetGeneralConfigsUsecase(gh<_i104.GeneralConfigsRepository>()));
  gh.lazySingleton<_i182.AddAgentUseCase>(
      () => _i182.AddAgentUseCase(gh<_i90.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i183.UpdateAgentUseCase>(
      () => _i183.UpdateAgentUseCase(gh<_i90.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i184.GetDelayInstallReportsUseCase>(() =>
      _i184.GetDelayInstallReportsUseCase(gh<_i86.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i185.CrudAgentSupportFilesUsecase>(() =>
      _i185.CrudAgentSupportFilesUsecase(
          gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i186.GetLatestClientsUseCase>(() =>
      _i186.GetLatestClientsUseCase(gh<_i53.LatestClientsUpdatesRepository>()));
  gh.lazySingleton<_i187.TaskCubit>(() => _i187.TaskCubit(
        gh<_i156.AddTaskUsecase>(),
        gh<_i158.FilterTaskUsecase>(),
        gh<_i157.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i188.SupportTabCubit>(() => _i188.SupportTabCubit(
        gh<_i114.GetInvoiceByClientUsecase>(),
        gh<_i112.AddDateInstallUsecase>(),
        gh<_i117.SetDateDoneUsecase>(),
        gh<_i118.SetReadyInstallUsecase>(),
        gh<_i116.ReturnInvoiceApproveUsecase>(),
        gh<_i115.ReceiveDeviceUsecase>(),
        gh<_i113.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i189.AddAgentDateUseCase>(() =>
      _i189.AddAgentDateUseCase(gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.factory<_i190.ClientsListBloc>(() => _i190.ClientsListBloc(
        gh<_i172.GetClientsWithFilterUserUsecase>(),
        gh<_i174.GetRecommendedClientsUsecase>(),
        gh<_i166.AddClientUserUsecase>(),
        gh<_i169.EditClientUserUsecase>(),
        gh<_i168.ChangeTypeClientUsecase>(),
        gh<_i175.GetSimilarClientsUsecase>(),
        gh<_i167.ApproveRejectClientUsecase>(),
        gh<_i145.CrudClientSupportFilesUsecase>(),
        gh<_i146.GetClientSupportFilesUsecase>(),
        gh<_i177.TransferClientUserUsecase>(),
        gh<_i176.ReceiveClientUserUsecase>(),
        gh<_i173.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i191.AgentsDistributorsActionsCubit>(
      () => _i191.AgentsDistributorsActionsCubit(
            gh<_i59.GetCitiesUseCase>(),
            gh<_i182.AddAgentUseCase>(),
            gh<_i183.UpdateAgentUseCase>(),
          ));
  gh.factory<_i192.LoginCubit>(() => _i192.LoginCubit(
        gh<_i100.LoginUsecase>(),
        gh<_i102.VerifyOtpUsecase>(),
        gh<_i98.CacheTokenUsecase>(),
        gh<_i99.GetTokenUsecase>(),
        gh<_i101.ValidateTokenUsecase>(),
      ));
  gh.factory<_i193.InvoicesSectionCubit>(() => _i193.InvoicesSectionCubit(
        gh<_i97.GetInvoicesByPrivilegesUsecase>(),
        gh<_i151.GetAgentsAndDistributorsUseCase>(),
        gh<_i142.ParticipateListUsecase>(),
        gh<_i119.GetAllUsersUseCase>(),
      ));
  gh.factory<_i194.AddLevelUsecase>(
      () => _i194.AddLevelUsecase(gh<_i84.PrivilegeRepository>()));
  gh.factory<_i195.GetLevelsUsecase>(
      () => _i195.GetLevelsUsecase(gh<_i84.PrivilegeRepository>()));
  gh.factory<_i196.GetPrivilegesUsecase>(
      () => _i196.GetPrivilegesUsecase(gh<_i84.PrivilegeRepository>()));
  gh.factory<_i197.UpdatePrivilegeUsecase>(
      () => _i197.UpdatePrivilegeUsecase(gh<_i84.PrivilegeRepository>()));
  gh.factory<_i198.AttachmentsRowCubit>(() => _i198.AttachmentsRowCubit(
        gh<_i146.GetClientSupportFilesUsecase>(),
        gh<_i145.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i199.AddCommentUsecase>(
      () => _i199.AddCommentUsecase(gh<_i106.CompanyRepository>()));
  gh.factory<_i200.GetCommentUsecase>(
      () => _i200.GetCommentUsecase(gh<_i106.CompanyRepository>()));
  gh.factory<_i201.DelayInstallReportsCubit>(() =>
      _i201.DelayInstallReportsCubit(
          gh<_i184.GetDelayInstallReportsUseCase>()));
  gh.lazySingleton<_i202.GetRegionsByIdCountryUseCase>(
      () => _i202.GetRegionsByIdCountryUseCase(gh<_i133.RegionsRepository>()));
  gh.lazySingleton<_i203.PrivilegeCubit>(() => _i203.PrivilegeCubit(
        gh<_i195.GetLevelsUsecase>(),
        gh<_i196.GetPrivilegesUsecase>(),
        gh<_i197.UpdatePrivilegeUsecase>(),
        gh<_i194.AddLevelUsecase>(),
      ));
  gh.factory<_i204.AdvancedCofigsCubit>(() => _i204.AdvancedCofigsCubit(
        gh<_i163.GetAdvancedConfigsUsecase>(),
        gh<_i162.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i205.ParticipateListBloc>(() => _i205.ParticipateListBloc(
        gh<_i142.ParticipateListUsecase>(),
        gh<_i136.AddParticipateUserUsecase>(),
        gh<_i137.EditParticipateUserUsecase>(),
        gh<_i139.ParticipateClientListUsecase>(),
        gh<_i141.ParticipateInvoiceListUsecase>(),
        gh<_i138.GetInvoiceByIdUsecase>(),
        gh<_i140.ParticipateCommentListUsecase>(),
        gh<_i135.AddParticipateCommentUsecase>(),
        gh<_i143.ChangeParticipateStatusUsecase>(),
      ));
  gh.factory<_i206.GeneralCofigsCubit>(() => _i206.GeneralCofigsCubit(
        gh<_i181.GetGeneralConfigsUsecase>(),
        gh<_i180.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i207.AddAgentCommentUsecase>(() =>
      _i207.AddAgentCommentUsecase(gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i208.DoneTrainingUsecase>(() =>
      _i208.DoneTrainingUsecase(gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i209.GetAgentUsecase>(
      () => _i209.GetAgentUsecase(gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i210.GetAgentClientListUsecase>(() =>
      _i210.GetAgentClientListUsecase(
          gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i211.GetAgentCommentsListUsecase>(() =>
      _i211.GetAgentCommentsListUsecase(
          gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i212.GetAgentDatesListUsecase>(() =>
      _i212.GetAgentDatesListUsecase(
          gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i213.GetAgentInvoiceListUsecase>(() =>
      _i213.GetAgentInvoiceListUsecase(
          gh<_i110.AgentsDistributorsProfileRepo>()));
  gh.factory<_i214.AddRejectReasonsUsecase>(() =>
      _i214.AddRejectReasonsUsecase(gh<_i129.ManageWithdrawalsRepository>()));
  gh.factory<_i215.EditRejectReasonsUsecase>(() =>
      _i215.EditRejectReasonsUsecase(gh<_i129.ManageWithdrawalsRepository>()));
  gh.factory<_i216.GetRejectReasonsUsecase>(() =>
      _i216.GetRejectReasonsUsecase(gh<_i129.ManageWithdrawalsRepository>()));
  gh.factory<_i217.GetUserSeriesUsecase>(() =>
      _i217.GetUserSeriesUsecase(gh<_i129.ManageWithdrawalsRepository>()));
  gh.factory<_i218.GetWithdrawnDetailsUsecase>(() =>
      _i218.GetWithdrawnDetailsUsecase(
          gh<_i129.ManageWithdrawalsRepository>()));
  gh.factory<_i219.SetApproveSeriesUsecase>(() =>
      _i219.SetApproveSeriesUsecase(gh<_i129.ManageWithdrawalsRepository>()));
  gh.factory<_i220.UpdateSeriesUsecase>(
      () => _i220.UpdateSeriesUsecase(gh<_i129.ManageWithdrawalsRepository>()));
  gh.singleton<_i221.AppManagerCubit>(
      () => _i221.AppManagerCubit(gh<_i178.GetVersionUseCase>()));
  gh.factory<_i222.RegionsCubit>(
      () => _i222.RegionsCubit(gh<_i202.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i223.GetWaitingAgentsUsecase>(
      () => _i223.GetWaitingAgentsUsecase(gh<_i148.WaitingAgentsRepo>()));
  gh.factory<_i224.UsersCubit>(() => _i224.UsersCubit(
        gh<_i126.GetUsersUsecase>(),
        gh<_i49.ActionUserUsecase>(),
        gh<_i159.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i125.GetManagesForUserUsecase>(),
        gh<_i124.GetLevelsForUserUsecase>(),
        gh<_i123.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i225.CommunicationListBloc>(() =>
      _i225.CommunicationListBloc(gh<_i144.GetCommunicationListUsecase>()));
  gh.factory<_i226.AgentsDistributorsCubit>(() => _i226.AgentsDistributorsCubit(
        gh<_i151.GetAgentsAndDistributorsUseCase>(),
        gh<_i150.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i227.ExceededClientsCubit>(() => _i227.ExceededClientsCubit(
        gh<_i160.ExceededClientsUseCase>(),
        gh<_i161.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i228.LatestClientsUpdatesCubit>(() =>
      _i228.LatestClientsUpdatesCubit(gh<_i186.GetLatestClientsUseCase>()));
  gh.lazySingleton<_i229.CancelScheduleUsecase>(
      () => _i229.CancelScheduleUsecase(gh<_i164.DatesTableRepo>()));
  gh.lazySingleton<_i230.ChangeDateToDonUsecase>(
      () => _i230.ChangeDateToDonUsecase(gh<_i164.DatesTableRepo>()));
  gh.lazySingleton<_i231.GetDateInstallationUsecase>(
      () => _i231.GetDateInstallationUsecase(gh<_i164.DatesTableRepo>()));
  gh.lazySingleton<_i232.GetInvoicesByClientForDateUsecase>(() =>
      _i232.GetInvoicesByClientForDateUsecase(gh<_i164.DatesTableRepo>()));
  gh.lazySingleton<_i233.GetSubscribedClientsUsecase>(
      () => _i233.GetSubscribedClientsUsecase(gh<_i164.DatesTableRepo>()));
  gh.lazySingleton<_i234.RescheduleDateUsecase>(
      () => _i234.RescheduleDateUsecase(gh<_i164.DatesTableRepo>()));
  gh.lazySingleton<_i235.ReturnScheduleVisitToOpenUsecase>(
      () => _i235.ReturnScheduleVisitToOpenUsecase(gh<_i164.DatesTableRepo>()));
  gh.factory<_i236.AgentsDistributorsProfileBloc>(
      () => _i236.AgentsDistributorsProfileBloc(
            gh<_i210.GetAgentClientListUsecase>(),
            gh<_i213.GetAgentInvoiceListUsecase>(),
            gh<_i138.GetInvoiceByIdUsecase>(),
            gh<_i211.GetAgentCommentsListUsecase>(),
            gh<_i207.AddAgentCommentUsecase>(),
            gh<_i208.DoneTrainingUsecase>(),
            gh<_i189.AddAgentDateUseCase>(),
            gh<_i212.GetAgentDatesListUsecase>(),
            gh<_i185.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i237.DatesTableCubit>(() => _i237.DatesTableCubit(
        gh<_i231.GetDateInstallationUsecase>(),
        gh<_i234.RescheduleDateUsecase>(),
        gh<_i230.ChangeDateToDonUsecase>(),
        gh<_i229.CancelScheduleUsecase>(),
        gh<_i235.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i233.GetSubscribedClientsUsecase>(),
        gh<_i232.GetInvoicesByClientForDateUsecase>(),
        gh<_i112.AddDateInstallUsecase>(),
      ));
  gh.factory<_i238.CompanyCubit>(() => _i238.CompanyCubit(
        gh<_i200.GetCommentUsecase>(),
        gh<_i199.AddCommentUsecase>(),
      ));
  gh.factory<_i239.ManageWithdrawalsCubit>(() => _i239.ManageWithdrawalsCubit(
        gh<_i217.GetUserSeriesUsecase>(),
        gh<_i220.UpdateSeriesUsecase>(),
        gh<_i126.GetUsersUsecase>(),
        gh<_i154.GetWithdrawalsInvoicesUsecase>(),
        gh<_i155.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i219.SetApproveSeriesUsecase>(),
        gh<_i218.GetWithdrawnDetailsUsecase>(),
        gh<_i214.AddRejectReasonsUsecase>(),
        gh<_i216.GetRejectReasonsUsecase>(),
        gh<_i215.EditRejectReasonsUsecase>(),
        gh<_i153.GetFilteredWithdrawalsInvoicesUsecase>(),
      ));
  gh.factory<_i240.WaitingAgentsCubit>(
      () => _i240.WaitingAgentsCubit(gh<_i223.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i241.AppModule {}
