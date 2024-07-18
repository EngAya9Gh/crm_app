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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i20;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i70;
import '../../../features/app/domain/repositories/app_repository.dart' as _i69;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i145;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i183;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i36;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i54;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i63;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i62;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i78;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i79;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i80;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i81;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i82;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i157;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i15;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i17;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i16;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i83;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i121;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i18;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i32;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i31;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i47;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i48;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i49;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i51;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i50;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i52;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i146;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i61;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i53;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i21;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i102;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i101;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i111;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i187;
import '../../../features/common/cities/data/data_sources/cities_datasource.dart'
    as _i29;
import '../../../features/common/cities/data/repositories/cities_repository_impl.dart'
    as _i45;
import '../../../features/common/cities/domain/repositories/cities_repository.dart'
    as _i44;
import '../../../features/common/cities/domain/use_cases/get_cities_usecase.dart'
    as _i46;
import '../../../features/common/cities/presentation/manager/cities_cubit.dart'
    as _i100;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i42;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i74;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i73;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i92;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i93;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i94;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i95;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i96;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i97;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i98;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i153;
import '../../../features/common/regions/data/data_sources/regions_datasource.dart'
    as _i65;
import '../../../features/common/regions/data/repositories/regions_repository_impl.dart'
    as _i110;
import '../../../features/common/regions/domain/repositories/regions_repository.dart'
    as _i109;
import '../../../features/common/regions/domain/use_cases/get_regions_by_id_country_usecase.dart'
    as _i165;
import '../../../features/common/regions/presentation/manager/regions_cubit/regions_cubit.dart'
    as _i184;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i30;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i56;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i55;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i130;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i129;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i167;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i35;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i85;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i84;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i147;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i148;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i168;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i22;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i68;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i67;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i158;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i159;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i160;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i161;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i166;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i23;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i34;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i33;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i37;
