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
    as _i54;
import '../../../features/app/domain/repositories/app_repository.dart' as _i53;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i112;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i147;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i30;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i44;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i49;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i48;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i61;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i62;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i63;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i64;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i65;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i121;
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
    as _i113;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i46;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i43;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i18;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i77;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i76;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i86;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i151;
import '../../../features/common/client_profile/invoices_tab/data/data_sources/incoives_tab_datasource.dart'
    as _i47;
import '../../../features/common/client_profile/invoices_tab/data/repositories/invoices_tab_repo_impl.dart'
    as _i85;
import '../../../features/common/client_profile/invoices_tab/domain/repositories/invoices_tab_repo.dart'
    as _i84;
import '../../../features/common/client_profile/invoices_tab/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i131;
import '../../../features/common/client_profile/invoices_tab/presentation/manager/invoices_tab_cubit/invoices_tab_cubit.dart'
    as _i148;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i36;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i58;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i57;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i72;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i73;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i74;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i75;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i117;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i52;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i51;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i122;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i123;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i124;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i125;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i130;
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
    as _i160;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i16;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i81;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i80;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i140;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i141;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i93;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i142;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i143;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i95;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i94;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i144;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i145;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i146;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i149;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i21;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i69;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i68;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i100;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i101;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i102;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i87;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i103;
import '../../../features/sales/clients_list/domain/use_cases/get_client_marketing_report_usecase.dart'
    as _i111;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i88;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i104;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i105;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i106;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i107;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i108;
import '../../../features/sales/clients_list/domain/use_cases/receive_client_usecase.dart'
    as _i110;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i109;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i120;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i22;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i67;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i66;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i127;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i128;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i161;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i14;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i35;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i45;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i56;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i71;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i83;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i55;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i70;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i82;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i132;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i119;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i114;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i133;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i134;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i135;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i136;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i137;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i138;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i92;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i115;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i116;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i150;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i163;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i129;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i23;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i60;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i59;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i78;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i79;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i89;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i24;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i91;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i90;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i152;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i153;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i156;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i157;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i158;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i159;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i162;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i25;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i34;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i33;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i96;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i97;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i98;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i99;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i118;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i126;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i139;
