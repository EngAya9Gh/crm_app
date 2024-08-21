// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i17;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:location/location.dart' as _i6;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i16;

import '../../../api/api.dart' as _i5;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i45;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i142;
import '../../../features/app/domain/repositories/app_repository.dart' as _i141;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i249;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i312;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i243;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i104;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i271;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i270;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i287;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i288;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i289;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i290;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i291;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i336;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i23;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i34;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i33;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i155;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i232;
import '../../../features/clients_care/clients_care_reports/data/data_sources/clients_care_reports_datasource.dart'
    as _i22;
import '../../../features/clients_care/clients_care_reports/data/repositories/clients_care_reports_repo_impl.dart'
    as _i76;
import '../../../features/clients_care/clients_care_reports/domain/repositories/clients_care_reports_repo.dart'
    as _i75;
import '../../../features/clients_care/clients_care_reports/domain/use_cases/get_clients_care_reports_usecase.dart'
    as _i92;
import '../../../features/clients_care/clients_care_reports/presentation/manager/clients_care_reports_cubit.dart'
    as _i148;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i40;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i56;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i55;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i97;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i98;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i99;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i101;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i100;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i102;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i250;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i122;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i103;
import '../../../features/clients_care/evaluation_level_report/data/data_sources/evaluation_level_report_datasource.dart'
    as _i10;
import '../../../features/clients_care/evaluation_level_report/data/repositories/evaluation_level_report_repo_impl.dart'
    as _i38;
import '../../../features/clients_care/evaluation_level_report/domain/repositories/evaluation_level_report_repo.dart'
    as _i37;
import '../../../features/clients_care/evaluation_level_report/domain/use_cases/get_evaluation_level_report_usecase.dart'
    as _i80;
import '../../../features/clients_care/evaluation_level_report/presentation/manager/evaluation_level_report_cubit.dart'
    as _i206;
import '../../../features/clients_care/greeting_communication/data/data_sources/greeting_communication_datasource.dart'
    as _i14;
import '../../../features/clients_care/greeting_communication/data/repositories/greeting_communication_repo_impl.dart'
    as _i131;
import '../../../features/clients_care/greeting_communication/domain/repositories/greeting_communication_repo.dart'
    as _i130;
import '../../../features/clients_care/greeting_communication/domain/use_cases/get_greeting_communication_use_case.dart'
    as _i208;
import '../../../features/clients_care/greeting_communication/presentation/manager/greeting_communication_cubit.dart'
    as _i280;
import '../../../features/clients_care/install_quality/data/data_sources/install_quality_datasource.dart'
    as _i39;
import '../../../features/clients_care/install_quality/data/repositories/install_quality_repo_impl.dart'
    as _i136;
import '../../../features/clients_care/install_quality/domain/repositories/install_quality_repo.dart'
    as _i135;
import '../../../features/clients_care/install_quality/domain/use_cases/get_install_use_case.dart'
    as _i161;
import '../../../features/clients_care/install_quality/presentation/manager/install_quality_cubit.dart'
    as _i256;
import '../../../features/clients_care/periodic_communication/data/data_sources/periodic_communication_datasource.dart'
    as _i28;
import '../../../features/clients_care/periodic_communication/data/repositories/periodic_communication_repo_impl.dart'
    as _i175;
import '../../../features/clients_care/periodic_communication/domain/repositories/periodic_communication_repo.dart'
    as _i174;
import '../../../features/clients_care/periodic_communication/domain/use_cases/get_periodic_communication_use_case.dart'
    as _i294;
import '../../../features/clients_care/periodic_communication/presentation/manager/periodic_communication_cubit.dart'
    as _i335;
import '../../../features/clients_care/periodic_communication_reports/data/data_sources/periodic_communication_reports_datasource.dart'
    as _i25;
import '../../../features/clients_care/periodic_communication_reports/data/repositories/periodic_communication_reports_repo_impl.dart'
    as _i31;
import '../../../features/clients_care/periodic_communication_reports/domain/repositories/periodic_communication_reports_repo.dart'
    as _i30;
import '../../../features/clients_care/periodic_communication_reports/domain/use_cases/get_periodic_communication_reports_usecase.dart'
    as _i158;
import '../../../features/clients_care/periodic_communication_reports/presentation/manager/periodic_communication_reports_cubit.dart'
    as _i255;
import '../../../features/clients_care/previous_ratings/data/data_sources/previous_ratings_datasource.dart'
    as _i21;
import '../../../features/clients_care/previous_ratings/data/repositories/previous_ratings_repo_impl.dart'
    as _i88;
import '../../../features/clients_care/previous_ratings/domain/repositories/previous_ratings_repo.dart'
    as _i87;
import '../../../features/clients_care/previous_ratings/domain/use_cases/get_previous_ratings_usecase.dart'
    as _i213;
import '../../../features/clients_care/previous_ratings/presentation/manager/previous_ratings_cubit.dart'
    as _i317;
import '../../../features/clients_care/special_clients/data/data_sources/special_clients_datasource.dart'
    as _i46;
import '../../../features/clients_care/special_clients/data/repositories/special_clients_repository_impl.dart'
    as _i117;
import '../../../features/clients_care/special_clients/domain/repositories/special_clients_repository.dart'
    as _i116;
import '../../../features/clients_care/special_clients/domain/use_cases/get_special_clients_usecase.dart'
    as _i153;
import '../../../features/clients_care/special_clients/presentation/manager/special_clients_bloc.dart'
    as _i276;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i53;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i95;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i94;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i96;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i190;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i89;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i150;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i149;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i164;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i165;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i166;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i167;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i168;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i169;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i170;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i264;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i127;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i192;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i191;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i281;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i313;
import '../../../features/common/users_searchable_dropdown/data/data_sources/users_datasource.dart'
    as _i52;
import '../../../features/common/users_searchable_dropdown/data/repositories/users_repository_impl.dart'
    as _i67;
import '../../../features/common/users_searchable_dropdown/domain/repositories/users_repository.dart'
    as _i66;
import '../../../features/common/users_searchable_dropdown/domain/use_cases/get_users_usecase.dart'
    as _i90;
import '../../../features/common/users_searchable_dropdown/presentation/manager/users_type_cubit.dart'
    as _i193;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i54;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i108;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i107;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i244;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i245;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i284;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i70;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i157;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i156;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i253;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i254;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i293;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i47;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i138;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i137;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i272;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i273;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i274;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i275;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i282;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i42;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i69;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i68;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i79;
import '../../../features/mangement/manage_users/domain/use_cases/get_branches_for_user_usecase.dart'
    as _i178;
import '../../../features/mangement/manage_users/domain/use_cases/get_levels_for_user_usecase.dart'
    as _i179;
import '../../../features/mangement/manage_users/domain/use_cases/get_manages_for_user_usecase.dart'
    as _i180;
import '../../../features/mangement/manage_users/domain/use_cases/get_users_usecase.dart'
    as _i181;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i316;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i32;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i186;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i185;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i305;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/cancel_withdrawal_usecase.dart'
    as _i233;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i306;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i234;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i307;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i308;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i236;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i235;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i309;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i310;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i311;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i320;
import '../../../features/sales/clients/clients_debts/data/data_sources/clients_debts_datasource.dart'
    as _i35;
import '../../../features/sales/clients/clients_debts/data/repositories/clients_debts_repo_impl.dart'
    as _i173;
import '../../../features/sales/clients/clients_debts/domain/repositories/clients_debts_repo.dart'
    as _i172;
import '../../../features/sales/clients/clients_debts/domain/use_cases/get_clients_debts_usecase.dart'
    as _i295;
import '../../../features/sales/clients/clients_debts/presentation/manager/clients_debts_cubit.dart'
    as _i334;
import '../../../features/sales/clients/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i48;
import '../../../features/sales/clients/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i195;
import '../../../features/sales/clients/clients_list/domain/repositories/clients_list_repository.dart'
    as _i194;
import '../../../features/sales/clients/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i216;
import '../../../features/sales/clients/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i217;
import '../../../features/sales/clients/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i218;
import '../../../features/sales/clients/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i296;
import '../../../features/sales/clients/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i219;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i223;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i297;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i220;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i221;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i222;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_high_similar_cleints_usecase.dart'
    as _i228;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i224;
import '../../../features/sales/clients/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i225;
import '../../../features/sales/clients/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i226;
import '../../../features/sales/clients/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i227;
import '../../../features/sales/clients/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i332;
import '../../../features/sales/clients/clients_transfer_approvals/data/data_sources/clients_transfer_approvals_datasource.dart'
    as _i43;
