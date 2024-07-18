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
    as _i65;
import '../../../features/app/domain/repositories/app_repository.dart' as _i64;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i137;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i175;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i35;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i50;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i59;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i58;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i73;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i74;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i75;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i76;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i77;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i149;
import '../../../features/clients_care/accept_clients/data/data_sources/clients_accept_datasource.dart'
    as _i15;
import '../../../features/clients_care/accept_clients/data/repositories/clients_accept_repository_impl.dart'
    as _i17;
import '../../../features/clients_care/accept_clients/domain/repositories/clients_accept_repository.dart'
    as _i16;
import '../../../features/clients_care/accept_clients/domain/use_cases/get_clients_accept_usecase.dart'
    as _i78;
import '../../../features/clients_care/accept_clients/presentation/manager/clients_accept_cubit.dart'
    as _i113;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i18;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i31;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i30;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i43;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i44;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i45;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i47;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i46;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i48;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i138;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i57;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i49;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i21;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i96;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i95;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i103;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i178;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i41;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i69;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i68;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i87;
import '../../../features/common/client_profile/support_tab/domain/use_cases/cancel_date_usecase.dart'
    as _i88;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i89;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i90;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i91;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i92;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i93;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i146;
import '../../../features/mangement/advanced_configs/data/data_sources/advanced_configs_datasource.dart'
    as _i29;
import '../../../features/mangement/advanced_configs/data/repositories/advanced_configs_repository_impl.dart'
    as _i52;
import '../../../features/mangement/advanced_configs/domain/repositories/advanced_configs_repository.dart'
    as _i51;
import '../../../features/mangement/advanced_configs/domain/use_cases/edit_advanced_configs_usecase.dart'
    as _i122;
import '../../../features/mangement/advanced_configs/domain/use_cases/get_advanced_configs_usecase.dart'
    as _i121;
import '../../../features/mangement/advanced_configs/presentation/manager/advanced_cofigs_cubit.dart'
    as _i158;
import '../../../features/mangement/general_configs/data/data_sources/general_configs_datasource.dart'
    as _i34;
import '../../../features/mangement/general_configs/data/repositories/general_configs_repository_impl.dart'
    as _i80;
import '../../../features/mangement/general_configs/domain/repositories/general_configs_repository.dart'
    as _i79;
import '../../../features/mangement/general_configs/domain/use_cases/edit_general_configs_usecase.dart'
    as _i139;
import '../../../features/mangement/general_configs/domain/use_cases/get_general_configs_usecase.dart'
    as _i140;
import '../../../features/mangement/general_configs/presentation/manager/general_cofigs_cubit.dart'
    as _i159;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i22;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i63;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i62;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i150;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i151;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i152;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i153;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i157;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i23;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i33;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i32;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i36;
import '../../../features/mangement/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i37;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i188;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i100;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i99;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i168;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i169;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i114;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i170;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i171;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i116;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i115;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i172;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i173;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i174;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i177;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i24;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i84;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i83;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i125;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i126;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i127;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i104;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i128;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i132;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i105;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i129;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i130;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i131;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i133;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i134;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i135;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i136;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i148;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i25;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i82;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i81;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i155;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i156;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i199;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i42;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i54;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i53;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i94;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i72;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i200;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i40;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i56;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i67;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i86;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i102;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i66;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i85;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i101;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i160;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i147;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i141;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i111;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i144;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i161;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i162;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i163;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i164;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i165;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i166;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i112;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i142;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i143;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i198;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i196;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i187;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i26;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i71;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i70;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i97;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i98;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i106;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i27;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i108;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i107;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i179;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i180;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i181;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i182;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i183;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i184;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i185;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i186;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i201;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i60;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i124;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i123;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i189;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i190;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i191;
import '../../../features/support/dates_table/domain/use_cases/get_invoices_by_client_for_date_usecase.dart'
    as _i192;
import '../../../features/support/dates_table/domain/use_cases/get_subscribed_clients_usecase.dart'
    as _i193;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i194;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i195;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i197;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i55;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i110;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i109;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i176;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i202;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i28;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i39;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i38;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i117;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i118;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i119;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i120;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i145;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i154;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i167;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i61;
