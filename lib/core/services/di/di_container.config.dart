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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i17;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i58;
import '../../../features/app/domain/repositories/app_repository.dart' as _i57;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i123;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i157;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i30;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i45;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i52;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i51;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i66;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i67;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i68;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i69;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i70;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i132;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i15;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i27;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i26;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i38;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i39;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i40;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i42;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i41;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i43;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i124;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i50;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i44;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i18;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i85;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i84;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i92;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i160;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i36;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i62;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i61;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i77;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i78;
import '../../../features/common/client_profile/support_tab/domain/use_cases/receive_device_usecase.dart'
    as _i79;
import '../../../features/common/client_profile/support_tab/domain/use_cases/returnToApprove.dart'
    as _i80;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i81;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i82;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i141;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i56;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i55;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i133;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i134;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i135;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i136;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i140;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i20;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i29;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i28;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i31;
import '../../../features/mangement/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i32;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i170;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i89;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i88;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i150;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i151;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i102;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i152;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i153;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i104;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i103;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i154;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i155;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i156;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i159;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i21;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i74;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i73;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i111;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i112;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i113;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i93;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i114;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i118;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i94;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i115;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i116;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i117;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i119;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i120;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i121;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i122;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i131;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i22;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i72;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i71;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i138;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i139;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i178;
import '../../../features/sales/invoices_list/data/data_sources/incoives_section_datasource.dart'
    as _i37;
import '../../../features/sales/invoices_list/data/repositories/invoices_section_repo_impl.dart'
    as _i47;
import '../../../features/sales/invoices_list/domain/repositories/invoices_section_repo.dart'
    as _i46;
import '../../../features/sales/invoices_list/domain/use_cases/get_all_users_usecase.dart'
    as _i83;
import '../../../features/sales/invoices_list/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i65;
import '../../../features/sales/invoices_list/presentation/manager/invoices_section_cubit.dart'
    as _i179;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i35;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i49;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i60;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i76;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i91;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i59;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i75;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i90;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i142;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i130;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i125;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i100;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/crud_agent_support_files_usecase.dart'
    as _i128;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i143;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i144;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i145;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i146;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i147;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i148;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i101;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i126;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i127;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i177;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i176;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i169;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i23;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i64;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i63;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i86;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i87;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i95;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i24;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i97;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i96;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i161;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i162;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i163;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i164;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i165;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i166;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i167;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i168;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i181;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i53;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i110;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i109;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i171;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i172;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i173;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i174;
import '../../../features/support/dates_table/domain/use_cases/return_schedule_visit_to_open_usecase.dart'
    as _i175;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i180;
import '../../../features/support/waiting_agents/data/data_sources/waiting_agents_datasource.dart'
    as _i48;
import '../../../features/support/waiting_agents/data/repositories/waiting_agents_repo_impl.dart'
    as _i99;
import '../../../features/support/waiting_agents/domain/repositories/waiting_agents_repo.dart'
    as _i98;
import '../../../features/support/waiting_agents/domain/use_cases/waiting_agents_usecase.dart'
    as _i158;
import '../../../features/support/waiting_agents/presentation/manager/waiting_agents/waiting_agents_cubit.dart'
    as _i182;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i25;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i34;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i33;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i105;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i106;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i107;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i108;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i129;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i137;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i149;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i54;
