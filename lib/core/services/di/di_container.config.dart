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
import '../../../features/app/data/data_sources/app_datasource.dart' as _i21;
import '../../../features/app/data/repositories/app_repository_impl.dart'
    as _i82;
import '../../../features/app/domain/repositories/app_repository.dart' as _i81;
import '../../../features/app/domain/use_cases/get_version_usecase.dart'
    as _i125;
import '../../../features/app/presentation/bloc/app_manager_cubit.dart'
    as _i142;
import '../../../features/auth/login/data/data_sources/login_local_data_source.dart'
    as _i36;
import '../../../features/auth/login/data/data_sources/login_remote_data_source.dart'
    as _i61;
import '../../../features/auth/login/data/repositories/login_repository_impl.dart'
    as _i70;
import '../../../features/auth/login/domain/repositories/login_repository.dart'
    as _i69;
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
    as _i132;
import '../../../features/clients_care/clients_tickets/data/data_sources/tickets_data_source.dart'
    as _i19;
import '../../../features/clients_care/clients_tickets/data/repositories/tickets_repo_impl.dart'
    as _i35;
import '../../../features/clients_care/clients_tickets/domain/repositories/tickets_repo.dart'
    as _i34;
import '../../../features/clients_care/clients_tickets/domain/use_cases/add_ticket_usecase.dart'
    as _i54;
import '../../../features/clients_care/clients_tickets/domain/use_cases/edit_ticket_type_usecase.dart'
    as _i55;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_client_ticket_usecase.dart'
    as _i56;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_ticket_by_id_usecase.dart'
    as _i58;
import '../../../features/clients_care/clients_tickets/domain/use_cases/get_tickets_usecase.dart'
    as _i57;
import '../../../features/clients_care/clients_tickets/domain/use_cases/transfer_ticket_usecase.dart'
    as _i59;
import '../../../features/clients_care/clients_tickets/presentation/manager/add_ticket_cubit/add_ticket_cubit.dart'
    as _i126;
import '../../../features/clients_care/clients_tickets/presentation/manager/edit_ticket_cubit/edit_ticket_cubit.dart'
    as _i68;
import '../../../features/clients_care/clients_tickets/presentation/manager/tickets_cubit/tickets_cubit.dart'
    as _i60;
import '../../../features/clients_list/data/data_sources/clients_list_datasource.dart'
    as _i22;
import '../../../features/clients_list/data/repositories/client_list_repository_impl.dart'
    as _i53;
import '../../../features/clients_list/domain/repositories/clients_list_repository.dart'
    as _i52;
import '../../../features/clients_list/domain/use_cases/add_client_usecase.dart'
    as _i84;
import '../../../features/clients_list/domain/use_cases/approve_reject_client_usecase.dart'
    as _i85;
import '../../../features/clients_list/domain/use_cases/change_type_client_usecase.dart'
    as _i86;
import '../../../features/clients_list/domain/use_cases/crud_client_support_files_usecase.dart'
    as _i115;
import '../../../features/clients_list/domain/use_cases/edit_client_usecase.dart'
    as _i87;
import '../../../features/clients_list/domain/use_cases/get_all_clients_list_usecase.dart'
    as _i88;
import '../../../features/clients_list/domain/use_cases/get_client_support_files_usecase.dart'
    as _i116;
import '../../../features/clients_list/domain/use_cases/get_clients_by_region_usecase.dart'
    as _i89;
import '../../../features/clients_list/domain/use_cases/get_clients_by_user_usecase.dart'
    as _i90;
import '../../../features/clients_list/domain/use_cases/get_clients_with_filter_usecase.dart'
    as _i91;
import '../../../features/clients_list/domain/use_cases/get_recommended_cleints_usecase.dart'
    as _i92;
import '../../../features/clients_list/domain/use_cases/get_similar_cleints_usecase.dart'
    as _i93;
import '../../../features/clients_list/domain/use_cases/transfer_client_usecase.dart'
    as _i94;
import '../../../features/clients_list/presentation/manager/clients_list_bloc.dart'
    as _i146;