import '../api/api_services.dart' as _i9;
import '../api/dio/dio_services.dart' as _i10;
import '../cache_services/cache_services.dart' as _i11;
import '../cache_services/prefs_consumer.dart' as _i13;
import '../cache_services/secure_storage_consumer.dart' as _i12;
import '../maps/location_services.dart' as _i50;
import 'di_container.dart' as _i164;

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
  gh.lazySingleton<_i50.LocationServices>(
      () => _i50.LocationServices(gh<_i8.Location>()));
  gh.factory<_i51.PrivilegeRepository>(
      () => _i52.PrivilegeRepositoryImpl(gh<_i19.PrivilegeDatasource>()));
  gh.factory<_i53.AppRepository>(
      () => _i54.AppRepositoryImpl(gh<_i17.AppDatasource>()));
  gh.lazySingleton<_i55.AgentsDistributorsActionsRepo>(() =>
      _i56.AgentsDistributorsActionsRepoImpl(
          gh<_i14.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i57.SupportTabRepo>(
      () => _i58.SupportTabRepoImpl(gh<_i36.SupportTabDataSource>()));
  gh.factory<_i59.LinksImportantRepository>(
      () => _i60.LinkRepositoryImpl(gh<_i23.LinkDatasource>()));
  gh.lazySingleton<_i61.CacheTokenUsecase>(
      () => _i61.CacheTokenUsecase(gh<_i48.LoginRepo>()));
  gh.lazySingleton<_i62.GetTokenUsecase>(
      () => _i62.GetTokenUsecase(gh<_i48.LoginRepo>()));
  gh.lazySingleton<_i63.LoginUsecase>(
      () => _i63.LoginUsecase(gh<_i48.LoginRepo>()));
  gh.lazySingleton<_i64.ValidateTokenUsecase>(
      () => _i64.ValidateTokenUsecase(gh<_i48.LoginRepo>()));
  gh.lazySingleton<_i65.VerifyOtpUsecase>(
      () => _i65.VerifyOtpUsecase(gh<_i48.LoginRepo>()));
  gh.factory<_i66.CompanyRepository>(
      () => _i67.CompanyRepositoryImpl(gh<_i22.CommentCompanyDatasource>()));
  gh.factory<_i68.ClientsListRepository>(
      () => _i69.ClientsListRepositoryImpl(gh<_i21.ClientsListDatasource>()));
  gh.lazySingleton<_i70.AgentsDistributorsProfileRepo>(() =>
      _i71.AgentsDistributorsProfileRepoImpl(
          gh<_i45.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i72.AddDateInstallUsecase>(
      () => _i72.AddDateInstallUsecase(gh<_i57.SupportTabRepo>()));
  gh.lazySingleton<_i73.GetInvoiceByClientUsecase>(
      () => _i73.GetInvoiceByClientUsecase(gh<_i57.SupportTabRepo>()));
  gh.lazySingleton<_i74.SetDateDoneUsecase>(
      () => _i74.SetDateDoneUsecase(gh<_i57.SupportTabRepo>()));
  gh.lazySingleton<_i75.SetReadyInstallUsecase>(
      () => _i75.SetReadyInstallUsecase(gh<_i57.SupportTabRepo>()));
  gh.factory<_i76.CommunicationListRepository>(() =>
      _i77.CommunicationListRepositoryImpl(
          gh<_i18.CommunicationListDatasource>()));
  gh.factory<_i78.ActionLinkUsecase>(
      () => _i78.ActionLinkUsecase(gh<_i59.LinksImportantRepository>()));
  gh.factory<_i79.GetLinkUsecase>(
      () => _i79.GetLinkUsecase(gh<_i59.LinksImportantRepository>()));
  gh.lazySingleton<_i80.ManageWithdrawalsRepository>(() =>
      _i81.ManageWithdrawalsRepositoryImpl(
          gh<_i16.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i82.AgentsDistributorsRepo>(() =>
      _i83.AgentsDistributorsRepoImpl(gh<_i35.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i84.InvoicesTabRepo>(
      () => _i85.InvoicesTabRepoImpl(gh<_i47.InvoicesTabDataSource>()));
  gh.factory<_i86.GetCommunicationListUsecase>(() =>
      _i86.GetCommunicationListUsecase(gh<_i76.CommunicationListRepository>()));
  gh.lazySingleton<_i87.CrudClientSupportFilesUsecase>(() =>
      _i87.CrudClientSupportFilesUsecase(
          repository: gh<_i68.ClientsListRepository>()));
  gh.lazySingleton<_i88.GetClientSupportFilesUsecase>(() =>
      _i88.GetClientSupportFilesUsecase(
          repository: gh<_i68.ClientsListRepository>()));
  gh.factory<_i89.LinkCubit>(() => _i89.LinkCubit(
        gh<_i79.GetLinkUsecase>(),
        gh<_i78.ActionLinkUsecase>(),
      ));
  gh.factory<_i90.ParticipateListRepository>(() =>
      _i91.ParticipateListRepositoryImpl(
          gh<_i24.ParticipatesListDatasource>()));
  gh.lazySingleton<_i92.GetAgentsAndDistributorsUseCase>(() =>
      _i92.GetAgentsAndDistributorsUseCase(gh<_i82.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i93.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i93.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i80.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i94.GetWithdrawalsInvoicesUsecase>(() =>
      _i94.GetWithdrawalsInvoicesUsecase(
          gh<_i80.ManageWithdrawalsRepository>()));
  gh.factory<_i95.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i95.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i80.ManageWithdrawalsRepository>()));
  gh.factory<_i96.AddTaskUsecase>(
      () => _i96.AddTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i97.ChangeStatusTaskUsecase>(
      () => _i97.ChangeStatusTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i98.FilterTaskUsecase>(
      () => _i98.FilterTaskUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i99.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i99.GetUsersByDepartmentAndRegionUsecase(gh<_i33.TaskRepository>()));
  gh.factory<_i100.AddClientUserUsecase>(
      () => _i100.AddClientUserUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i101.ApproveRejectClientUsecase>(
      () => _i101.ApproveRejectClientUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i102.ChangeTypeClientUsecase>(
      () => _i102.ChangeTypeClientUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i103.EditClientUserUsecase>(
      () => _i103.EditClientUserUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i104.GetClientsListByRegionUseCase>(() =>
      _i104.GetClientsListByRegionUseCase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i105.GetClientsListByUserUseCase>(() =>
      _i105.GetClientsListByUserUseCase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i106.GetClientsWithFilterUserUsecase>(() =>
      _i106.GetClientsWithFilterUserUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i107.GetRecommendedClientsUsecase>(() =>
      _i107.GetRecommendedClientsUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i108.GetSimilarClientsUsecase>(
      () => _i108.GetSimilarClientsUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i109.TransferClientUserUsecase>(
      () => _i109.TransferClientUserUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i110.ReceiveClientUserUsecase>(
      () => _i110.ReceiveClientUserUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i111.GetClientMarketingReportUsecase>(() =>
      _i111.GetClientMarketingReportUsecase(gh<_i68.ClientsListRepository>()));
  gh.factory<_i112.GetVersionUseCase>(
      () => _i112.GetVersionUseCase(gh<_i53.AppRepository>()));
  gh.factory<_i113.AddTicketCubit>(
      () => _i113.AddTicketCubit(gh<_i37.AddTicketUseCase>()));
  gh.lazySingleton<_i114.AddAgentUseCase>(
      () => _i114.AddAgentUseCase(gh<_i55.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i115.GetAllCitiesUseCase>(() =>
      _i115.GetAllCitiesUseCase(gh<_i55.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i116.UpdateAgentUseCase>(
      () => _i116.UpdateAgentUseCase(gh<_i55.AgentsDistributorsActionsRepo>()));
  gh.factory<_i117.SupportTabCubit>(() => _i117.SupportTabCubit(
        gh<_i73.GetInvoiceByClientUsecase>(),
        gh<_i72.AddDateInstallUsecase>(),
        gh<_i74.SetDateDoneUsecase>(),
        gh<_i75.SetReadyInstallUsecase>(),
      ));
  gh.lazySingleton<_i118.TaskCubit>(() => _i118.TaskCubit(
        gh<_i96.AddTaskUsecase>(),
        gh<_i98.FilterTaskUsecase>(),
        gh<_i97.ChangeStatusTaskUsecase>(),
      ));
  gh.lazySingleton<_i119.AddAgentDateUseCase>(() =>
      _i119.AddAgentDateUseCase(gh<_i70.AgentsDistributorsProfileRepo>()));
  gh.factory<_i120.ClientsListBloc>(() => _i120.ClientsListBloc(
        gh<_i106.GetClientsWithFilterUserUsecase>(),
        gh<_i107.GetRecommendedClientsUsecase>(),
        gh<_i100.AddClientUserUsecase>(),
        gh<_i103.EditClientUserUsecase>(),
        gh<_i102.ChangeTypeClientUsecase>(),
        gh<_i108.GetSimilarClientsUsecase>(),
        gh<_i101.ApproveRejectClientUsecase>(),
        gh<_i87.CrudClientSupportFilesUsecase>(),
        gh<_i88.GetClientSupportFilesUsecase>(),
        gh<_i109.TransferClientUserUsecase>(),
        gh<_i110.ReceiveClientUserUsecase>(),
        gh<_i111.GetClientMarketingReportUsecase>(),
      ));
  gh.factory<_i121.LoginCubit>(() => _i121.LoginCubit(
        gh<_i63.LoginUsecase>(),
        gh<_i65.VerifyOtpUsecase>(),
        gh<_i61.CacheTokenUsecase>(),
        gh<_i62.GetTokenUsecase>(),
        gh<_i64.ValidateTokenUsecase>(),
      ));
  gh.factory<_i122.AddLevelUsecase>(
      () => _i122.AddLevelUsecase(gh<_i51.PrivilegeRepository>()));
  gh.factory<_i123.GetLevelsUsecase>(
      () => _i123.GetLevelsUsecase(gh<_i51.PrivilegeRepository>()));
  gh.factory<_i124.GetPrivilegesUsecase>(
      () => _i124.GetPrivilegesUsecase(gh<_i51.PrivilegeRepository>()));
  gh.factory<_i125.UpdatePrivilegeUsecase>(
      () => _i125.UpdatePrivilegeUsecase(gh<_i51.PrivilegeRepository>()));
  gh.factory<_i126.AttachmentsRowCubit>(() => _i126.AttachmentsRowCubit(
        gh<_i88.GetClientSupportFilesUsecase>(),
        gh<_i87.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i127.AddCommentUsecase>(
      () => _i127.AddCommentUsecase(gh<_i66.CompanyRepository>()));
  gh.factory<_i128.GetCommentUsecase>(
      () => _i128.GetCommentUsecase(gh<_i66.CompanyRepository>()));
  gh.factory<_i129.AgentsDistributorsCubit>(() => _i129.AgentsDistributorsCubit(
      gh<_i92.GetAgentsAndDistributorsUseCase>()));
  gh.lazySingleton<_i130.PrivilegeCubit>(() => _i130.PrivilegeCubit(
        gh<_i123.GetLevelsUsecase>(),
        gh<_i124.GetPrivilegesUsecase>(),
        gh<_i125.UpdatePrivilegeUsecase>(),
        gh<_i122.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i131.GetInvoicesByPrivilegesUsecase>(
      () => _i131.GetInvoicesByPrivilegesUsecase(gh<_i84.InvoicesTabRepo>()));
  gh.lazySingleton<_i132.AddAgentCommentUsecase>(() =>
      _i132.AddAgentCommentUsecase(gh<_i70.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i133.DoneTrainingUsecase>(() =>
      _i133.DoneTrainingUsecase(gh<_i70.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i134.GetAgentUsecase>(
      () => _i134.GetAgentUsecase(gh<_i70.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i135.GetAgentClientListUsecase>(() =>
      _i135.GetAgentClientListUsecase(
          gh<_i70.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i136.GetAgentCommentsListUsecase>(() =>
      _i136.GetAgentCommentsListUsecase(
          gh<_i70.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i137.GetAgentDatesListUsecase>(() =>
      _i137.GetAgentDatesListUsecase(gh<_i70.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i138.GetAgentInvoiceListUsecase>(() =>
      _i138.GetAgentInvoiceListUsecase(
          gh<_i70.AgentsDistributorsProfileRepo>()));
  gh.singleton<_i139.CitiesCubit>(
      () => _i139.CitiesCubit(gh<_i115.GetAllCitiesUseCase>()));
  gh.factory<_i140.AddRejectReasonsUsecase>(() =>
      _i140.AddRejectReasonsUsecase(gh<_i80.ManageWithdrawalsRepository>()));
  gh.factory<_i141.EditRejectReasonsUsecase>(() =>
      _i141.EditRejectReasonsUsecase(gh<_i80.ManageWithdrawalsRepository>()));
  gh.factory<_i142.GetRejectReasonsUsecase>(() =>
      _i142.GetRejectReasonsUsecase(gh<_i80.ManageWithdrawalsRepository>()));
  gh.factory<_i143.GetUserSeriesUsecase>(
      () => _i143.GetUserSeriesUsecase(gh<_i80.ManageWithdrawalsRepository>()));
  gh.factory<_i144.GetWithdrawnDetailsUsecase>(() =>
      _i144.GetWithdrawnDetailsUsecase(gh<_i80.ManageWithdrawalsRepository>()));
  gh.factory<_i145.SetApproveSeriesUsecase>(() =>
      _i145.SetApproveSeriesUsecase(gh<_i80.ManageWithdrawalsRepository>()));
  gh.factory<_i146.UpdateSeriesUsecase>(
      () => _i146.UpdateSeriesUsecase(gh<_i80.ManageWithdrawalsRepository>()));
  gh.singleton<_i147.AppManagerCubit>(
      () => _i147.AppManagerCubit(gh<_i112.GetVersionUseCase>()));
  gh.factory<_i148.InvoicesTabCubit>(
      () => _i148.InvoicesTabCubit(gh<_i131.GetInvoicesByPrivilegesUsecase>()));
  gh.lazySingleton<_i149.ManageWithdrawalsCubit>(
      () => _i149.ManageWithdrawalsCubit(
            gh<_i143.GetUserSeriesUsecase>(),
            gh<_i146.UpdateSeriesUsecase>(),
            gh<_i32.GetAllUsersUsecase>(),
            gh<_i94.GetWithdrawalsInvoicesUsecase>(),
            gh<_i95.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i145.SetApproveSeriesUsecase>(),
            gh<_i144.GetWithdrawnDetailsUsecase>(),
            gh<_i140.AddRejectReasonsUsecase>(),
            gh<_i142.GetRejectReasonsUsecase>(),
            gh<_i141.EditRejectReasonsUsecase>(),
            gh<_i93.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i150.AgentsDistributorsActionsCubit>(
      () => _i150.AgentsDistributorsActionsCubit(
            gh<_i115.GetAllCitiesUseCase>(),
            gh<_i114.AddAgentUseCase>(),
            gh<_i116.UpdateAgentUseCase>(),
          ));
  gh.factory<_i151.CommunicationListBloc>(() =>
      _i151.CommunicationListBloc(gh<_i86.GetCommunicationListUsecase>()));
  gh.factory<_i152.AddParticipateCommentUsecase>(() =>
      _i152.AddParticipateCommentUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i153.AddParticipateUserUsecase>(() =>
      _i153.AddParticipateUserUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i154.EditParticipateUserUsecase>(() =>
      _i154.EditParticipateUserUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i155.GetInvoiceByIdUsecase>(
      () => _i155.GetInvoiceByIdUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i156.ParticipateClientListUsecase>(() =>
      _i156.ParticipateClientListUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i157.ParticipateCommentListUsecase>(() =>
      _i157.ParticipateCommentListUsecase(
          gh<_i90.ParticipateListRepository>()));
  gh.factory<_i158.ParticipateInvoiceListUsecase>(() =>
      _i158.ParticipateInvoiceListUsecase(
          gh<_i90.ParticipateListRepository>()));
  gh.factory<_i159.ParticipateListUsecase>(
      () => _i159.ParticipateListUsecase(gh<_i90.ParticipateListRepository>()));
  gh.factory<_i160.UsersCubit>(() => _i160.UsersCubit(
        gh<_i32.GetAllUsersUsecase>(),
        gh<_i31.ActionUserUsecase>(),
        gh<_i99.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.factory<_i161.CompanyCubit>(() => _i161.CompanyCubit(
        gh<_i128.GetCommentUsecase>(),
        gh<_i127.AddCommentUsecase>(),
      ));
  gh.factory<_i162.ParticipateListBloc>(() => _i162.ParticipateListBloc(
        gh<_i159.ParticipateListUsecase>(),
        gh<_i153.AddParticipateUserUsecase>(),
        gh<_i154.EditParticipateUserUsecase>(),
        gh<_i156.ParticipateClientListUsecase>(),
        gh<_i158.ParticipateInvoiceListUsecase>(),
        gh<_i155.GetInvoiceByIdUsecase>(),
        gh<_i157.ParticipateCommentListUsecase>(),
        gh<_i152.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i163.AgentsDistributorsProfileBloc>(
      () => _i163.AgentsDistributorsProfileBloc(
            gh<_i135.GetAgentClientListUsecase>(),
            gh<_i134.GetAgentUsecase>(),
            gh<_i138.GetAgentInvoiceListUsecase>(),
            gh<_i155.GetInvoiceByIdUsecase>(),
            gh<_i136.GetAgentCommentsListUsecase>(),
            gh<_i132.AddAgentCommentUsecase>(),
            gh<_i133.DoneTrainingUsecase>(),
            gh<_i119.AddAgentDateUseCase>(),
            gh<_i137.GetAgentDatesListUsecase>(),
          ));
  return getIt;
}

class _$AppModule extends _i164.AppModule {}