import 'di_container.dart' as _i203;

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
  gh.lazySingleton<_i29.AdvancedConfigsDatasource>(
      () => _i29.AdvancedConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i30.TicketsRepo>(
      () => _i31.TicketsRepoImpl(gh<_i18.TicketsDataSource>()));
  gh.factory<_i32.UsersRepository>(
      () => _i33.UsersRepositoryImpl(gh<_i23.UsersDatasource>()));
  gh.lazySingleton<_i34.GeneralConfigsDatasource>(
      () => _i34.GeneralConfigsDatasourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i35.LoginLocalDataSource>(() =>
      _i35.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i36.ActionUserUsecase>(
      () => _i36.ActionUserUsecase(gh<_i32.UsersRepository>()));
  gh.factory<_i37.GetAllUsersUsecase>(
      () => _i37.GetAllUsersUsecase(gh<_i32.UsersRepository>()));
  gh.factory<_i38.TaskRepository>(
      () => _i39.TaskRepositoryImpl(gh<_i28.TaskDatasource>()));
  gh.lazySingleton<_i40.AgentsDistributorsDataSource>(
      () => _i40.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i41.SupportTabDataSource>(
      () => _i41.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i42.InvoicesTabDataSource>(
      () => _i42.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i43.AddTicketUseCase>(
      () => _i43.AddTicketUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i44.EditTicketTypeUseCase>(
      () => _i44.EditTicketTypeUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i45.GetClientTicketsUseCase>(
      () => _i45.GetClientTicketsUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i46.GetTicketsUseCase>(
      () => _i46.GetTicketsUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i47.GetTicketByIdUseCase>(
      () => _i47.GetTicketByIdUseCase(gh<_i30.TicketsRepo>()));
  gh.lazySingleton<_i48.TransferTicketUseCase>(
      () => _i48.TransferTicketUseCase(gh<_i30.TicketsRepo>()));
  gh.factory<_i49.TicketsCubit>(() => _i49.TicketsCubit(
        gh<_i46.GetTicketsUseCase>(),
        gh<_i47.GetTicketByIdUseCase>(),
        gh<_i45.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i50.LoginRemoteDataSource>(
      () => _i50.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i51.AdvancedConfigsRepository>(() =>
      _i52.AdvancedConfigsRepositoryImpl(gh<_i29.AdvancedConfigsDatasource>()));
  gh.lazySingleton<_i53.InvoicesSectionRepo>(
      () => _i54.InvoicesTabRepoImpl(gh<_i42.InvoicesTabDataSource>()));
  gh.lazySingleton<_i55.WaitingAgentsDataSource>(
      () => _i55.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i56.AgentsDistributorsProfileDataSource>(() =>
      _i56.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i57.EditTicketCubit>(() => _i57.EditTicketCubit(
        gh<_i44.EditTicketTypeUseCase>(),
        gh<_i48.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i58.LoginRepo>(() => _i59.LoginRepoImpl(
        gh<_i50.LoginRemoteDataSource>(),
        gh<_i35.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i60.DatesTableDataSource>(
      () => _i60.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i61.LocationServices>(
      () => _i61.LocationServices(gh<_i8.Location>()));
  gh.factory<_i62.PrivilegeRepository>(
      () => _i63.PrivilegeRepositoryImpl(gh<_i22.PrivilegeDatasource>()));
  gh.factory<_i64.AppRepository>(
      () => _i65.AppRepositoryImpl(gh<_i20.AppDatasource>()));
  gh.lazySingleton<_i66.AgentsDistributorsActionsRepo>(() =>
      _i67.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i68.SupportTabRepo>(
      () => _i69.SupportTabRepoImpl(gh<_i41.SupportTabDataSource>()));
  gh.factory<_i70.LinksImportantRepository>(
      () => _i71.LinkRepositoryImpl(gh<_i26.LinkDatasource>()));
  gh.lazySingleton<_i72.GetInvoicesByPrivilegesUsecase>(() =>
      _i72.GetInvoicesByPrivilegesUsecase(gh<_i53.InvoicesSectionRepo>()));
  gh.lazySingleton<_i73.CacheTokenUsecase>(
      () => _i73.CacheTokenUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i74.GetTokenUsecase>(
      () => _i74.GetTokenUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i75.LoginUsecase>(
      () => _i75.LoginUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i76.ValidateTokenUsecase>(
      () => _i76.ValidateTokenUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i77.VerifyOtpUsecase>(
      () => _i77.VerifyOtpUsecase(gh<_i58.LoginRepo>()));
  gh.lazySingleton<_i78.GetClientsAcceptUseCase>(
      () => _i78.GetClientsAcceptUseCase(gh<_i16.ClientsAcceptRepository>()));
  gh.lazySingleton<_i79.GeneralConfigsRepository>(() =>
      _i80.GeneralConfigsRepositoryImpl(gh<_i34.GeneralConfigsDatasource>()));
  gh.factory<_i81.CompanyRepository>(
      () => _i82.CompanyRepositoryImpl(gh<_i25.CommentCompanyDatasource>()));
  gh.factory<_i83.ClientsListRepository>(
      () => _i84.ClientsListRepositoryImpl(gh<_i24.ClientsListDatasource>()));
  gh.lazySingleton<_i85.AgentsDistributorsProfileRepo>(() =>
      _i86.AgentsDistributorsProfileRepoImpl(
          gh<_i56.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i87.AddDateInstallUsecase>(
      () => _i87.AddDateInstallUsecase(gh<_i68.SupportTabRepo>()));
  gh.lazySingleton<_i88.CancelDateInstallUsecase>(
      () => _i88.CancelDateInstallUsecase(gh<_i68.SupportTabRepo>()));
  gh.lazySingleton<_i89.GetInvoiceByClientUsecase>(
      () => _i89.GetInvoiceByClientUsecase(gh<_i68.SupportTabRepo>()));
  gh.lazySingleton<_i90.ReceiveDeviceUsecase>(
      () => _i90.ReceiveDeviceUsecase(gh<_i68.SupportTabRepo>()));
  gh.lazySingleton<_i91.ReturnInvoiceApproveUsecase>(
      () => _i91.ReturnInvoiceApproveUsecase(gh<_i68.SupportTabRepo>()));
  gh.lazySingleton<_i92.SetDateDoneUsecase>(
      () => _i92.SetDateDoneUsecase(gh<_i68.SupportTabRepo>()));
  gh.lazySingleton<_i93.SetReadyInstallUsecase>(
      () => _i93.SetReadyInstallUsecase(gh<_i68.SupportTabRepo>()));
  gh.lazySingleton<_i94.GetAllUsersUseCase>(
      () => _i94.GetAllUsersUseCase(gh<_i53.InvoicesSectionRepo>()));
  gh.factory<_i95.CommunicationListRepository>(() =>
      _i96.CommunicationListRepositoryImpl(
          gh<_i21.CommunicationListDatasource>()));
  gh.factory<_i97.ActionLinkUsecase>(
      () => _i97.ActionLinkUsecase(gh<_i70.LinksImportantRepository>()));
  gh.factory<_i98.GetLinkUsecase>(
      () => _i98.GetLinkUsecase(gh<_i70.LinksImportantRepository>()));
  gh.lazySingleton<_i99.ManageWithdrawalsRepository>(() =>
      _i100.ManageWithdrawalsRepositoryImpl(
          gh<_i19.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i101.AgentsDistributorsRepo>(() =>
      _i102.AgentsDistributorsRepoImpl(
          gh<_i40.AgentsDistributorsDataSource>()));
  gh.factory<_i103.GetCommunicationListUsecase>(() =>
      _i103.GetCommunicationListUsecase(
          gh<_i95.CommunicationListRepository>()));
  gh.lazySingleton<_i104.CrudClientSupportFilesUsecase>(() =>
      _i104.CrudClientSupportFilesUsecase(
          repository: gh<_i83.ClientsListRepository>()));
  gh.lazySingleton<_i105.GetClientSupportFilesUsecase>(() =>
      _i105.GetClientSupportFilesUsecase(
          repository: gh<_i83.ClientsListRepository>()));
  gh.factory<_i106.LinkCubit>(() => _i106.LinkCubit(
        gh<_i98.GetLinkUsecase>(),
        gh<_i97.ActionLinkUsecase>(),
      ));
  gh.factory<_i107.ParticipateListRepository>(() =>
      _i108.ParticipateListRepositoryImpl(
          gh<_i27.ParticipatesListDatasource>()));
  gh.lazySingleton<_i109.WaitingAgentsRepo>(
      () => _i110.WaitingAgentsRepoImpl(gh<_i55.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i111.ChangeStateAgentUseCase>(
      () => _i111.ChangeStateAgentUseCase(gh<_i101.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i112.GetAgentsAndDistributorsUseCase>(() =>
      _i112.GetAgentsAndDistributorsUseCase(
          gh<_i101.AgentsDistributorsRepo>()));
  gh.factory<_i113.ClientsAcceptCubit>(
      () => _i113.ClientsAcceptCubit(gh<_i78.GetClientsAcceptUseCase>()));
  gh.lazySingleton<_i114.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i114.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i99.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i115.GetWithdrawalsInvoicesUsecase>(() =>
      _i115.GetWithdrawalsInvoicesUsecase(
          gh<_i99.ManageWithdrawalsRepository>()));
  gh.factory<_i116.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i116.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i99.ManageWithdrawalsRepository>()));
  gh.factory<_i117.AddTaskUsecase>(
      () => _i117.AddTaskUsecase(gh<_i38.TaskRepository>()));
  gh.factory<_i118.ChangeStatusTaskUsecase>(
      () => _i118.ChangeStatusTaskUsecase(gh<_i38.TaskRepository>()));
  gh.factory<_i119.FilterTaskUsecase>(
      () => _i119.FilterTaskUsecase(gh<_i38.TaskRepository>()));
  gh.factory<_i120.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i120.GetUsersByDepartmentAndRegionUsecase(gh<_i38.TaskRepository>()));
  gh.lazySingleton<_i121.GetAdvancedConfigsUsecase>(() =>
      _i121.GetAdvancedConfigsUsecase(gh<_i51.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i122.EditAdvancedConfigsUsecase>(() =>
      _i122.EditAdvancedConfigsUsecase(gh<_i51.AdvancedConfigsRepository>()));
  gh.lazySingleton<_i123.DatesTableRepo>(
      () => _i124.DatesTableRepoImpl(gh<_i60.DatesTableDataSource>()));
  gh.factory<_i125.AddClientUserUsecase>(
      () => _i125.AddClientUserUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i126.ApproveRejectClientUsecase>(
      () => _i126.ApproveRejectClientUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i127.ChangeTypeClientUsecase>(
      () => _i127.ChangeTypeClientUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i128.EditClientUserUsecase>(
      () => _i128.EditClientUserUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i129.GetClientsListByRegionUseCase>(() =>
      _i129.GetClientsListByRegionUseCase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i130.GetClientsListByUserUseCase>(() =>
      _i130.GetClientsListByUserUseCase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i131.GetClientsWithFilterUserUsecase>(() =>
      _i131.GetClientsWithFilterUserUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i132.GetClientMarketingReportUsecase>(() =>
      _i132.GetClientMarketingReportUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i133.GetRecommendedClientsUsecase>(() =>
      _i133.GetRecommendedClientsUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i134.GetSimilarClientsUsecase>(
      () => _i134.GetSimilarClientsUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i135.ReceiveClientUserUsecase>(
      () => _i135.ReceiveClientUserUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i136.TransferClientUserUsecase>(
      () => _i136.TransferClientUserUsecase(gh<_i83.ClientsListRepository>()));
  gh.factory<_i137.GetVersionUseCase>(
      () => _i137.GetVersionUseCase(gh<_i64.AppRepository>()));
  gh.factory<_i138.AddTicketCubit>(
      () => _i138.AddTicketCubit(gh<_i43.AddTicketUseCase>()));
  gh.lazySingleton<_i139.EditGeneralConfigsUsecase>(() =>
      _i139.EditGeneralConfigsUsecase(gh<_i79.GeneralConfigsRepository>()));
  gh.lazySingleton<_i140.GetGeneralConfigsUsecase>(() =>
      _i140.GetGeneralConfigsUsecase(gh<_i79.GeneralConfigsRepository>()));
  gh.lazySingleton<_i141.AddAgentUseCase>(
      () => _i141.AddAgentUseCase(gh<_i66.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i142.GetAllCitiesUseCase>(() =>
      _i142.GetAllCitiesUseCase(gh<_i66.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i143.UpdateAgentUseCase>(
      () => _i143.UpdateAgentUseCase(gh<_i66.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i144.CrudAgentSupportFilesUsecase>(() =>
      _i144.CrudAgentSupportFilesUsecase(
          gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i145.TaskCubit>(() => _i145.TaskCubit(
        gh<_i117.AddTaskUsecase>(),
        gh<_i119.FilterTaskUsecase>(),
        gh<_i118.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i146.SupportTabCubit>(() => _i146.SupportTabCubit(
        gh<_i89.GetInvoiceByClientUsecase>(),
        gh<_i87.AddDateInstallUsecase>(),
        gh<_i92.SetDateDoneUsecase>(),
        gh<_i93.SetReadyInstallUsecase>(),
        gh<_i91.ReturnInvoiceApproveUsecase>(),
        gh<_i90.ReceiveDeviceUsecase>(),
        gh<_i88.CancelDateInstallUsecase>(),
      ));
  gh.lazySingleton<_i147.AddAgentDateUseCase>(() =>
      _i147.AddAgentDateUseCase(gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.factory<_i148.ClientsListBloc>(() => _i148.ClientsListBloc(
        gh<_i131.GetClientsWithFilterUserUsecase>(),
        gh<_i133.GetRecommendedClientsUsecase>(),
        gh<_i125.AddClientUserUsecase>(),
        gh<_i128.EditClientUserUsecase>(),
        gh<_i127.ChangeTypeClientUsecase>(),
        gh<_i134.GetSimilarClientsUsecase>(),
        gh<_i126.ApproveRejectClientUsecase>(),
        gh<_i104.CrudClientSupportFilesUsecase>(),
        gh<_i105.GetClientSupportFilesUsecase>(),
        gh<_i136.TransferClientUserUsecase>(),
        gh<_i135.ReceiveClientUserUsecase>(),
        gh<_i132.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i149.LoginCubit>(() => _i149.LoginCubit(
        gh<_i75.LoginUsecase>(),
        gh<_i77.VerifyOtpUsecase>(),
        gh<_i73.CacheTokenUsecase>(),
        gh<_i74.GetTokenUsecase>(),
        gh<_i76.ValidateTokenUsecase>(),
      ));
  gh.factory<_i150.AddLevelUsecase>(
      () => _i150.AddLevelUsecase(gh<_i62.PrivilegeRepository>()));
  gh.factory<_i151.GetLevelsUsecase>(
      () => _i151.GetLevelsUsecase(gh<_i62.PrivilegeRepository>()));
  gh.factory<_i152.GetPrivilegesUsecase>(
      () => _i152.GetPrivilegesUsecase(gh<_i62.PrivilegeRepository>()));
  gh.factory<_i153.UpdatePrivilegeUsecase>(
      () => _i153.UpdatePrivilegeUsecase(gh<_i62.PrivilegeRepository>()));
  gh.factory<_i154.AttachmentsRowCubit>(() => _i154.AttachmentsRowCubit(
        gh<_i105.GetClientSupportFilesUsecase>(),
        gh<_i104.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i155.AddCommentUsecase>(
      () => _i155.AddCommentUsecase(gh<_i81.CompanyRepository>()));
  gh.factory<_i156.GetCommentUsecase>(
      () => _i156.GetCommentUsecase(gh<_i81.CompanyRepository>()));
  gh.lazySingleton<_i157.PrivilegeCubit>(() => _i157.PrivilegeCubit(
        gh<_i151.GetLevelsUsecase>(),
        gh<_i152.GetPrivilegesUsecase>(),
        gh<_i153.UpdatePrivilegeUsecase>(),
        gh<_i150.AddLevelUsecase>(),
      ));
  gh.factory<_i158.AdvancedCofigsCubit>(() => _i158.AdvancedCofigsCubit(
        gh<_i121.GetAdvancedConfigsUsecase>(),
        gh<_i122.EditAdvancedConfigsUsecase>(),
      ));
  gh.factory<_i159.GeneralCofigsCubit>(() => _i159.GeneralCofigsCubit(
        gh<_i140.GetGeneralConfigsUsecase>(),
        gh<_i139.EditGeneralConfigsUsecase>(),
      ));
  gh.lazySingleton<_i160.AddAgentCommentUsecase>(() =>
      _i160.AddAgentCommentUsecase(gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i161.DoneTrainingUsecase>(() =>
      _i161.DoneTrainingUsecase(gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i162.GetAgentUsecase>(
      () => _i162.GetAgentUsecase(gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i163.GetAgentClientListUsecase>(() =>
      _i163.GetAgentClientListUsecase(
          gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i164.GetAgentCommentsListUsecase>(() =>
      _i164.GetAgentCommentsListUsecase(
          gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i165.GetAgentDatesListUsecase>(() =>
      _i165.GetAgentDatesListUsecase(gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i166.GetAgentInvoiceListUsecase>(() =>
      _i166.GetAgentInvoiceListUsecase(
          gh<_i85.AgentsDistributorsProfileRepo>()));
  gh.singleton<_i167.CitiesCubit>(
      () => _i167.CitiesCubit(gh<_i142.GetAllCitiesUseCase>()));
  gh.factory<_i168.AddRejectReasonsUsecase>(() =>
      _i168.AddRejectReasonsUsecase(gh<_i99.ManageWithdrawalsRepository>()));
  gh.factory<_i169.EditRejectReasonsUsecase>(() =>
      _i169.EditRejectReasonsUsecase(gh<_i99.ManageWithdrawalsRepository>()));
  gh.factory<_i170.GetRejectReasonsUsecase>(() =>
      _i170.GetRejectReasonsUsecase(gh<_i99.ManageWithdrawalsRepository>()));
  gh.factory<_i171.GetUserSeriesUsecase>(
      () => _i171.GetUserSeriesUsecase(gh<_i99.ManageWithdrawalsRepository>()));
  gh.factory<_i172.GetWithdrawnDetailsUsecase>(() =>
      _i172.GetWithdrawnDetailsUsecase(gh<_i99.ManageWithdrawalsRepository>()));
  gh.factory<_i173.SetApproveSeriesUsecase>(() =>
      _i173.SetApproveSeriesUsecase(gh<_i99.ManageWithdrawalsRepository>()));
  gh.factory<_i174.UpdateSeriesUsecase>(
      () => _i174.UpdateSeriesUsecase(gh<_i99.ManageWithdrawalsRepository>()));
  gh.singleton<_i175.AppManagerCubit>(
      () => _i175.AppManagerCubit(gh<_i137.GetVersionUseCase>()));
  gh.lazySingleton<_i176.GetWaitingAgentsUsecase>(
      () => _i176.GetWaitingAgentsUsecase(gh<_i109.WaitingAgentsRepo>()));
  gh.lazySingleton<_i177.ManageWithdrawalsCubit>(
      () => _i177.ManageWithdrawalsCubit(
            gh<_i171.GetUserSeriesUsecase>(),
            gh<_i174.UpdateSeriesUsecase>(),
            gh<_i37.GetAllUsersUsecase>(),
            gh<_i115.GetWithdrawalsInvoicesUsecase>(),
            gh<_i116.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i173.SetApproveSeriesUsecase>(),
            gh<_i172.GetWithdrawnDetailsUsecase>(),
            gh<_i168.AddRejectReasonsUsecase>(),
            gh<_i170.GetRejectReasonsUsecase>(),
            gh<_i169.EditRejectReasonsUsecase>(),
            gh<_i114.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i178.CommunicationListBloc>(() =>
      _i178.CommunicationListBloc(gh<_i103.GetCommunicationListUsecase>()));
  gh.factory<_i179.AddParticipateCommentUsecase>(() =>
      _i179.AddParticipateCommentUsecase(
          gh<_i107.ParticipateListRepository>()));
  gh.factory<_i180.AddParticipateUserUsecase>(() =>
      _i180.AddParticipateUserUsecase(gh<_i107.ParticipateListRepository>()));
  gh.factory<_i181.EditParticipateUserUsecase>(() =>
      _i181.EditParticipateUserUsecase(gh<_i107.ParticipateListRepository>()));
  gh.factory<_i182.GetInvoiceByIdUsecase>(
      () => _i182.GetInvoiceByIdUsecase(gh<_i107.ParticipateListRepository>()));
  gh.factory<_i183.ParticipateClientListUsecase>(() =>
      _i183.ParticipateClientListUsecase(
          gh<_i107.ParticipateListRepository>()));
  gh.factory<_i184.ParticipateCommentListUsecase>(() =>
      _i184.ParticipateCommentListUsecase(
          gh<_i107.ParticipateListRepository>()));
  gh.factory<_i185.ParticipateInvoiceListUsecase>(() =>
      _i185.ParticipateInvoiceListUsecase(
          gh<_i107.ParticipateListRepository>()));
  gh.factory<_i186.ParticipateListUsecase>(() =>
      _i186.ParticipateListUsecase(gh<_i107.ParticipateListRepository>()));
  gh.factory<_i187.AgentsDistributorsCubit>(() => _i187.AgentsDistributorsCubit(
        gh<_i112.GetAgentsAndDistributorsUseCase>(),
        gh<_i111.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i188.UsersCubit>(() => _i188.UsersCubit(
        gh<_i37.GetAllUsersUsecase>(),
        gh<_i36.ActionUserUsecase>(),
        gh<_i120.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i189.CancelScheduleUsecase>(
      () => _i189.CancelScheduleUsecase(gh<_i123.DatesTableRepo>()));
  gh.lazySingleton<_i190.ChangeDateToDonUsecase>(
      () => _i190.ChangeDateToDonUsecase(gh<_i123.DatesTableRepo>()));
  gh.lazySingleton<_i191.GetDateInstallationUsecase>(
      () => _i191.GetDateInstallationUsecase(gh<_i123.DatesTableRepo>()));
  gh.lazySingleton<_i192.GetInvoicesByClientForDateUsecase>(() =>
      _i192.GetInvoicesByClientForDateUsecase(gh<_i123.DatesTableRepo>()));
  gh.lazySingleton<_i193.GetSubscribedClientsUsecase>(
      () => _i193.GetSubscribedClientsUsecase(gh<_i123.DatesTableRepo>()));
  gh.lazySingleton<_i194.RescheduleDateUsecase>(
      () => _i194.RescheduleDateUsecase(gh<_i123.DatesTableRepo>()));
  gh.lazySingleton<_i195.ReturnScheduleVisitToOpenUsecase>(
      () => _i195.ReturnScheduleVisitToOpenUsecase(gh<_i123.DatesTableRepo>()));
  gh.factory<_i196.AgentsDistributorsProfileBloc>(
      () => _i196.AgentsDistributorsProfileBloc(
            gh<_i163.GetAgentClientListUsecase>(),
            gh<_i166.GetAgentInvoiceListUsecase>(),
            gh<_i182.GetInvoiceByIdUsecase>(),
            gh<_i164.GetAgentCommentsListUsecase>(),
            gh<_i160.AddAgentCommentUsecase>(),
            gh<_i161.DoneTrainingUsecase>(),
            gh<_i147.AddAgentDateUseCase>(),
            gh<_i165.GetAgentDatesListUsecase>(),
            gh<_i144.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i197.DatesTableCubit>(() => _i197.DatesTableCubit(
        gh<_i191.GetDateInstallationUsecase>(),
        gh<_i194.RescheduleDateUsecase>(),
        gh<_i190.ChangeDateToDonUsecase>(),
        gh<_i189.CancelScheduleUsecase>(),
        gh<_i195.ReturnScheduleVisitToOpenUsecase>(),
        gh<_i193.GetSubscribedClientsUsecase>(),
        gh<_i192.GetInvoicesByClientForDateUsecase>(),
        gh<_i87.AddDateInstallUsecase>(),
      ));
  gh.factory<_i198.AgentsDistributorsActionsCubit>(
      () => _i198.AgentsDistributorsActionsCubit(
            gh<_i142.GetAllCitiesUseCase>(),
            gh<_i141.AddAgentUseCase>(),
            gh<_i143.UpdateAgentUseCase>(),
          ));
  gh.factory<_i199.CompanyCubit>(() => _i199.CompanyCubit(
        gh<_i156.GetCommentUsecase>(),
        gh<_i155.AddCommentUsecase>(),
      ));
  gh.factory<_i200.InvoicesSectionCubit>(() => _i200.InvoicesSectionCubit(
        gh<_i72.GetInvoicesByPrivilegesUsecase>(),
        gh<_i112.GetAgentsAndDistributorsUseCase>(),
        gh<_i186.ParticipateListUsecase>(),
        gh<_i94.GetAllUsersUseCase>(),
      ));
  gh.factory<_i201.ParticipateListBloc>(() => _i201.ParticipateListBloc(
        gh<_i186.ParticipateListUsecase>(),
        gh<_i180.AddParticipateUserUsecase>(),
        gh<_i181.EditParticipateUserUsecase>(),
        gh<_i183.ParticipateClientListUsecase>(),
        gh<_i185.ParticipateInvoiceListUsecase>(),
        gh<_i182.GetInvoiceByIdUsecase>(),
        gh<_i184.ParticipateCommentListUsecase>(),
        gh<_i179.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i202.WaitingAgentsCubit>(
      () => _i202.WaitingAgentsCubit(gh<_i176.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i203.AppModule {}