import '../../../features/communication_list/data/data_sources/communication_list_datasource.dart'
    as _i23;
import '../../../features/communication_list/data/repositories/communication_list_repository_impl.dart'
    as _i110;
import '../../../features/communication_list/domain/repositories/communication_list_repository.dart'
    as _i109;
import '../../../features/communication_list/domain/use_cases/get_communication_list_usecase.dart'
    as _i135;
import '../../../features/communication_list/presentation/manager/communication_list_bloc.dart'
    as _i145;
import '../../../features/company/data/data_sources/company_datasource.dart'
    as _i24;
import '../../../features/company/data/repositories/com_repo_impl.dart' as _i79;
import '../../../features/company/domain/repositories/comment_repo.dart'
    as _i78;
import '../../../features/company/domain/use_cases/addcomment_usecase.dart'
    as _i130;
import '../../../features/company/domain/use_cases/getcomment_usecase.dart'
    as _i131;
import '../../../features/company/presentation/manager/company_cubit.dart'
    as _i141;
import '../../../features/links/data/data_sources/link_datasource.dart' as _i25;
import '../../../features/links/data/repositories/link_repo_impl.dart' as _i67;
import '../../../features/links/domain/repositories/links_repo.dart' as _i66;
import '../../../features/links/domain/use_cases/action_link_usercase.dart'
    as _i128;
import '../../../features/links/domain/use_cases/get_link_usecase.dart'
    as _i129;
import '../../../features/links/presentation/manager/link_cubit.dart' as _i133;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart'
    as _i13;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart'
    as _i30;
import '../../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart'
    as _i33;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart'
    as _i15;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart'
    as _i40;
import '../../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart'
    as _i50;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart'
    as _i14;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart'
    as _i39;
import '../../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart'
    as _i49;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_comments_usecase.dart'
    as _i118;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_date_usecase.dart'
    as _i103;
import '../../../features/manage_agents_and_distributors/domain/use_cases/add_agent_usecase.dart'
    as _i16;
import '../../../features/manage_agents_and_distributors/domain/use_cases/done_training_usecase.dart'
    as _i119;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_byid_usecase.dart'
    as _i120;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart'
    as _i121;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart'
    as _i122;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_dates_list_usecase.dart'
    as _i123;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart'
    as _i124;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart'
    as _i104;
import '../../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart'
    as _i17;
import '../../../features/manage_agents_and_distributors/domain/use_cases/update_agent_usecase.dart'
    as _i18;
import '../../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart'
    as _i83;
import '../../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart'
    as _i134;
import '../../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart'
    as _i140;
import '../../../features/manage_participates/data/data_sources/participates_list_datasource.dart'
    as _i26;
import '../../../features/manage_participates/data/repositories/participate_list_repository_impl.dart'
    as _i32;
import '../../../features/manage_participates/domain/repositories/participate_list_repository.dart'
    as _i31;
import '../../../features/manage_participates/domain/use_cases/add_participate_comment_usecase.dart'
    as _i41;
import '../../../features/manage_participates/domain/use_cases/add_participate_usecase.dart'
    as _i42;
import '../../../features/manage_participates/domain/use_cases/edit_paraticipate_usecase.dart'
    as _i43;
import '../../../features/manage_participates/domain/use_cases/get_invoice_by_id_usecase.dart'
    as _i44;
import '../../../features/manage_participates/domain/use_cases/get_participate_client_list_usecase.dart'
    as _i45;
import '../../../features/manage_participates/domain/use_cases/get_participate_comment_list_usecase.dart'
    as _i46;
import '../../../features/manage_participates/domain/use_cases/get_participate_Invoice_list_usecase.dart'
    as _i47;
import '../../../features/manage_participates/domain/use_cases/get_participate_list_usecase.dart'
    as _i48;
import '../../../features/manage_participates/presentation/manager/participate_list_bloc.dart'
    as _i80;
import '../../../features/manage_privilege/data/data_sources/privilege_datasource.dart'
    as _i27;
import '../../../features/manage_privilege/data/repositories/privilege_repository_impl.dart'
    as _i106;