import '../../../features/sales/clients/clients_transfer_approvals/data/repositories/clients_transfer_approvals_repo_impl.dart'
    as _i210;
import '../../../features/sales/clients/clients_transfer_approvals/domain/repositories/clients_transfer_approvals_repo.dart'
    as _i209;
import '../../../features/sales/clients/clients_transfer_approvals/domain/use_cases/get_clients_transfer_approvals_usecase.dart'
    as _i261;
import '../../../features/sales/clients/clients_transfer_approvals/presentation/manager/clients_transfer_approvals_cubit.dart'
    as _i292;
import '../../../features/sales/clients/finance_pending/data/data_sources/finance_pending_datasource.dart'
    as _i36;
import '../../../features/sales/clients/finance_pending/data/repositories/finance_pending_repo_impl.dart'
    as _i72;
import '../../../features/sales/clients/finance_pending/domain/repositories/finance_pending_repo.dart'
    as _i71;
import '../../../features/sales/clients/finance_pending/domain/use_cases/get_finance_pending_invoices_usecase.dart'
    as _i118;
import '../../../features/sales/clients/finance_pending/presentation/manager/finance_pending_cubit.dart'
    as _i145;
import '../../../features/sales/clients/latest_clients_updates/data/data_sources/latest_clients_updates_datasource.dart'
    as _i111;
import '../../../features/sales/clients/latest_clients_updates/data/repositories/latest_clients_updates_repository_impl.dart'
    as _i252;
import '../../../features/sales/clients/latest_clients_updates/domain/repositories/latest_clients_updates_repository.dart'
    as _i251;
import '../../../features/sales/clients/latest_clients_updates/domain/use_cases/get_latest_clients_comments_usecase.dart'
    as _i283;
import '../../../features/sales/clients/latest_clients_updates/presentation/manager/latest_clients_updates_cubit.dart'
    as _i321;
import '../../../features/sales/clients/pending_invoices/data/data_sources/pending_invoices_datasource.dart'
    as _i12;
import '../../../features/sales/clients/pending_invoices/data/repositories/pending_invoices_repo_impl.dart'
    as _i74;
import '../../../features/sales/clients/pending_invoices/domain/repositories/pending_invoices_repo.dart'
    as _i73;
import '../../../features/sales/clients/pending_invoices/domain/use_cases/get_pending_invoices_usecase.dart'
    as _i91;
import '../../../features/sales/clients/pending_invoices/presentation/manager/pending_invoices_cubit.dart'
    as _i205;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i49;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i160;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i159;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i277;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i278;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i333;
import '../../../features/sales/exceeded_clients/data/data_sources/exceeded_clients_datasource.dart'
    as _i44;
import '../../../features/sales/exceeded_clients/data/repositories/exceeded_clients_repo_impl.dart'
    as _i78;
import '../../../features/sales/exceeded_clients/domain/repositories/exceeded_clients_repo.dart'
    as _i77;
import '../../../features/sales/exceeded_clients/domain/use_cases/exceeded_clients_use_case.dart'
    as _i241;
import '../../../features/sales/exceeded_clients/domain/use_cases/transfer_exceeded_clients_use_case.dart'
    as _i242;
import '../../../features/sales/exceeded_clients/presentation/manager/exceeded_clients_cubit.dart'
    as _i319;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i93;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i113;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i112;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i171;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i154;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i269;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i15;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i85;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i121;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i144;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i163;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i188;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i143;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i162;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i187;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i298;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i266;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i257;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i230;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i260;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i299;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i300;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i301;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i302;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i303;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i304;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i231;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i258;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i268;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i331;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i318;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i50;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i152;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i151;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i182;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i183;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i211;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i27;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i110;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i109;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i196;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i197;
import '../../../features/sales/public_relations/participates/domain/use_cases/change_participate_status_usecase.dart'
    as _i204;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i198;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i199;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i200;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i201;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i202;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i203;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i286;
import '../../../features/sales/reports/clients_debts_reports/data/data_sources/clients_debts_reports_datasource.dart'
    as _i20;
import '../../../features/sales/reports/clients_debts_reports/data/repositories/clients_debts_reports_repo_impl.dart'
    as _i60;
import '../../../features/sales/reports/clients_debts_reports/domain/repositories/clients_debts_reports_repo.dart'
    as _i59;
import '../../../features/sales/reports/clients_debts_reports/domain/use_cases/get_clients_debts_reports_usecase.dart'
    as _i129;
import '../../../features/sales/reports/clients_debts_reports/presentation/manager/clients_debts_reports_cubit.dart'
    as _i265;
import '../../../features/sales/reports/clients_status_reports/data/data_sources/clients_status_reports_datasource.dart'
    as _i24;
import '../../../features/sales/reports/clients_status_reports/data/repositories/clients_status_reports_repo_impl.dart'
    as _i124;
import '../../../features/sales/reports/clients_status_reports/domain/repositories/clients_status_reports_repo.dart'
    as _i123;
import '../../../features/sales/reports/clients_status_reports/domain/use_cases/get_clients_status_reports_usecase.dart'
    as _i212;
import '../../../features/sales/reports/clients_status_reports/presentation/manager/clients_status_reports_cubit.dart'
    as _i262;
import '../../../features/sales/reports/employees_sales_reports/data/data_sources/employees_sales_reports_datasource.dart'
    as _i29;
import '../../../features/sales/reports/employees_sales_reports/data/repositories/employees_sales_reports_repo_impl.dart'
    as _i106;
import '../../../features/sales/reports/employees_sales_reports/domain/repositories/employees_sales_reports_repo.dart'
    as _i105;
import '../../../features/sales/reports/employees_sales_reports/domain/use_cases/get_employees_sales_reports_usecase.dart'
    as _i207;
import '../../../features/sales/reports/employees_sales_reports/presentation/manager/employees_sales_reports_cubit.dart'
    as _i229;
import '../../../features/sales/reports/products_sales_reports/data/data_sources/products_sales_reports_datasource.dart'
    as _i13;
import '../../../features/sales/reports/products_sales_reports/data/repositories/products_sales_reports_repo_impl.dart'
    as _i120;
import '../../../features/sales/reports/products_sales_reports/domain/repositories/products_sales_reports_repo.dart'
    as _i119;
import '../../../features/sales/reports/products_sales_reports/domain/use_cases/get_products_sales_reports_usecase.dart'
    as _i189;
import '../../../features/sales/reports/products_sales_reports/presentation/manager/products_sales_reports_cubit.dart'
    as _i315;
import '../../../features/sales/reports/regions_sales_reports/data/data_sources/regions_sales_reports_datasource.dart'
    as _i19;
import '../../../features/sales/reports/regions_sales_reports/data/repositories/regions_sales_reports_repo_impl.dart'
    as _i58;
import '../../../features/sales/reports/regions_sales_reports/domain/repositories/regions_sales_reports_repo.dart'
    as _i57;
import '../../../features/sales/reports/regions_sales_reports/domain/use_cases/get_regions_sales_reports_usecase.dart'
    as _i147;
import '../../../features/sales/reports/regions_sales_reports/presentation/manager/regions_sales_reports_cubit.dart'
    as _i267;
import '../../../features/support/clients_install_reports/data/data_sources/clients_install_reports_datasource.dart'
    as _i18;
import '../../../features/support/clients_install_reports/data/repositories/clients_install_reports_repo_impl.dart'
    as _i82;
import '../../../features/support/clients_install_reports/domain/repositories/clients_install_reports_repo.dart'
    as _i81;
import '../../../features/support/clients_install_reports/domain/use_cases/get_clients_install_reports_usecase.dart'
    as _i86;
import '../../../features/support/clients_install_reports/presentation/manager/clients_install_reports_cubit.dart'
    as _i246;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i125;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i248;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i247;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i323;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i324;
import '../../../features/support/dates_table/domain/use_cases/get_cancel_reasons_usecase.dart'
    as _i325;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i326;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i327;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i328;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i329;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i330;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i337;
import '../../../features/support/delay_after_install/data/data_sources/get_delay_after_install_datasource.dart'
    as _i11;
import '../../../features/support/delay_after_install/data/repositories/delay_after_install_repo_impl.dart'
    as _i64;
import '../../../features/support/delay_after_install/domain/repositories/delay_after_install_repo.dart'
    as _i63;
