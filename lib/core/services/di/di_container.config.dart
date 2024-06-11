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
    as _i55;
import '../../../features/app/domain/repositories/app_repository.dart' as _i54;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i116;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i150;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i30;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i44;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i49;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i48;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i62;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i63;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i64;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i65;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i66;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i125;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i15;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i27;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i26;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i37;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i38;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i39;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i41;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i40;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i42;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i117;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i46;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i43;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i18;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i78;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i77;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i87;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i153;
import '../../../features/common/client_profile/invoices_tab/data/data_sources/incoives_tab_datasource.dart'
    as _i47;
import '../../../features/common/client_profile/invoices_tab/data/repositories/invoices_tab_repo_impl.dart'
    as _i86;
import '../../../features/common/client_profile/invoices_tab/domain/repositories/invoices_tab_repo.dart'
    as _i85;
import '../../../features/common/client_profile/invoices_tab/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i134;
import '../../../features/common/client_profile/invoices_tab/presentation/manager/invoices_tab_cubit/invoices_tab_cubit.dart'
    as _i151;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i36;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i59;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i58;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i73;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i74;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i75;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i76;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i121;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i53;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i52;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i126;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i127;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i128;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i129;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i133;
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
    as _i163;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i82;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i81;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i143;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i144;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i95;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i145;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i146;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i97;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i96;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i147;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i148;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i149;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i152;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i21;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i70;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i69;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i104;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i105;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i106;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i88;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i107;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i111;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i89;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i108;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i109;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i110;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i112;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i113;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i114;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i115;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i124;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i22;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i68;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i67;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i131;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i132;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i169;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i35;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i45;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i57;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i72;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i84;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i56;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i71;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i83;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i135;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i123;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i118;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/change_state_agent_usecase.dart'
    as _i93;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i136;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i138;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i139;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i140;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i141;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i94;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i119;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i120;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i168;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i171;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i162;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i23;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i61;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i60;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i79;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i80;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i90;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i24;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i92;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i91;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i156;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i157;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i158;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i159;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i160;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i161;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i172;
import '../../../features/support/dates_table/data/data_sources/dates_table_datasource.dart'
    as _i50;
import '../../../features/support/dates_table/data/repositories/dates_table_repo_impl.dart'
    as _i103;
import '../../../features/support/dates_table/domain/repositories/dates_table_repo.dart'
    as _i102;
import '../../../features/support/dates_table/domain/use_cases/cancel_schedule_usecase.dart'
    as _i164;
import '../../../features/support/dates_table/domain/use_cases/change_date_to_done_usecase.dart'
    as _i165;
import '../../../features/support/dates_table/domain/use_cases/get_date_installation_usecase.dart'
    as _i166;
import '../../../features/support/dates_table/domain/use_cases/reschedule_date_usecase.dart'
    as _i167;
import '../../../features/support/dates_table/presentation/manager/dates_table_cubit.dart'
    as _i170;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i25;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i34;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i33;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i98;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i99;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i100;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i101;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i122;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i130;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i142;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i51;