import '../../../features/manage_privilege/domain/repositories/privilege_repository.dart'
    as _i105;
import '../../../features/manage_privilege/domain/use_cases/add_level_usecase.dart'
    as _i136;
import '../../../features/manage_privilege/domain/use_cases/get_levels_usecase.dart'
    as _i137;
import '../../../features/manage_privilege/domain/use_cases/get_privilege_usecase.dart'
    as _i138;
import '../../../features/manage_privilege/domain/use_cases/update_privilege_usecase.dart'
    as _i139;
import '../../../features/manage_privilege/presentation/manager/privilege_cubit.dart'
    as _i147;
import '../../../features/manage_users/data/data_sources/users_datasource.dart'
    as _i28;
import '../../../features/manage_users/data/repositories/users_repository_impl.dart'
    as _i63;
import '../../../features/manage_users/domain/repositories/users_repository.dart'
    as _i62;
import '../../../features/manage_users/domain/use_cases/action_user_usecase.dart'
    as _i107;
import '../../../features/manage_users/domain/use_cases/get_allusers_usecase.dart'
    as _i108;
import '../../../features/manage_users/presentation/manager/users_cubit.dart'
    as _i117;
import '../../../features/manage_withdrawals/data/data_sources/manage_withdrawals_datasource.dart'
    as _i20;
import '../../../features/manage_withdrawals/data/repositories/manage_withdrawals_repository_impl.dart'
    as _i65;
import '../../../features/manage_withdrawals/domain/repositories/manage_withdrawals_repository.dart'
    as _i64;
import '../../../features/manage_withdrawals/domain/use_cases/add_reject_reason_usecase.dart'
    as _i71;
import '../../../features/manage_withdrawals/domain/use_cases/edit_reject_reason_usecase.dart'
    as _i72;
import '../../../features/manage_withdrawals/domain/use_cases/get_filterd_withdrawals_invoices_usecase.dart'
    as _i96;
import '../../../features/manage_withdrawals/domain/use_cases/get_reject_reasons_usecase.dart'
    as _i73;
import '../../../features/manage_withdrawals/domain/use_cases/get_user_series_usecase.dart'
    as _i74;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawal_invoice_details_usecase.dart'
    as _i95;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawals_invoices_usecase.dart'
    as _i97;
import '../../../features/manage_withdrawals/domain/use_cases/get_withdrawn_details_usecase.dart'
    as _i75;
import '../../../features/manage_withdrawals/domain/use_cases/set_approve_series_usecase.dart'
    as _i76;
import '../../../features/manage_withdrawals/domain/use_cases/update_user_series_usecase.dart'
    as _i77;
import '../../../features/manage_withdrawals/presentation/manager/manage_withdrawals_cubit.dart'
    as _i143;
import '../../../features/task_management/data/data_sources/task_datasource.dart'
    as _i29;
import '../../../features/task_management/data/repositories/task_repository_impl.dart'
    as _i38;
import '../../../features/task_management/domain/repositories/task_repository.dart'
    as _i37;
import '../../../features/task_management/domain/use_cases/add_task_usecase.dart'
    as _i111;
import '../../../features/task_management/domain/use_cases/change_status_usecase.dart'
    as _i112;
import '../../../features/task_management/domain/use_cases/filter_tasks_usecase.dart'
    as _i113;
import '../../../features/task_management/domain/use_cases/get_users_by_department_and_region_usecase.dart'
    as _i114;
import '../../../features/task_management/presentation/manager/task_cubit.dart'
    as _i127;
import '../../common/manager/attachments_row_cubit/attachments_row_cubit.dart'
    as _i144;
