import 'dart:async';

import 'package:crm_smart/api/dio_services.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/data/repositories/agents_distributors_profile_repo_impl.dart';
import 'package:crm_smart/features/manage_agents_and_distributors/domain/use_cases/get_agent_client_list_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api.dart';
import '../../common/constants/route.dart';
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_actions_data_source.dart';
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_data_source.dart';
import '../../features/manage_agents_and_distributors/data/data_sources/remote_data_source/agents_distributors_profile_data_source.dart';
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_actions_repo_impl.dart';
import '../../features/manage_agents_and_distributors/data/repositories/agents_distributors_repo_impl.dart';
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_actions_repo.dart';
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_profile_repo.dart';
import '../../features/manage_agents_and_distributors/domain/repositories/agents_distributors_repo.dart';
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_comments_list_usecase.dart';
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agent_invoice_list_usecase.dart';
import '../../features/manage_agents_and_distributors/domain/use_cases/get_agents_and_distributors_usecase.dart';
import '../../features/manage_agents_and_distributors/domain/use_cases/get_all_cities_usecase.dart';
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_actions_cubit/agents_distributors_actions_cubit.dart';
import '../../features/manage_agents_and_distributors/presentation/manager/agents_distributors_profile_bloc/agents_distributors_profile_bloc.dart';
import '../../features/manage_agents_and_distributors/presentation/manager/manage_agents_and_distributors_cubit/agents_distributors_cubit.dart';
import '../api/log_interceptor.dart';
import 'di_container.config.dart';

final GetIt sl = GetIt.instance;

void setupDependencies() {
  // services
  sl.registerLazySingleton<Api>(() => Api());
  sl.registerLazySingleton<DioServices>(() => DioServices());

  // data sources
  sl.registerLazySingleton<AgentsDistributorsDataSource>(
    () => AgentsDistributorsDataSourceImpl(),
  );
  sl.registerLazySingleton<AgentsDistributorsActionsDataSource>(
    () => AgentsDistributorsActionsDataSourceImpl(sl()),
  );
  sl.registerLazySingleton<AgentsDistributorsProfileDataSource>(
    () => AgentsDistributorsProfileDataSourceImpl(sl()),
  );

  // repositories
  sl.registerLazySingleton<AgentsDistributorsRepo>(
    () => AgentsDistributorsRepoImpl(sl()),
  );
  sl.registerLazySingleton<AgentsDistributorsActionsRepo>(
    () => AgentsDistributorsActionsRepoImpl(sl()),
  );
  sl.registerLazySingleton<AgentsDistributorsProfileRepo>(
    () => AgentsDistributorsProfileRepoImpl(sl()),
  );

  // use cases
  sl.registerLazySingleton<GetAgentsAndDistributorsUseCase>(
    () => GetAgentsAndDistributorsUseCase(sl()),
  );
  sl.registerLazySingleton<GetAllCitiesUseCase>(
    () => GetAllCitiesUseCase(sl()),
  );
  sl.registerLazySingleton<GetAgentClientListUsecase>(
    () => GetAgentClientListUsecase(sl()),
  );
  sl.registerLazySingleton<GetAgentInvoiceListUsecase>(
    () => GetAgentInvoiceListUsecase(sl()),
  );
  sl.registerLazySingleton<GetAgentCommentsListUsecase>(
    () => GetAgentCommentsListUsecase(sl()),
  );

  // cubits and blocs
  sl.registerFactory<AgentsDistributorsCubit>(
    () => AgentsDistributorsCubit(sl()),
  );

  sl.registerFactory<AgentsDistributorsActionsCubit>(
    () => AgentsDistributorsActionsCubit(sl()),
  );

  sl.registerFactory<AgentsDistributorsProfileBloc>(
    () => AgentsDistributorsProfileBloc(
      sl(),
      sl(),
      sl(),
      sl(),
    ),
  );
}

final GetIt _getIt = GetIt.I;

@InjectableInit(
  initializerName: r'$initGetIt',
  preferRelativeImports: true,
  asExtension: false,
  // ignoreUnregisteredTypes: [ClientApi],
  // ignoreUnregisteredTypesInPackages:['ClientApi'],
)
Future<GetIt> configureDependencies() async => $initGetIt(_getIt);

@module
abstract class AppModule {
  BaseOptions get dioOption => BaseOptions(
        baseUrl: EndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
        // headers: <String, String>{
        //   //HttpHeaders.acceptHeader: 'application/json',
        //   // 'Authorization': 'Bearer $token'
        // },
      );

  @singleton
  Logger get logger => Logger();

  @lazySingleton
  Dio dio(BaseOptions option, Logger logger) {
    final dio = Dio(option);
    dio.interceptors.addAll([
      LoggerInterceptor(),
    ]);
    return dio;
  }

  @preResolve
  @singleton
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