import '../../../features/support/delay_after_install/domain/use_cases/get_delay_after_install_use_case.dart'
    as _i126;
import '../../../features/support/delay_after_install/presentation/manager/delay_after_install_cubit.dart'
    as _i146;
import '../../../features/support/delay_install_reports/data/data_sources/delay_install_reports_datasource.dart'
    as _i26;
import '../../../features/support/delay_install_reports/data/repositories/delay_install_reports_repo_impl.dart'
    as _i140;
import '../../../features/support/delay_install_reports/domain/repositories/delay_install_reports_repo.dart'
    as _i139;
import '../../../features/support/delay_install_reports/domain/use_cases/get_delay_install_reports_use_case.dart'
    as _i259;
import '../../../features/support/delay_install_reports/presentation/manager/delay_install_reports_cubit.dart'
    as _i279;
import '../../../features/support/support_accept_clients/data/data_sources/support_clients_accept_datasource.dart'
    as _i9;
import '../../../features/support/support_accept_clients/data/repositories/support_clients_accept_repository_impl.dart'
    as _i62;
import '../../../features/support/support_accept_clients/domain/repositories/support_clients_accept_repository.dart'
    as _i61;
import '../../../features/support/support_accept_clients/domain/use_cases/get_support_clients_accept_use_case.dart'
    as _i65;
import '../../../features/support/support_accept_clients/presentation/manager/support_clients_accept_cubit.dart'
    as _i114;
import '../../../features/support/support_clients_invoices/data/data_sources/support_clients_invoices_datasource.dart'
    as _i41;
import '../../../features/support/support_clients_invoices/data/repositories/support_clients_invoices_repo_impl.dart'
    as _i177;
import '../../../features/support/support_clients_invoices/domain/repositories/support_clients_invoices_repo.dart'
    as _i176;
import '../../../features/support/support_clients_invoices/domain/use_cases/get_support_clients_invoices_use_case.dart'
    as _i184;
import '../../../features/support/support_clients_invoices/presentation/manager/support_clients_invoices_cubit.dart'
    as _i285;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i115;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i215;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i214;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i314;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i338;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i51;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i84;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i83;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i237;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i238;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i239;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i240;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i263;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i322;