import 'di_container.dart' as _i183;

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
  gh.lazySingleton<_i15.TicketsDataSource>(
      () => _i15.TicketsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i16.ManageWithdrawalsDatasource>(
      () => _i16.ManageWithdrawalsDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i17.AppDatasource>(
      () => _i17.AppDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i18.CommunicationListDatasource>(
      () => _i18.CommunicationListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i19.PrivilegeDatasource>(
      () => _i19.PrivilegeDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i20.UsersDatasource>(
      () => _i20.UsersDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i21.ClientsListDatasource>(
      () => _i21.ClientsListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i22.CommentCompanyDatasource>(
      () => _i22.CommentCompanyDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i23.LinkDatasource>(
      () => _i23.LinkDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i24.ParticipatesListDatasource>(
      () => _i24.ParticipatesListDatasource(gh<_i9.ApiServices>()));
  gh.factory<_i25.TaskDatasource>(
      () => _i25.TaskDatasource(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i26.TicketsRepo>(
      () => _i27.TicketsRepoImpl(gh<_i15.TicketsDataSource>()));
  gh.factory<_i28.UsersRepository>(
      () => _i29.UsersRepositoryImpl(gh<_i20.UsersDatasource>()));
  gh.lazySingleton<_i30.LoginLocalDataSource>(() =>
      _i30.LoginLocalDataSourceImpl(
          gh<_i11.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i31.ActionUserUsecase>(
      () => _i31.ActionUserUsecase(gh<_i28.UsersRepository>()));
  gh.factory<_i32.GetAllUsersUsecase>(
      () => _i32.GetAllUsersUsecase(gh<_i28.UsersRepository>()));
  gh.factory<_i33.TaskRepository>(
      () => _i34.TaskRepositoryImpl(gh<_i25.TaskDatasource>()));
  gh.lazySingleton<_i35.AgentsDistributorsDataSource>(
      () => _i35.AgentsDistributorsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i36.SupportTabDataSource>(
      () => _i36.SupportTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i37.InvoicesTabDataSource>(
      () => _i37.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i38.AddTicketUseCase>(
      () => _i38.AddTicketUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i39.EditTicketTypeUseCase>(
      () => _i39.EditTicketTypeUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i40.GetClientTicketsUseCase>(
      () => _i40.GetClientTicketsUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i41.GetTicketsUseCase>(
      () => _i41.GetTicketsUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i42.GetTicketByIdUseCase>(
      () => _i42.GetTicketByIdUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i43.TransferTicketUseCase>(
      () => _i43.TransferTicketUseCase(gh<_i26.TicketsRepo>()));
  gh.factory<_i44.TicketsCubit>(() => _i44.TicketsCubit(
        gh<_i41.GetTicketsUseCase>(),
        gh<_i42.GetTicketByIdUseCase>(),
        gh<_i40.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i45.LoginRemoteDataSource>(
      () => _i45.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i46.InvoicesSectionRepo>(
      () => _i47.InvoicesTabRepoImpl(gh<_i37.InvoicesTabDataSource>()));
  gh.lazySingleton<_i48.WaitingAgentsDataSource>(
      () => _i48.WaitingAgentsDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i49.AgentsDistributorsProfileDataSource>(() =>
      _i49.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i50.EditTicketCubit>(() => _i50.EditTicketCubit(
        gh<_i39.EditTicketTypeUseCase>(),
        gh<_i43.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i51.LoginRepo>(() => _i52.LoginRepoImpl(
        gh<_i45.LoginRemoteDataSource>(),
        gh<_i30.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i53.DatesTableDataSource>(
      () => _i53.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i54.LocationServices>(
      () => _i54.LocationServices(gh<_i8.Location>()));
  gh.factory<_i55.PrivilegeRepository>(
      () => _i56.PrivilegeRepositoryImpl(gh<_i19.PrivilegeDatasource>()));
  gh.factory<_i57.AppRepository>(
      () => _i58.AppRepositoryImpl(gh<_i17.AppDatasource>()));
  gh.lazySingleton<_i59.AgentsDistributorsActionsRepo>(() =>
      _i60.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i61.SupportTabRepo>(
      () => _i62.SupportTabRepoImpl(gh<_i36.SupportTabDataSource>()));
  gh.factory<_i63.LinksImportantRepository>(
      () => _i64.LinkRepositoryImpl(gh<_i23.LinkDatasource>()));
  gh.lazySingleton<_i65.GetInvoicesByPrivilegesUsecase>(() =>
      _i65.GetInvoicesByPrivilegesUsecase(gh<_i46.InvoicesSectionRepo>()));
  gh.lazySingleton<_i66.CacheTokenUsecase>(
      () => _i66.CacheTokenUsecase(gh<_i51.LoginRepo>()));
  gh.lazySingleton<_i67.GetTokenUsecase>(
      () => _i67.GetTokenUsecase(gh<_i51.LoginRepo>()));
  gh.lazySingleton<_i68.LoginUsecase>(
      () => _i68.LoginUsecase(gh<_i51.LoginRepo>()));
  gh.lazySingleton<_i69.ValidateTokenUsecase>(
      () => _i69.ValidateTokenUsecase(gh<_i51.LoginRepo>()));
  gh.lazySingleton<_i70.VerifyOtpUsecase>(
      () => _i70.VerifyOtpUsecase(gh<_i51.LoginRepo>()));
  gh.factory<_i71.CompanyRepository>(
      () => _i72.CompanyRepositoryImpl(gh<_i22.CommentCompanyDatasource>()));
  gh.factory<_i73.ClientsListRepository>(
      () => _i74.ClientsListRepositoryImpl(gh<_i21.ClientsListDatasource>()));
  gh.lazySingleton<_i75.AgentsDistributorsProfileRepo>(() =>
      _i76.AgentsDistributorsProfileRepoImpl(
          gh<_i49.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i77.AddDateInstallUsecase>(
      () => _i77.AddDateInstallUsecase(gh<_i61.SupportTabRepo>()));
  gh.lazySingleton<_i78.GetInvoiceByClientUsecase>(
      () => _i78.GetInvoiceByClientUsecase(gh<_i61.SupportTabRepo>()));
  gh.lazySingleton<_i79.ReceiveDeviceUsecase>(
      () => _i79.ReceiveDeviceUsecase(gh<_i61.SupportTabRepo>()));
  gh.lazySingleton<_i80.ReturnInvoiceApproveUsecase>(
      () => _i80.ReturnInvoiceApproveUsecase(gh<_i61.SupportTabRepo>()));
  gh.lazySingleton<_i81.SetDateDoneUsecase>(
      () => _i81.SetDateDoneUsecase(gh<_i61.SupportTabRepo>()));
  gh.lazySingleton<_i82.SetReadyInstallUsecase>(
      () => _i82.SetReadyInstallUsecase(gh<_i61.SupportTabRepo>()));
  gh.lazySingleton<_i83.GetAllUsersUseCase>(
      () => _i83.GetAllUsersUseCase(gh<_i46.InvoicesSectionRepo>()));
  gh.factory<_i84.CommunicationListRepository>(() =>
      _i85.CommunicationListRepositoryImpl(
          gh<_i18.CommunicationListDatasource>()));
  gh.factory<_i86.ActionLinkUsecase>(
      () => _i86.ActionLinkUsecase(gh<_i63.LinksImportantRepository>()));
  gh.factory<_i87.GetLinkUsecase>(
      () => _i87.GetLinkUsecase(gh<_i63.LinksImportantRepository>()));
  gh.lazySingleton<_i88.ManageWithdrawalsRepository>(() =>
      _i89.ManageWithdrawalsRepositoryImpl(
          gh<_i16.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i90.AgentsDistributorsRepo>(() =>
      _i91.AgentsDistributorsRepoImpl(gh<_i35.AgentsDistributorsDataSource>()));
  gh.factory<_i92.GetCommunicationListUsecase>(() =>
      _i92.GetCommunicationListUsecase(gh<_i84.CommunicationListRepository>()));
  gh.lazySingleton<_i93.CrudClientSupportFilesUsecase>(() =>
      _i93.CrudClientSupportFilesUsecase(
          repository: gh<_i73.ClientsListRepository>()));
  gh.lazySingleton<_i94.GetClientSupportFilesUsecase>(() =>
      _i94.GetClientSupportFilesUsecase(
          repository: gh<_i73.ClientsListRepository>()));
  gh.factory<_i95.LinkCubit>(() => _i95.LinkCubit(
        gh<_i87.GetLinkUsecase>(),
        gh<_i86.ActionLinkUsecase>(),
      ));
  gh.factory<_i96.ParticipateListRepository>(() =>
      _i97.ParticipateListRepositoryImpl(
          gh<_i24.ParticipatesListDatasource>()));
  gh.lazySingleton<_i98.WaitingAgentsRepo>(
      () => _i99.WaitingAgentsRepoImpl(gh<_i48.WaitingAgentsDataSource>()));
  gh.lazySingleton<_i100.ChangeStateAgentUseCase>(
      () => _i100.ChangeStateAgentUseCase(gh<_i90.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i101.GetAgentsAndDistributorsUseCase>(() =>
      _i101.GetAgentsAndDistributorsUseCase(gh<_i90.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i102.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i102.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i88.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i103.GetWithdrawalsInvoicesUsecase>(() =>
      _i103.GetWithdrawalsInvoicesUsecase(
          gh<_i88.ManageWithdrawalsRepository>()));
  gh.factory<_i104.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i104.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i88.ManageWithdrawalsRepository>()));
  gh.factory<_i105.AddTaskUsecase>(
      () => _i105.AddTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i106.ChangeStatusTaskUsecase>(
      () => _i106.ChangeStatusTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i107.FilterTaskUsecase>(
      () => _i107.FilterTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i108.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i108.GetUsersByDepartmentAndRegionUsecase(gh<_i33.TaskRepository>()));
  gh.lazySingleton<_i109.DatesTableRepo>(
      () => _i110.DatesTableRepoImpl(gh<_i53.DatesTableDataSource>()));
  gh.factory<_i111.AddClientUserUsecase>(
      () => _i111.AddClientUserUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i112.ApproveRejectClientUsecase>(
      () => _i112.ApproveRejectClientUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i113.ChangeTypeClientUsecase>(
      () => _i113.ChangeTypeClientUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i114.EditClientUserUsecase>(
      () => _i114.EditClientUserUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i115.GetClientsListByRegionUseCase>(() =>
      _i115.GetClientsListByRegionUseCase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i116.GetClientsListByUserUseCase>(() =>
      _i116.GetClientsListByUserUseCase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i117.GetClientsWithFilterUserUsecase>(() =>
      _i117.GetClientsWithFilterUserUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i118.GetClientMarketingReportUsecase>(() =>
      _i118.GetClientMarketingReportUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i119.GetRecommendedClientsUsecase>(() =>
      _i119.GetRecommendedClientsUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i120.GetSimilarClientsUsecase>(
      () => _i120.GetSimilarClientsUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i121.ReceiveClientUserUsecase>(
      () => _i121.ReceiveClientUserUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i122.TransferClientUserUsecase>(
      () => _i122.TransferClientUserUsecase(gh<_i73.ClientsListRepository>()));
  gh.factory<_i123.GetVersionUseCase>(
      () => _i123.GetVersionUseCase(gh<_i57.AppRepository>()));
  gh.factory<_i124.AddTicketCubit>(
      () => _i124.AddTicketCubit(gh<_i38.AddTicketUseCase>()));
  gh.lazySingleton<_i125.AddAgentUseCase>(
      () => _i125.AddAgentUseCase(gh<_i59.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i126.GetAllCitiesUseCase>(() =>
      _i126.GetAllCitiesUseCase(gh<_i59.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i127.UpdateAgentUseCase>(
      () => _i127.UpdateAgentUseCase(gh<_i59.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i128.CrudAgentSupportFilesUsecase>(() =>
      _i128.CrudAgentSupportFilesUsecase(
          gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i129.TaskCubit>(() => _i129.TaskCubit(
        gh<_i105.AddTaskUsecase>(),
        gh<_i107.FilterTaskUsecase>(),
        gh<_i106.ChangeStatusTaskUsecase>(),
      ));
  gh.lazySingleton<_i130.AddAgentDateUseCase>(() =>
      _i130.AddAgentDateUseCase(gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.factory<_i131.ClientsListBloc>(() => _i131.ClientsListBloc(
        gh<_i117.GetClientsWithFilterUserUsecase>(),
        gh<_i119.GetRecommendedClientsUsecase>(),
        gh<_i111.AddClientUserUsecase>(),
        gh<_i114.EditClientUserUsecase>(),
        gh<_i113.ChangeTypeClientUsecase>(),
        gh<_i120.GetSimilarClientsUsecase>(),
        gh<_i112.ApproveRejectClientUsecase>(),
        gh<_i93.CrudClientSupportFilesUsecase>(),
        gh<_i94.GetClientSupportFilesUsecase>(),
        gh<_i122.TransferClientUserUsecase>(),
        gh<_i121.ReceiveClientUserUsecase>(),
        gh<_i118.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i132.LoginCubit>(() => _i132.LoginCubit(
        gh<_i68.LoginUsecase>(),
        gh<_i70.VerifyOtpUsecase>(),
        gh<_i66.CacheTokenUsecase>(),
        gh<_i67.GetTokenUsecase>(),
        gh<_i69.ValidateTokenUsecase>(),
      ));
  gh.factory<_i133.AddLevelUsecase>(
      () => _i133.AddLevelUsecase(gh<_i55.PrivilegeRepository>()));
  gh.factory<_i134.GetLevelsUsecase>(
      () => _i134.GetLevelsUsecase(gh<_i55.PrivilegeRepository>()));
  gh.factory<_i135.GetPrivilegesUsecase>(
      () => _i135.GetPrivilegesUsecase(gh<_i55.PrivilegeRepository>()));
  gh.factory<_i136.UpdatePrivilegeUsecase>(
      () => _i136.UpdatePrivilegeUsecase(gh<_i55.PrivilegeRepository>()));
  gh.factory<_i137.AttachmentsRowCubit>(() => _i137.AttachmentsRowCubit(
        gh<_i94.GetClientSupportFilesUsecase>(),
        gh<_i93.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i138.AddCommentUsecase>(
      () => _i138.AddCommentUsecase(gh<_i71.CompanyRepository>()));
  gh.factory<_i139.GetCommentUsecase>(
      () => _i139.GetCommentUsecase(gh<_i71.CompanyRepository>()));
  gh.lazySingleton<_i140.PrivilegeCubit>(() => _i140.PrivilegeCubit(
        gh<_i134.GetLevelsUsecase>(),
        gh<_i135.GetPrivilegesUsecase>(),
        gh<_i136.UpdatePrivilegeUsecase>(),
        gh<_i133.AddLevelUsecase>(),
      ));
  gh.factory<_i141.SupportTabCubit>(() => _i141.SupportTabCubit(
        gh<_i78.GetInvoiceByClientUsecase>(),
        gh<_i77.AddDateInstallUsecase>(),
        gh<_i81.SetDateDoneUsecase>(),
        gh<_i82.SetReadyInstallUsecase>(),
        gh<_i80.ReturnInvoiceApproveUsecase>(),
        gh<_i79.ReceiveDeviceUsecase>(),
      ));
  gh.lazySingleton<_i142.AddAgentCommentUsecase>(() =>
      _i142.AddAgentCommentUsecase(gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i143.DoneTrainingUsecase>(() =>
      _i143.DoneTrainingUsecase(gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i144.GetAgentUsecase>(
      () => _i144.GetAgentUsecase(gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i145.GetAgentClientListUsecase>(() =>
      _i145.GetAgentClientListUsecase(
          gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i146.GetAgentCommentsListUsecase>(() =>
      _i146.GetAgentCommentsListUsecase(
          gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i147.GetAgentDatesListUsecase>(() =>
      _i147.GetAgentDatesListUsecase(gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i148.GetAgentInvoiceListUsecase>(() =>
      _i148.GetAgentInvoiceListUsecase(
          gh<_i75.AgentsDistributorsProfileRepo>()));
  gh.singleton<_i149.CitiesCubit>(
      () => _i149.CitiesCubit(gh<_i126.GetAllCitiesUseCase>()));
  gh.factory<_i150.AddRejectReasonsUsecase>(() =>
      _i150.AddRejectReasonsUsecase(gh<_i88.ManageWithdrawalsRepository>()));
  gh.factory<_i151.EditRejectReasonsUsecase>(() =>
      _i151.EditRejectReasonsUsecase(gh<_i88.ManageWithdrawalsRepository>()));
  gh.factory<_i152.GetRejectReasonsUsecase>(() =>
      _i152.GetRejectReasonsUsecase(gh<_i88.ManageWithdrawalsRepository>()));
  gh.factory<_i153.GetUserSeriesUsecase>(
      () => _i153.GetUserSeriesUsecase(gh<_i88.ManageWithdrawalsRepository>()));
  gh.factory<_i154.GetWithdrawnDetailsUsecase>(() =>
      _i154.GetWithdrawnDetailsUsecase(gh<_i88.ManageWithdrawalsRepository>()));
  gh.factory<_i155.SetApproveSeriesUsecase>(() =>
      _i155.SetApproveSeriesUsecase(gh<_i88.ManageWithdrawalsRepository>()));
  gh.factory<_i156.UpdateSeriesUsecase>(
      () => _i156.UpdateSeriesUsecase(gh<_i88.ManageWithdrawalsRepository>()));
  gh.singleton<_i157.AppManagerCubit>(
      () => _i157.AppManagerCubit(gh<_i123.GetVersionUseCase>()));
  gh.lazySingleton<_i158.GetWaitingAgentsUsecase>(
      () => _i158.GetWaitingAgentsUsecase(gh<_i98.WaitingAgentsRepo>()));
  gh.lazySingleton<_i159.ManageWithdrawalsCubit>(
      () => _i159.ManageWithdrawalsCubit(
            gh<_i153.GetUserSeriesUsecase>(),
            gh<_i156.UpdateSeriesUsecase>(),
            gh<_i32.GetAllUsersUsecase>(),
            gh<_i103.GetWithdrawalsInvoicesUsecase>(),
            gh<_i104.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i155.SetApproveSeriesUsecase>(),
            gh<_i154.GetWithdrawnDetailsUsecase>(),
            gh<_i150.AddRejectReasonsUsecase>(),
            gh<_i152.GetRejectReasonsUsecase>(),
            gh<_i151.EditRejectReasonsUsecase>(),
            gh<_i102.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i160.CommunicationListBloc>(() =>
      _i160.CommunicationListBloc(gh<_i92.GetCommunicationListUsecase>()));
  gh.factory<_i161.AddParticipateCommentUsecase>(() =>
      _i161.AddParticipateCommentUsecase(gh<_i96.ParticipateListRepository>()));
  gh.factory<_i162.AddParticipateUserUsecase>(() =>
      _i162.AddParticipateUserUsecase(gh<_i96.ParticipateListRepository>()));
  gh.factory<_i163.EditParticipateUserUsecase>(() =>
      _i163.EditParticipateUserUsecase(gh<_i96.ParticipateListRepository>()));
  gh.factory<_i164.GetInvoiceByIdUsecase>(
      () => _i164.GetInvoiceByIdUsecase(gh<_i96.ParticipateListRepository>()));
  gh.factory<_i165.ParticipateClientListUsecase>(() =>
      _i165.ParticipateClientListUsecase(gh<_i96.ParticipateListRepository>()));
  gh.factory<_i166.ParticipateCommentListUsecase>(() =>
      _i166.ParticipateCommentListUsecase(
          gh<_i96.ParticipateListRepository>()));
  gh.factory<_i167.ParticipateInvoiceListUsecase>(() =>
      _i167.ParticipateInvoiceListUsecase(
          gh<_i96.ParticipateListRepository>()));
  gh.factory<_i168.ParticipateListUsecase>(
      () => _i168.ParticipateListUsecase(gh<_i96.ParticipateListRepository>()));
  gh.factory<_i169.AgentsDistributorsCubit>(() => _i169.AgentsDistributorsCubit(
        gh<_i101.GetAgentsAndDistributorsUseCase>(),
        gh<_i100.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i170.UsersCubit>(() => _i170.UsersCubit(
        gh<_i32.GetAllUsersUsecase>(),
        gh<_i31.ActionUserUsecase>(),
        gh<_i108.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i171.CancelScheduleUsecase>(
      () => _i171.CancelScheduleUsecase(gh<_i109.DatesTableRepo>()));
  gh.lazySingleton<_i172.ChangeDateToDonUsecase>(
      () => _i172.ChangeDateToDonUsecase(gh<_i109.DatesTableRepo>()));
  gh.lazySingleton<_i173.GetDateInstallationUsecase>(
      () => _i173.GetDateInstallationUsecase(gh<_i109.DatesTableRepo>()));
  gh.lazySingleton<_i174.RescheduleDateUsecase>(
      () => _i174.RescheduleDateUsecase(gh<_i109.DatesTableRepo>()));
  gh.lazySingleton<_i175.ReturnScheduleVisitToOpenUsecase>(
      () => _i175.ReturnScheduleVisitToOpenUsecase(gh<_i109.DatesTableRepo>()));
  gh.factory<_i176.AgentsDistributorsProfileBloc>(
      () => _i176.AgentsDistributorsProfileBloc(
            gh<_i145.GetAgentClientListUsecase>(),
            gh<_i148.GetAgentInvoiceListUsecase>(),
            gh<_i164.GetInvoiceByIdUsecase>(),
            gh<_i146.GetAgentCommentsListUsecase>(),
            gh<_i142.AddAgentCommentUsecase>(),
            gh<_i143.DoneTrainingUsecase>(),
            gh<_i130.AddAgentDateUseCase>(),
            gh<_i147.GetAgentDatesListUsecase>(),
            gh<_i128.CrudAgentSupportFilesUsecase>(),
          ));
  gh.factory<_i177.AgentsDistributorsActionsCubit>(
      () => _i177.AgentsDistributorsActionsCubit(
            gh<_i126.GetAllCitiesUseCase>(),
            gh<_i125.AddAgentUseCase>(),
            gh<_i127.UpdateAgentUseCase>(),
          ));
  gh.factory<_i178.CompanyCubit>(() => _i178.CompanyCubit(
        gh<_i139.GetCommentUsecase>(),
        gh<_i138.AddCommentUsecase>(),
      ));
  gh.factory<_i179.InvoicesSectionCubit>(() => _i179.InvoicesSectionCubit(
        gh<_i65.GetInvoicesByPrivilegesUsecase>(),
        gh<_i101.GetAgentsAndDistributorsUseCase>(),
        gh<_i168.ParticipateListUsecase>(),
        gh<_i83.GetAllUsersUseCase>(),
      ));
  gh.factory<_i180.DatesTableCubit>(() => _i180.DatesTableCubit(
        gh<_i173.GetDateInstallationUsecase>(),
        gh<_i174.RescheduleDateUsecase>(),
        gh<_i172.ChangeDateToDonUsecase>(),
        gh<_i171.CancelScheduleUsecase>(),
        gh<_i175.ReturnScheduleVisitToOpenUsecase>(),
      ));
  gh.factory<_i181.ParticipateListBloc>(() => _i181.ParticipateListBloc(
        gh<_i168.ParticipateListUsecase>(),
        gh<_i162.AddParticipateUserUsecase>(),
        gh<_i163.EditParticipateUserUsecase>(),
        gh<_i165.ParticipateClientListUsecase>(),
        gh<_i167.ParticipateInvoiceListUsecase>(),
        gh<_i164.GetInvoiceByIdUsecase>(),
        gh<_i166.ParticipateCommentListUsecase>(),
        gh<_i161.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i182.WaitingAgentsCubit>(
      () => _i182.WaitingAgentsCubit(gh<_i158.GetWaitingAgentsUsecase>()));
  return getIt;
}

class _$AppModule extends _i183.AppModule {}
