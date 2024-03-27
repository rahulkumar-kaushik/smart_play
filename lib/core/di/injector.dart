import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:just_play/features/cashout/data/datasources/user_datasource.dart';
import 'package:just_play/features/cashout/data/repositoryImpl/userlist_repo_impl.dart';
import 'package:just_play/features/cashout/domain/repositories/user_repository.dart';
import 'package:just_play/features/cashout/domain/usecases/get_user_list_usecase.dart';
import 'package:just_play/features/cashout/presentation/bloc/userlist_bloc.dart';
import 'package:just_play/features/home/presentation/bloc/home_bloc.dart';

import '../../features/cashout/data/datasources/category_datasource.dart';
import '../../features/cashout/data/repositoryImpl/category_repository_impl.dart';
import '../../features/cashout/domain/repositories/category_repository.dart';
import '../../features/cashout/domain/usecases/get_category_list_usecase.dart';
import '../../features/cashout/presentation/bloc/categories_bloc.dart';
import '../errors/failures.dart';
import '../network/network_info.dart';
import '../network/network_service.dart';

final sl = GetIt.instance;

void init() {
  // ================================================================
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton(() => NetworkService(sl()));
  sl.registerLazySingleton(() => Connectivity());

  // Errors
  sl.registerLazySingleton<Failure>(
    () => ServerFailure(),
    instanceName: 'server',
  );
  sl.registerLazySingleton<Failure>(
    () => CacheFailure(),
    instanceName: 'cache',
  );

  // ================================================================
  // Features - Categories

  // Datasources
  sl.registerLazySingleton(() => CategoryDatasource(sl()));
  // Usecases
  sl.registerLazySingleton(() => GetCategoryListUseCase(sl()));
  // Repository
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl(sl()));

  // Bloc
  sl.registerFactory(
    () => CategoriesBloc(getCategoryListUseCase: sl()),
  );

  // ================================================================
  // Features - Users

  // DataSources
  sl.registerLazySingleton(() => UserDataSource(sl()));
  // Use cases
  sl.registerLazySingleton(() => GetUserListUseCase(sl()));
  // Repository
  sl.registerSingleton<UserListRepository>(UserListRepositoryImpl(sl()));

  // Bloc
  sl.registerFactory(() => UserListBloc(getUserListUseCase: sl()));

  // ================================================================
  // Features - Lpa Data

  sl.registerFactory(() => HomeBloc(getUserListUseCase: sl()));
}