import '../api/api_services.dart' as _i7;
import '../api/dio/dio_services.dart' as _i8;
import '../cache_services/cache_services.dart' as _i132;
import '../cache_services/prefs_consumer.dart' as _i134;
import '../cache_services/secure_storage_consumer.dart' as _i133;
import '../maps/location_services.dart' as _i128;
import 'di_container.dart' as _i339;

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
  gh.lazySingleton<_i10.EvaluationLevelReportDatasource>(
      () => _i10.EvaluationLevelReportDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i11.DelayAfterInstallDatasource>(
      () => _i11.DelayAfterInstallDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i12.PendingInvoicesDatasource>(
      () => _i12.PendingInvoicesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i13.ProductsSalesReportsDatasource>(
      () => _i13.ProductsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i14.GreetingCommunicationDatasource>(
      () => _i14.GreetingCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i15.AgentsDistributorsActionsDataSource>(() =>
      _i15.AgentsDistributorsActionsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i16.SharedPreferences>(
    () => appModule.sharedPreferences,
    registerFor: {_dev},
  );
  gh.singleton<_i17.FlutterSecureStorage>(
    () => appModule.secureStorage,
    registerFor: {_dev},
  );
  gh.lazySingleton<_i18.ClientsInstallReportsDatasource>(
      () => _i18.ClientsInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i19.RegionsSalesReportsDatasource>(
      () => _i19.RegionsSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i20.ClientsDebtsReportsDatasource>(
      () => _i20.ClientsDebtsReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i21.PreviousRatingsDatasource>(
      () => _i21.PreviousRatingsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i22.ClientsCareReportsDatasource>(
      () => _i22.ClientsCareReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i23.ClientsAcceptDatasource>(
      () => _i23.ClientsAcceptDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i24.ClientsStatusReportsDatasource>(
      () => _i24.ClientsStatusReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i25.PeriodicCommunicationReportsDatasource>(() =>
      _i25.PeriodicCommunicationReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i26.DelayInstallReportsDatasource>(
      () => _i26.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i27.ParticipatesListDatasource>(
      () => _i27.ParticipatesListDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i28.PeriodicCommunicationDatasource>(
      () => _i28.PeriodicCommunicationDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i29.EmployeesSalesReportsDatasource>(
      () => _i29.EmployeesSalesReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i30.PeriodicCommunicationReportsRepo>(() =>
      _i31.PeriodicCommunicationReportsRepoImpl(
          gh<_i25.PeriodicCommunicationReportsDatasource>()));
  gh.lazySingleton<_i32.ManageWithdrawalsDatasource>(
      () => _i32.ManageWithdrawalsDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i33.ClientsAcceptRepository>(() =>
      _i34.ClientsAcceptRepositoryImpl(gh<_i23.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i35.ClientsDebtsDatasource>(
      () => _i35.ClientsDebtsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i36.FinancePendingDatasource>(
      () => _i36.FinancePendingDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i37.EvaluationLevelReportRepo>(() =>
      _i38.EvaluationLevelReportRepoImpl(
          gh<_i10.EvaluationLevelReportDatasource>()));
  gh.lazySingleton<_i39.InstallQualityDatasource>(
      () => _i39.InstallQualityDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i40.TicketsDataSource>(
      () => _i40.TicketsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i41.SupportClientsInvoicesDatasource>(
      () => _i41.DelayInstallReportsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i42.UsersDatasource>(
      () => _i42.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.singletonAsync<_i16.SharedPreferences>(
    () => appModule.sharedPreferencesTest,
    registerFor: {_test},
  );
  gh.singleton<_i17.FlutterSecureStorage>(
    () => appModule.secureStorageTest,
    registerFor: {_test},
  );
  gh.lazySingleton<_i43.ClientsTransferApprovalsDatasource>(
      () => _i43.ClientsTransferApprovalsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i44.ExceededClientsDatasource>(
      () => _i44.ExceededClientsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i45.AppDatasource>(
      () => _i45.AppDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i46.SpecialClientsDatasource>(
      () => _i46.SpecialClientsDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i47.PrivilegeDatasource>(
      () => _i47.PrivilegeDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i48.ClientsListDatasource>(
      () => _i48.ClientsListDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i49.CommentCompanyDatasource>(
      () => _i49.CommentCompanyDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i50.LinkDatasource>(
      () => _i50.LinkDatasource(gh<_i7.ApiServices>()));
  gh.factory<_i51.TaskDatasource>(
      () => _i51.TaskDatasource(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i52.UsersDatasource>(
      () => _i52.UsersDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i53.CitiesDatasource>(
      () => _i53.CitiesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i54.AdvancedConfigsDatasource>(
      () => _i54.AdvancedConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i55.TicketsRepo>(
      () => _i56.TicketsRepoImpl(gh<_i40.TicketsDataSource>()));
  gh.lazySingleton<_i57.RegionsSalesReportsRepo>(() =>
      _i58.RegionsSalesReportsRepoImpl(
          gh<_i19.RegionsSalesReportsDatasource>()));
  gh.lazySingleton<_i59.ClientsDebtsReportsRepo>(() =>
      _i60.ClientsDebtsReportsRepoImpl(
          gh<_i20.ClientsDebtsReportsDatasource>()));
  gh.lazySingleton<_i61.SupportClientsAcceptRepository>(() =>
      _i62.SupportClientsAcceptRepositoryImpl(
          gh<_i9.SupportClientsAcceptDatasource>()));
  gh.lazySingleton<_i63.DelayAfterInstallRepo>(() =>
      _i64.DelayAfterInstallRepoImpl(gh<_i11.DelayAfterInstallDatasource>()));
  gh.lazySingleton<_i65.GetSupportClientsAcceptUseCase>(() =>
      _i65.GetSupportClientsAcceptUseCase(
          gh<_i61.SupportClientsAcceptRepository>()));
  gh.lazySingleton<_i66.UsersRepository>(
      () => _i67.UsersRepositoryImpl(gh<_i52.UsersDatasource>()));
  gh.lazySingleton<_i68.UsersRepository>(
      () => _i69.UsersRepositoryImpl(gh<_i42.UsersDatasource>()));
  gh.lazySingleton<_i70.GeneralConfigsDatasource>(
      () => _i70.GeneralConfigsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i71.FinancePendingRepo>(
      () => _i72.FinancePendingRepoImpl(gh<_i36.FinancePendingDatasource>()));
  gh.lazySingleton<_i73.PendingInvoicesRepo>(
      () => _i74.PendingInvoicesRepoImpl(gh<_i12.PendingInvoicesDatasource>()));
  gh.lazySingleton<_i75.ClientsCareReportsRepo>(() =>
      _i76.ClientsCareReportsRepoImpl(gh<_i22.ClientsCareReportsDatasource>()));
  gh.lazySingleton<_i77.ExceededClientsRepo>(
      () => _i78.ExceededClientsRepoImpl(gh<_i44.ExceededClientsDatasource>()));
  gh.factory<_i79.ActionUserUsecase>(
      () => _i79.ActionUserUsecase(gh<_i68.UsersRepository>()));
  gh.lazySingleton<_i80.GetEvaluationLevelReportUsecase>(() =>
      _i80.GetEvaluationLevelReportUsecase(
          gh<_i37.EvaluationLevelReportRepo>()));
  gh.lazySingleton<_i81.ClientsInstallReportsRepo>(() =>
      _i82.ClientsInstallReportsRepoImpl(
          gh<_i18.ClientsInstallReportsDatasource>()));
  gh.factory<_i83.TaskRepository>(
      () => _i84.TaskRepositoryImpl(gh<_i51.TaskDatasource>()));
  gh.lazySingleton<_i85.AgentsDistributorsDataSource>(
      () => _i85.AgentsDistributorsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i86.GetClientsInstallReportsUsecase>(() =>
      _i86.GetClientsInstallReportsUsecase(
          gh<_i81.ClientsInstallReportsRepo>()));
  gh.lazySingleton<_i87.PreviousRatingsRepo>(
      () => _i88.PreviousRatingsRepoImpl(gh<_i21.PreviousRatingsDatasource>()));
  gh.lazySingleton<_i89.SupportTabDataSource>(
      () => _i89.SupportTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i90.GetUsersUsecase>(
      () => _i90.GetUsersUsecase(gh<_i66.UsersRepository>()));
  gh.lazySingleton<_i91.GetPendingInvoicesUsecase>(
      () => _i91.GetPendingInvoicesUsecase(gh<_i73.PendingInvoicesRepo>()));
  gh.lazySingleton<_i92.GetClientsCareReportsUsecase>(() =>
      _i92.GetClientsCareReportsUsecase(gh<_i75.ClientsCareReportsRepo>()));
  gh.lazySingleton<_i93.InvoicesTabDataSource>(
      () => _i93.InvoicesTabDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i94.CitiesRepository>(
      () => _i95.CitiesRepositoryImpl(gh<_i53.CitiesDatasource>()));
  gh.lazySingleton<_i96.GetCitiesUseCase>(
      () => _i96.GetCitiesUseCase(gh<_i94.CitiesRepository>()));
  gh.lazySingleton<_i97.AddTicketUseCase>(
      () => _i97.AddTicketUseCase(gh<_i55.TicketsRepo>()));
  gh.lazySingleton<_i98.EditTicketTypeUseCase>(
      () => _i98.EditTicketTypeUseCase(gh<_i55.TicketsRepo>()));
  gh.lazySingleton<_i99.GetClientTicketsUseCase>(
      () => _i99.GetClientTicketsUseCase(gh<_i55.TicketsRepo>()));
  gh.lazySingleton<_i100.GetTicketsUseCase>(
      () => _i100.GetTicketsUseCase(gh<_i55.TicketsRepo>()));
  gh.lazySingleton<_i101.GetTicketByIdUseCase>(
      () => _i101.GetTicketByIdUseCase(gh<_i55.TicketsRepo>()));
  gh.lazySingleton<_i102.TransferTicketUseCase>(
      () => _i102.TransferTicketUseCase(gh<_i55.TicketsRepo>()));
  gh.factory<_i103.TicketsCubit>(() => _i103.TicketsCubit(
        gh<_i100.GetTicketsUseCase>(),
        gh<_i101.GetTicketByIdUseCase>(),
        gh<_i99.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i104.LoginRemoteDataSource>(
      () => _i104.LoginRemoteDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i105.EmployeesSalesReportsRepo>(() =>
      _i106.EmployeesSalesReportsRepoImpl(
          gh<_i29.EmployeesSalesReportsDatasource>()));
  gh.lazySingleton<_i107.AdvancedConfigsRepository>(() =>
      _i108.AdvancedConfigsRepositoryImpl(
          gh<_i54.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i109.ParticipateListRepository>(() =>
      _i110.ParticipateListRepositoryImpl(
          gh<_i27.ParticipatesListDatasource>()));
  gh.lazySingleton<_i111.LatestClientsUpdatesDatasource>(
      () => _i111.LatestClientsUpdatesDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i112.InvoicesSectionRepo>(
      () => _i113.InvoicesTabRepoImpl(gh<_i93.InvoicesTabDataSource>()));
  gh.factory<_i114.SupportClientsAcceptCubit>(() =>
      _i114.SupportClientsAcceptCubit(
          gh<_i65.GetSupportClientsAcceptUseCase>()));
  gh.lazySingleton<_i115.WaitingAgentsDataSource>(
      () => _i115.WaitingAgentsDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i116.SpecialClientsRepository>(() =>
      _i117.SpecialClientsRepositoryImpl(gh<_i46.SpecialClientsDatasource>()));
  gh.lazySingleton<_i118.GetFinancePendingInvoicesUsecase>(() =>
      _i118.GetFinancePendingInvoicesUsecase(gh<_i71.FinancePendingRepo>()));
  gh.lazySingleton<_i119.ProductsSalesReportsRepo>(() =>
      _i120.ProductsSalesReportsRepoImpl(
          gh<_i13.ProductsSalesReportsDatasource>()));
  gh.lazySingleton<_i121.AgentsDistributorsProfileDataSource>(() =>
      _i121.AgentsDistributorsProfileDataSourceImpl(gh<_i7.ApiServices>()));
  gh.factory<_i122.EditTicketCubit>(() => _i122.EditTicketCubit(
        gh<_i98.EditTicketTypeUseCase>(),
        gh<_i102.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i123.ClientsStatusReportsRepo>(() =>
      _i124.ClientsStatusReportsRepoImpl(
          gh<_i24.ClientsStatusReportsDatasource>()));
  gh.lazySingleton<_i125.DatesTableDataSource>(
      () => _i125.DatesTableDataSourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i126.GetDelayAfterInstallUseCase>(() =>
      _i126.GetDelayAfterInstallUseCase(gh<_i63.DelayAfterInstallRepo>()));
  gh.lazySingleton<_i127.RegionsDatasource>(
      () => _i127.RegionsDatasourceImpl(gh<_i7.ApiServices>()));
  gh.lazySingleton<_i128.LocationServices>(
      () => _i128.LocationServices(gh<_i6.Location>()));
  gh.lazySingleton<_i129.GetClientsDebtsReportsUsecase>(() =>
      _i129.GetClientsDebtsReportsUsecase(gh<_i59.ClientsDebtsReportsRepo>()));
  gh.lazySingleton<_i130.GreetingCommunicationRepo>(() =>
      _i131.GreetingCommunicationRepoImpl(
          gh<_i14.GreetingCommunicationDatasource>()));
  gh.singleton<_i132.CacheServices>(
    () => _i133.SecureStorageConsumer(gh<_i17.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.singletonAsync<_i132.CacheServices>(() async =>
      _i134.PrefsConsumer(await gh.getAsync<_i16.SharedPreferences>()));
  gh.lazySingleton<_i135.InstallQualityRepo>(
      () => _i136.InstallQualityRepoImpl(gh<_i39.InstallQualityDatasource>()));
  gh.factory<_i137.PrivilegeRepository>(
      () => _i138.PrivilegeRepositoryImpl(gh<_i47.PrivilegeDatasource>()));
  gh.lazySingleton<_i139.DelayInstallReportsRepo>(() =>
      _i140.DelayInstallReportsRepoImpl(
          gh<_i26.DelayInstallReportsDatasource>()));
  gh.factory<_i141.AppRepository>(
      () => _i142.AppRepositoryImpl(gh<_i45.AppDatasource>()));
  gh.lazySingleton<_i143.AgentsDistributorsActionsRepo>(() =>
      _i144.AgentsDistributorsActionsRepoImpl(
          gh<_i15.AgentsDistributorsActionsDataSource>()));
  gh.factory<_i145.FinancePendingCubit>(() =>
      _i145.FinancePendingCubit(gh<_i118.GetFinancePendingInvoicesUsecase>()));
  gh.factory<_i146.DelayAfterInstallCubit>(() =>
      _i146.DelayAfterInstallCubit(gh<_i126.GetDelayAfterInstallUseCase>()));
  gh.lazySingleton<_i147.GetRegionsSalesReportsUsecase>(() =>
      _i147.GetRegionsSalesReportsUsecase(gh<_i57.RegionsSalesReportsRepo>()));
  gh.factory<_i148.ClientsCareReportsCubit>(() =>
      _i148.ClientsCareReportsCubit(gh<_i92.GetClientsCareReportsUsecase>()));
  gh.lazySingleton<_i149.SupportTabRepo>(
      () => _i150.SupportTabRepoImpl(gh<_i89.SupportTabDataSource>()));
  gh.factory<_i151.LinksImportantRepository>(
      () => _i152.LinkRepositoryImpl(gh<_i50.LinkDatasource>()));
  gh.factory<_i153.GetSpecialClientsUsecase>(() =>
      _i153.GetSpecialClientsUsecase(gh<_i116.SpecialClientsRepository>()));
  gh.lazySingleton<_i154.GetInvoicesByPrivilegesUsecase>(() =>
      _i154.GetInvoicesByPrivilegesUsecase(gh<_i112.InvoicesSectionRepo>()));
  gh.lazySingleton<_i155.GetClientsAcceptUseCase>(
      () => _i155.GetClientsAcceptUseCase(gh<_i33.ClientsAcceptRepository>()));
  gh.lazySingleton<_i156.GeneralConfigsRepository>(() =>
      _i157.GeneralConfigsRepositoryImpl(gh<_i70.GeneralConfigsDatasource>()));
  gh.lazySingleton<_i158.GetPeriodicCommunicationReportsUsecase>(() =>
      _i158.GetPeriodicCommunicationReportsUsecase(
          gh<_i30.PeriodicCommunicationReportsRepo>()));
  gh.factory<_i159.CompanyRepository>(
      () => _i160.CompanyRepositoryImpl(gh<_i49.CommentCompanyDatasource>()));
  gh.lazySingleton<_i161.GetInstallUseCase>(
      () => _i161.GetInstallUseCase(gh<_i135.InstallQualityRepo>()));
  gh.lazySingleton<_i162.AgentsDistributorsProfileRepo>(() =>
      _i163.AgentsDistributorsProfileRepoImpl(
          gh<_i121.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i164.AddDateInstallUsecase>(
      () => _i164.AddDateInstallUsecase(gh<_i149.SupportTabRepo>()));
  gh.lazySingleton<_i165.CancelDateInstallUsecase>(
      () => _i165.CancelDateInstallUsecase(gh<_i149.SupportTabRepo>()));
  gh.lazySingleton<_i166.GetInvoiceByClientUsecase>(
      () => _i166.GetInvoiceByClientUsecase(gh<_i149.SupportTabRepo>()));
  gh.lazySingleton<_i167.ReceiveDeviceUsecase>(
      () => _i167.ReceiveDeviceUsecase(gh<_i149.SupportTabRepo>()));
  gh.lazySingleton<_i168.ReturnInvoiceApproveUsecase>(
      () => _i168.ReturnInvoiceApproveUsecase(gh<_i149.SupportTabRepo>()));
  gh.lazySingleton<_i169.SetDateDoneUsecase>(
      () => _i169.SetDateDoneUsecase(gh<_i149.SupportTabRepo>()));
  gh.lazySingleton<_i170.SetReadyInstallUsecase>(
      () => _i170.SetReadyInstallUsecase(gh<_i149.SupportTabRepo>()));
  gh.lazySingleton<_i171.GetAllUsersUseCase>(
      () => _i171.GetAllUsersUseCase(gh<_i112.InvoicesSectionRepo>()));
  gh.lazySingleton<_i172.ClientsDebtsRepo>(
      () => _i173.ClientsDebtsRepoImpl(gh<_i35.ClientsDebtsDatasource>()));
  gh.lazySingleton<_i174.PeriodicCommunicationRepo>(() =>
      _i175.PeriodicCommunicationRepoImpl(
          gh<_i28.PeriodicCommunicationDatasource>()));
  gh.lazySingleton<_i176.SupportClientsInvoicesRepo>(() =>
      _i177.SupportClientsInvoicesRepoImpl(
          gh<_i41.SupportClientsInvoicesDatasource>()));
  gh.lazySingleton<_i178.GetBranchesForUserUsecase>(
      () => _i178.GetBranchesForUserUsecase(gh<_i68.UsersRepository>()));
  gh.lazySingleton<_i179.GetLevelsForUserUsecase>(
      () => _i179.GetLevelsForUserUsecase(gh<_i68.UsersRepository>()));
  gh.lazySingleton<_i180.GetManagesForUserUsecase>(
      () => _i180.GetManagesForUserUsecase(gh<_i68.UsersRepository>()));
  gh.factory<_i181.GetUsersUsecase>(
      () => _i181.GetUsersUsecase(gh<_i68.UsersRepository>()));
  gh.factory<_i182.ActionLinkUsecase>(
      () => _i182.ActionLinkUsecase(gh<_i151.LinksImportantRepository>()));
  gh.factory<_i183.GetLinkUsecase>(
      () => _i183.GetLinkUsecase(gh<_i151.LinksImportantRepository>()));
  gh.lazySingleton<_i184.GetSupportClientsInvoicesUseCase>(() =>
      _i184.GetSupportClientsInvoicesUseCase(
          gh<_i176.SupportClientsInvoicesRepo>()));
  gh.lazySingleton<_i185.ManageWithdrawalsRepository>(() =>
      _i186.ManageWithdrawalsRepositoryImpl(
          gh<_i32.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i187.AgentsDistributorsRepo>(() =>
      _i188.AgentsDistributorsRepoImpl(
          gh<_i85.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i189.GetProductsSalesReportsUsecase>(() =>
      _i189.GetProductsSalesReportsUsecase(
          gh<_i119.ProductsSalesReportsRepo>()));
  gh.singleton<_i190.CitiesCubit>(
      () => _i190.CitiesCubit(gh<_i96.GetCitiesUseCase>()));
  gh.lazySingleton<_i191.RegionsRepository>(
      () => _i192.RegionsRepositoryImpl(gh<_i127.RegionsDatasource>()));
  gh.factory<_i193.UsersTypeCubit>(
      () => _i193.UsersTypeCubit(gh<_i90.GetUsersUsecase>()));
  gh.factory<_i194.ClientsListRepository>(
      () => _i195.ClientsListRepositoryImpl(gh<_i48.ClientsListDatasource>()));
  gh.factory<_i196.AddParticipateCommentUsecase>(() =>
      _i196.AddParticipateCommentUsecase(
          gh<_i109.ParticipateListRepository>()));
  gh.factory<_i197.AddParticipateUserUsecase>(() =>
      _i197.AddParticipateUserUsecase(gh<_i109.ParticipateListRepository>()));
  gh.factory<_i198.EditParticipateUserUsecase>(() =>
      _i198.EditParticipateUserUsecase(gh<_i109.ParticipateListRepository>()));
  gh.factory<_i199.GetInvoiceByIdUsecase>(
      () => _i199.GetInvoiceByIdUsecase(gh<_i109.ParticipateListRepository>()));
  gh.factory<_i200.ParticipateClientListUsecase>(() =>
      _i200.ParticipateClientListUsecase(
          gh<_i109.ParticipateListRepository>()));
  gh.factory<_i201.ParticipateCommentListUsecase>(() =>
      _i201.ParticipateCommentListUsecase(
          gh<_i109.ParticipateListRepository>()));
  gh.factory<_i202.ParticipateInvoiceListUsecase>(() =>
      _i202.ParticipateInvoiceListUsecase(
          gh<_i109.ParticipateListRepository>()));
  gh.factory<_i203.ParticipateListUsecase>(() =>
      _i203.ParticipateListUsecase(gh<_i109.ParticipateListRepository>()));
  gh.lazySingleton<_i204.ChangeParticipateStatusUsecase>(() =>
      _i204.ChangeParticipateStatusUsecase(
          gh<_i109.ParticipateListRepository>()));
  gh.factory<_i205.PendingInvoicesCubit>(
      () => _i205.PendingInvoicesCubit(gh<_i91.GetPendingInvoicesUsecase>()));
  gh.factory<_i206.EvaluationLevelReportCubit>(() =>
      _i206.EvaluationLevelReportCubit(
          gh<_i80.GetEvaluationLevelReportUsecase>()));
  gh.lazySingleton<_i207.GetEmployeesSalesReportsUsecase>(() =>
      _i207.GetEmployeesSalesReportsUsecase(
          gh<_i105.EmployeesSalesReportsRepo>()));
  gh.lazySingleton<_i208.GetGreetingCommunicationUseCase>(() =>
      _i208.GetGreetingCommunicationUseCase(
          gh<_i130.GreetingCommunicationRepo>()));
  gh.lazySingleton<_i209.ClientsTransferApprovalsRepo>(() =>
      _i210.ClientsTransferApprovalsRepoImpl(
          gh<_i43.ClientsTransferApprovalsDatasource>()));
  gh.factory<_i211.LinkCubit>(() => _i211.LinkCubit(
        gh<_i183.GetLinkUsecase>(),
        gh<_i182.ActionLinkUsecase>(),
      ));
  gh.lazySingleton<_i212.GetClientsStatusReportsUsecase>(() =>
      _i212.GetClientsStatusReportsUsecase(
          gh<_i123.ClientsStatusReportsRepo>()));
  gh.lazySingleton<_i213.GetPreviousRatingsUsecase>(
      () => _i213.GetPreviousRatingsUsecase(gh<_i87.PreviousRatingsRepo>()));
  gh.lazySingleton<_i214.WaitingAgentsRepo>(
      () => _i215.WaitingAgentsRepoImpl(gh<_i115.WaitingAgentsDataSource>()));
  gh.factory<_i216.AddClientUserUsecase>(
      () => _i216.AddClientUserUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i217.ApproveRejectClientUsecase>(() =>
      _i217.ApproveRejectClientUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i218.ChangeTypeClientUsecase>(
      () => _i218.ChangeTypeClientUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i219.EditClientUserUsecase>(
      () => _i219.EditClientUserUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i220.GetClientsListByRegionUseCase>(() =>
      _i220.GetClientsListByRegionUseCase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i221.GetClientsListByUserUseCase>(() =>
      _i221.GetClientsListByUserUseCase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i222.GetClientsWithFilterUserUsecase>(() =>
      _i222.GetClientsWithFilterUserUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i223.GetClientMarketingReportUsecase>(() =>
      _i223.GetClientMarketingReportUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i224.GetRecommendedClientsUsecase>(() =>
      _i224.GetRecommendedClientsUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i225.GetSimilarClientsUsecase>(
      () => _i225.GetSimilarClientsUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i226.ReceiveClientUserUsecase>(
      () => _i226.ReceiveClientUserUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i227.TransferClientUserUsecase>(
      () => _i227.TransferClientUserUsecase(gh<_i194.ClientsListRepository>()));
  gh.lazySingleton<_i228.GetHighSimilarClientsUsecase>(() =>
      _i228.GetHighSimilarClientsUsecase(gh<_i194.ClientsListRepository>()));
  gh.factory<_i229.EmployeesSalesReportsCubit>(() =>
      _i229.EmployeesSalesReportsCubit(
          gh<_i207.GetEmployeesSalesReportsUsecase>()));
  gh.lazySingleton<_i230.ChangeStateAgentUseCase>(
      () => _i230.ChangeStateAgentUseCase(gh<_i187.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i231.GetAgentsAndDistributorsUseCase>(() =>
      _i231.GetAgentsAndDistributorsUseCase(
          gh<_i187.AgentsDistributorsRepo>()));
  gh.factory<_i232.ClientsAcceptCubit>(
      () => _i232.ClientsAcceptCubit(gh<_i155.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i233.CancelWithdrawalUsecase>(() =>
      _i233.CancelWithdrawalUsecase(gh<_i185.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i234.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i234.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i185.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i235.GetWithdrawalsInvoicesUsecase>(() =>
      _i235.GetWithdrawalsInvoicesUsecase(
          gh<_i185.ManageWithdrawalsRepository>()));
  gh.factory<_i236.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i236.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i185.ManageWithdrawalsRepository>()));
  gh.factory<_i237.AddTaskUsecase>(
      () => _i237.AddTaskUsecase(gh<_i83.TaskRepository>()));
  gh.factory<_i238.ChangeStatusTaskUsecase>(
      () => _i238.ChangeStatusTaskUsecase(gh<_i83.TaskRepository>()));
  gh.factory<_i239.FilterTaskUsecase>(
      () => _i239.FilterTaskUsecase(gh<_i83.TaskRepository>()));
  gh.factory<_i240.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i240.GetUsersByDepartmentAndRegionUsecase(gh<_i83.TaskRepository>()));
  gh.lazySingleton<_i241.ExceededClientsUseCase>(
      () => _i241.ExceededClientsUseCase(gh<_i77.ExceededClientsRepo>()));
  gh.lazySingleton<_i242.TransferExceededClientsUseCase>(() =>
      _i242.TransferExceededClientsUseCase(gh<_i77.ExceededClientsRepo>()));
  gh.lazySingleton<_i243.LoginLocalDataSource>(() =>
      _i243.LoginLocalDataSourceImpl(
          gh<_i132.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.lazySingleton<_i244.EditAdvancedConfigsUsecase>(() =>
      _i244.EditAdvancedConfigsUsecase(gh<_i107.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i245.GetAdvancedConfigsUsecase>(() =>
      _i245.GetAdvancedConfigsUsecase(gh<_i107.AdvancedConfigsRepository>()));
  gh.factory<_i246.ClientsInstallReportsCubit>(() =>
      _i246.ClientsInstallReportsCubit(
          gh<_i86.GetClientsInstallReportsUsecase>()));
  gh.lazySingleton<_i247.DatesTableRepo>(
      () => _i248.DatesTableRepoImpl(gh<_i125.DatesTableDataSource>()));
  gh.factory<_i249.GetVersionUseCase>(
      () => _i249.GetVersionUseCase(gh<_i141.AppRepository>()));
  gh.factory<_i250.AddTicketCubit>(
      () => _i250.AddTicketCubit(gh<_i97.AddTicketUseCase>()));
  gh.lazySingleton<_i251.LatestClientsUpdatesRepository>(() =>
      _i252.LatestClientsUpdatesRepositoryImpl(
          gh<_i111.LatestClientsUpdatesDatasource>()));
  gh.lazySingleton<_i253.EditGeneralConfigsUsecase>(() =>
      _i253.EditGeneralConfigsUsecase(gh<_i156.GeneralConfigsRepository>()));
  gh.lazySingleton<_i254.GetGeneralConfigsUsecase>(() =>
      _i254.GetGeneralConfigsUsecase(gh<_i156.GeneralConfigsRepository>()));
  gh.factory<_i255.PeriodicCommunicationReportsCubit>(() =>
      _i255.PeriodicCommunicationReportsCubit(
          gh<_i158.GetPeriodicCommunicationReportsUsecase>()));
  gh.factory<_i256.InstallQualityCubit>(
      () => _i256.InstallQualityCubit(gh<_i161.GetInstallUseCase>()));
  gh.lazySingleton<_i257.AddAgentUseCase>(
      () => _i257.AddAgentUseCase(gh<_i143.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i258.UpdateAgentUseCase>(() =>
      _i258.UpdateAgentUseCase(gh<_i143.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i259.GetDelayInstallReportsUseCase>(() =>
      _i259.GetDelayInstallReportsUseCase(gh<_i139.DelayInstallReportsRepo>()));
  gh.lazySingleton<_i260.CrudAgentSupportFilesUsecase>(() =>
      _i260.CrudAgentSupportFilesUsecase(
          gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i261.GetClientsTransferApprovalsUsecase>(() =>
      _i261.GetClientsTransferApprovalsUsecase(
          gh<_i209.ClientsTransferApprovalsRepo>()));
  gh.factory<_i262.ClientsStatusReportsCubit>(() =>
      _i262.ClientsStatusReportsCubit(
          gh<_i212.GetClientsStatusReportsUsecase>()));
  gh.lazySingleton<_i263.TaskCubit>(() => _i263.TaskCubit(
        gh<_i237.AddTaskUsecase>(),
        gh<_i239.FilterTaskUsecase>(),
        gh<_i238.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i264.SupportTabCubit>(() => _i264.SupportTabCubit(
        gh<_i166.GetInvoiceByClientUsecase>(),
        gh<_i164.AddDateInstallUsecase>(),
        gh<_i169.SetDateDoneUsecase>(),
        gh<_i170.SetReadyInstallUsecase>(),
        gh<_i168.ReturnInvoiceApproveUsecase>(),
        gh<_i167.ReceiveDeviceUsecase>(),
        gh<_i165.CancelDateInstallUsecase>(),
      ));
  gh.factory<_i265.ClientsDebtsReportsCubit>(() =>
      _i265.ClientsDebtsReportsCubit(
          gh<_i129.GetClientsDebtsReportsUsecase>()));
  gh.lazySingleton<_i266.AddAgentDateUseCase>(() =>
      _i266.AddAgentDateUseCase(gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.factory<_i267.RegionsSalesReportsCubit>(() =>
      _i267.RegionsSalesReportsCubit(
          gh<_i147.GetRegionsSalesReportsUsecase>()));
  gh.factory<_i268.AgentsDistributorsActionsCubit>(
      () => _i268.AgentsDistributorsActionsCubit(
            gh<_i96.GetCitiesUseCase>(),
            gh<_i257.AddAgentUseCase>(),
            gh<_i258.UpdateAgentUseCase>(),
          ));
  gh.factory<_i269.InvoicesSectionCubit>(() => _i269.InvoicesSectionCubit(
        gh<_i154.GetInvoicesByPrivilegesUsecase>(),
        gh<_i231.GetAgentsAndDistributorsUseCase>(),
        gh<_i203.ParticipateListUsecase>(),
        gh<_i171.GetAllUsersUseCase>(),
      ));
  gh.lazySingleton<_i270.LoginRepo>(() => _i271.LoginRepoImpl(
        gh<_i104.LoginRemoteDataSource>(),
        gh<_i243.LoginLocalDataSource>(),
      ));
  gh.factory<_i272.AddLevelUsecase>(
      () => _i272.AddLevelUsecase(gh<_i137.PrivilegeRepository>()));
  gh.factory<_i273.GetLevelsUsecase>(
      () => _i273.GetLevelsUsecase(gh<_i137.PrivilegeRepository>()));
  gh.factory<_i274.GetPrivilegesUsecase>(
      () => _i274.GetPrivilegesUsecase(gh<_i137.PrivilegeRepository>()));
  gh.factory<_i275.UpdatePrivilegeUsecase>(
      () => _i275.UpdatePrivilegeUsecase(gh<_i137.PrivilegeRepository>()));
  gh.factory<_i276.SpecialClientsBloc>(
      () => _i276.SpecialClientsBloc(gh<_i153.GetSpecialClientsUsecase>()));
  gh.factory<_i277.AddCommentUsecase>(
      () => _i277.AddCommentUsecase(gh<_i159.CompanyRepository>()));
  gh.factory<_i278.GetCommentUsecase>(
      () => _i278.GetCommentUsecase(gh<_i159.CompanyRepository>()));
  gh.factory<_i279.DelayInstallReportsCubit>(() =>
      _i279.DelayInstallReportsCubit(
          gh<_i259.GetDelayInstallReportsUseCase>()));
  gh.factory<_i280.GreetingCommunicationCubit>(() =>
      _i280.GreetingCommunicationCubit(
          gh<_i208.GetGreetingCommunicationUseCase>()));
  gh.lazySingleton<_i281.GetRegionsByIdCountryUseCase>(
      () => _i281.GetRegionsByIdCountryUseCase(gh<_i191.RegionsRepository>()));
  gh.lazySingleton<_i282.PrivilegeCubit>(() => _i282.PrivilegeCubit(
        gh<_i273.GetLevelsUsecase>(),
        gh<_i274.GetPrivilegesUsecase>(),
        gh<_i275.UpdatePrivilegeUsecase>(),
        gh<_i272.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i283.GetLatestClientsUseCase>(() =>
      _i283.GetLatestClientsUseCase(
          gh<_i251.LatestClientsUpdatesRepository>()));
  gh.factory<_i284.AdvancedCofigsCubit>(() => _i284.AdvancedCofigsCubit(
        gh<_i245.GetAdvancedConfigsUsecase>(),
        gh<_i244.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i285.SupportClientsInvoicesCubit>(() =>
      _i285.SupportClientsInvoicesCubit(
          gh<_i184.GetSupportClientsInvoicesUseCase>()));
  gh.factory<_i286.ParticipateListBloc>(() => _i286.ParticipateListBloc(
        gh<_i203.ParticipateListUsecase>(),
        gh<_i197.AddParticipateUserUsecase>(),
        gh<_i198.EditParticipateUserUsecase>(),
        gh<_i200.ParticipateClientListUsecase>(),
        gh<_i202.ParticipateInvoiceListUsecase>(),
        gh<_i199.GetInvoiceByIdUsecase>(),
        gh<_i201.ParticipateCommentListUsecase>(),
        gh<_i196.AddParticipateCommentUsecase>(),
        gh<_i204.ChangeParticipateStatusUsecase>(),
      ));
  gh.lazySingleton<_i287.CacheTokenUsecase>(
      () => _i287.CacheTokenUsecase(gh<_i270.LoginRepo>()));
  gh.lazySingleton<_i288.GetTokenUsecase>(
      () => _i288.GetTokenUsecase(gh<_i270.LoginRepo>()));
  gh.lazySingleton<_i289.LoginUsecase>(
      () => _i289.LoginUsecase(gh<_i270.LoginRepo>()));
  gh.lazySingleton<_i290.ValidateTokenUsecase>(
      () => _i290.ValidateTokenUsecase(gh<_i270.LoginRepo>()));
  gh.lazySingleton<_i291.VerifyOtpUsecase>(
      () => _i291.VerifyOtpUsecase(gh<_i270.LoginRepo>()));
  gh.factory<_i292.ClientsTransferApprovalsCubit>(() =>
      _i292.ClientsTransferApprovalsCubit(
          gh<_i261.GetClientsTransferApprovalsUsecase>()));
  gh.factory<_i293.GeneralCofigsCubit>(() => _i293.GeneralCofigsCubit(
        gh<_i254.GetGeneralConfigsUsecase>(),
        gh<_i253.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i294.GetPeriodicCommunicationUseCase>(() =>
      _i294.GetPeriodicCommunicationUseCase(
          gh<_i174.PeriodicCommunicationRepo>()));
  gh.lazySingleton<_i295.GetClientsDebtsUsecase>(
      () => _i295.GetClientsDebtsUsecase(gh<_i172.ClientsDebtsRepo>()));
  gh.lazySingleton<_i296.CrudClientSupportFilesUsecase>(() =>
      _i296.CrudClientSupportFilesUsecase(
          repository: gh<_i194.ClientsListRepository>()));
  gh.lazySingleton<_i297.GetClientSupportFilesUsecase>(() =>
      _i297.GetClientSupportFilesUsecase(
          repository: gh<_i194.ClientsListRepository>()));
  gh.lazySingleton<_i298.AddAgentCommentUsecase>(() =>
      _i298.AddAgentCommentUsecase(gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i299.DoneTrainingUsecase>(() =>
      _i299.DoneTrainingUsecase(gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i300.GetAgentUsecase>(
      () => _i300.GetAgentUsecase(gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i301.GetAgentClientListUsecase>(() =>
      _i301.GetAgentClientListUsecase(
          gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i302.GetAgentCommentsListUsecase>(() =>
      _i302.GetAgentCommentsListUsecase(
          gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i303.GetAgentDatesListUsecase>(() =>
      _i303.GetAgentDatesListUsecase(
          gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i304.GetAgentInvoiceListUsecase>(() =>
      _i304.GetAgentInvoiceListUsecase(
          gh<_i162.AgentsDistributorsProfileRepo>()));
  gh.factory<_i305.AddRejectReasonsUsecase>(() =>
      _i305.AddRejectReasonsUsecase(gh<_i185.ManageWithdrawalsRepository>()));
  gh.factory<_i306.EditRejectReasonsUsecase>(() =>
      _i306.EditRejectReasonsUsecase(gh<_i185.ManageWithdrawalsRepository>()));
  gh.factory<_i307.GetRejectReasonsUsecase>(() =>
      _i307.GetRejectReasonsUsecase(gh<_i185.ManageWithdrawalsRepository>()));
  gh.factory<_i308.GetUserSeriesUsecase>(() =>
      _i308.GetUserSeriesUsecase(gh<_i185.ManageWithdrawalsRepository>()));
  gh.factory<_i309.GetWithdrawnDetailsUsecase>(() =>
      _i309.GetWithdrawnDetailsUsecase(
          gh<_i185.ManageWithdrawalsRepository>()));
  gh.factory<_i310.SetApproveSeriesUsecase>(() =>
      _i310.SetApproveSeriesUsecase(gh<_i185.ManageWithdrawalsRepository>()));
  gh.factory<_i311.UpdateSeriesUsecase>(
      () => _i311.UpdateSeriesUsecase(gh<_i185.ManageWithdrawalsRepository>()));
  gh.singleton<_i312.AppManagerCubit>(
      () => _i312.AppManagerCubit(gh<_i249.GetVersionUseCase>()));
  gh.factory<_i313.RegionsCubit>(
      () => _i313.RegionsCubit(gh<_i281.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i314.GetWaitingAgentsUsecase>(
      () => _i314.GetWaitingAgentsUsecase(gh<_i214.WaitingAgentsRepo>()));
  gh.factory<_i315.ProductsSalesReportsCubit>(() =>
      _i315.ProductsSalesReportsCubit(
          gh<_i189.GetProductsSalesReportsUsecase>()));
  gh.factory<_i316.UsersCubit>(() => _i316.UsersCubit(
        gh<_i181.GetUsersUsecase>(),
        gh<_i79.ActionUserUsecase>(),
        gh<_i240.GetUsersByDepartmentAndRegionUsecase>(),
        gh<_i180.GetManagesForUserUsecase>(),
        gh<_i179.GetLevelsForUserUsecase>(),
        gh<_i178.GetBranchesForUserUsecase>(),
      ));
  gh.factory<_i317.PreviousRatingsCubit>(
      () => _i317.PreviousRatingsCubit(gh<_i213.GetPreviousRatingsUsecase>()));
  gh.factory<_i318.AgentsDistributorsCubit>(() => _i318.AgentsDistributorsCubit(
        gh<_i231.GetAgentsAndDistributorsUseCase>(),
        gh<_i230.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i319.ExceededClientsCubit>(() => _i319.ExceededClientsCubit(
        gh<_i241.ExceededClientsUseCase>(),
        gh<_i242.TransferExceededClientsUseCase>(),
      ));
  gh.factory<_i320.ManageWithdrawalsCubit>(() => _i320.ManageWithdrawalsCubit(
        gh<_i308.GetUserSeriesUsecase>(),
        gh<_i311.UpdateSeriesUsecase>(),
        gh<_i181.GetUsersUsecase>(),
        gh<_i235.GetWithdrawalsInvoicesUsecase>(),
        gh<_i236.GetWithdrawalInvoiceDetailsUsecase>(),
        gh<_i310.SetApproveSeriesUsecase>(),
        gh<_i309.GetWithdrawnDetailsUsecase>(),
        gh<_i305.AddRejectReasonsUsecase>(),
        gh<_i307.GetRejectReasonsUsecase>(),
        gh<_i306.EditRejectReasonsUsecase>(),
        gh<_i234.GetFilteredWithdrawalsInvoicesUsecase>(),
        gh<_i233.CancelWithdrawalUsecase>(),
      ));
  gh.factory<_i321.LatestClientsUpdatesCubit>(() =>
      _i321.LatestClientsUpdatesCubit(gh<_i283.GetLatestClientsUseCase>()));
  gh.factory<_i322.AttachmentsRowCubit>(() => _i322.AttachmentsRowCubit(
        gh<_i297.GetClientSupportFilesUsecase>(),
        gh<_i296.CrudClientSupportFilesUsecase>(),
      ));
  gh.lazySingleton<_i323.CancelScheduleUsecase>(
      () => _i323.CancelScheduleUsecase(gh<_i247.DatesTableRepo>()));
  gh.lazySingleton<_i324.ChangeDateToDonUsecase>(
      () => _i324.ChangeDateToDonUsecase(gh<_i247.DatesTableRepo>()));
  gh.lazySingleton<_i325.GetCancelReasonsUsecase>(
      () => _i325.GetCancelReasonsUsecase(gh<_i247.DatesTableRepo>()));
  gh.lazySingleton<_i326.GetDateInstallationUsecase>(
      () => _i326.GetDateInstallationUsecase(gh<_i247.DatesTableRepo>()));
  gh.lazySingleton<_i327.GetInvoicesByClientForDateUsecase>(() =>
      _i327.GetInvoicesByClientForDateUsecase(gh<_i247.DatesTableRepo>()));
  gh.lazySingleton<_i328.GetSubscribedClientsUsecase>(
      () => _i328.GetSubscribedClientsUsecase(gh<_i247.DatesTableRepo>()));
  gh.lazySingleton<_i329.RescheduleDateUsecase>(
      () => _i329.RescheduleDateUsecase(gh<_i247.DatesTableRepo>()));
  gh.lazySingleton<_i330.ReturnScheduleVisitToOpenUsecase>(
      () => _i330.ReturnScheduleVisitToOpenUsecase(gh<_i247.DatesTableRepo>()));
  gh.factory<_i331.AgentsDistributorsProfileBloc>(
      () => _i331.AgentsDistributorsProfileBloc(
            gh<_i301.GetAgentClientListUsecase>(),
            gh<_i304.GetAgentInvoiceListUsecase>(),
            gh<_i199.GetInvoiceByIdUsecase>(),
            gh<_i302.GetAgentCommentsListUsecase>(),
            gh<_i298.AddAgentCommentUsecase>(),
            gh<_i299.DoneTrainingUsecase>(),
            gh<_i266.AddAgentDateUseCase>(),
            gh<_i303.GetAgentDatesListUsecase>(),
            gh<_i260.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i332.ClientsListBloc>(() => _i332.ClientsListBloc(
        gh<_i222.GetClientsWithFilterUserUsecase>(),
        gh<_i224.GetRecommendedClientsUsecase>(),
        gh<_i216.AddClientUserUsecase>(),
        gh<_i219.EditClientUserUsecase>(),
        gh<_i218.ChangeTypeClientUsecase>(),
        gh<_i225.GetSimilarClientsUsecase>(),
        gh<_i217.ApproveRejectClientUsecase>(),
        gh<_i296.CrudClientSupportFilesUsecase>(),
        gh<_i297.GetClientSupportFilesUsecase>(),
        gh<_i227.TransferClientUserUsecase>(),
        gh<_i226.ReceiveClientUserUsecase>(),
        gh<_i223.GetClientMarketingReportUsecase>(),
        gh<_i228.GetHighSimilarClientsUsecase>(),
      ));
  gh.factory<_i333.CompanyCubit>(() => _i333.CompanyCubit(
        gh<_i278.GetCommentUsecase>(),
        gh<_i277.AddCommentUsecase>(),
      ));
  gh.factory<_i334.ClientsDebtsCubit>(
      () => _i334.ClientsDebtsCubit(gh<_i295.GetClientsDebtsUsecase>()));
  gh.factory<_i335.PeriodicCommunicationCubit>(() =>
      _i335.PeriodicCommunicationCubit(
          gh<_i294.GetPeriodicCommunicationUseCase>()));
  gh.factory<_i336.LoginCubit>(() => _i336.LoginCubit(
        gh<_i289.LoginUsecase>(),
        gh<_i291.VerifyOtpUsecase>(),
        gh<_i287.CacheTokenUsecase>(),
        gh<_i288.GetTokenUsecase>(),
        gh<_i290.ValidateTokenUsecase>(),
      ));
  gh.factory<_i337.DatesTableCubit>(() => _i337.DatesTableCubit(
        gh<_i326.GetDateInstallationUsecase>(),
        gh<_i329.RescheduleDateUsecase>(),
        gh<_i324.ChangeDateToDonUsecase>(),
        gh<_i323.CancelScheduleUsecase>(),
        gh<_i330.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i328.GetSubscribedClientsUsecase>(),
        gh<_i327.GetInvoicesByClientForDateUsecase>(),
        gh<_i164.AddDateInstallUsecase>(),
        gh<_i325.GetCancelReasonsUsecase>(),
      ));
  gh.factory<_i338.WaitingAgentsCubit>(
      () => _i338.WaitingAgentsCubit(gh<_i314.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i339.AppModule {}