import 'di_container.dart' as _i173;

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
  gh.lazySingleton<_i37.AddTicketUseCase>(
      () => _i37.AddTicketUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i38.EditTicketTypeUseCase>(
      () => _i38.EditTicketTypeUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i39.GetClientTicketsUseCase>(
      () => _i39.GetClientTicketsUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i40.GetTicketsUseCase>(
      () => _i40.GetTicketsUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i41.GetTicketByIdUseCase>(
      () => _i41.GetTicketByIdUseCase(gh<_i26.TicketsRepo>()));
  gh.lazySingleton<_i42.TransferTicketUseCase>(
      () => _i42.TransferTicketUseCase(gh<_i26.TicketsRepo>()));
  gh.factory<_i43.TicketsCubit>(() => _i43.TicketsCubit(
        gh<_i40.GetTicketsUseCase>(),
        gh<_i41.GetTicketByIdUseCase>(),
        gh<_i39.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i44.LoginRemoteDataSource>(
      () => _i44.LoginRemoteDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i45.AgentsDistributorsProfileDataSource>(() =>
      _i45.AgentsDistributorsProfileDataSourceImpl(gh<_i9.ApiServices>()));
  gh.factory<_i46.EditTicketCubit>(() => _i46.EditTicketCubit(
        gh<_i38.EditTicketTypeUseCase>(),
        gh<_i42.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i47.InvoicesTabDataSource>(
      () => _i47.InvoicesTabDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i48.LoginRepo>(() => _i49.LoginRepoImpl(
        gh<_i44.LoginRemoteDataSource>(),
        gh<_i30.LoginLocalDataSource>(),
      ));
  gh.lazySingleton<_i50.DatesTableDataSource>(
      () => _i50.DatesTableDataSourceImpl(gh<_i9.ApiServices>()));
  gh.lazySingleton<_i51.LocationServices>(
      () => _i51.LocationServices(gh<_i8.Location>()));
  gh.factory<_i52.PrivilegeRepository>(
      () => _i53.PrivilegeRepositoryImpl(gh<_i19.PrivilegeDatasource>()));
  gh.factory<_i54.AppRepository>(
      () => _i55.AppRepositoryImpl(gh<_i17.AppDatasource>()));
  gh.lazySingleton<_i56.AgentsDistributorsActionsRepo>(() =>
      _i57.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i58.SupportTabRepo>(
      () => _i59.SupportTabRepoImpl(gh<_i36.SupportTabDataSource>()));
  gh.factory<_i60.LinksImportantRepository>(
      () => _i61.LinkRepositoryImpl(gh<_i23.LinkDatasource>()));
  gh.lazySingleton<_i62.CacheTokenUsecase>(
      () => _i62.CacheTokenUsecase(gh<_i48.LoginRepo>()));
  gh.lazySingleton<_i63.GetTokenUsecase>(
      () => _i63.GetTokenUsecase(gh<_i48.LoginRepo>()));
  gh.lazySingleton<_i64.LoginUsecase>(
      () => _i64.LoginUsecase(gh<_i48.LoginRepo>()));
  gh.lazySingleton<_i65.ValidateTokenUsecase>(
      () => _i65.ValidateTokenUsecase(gh<_i48.LoginRepo>()));
  gh.lazySingleton<_i66.VerifyOtpUsecase>(
      () => _i66.VerifyOtpUsecase(gh<_i48.LoginRepo>()));
  gh.factory<_i67.CompanyRepository>(
      () => _i68.CompanyRepositoryImpl(gh<_i22.CommentCompanyDatasource>()));
  gh.factory<_i69.ClientsListRepository>(
      () => _i70.ClientsListRepositoryImpl(gh<_i21.ClientsListDatasource>()));
  gh.lazySingleton<_i71.AgentsDistributorsProfileRepo>(() =>
      _i72.AgentsDistributorsProfileRepoImpl(
          gh<_i45.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i73.AddDateInstallUsecase>(
      () => _i73.AddDateInstallUsecase(gh<_i58.SupportTabRepo>()));
  gh.lazySingleton<_i74.GetInvoiceByClientUsecase>(
      () => _i74.GetInvoiceByClientUsecase(gh<_i58.SupportTabRepo>()));
  gh.lazySingleton<_i75.SetDateDoneUsecase>(
      () => _i75.SetDateDoneUsecase(gh<_i58.SupportTabRepo>()));
  gh.lazySingleton<_i76.SetReadyInstallUsecase>(
      () => _i76.SetReadyInstallUsecase(gh<_i58.SupportTabRepo>()));
  gh.factory<_i77.CommunicationListRepository>(() =>
      _i78.CommunicationListRepositoryImpl(
          gh<_i18.CommunicationListDatasource>()));
  gh.factory<_i79.ActionLinkUsecase>(
      () => _i79.ActionLinkUsecase(gh<_i60.LinksImportantRepository>()));
  gh.factory<_i80.GetLinkUsecase>(
      () => _i80.GetLinkUsecase(gh<_i60.LinksImportantRepository>()));
  gh.lazySingleton<_i81.ManageWithdrawalsRepository>(() =>
      _i82.ManageWithdrawalsRepositoryImpl(
          gh<_i16.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i83.AgentsDistributorsRepo>(() =>
      _i84.AgentsDistributorsRepoImpl(gh<_i35.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i85.InvoicesTabRepo>(
      () => _i86.InvoicesTabRepoImpl(gh<_i47.InvoicesTabDataSource>()));
  gh.factory<_i87.GetCommunicationListUsecase>(() =>
      _i87.GetCommunicationListUsecase(gh<_i77.CommunicationListRepository>()));
  gh.lazySingleton<_i88.CrudClientSupportFilesUsecase>(() =>
      _i88.CrudClientSupportFilesUsecase(
          repository: gh<_i69.ClientsListRepository>()));
  gh.lazySingleton<_i89.GetClientSupportFilesUsecase>(() =>
      _i89.GetClientSupportFilesUsecase(
          repository: gh<_i69.ClientsListRepository>()));
  gh.factory<_i90.LinkCubit>(() => _i90.LinkCubit(
        gh<_i80.GetLinkUsecase>(),
        gh<_i79.ActionLinkUsecase>(),
      ));
  gh.factory<_i91.ParticipateListRepository>(() =>
      _i92.ParticipateListRepositoryImpl(
          gh<_i24.ParticipatesListDatasource>()));
  gh.lazySingleton<_i93.ChangeStateAgentUseCase>(
      () => _i93.ChangeStateAgentUseCase(gh<_i83.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i94.GetAgentsAndDistributorsUseCase>(() =>
      _i94.GetAgentsAndDistributorsUseCase(gh<_i83.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i95.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i95.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i81.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i96.GetWithdrawalsInvoicesUsecase>(() =>
      _i96.GetWithdrawalsInvoicesUsecase(
          gh<_i81.ManageWithdrawalsRepository>()));
  gh.factory<_i97.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i97.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i81.ManageWithdrawalsRepository>()));
  gh.factory<_i98.AddTaskUsecase>(
      () => _i98.AddTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i99.ChangeStatusTaskUsecase>(
      () => _i99.ChangeStatusTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i100.FilterTaskUsecase>(
      () => _i100.FilterTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i101.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i101.GetUsersByDepartmentAndRegionUsecase(gh<_i33.TaskRepository>()));
  gh.lazySingleton<_i102.DatesTableRepo>(
      () => _i103.DatesTableRepoImpl(gh<_i50.DatesTableDataSource>()));
  gh.factory<_i104.AddClientUserUsecase>(
      () => _i104.AddClientUserUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i105.ApproveRejectClientUsecase>(
      () => _i105.ApproveRejectClientUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i106.ChangeTypeClientUsecase>(
      () => _i106.ChangeTypeClientUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i107.EditClientUserUsecase>(
      () => _i107.EditClientUserUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i108.GetClientsListByRegionUseCase>(() =>
      _i108.GetClientsListByRegionUseCase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i109.GetClientsListByUserUseCase>(() =>
      _i109.GetClientsListByUserUseCase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i110.GetClientsWithFilterUserUsecase>(() =>
      _i110.GetClientsWithFilterUserUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i111.GetClientMarketingReportUsecase>(() =>
      _i111.GetClientMarketingReportUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i112.GetRecommendedClientsUsecase>(() =>
      _i112.GetRecommendedClientsUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i113.GetSimilarClientsUsecase>(
      () => _i113.GetSimilarClientsUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i114.ReceiveClientUserUsecase>(
      () => _i114.ReceiveClientUserUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i115.TransferClientUserUsecase>(
      () => _i115.TransferClientUserUsecase(gh<_i69.ClientsListRepository>()));
  gh.factory<_i116.GetVersionUseCase>(
      () => _i116.GetVersionUseCase(gh<_i54.AppRepository>()));
  gh.factory<_i117.AddTicketCubit>(
      () => _i117.AddTicketCubit(gh<_i37.AddTicketUseCase>()));
  gh.lazySingleton<_i118.AddAgentUseCase>(
      () => _i118.AddAgentUseCase(gh<_i56.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i119.GetAllCitiesUseCase>(() =>
      _i119.GetAllCitiesUseCase(gh<_i56.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i120.UpdateAgentUseCase>(
      () => _i120.UpdateAgentUseCase(gh<_i56.AgentsDistributorsActionsRepo>()));
  gh.factory<_i121.SupportTabCubit>(() => _i121.SupportTabCubit(
        gh<_i74.GetInvoiceByClientUsecase>(),
        gh<_i73.AddDateInstallUsecase>(),
        gh<_i75.SetDateDoneUsecase>(),
        gh<_i76.SetReadyInstallUsecase>(),
      ));
  gh.lazySingleton<_i122.TaskCubit>(() => _i122.TaskCubit(
        gh<_i98.AddTaskUsecase>(),
        gh<_i100.FilterTaskUsecase>(),
        gh<_i99.ChangeStatusTaskUsecase>(),
      ));
  gh.lazySingleton<_i123.AddAgentDateUseCase>(() =>
      _i123.AddAgentDateUseCase(gh<_i71.AgentsDistributorsProfileRepo>()));
  gh.factory<_i124.ClientsListBloc>(() => _i124.ClientsListBloc(
        gh<_i110.GetClientsWithFilterUserUsecase>(),
        gh<_i112.GetRecommendedClientsUsecase>(),
        gh<_i104.AddClientUserUsecase>(),
        gh<_i107.EditClientUserUsecase>(),
        gh<_i106.ChangeTypeClientUsecase>(),
        gh<_i113.GetSimilarClientsUsecase>(),
        gh<_i105.ApproveRejectClientUsecase>(),
        gh<_i88.CrudClientSupportFilesUsecase>(),
        gh<_i89.GetClientSupportFilesUsecase>(),
        gh<_i115.TransferClientUserUsecase>(),
        gh<_i114.ReceiveClientUserUsecase>(),
        gh<_i111.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i125.LoginCubit>(() => _i125.LoginCubit(
        gh<_i64.LoginUsecase>(),
        gh<_i66.VerifyOtpUsecase>(),
        gh<_i62.CacheTokenUsecase>(),
        gh<_i63.GetTokenUsecase>(),
        gh<_i65.ValidateTokenUsecase>(),
      ));
  gh.factory<_i126.AddLevelUsecase>(
      () => _i126.AddLevelUsecase(gh<_i52.PrivilegeRepository>()));
  gh.factory<_i127.GetLevelsUsecase>(
      () => _i127.GetLevelsUsecase(gh<_i52.PrivilegeRepository>()));
  gh.factory<_i128.GetPrivilegesUsecase>(
      () => _i128.GetPrivilegesUsecase(gh<_i52.PrivilegeRepository>()));
  gh.factory<_i129.UpdatePrivilegeUsecase>(
      () => _i129.UpdatePrivilegeUsecase(gh<_i52.PrivilegeRepository>()));
  gh.factory<_i130.AttachmentsRowCubit>(() => _i130.AttachmentsRowCubit(
        gh<_i89.GetClientSupportFilesUsecase>(),
        gh<_i88.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i131.AddCommentUsecase>(
      () => _i131.AddCommentUsecase(gh<_i67.CompanyRepository>()));
  gh.factory<_i132.GetCommentUsecase>(
      () => _i132.GetCommentUsecase(gh<_i67.CompanyRepository>()));
  gh.lazySingleton<_i133.PrivilegeCubit>(() => _i133.PrivilegeCubit(
        gh<_i127.GetLevelsUsecase>(),
        gh<_i128.GetPrivilegesUsecase>(),
        gh<_i129.UpdatePrivilegeUsecase>(),
        gh<_i126.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i134.GetInvoicesByPrivilegesUsecase>(
      () => _i134.GetInvoicesByPrivilegesUsecase(gh<_i85.InvoicesTabRepo>()));
  gh.lazySingleton<_i135.AddAgentCommentUsecase>(() =>
      _i135.AddAgentCommentUsecase(gh<_i71.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i136.DoneTrainingUsecase>(() =>
      _i136.DoneTrainingUsecase(gh<_i71.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i137.GetAgentUsecase>(
      () => _i137.GetAgentUsecase(gh<_i71.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i138.GetAgentClientListUsecase>(() =>
      _i138.GetAgentClientListUsecase(
          gh<_i71.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i139.GetAgentCommentsListUsecase>(() =>
      _i139.GetAgentCommentsListUsecase(
          gh<_i71.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i140.GetAgentDatesListUsecase>(() =>
      _i140.GetAgentDatesListUsecase(gh<_i71.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i141.GetAgentInvoiceListUsecase>(() =>
      _i141.GetAgentInvoiceListUsecase(
          gh<_i71.AgentsDistributorsProfileRepo>()));
  gh.singleton<_i142.CitiesCubit>(
      () => _i142.CitiesCubit(gh<_i119.GetAllCitiesUseCase>()));
  gh.factory<_i143.AddRejectReasonsUsecase>(() =>
      _i143.AddRejectReasonsUsecase(gh<_i81.ManageWithdrawalsRepository>()));
  gh.factory<_i144.EditRejectReasonsUsecase>(() =>
      _i144.EditRejectReasonsUsecase(gh<_i81.ManageWithdrawalsRepository>()));
  gh.factory<_i145.GetRejectReasonsUsecase>(() =>
      _i145.GetRejectReasonsUsecase(gh<_i81.ManageWithdrawalsRepository>()));
  gh.factory<_i146.GetUserSeriesUsecase>(
      () => _i146.GetUserSeriesUsecase(gh<_i81.ManageWithdrawalsRepository>()));
  gh.factory<_i147.GetWithdrawnDetailsUsecase>(() =>
      _i147.GetWithdrawnDetailsUsecase(gh<_i81.ManageWithdrawalsRepository>()));
  gh.factory<_i148.SetApproveSeriesUsecase>(() =>
      _i148.SetApproveSeriesUsecase(gh<_i81.ManageWithdrawalsRepository>()));
  gh.factory<_i149.UpdateSeriesUsecase>(
      () => _i149.UpdateSeriesUsecase(gh<_i81.ManageWithdrawalsRepository>()));
  gh.singleton<_i150.AppManagerCubit>(
      () => _i150.AppManagerCubit(gh<_i116.GetVersionUseCase>()));
  gh.factory<_i151.InvoicesTabCubit>(
      () => _i151.InvoicesTabCubit(gh<_i134.GetInvoicesByPrivilegesUsecase>()));
  gh.lazySingleton<_i152.ManageWithdrawalsCubit>(
      () => _i152.ManageWithdrawalsCubit(
            gh<_i146.GetUserSeriesUsecase>(),
            gh<_i149.UpdateSeriesUsecase>(),
            gh<_i32.GetAllUsersUsecase>(),
            gh<_i96.GetWithdrawalsInvoicesUsecase>(),
            gh<_i97.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i148.SetApproveSeriesUsecase>(),
            gh<_i147.GetWithdrawnDetailsUsecase>(),
            gh<_i143.AddRejectReasonsUsecase>(),
            gh<_i145.GetRejectReasonsUsecase>(),
            gh<_i144.EditRejectReasonsUsecase>(),
            gh<_i95.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i153.CommunicationListBloc>(() =>
      _i153.CommunicationListBloc(gh<_i87.GetCommunicationListUsecase>()));
  gh.factory<_i154.AddParticipateCommentUsecase>(() =>
      _i154.AddParticipateCommentUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i155.AddParticipateUserUsecase>(() =>
      _i155.AddParticipateUserUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i156.EditParticipateUserUsecase>(() =>
      _i156.EditParticipateUserUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i157.GetInvoiceByIdUsecase>(
      () => _i157.GetInvoiceByIdUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i158.ParticipateClientListUsecase>(() =>
      _i158.ParticipateClientListUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i159.ParticipateCommentListUsecase>(() =>
      _i159.ParticipateCommentListUsecase(
          gh<_i91.ParticipateListRepository>()));
  gh.factory<_i160.ParticipateInvoiceListUsecase>(() =>
      _i160.ParticipateInvoiceListUsecase(
          gh<_i91.ParticipateListRepository>()));
  gh.factory<_i161.ParticipateListUsecase>(
      () => _i161.ParticipateListUsecase(gh<_i91.ParticipateListRepository>()));
  gh.factory<_i162.AgentsDistributorsCubit>(() => _i162.AgentsDistributorsCubit(
        gh<_i94.GetAgentsAndDistributorsUseCase>(),
        gh<_i93.ChangeStateAgentUseCase>(),
      ));
  gh.factory<_i163.UsersCubit>(() => _i163.UsersCubit(
        gh<_i32.GetAllUsersUsecase>(),
        gh<_i31.ActionUserUsecase>(),
        gh<_i101.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i164.CancelScheduleUsecase>(
      () => _i164.CancelScheduleUsecase(gh<_i102.DatesTableRepo>()));
  gh.lazySingleton<_i165.ChangeDateToDonUsecase>(
      () => _i165.ChangeDateToDonUsecase(gh<_i102.DatesTableRepo>()));
  gh.lazySingleton<_i166.GetDateInstallationUsecase>(
      () => _i166.GetDateInstallationUsecase(gh<_i102.DatesTableRepo>()));
  gh.lazySingleton<_i167.RescheduleDateUsecase>(
      () => _i167.RescheduleDateUsecase(gh<_i102.DatesTableRepo>()));
  gh.factory<_i168.AgentsDistributorsActionsCubit>(
      () => _i168.AgentsDistributorsActionsCubit(
            gh<_i119.GetAllCitiesUseCase>(),
            gh<_i118.AddAgentUseCase>(),
            gh<_i120.UpdateAgentUseCase>(),
          ));
  gh.factory<_i169.CompanyCubit>(() => _i169.CompanyCubit(
        gh<_i132.GetCommentUsecase>(),
        gh<_i131.AddCommentUsecase>(),
      ));
  gh.factory<_i170.DatesTableCubit>(() => _i170.DatesTableCubit(
        gh<_i166.GetDateInstallationUsecase>(),
        gh<_i167.RescheduleDateUsecase>(),
        gh<_i165.ChangeDateToDonUsecase>(),
        gh<_i164.CancelScheduleUsecase>(),
      ));
  gh.factory<_i171.AgentsDistributorsProfileBloc>(
      () => _i171.AgentsDistributorsProfileBloc(
            gh<_i138.GetAgentClientListUsecase>(),
            gh<_i141.GetAgentInvoiceListUsecase>(),
            gh<_i157.GetInvoiceByIdUsecase>(),
            gh<_i139.GetAgentCommentsListUsecase>(),
            gh<_i135.AddAgentCommentUsecase>(),
            gh<_i136.DoneTrainingUsecase>(),
            gh<_i123.AddAgentDateUseCase>(),
            gh<_i140.GetAgentDatesListUsecase>(),
          ));
  gh.factory<_i172.ParticipateListBloc>(() => _i172.ParticipateListBloc(
        gh<_i161.ParticipateListUsecase>(),
        gh<_i155.AddParticipateUserUsecase>(),
        gh<_i156.EditParticipateUserUsecase>(),
        gh<_i158.ParticipateClientListUsecase>(),
        gh<_i160.ParticipateInvoiceListUsecase>(),
        gh<_i157.GetInvoiceByIdUsecase>(),
        gh<_i159.ParticipateCommentListUsecase>(),
        gh<_i154.AddParticipateCommentUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i173.AppModule {}