import '../../common/manager/cities_cubit/cities_cubit.dart' as _i51;
import '../api/api_services.dart' as _i8;
import '../api/dio/dio_services.dart' as _i9;
import '../cache_services/cache_services.dart' as _i10;
import '../cache_services/prefs_consumer.dart' as _i12;
import '../cache_services/secure_storage_consumer.dart' as _i11;
import 'di_container.dart' as _i148;

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
  gh.lazySingleton<_i14.AgentsDistributorsActionsRepo>(() =>
      _i15.AgentsDistributorsActionsRepoImpl(
          gh<_i13.AgentsDistributorsActionsDataSource>()));
  gh.lazySingleton<_i16.AddAgentUseCase>(
      () => _i16.AddAgentUseCase(gh<_i14.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i17.GetAllCitiesUseCase>(
      () => _i17.GetAllCitiesUseCase(gh<_i14.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i18.UpdateAgentUseCase>(
      () => _i18.UpdateAgentUseCase(gh<_i14.AgentsDistributorsActionsRepo>()));
  gh.lazySingleton<_i19.TicketsDataSource>(
      () => _i19.TicketsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i20.ManageWithdrawalsDatasource>(
      () => _i20.ManageWithdrawalsDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i21.AppDatasource>(
      () => _i21.AppDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i22.ClientsListDatasource>(
      () => _i22.ClientsListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i23.CommunicationListDatasource>(
      () => _i23.CommunicationListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i24.CommentCompanyDatasource>(
      () => _i24.CommentCompanyDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i25.LinkDatasource>(
      () => _i25.LinkDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i26.ParticipatesListDatasource>(
      () => _i26.ParticipatesListDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i27.PrivilegeDatasource>(
      () => _i27.PrivilegeDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i28.UsersDatasource>(
      () => _i28.UsersDatasource(gh<_i8.ApiServices>()));
  gh.factory<_i29.TaskDatasource>(
      () => _i29.TaskDatasource(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i30.AgentsDistributorsDataSource>(
      () => _i30.AgentsDistributorsDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i31.ParticipateListRepository>(() =>
      _i32.ParticipateListRepositoryImpl(
          gh<_i26.ParticipatesListDatasource>()));
  gh.lazySingleton<_i33.AgentsDistributorsProfileDataSource>(() =>
      _i33.AgentsDistributorsProfileDataSourceImpl(gh<_i8.ApiServices>()));
  gh.lazySingleton<_i34.TicketsRepo>(
      () => _i35.TicketsRepoImpl(gh<_i19.TicketsDataSource>()));
  gh.lazySingleton<_i36.LoginLocalDataSource>(() =>
      _i36.LoginLocalDataSourceImpl(
          gh<_i10.CacheServices>(instanceName: 'SecureStorageConsumer')));
  gh.factory<_i37.TaskRepository>(
      () => _i38.TaskRepositoryImpl(gh<_i29.TaskDatasource>()));
  gh.lazySingleton<_i39.AgentsDistributorsProfileRepo>(() =>
      _i40.AgentsDistributorsProfileRepoImpl(
          gh<_i33.AgentsDistributorsProfileDataSource>()));
  gh.factory<_i41.AddParticipateCommentUsecase>(() =>
      _i41.AddParticipateCommentUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i42.AddParticipateUserUsecase>(() =>
      _i42.AddParticipateUserUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i43.EditParticipateUserUsecase>(() =>
      _i43.EditParticipateUserUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i44.GetInvoiceByIdUsecase>(
      () => _i44.GetInvoiceByIdUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i45.ParticipateClientListUsecase>(() =>
      _i45.ParticipateClientListUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i46.ParticipateCommentListUsecase>(() =>
      _i46.ParticipateCommentListUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i47.ParticipateInvoiceListUsecase>(() =>
      _i47.ParticipateInvoiceListUsecase(gh<_i31.ParticipateListRepository>()));
  gh.factory<_i48.ParticipateListUsecase>(
      () => _i48.ParticipateListUsecase(gh<_i31.ParticipateListRepository>()));
  gh.lazySingleton<_i49.AgentsDistributorsRepo>(() =>
      _i50.AgentsDistributorsRepoImpl(gh<_i30.AgentsDistributorsDataSource>()));
  gh.singleton<_i51.CitiesCubit>(
      () => _i51.CitiesCubit(gh<_i17.GetAllCitiesUseCase>()));
  gh.factory<_i52.ClientsListRepository>(
      () => _i53.ClientsListRepositoryImpl(gh<_i22.ClientsListDatasource>()));
  gh.lazySingleton<_i54.AddTicketUseCase>(
      () => _i54.AddTicketUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i55.EditTicketTypeUseCase>(
      () => _i55.EditTicketTypeUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i56.GetClientTicketsUseCase>(
      () => _i56.GetClientTicketsUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i57.GetTicketsUseCase>(
      () => _i57.GetTicketsUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i58.GetTicketByIdUseCase>(
      () => _i58.GetTicketByIdUseCase(gh<_i34.TicketsRepo>()));
  gh.lazySingleton<_i59.TransferTicketUseCase>(
      () => _i59.TransferTicketUseCase(gh<_i34.TicketsRepo>()));
  gh.factory<_i60.TicketsCubit>(() => _i60.TicketsCubit(
        gh<_i57.GetTicketsUseCase>(),
        gh<_i58.GetTicketByIdUseCase>(),
        gh<_i56.GetClientTicketsUseCase>(),
      ));
  gh.lazySingleton<_i61.LoginRemoteDataSource>(
      () => _i61.LoginRemoteDataSourceImpl(gh<_i8.ApiServices>()));
  gh.factory<_i62.UsersRepository>(
      () => _i63.UsersRepositoryImpl(gh<_i28.UsersDatasource>()));
  gh.lazySingleton<_i64.ManageWithdrawalsRepository>(() =>
      _i65.ManageWithdrawalsRepositoryImpl(
          gh<_i20.ManageWithdrawalsDatasource>()));
  gh.factory<_i66.LinksImportantRepository>(
      () => _i67.LinkRepositoryImpl(gh<_i25.LinkDatasource>()));
  gh.factory<_i68.EditTicketCubit>(() => _i68.EditTicketCubit(
        gh<_i55.EditTicketTypeUseCase>(),
        gh<_i59.TransferTicketUseCase>(),
      ));
  gh.lazySingleton<_i69.LoginRepo>(() => _i70.LoginRepoImpl(
        gh<_i61.LoginRemoteDataSource>(),
        gh<_i36.LoginLocalDataSource>(),
      ));
  gh.factory<_i71.AddRejectReasonsUsecase>(() =>
      _i71.AddRejectReasonsUsecase(gh<_i64.ManageWithdrawalsRepository>()));
  gh.factory<_i72.EditRejectReasonsUsecase>(() =>
      _i72.EditRejectReasonsUsecase(gh<_i64.ManageWithdrawalsRepository>()));
  gh.factory<_i73.GetRejectReasonsUsecase>(() =>
      _i73.GetRejectReasonsUsecase(gh<_i64.ManageWithdrawalsRepository>()));
  gh.factory<_i74.GetUserSeriesUsecase>(
      () => _i74.GetUserSeriesUsecase(gh<_i64.ManageWithdrawalsRepository>()));
  gh.factory<_i75.GetWithdrawnDetailsUsecase>(() =>
      _i75.GetWithdrawnDetailsUsecase(gh<_i64.ManageWithdrawalsRepository>()));
  gh.factory<_i76.SetApproveSeriesUsecase>(() =>
      _i76.SetApproveSeriesUsecase(gh<_i64.ManageWithdrawalsRepository>()));
  gh.factory<_i77.UpdateSeriesUsecase>(
      () => _i77.UpdateSeriesUsecase(gh<_i64.ManageWithdrawalsRepository>()));
  gh.factory<_i78.CompanyRepository>(
      () => _i79.CompanyRepositoryImpl(gh<_i24.CommentCompanyDatasource>()));
  gh.factory<_i80.ParticipateListBloc>(() => _i80.ParticipateListBloc(
        gh<_i48.ParticipateListUsecase>(),
        gh<_i42.AddParticipateUserUsecase>(),
        gh<_i43.EditParticipateUserUsecase>(),
        gh<_i45.ParticipateClientListUsecase>(),
        gh<_i47.ParticipateInvoiceListUsecase>(),
        gh<_i44.GetInvoiceByIdUsecase>(),
        gh<_i46.ParticipateCommentListUsecase>(),
        gh<_i41.AddParticipateCommentUsecase>(),
      ));
  gh.factory<_i81.AppRepository>(
      () => _i82.AppRepositoryImpl(gh<_i21.AppDatasource>()));
  gh.factory<_i83.AgentsDistributorsActionsCubit>(
      () => _i83.AgentsDistributorsActionsCubit(
            gh<_i17.GetAllCitiesUseCase>(),
            gh<_i16.AddAgentUseCase>(),
            gh<_i18.UpdateAgentUseCase>(),
          ));
  gh.factory<_i84.AddClientUserUsecase>(
      () => _i84.AddClientUserUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i85.ApproveRejectClientUsecase>(
      () => _i85.ApproveRejectClientUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i86.ChangeTypeClientUsecase>(
      () => _i86.ChangeTypeClientUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i87.EditClientUserUsecase>(
      () => _i87.EditClientUserUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i88.GetAllClientsListUseCase>(
      () => _i88.GetAllClientsListUseCase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i89.GetClientsListByRegionUseCase>(() =>
      _i89.GetClientsListByRegionUseCase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i90.GetClientsListByUserUseCase>(
      () => _i90.GetClientsListByUserUseCase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i91.GetClientsWithFilterUserUsecase>(() =>
      _i91.GetClientsWithFilterUserUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i92.GetRecommendedClientsUsecase>(() =>
      _i92.GetRecommendedClientsUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i93.GetSimilarClientsUsecase>(
      () => _i93.GetSimilarClientsUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i94.TransferClientUserUsecase>(
      () => _i94.TransferClientUserUsecase(gh<_i52.ClientsListRepository>()));
  gh.factory<_i95.GetWithdrawalInvoiceDetailsUsecase>(() =>
      _i95.GetWithdrawalInvoiceDetailsUsecase(
          gh<_i64.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i96.GetFilteredWithdrawalsInvoicesUsecase>(() =>
      _i96.GetFilteredWithdrawalsInvoicesUsecase(
          gh<_i64.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i97.GetWithdrawalsInvoicesUsecase>(() =>
      _i97.GetWithdrawalsInvoicesUsecase(
          gh<_i64.ManageWithdrawalsRepository>()));
  gh.lazySingleton<_i98.CacheTokenUsecase>(
      () => _i98.CacheTokenUsecase(gh<_i69.LoginRepo>()));
  gh.lazySingleton<_i99.GetTokenUsecase>(
      () => _i99.GetTokenUsecase(gh<_i69.LoginRepo>()));
  gh.lazySingleton<_i100.LoginUsecase>(
      () => _i100.LoginUsecase(gh<_i69.LoginRepo>()));
  gh.lazySingleton<_i101.ValidateTokenUsecase>(
      () => _i101.ValidateTokenUsecase(gh<_i69.LoginRepo>()));
  gh.lazySingleton<_i102.VerifyOtpUsecase>(
      () => _i102.VerifyOtpUsecase(gh<_i69.LoginRepo>()));
  gh.lazySingleton<_i103.AddAgentDateUseCase>(() =>
      _i103.AddAgentDateUseCase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i104.GetAgentsAndDistributorsUseCase>(() =>
      _i104.GetAgentsAndDistributorsUseCase(gh<_i49.AgentsDistributorsRepo>()));
  gh.factory<_i105.PrivilegeRepository>(
      () => _i106.PrivilegeRepositoryImpl(gh<_i27.PrivilegeDatasource>()));
  gh.factory<_i107.ActionUserUsecase>(
      () => _i107.ActionUserUsecase(gh<_i62.UsersRepository>()));
  gh.factory<_i108.GetAllUsersUsecase>(
      () => _i108.GetAllUsersUsecase(gh<_i62.UsersRepository>()));
  gh.factory<_i109.CommunicationListRepository>(() =>
      _i110.CommunicationListRepositoryImpl(
          gh<_i23.CommunicationListDatasource>()));
  gh.factory<_i111.AddTaskUsecase>(
      () => _i111.AddTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i112.ChangeStatusTaskUsecase>(
      () => _i112.ChangeStatusTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i113.FilterTaskUsecase>(
      () => _i113.FilterTaskUsecase(gh<_i37.TaskRepository>()));
  gh.factory<_i114.GetUsersByDepartmentAndRegionUsecase>(() =>
      _i114.GetUsersByDepartmentAndRegionUsecase(gh<_i37.TaskRepository>()));
  gh.lazySingleton<_i115.CrudClientSupportFilesUsecase>(() =>
      _i115.CrudClientSupportFilesUsecase(
          repository: gh<_i52.ClientsListRepository>()));
  gh.lazySingleton<_i116.GetClientSupportFilesUsecase>(() =>
      _i116.GetClientSupportFilesUsecase(
          repository: gh<_i52.ClientsListRepository>()));
  gh.factory<_i117.UsersCubit>(() => _i117.UsersCubit(
        gh<_i108.GetAllUsersUsecase>(),
        gh<_i107.ActionUserUsecase>(),
        gh<_i114.GetUsersByDepartmentAndRegionUsecase>(),
      ));
  gh.lazySingleton<_i118.AddAgentCommentUsecase>(() =>
      _i118.AddAgentCommentUsecase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i119.DoneTrainingUsecase>(() =>
      _i119.DoneTrainingUsecase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i120.GetAgentUsecase>(
      () => _i120.GetAgentUsecase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i121.GetAgentClientListUsecase>(() =>
      _i121.GetAgentClientListUsecase(
          gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i122.GetAgentCommentsListUsecase>(() =>
      _i122.GetAgentCommentsListUsecase(
          gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i123.GetAgentDatesListUsecase>(() =>
      _i123.GetAgentDatesListUsecase(gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.lazySingleton<_i124.GetAgentInvoiceListUsecase>(() =>
      _i124.GetAgentInvoiceListUsecase(
          gh<_i39.AgentsDistributorsProfileRepo>()));
  gh.factory<_i125.GetVersionUseCase>(
      () => _i125.GetVersionUseCase(gh<_i81.AppRepository>()));
  gh.factory<_i126.AddTicketCubit>(
      () => _i126.AddTicketCubit(gh<_i54.AddTicketUseCase>()));
  gh.lazySingleton<_i127.TaskCubit>(() => _i127.TaskCubit(
        gh<_i111.AddTaskUsecase>(),
        gh<_i113.FilterTaskUsecase>(),
        gh<_i112.ChangeStatusTaskUsecase>(),
      ));
  gh.factory<_i128.ActionLinkUsecase>(
      () => _i128.ActionLinkUsecase(gh<_i66.LinksImportantRepository>()));
  gh.factory<_i129.GetLinkUsecase>(
      () => _i129.GetLinkUsecase(gh<_i66.LinksImportantRepository>()));
  gh.factory<_i130.AddCommentUsecase>(
      () => _i130.AddCommentUsecase(gh<_i78.CompanyRepository>()));
  gh.factory<_i131.GetCommentUsecase>(
      () => _i131.GetCommentUsecase(gh<_i78.CompanyRepository>()));
  gh.factory<_i132.LoginCubit>(() => _i132.LoginCubit(
        gh<_i100.LoginUsecase>(),
        gh<_i102.VerifyOtpUsecase>(),
        gh<_i98.CacheTokenUsecase>(),
        gh<_i99.GetTokenUsecase>(),
        gh<_i101.ValidateTokenUsecase>(),
      ));
  gh.factory<_i133.LinkCubit>(() => _i133.LinkCubit(
        gh<_i129.GetLinkUsecase>(),
        gh<_i128.ActionLinkUsecase>(),
      ));
  gh.factory<_i134.AgentsDistributorsProfileBloc>(
      () => _i134.AgentsDistributorsProfileBloc(
            gh<_i121.GetAgentClientListUsecase>(),
            gh<_i120.GetAgentUsecase>(),
            gh<_i124.GetAgentInvoiceListUsecase>(),
            gh<_i44.GetInvoiceByIdUsecase>(),
            gh<_i122.GetAgentCommentsListUsecase>(),
            gh<_i118.AddAgentCommentUsecase>(),
            gh<_i119.DoneTrainingUsecase>(),
            gh<_i103.AddAgentDateUseCase>(),
            gh<_i123.GetAgentDatesListUsecase>(),
          ));
  gh.factory<_i135.GetCommunicationListUsecase>(() =>
      _i135.GetCommunicationListUsecase(
          gh<_i109.CommunicationListRepository>()));
  gh.factory<_i136.AddLevelUsecase>(
      () => _i136.AddLevelUsecase(gh<_i105.PrivilegeRepository>()));
  gh.factory<_i137.GetLevelsUsecase>(
      () => _i137.GetLevelsUsecase(gh<_i105.PrivilegeRepository>()));
  gh.factory<_i138.GetPrivilegesUsecase>(
      () => _i138.GetPrivilegesUsecase(gh<_i105.PrivilegeRepository>()));
  gh.factory<_i139.UpdatePrivilegeUsecase>(
      () => _i139.UpdatePrivilegeUsecase(gh<_i105.PrivilegeRepository>()));
  gh.factory<_i140.AgentsDistributorsCubit>(() => _i140.AgentsDistributorsCubit(
      gh<_i104.GetAgentsAndDistributorsUseCase>()));
  gh.factory<_i141.CompanyCubit>(() => _i141.CompanyCubit(
        gh<_i131.GetCommentUsecase>(),
        gh<_i130.AddCommentUsecase>(),
      ));
  gh.singleton<_i142.AppManagerCubit>(
      () => _i142.AppManagerCubit(gh<_i125.GetVersionUseCase>()));
  gh.lazySingleton<_i143.ManageWithdrawalsCubit>(
      () => _i143.ManageWithdrawalsCubit(
            gh<_i74.GetUserSeriesUsecase>(),
            gh<_i77.UpdateSeriesUsecase>(),
            gh<_i108.GetAllUsersUsecase>(),
            gh<_i97.GetWithdrawalsInvoicesUsecase>(),
            gh<_i95.GetWithdrawalInvoiceDetailsUsecase>(),
            gh<_i76.SetApproveSeriesUsecase>(),
            gh<_i75.GetWithdrawnDetailsUsecase>(),
            gh<_i71.AddRejectReasonsUsecase>(),
            gh<_i73.GetRejectReasonsUsecase>(),
            gh<_i72.EditRejectReasonsUsecase>(),
            gh<_i96.GetFilteredWithdrawalsInvoicesUsecase>(),
          ));
  gh.factory<_i144.AttachmentsRowCubit>(() => _i144.AttachmentsRowCubit(
        gh<_i116.GetClientSupportFilesUsecase>(),
        gh<_i115.CrudClientSupportFilesUsecase>(),
      ));
  gh.factory<_i145.CommunicationListBloc>(() =>
      _i145.CommunicationListBloc(gh<_i135.GetCommunicationListUsecase>()));
  gh.factory<_i146.ClientsListBloc>(() => _i146.ClientsListBloc(
        gh<_i91.GetClientsWithFilterUserUsecase>(),
        gh<_i92.GetRecommendedClientsUsecase>(),
        gh<_i84.AddClientUserUsecase>(),
        gh<_i87.EditClientUserUsecase>(),
        gh<_i86.ChangeTypeClientUsecase>(),
        gh<_i93.GetSimilarClientsUsecase>(),
        gh<_i85.ApproveRejectClientUsecase>(),
        gh<_i115.CrudClientSupportFilesUsecase>(),
        gh<_i116.GetClientSupportFilesUsecase>(),
        gh<_i94.TransferClientUserUsecase>(),
      ));
  gh.lazySingleton<_i147.PrivilegeCubit>(() => _i147.PrivilegeCubit(
        gh<_i137.GetLevelsUsecase>(),
        gh<_i138.GetPrivilegesUsecase>(),
        gh<_i139.UpdatePrivilegeUsecase>(),
        gh<_i136.AddLevelUsecase>(),
      ));
  return getIt;
}

class _$AppModule extends _i148.AppModule {}
