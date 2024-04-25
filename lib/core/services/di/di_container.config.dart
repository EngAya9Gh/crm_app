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
import 'package:logger/logger.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../../api/api.dart' as _i6;
import '../../../features/app/data/data_sources/app_datasource.dart' as _i16;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i52;
import '../../../features/app/domain/repositories/app_repository.dart' as _i51;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i109;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i144;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i29;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i43;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i48;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i47;
import '../../../features/auth/login/domain/use_cases/cache_token_usecase.dart'
    as _i59;
import '../../../features/auth/login/domain/use_cases/get_token_usecase.dart'
    as _i60;
import '../../../features/auth/login/domain/use_cases/login_usecase.dart'
    as _i61;
import '../../../features/auth/login/domain/use_cases/validate_token_usecase.dart'
    as _i62;
import '../../../features/auth/login/domain/use_cases/verify_otp_usecase.dart'
    as _i63;
import '../../../features/auth/login/presentation/manager/login_cubit/login_cubit.dart'
    as _i117;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i14;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i26;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i25;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i36;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i37;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i38;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i40;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i39;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i41;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i110;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i45;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i42;
import '../../../features/clients_care/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i18;
import '../../../features/clients_care/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i75;
import '../../../features/clients_care/communication_list/domain/repositories/communication_list_repository.dart'
    as _i74;
import '../../../features/clients_care/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i84;
import '../../../features/clients_care/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i148;
import '../../../features/common/client_profile/invoices_tab/data/data_sources/incoives_tab_datasource.dart'
    as _i46;
import '../../../features/common/client_profile/invoices_tab/data/repositories/invoices_tab_repo_impl.dart'
    as _i83;
import '../../../features/common/client_profile/invoices_tab/domain/repositories/invoices_tab_repo.dart'
    as _i82;
import '../../../features/common/client_profile/invoices_tab/domain/use_cases/get_invoices_by_privileges_usecase.dart'
    as _i127;
import '../../../features/common/client_profile/invoices_tab/presentation/manager/invoices_tab_cubit/invoices_tab_cubit.dart'
    as _i145;
import '../../../features/common/client_profile/support_tab/data/data_sources/support_tab_datasource.dart'
    as _i35;
import '../../../features/common/client_profile/support_tab/data/repositories/support_tab_repo_impl.dart'
    as _i56;
import '../../../features/common/client_profile/support_tab/domain/repositories/support_tab_repo.dart'
    as _i55;
import '../../../features/common/client_profile/support_tab/domain/use_cases/add_date_install_usecase.dart'
    as _i70;
import '../../../features/common/client_profile/support_tab/domain/use_cases/get_invoice_by_client_usecase.dart'
    as _i71;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_date_done_usecase.dart'
    as _i72;
import '../../../features/common/client_profile/support_tab/domain/use_cases/set_ready_install_usecase.dart'
    as _i73;
import '../../../features/common/client_profile/support_tab/presentation/manager/support_tab_cubit/support_tab_cubit.dart'
    as _i114;
import '../../../features/mangement/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i19;
import '../../../features/mangement/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i50;
import '../../../features/mangement/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i49;
import '../../../features/mangement/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i118;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i119;
import '../../../features/mangement/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i120;
import '../../../features/mangement/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i121;
import '../../../features/mangement/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i126;
import '../../../features/mangement/manage_users/data/data_sources/users_datasource.dart'
    as _i20;
import '../../../features/mangement/manage_users/data/repositories/users_repository_impl.dart'
    as _i28;
import '../../../features/mangement/manage_users/domain/repositories/users_repository.dart'
    as _i27;
import '../../../features/mangement/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i30;
import '../../../features/mangement/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i31;
import '../../../features/mangement/manage_users/presentation/manager/users_cubit.dart'
    as _i157;
import '../../../features/mangement/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i15;
import '../../../features/mangement/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i79;
import '../../../features/mangement/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i78;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i137;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i138;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i91;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i139;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i140;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i93;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i92;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i141;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i142;
import '../../../features/mangement/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i143;
import '../../../features/mangement/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i146;
import '../../../features/sales/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i21;
import '../../../features/sales/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i67;
import '../../../features/sales/clients_list/domain/repositories/clients_list_repository.dart'
    as _i66;