import '../../../features/mangement/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i38;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i197;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i106;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i105;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i176;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i177;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i122;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i178;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i179;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i124;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i123;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i180;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i181;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i182;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i186;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i24;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i89;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i88;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i133;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i134;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i135;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i112;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i136;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i140;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i113;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i137;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i138;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i139;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i141;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i142;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i143;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i144;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i155;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i25;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i87;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i86;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i163;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i164;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i207;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i43;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i58;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i57;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i99;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i77;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i208;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i41;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i60;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i72;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i91;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i108;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i71;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i90;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i107;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i169;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i149;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i119;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i151;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i170;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i172;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i173;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i174;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i175;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i120;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i156;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i205;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i196;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i26;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i76;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i75;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i103;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i104;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i114;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i27;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i116;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i115;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i188;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i189;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i190;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i191;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i192;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i193;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i194;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i195;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i209;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i64;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i132;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i131;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i198;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i199;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i200;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i201;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i202;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i203;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i204;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i206;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i59;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i118;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i117;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i185;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i210;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i28;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i40;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i39;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i125;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i126;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i127;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i128;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i152;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i162;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i66;
import 'di_container.dart' as _i211;

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
  gh.lazySingletonAsync<_i11.CacheServices>(() async =>
      _i13.PrefsConsumer(await gh.getAsync<_i3.SharedPreferences>()));
  gh.lazySingleton<_i14.AgentsDistributorsActionsDataSource>(() =>
      _i14.AgentsDistributorsActionsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i15.ClientsAcceptDatasource>(
      () => _i15.ClientsAcceptDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i16.ClientsAcceptRepository>(() =>
      _i17.ClientsAcceptRepositoryImpl(gh<_i15.ClientsAcceptDatasource>()));
  gh.lazySingleton<_i18.TicketsDataSource>(
      () => _i18.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i19.ManageWithdrawalsDatasource>(
      () => _i19.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i20.AppDatasource>(
      () => _i20.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i21.CommunicationListDatasource>(
      () => _i21.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i22.PrivilegeDatasource>(
      () => _i22.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i23.UsersDatasource>(
      () => _i23.UsersDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i24.ClientsListDatasource>(
      () => _i24.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i25.CommentCompanyDatasource>(
      () => _i25.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i26.LinkDatasource>(
      () => _i26.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i27.ParticipatesListDatasource>(
      () => _i27.ParticipatesListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i28.TaskDatasource>(
      () => _i28.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i29.CitiesDatasource>(
      () => _i29.CitiesDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.AdvancedConfigsDatasource>(
      () => _i30.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i31.TicketsRepo>(
      () => _i32.TicketsRepoImpl(gh<_i18.TicketsDataSource>()));
  gh.factory<_i33.UsersRepository>(
      () => _i34.UsersRepositoryImpl(gh<_i23.UsersDatasource>()));
  gh.lazySingleton<_i35.GeneralConfigsDatasource>(
      () => _i35.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i36.LoginLocalDataSource>(() =>
      _i36.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i37.ActionUserUsecase>(
      () => _i37.ActionUserUsecase(gh<_i33.UsersRepository>()));
  gh.factory<_i38.GetAllUsersUsecase>(
      () => _i38.GetAllUsersUsecase(gh<_i33.UsersRepository>()));
  gh.factory<_i39.TaskRepository>(
      () => _i40.TaskRepositoryImpl(gh<_i28.TaskDatasource>()));
  gh.lazySingleton<_i41.AgentsDistributorsDataSource>(
      () => _i41.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i42.SupportTabDataSource>(
      () => _i42.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i43.InvoicesTabDataSource>(
      () => _i43.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i44.CitiesRepository>(
      () => _i45.CitiesRepositoryImpl(gh<_i29.CitiesDatasource>()));
  gh.lazySingleton<_i46.GetCitiesUseCase>(
      () => _i46.GetCitiesUseCase(gh<_i44.CitiesRepository>()));
  gh.lazySingleton<_i47.AddTicketUseCase>(
      () => _i47.AddTicketUseCase(gh<_i31.TicketsRepo>()));
  gh.lazySingleton<_i48.EditTicketTypeUseCase>(
      () => _i48.EditTicketTypeUseCase(gh<_i31.TicketsRepo>()));
  gh.lazySingleton<_i49.GetClientTicketsUseCase>(
      () => _i49.GetClientTicketsUseCase(gh<_i31.TicketsRepo>()));
  gh.lazySingleton<_i50.GetTicketsUseCase>(
      () => _i50.GetTicketsUseCase(gh<_i31.TicketsRepo>()));
  gh.lazySingleton<_i51.GetTicketByIdUseCase>(
      () => _i51.GetTicketByIdUseCase(gh<_i31.TicketsRepo>()));
  gh.lazySingleton<_i52.TransferTicketUseCase>(
      () => _i52.TransferTicketUseCase(gh<_i31.TicketsRepo>()));
  gh.factory<_i53.TicketsCubit>(() => _i53.TicketsCubit(
        gh<_i50.GetTicketsUseCase>(),
        gh<_i51.GetTicketByIdUseCase>(),
        gh<_i49.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i54.LoginRemoteDataSource>(
      () => _i54.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i55.AdvancedConfigsRepository>(() =>
      _i56.AdvancedConfigsRepositoryImpl(gh<_i30.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i57.InvoicesSectionRepo>(
      () => _i58.InvoicesTabRepoImpl(gh<_i43.InvoicesTabDataSource>()));
  gh.lazySingleton<_i59.WaitingAgentsDataSource>(
      () => _i59.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i60.AgentsDistributorsProfileDataSource>(() =>
      _i60.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i61.EditTicketCubit>(() => _i61.EditTicketCubit(
        gh<_i48.EditTicketTypeUseCase>(),
        gh<_i52.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i62.LoginRepo>(() => _i63.LoginRepoImpl(
        gh<_i54.LoginRemoteDataSource>(),
        gh<_i36.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i64.DatesTableDataSource>(
      () => _i64.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i65.RegionsDatasource>(
      () => _i65.RegionsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i66.LocationServices>(
      () => _i66.LocationServices(gh<_i8.Location>()));
  gh.factory<_i67.PrivilegeRepository>(
      () => _i68.PrivilegeRepositoryImpl(gh<_i22.PrivilegeDatasource>()));
  gh.factory<_i69.AppRepository>(
      () => _i70.AppRepositoryImpl(gh<_i20.AppDatasource>()));
  gh.lazySingleton<_i71.AgentsDistributorsActionsRepo>(() =>
      _i72.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i73.SupportTabRepo>(
      () => _i74.SupportTabRepoImpl(gh<_i42.SupportTabDataSource>()));
  gh.factory<_i75.LinksImportantRepository>(
      () => _i76.LinkRepositoryImpl(gh<_i26.LinkDatasource>()));
  gh.lazySingleton<_i77.GetInvoicesByPrivilegesUsecase>(() =>
      _i77.GetInvoicesByPrivilegesUsecase(gh<_i57.InvoicesSectionRepo>()));
  gh.lazySingleton<_i78.CacheTokenUsecase>(
      () => _i78.CacheTokenUsecase(gh<_i62.LoginRepo>()));
  gh.lazySingleton<_i79.GetTokenUsecase>(
      () => _i79.GetTokenUsecase(gh<_i62.LoginRepo>()));
  gh.lazySingleton<_i80.LoginUsecase>(
      () => _i80.LoginUsecase(gh<_i62.LoginRepo>()));
  gh.lazySingleton<_i81.ValidateTokenUsecase>(
      () => _i81.ValidateTokenUsecase(gh<_i62.LoginRepo>()));
  gh.lazySingleton<_i82.VerifyOtpUsecase>(
      () => _i82.VerifyOtpUsecase(gh<_i62.LoginRepo>()));
  gh.lazySingleton<_i83.GetClientsAcceptUseCase>(
      () => _i83.GetClientsAcceptUseCase(gh<_i16.ClientsAcceptRepository>()));
  gh.lazySingleton<_i84.GeneralConfigsRepository>(() =>
      _i85.GeneralConfigsRepositoryImpl(gh<_i35.GeneralConfigsDatasource>()));
  gh.factory<_i86.CompanyRepository>(
      () => _i87.CompanyRepositoryImpl(gh<_i25.CommentCompanyDatasource>()));
  gh.factory<_i88.ClientsListRepository>(
      () => _i89.ClientsListRepositoryImpl(gh<_i24.ClientsListDatasource>()));
  gh.lazySingleton<_i90.AgentsDistributorsProfileRepo>(() =>
      _i91.AgentsDistributorsProfileRepoImpl(
          gh<_i60.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i92.AddDateInstallUsecase>(
      () => _i92.AddDateInstallUsecase(gh<_i73.SupportTabRepo>()));
  gh.lazySingleton<_i93.CancelDateInstallUsecase>(
      () => _i93.CancelDateInstallUsecase(gh<_i73.SupportTabRepo>()));
  gh.lazySingleton<_i94.GetInvoiceByClientUsecase>(
      () => _i94.GetInvoiceByClientUsecase(gh<_i73.SupportTabRepo>()));
  gh.lazySingleton<_i95.ReceiveDeviceUsecase>(
      () => _i95.ReceiveDeviceUsecase(gh<_i73.SupportTabRepo>()));
  gh.lazySingleton<_i96.ReturnInvoiceApproveUsecase>(
      () => _i96.ReturnInvoiceApproveUsecase(gh<_i73.SupportTabRepo>()));
  gh.lazySingleton<_i97.SetDateDoneUsecase>(
      () => _i97.SetDateDoneUsecase(gh<_i73.SupportTabRepo>()));
  gh.lazySingleton<_i98.SetReadyInstallUsecase>(
      () => _i98.SetReadyInstallUsecase(gh<_i73.SupportTabRepo>()));
  gh.lazySingleton<_i99.GetAllUsersUseCase>(
      () => _i99.GetAllUsersUseCase(gh<_i57.InvoicesSectionRepo>()));
  gh.singleton<_i100.CitiesCubit>(
      () => _i100.CitiesCubit(gh<_i46.GetCitiesUseCase>()));
  gh.factory<_i101.CommunicationListRepository>(() =>
      _i102.CommunicationListRepositoryImpl(
          gh<_i21.CommunicationListDatasource>()));
  gh.factory<_i103.ActionLinkUsecase>(
      () => _i103.ActionLinkUsecase(gh<_i75.LinksImportantRepository>()));
  gh.factory<_i104.GetLinkUsecase>(
      () => _i104.GetLinkUsecase(gh<_i75.LinksImportantRepository>()));
  gh.lazySingleton<_i105.ManageWithdrawalsRepository>(() =>
      _i106.ManageWithdrawalsRepositoryImpl(
          gh<_i19.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i107.AgentsDistributorsRepo>(() =>
      _i108.AgentsDistributorsRepoImpl(
          gh<_i41.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i109.RegionsRepository>(
      () => _i110.RegionsRepositoryImpl(gh<_i65.RegionsDatasource>()));
  gh.factory<_i111.GetCommunicationListUsecase>(() =>
      _i111.GetCommunicationListUsecase(
          gh<_i101.CommunicationListRepository>()));
  gh.lazySingleton<_i112.CrudClientSupportFilesUsecase>(() =>
      _i112.CrudClientSupportFilesUsecase(
          repository: gh<_i88.ClientsListRepository>()));
  gh.lazySingleton<_i113.GetClientSupportFilesUsecase>(() =>
      _i113.GetClientSupportFilesUsecase(
          repository: gh<_i88.ClientsListRepository>()));
  gh.factory<_i114.LinkCubit>(() => _i114.LinkCubit(
        gh<_i104.GetLinkUsecase>(),
        gh<_i103.ActionLinkUsecase>(),
      ));
  gh.factory<_i115.ParticipateListRepository>(() =>
      _i116.ParticipateListRepositoryImpl(
          gh<_i27.ParticipatesListDatasource>()));
  gh.lazySingleton<_i117.WaitingAgentsRepo>(
      () => _i118.WaitingAgentsRepoImpl(gh<_i59.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i119.ChangeStateAgentUseCase>(
      () => _i119.ChangeStateAgentUseCase(gh<_i107.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i120.GetAgentsAndDistributorsUseCase>(() =>
      _i120.GetAgentsAndDistributorsUseCase(
          gh<_i107.AgentsDistributorsRepo>()));
  gh.factory<_i121.ClientsAcceptCubit>(
      () => _i121.ClientsAcceptCubit(gh<_i83.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i122.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i122.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i105.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i123.GetWithdrawalsInvoicesUsecase>(() =>
      _i123.GetWithdrawalsInvoicesUsecase(
          gh<_i105.ManageWithdrawalsRepository>()));
  gh.factory<_i124.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i124.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i105.ManageWithdrawalsRepository>()));
  gh.factory<_i125.AddTaskUsecase>(
      () => _i125.AddTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i126.ChangeStatusTaskUsecase>(
      () => _i126.ChangeStatusTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i127.FilterTaskUsecase>(
      () => _i127.FilterTaskUsecase(gh<_i39.TaskRepository>()));
  gh.factory<_i128.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i128.GetUsersByDepartmentAndRegionUsecase(gh<_i39.TaskRepository>()));
  gh.lazySingleton<_i129.GetAdvancedConfigsUsecase>(() =>
      _i129.GetAdvancedConfigsUsecase(gh<_i55.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i130.EditAdvancedConfigsUsecase>(() =>
      _i130.EditAdvancedConfigsUsecase(gh<_i55.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i131.DatesTableRepo>(
      () => _i132.DatesTableRepoImpl(gh<_i64.DatesTableDataSource>()));
  gh.factory<_i133.AddClientUserUsecase>(
      () => _i133.AddClientUserUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i134.ApproveRejectClientUsecase>(
      () => _i134.ApproveRejectClientUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i135.ChangeTypeClientUsecase>(
      () => _i135.ChangeTypeClientUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i136.EditClientUserUsecase>(
      () => _i136.EditClientUserUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i137.GetClientsListByRegionUseCase>(() =>
      _i137.GetClientsListByRegionUseCase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i138.GetClientsListByUserUseCase>(() =>
      _i138.GetClientsListByUserUseCase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i139.GetClientsWithFilterUserUsecase>(() =>
      _i139.GetClientsWithFilterUserUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i140.GetClientMarketingReportUsecase>(() =>
      _i140.GetClientMarketingReportUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i141.GetRecommendedClientsUsecase>(() =>
      _i141.GetRecommendedClientsUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i142.GetSimilarClientsUsecase>(
      () => _i142.GetSimilarClientsUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i143.ReceiveClientUserUsecase>(
      () => _i143.ReceiveClientUserUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i144.TransferClientUserUsecase>(
      () => _i144.TransferClientUserUsecase(gh<_i88.ClientsListRepository>()));
  gh.factory<_i145.GetVersionUseCase>(
      () => _i145.GetVersionUseCase(gh<_i69.AppRepository>()));
  gh.factory<_i146.AddTicketCubit>(
      () => _i146.AddTicketCubit(gh<_i47.AddTicketUseCase>()));
  gh.lazySingleton<_i147.EditGeneralConfigsUsecase>(() =>
      _i147.EditGeneralConfigsUsecase(gh<_i84.GeneralConfigsRepository>()));
  gh.lazySingleton<_i148.GetGeneralConfigsUsecase>(() =>
      _i148.GetGeneralConfigsUsecase(gh<_i84.GeneralConfigsRepository>()));
  gh.lazySingleton<_i149.AddAgentUseCase>(
      () => _i149.AddAgentUseCase(gh<_i71.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i150.UpdateAgentUseCase>(
      () => _i150.UpdateAgentUseCase(gh<_i71.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i151.CrudAgentSupportFilesUsecase>(() =>
      _i151.CrudAgentSupportFilesUsecase(
          gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i152.TaskCubit>(() => _i152.TaskCubit(
        gh<_i125.AddTaskUsecase>(),
        gh<_i127.FilterTaskUsecase>(),
        gh<_i126.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i153.SupportTabCubit>(() => _i153.SupportTabCubit(
        gh<_i94.GetInvoiceByClientUsecase>(),
        gh<_i92.AddDateInstallUsecase>(),
        gh<_i97.SetDateDoneUsecase>(),
        gh<_i98.SetReadyInstallUsecase>(),
        gh<_i96.ReturnInvoiceApproveUsecase>(),
        gh<_i95.ReceiveDeviceUsecase>(),
        gh<_i93.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i154.AddAgentDateUseCase>(() =>
      _i154.AddAgentDateUseCase(gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.factory<_i155.ClientsListBloc>(() => _i155.ClientsListBloc(
        gh<_i139.GetClientsWithFilterUserUsecase>(),
        gh<_i141.GetRecommendedClientsUsecase>(),
        gh<_i133.AddClientUserUsecase>(),
        gh<_i136.EditClientUserUsecase>(),
        gh<_i135.ChangeTypeClientUsecase>(),
        gh<_i142.GetSimilarClientsUsecase>(),
        gh<_i134.ApproveRejectClientUsecase>(),
        gh<_i112.CrudClientSupportFilesUsecase>(),
        gh<_i113.GetClientSupportFilesUsecase>(),
        gh<_i144.TransferClientUserUsecase>(),
        gh<_i143.ReceiveClientUserUsecase>(),
        gh<_i140.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i156.AgentsDistributorsActionsCubit>(
      () => _i156.AgentsDistributorsActionsCubit(
            gh<_i46.GetCitiesUseCase>(),
            gh<_i149.AddAgentUseCase>(),
            gh<_i150.UpdateAgentUseCase>(),
          ));
  gh.factory<_i157.LoginCubit>(() => _i157.LoginCubit(
        gh<_i80.LoginUsecase>(),
        gh<_i82.VerifyOtpUsecase>(),
        gh<_i78.CacheTokenUsecase>(),
        gh<_i79.GetTokenUsecase>(),
        gh<_i81.ValidateTokenUsecase>(),
      ));
  gh.factory<_i158.AddLevelUsecase>(
      () => _i158.AddLevelUsecase(gh<_i67.PrivilegeRepository>()));
  gh.factory<_i159.GetLevelsUsecase>(
      () => _i159.GetLevelsUsecase(gh<_i67.PrivilegeRepository>()));
  gh.factory<_i160.GetPrivilegesUsecase>(
      () => _i160.GetPrivilegesUsecase(gh<_i67.PrivilegeRepository>()));
  gh.factory<_i161.UpdatePrivilegeUsecase>(
      () => _i161.UpdatePrivilegeUsecase(gh<_i67.PrivilegeRepository>()));
  gh.factory<_i162.AttachmentsRowCubit>(() => _i162.AttachmentsRowCubit(
        gh<_i113.GetClientSupportFilesUsecase>(),
        gh<_i112.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i163.AddCommentUsecase>(
      () => _i163.AddCommentUsecase(gh<_i86.CompanyRepository>()));
  gh.factory<_i164.GetCommentUsecase>(
      () => _i164.GetCommentUsecase(gh<_i86.CompanyRepository>()));
  gh.lazySingleton<_i165.GetRegionsByIdCountryUseCase>(
      () => _i165.GetRegionsByIdCountryUseCase(gh<_i109.RegionsRepository>()));
  gh.lazySingleton<_i166.PrivilegeCubit>(() => _i166.PrivilegeCubit(
        gh<_i159.GetLevelsUsecase>(),
        gh<_i160.GetPrivilegesUsecase>(),
        gh<_i161.UpdatePrivilegeUsecase>(),
        gh<_i158.AddLevelUsecase>(),
      ));
  gh.factory<_i167.AdvancedCofigsCubit>(() => _i167.AdvancedCofigsCubit(
        gh<_i129.GetAdvancedConfigsUsecase>(),
        gh<_i130.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i168.GeneralCofigsCubit>(() => _i168.GeneralCofigsCubit(
        gh<_i148.GetGeneralConfigsUsecase>(),
        gh<_i147.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i169.AddAgentCommentUsecase>(() =>
      _i169.AddAgentCommentUsecase(gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i170.DoneTrainingUsecase>(() =>
      _i170.DoneTrainingUsecase(gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i171.GetAgentUsecase>(
      () => _i171.GetAgentUsecase(gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i172.GetAgentClientListUsecase>(() =>
      _i172.GetAgentClientListUsecase(
          gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i173.GetAgentCommentsListUsecase>(() =>
      _i173.GetAgentCommentsListUsecase(
          gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i174.GetAgentDatesListUsecase>(() =>
      _i174.GetAgentDatesListUsecase(gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i175.GetAgentInvoiceListUsecase>(() =>
      _i175.GetAgentInvoiceListUsecase(
          gh<_i90.AgentsDistributorsProfileRepo>()));
  gh.factory<_i176.AddRejectReasonsUsecase>(() =>
      _i176.AddRejectReasonsUsecase(gh<_i105.ManageWithdrawalsRepository>()));
  gh.factory<_i177.EditRejectReasonsUsecase>(() =>
      _i177.EditRejectReasonsUsecase(gh<_i105.ManageWithdrawalsRepository>()));
  gh.factory<_i178.GetRejectReasonsUsecase>(() =>
      _i178.GetRejectReasonsUsecase(gh<_i105.ManageWithdrawalsRepository>()));
  gh.factory<_i179.GetUserSeriesUsecase>(() =>
      _i179.GetUserSeriesUsecase(gh<_i105.ManageWithdrawalsRepository>()));
  gh.factory<_i180.GetWithdrawnDetailsUsecase>(() =>
      _i180.GetWithdrawnDetailsUsecase(
          gh<_i105.ManageWithdrawalsRepository>()));
  gh.factory<_i181.SetApproveSeriesUsecase>(() =>
      _i181.SetApproveSeriesUsecase(gh<_i105.ManageWithdrawalsRepository>()));
  gh.factory<_i182.UpdateSeriesUsecase>(
      () => _i182.UpdateSeriesUsecase(gh<_i105.ManageWithdrawalsRepository>()));
  gh.singleton<_i183.AppManagerCubit>(
      () => _i183.AppManagerCubit(gh<_i145.GetVersionUseCase>()));
  gh.factory<_i184.RegionsCubit>(
      () => _i184.RegionsCubit(gh<_i165.GetRegionsByIdCountryUseCase>()));
  gh.lazySingleton<_i185.GetWaitingAgentsUsecase>(
      () => _i185.GetWaitingAgentsUsecase(gh<_i117.WaitingAgentsRepo>()));
  gh.lazySingleton<_i186.ManageWithdrawalsCubit>(
      () => _i186.ManageWithdrawalsCubit(
            gh<_i179.GetUserSeriesUsecase>(),
            gh<_i182.UpdateSeriesUsecase>(),
            gh<_i38.GetAllUsersUsecase>(),
            gh<_i123.GetWithdrawalsInvoicesUsecase>(),
            gh<_i124.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i181.SetApproveSeriesUsecase>(),
            gh<_i180.GetWithdrawnDetailsUsecase>(),
            gh<_i176.AddRejectReasonsUsecase>(),
            gh<_i178.GetRejectReasonsUsecase>(),
            gh<_i177.EditRejectReasonsUsecase>(),
            gh<_i122.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i187.CommunicationListBloc>(() =>
      _i187.CommunicationListBloc(gh<_i111.GetCommunicationListUsecase>()));
  gh.factory<_i188.AddParticipateCommentUsecase>(() =>
      _i188.AddParticipateCommentUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i189.AddParticipateUserUsecase>(() =>
      _i189.AddParticipateUserUsecase(gh<_i115.ParticipateListRepository>()));
  gh.factory<_i190.EditParticipateUserUsecase>(() =>
      _i190.EditParticipateUserUsecase(gh<_i115.ParticipateListRepository>()));
  gh.factory<_i191.GetInvoiceByIdUsecase>(
      () => _i191.GetInvoiceByIdUsecase(gh<_i115.ParticipateListRepository>()));
  gh.factory<_i192.ParticipateClientListUsecase>(() =>
      _i192.ParticipateClientListUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i193.ParticipateCommentListUsecase>(() =>
      _i193.ParticipateCommentListUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i194.ParticipateInvoiceListUsecase>(() =>
      _i194.ParticipateInvoiceListUsecase(
          gh<_i115.ParticipateListRepository>()));
  gh.factory<_i195.ParticipateListUsecase>(() =>
      _i195.ParticipateListUsecase(gh<_i115.ParticipateListRepository>()));
  gh.factory<_i196.AgentsDistributorsCubit>(() => _i196.AgentsDistributorsCubit(
        gh<_i120.GetAgentsAndDistributorsUseCase>(),
        gh<_i119.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i197.UsersCubit>(() => _i197.UsersCubit(
        gh<_i38.GetAllUsersUsecase>(),
        gh<_i37.ActionUserUsecase>(),
        gh<_i128.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i198.CancelScheduleUsecase>(
      () => _i198.CancelScheduleUsecase(gh<_i131.DatesTableRepo>()));
  gh.lazySingleton<_i199.ChangeDateToDonUsecase>(
      () => _i199.ChangeDateToDonUsecase(gh<_i131.DatesTableRepo>()));
  gh.lazySingleton<_i200.GetDateInstallationUsecase>(
      () => _i200.GetDateInstallationUsecase(gh<_i131.DatesTableRepo>()));
  gh.lazySingleton<_i201.GetInvoicesByClientForDateUsecase>(() =>
      _i201.GetInvoicesByClientForDateUsecase(gh<_i131.DatesTableRepo>()));
  gh.lazySingleton<_i202.GetSubscribedClientsUsecase>(
      () => _i202.GetSubscribedClientsUsecase(gh<_i131.DatesTableRepo>()));
  gh.lazySingleton<_i203.RescheduleDateUsecase>(
      () => _i203.RescheduleDateUsecase(gh<_i131.DatesTableRepo>()));
  gh.lazySingleton<_i204.ReturnScheduleVisitToOpenUsecase>(
      () => _i204.ReturnScheduleVisitToOpenUsecase(gh<_i131.DatesTableRepo>()));
  gh.factory<_i205.AgentsDistributorsProfileBloc>(
      () => _i205.AgentsDistributorsProfileBloc(
            gh<_i172.GetAgentClientListUsecase>(),
            gh<_i175.GetAgentInvoiceListUsecase>(),
            gh<_i191.GetInvoiceByIdUsecase>(),
            gh<_i173.GetAgentCommentsListUsecase>(),
            gh<_i169.AddAgentCommentUsecase>(),
            gh<_i170.DoneTrainingUsecase>(),
            gh<_i154.AddAgentDateUseCase>(),
            gh<_i174.GetAgentDatesListUsecase>(),
            gh<_i151.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i206.DatesTableCubit>(() => _i206.DatesTableCubit(
        gh<_i200.GetDateInstallationUsecase>(),
        gh<_i203.RescheduleDateUsecase>(),
        gh<_i199.ChangeDateToDonUsecase>(),
        gh<_i198.CancelScheduleUsecase>(),
        gh<_i204.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i202.GetSubscribedClientsUsecase>(),
        gh<_i201.GetInvoicesByClientForDateUsecase>(),
        gh<_i92.AddDateInstallUsecase>(),
      ));
  gh.factory<_i207.CompanyCubit>(() => _i207.CompanyCubit(
        gh<_i164.GetCommentUsecase>(),
        gh<_i163.AddCommentUsecase>(),
      ));
  gh.factory<_i208.InvoicesSectionCubit>(() => _i208.InvoicesSectionCubit(
        gh<_i77.GetInvoicesByPrivilegesUsecase>(),
        gh<_i120.GetAgentsAndDistributorsUseCase>(),
        gh<_i195.ParticipateListUsecase>(),
        gh<_i99.GetAllUsersUseCase>(),
      ));
  gh.factory<_i209.ParticipateListBloc>(() => _i209.ParticipateListBloc(
        gh<_i195.ParticipateListUsecase>(),
        gh<_i189.AddParticipateUserUsecase>(),
        gh<_i190.EditParticipateUserUsecase>(),
        gh<_i192.ParticipateClientListUsecase>(),
        gh<_i194.ParticipateInvoiceListUsecase>(),
        gh<_i191.GetInvoiceByIdUsecase>(),
        gh<_i193.ParticipateCommentListUsecase>(),
        gh<_i188.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i210.WaitingAgentsCubit>(
      () => _i210.WaitingAgentsCubit(gh<_i185.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i211.AppModule {}