import '../../../features/sales/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i98;
import '../../../features/sales/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i99;
import '../../../features/sales/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i100;
import '../../../features/sales/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i85;
import '../../../features/sales/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i101;
import '../../../features/sales/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i102;
import '../../../features/sales/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i86;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i103;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i104;
import '../../../features/sales/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i105;
import '../../../features/sales/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i106;
import '../../../features/sales/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i107;
import '../../../features/sales/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i108;
import '../../../features/sales/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i136;
import '../../../features/sales/company/data/data_sources/company_datasource.dart'
    as _i22;
import '../../../features/sales/company/data/repositories/com_repo_impl.dart'
    as _i65;
import '../../../features/sales/company/domain/repositories/comment_repo.dart'
    as _i64;
import '../../../features/sales/company/domain/use_cases/addcomment_usecase.dart'
    as _i123;
import '../../../features/sales/company/domain/use_cases/getcomment_usecase.dart'
    as _i124;
import '../../../features/sales/company/presentation/manager/company_cubit.dart'
    as _i158;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i13;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i34;
import '../../../features/sales/public_relations/agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i44;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i54;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i69;
import '../../../features/sales/public_relations/agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i81;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i53;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i68;
import '../../../features/sales/public_relations/agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i80;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i128;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i116;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i111;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i129;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i130;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i131;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i132;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i133;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i134;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i90;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i112;
import '../../../features/sales/public_relations/agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i113;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i147;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i160;
import '../../../features/sales/public_relations/agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i125;
import '../../../features/sales/public_relations/links/data/data_sources/link_datasource.dart'
    as _i23;
import '../../../features/sales/public_relations/links/data/repositories/link_repo_impl.dart'
    as _i58;
import '../../../features/sales/public_relations/links/domain/repositories/links_repo.dart'
    as _i57;
import '../../../features/sales/public_relations/links/domain/use_cases/action_link_usercase.dart'
    as _i76;
import '../../../features/sales/public_relations/links/domain/use_cases/get_link_usecase.dart'
    as _i77;
import '../../../features/sales/public_relations/links/presentation/manager/link_cubit.dart'
    as _i87;
import '../../../features/sales/public_relations/participates/data/data_sources/participates_list_datasource.dart'
    as _i24;
import '../../../features/sales/public_relations/participates/data/repositories/participate_list_repository_impl.dart'
    as _i89;
import '../../../features/sales/public_relations/participates/domain/repositories/participate_list_repository.dart'
    as _i88;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i149;
import '../../../features/sales/public_relations/participates/domain/use_cases/add_participate_usecase.dart'
    as _i150;
import '../../../features/sales/public_relations/participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i151;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i152;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i153;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i154;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i155;
import '../../../features/sales/public_relations/participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i156;
import '../../../features/sales/public_relations/participates/presentation/manager/participate_list_bloc.dart'
    as _i159;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i17;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i33;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i32;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i94;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i95;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i96;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i97;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i115;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i122;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i135;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i10;
import '../cache_services/prefs_consumer.dart' as _i12;
import '../cache_services/secure_storage_consumer.dart' as _i11;
import 'di_container.dart' as _i161;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final appModule = _$AppModule();
  await gh.singletonAsync<_i3.SharedPreferences>(
    () => appModule.sharedPreferences,
    preResolve: true,
  );
  gh.singleton<_i4.FlutterSecureStorage>(() => appModule.secureStorage);
  gh.singleton<_i5.Logger>(() => appModule.logger);
  gh.lazySingleton<_i6.Api>(() => _i6.Api());
  gh.lazySingleton<_i7.Dio>(() => appModule.dio);
  gh.lazySingleton<_i8.ApiServices>(() => _i9.DioServices(gh<_i7.Dio>()));
  gh.lazySingleton<_i10.CacheServices>(
    () => _i11.SecureStorageConsumer(gh<_i4.FlutterSecureStorage>()),
    instanceName: 'SecureStorageConsumer',
  );
  gh.lazySingleton<_i10.CacheServices>(
      () => _i12.PrefsConsumer(gh<_i3.SharedPreferences>()));
  gh.lazySingleton<_i13.AgentsDistributorsActionsDataSource>(() =>
      _i13.AgentsDistributorsActionsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i14.TicketsDataSource>(
      () => _i14.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i15.ManageWithdrawalsDatasource>(
      () => _i15.ManageWithdrawalsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i16.AppDatasource>(
      () => _i16.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i17.TaskDatasource>(
      () => _i17.TaskDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i18.CommunicationListDatasource>(
      () => _i18.CommunicationListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i19.PrivilegeDatasource>(
      () => _i19.PrivilegeDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i20.UsersDatasource>(
      () => _i20.UsersDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i21.ClientsListDatasource>(
      () => _i21.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i22.CommentCompanyDatasource>(
      () => _i22.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i23.LinkDatasource>(
      () => _i23.LinkDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i24.ParticipatesListDatasource>(
      () => _i24.ParticipatesListDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i25.TicketsRepo>(
      () => _i26.TicketsRepoImpl(gh<_i14.TicketsDataSource>()));
  gh.factory<_i27.UsersRepository>(
      () => _i28.UsersRepositoryImpl(gh<_i20.UsersDatasource>()));
  gh.lazySingleton<_i29.LoginLocalDataSource>(() =>
      _i29.LoginLocalDataSourceImpl(
          gh<_i10.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i30.ActionUserUsecase>(
      () => _i30.ActionUserUsecase(gh<_i27.UsersRepository>()));
  gh.factory<_i31.GetAllUsersUsecase>(
      () => _i31.GetAllUsersUsecase(gh<_i27.UsersRepository>()));
  gh.factory<_i32.TaskRepository>(
      () => _i33.TaskRepositoryImpl(gh<_i17.TaskDatasource>()));
  gh.lazySingleton<_i34.AgentsDistributorsDataSource>(
      () => _i34.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i35.SupportTabDataSource>(
      () => _i35.SupportTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i36.AddTicketUseCase>(
      () => _i36.AddTicketUseCase(gh<_i25.TicketsRepo>()));
  gh.lazySingleton<_i37.EditTicketTypeUseCase>(
      () => _i37.EditTicketTypeUseCase(gh<_i25.TicketsRepo>()));
  gh.lazySingleton<_i38.GetClientTicketsUseCase>(
      () => _i38.GetClientTicketsUseCase(gh<_i25.TicketsRepo>()));
  gh.lazySingleton<_i39.GetTicketsUseCase>(
      () => _i39.GetTicketsUseCase(gh<_i25.TicketsRepo>()));
  gh.lazySingleton<_i40.GetTicketByIdUseCase>(
      () => _i40.GetTicketByIdUseCase(gh<_i25.TicketsRepo>()));
  gh.lazySingleton<_i41.TransferTicketUseCase>(
      () => _i41.TransferTicketUseCase(gh<_i25.TicketsRepo>()));
  gh.factory<_i42.TicketsCubit>(() => _i42.TicketsCubit(
        gh<_i39.GetTicketsUseCase>(),
        gh<_i40.GetTicketByIdUseCase>(),
        gh<_i38.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i43.LoginRemoteDataSource>(
      () => _i43.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i44.AgentsDistributorsProfileDataSource>(() =>
      _i44.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i45.EditTicketCubit>(() => _i45.EditTicketCubit(
        gh<_i37.EditTicketTypeUseCase>(),
        gh<_i41.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i46.InvoicesTabDataSource>(
      () => _i46.InvoicesTabDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i47.LoginRepo>(() => _i48.LoginRepoImpl(
        gh<_i43.LoginRemoteDataSource>(),
        gh<_i29.LoginLocalDataSource>(),
      ));
  gh.factory<_i49.PrivilegeRepository>(
      () => _i50.PrivilegeRepositoryImpl(gh<_i19.PrivilegeDatasource>()));
  gh.factory<_i51.AppRepository>(
      () => _i52.AppRepositoryImpl(gh<_i16.AppDatasource>()));
  gh.lazySingleton<_i53.AgentsDistributorsActionsRepo>(() =>
      _i54.AgentsDistributorsActionsRepoImpl(
          gh<_i13.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i55.SupportTabRepo>(
      () => _i56.SupportTabRepoImpl(gh<_i35.SupportTabDataSource>()));
  gh.factory<_i57.LinksImportantRepository>(
      () => _i58.LinkRepositoryImpl(gh<_i23.LinkDatasource>()));
  gh.lazySingleton<_i59.CacheTokenUsecase>(
      () => _i59.CacheTokenUsecase(gh<_i47.LoginRepo>()));
  gh.lazySingleton<_i60.GetTokenUsecase>(
      () => _i60.GetTokenUsecase(gh<_i47.LoginRepo>()));
  gh.lazySingleton<_i61.LoginUsecase>(
      () => _i61.LoginUsecase(gh<_i47.LoginRepo>()));
  gh.lazySingleton<_i62.ValidateTokenUsecase>(
      () => _i62.ValidateTokenUsecase(gh<_i47.LoginRepo>()));
  gh.lazySingleton<_i63.VerifyOtpUsecase>(
      () => _i63.VerifyOtpUsecase(gh<_i47.LoginRepo>()));
  gh.factory<_i64.CompanyRepository>(
      () => _i65.CompanyRepositoryImpl(gh<_i22.CommentCompanyDatasource>()));
  gh.factory<_i66.ClientsListRepository>(
      () => _i67.ClientsListRepositoryImpl(gh<_i21.ClientsListDatasource>()));
  gh.lazySingleton<_i68.AgentsDistributorsProfileRepo>(() =>
      _i69.AgentsDistributorsProfileRepoImpl(
          gh<_i44.AgentsDistributorsProfileDataSource>()));
  gh.lazySingleton<_i70.AddDateInstallUsecase>(
      () => _i70.AddDateInstallUsecase(gh<_i55.SupportTabRepo>()));
  gh.lazySingleton<_i71.GetInvoiceByClientUsecase>(
      () => _i71.GetInvoiceByClientUsecase(gh<_i55.SupportTabRepo>()));
  gh.lazySingleton<_i72.SetDateDoneUsecase>(
      () => _i72.SetDateDoneUsecase(gh<_i55.SupportTabRepo>()));
  gh.lazySingleton<_i73.SetReadyInstallUsecase>(
      () => _i73.SetReadyInstallUsecase(gh<_i55.SupportTabRepo>()));
  gh.factory<_i74.CommunicationListRepository>(() =>
      _i75.CommunicationListRepositoryImpl(
          gh<_i18.CommunicationListDatasource>()));
  gh.factory<_i76.ActionLinkUsecase>(
      () => _i76.ActionLinkUsecase(gh<_i57.LinksImportantRepository>()));
  gh.factory<_i77.GetLinkUsecase>(
      () => _i77.GetLinkUsecase(gh<_i57.LinksImportantRepository>()));
  gh.lazySingleton<_i78.ManageWithdrawalsRepository>(() =>
      _i79.ManageWithdrawalsRepositoryImpl(
          gh<_i15.ManageWithdrawalsDatasource>()));
  gh.lazySingleton<_i80.AgentsDistributorsRepo>(() =>
      _i81.AgentsDistributorsRepoImpl(gh<_i34.AgentsDistributorsDataSource>()));
  gh.lazySingleton<_i82.InvoicesTabRepo>(
      () => _i83.InvoicesTabRepoImpl(gh<_i46.InvoicesTabDataSource>()));
  gh.factory<_i84.GetCommunicationListUsecase>(() =>
      _i84.GetCommunicationListUsecase(gh<_i74.CommunicationListRepository>()));
  gh.lazySingleton<_i85.CrudClientSupportFilesUsecase>(() =>
      _i85.CrudClientSupportFilesUsecase(
          repository: gh<_i66.ClientsListRepository>()));
  gh.lazySingleton<_i86.GetClientSupportFilesUsecase>(() =>
      _i86.GetClientSupportFilesUsecase(
          repository: gh<_i66.ClientsListRepository>()));
  gh.factory<_i87.LinkCubit>(() => _i87.LinkCubit(
        gh<_i77.GetLinkUsecase>(),
        gh<_i76.ActionLinkUsecase>(),
      ));
  gh.factory<_i88.ParticipateListRepository>(() =>
      _i89.ParticipateListRepositoryImpl(
          gh<_i24.ParticipatesListDatasource>()));
  gh.lazySingleton<_i90.GetAgentsAndDistributorsUseCase>(() =>
      _i90.GetAgentsAndDistributorsUseCase(gh<_i80.AgentsDistributorsRepo>()));
  gh.lazySingleton<_i91.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i91.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i78.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i92.GetWithdrawalsInvoicesUsecase>(() =>
      _i92.GetWithdrawalsInvoicesUsecase(
          gh<_i78.ManageWithdrawalsRepository>()));
  gh.factory<_i93.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i93.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i78.ManageWithdrawalsRepository>()));
  gh.factory<_i94.AddTaskUsecase>(
      () => _i94.AddTaskUsecase(gh<_i32.TaskRepository>()));
  gh.factory<_i95.ChangeStatusTaskUsecase>(
      () => _i95.ChangeStatusTaskUsecase(gh<_i32.TaskRepository>()));
  gh.factory<_i96.FilterTaskUsecase>(
      () => _i96.FilterTaskUsecase(gh<_i32.TaskRepository>()));
  gh.factory<_i97.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i97.GetUsersByDepartmentAndRegionUsecase(gh<_i32.TaskRepository>()));
  gh.factory<_i98.AddClientUserUsecase>(
      () => _i98.AddClientUserUsecase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i99.ApproveRejectClientUsecase>(
      () => _i99.ApproveRejectClientUsecase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i100.ChangeTypeClientUsecase>(
      () => _i100.ChangeTypeClientUsecase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i101.EditClientUserUsecase>(
      () => _i101.EditClientUserUsecase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i102.GetAllClientsListUseCase>(
      () => _i102.GetAllClientsListUseCase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i103.GetClientsListByRegionUseCase>(() =>
      _i103.GetClientsListByRegionUseCase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i104.GetClientsListByUserUseCase>(() =>
      _i104.GetClientsListByUserUseCase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i105.GetClientsWithFilterUserUsecase>(() =>
      _i105.GetClientsWithFilterUserUsecase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i106.GetRecommendedClientsUsecase>(() =>
      _i106.GetRecommendedClientsUsecase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i107.GetSimilarClientsUsecase>(
      () => _i107.GetSimilarClientsUsecase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i108.TransferClientUserUsecase>(
      () => _i108.TransferClientUserUsecase(gh<_i66.ClientsListRepository>()));
  gh.factory<_i109.GetVersionUseCase>(
      () => _i109.GetVersionUseCase(gh<_i51.AppRepository>()));
  gh.factory<_i110.AddTicketCubit>(
      () => _i110.AddTicketCubit(gh<_i36.AddTicketUseCase>()));
  gh.lazySingleton<_i111.AddAgentUseCase>(
      () => _i111.AddAgentUseCase(gh<_i53.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i112.GetAllCitiesUseCase>(() =>
      _i112.GetAllCitiesUseCase(gh<_i53.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i113.UpdateAgentUseCase>(
      () => _i113.UpdateAgentUseCase(gh<_i53.AgentsDistributorsActionsRepo>()));
  gh.factory<_i114.SupportTabCubit>(() => _i114.SupportTabCubit(
        gh<_i71.GetInvoiceByClientUsecase>(),
        gh<_i70.AddDateInstallUsecase>(),
        gh<_i72.SetDateDoneUsecase>(),
        gh<_i73.SetReadyInstallUsecase>(),
      ));
  gh.lazySingleton<_i115.TaskCubit>(() => _i115.TaskCubit(
        gh<_i94.AddTaskUsecase>(),
        gh<_i96.FilterTaskUsecase>(),
        gh<_i95.ChangeStatusTaskUsecase>(),
      ));
  gh.lazySingleton<_i116.AddAgentDateUseCase>(() =>
      _i116.AddAgentDateUseCase(gh<_i68.AgentsDistributorsProfileRepo>()));
  gh.factory<_i117.LoginCubit>(() => _i117.LoginCubit(
        gh<_i61.LoginUsecase>(),
        gh<_i63.VerifyOtpUsecase>(),
        gh<_i59.CacheTokenUsecase>(),
        gh<_i60.GetTokenUsecase>(),
        gh<_i62.ValidateTokenUsecase>(),
      ));
  gh.factory<_i118.AddLevelUsecase>(
      () => _i118.AddLevelUsecase(gh<_i49.PrivilegeRepository>()));
  gh.factory<_i119.GetLevelsUsecase>(
      () => _i119.GetLevelsUsecase(gh<_i49.PrivilegeRepository>()));
  gh.factory<_i120.GetPrivilegesUsecase>(
      () => _i120.GetPrivilegesUsecase(gh<_i49.PrivilegeRepository>()));
  gh.factory<_i121.UpdatePrivilegeUsecase>(
      () => _i121.UpdatePrivilegeUsecase(gh<_i49.PrivilegeRepository>()));
  gh.factory<_i122.AttachmentsRowCubit>(() => _i122.AttachmentsRowCubit(
        gh<_i86.GetClientSupportFilesUsecase>(),
        gh<_i85.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i123.AddCommentUsecase>(
      () => _i123.AddCommentUsecase(gh<_i64.CompanyRepository>()));
  gh.factory<_i124.GetCommentUsecase>(
      () => _i124.GetCommentUsecase(gh<_i64.CompanyRepository>()));
  gh.factory<_i125.AgentsDistributorsCubit>(() => _i125.AgentsDistributorsCubit(
      gh<_i90.GetAgentsAndDistributorsUseCase>()));
  gh.lazySingleton<_i126.PrivilegeCubit>(() => _i126.PrivilegeCubit(
        gh<_i119.GetLevelsUsecase>(),
        gh<_i120.GetPrivilegesUsecase>(),
        gh<_i121.UpdatePrivilegeUsecase>(),
        gh<_i118.AddLevelUsecase>(),
      ));
  gh.lazySingleton<_i127.GetInvoicesByPrivilegesUsecase>(
      () => _i127.GetInvoicesByPrivilegesUsecase(gh<_i82.InvoicesTabRepo>()));
  gh.lazySingleton<_i128.AddAgentCommentUsecase>(() =>
      _i128.AddAgentCommentUsecase(gh<_i68.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i129.DoneTrainingUsecase>(() =>
      _i129.DoneTrainingUsecase(gh<_i68.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i130.GetAgentUsecase>(
      () => _i130.GetAgentUsecase(gh<_i68.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i131.GetAgentClientListUsecase>(() =>
      _i131.GetAgentClientListUsecase(
          gh<_i68.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i132.GetAgentCommentsListUsecase>(() =>
      _i132.GetAgentCommentsListUsecase(
          gh<_i68.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i133.GetAgentDatesListUsecase>(() =>
      _i133.GetAgentDatesListUsecase(gh<_i68.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i134.GetAgentInvoiceListUsecase>(() =>
      _i134.GetAgentInvoiceListUsecase(
          gh<_i68.AgentsDistributorsProfileRepo>()));
  gh.singleton<_i135.CitiesCubit>(
      () => _i135.CitiesCubit(gh<_i112.GetAllCitiesUseCase>()));
  gh.factory<_i136.ClientsListBloc>(() => _i136.ClientsListBloc(
        gh<_i105.GetClientsWithFilterUserUsecase>(),
        gh<_i106.GetRecommendedClientsUsecase>(),
        gh<_i98.AddClientUserUsecase>(),
        gh<_i101.EditClientUserUsecase>(),
        gh<_i100.ChangeTypeClientUsecase>(),
        gh<_i107.GetSimilarClientsUsecase>(),
        gh<_i99.ApproveRejectClientUsecase>(),
        gh<_i85.CrudClientSupportFilesUsecase>(),
        gh<_i86.GetClientSupportFilesUsecase>(),
        gh<_i108.TransferClientUserUsecase>(),
      ));
  gh.factory<_i137.AddRejectReasonsUsecase>(() =>
      _i137.AddRejectReasonsUsecase(gh<_i78.ManageWithdrawalsRepository>()));
  gh.factory<_i138.EditRejectReasonsUsecase>(() =>
      _i138.EditRejectReasonsUsecase(gh<_i78.ManageWithdrawalsRepository>()));
  gh.factory<_i139.GetRejectReasonsUsecase>(() =>
      _i139.GetRejectReasonsUsecase(gh<_i78.ManageWithdrawalsRepository>()));
  gh.factory<_i140.GetUserSeriesUsecase>(
      () => _i140.GetUserSeriesUsecase(gh<_i78.ManageWithdrawalsRepository>()));
  gh.factory<_i141.GetWithdrawnDetailsUsecase>(() =>
      _i141.GetWithdrawnDetailsUsecase(gh<_i78.ManageWithdrawalsRepository>()));
  gh.factory<_i142.SetApproveSeriesUsecase>(() =>
      _i142.SetApproveSeriesUsecase(gh<_i78.ManageWithdrawalsRepository>()));
  gh.factory<_i143.UpdateSeriesUsecase>(
      () => _i143.UpdateSeriesUsecase(gh<_i78.ManageWithdrawalsRepository>()));
  gh.singleton<_i144.AppManagerCubit>(
      () => _i144.AppManagerCubit(gh<_i109.GetVersionUseCase>()));
  gh.factory<_i145.InvoicesTabCubit>(
      () => _i145.InvoicesTabCubit(gh<_i127.GetInvoicesByPrivilegesUsecase>()));
  gh.lazySingleton<_i146.ManageWithdrawalsCubit>(
      () => _i146.ManageWithdrawalsCubit(
            gh<_i140.GetUserSeriesUsecase>(),
            gh<_i143.UpdateSeriesUsecase>(),
            gh<_i31.GetAllUsersUsecase>(),
            gh<_i92.GetWithdrawalsInvoicesUsecase>(),
            gh<_i93.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i142.SetApproveSeriesUsecase>(),
            gh<_i141.GetWithdrawnDetailsUsecase>(),
            gh<_i137.AddRejectReasonsUsecase>(),
            gh<_i139.GetRejectReasonsUsecase>(),
            gh<_i138.EditRejectReasonsUsecase>(),
            gh<_i91.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i147.AgentsDistributorsActionsCubit>(
      () => _i147.AgentsDistributorsActionsCubit(
            gh<_i112.GetAllCitiesUseCase>(),
            gh<_i111.AddAgentUseCase>(),
            gh<_i113.UpdateAgentUseCase>(),
          ));
  gh.factory<_i148.CommunicationListBloc>(() =>
      _i148.CommunicationListBloc(gh<_i84.GetCommunicationListUsecase>()));
  gh.factory<_i149.AddParticipateCommentUsecase>(() =>
      _i149.AddParticipateCommentUsecase(gh<_i88.ParticipateListRepository>()));
  gh.factory<_i150.AddParticipateUserUsecase>(() =>
      _i150.AddParticipateUserUsecase(gh<_i88.ParticipateListRepository>()));
  gh.factory<_i151.EditParticipateUserUsecase>(() =>
      _i151.EditParticipateUserUsecase(gh<_i88.ParticipateListRepository>()));
  gh.factory<_i152.GetInvoiceByIdUsecase>(
      () => _i152.GetInvoiceByIdUsecase(gh<_i88.ParticipateListRepository>()));
  gh.factory<_i153.ParticipateClientListUsecase>(() =>
      _i153.ParticipateClientListUsecase(gh<_i88.ParticipateListRepository>()));
  gh.factory<_i154.ParticipateCommentListUsecase>(() =>
      _i154.ParticipateCommentListUsecase(
          gh<_i88.ParticipateListRepository>()));
  gh.factory<_i155.ParticipateInvoiceListUsecase>(() =>
      _i155.ParticipateInvoiceListUsecase(
          gh<_i88.ParticipateListRepository>()));
  gh.factory<_i156.ParticipateListUsecase>(
      () => _i156.ParticipateListUsecase(gh<_i88.ParticipateListRepository>()));
  gh.factory<_i157.UsersCubit>(() => _i157.UsersCubit(
        gh<_i31.GetAllUsersUsecase>(),
        gh<_i30.ActionUserUsecase>(),
        gh<_i97.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.factory<_i158.CompanyCubit>(() => _i158.CompanyCubit(
        gh<_i124.GetCommentUsecase>(),
        gh<_i123.AddCommentUsecase>(),
      ));
  gh.factory<_i159.ParticipateListBloc>(() => _i159.ParticipateListBloc(
        gh<_i156.ParticipateListUsecase>(),
        gh<_i150.AddParticipateUserUsecase>(),
        gh<_i151.EditParticipateUserUsecase>(),
        gh<_i153.ParticipateClientListUsecase>(),
        gh<_i155.ParticipateInvoiceListUsecase>(),
        gh<_i152.GetInvoiceByIdUsecase>(),
        gh<_i154.ParticipateCommentListUsecase>(),
        gh<_i149.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i160.AgentsDistributorsProfileBloc>(
      () => _i160.AgentsDistributorsProfileBloc(
            gh<_i131.GetAgentClientListUsecase>(),
            gh<_i130.GetAgentUsecase>(),
            gh<_i134.GetAgentInvoiceListUsecase>(),
            gh<_i152.GetInvoiceByIdUsecase>(),
            gh<_i132.GetAgentCommentsListUsecase>(),
            gh<_i128.AddAgentCommentUsecase>(),
            gh<_i129.DoneTrainingUsecase>(),
            gh<_i116.AddAgentDateUseCase>(),
            gh<_i133.GetAgentDatesListUsecase>(),
          ));
  return getIt;
}

class _$AppModule extends _i161.AppModule {}
